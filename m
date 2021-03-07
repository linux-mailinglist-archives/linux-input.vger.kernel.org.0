Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCFC330360
	for <lists+linux-input@lfdr.de>; Sun,  7 Mar 2021 18:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhCGRf2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Mar 2021 12:35:28 -0500
Received: from aposti.net ([89.234.176.197]:44168 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229805AbhCGRfB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Mar 2021 12:35:01 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 3/3] input: gpio-keys: Use hrtimer for software debounce
Date:   Sun,  7 Mar 2021 17:34:36 +0000
Message-Id: <20210307173436.78730-3-paul@crapouillou.net>
In-Reply-To: <20210307173436.78730-1-paul@crapouillou.net>
References: <20210307173436.78730-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We want to be able to report the input event as soon as the debounce
delay elapsed. However, the current code does not really ensure that,
as it uses the jiffies-based schedule_delayed_work() API. With a small
enough HZ value (HZ <= 100), this results in some input events being
lost, when a key is quickly pressed then released (on a human's time
scale).

Switching to hrtimers fixes this issue, and will work even on extremely
low HZ values (tested at HZ=24).

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: HRTIMER_MODE_REL_SOFT -> HRTIMER_MODE_REL

 drivers/input/keyboard/gpio_keys.c | 33 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 4b92f49decef..566e7950fcef 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -22,7 +22,6 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
-#include <linux/workqueue.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
@@ -40,7 +39,7 @@ struct gpio_button_data {
 	struct hrtimer release_timer;
 	unsigned int release_delay;	/* in msecs, for IRQ-only buttons */
 
-	struct delayed_work work;
+	struct hrtimer debounce_timer;
 	unsigned int software_debounce;	/* in msecs, for GPIO-driven buttons */
 
 	unsigned int irq;
@@ -145,7 +144,7 @@ static void gpio_keys_disable_button(struct gpio_button_data *bdata)
 		disable_irq(bdata->irq);
 
 		if (bdata->gpiod)
-			cancel_delayed_work_sync(&bdata->work);
+			hrtimer_cancel(&bdata->debounce_timer);
 		else
 			hrtimer_cancel(&bdata->release_timer);
 
@@ -376,16 +375,19 @@ static void gpio_keys_gpio_report_event(struct gpio_button_data *bdata)
 	}
 }
 
-static void gpio_keys_gpio_work_func(struct work_struct *work)
+static enum hrtimer_restart gpio_keys_debounce_timer(struct hrtimer *t)
 {
-	struct gpio_button_data *bdata =
-		container_of(work, struct gpio_button_data, work.work);
+	struct gpio_button_data *bdata = container_of(t,
+						      struct gpio_button_data,
+						      debounce_timer);
 
 	gpio_keys_gpio_report_event(bdata);
 	input_sync(bdata->input);
 
 	if (bdata->button->wakeup)
 		pm_relax(bdata->input->dev.parent);
+
+	return HRTIMER_NORESTART;
 }
 
 static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
@@ -409,9 +411,9 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
 		}
 	}
 
-	mod_delayed_work(system_wq,
-			 &bdata->work,
-			 msecs_to_jiffies(bdata->software_debounce));
+	hrtimer_start(&bdata->debounce_timer,
+		      ms_to_ktime(bdata->software_debounce),
+		      HRTIMER_MODE_REL);
 
 	return IRQ_HANDLED;
 }
@@ -472,7 +474,7 @@ static void gpio_keys_quiesce_key(void *data)
 	struct gpio_button_data *bdata = data;
 
 	if (bdata->gpiod)
-		cancel_delayed_work_sync(&bdata->work);
+		hrtimer_cancel(&bdata->debounce_timer);
 	else
 		hrtimer_cancel(&bdata->release_timer);
 }
@@ -562,11 +564,13 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			bdata->irq = irq;
 		}
 
-		INIT_DELAYED_WORK(&bdata->work, gpio_keys_gpio_work_func);
-
 		isr = gpio_keys_gpio_isr;
 		irqflags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
 
+		hrtimer_init(&bdata->debounce_timer,
+			     CLOCK_REALTIME, HRTIMER_MODE_REL);
+		bdata->debounce_timer.function = gpio_keys_debounce_timer;
+
 		switch (button->wakeup_event_action) {
 		case EV_ACT_ASSERTED:
 			bdata->wakeup_trigger_type = active_low ?
@@ -615,10 +619,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 	*bdata->code = button->code;
 	input_set_capability(input, button->type ?: EV_KEY, *bdata->code);
 
-	/*
-	 * Install custom action to cancel release timer and
-	 * workqueue item.
-	 */
+	/* Install custom action to cancel timers. */
 	error = devm_add_action(dev, gpio_keys_quiesce_key, bdata);
 	if (error) {
 		dev_err(dev, "failed to register quiesce action, error: %d\n",
-- 
2.30.1


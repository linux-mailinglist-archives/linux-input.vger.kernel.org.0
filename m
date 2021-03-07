Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4173304F6
	for <lists+linux-input@lfdr.de>; Sun,  7 Mar 2021 23:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbhCGWX1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Mar 2021 17:23:27 -0500
Received: from aposti.net ([89.234.176.197]:34054 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231405AbhCGWXD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Mar 2021 17:23:03 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 3/3] input: gpio-keys: Use hrtimer for software debounce, if possible
Date:   Sun,  7 Mar 2021 22:22:40 +0000
Message-Id: <20210307222240.380583-3-paul@crapouillou.net>
In-Reply-To: <20210307222240.380583-1-paul@crapouillou.net>
References: <20210307222240.380583-1-paul@crapouillou.net>
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
low HZ values (tested at HZ=24). This is however only possible if
reading the GPIO is possible without sleeping. If this condition is not
met, the previous approach of using a jiffies-based timer is taken.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: HRTIMER_MODE_REL_SOFT -> HRTIMER_MODE_REL
    
    v3: Only use a hrtimer-based timer if we know that reading the GPIO
        will never sleep.

 drivers/input/keyboard/gpio_keys.c | 69 ++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 4b92f49decef..046d9dffa171 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -41,6 +41,7 @@ struct gpio_button_data {
 	unsigned int release_delay;	/* in msecs, for IRQ-only buttons */
 
 	struct delayed_work work;
+	struct hrtimer debounce_timer;
 	unsigned int software_debounce;	/* in msecs, for GPIO-driven buttons */
 
 	unsigned int irq;
@@ -49,6 +50,7 @@ struct gpio_button_data {
 	bool disabled;
 	bool key_pressed;
 	bool suspended;
+	bool debounce_use_hrtimer;
 };
 
 struct gpio_keys_drvdata {
@@ -144,10 +146,12 @@ static void gpio_keys_disable_button(struct gpio_button_data *bdata)
 		 */
 		disable_irq(bdata->irq);
 
-		if (bdata->gpiod)
-			cancel_delayed_work_sync(&bdata->work);
-		else
+		if (!bdata->gpiod)
 			hrtimer_cancel(&bdata->release_timer);
+		else if (bdata->debounce_use_hrtimer)
+			hrtimer_cancel(&bdata->debounce_timer);
+		else
+			cancel_delayed_work_sync(&bdata->work);
 
 		bdata->disabled = true;
 	}
@@ -361,7 +365,10 @@ static void gpio_keys_gpio_report_event(struct gpio_button_data *bdata)
 	unsigned int type = button->type ?: EV_KEY;
 	int state;
 
-	state = gpiod_get_value_cansleep(bdata->gpiod);
+	if (bdata->debounce_use_hrtimer)
+		state = gpiod_get_value(bdata->gpiod);
+	else
+		state = gpiod_get_value_cansleep(bdata->gpiod);
 	if (state < 0) {
 		dev_err(input->dev.parent,
 			"failed to get gpio state: %d\n", state);
@@ -376,11 +383,8 @@ static void gpio_keys_gpio_report_event(struct gpio_button_data *bdata)
 	}
 }
 
-static void gpio_keys_gpio_work_func(struct work_struct *work)
+static void gpio_keys_debounce_event(struct gpio_button_data *bdata)
 {
-	struct gpio_button_data *bdata =
-		container_of(work, struct gpio_button_data, work.work);
-
 	gpio_keys_gpio_report_event(bdata);
 	input_sync(bdata->input);
 
@@ -388,6 +392,26 @@ static void gpio_keys_gpio_work_func(struct work_struct *work)
 		pm_relax(bdata->input->dev.parent);
 }
 
+static void gpio_keys_gpio_work_func(struct work_struct *work)
+{
+	struct gpio_button_data *bdata = container_of(work,
+						      struct gpio_button_data,
+						      work.work);
+
+	gpio_keys_debounce_event(bdata);
+}
+
+static enum hrtimer_restart gpio_keys_debounce_timer(struct hrtimer *t)
+{
+	struct gpio_button_data *bdata = container_of(t,
+						      struct gpio_button_data,
+						      debounce_timer);
+
+	gpio_keys_debounce_event(bdata);
+
+	return HRTIMER_NORESTART;
+}
+
 static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
 {
 	struct gpio_button_data *bdata = dev_id;
@@ -409,9 +433,15 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
 		}
 	}
 
-	mod_delayed_work(system_wq,
-			 &bdata->work,
-			 msecs_to_jiffies(bdata->software_debounce));
+	if (bdata->debounce_use_hrtimer) {
+		hrtimer_start(&bdata->debounce_timer,
+			      ms_to_ktime(bdata->software_debounce),
+			      HRTIMER_MODE_REL);
+	} else {
+		mod_delayed_work(system_wq,
+				 &bdata->work,
+				 msecs_to_jiffies(bdata->software_debounce));
+	}
 
 	return IRQ_HANDLED;
 }
@@ -471,10 +501,12 @@ static void gpio_keys_quiesce_key(void *data)
 {
 	struct gpio_button_data *bdata = data;
 
-	if (bdata->gpiod)
+	if (bdata->gpiod) {
+		hrtimer_cancel(&bdata->debounce_timer);
 		cancel_delayed_work_sync(&bdata->work);
-	else
+	} else {
 		hrtimer_cancel(&bdata->release_timer);
+	}
 }
 
 static int gpio_keys_setup_key(struct platform_device *pdev,
@@ -546,6 +578,13 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			if (error < 0)
 				bdata->software_debounce =
 						button->debounce_interval;
+
+			/*
+			 * If reading the GPIO won't sleep, we can use a hrtimer
+			 * instead of a standard timer for the software
+			 * debounce, to reduce the latency as much as possible.
+			 */
+			bdata->debounce_use_hrtimer = !gpiod_cansleep(bdata->gpiod);
 		}
 
 		if (button->irq) {
@@ -564,6 +603,10 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 
 		INIT_DELAYED_WORK(&bdata->work, gpio_keys_gpio_work_func);
 
+		hrtimer_init(&bdata->debounce_timer,
+			     CLOCK_REALTIME, HRTIMER_MODE_REL);
+		bdata->debounce_timer.function = gpio_keys_debounce_timer;
+
 		isr = gpio_keys_gpio_isr;
 		irqflags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
 
-- 
2.30.1


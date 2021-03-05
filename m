Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3498132F088
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 18:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhCERB5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 12:01:57 -0500
Received: from aposti.net ([89.234.176.197]:60868 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230259AbhCERBk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Mar 2021 12:01:40 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] input: gpio-keys: Use hrtimer for release timer
Date:   Fri,  5 Mar 2021 17:01:10 +0000
Message-Id: <20210305170111.214782-2-paul@crapouillou.net>
In-Reply-To: <20210305170111.214782-1-paul@crapouillou.net>
References: <20210305170111.214782-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dealing with input, timing is important; if the button should be
released in one millisecond, then it should be done in one millisecond
and not a hundred milliseconds.

Therefore, the standard timer API is not really suitable for this task.

Convert the gpio-keys driver to use a hrtimer instead of the standard
timer to address this issue.

Note that by using a hard IRQ for the hrtimer callback, we can get rid
of the spin_lock_irqsave() and spin_unlock_irqrestore().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/input/keyboard/gpio_keys.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 0be204693ab0..1ab112267aa8 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 
+#include <linux/hrtimer.h>
 #include <linux/init.h>
 #include <linux/fs.h>
 #include <linux/interrupt.h>
@@ -36,7 +37,7 @@ struct gpio_button_data {
 
 	unsigned short *code;
 
-	struct timer_list release_timer;
+	struct hrtimer release_timer;
 	unsigned int release_delay;	/* in msecs, for IRQ-only buttons */
 
 	struct delayed_work work;
@@ -146,7 +147,7 @@ static void gpio_keys_disable_button(struct gpio_button_data *bdata)
 		if (bdata->gpiod)
 			cancel_delayed_work_sync(&bdata->work);
 		else
-			del_timer_sync(&bdata->release_timer);
+			hrtimer_cancel(&bdata->release_timer);
 
 		bdata->disabled = true;
 	}
@@ -415,19 +416,20 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void gpio_keys_irq_timer(struct timer_list *t)
+static enum hrtimer_restart gpio_keys_irq_timer(struct hrtimer *t)
 {
-	struct gpio_button_data *bdata = from_timer(bdata, t, release_timer);
+	struct gpio_button_data *bdata = container_of(t,
+						      struct gpio_button_data,
+						      release_timer);
 	struct input_dev *input = bdata->input;
-	unsigned long flags;
 
-	spin_lock_irqsave(&bdata->lock, flags);
 	if (bdata->key_pressed) {
 		input_event(input, EV_KEY, *bdata->code, 0);
 		input_sync(input);
 		bdata->key_pressed = false;
 	}
-	spin_unlock_irqrestore(&bdata->lock, flags);
+
+	return HRTIMER_NORESTART;
 }
 
 static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
@@ -457,8 +459,9 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
 	}
 
 	if (bdata->release_delay)
-		mod_timer(&bdata->release_timer,
-			jiffies + msecs_to_jiffies(bdata->release_delay));
+		hrtimer_start(&bdata->release_timer,
+			      ms_to_ktime(bdata->release_delay),
+			      HRTIMER_MODE_REL_HARD);
 out:
 	spin_unlock_irqrestore(&bdata->lock, flags);
 	return IRQ_HANDLED;
@@ -471,7 +474,7 @@ static void gpio_keys_quiesce_key(void *data)
 	if (bdata->gpiod)
 		cancel_delayed_work_sync(&bdata->work);
 	else
-		del_timer_sync(&bdata->release_timer);
+		hrtimer_cancel(&bdata->release_timer);
 }
 
 static int gpio_keys_setup_key(struct platform_device *pdev,
@@ -595,7 +598,9 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 		}
 
 		bdata->release_delay = button->debounce_interval;
-		timer_setup(&bdata->release_timer, gpio_keys_irq_timer, 0);
+		hrtimer_init(&bdata->release_timer,
+			     CLOCK_REALTIME, HRTIMER_MODE_REL_HARD);
+		bdata->release_timer.function = gpio_keys_irq_timer;
 
 		isr = gpio_keys_irq_isr;
 		irqflags = 0;
-- 
2.30.1


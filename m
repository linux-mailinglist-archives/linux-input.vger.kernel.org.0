Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B30356309
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 07:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348686AbhDGF3G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 01:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348668AbhDGF3F (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 01:29:05 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BF8C06174A;
        Tue,  6 Apr 2021 22:28:56 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id j7so4068387plx.2;
        Tue, 06 Apr 2021 22:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=oGiS6IxE+PQXupx8pRFmNjoBriuNOqtLio3d69XQRCo=;
        b=DhLXOu6hnzXGjh/myORg2ehHBWicwYbMTQMQ/awODHxYxcvjpP0jZhMO4smYR5VExD
         QZ9p3QICAXv0Cfxk/RAF1h1tqg6kgpw1lKhM1jHKkL7ZFjdxjdoqcy0a/Bv3UEXiwcrH
         1FcbOwyD9+vmtBseTU8nmdg95kL3ITm2+Cwv6KVVthlw66B2Q31e2YJFsJwWuHZrDJcc
         LMtg+WaV8Avp2QbuA3pcJ6dDc787gO5oyvlLTOgUhZa4M43dU9FXL6FeYKxuTXOaobgn
         hQRz1jDpAVgZKs9SQPEO7dtFCdJkJbdluFqOBjmywTEm8uPWtJHVkbJGnsn64JPhTNKv
         Z7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=oGiS6IxE+PQXupx8pRFmNjoBriuNOqtLio3d69XQRCo=;
        b=oJ118y3FDPv7YOIhZsxGY0AvNymcm/r393FFDBs3qcDzogFnqRtSul/jOFzvfLkTmv
         3fA2/t7YcRt37xomzKhgHJ4Dr1gduXSzd+h6J6LCN/Jiceoy8x9QclUUfLiCJUGLUUV+
         RceAGxPTtH5CAo6aydV08KOBS5G4tyy2M7FNLmLyF2NZzvztCrBkMs3+prurRNAbXDK3
         MyV3X1DnyQE3TRse9nobnHB1Wjf+V8YXja8SnfkS48MQ9M+Dl8LZVWzEEkd1fypOgq0U
         OeC6VSpzt2ifwM0ViVwegkPT83G94V6/BFlQ+rwjM8DU4PMLcw3F0AJq8zm7znc6pV1E
         qMBA==
X-Gm-Message-State: AOAM531OmRqvGKK/JH47bOXVLQZuq+j1lsVXZrvNFuGbqyjfoJBdA6ZX
        EPJYEWQgdUaEBYaCtwhvCbk=
X-Google-Smtp-Source: ABdhPJzt+/+yjMs1Qw7FD/m4zCD8DCPWo4yuePZixQCHOZ9Xwh9lSeGF2iak1yByXX899yw5A2lGSA==
X-Received: by 2002:a17:902:44a:b029:e8:eb05:d0a0 with SMTP id 68-20020a170902044ab02900e8eb05d0a0mr1630169ple.50.1617773335923;
        Tue, 06 Apr 2021 22:28:55 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6c0c:9cca:cff7:99cd])
        by smtp.gmail.com with ESMTPSA id e13sm19677934pfi.199.2021.04.06.22.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 22:28:54 -0700 (PDT)
Date:   Tue, 6 Apr 2021 22:28:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: gpio-keys - fix crash when disabliing GPIO-less
 buttons
Message-ID: <YG1DFFgojSVfdpaz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

My brain-damaged adjustments to Paul's patch caused crashes in
gpio_keys_disable_button() when driver is used in GPIO-less (i.e.
purely interrupt-driven) setups, because I mixed together debounce and
release timers when they are in fact separate:

Unable to handle kernel NULL pointer dereference at virtual address 0000000c
...
PC is at hrtimer_active+0xc/0x98
LR is at hrtimer_try_to_cancel+0x24/0x140
...
[<c01c43b8>] (hrtimer_active) from [<c01c50f4>] (hrtimer_try_to_cancel+0x24/0x140)
[<c01c50f4>] (hrtimer_try_to_cancel) from [<c01c5224>] (hrtimer_cancel+0x14/0x4c)
[<c01c5224>] (hrtimer_cancel) from [<bf1cae24>] (gpio_keys_attr_store_helper+0x1b8/0x1d8 [gpio_keys])
[<bf1cae24>] (gpio_keys_attr_store_helper [gpio_keys]) from [<bf1cae80>] (gpio_keys_store_disabled_keys+0x18/0x24 [gpio_keys])
[<bf1cae80>] (gpio_keys_store_disabled_keys [gpio_keys]) from [<c038ec7c>] (kernfs_fop_write_iter+0x10c/0x1cc)
[<c038ec7c>] (kernfs_fop_write_iter) from [<c02df858>] (vfs_write+0x2ac/0x404)
[<c02df858>] (vfs_write) from [<c02dfaf4>] (ksys_write+0x64/0xdc)
[<c02dfaf4>] (ksys_write) from [<c0100080>] (ret_fast_syscall+0x0/0x58)

Let's fix it up.

Fixes: c9efb0ba281e ("Input: gpio-keys - use hrtimer for software debounce, if possible")
Reported-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Tony, could you please try this patch and see if it fixes the crash you
observed?

Thanks!

 drivers/input/keyboard/gpio_keys.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index fe8fc76ee22e..8dbf1e69c90a 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -125,6 +125,18 @@ static const unsigned long *get_bm_events_by_type(struct input_dev *dev,
 	return (type == EV_KEY) ? dev->keybit : dev->swbit;
 }
 
+static void gpio_keys_quiesce_key(void *data)
+{
+	struct gpio_button_data *bdata = data;
+
+	if (!bdata->gpiod)
+		hrtimer_cancel(&bdata->release_timer);
+	if (bdata->debounce_use_hrtimer)
+		hrtimer_cancel(&bdata->debounce_timer);
+	else
+		cancel_delayed_work_sync(&bdata->work);
+}
+
 /**
  * gpio_keys_disable_button() - disables given GPIO button
  * @bdata: button data for button to be disabled
@@ -145,12 +157,7 @@ static void gpio_keys_disable_button(struct gpio_button_data *bdata)
 		 * Disable IRQ and associated timer/work structure.
 		 */
 		disable_irq(bdata->irq);
-
-		if (bdata->debounce_use_hrtimer)
-			hrtimer_cancel(&bdata->release_timer);
-		else
-			cancel_delayed_work_sync(&bdata->work);
-
+		gpio_keys_quiesce_key(bdata);
 		bdata->disabled = true;
 	}
 }
@@ -492,16 +499,6 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void gpio_keys_quiesce_key(void *data)
-{
-	struct gpio_button_data *bdata = data;
-
-	if (bdata->debounce_use_hrtimer)
-		hrtimer_cancel(&bdata->debounce_timer);
-	else
-		cancel_delayed_work_sync(&bdata->work);
-}
-
 static int gpio_keys_setup_key(struct platform_device *pdev,
 				struct input_dev *input,
 				struct gpio_keys_drvdata *ddata,
@@ -635,7 +632,6 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 		}
 
 		bdata->release_delay = button->debounce_interval;
-		bdata->debounce_use_hrtimer = true;
 		hrtimer_init(&bdata->release_timer,
 			     CLOCK_REALTIME, HRTIMER_MODE_REL_HARD);
 		bdata->release_timer.function = gpio_keys_irq_timer;
-- 
2.31.0.208.g409f899ff0-goog


-- 
Dmitry

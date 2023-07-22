Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC3675DBB5
	for <lists+linux-input@lfdr.de>; Sat, 22 Jul 2023 12:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjGVKZP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Jul 2023 06:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGVKZO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Jul 2023 06:25:14 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D862B26A2
        for <linux-input@vger.kernel.org>; Sat, 22 Jul 2023 03:25:12 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3159adb7cb5so439887f8f.0
        for <linux-input@vger.kernel.org>; Sat, 22 Jul 2023 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690021511; x=1690626311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUXciRKKUYAx/acfbyT5B/sFT/jCDVltQ28fDCxt+EQ=;
        b=Fk/Rm7QC4kKOItbsBP+jQD3XXdUx09EKTD4L3NLLijXN2XLG/3bpPFb7MI58/6l/4Z
         +uv3AX5cUi/veX+R5WB3j90cxjtce0Kz1IYyCDFCa3YnaiA3HxxaDv806t6u/4hhpFQL
         rR9CtK6Na1+EgUBvlGFUr5hobuhGs6wNNDq+ZAgkJ+KAwLfPEw2YpEa+S8nHd5k8U0/Z
         mq3axnqqAV+qxjkUG4PMcmPyby+dXdwbDzCq22wpiK9TDnhlH5WxKOAR8crck3hy+Rgi
         bdilSxHuXvZq1Z5rBDsQj5Qv9/eEhlJgttvbRn1AZhJU9r2+AKklL42JTc7Sv8ydoJ+r
         nE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690021511; x=1690626311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUXciRKKUYAx/acfbyT5B/sFT/jCDVltQ28fDCxt+EQ=;
        b=SSfDtAOZW2AXRFd3J4XECi8elNHq+kKl9p5W2QW+gVAbDfQNarHmWNCcoLus4FTnqP
         8GVVxd+Tf59u1qkOK88NkSOXAeHGHw3c0ChLurXBAlmUK6D2AdFZ2YXPo1GvoujsD8ET
         vWkus+gJ3ZHnIay85YA3gI1C/1Wmr8oQxXWN27XcUa8z/T30Rr8l09QImRK3BJ6ZA7wp
         2+65QGicEyN7sJSHPHdzO9gECYLrWIXjjG6kHmzT8aVMVzblT/XT81SV82fndl67PPvN
         Lrt22d1Qd9V7PDMCAsTSwKofB9TYkaPf9+IKQ4RFCrhdcYQLPHeR/Hufco3JSVXuDdse
         h7wQ==
X-Gm-Message-State: ABy/qLZ2UnXxahL/mpNyS5b0rmcRU1K/OYRADPUjGDPYk4jbV3Z0yB6Z
        JZsquyWde7hf4sSI72TwztBhkl3ASuyAcF6C
X-Google-Smtp-Source: APBJJlFOW5IqlVKeJLJqchOZV+Tz4lOrOj1ZWlmFpLhcrqVe5VI+FoXzlVI4qLmsicLS9CB4Etqegg==
X-Received: by 2002:a05:600c:3b05:b0:3f9:88d:9518 with SMTP id m5-20020a05600c3b0500b003f9088d9518mr3889811wms.0.1690021511041;
        Sat, 22 Jul 2023 03:25:11 -0700 (PDT)
Received: from desktop-nixos-martino.. ([2a01:e11:5004:180:5f82:5077:7280:29dc])
        by smtp.gmail.com with ESMTPSA id l5-20020a1ced05000000b003fc02219081sm4983379wmh.33.2023.07.22.03.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 03:25:10 -0700 (PDT)
From:   Martino Fontana <tinozzo123@gmail.com>
To:     s.jegen@gmail.com
Cc:     linux-input@vger.kernel.org, tinozzo123@gmail.com
Subject: [PATCH v2] HID: nintendo: cleanup LED code
Date:   Sat, 22 Jul 2023 12:24:52 +0200
Message-ID: <20230722102451.14858-2-tinozzo123@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <209M4JB8WJRSY.2XPCG39LL8DLJ@homearch.localdomain>
References: <209M4JB8WJRSY.2XPCG39LL8DLJ@homearch.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

- Only turn on the nth LED, instead of all the LEDs up to n. This better
  matches Nintendo consoles' behaviour, as they never turn on more than
  one LED.
  (Note that the behavior still consinsts in increasing the player number
  every time a controller is connected, never decreasing it. It should be
  as is described in https://bugzilla.kernel.org/show_bug.cgi?id=216225.
  However, any implementation here would stop making sense as soon as a
  non-Nintendo controller is connected, which is why I'm not bothering.)

- Split part of `joycon_home_led_brightness_set` (which is called by hid)
  into `joycon_set_home_led` (which is what actually sets the LEDs), for
  consistency with player LEDs.

- `joycon_player_led_brightness_set` won't try it to "determine which player
  led this is" anymore: it's already looking at every LED brightness value.

- Instead of first registering the `led_classdev`, then attempting to set
  the LED and unregistering the `led_classdev` if it fails, first attempt
  to set the LED, then register the `led_classdev` only if it succeeds
  (the class is still filled up in either case).

- If setting the player LEDs fails, still attempt setting the home LED.
  (I don't know there's a third party controller where this may actually
  happen, but who knows...)

- Use `JC_NUM_LEDS` where appropriate instead of 4.

- Print return codes in more places.

- Use spinlock instead of mutex for `input_num`. Copy its value to a local
  variable, so that it can be unlocked immediately.

- Less holding of mutexes in general.

Changes for v2:

Applied suggestions, commit message explains more stuff, restored `return ret`
when `devm_led_classdev_register` fails (since all other hid drivers do this).
If setting LED fails, `hid_warn` now explicitly says "skipping registration".

Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
---
 drivers/hid/hid-nintendo.c | 117 ++++++++++++++++++-------------------
 1 file changed, 57 insertions(+), 60 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index a5ebe857a..dd7c7fce3 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -699,6 +699,25 @@ static int joycon_set_player_leds(struct joycon_ctlr *ctlr, u8 flash, u8 on)
 	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
+static int joycon_set_home_led(struct joycon_ctlr *ctlr, enum led_brightness brightness)
+{
+	struct joycon_subcmd_request *req;
+	u8 buffer[sizeof(*req) + 5] = { 0 };
+	u8 *data;
+
+	req = (struct joycon_subcmd_request *)buffer;
+	req->subcmd_id = JC_SUBCMD_SET_HOME_LIGHT;
+	data = req->data;
+	data[0] = 0x01;
+	data[1] = brightness << 4;
+	data[2] = brightness | (brightness << 4);
+	data[3] = 0x11;
+	data[4] = 0x11;
+
+	hid_dbg(ctlr->hdev, "setting home led brightness\n");
+	return joycon_send_subcmd(ctlr, req, 5, HZ/4);
+}
+
 static int joycon_request_spi_flash_read(struct joycon_ctlr *ctlr,
 					 u32 start_addr, u8 size, u8 **reply)
 {
@@ -1849,7 +1868,6 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
 	int val = 0;
 	int i;
 	int ret;
-	int num;
 
 	ctlr = hid_get_drvdata(hdev);
 	if (!ctlr) {
@@ -1857,21 +1875,10 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
 		return -ENODEV;
 	}
 
-	/* determine which player led this is */
-	for (num = 0; num < JC_NUM_LEDS; num++) {
-		if (&ctlr->leds[num] == led)
-			break;
-	}
-	if (num >= JC_NUM_LEDS)
-		return -EINVAL;
+	for (i = 0; i < JC_NUM_LEDS; i++)
+		val |= ctlr->leds[i].brightness << i;
 
 	mutex_lock(&ctlr->output_mutex);
-	for (i = 0; i < JC_NUM_LEDS; i++) {
-		if (i == num)
-			val |= brightness << i;
-		else
-			val |= ctlr->leds[i].brightness << i;
-	}
 	ret = joycon_set_player_leds(ctlr, 0, val);
 	mutex_unlock(&ctlr->output_mutex);
 
@@ -1884,9 +1891,6 @@ static int joycon_home_led_brightness_set(struct led_classdev *led,
 	struct device *dev = led->dev->parent;
 	struct hid_device *hdev = to_hid_device(dev);
 	struct joycon_ctlr *ctlr;
-	struct joycon_subcmd_request *req;
-	u8 buffer[sizeof(*req) + 5] = { 0 };
-	u8 *data;
 	int ret;
 
 	ctlr = hid_get_drvdata(hdev);
@@ -1894,25 +1898,13 @@ static int joycon_home_led_brightness_set(struct led_classdev *led,
 		hid_err(hdev, "No controller data\n");
 		return -ENODEV;
 	}
-
-	req = (struct joycon_subcmd_request *)buffer;
-	req->subcmd_id = JC_SUBCMD_SET_HOME_LIGHT;
-	data = req->data;
-	data[0] = 0x01;
-	data[1] = brightness << 4;
-	data[2] = brightness | (brightness << 4);
-	data[3] = 0x11;
-	data[4] = 0x11;
-
-	hid_dbg(hdev, "setting home led brightness\n");
 	mutex_lock(&ctlr->output_mutex);
-	ret = joycon_send_subcmd(ctlr, req, 5, HZ/4);
+	ret = joycon_set_home_led(ctlr, brightness);
 	mutex_unlock(&ctlr->output_mutex);
-
 	return ret;
 }
 
-static DEFINE_MUTEX(joycon_input_num_mutex);
+static DEFINE_SPINLOCK(joycon_input_num_spinlock);
 static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
@@ -1920,17 +1912,16 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 	const char *d_name = dev_name(dev);
 	struct led_classdev *led;
 	char *name;
-	int ret = 0;
+	int ret;
 	int i;
-	static int input_num = 1;
+	unsigned long flags;
+	int player_led_number;
+	static int input_num;
 
-	/* Set the default controller player leds based on controller number */
-	mutex_lock(&joycon_input_num_mutex);
-	mutex_lock(&ctlr->output_mutex);
-	ret = joycon_set_player_leds(ctlr, 0, 0xF >> (4 - input_num));
-	if (ret)
-		hid_warn(ctlr->hdev, "Failed to set leds; ret=%d\n", ret);
-	mutex_unlock(&ctlr->output_mutex);
+	/* Set the player leds based on controller number */
+	spin_lock_irqsave(&joycon_input_num_spinlock, flags);
+	player_led_number = input_num++ % JC_NUM_LEDS;
+	spin_unlock_irqrestore(&joycon_input_num_spinlock, flags);
 
 	/* configure the player LEDs */
 	for (i = 0; i < JC_NUM_LEDS; i++) {
@@ -1938,31 +1929,34 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 				      d_name,
 				      "green",
 				      joycon_player_led_names[i]);
-		if (!name) {
-			mutex_unlock(&joycon_input_num_mutex);
+		if (!name)
 			return -ENOMEM;
-		}
 
 		led = &ctlr->leds[i];
 		led->name = name;
-		led->brightness = ((i + 1) <= input_num) ? 1 : 0;
+		led->brightness = (i == player_led_number) ? 1 : 0;
 		led->max_brightness = 1;
 		led->brightness_set_blocking =
 					joycon_player_led_brightness_set;
 		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
+	}
+	mutex_lock(&ctlr->output_mutex);
+	ret = joycon_set_player_leds(ctlr, 0, 0x1 << player_led_number);
+	mutex_unlock(&ctlr->output_mutex);
+	if (ret) {
+		hid_warn(hdev, "Failed to set players LEDs, skipping registration; ret=%d\n", ret);
+		goto home_led;
+	}
 
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		led = &ctlr->leds[i];
 		ret = devm_led_classdev_register(&hdev->dev, led);
-		if (ret) {
-			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			mutex_unlock(&joycon_input_num_mutex);
+		if (ret)
+			hid_err(hdev, "Failed to register player %d LED; ret=%d\n", i + 1, ret);
 			return ret;
-		}
 	}
 
-	if (++input_num > 4)
-		input_num = 1;
-	mutex_unlock(&joycon_input_num_mutex);
-
+home_led:
 	/* configure the home LED */
 	if (jc_type_has_right(ctlr)) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s:%s",
@@ -1978,17 +1972,20 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 		led->max_brightness = 0xF;
 		led->brightness_set_blocking = joycon_home_led_brightness_set;
 		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
-		ret = devm_led_classdev_register(&hdev->dev, led);
-		if (ret) {
-			hid_err(hdev, "Failed registering home led\n");
-			return ret;
-		}
+
 		/* Set the home LED to 0 as default state */
-		ret = joycon_home_led_brightness_set(led, 0);
+		mutex_lock(&ctlr->output_mutex);
+		ret = joycon_set_home_led(ctlr, 0);
+		mutex_unlock(&ctlr->output_mutex);
 		if (ret) {
-			hid_warn(hdev, "Failed to set home LED default, unregistering home LED");
-			devm_led_classdev_unregister(&hdev->dev, led);
+			hid_warn(hdev, "Failed to set home LED, skipping registration; ret=%d\n", ret);
+			return 0;
 		}
+
+		ret = devm_led_classdev_register(&hdev->dev, led);
+		if (ret)
+			hid_err(hdev, "Failed to register home LED; ret=%d\n", ret);
+			return ret
 	}
 
 	return 0;
-- 
2.41.0


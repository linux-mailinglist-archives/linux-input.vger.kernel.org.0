Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7577507E9
	for <lists+linux-input@lfdr.de>; Wed, 12 Jul 2023 14:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjGLMP1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jul 2023 08:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjGLMP0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jul 2023 08:15:26 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E702113
        for <linux-input@vger.kernel.org>; Wed, 12 Jul 2023 05:14:57 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3159acfc48cso796084f8f.1
        for <linux-input@vger.kernel.org>; Wed, 12 Jul 2023 05:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689164095; x=1689768895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/mW7wNp+sQrbY5h/WzeiJVO3+uJxucsa2jr1z3hb0ws=;
        b=l0R4/+DI3J2psVcP5RD3bkN1gS9/Kj/t+7OE5UxvWXG83mxTjb4xbP5NpBue9P9jad
         KU91cxFVQW3rJVL5IQ8uczzyCDAlfJvA8/c8hRwQqyduQqvHB1Ps2zz218wjQANkoQIy
         HXtmLTocFhvdxTBTdvH9zPxvI2dGkR7KKGQWwngR4ShmUcgmYDla1fDwN8mNmzRD12Um
         TX3Icu6x24FkiX1OTWuCqC8rRrRZNrQyjA4Cm+YgDj7CK2OKL5uZRMlpemI43nH2doO6
         dSd6PoJkj7Gap9t8g1Hzh8EwXZP+xAkj5bqW1WKcKZmJjLZ/jKgR57inQTZmUxtw2pmF
         RjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689164095; x=1689768895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mW7wNp+sQrbY5h/WzeiJVO3+uJxucsa2jr1z3hb0ws=;
        b=Xnlu4BjhG3r5VAV+qXobrSx3COKi5gTb/FQwPDFNRNlFOF3ZfFJSIMVrasmbM9J7Cn
         9s9aQGVfjSN5L0zofgWxhHPQSWrlCdTfxRLapwKjIHelIVwpEmwPE5nKv5hRrSMsyfKq
         nulUt237/zLRN0vKUAT/6k7f2GhNJkA1DS+EL7j7Db5xFQtWNFidWE+nPtlWLZh6fda9
         USyeA4qWXjFcFsekClhgNZQIfAKq485McATHDZAiLUywAoTx721Yk5F+SotTv8o3Ssh8
         +K5lRtPFSoI0t6lVMN8nCOPzI6UlyRGFoj7wgGA9XvpzB0/YnUA5tCbb8xLFWty4ZkdT
         4x6w==
X-Gm-Message-State: ABy/qLZ/nBMQHH6tIbK5G1vrLsNgA69RVc3CQp+hPM/DRobuV5D6K70E
        3I0TpzYrB6Nz9BCdboZCBfhJA5nzW2mrNX3j
X-Google-Smtp-Source: APBJJlGo8aNrM47p5nNaI04r71Ik/SfH10wAzrTAG3YLCHTXWTNkwbX/DBpsgNsDaS57h+Jl7LK9/Q==
X-Received: by 2002:a5d:594c:0:b0:313:efbd:bf6 with SMTP id e12-20020a5d594c000000b00313efbd0bf6mr16047151wri.2.1689164095182;
        Wed, 12 Jul 2023 05:14:55 -0700 (PDT)
Received: from desktop-nixos-martino.. ([2a01:e11:5004:180:d78d:7025:f56d:7969])
        by smtp.gmail.com with ESMTPSA id m15-20020adfdc4f000000b003142ea7a661sm4954950wrj.21.2023.07.12.05.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:14:54 -0700 (PDT)
From:   Martino Fontana <tinozzo123@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Martino Fontana <tinozzo123@gmail.com>
Subject: [PATCH] HID: nintendo: cleanup LED code
Date:   Wed, 12 Jul 2023 14:13:54 +0200
Message-ID: <20230712121433.26134-1-tinozzo123@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

- Only turn on the nth LED, instead of all the LEDs up to n. This better matches Nintendo consoles' behaviour, as they never turn on more than one LED (still not a complete match, see https://bugzilla.kernel.org/show_bug.cgi?id=216225)
- Split part of `joycon_home_led_brightness_set` (which is called by hid) into `joycon_set_home_led` (which is what actually sets the LEDs), for consistency with player LEDs
- Instead of first registering the `led_classdev`, then attempting to set the LED and unregistering the `led_classdev` if it fails, first attempt to set the LED, then register the `led_classdev` only if it succeeds (the class is still filled up in either case)
- If setting player LEDs fails, still attempt setting the home LED (I don't know if this is actually possible, but who knows...)
- Use `JC_NUM_LEDS` when appropriate instead of 4
- Print return codes

Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
---
 drivers/hid/hid-nintendo.c | 116 ++++++++++++++++++-------------------
 1 file changed, 55 insertions(+), 61 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 586c7f8d7..89631e19b 100644
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
@@ -1938,31 +1929,33 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
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
+		hid_warn(hdev, "Failed to set players LEDs; ret=%d\n", ret);
+		goto home_led;
+	}
 
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		led = &ctlr->leds[i];
 		ret = devm_led_classdev_register(&hdev->dev, led);
-		if (ret) {
-			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			mutex_unlock(&joycon_input_num_mutex);
-			return ret;
-		}
+		if (ret)
+			hid_err(hdev, "Failed registering %s LED; ret=%d\n", led->name, ret);
 	}
 
-	if (++input_num > 4)
-		input_num = 1;
-	mutex_unlock(&joycon_input_num_mutex);
-
+home_led:
 	/* configure the home LED */
 	if (jc_type_has_right(ctlr)) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s:%s",
@@ -1978,17 +1971,18 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
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
+	    mutex_unlock(&ctlr->output_mutex);
 		if (ret) {
-			hid_warn(hdev, "Failed to set home LED default, unregistering home LED");
-			devm_led_classdev_unregister(&hdev->dev, led);
+			hid_warn(hdev, "Failed to set home LED; ret=%d\n", ret);
+			return 0;
 		}
+		ret = devm_led_classdev_register(&hdev->dev, led);
+		if (ret)
+			hid_err(hdev, "Failed registering home led; ret=%d\n", ret);
 	}
 
 	return 0;
-- 
2.41.0


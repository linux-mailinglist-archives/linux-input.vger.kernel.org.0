Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A736B6124FB
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiJ2Sth (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJ2Sth (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:37 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A2F2702
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:35 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id v28so7244597pfi.12
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MN5CjeIRoKJqllg1PKNfRnorANb6qtmvfQkjbsjTi4c=;
        b=e9RCUF4GXkm4Jwx/IFRrNrjqH90bss1Bty+U05RH8zEQIlFnvtBGfE98qn3mgoXtIC
         fr60ivyhvzjq3uGmShSvEgtLOtXVHHdbUSN6Gage5h+QPQx44IBq2pd21JPKMVQQ8akZ
         j8Yk6J4njtODK7LNptkr3bUI5A75K4VOGnjgCsQpFgt6sGhFGNTfKoRcJ8vLdJC3NzIS
         BHY71As0XZ+ZgaUHxCF2qQrrypfgHHCeWTKIdfwIi1iXq2wv4JEjFYEwdgEoY6ipUoO3
         DJwWTBxLjFtqJb3GdX1M4PPDsdKGV9bi5vSgn+j2HKpWT7eBAr12qjDEAe8d8BxR6mki
         wLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MN5CjeIRoKJqllg1PKNfRnorANb6qtmvfQkjbsjTi4c=;
        b=NoOzq6hzo/OvxFA1kZhjJaWzwz94DMHbh+UVx/rAPVdQoGj0Cblo5IyJC9M2N3kYwb
         mkdSx/QGe5Lpv7fm9O1ECRgKKW0UYzIOh9sn/HF/hFQJHZlIZmy2Eb+GFQe/9hhycaej
         vOvYHQ/61Y9WU0Jg/kATyJteSDwVP7p7ANYU+kRvtMakl+OWBZ4DY8MGfZ2+EBuPnEnb
         p40OTD3cJCAObewumzaHzQUjgMczBnWQPF3GOpEzjzqUVc/eKgToJTUuGQfEIBTUhEBC
         NvA1q3Ry58oPI91xY3Z8ihYm02cTYvk+HtFHtNxc3t9kuv2HDr8vaj6SYyJ1UeAc0IqA
         vqDg==
X-Gm-Message-State: ACrzQf2TjAEipLQeX162s/nvpiWlKGq/U8XBe71MgXoWdWa88j4yPbK4
        9aHrNXD+CHDLVGSJWzf7Go+vQIc9Yy1Js8jg
X-Google-Smtp-Source: AMsMyM6qnVShrbmJT3XMkSnqBaeVXpRmZOJRbwZeMy2W/W0LL82mnTiT5oMr8bL/TC8hU/0VUVftsw==
X-Received: by 2002:aa7:8887:0:b0:56d:41a9:dbb7 with SMTP id z7-20020aa78887000000b0056d41a9dbb7mr288156pfe.82.1667069374733;
        Sat, 29 Oct 2022 11:49:34 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:34 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 09/13] HID: playstation: support DualShock4 lightbar blink.
Date:   Sat, 29 Oct 2022 11:48:47 -0700
Message-Id: <20221029184851.282366-10-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support lightbar blink through LEDs framework.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 47 ++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index d42fda13580a..7ceb37f04d24 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -63,6 +63,7 @@ struct ps_led_info {
 	int max_brightness;
 	enum led_brightness (*brightness_get)(struct led_classdev *cdev);
 	int (*brightness_set)(struct led_classdev *cdev, enum led_brightness);
+	int (*blink_set)(struct led_classdev *led, unsigned long *on, unsigned long *off);
 };
 
 /* Seed values for DualShock4 / DualSense CRC32 for different report types. */
@@ -319,6 +320,7 @@ struct dualsense_output_report {
 #define DS4_ACC_RANGE		(4*DS_ACC_RES_PER_G)
 #define DS4_GYRO_RES_PER_DEG_S	1024
 #define DS4_GYRO_RANGE		(2048*DS_GYRO_RES_PER_DEG_S)
+#define DS4_LIGHTBAR_MAX_BLINK	255 /* 255 centiseconds */
 #define DS4_TOUCHPAD_WIDTH	1920
 #define DS4_TOUCHPAD_HEIGHT	942
 
@@ -343,10 +345,13 @@ struct dualshock4 {
 
 	/* Lightbar leds */
 	bool update_lightbar;
+	bool update_lightbar_blink;
 	bool lightbar_enabled; /* For use by global LED control. */
 	uint8_t lightbar_red;
 	uint8_t lightbar_green;
 	uint8_t lightbar_blue;
+	uint8_t lightbar_blink_on; /* In increments of 10ms. */
+	uint8_t lightbar_blink_off; /* In increments of 10ms. */
 	struct led_classdev lightbar_leds[4];
 
 	struct work_struct output_worker;
@@ -724,6 +729,7 @@ static int ps_led_register(struct ps_device *ps_dev, struct led_classdev *led,
 	led->flags = LED_CORE_SUSPENDRESUME;
 	led->brightness_get = led_info->brightness_get;
 	led->brightness_set_blocking = led_info->brightness_set;
+	led->blink_set = led_info->blink_set;
 
 	ret = devm_led_classdev_register(&ps_dev->hdev->dev, led);
 	if (ret) {
@@ -1783,6 +1789,37 @@ static enum led_brightness dualshock4_led_get_brightness(struct led_classdev *le
 	return -1;
 }
 
+static int dualshock4_led_set_blink(struct led_classdev *led, unsigned long *delay_on,
+		unsigned long *delay_off)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ds4->base.lock, flags);
+
+	if (!*delay_on && !*delay_off) {
+		/* Default to 1 Hz (50 centiseconds on, 50 centiseconds off). */
+		ds4->lightbar_blink_on = 50;
+		ds4->lightbar_blink_off = 50;
+	} else {
+		/* Blink delays in centiseconds. */
+		ds4->lightbar_blink_on = min_t(unsigned long, *delay_on/10, DS4_LIGHTBAR_MAX_BLINK);
+		ds4->lightbar_blink_off = min_t(unsigned long, *delay_off/10, DS4_LIGHTBAR_MAX_BLINK);
+	}
+
+	ds4->update_lightbar_blink = true;
+
+	spin_unlock_irqrestore(&ds4->base.lock, flags);
+
+	dualshock4_schedule_work(ds4);
+
+	*delay_on = ds4->lightbar_blink_on;
+	*delay_off = ds4->lightbar_blink_off;
+
+	return 0;
+}
+
 static int dualshock4_led_set_brightness(struct led_classdev *led, enum led_brightness value)
 {
 	struct hid_device *hdev = to_hid_device(led->dev->parent);
@@ -1866,6 +1903,13 @@ static void dualshock4_output_worker(struct work_struct *work)
 		ds4->update_lightbar = false;
 	}
 
+	if (ds4->update_lightbar_blink) {
+		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED_BLINK;
+		common->lightbar_blink_on = ds4->lightbar_blink_on;
+		common->lightbar_blink_off = ds4->lightbar_blink_off;
+		ds4->update_lightbar_blink = false;
+	}
+
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 
 	hid_hw_output_report(ds4->base.hdev, report.data, report.len);
@@ -2124,7 +2168,8 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 		{ NULL, "red", 255, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
 		{ NULL, "green", 255, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
 		{ NULL, "blue", 255, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
-		{ NULL, "global", 1, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
+		{ NULL, "global", 1, dualshock4_led_get_brightness, dualshock4_led_set_brightness,
+				dualshock4_led_set_blink },
 	};
 
 	ds4 = devm_kzalloc(&hdev->dev, sizeof(*ds4), GFP_KERNEL);
-- 
2.37.3


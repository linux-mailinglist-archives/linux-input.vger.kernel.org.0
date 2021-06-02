Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358C93980F1
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 08:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhFBGP2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 02:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbhFBGP0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 02:15:26 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28A9C061574
        for <linux-input@vger.kernel.org>; Tue,  1 Jun 2021 23:13:43 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id t9so1388938pgn.4
        for <linux-input@vger.kernel.org>; Tue, 01 Jun 2021 23:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xD0PniJbQjJKktSuYV66hRs25lK5j2m0aanTozSm5Us=;
        b=YeTlmP8mSaTkddGacGBImpGicASuDDZD4CV2HGPd0zg19bd/WtIAJBph0beMzz1Jtr
         rbtCGjj82rw9qkX2y2w9BtK22Jbi8/ZsuZpMd3NaYAaXUcbQrUEYjNfKi6mvDEOa0J75
         kIGtDJTaTndLaJfs+GVJ7b+DAdIy8p+BcL80201alVqV/GmKJnYhU7lMRs20WrzqiSv3
         Z351IlhfnLocUn8Gd1QTuvATJIUdoIHL8zCqV/RUBZQVnd9B06IwvoT2Oa5HxPiwq9zc
         WwSu8Vb6VH7iBF/6Q3hypH/zz2YAU/vZeCv4eeubQwkOcZMFjjS7HvMXkU99A/euWr5L
         2UBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xD0PniJbQjJKktSuYV66hRs25lK5j2m0aanTozSm5Us=;
        b=E8I136pSOoLv6HMy1yKzD0/1tEZEuVVwG7+SsAWOyqEEzUDdoKpsG+JkG0Jhuy25CL
         6GEiiB7bxn/Tr8kCU8RpnTQbuSjRphVcHwGLPCPX/2i0VBhjGl7JIGvcizDzYhUvFtBo
         T8r7wG5w31HjvcMv3wLU7KAK7lvG05zVXZschvQ9ejpgJpKxly1kj+zlwUm2uim6OPgC
         bBP4lDueB5WvbaSBqeBqrD4GH4lSHtnQlMoznOu5E9xi+EoGOsE+71hMdn3xQxUuqwt9
         xlp1TubimVxXxoalJZ4l3wIVzzB44eNpTs4skVkjwTieTkM5tPFEuMt11X1W0X4nxjGX
         cQxw==
X-Gm-Message-State: AOAM530MbodZQPcIeLNIGKi8Zizb84GWURWKUK3/rdfPRKn1x7H2HNIw
        cj4ft3xjAHINTf50xgFs3VBgbA==
X-Google-Smtp-Source: ABdhPJxnduOPe4CEyQOEmoOxjiRHPZCv8q9JUbCVN8uF5kjxI7ibNOFP/E2SKBLnkodU/NhBPwoftg==
X-Received: by 2002:aa7:8c4e:0:b029:2df:9b70:44e with SMTP id e14-20020aa78c4e0000b02902df9b70044emr25768858pfd.49.1622614423550;
        Tue, 01 Jun 2021 23:13:43 -0700 (PDT)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id k20sm16535374pgl.72.2021.06.01.23.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 23:13:43 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 1/3] HID: playstation: expose DualSense lightbar through a multi-color LED.
Date:   Tue,  1 Jun 2021 23:12:51 -0700
Message-Id: <20210602061253.5747-2-roderick@gaikai.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602061253.5747-1-roderick@gaikai.com>
References: <20210602061253.5747-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense lightbar has so far been supported, but it was not yet
adjustable from user space. This patch exposes it through a multi-color
LED.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index ab7c82c2e886..ff2fc315a89d 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -11,6 +11,8 @@
 #include <linux/hid.h>
 #include <linux/idr.h>
 #include <linux/input/mt.h>
+#include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 
 #include <asm/unaligned.h>
@@ -38,6 +40,7 @@ struct ps_device {
 	uint8_t battery_capacity;
 	int battery_status;
 
+	const char *input_dev_name; /* Name of primary input device. */
 	uint8_t mac_address[6]; /* Note: stored in little endian order. */
 	uint32_t hw_version;
 	uint32_t fw_version;
@@ -147,6 +150,7 @@ struct dualsense {
 	uint8_t motor_right;
 
 	/* RGB lightbar */
+	struct led_classdev_mc lightbar;
 	bool update_lightbar;
 	uint8_t lightbar_red;
 	uint8_t lightbar_green;
@@ -288,6 +292,8 @@ static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
 	{0, 0},
 };
 
+static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue);
+
 /*
  * Add a new ps_device to ps_devices if it doesn't exist.
  * Return error on duplicate device, which can happen if the same
@@ -525,6 +531,45 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 	return 0;
 }
 
+/* Register a DualSense/DualShock4 RGB lightbar represented by a multicolor LED. */
+static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc *lightbar_mc_dev,
+	int (*brightness_set)(struct led_classdev *, enum led_brightness))
+{
+	struct hid_device *hdev = ps_dev->hdev;
+	struct mc_subled *mc_led_info;
+	struct led_classdev *led_cdev;
+	int ret;
+
+	mc_led_info = devm_kmalloc_array(&hdev->dev, 3, sizeof(*mc_led_info),
+					 GFP_KERNEL | __GFP_ZERO);
+	if (!mc_led_info)
+		return -ENOMEM;
+
+	mc_led_info[0].color_index = LED_COLOR_ID_RED;
+	mc_led_info[1].color_index = LED_COLOR_ID_GREEN;
+	mc_led_info[2].color_index = LED_COLOR_ID_BLUE;
+
+	lightbar_mc_dev->subled_info = mc_led_info;
+	lightbar_mc_dev->num_colors = 3;
+
+	led_cdev = &lightbar_mc_dev->led_cdev;
+	led_cdev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s:rgb:indicator",
+			ps_dev->input_dev_name);
+	if (!led_cdev->name)
+		return -ENOMEM;
+	led_cdev->brightness = 255;
+	led_cdev->max_brightness = 255;
+	led_cdev->brightness_set_blocking = brightness_set;
+
+	ret = devm_led_classdev_multicolor_register(&hdev->dev, lightbar_mc_dev);
+	if (ret < 0) {
+		hid_err(hdev, "Cannot register multicolor LED device\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static struct input_dev *ps_sensors_create(struct hid_device *hdev, int accel_range, int accel_res,
 		int gyro_range, int gyro_res)
 {
@@ -761,6 +806,22 @@ static int dualsense_get_mac_address(struct dualsense *ds)
 	return ret;
 }
 
+static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
+	enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct dualsense *ds = container_of(mc_cdev, struct dualsense, lightbar);
+	uint8_t red, green, blue;
+
+	led_mc_calc_color_components(mc_cdev, brightness);
+	red = mc_cdev->subled_info[0].brightness;
+	green = mc_cdev->subled_info[1].brightness;
+	blue = mc_cdev->subled_info[2].brightness;
+
+	dualsense_set_lightbar(ds, red, green, blue);
+	return 0;
+}
+
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -1106,10 +1167,14 @@ static int dualsense_reset_leds(struct dualsense *ds)
 
 static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&ds->base.lock, flags);
 	ds->update_lightbar = true;
 	ds->lightbar_red = red;
 	ds->lightbar_green = green;
 	ds->lightbar_blue = blue;
+	spin_unlock_irqrestore(&ds->base.lock, flags);
 
 	schedule_work(&ds->output_worker);
 }
@@ -1196,6 +1261,8 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		ret = PTR_ERR(ds->gamepad);
 		goto err;
 	}
+	/* Use gamepad input device name as primary device name for e.g. LEDs */
+	ps_dev->input_dev_name = dev_name(&ds->gamepad->dev);
 
 	ds->sensors = ps_sensors_create(hdev, DS_ACC_RANGE, DS_ACC_RES_PER_G,
 			DS_GYRO_RANGE, DS_GYRO_RES_PER_DEG_S);
@@ -1223,6 +1290,11 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
+	ret = ps_lightbar_register(ps_dev, &ds->lightbar, dualsense_lightbar_set_brightness);
+	if (ret)
+		goto err;
+
+	/* Set default lightbar color. */
 	dualsense_set_lightbar(ds, 0, 0, 128); /* blue */
 
 	ret = ps_device_set_player_id(ps_dev);
-- 
2.31.1


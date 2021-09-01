Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BBC3FE583
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 00:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243378AbhIAWbr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 18:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhIAWbq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 18:31:46 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEB2C061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 15:30:49 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 8so982252pga.7
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 15:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2O15b5jxiW6WFq6fnZl6UQH81lPDz7x2LdIPN+cragI=;
        b=LZJ9HuRwk6Jrn7O9DEP2N3EOI4GbnerZENx61jqK3+z1skrEE8hksc8+rIzXWa5yys
         hPvgJEpyOfY6iY6+KqOI53xu37u7areXhEF1Yf/gSwj8J/C5XPvvSm4dd9rg0403lK48
         Clru5hCZdsW0Qd1Nr/8oYStJN9knJbG3y925eOpN31UiVTZgrMhMvQPONHUhE4ZM1Ydh
         utbKyr6n7VlS8NW7ONekaI+OYtz4hgjkdXIkCL+Z3t/oK4mkKNOh1/oXTYIFcPxecYU5
         eQRW8mmYhe/Qb50ZHspZW7UpFKKoy3eFlC63BE4PpErJZcCZZVE/ooYfzicYSro5A6tz
         k4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2O15b5jxiW6WFq6fnZl6UQH81lPDz7x2LdIPN+cragI=;
        b=lK4wfsix8jAKXUnsS+M1DLLnE4MzcKDBwTRkq5rF39saYPF3dz0cM0SGaPHnwFZP6y
         Ca0oXbSCR59oyNiOZiN1F3QSuj8n92b8AX60MYCfSBm7BUomX+K9p14+Jz3U2eeyEZNn
         +BVv1Nss6Iu7wB1Jjrw+bV50AEqQN5TPCYbXgrC1X7Bo83XyBlsJ2Jo4zKjIV0EslTht
         lKnx99bhOPKafREzJighb5FW0FzcvEdyGjHmnPa5BmYybD9KIPRdsNgynfGZ/UFXcbof
         /MxIh0mfVy8dgeVcrUSMme3FG7TQpO2at+WpSM5bbKhcZpF4pkE4lL7/H5gOvwQe4plz
         q0aw==
X-Gm-Message-State: AOAM533G6HCLCOalfuK992Qj6+Zn1RXdUeTyYqt5El25CLP8hzELwXZl
        98Rzj3DrQvfwJlj58KiWrij/6g==
X-Google-Smtp-Source: ABdhPJzv6hXE4HkAC4RtXAswsEaQk+3qlvS6CkfOGLiTyTA/Ye6XR6mo41ojCmsyglDR72trbc0gVA==
X-Received: by 2002:a62:88d7:0:b0:3fd:b2db:79c5 with SMTP id l206-20020a6288d7000000b003fdb2db79c5mr1532004pfd.21.1630535449117;
        Wed, 01 Sep 2021 15:30:49 -0700 (PDT)
Received: from localhost.localdomain (rrcs-24-43-218-40.west.biz.rr.com. [24.43.218.40])
        by smtp.gmail.com with ESMTPSA id j2sm9623pfe.201.2021.09.01.15.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 15:30:48 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 1/3] HID: playstation: expose DualSense lightbar through a multi-color LED.
Date:   Wed,  1 Sep 2021 15:30:35 -0700
Message-Id: <20210901223037.2964665-2-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
References: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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


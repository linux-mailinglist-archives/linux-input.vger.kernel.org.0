Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F8D2DED7B
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgLSGZD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:25:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgLSGZD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:25:03 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D114BC0611CC
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:49 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id n3so5727844pjm.1
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zX/Dii4fUG9VTSmki6iXbZchdfMd9Oeqo58UDR48OXQ=;
        b=RsUzodXS90pek2ZsGySaM/TYPSH8L/2+xK7AFZOWgqPAnoEOHwtiWOe1AhluKIDH+d
         tKkL4ymDGlB+2i2JSTSp3ikE0C/8RVVSr235+m4Q4VAKOru9Xh3/HaD2Vpth1refgs9J
         e0+kgd7zEJ/+nGXKTl7jm+pruOtAPzJ8ntIeO91/5ERyUgR3wjm8M/lKhDlpaCkfi3Rv
         XRODG9eDcNd7CLMCK9tXkVPFezESoT1OmhBubO6DhAypIttaxYJVlsvE1PMQPysG1PaN
         7uJRYHQ4rbiHd4ULBJpid6NsYNUk+nxYH1TvpZKhfIoG8GpXNR+KVN62B4YwySXlAaC4
         I64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zX/Dii4fUG9VTSmki6iXbZchdfMd9Oeqo58UDR48OXQ=;
        b=STMHW/BnDbg+Wuw7RT5HM0b2cvxjkSG/tEi72kWpro4tlxzk6tGgCDnWs5UE/4NjNX
         gjkCpuGVtCc8f1lkNiJsQlO+xPa7S6nUmy4tUaYH0yR9VOSVtHqOzrTDMJxhuTs6TX98
         r6Yb3TDENIx7vEZl0BHgw6rFJmIiH1S10QCK/CYX4wr/i8HsIffiDweMG3cXMQFfWIEm
         h0BMAUngAdfwcXMXrH7D1/8UKp4k3IeRo4EJG5W0kw96RsbMxfnPOKq0FhmWa6u+MEkj
         g4ZCD0vk3z8LrALnLeUeDVZqq8yw3etVjXnQ5IY7jTLW3PZSGfHbC1OFok6ErCZUUq0F
         fyTQ==
X-Gm-Message-State: AOAM530GPMl77fuyTp9FzeDG3G9Q4Mw+pd8+x5EfXwJOwhs3g1XpIxoU
        0nZbhSgZl52o+yWxn55SqWUKmPApWsD6Mw==
X-Google-Smtp-Source: ABdhPJxFy5EjQwS2bKCkNSMh40Web7Ief1gCz/ZxdDX4gzxdsksmuEq/Csvh5xbQamszXOqe8csYJw==
X-Received: by 2002:a17:902:8bc8:b029:dc:36d4:fba8 with SMTP id r8-20020a1709028bc8b02900dc36d4fba8mr331152plo.82.1608359029428;
        Fri, 18 Dec 2020 22:23:49 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:49 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 09/13] HID: playstation: add DualSense lightbar support
Date:   Fri, 18 Dec 2020 22:23:32 -0800
Message-Id: <20201219062336.72568-10-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Expose the DualSense its RGB lightbar using the new multicolor LED
framework.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/Kconfig           |   1 +
 drivers/hid/hid-playstation.c | 124 ++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e6c67aaa1a1a..c80c81916f4a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -857,6 +857,7 @@ config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	default !EXPERT
 	depends on HID
+	select LEDS_CLASS_MULTICOLOR
 	select POWER_SUPPLY
 	help
 	  Provides support for Sony PS5 controllers including support for
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 0b62bcb28d8a..f8cf82a27d43 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input/mt.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 #include <linux/crc32.h>
 #include <asm/unaligned.h>
@@ -77,6 +78,9 @@ struct ps_calibration_data {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
+#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
+#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
 
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
@@ -106,6 +110,13 @@ struct dualsense {
 	uint8_t motor_left;
 	uint8_t motor_right;
 
+	/* RGB lightbar */
+	struct led_classdev_mc *lightbar;
+	bool update_lightbar;
+	uint8_t lightbar_red;
+	uint8_t lightbar_green;
+	uint8_t lightbar_blue;
+
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -396,6 +407,50 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
 	return gamepad;
 }
 
+/* Create a DualSense/DualShock4 RGB lightbar represented by a multicolor LED. */
+static struct led_classdev_mc *ps_lightbar_create(struct ps_device *ps_dev,
+	int (*brightness_set)(struct led_classdev *, enum led_brightness))
+{
+	struct hid_device *hdev = ps_dev->hdev;
+	struct led_classdev_mc *lightbar_mc_dev;
+	struct mc_subled *mc_led_info;
+	struct led_classdev *led_cdev;
+	int ret;
+
+	lightbar_mc_dev = devm_kzalloc(&hdev->dev, sizeof(*lightbar_mc_dev), GFP_KERNEL);
+	if (!lightbar_mc_dev)
+		return ERR_PTR(-ENOMEM);
+
+	mc_led_info = devm_kzalloc(&hdev->dev, 3*sizeof(*mc_led_info), GFP_KERNEL);
+	if (!mc_led_info)
+		return ERR_PTR(-ENOMEM);
+
+	mc_led_info[0].color_index = LED_COLOR_ID_RED;
+	mc_led_info[0].channel = 0;
+	mc_led_info[1].color_index = LED_COLOR_ID_GREEN;
+	mc_led_info[1].channel = 1;
+	mc_led_info[2].color_index = LED_COLOR_ID_BLUE;
+	mc_led_info[2].channel = 2;
+
+	lightbar_mc_dev->subled_info = mc_led_info;
+	lightbar_mc_dev->num_colors = 3;
+
+	led_cdev = &lightbar_mc_dev->led_cdev;
+	led_cdev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "playstation::%pMR::rgb",
+			ps_dev->mac_address);
+	led_cdev->brightness = 255;
+	led_cdev->max_brightness = 255;
+	led_cdev->brightness_set_blocking = brightness_set;
+
+	ret = devm_led_classdev_multicolor_register(&hdev->dev, lightbar_mc_dev);
+	if (ret < 0) {
+		hid_err(hdev, "Cannot register multicolor LED device\n");
+		return ERR_PTR(ret);
+	}
+
+	return lightbar_mc_dev;
+}
+
 static struct input_dev *ps_sensors_create(struct hid_device *hdev, int accel_range, int accel_res,
 		int gyro_range, int gyro_res)
 {
@@ -580,6 +635,27 @@ static int dualsense_get_mac_address(struct dualsense *ds)
 	return ret;
 }
 
+static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
+	enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct hid_device *hdev = to_hid_device(cdev->dev->parent);
+	struct dualsense *ds = hid_get_drvdata(hdev);
+	unsigned long flags;
+
+	led_mc_calc_color_components(mc_cdev, brightness);
+
+	spin_lock_irqsave(&ds->base.lock, flags);
+	ds->update_lightbar = true;
+	ds->lightbar_red = mc_cdev->subled_info[0].brightness;
+	ds->lightbar_green = mc_cdev->subled_info[1].brightness;
+	ds->lightbar_blue = mc_cdev->subled_info[2].brightness;
+	spin_unlock_irqrestore(&ds->base.lock, flags);
+
+	schedule_work(&ds->output_worker);
+	return 0;
+}
+
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -661,6 +737,15 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_rumble = false;
 	}
 
+	if (ds->update_lightbar) {
+		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE;
+		common->lightbar_red = ds->lightbar_red;
+		common->lightbar_green = ds->lightbar_green;
+		common->lightbar_blue = ds->lightbar_blue;
+
+		ds->update_lightbar = false;
+	}
+
 	spin_unlock_irqrestore(&ds->base.lock, flags);
 
 	dualsense_send_output_report(ds, &report);
@@ -841,6 +926,30 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
 	return 0;
 }
 
+static int dualsense_reset_leds(struct dualsense *ds)
+{
+	struct dualsense_output_report report;
+	uint8_t *buf;
+
+	buf = kzalloc(sizeof(struct dualsense_output_report_bt), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	dualsense_init_output_report(ds, &report, buf);
+	/* On Bluetooth the DualSense outputs an animation on the lightbar
+	 * during startup and maintains a color afterwards. We need to explicitly
+	 * reconfigure the lightbar before we can do any programming later on.
+	 * In USB the lightbar is not on by default, but redoing the setup there
+	 * doesn't hurt.
+	 */
+	report.common->valid_flag2 = DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE;
+	report.common->lightbar_setup = 2; /* Fade light out. */
+	dualsense_send_output_report(ds, &report);
+
+	kfree(buf);
+	return 0;
+}
+
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
@@ -908,6 +1017,21 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret < 0)
 		goto err;
 
+	/* The hardware may have control over the LEDs (e.g. in Bluetooth on startup).
+	 * Reset the LEDs (lightbar, mute, player leds), so we can control them
+	 * from software.
+	 */
+	ret = dualsense_reset_leds(ds);
+	if (ret < 0)
+		goto err;
+
+	ds->lightbar = ps_lightbar_create((struct ps_device *)ds,
+			dualsense_lightbar_set_brightness);
+	if (IS_ERR(ds->lightbar)) {
+		ret = PTR_ERR(ds->lightbar);
+		goto err;
+	}
+
 	return (struct ps_device *)ds;
 
 err:
-- 
2.26.2


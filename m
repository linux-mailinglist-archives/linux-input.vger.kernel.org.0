Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F195F2E8903
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbhABWc5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbhABWc4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:56 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2398C0617A0
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:42 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id c132so5017483pga.3
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5BrCyT+8fFkoS+JIQh84I54mXrlbdOL3gkzfyxxuBuE=;
        b=P3j/QRF+HQShJPKHd417eHQYkJ5Ed2+xorSOb9tdku8YOeWbYayFXOGzwQ0yS4FXvD
         v2xlmxkMjZ6VmFj0k5Qsw/ogIe8VwxGRyzgqIazdaao3JquA4vj/kYuISichNAVOvQSU
         /tB5T8T+S6EEq2gzwqVQa4vB5PlfI7QAJ6ToqI960QllaG7ST9Qz3iim+OaGM4UxsU/1
         wcVYmDgZ3sJ/7EmR5jQqf0mLocMMkhG/HvE7heooQVD3nHW0j0my1XJCRVSuqZImHRbE
         xPzeEzmnGS4jHPLxfFC1RGwvg/vF8Dab86zpt292Yk6p2CyF2MldbfY1R+UuAOvvkTCB
         g7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5BrCyT+8fFkoS+JIQh84I54mXrlbdOL3gkzfyxxuBuE=;
        b=V9z3UuLpkz59iBuIupEmQpfoQuXCiFTgeQvHvPC1De4f44TiH2WY23UjF5KsvekjYz
         tx3pNK2RlTbN5eoJSnhmVlN1bkst3WIppYg//DIq93mEzQAPq+rd+srEyHztmQlJqpdU
         U0tShe8Ar/sQ1BughkjGslZxKXzYGcnMDmnlwuVpd/FcN6tRTLreP+yvaPNrOp55074B
         tNeJ3wvJkqS9d0MRszd6fO7SpZpD3ZNKlbrJ20FUm78TyEp7eAKqXZHexAbGQaacxPRH
         zHio3Kk2TP8/YADSWBLrjAF9bezs9NqT/NDjRMXjZkH6HpVOd0uec+ej6377hJjT+AuY
         bcdg==
X-Gm-Message-State: AOAM5326jW66A9/G466EDboiLcuP4DOTht8jmigFoTjGdms/oIqvPuh5
        Brd6EFhSFjPNySzwbVCQcjtLzw==
X-Google-Smtp-Source: ABdhPJwitystFTKV+ayOKJEDl6P7v3vYJU01ALxLGevmdB5KFIj/vYUcHHp0+oIPzzYuyOoH3Wonzg==
X-Received: by 2002:a63:4e17:: with SMTP id c23mr23150559pgb.439.1609626702493;
        Sat, 02 Jan 2021 14:31:42 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:42 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 09/13] HID: playstation: add DualSense lightbar support
Date:   Sat,  2 Jan 2021 14:31:05 -0800
Message-Id: <20210102223109.996781-10-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210102223109.996781-1-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 117 ++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

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
index 36a904b2f93f..3b26445acbb9 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input/mt.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 
 #include <asm/unaligned.h>
@@ -87,6 +88,10 @@ struct ps_calibration_data {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
+#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
+#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
+#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
 
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
@@ -116,6 +121,13 @@ struct dualsense {
 	uint8_t motor_left;
 	uint8_t motor_right;
 
+	/* RGB lightbar */
+	struct led_classdev_mc lightbar;
+	bool update_lightbar;
+	uint8_t lightbar_red;
+	uint8_t lightbar_green;
+	uint8_t lightbar_blue;
+
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -407,6 +419,45 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
 	return gamepad;
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
+	mc_led_info = devm_kzalloc(&hdev->dev, 3*sizeof(*mc_led_info), GFP_KERNEL);
+	if (!mc_led_info)
+		return -ENOMEM;
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
+		return ret;
+	}
+
+	return 0;
+}
+
 static struct input_dev *ps_sensors_create(struct hid_device *hdev, int accel_range, int accel_res,
 		int gyro_range, int gyro_res)
 {
@@ -601,6 +652,27 @@ static int dualsense_get_mac_address(struct dualsense *ds)
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
@@ -682,6 +754,15 @@ static void dualsense_output_worker(struct work_struct *work)
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
@@ -861,6 +942,30 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
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
+	report.common->lightbar_setup = DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT; /* Fade light out. */
+	dualsense_send_output_report(ds, &report);
+
+	kfree(buf);
+	return 0;
+}
+
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
@@ -930,6 +1035,18 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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
+	ret = ps_lightbar_register(ps_dev, &ds->lightbar, dualsense_lightbar_set_brightness);
+	if (ret < 0)
+		goto err;
+
 	return &ds->base;
 
 err:
-- 
2.26.2


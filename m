Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8F2307C79
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhA1R37 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:29:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbhA1R1z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:27:55 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3256C061351
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:15 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id i63so4430091pfg.7
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sMfSLSyUdZD2sFFf9RvMXhrSy7osdHVD4OZybN25Bfg=;
        b=JztaoGk6xblmPE5FchmSc2wg61UQOPc92VbOBSjzOxw4ZR3vG5FFPS7kJ/8O9kgnh3
         +pEhBgOYzC1yp9zCmOpAh5eWnSn1kozToSayqrzobJ7PRqO77d2zNsZcdcpMdJ6eFD8A
         M7veFWcn/cTZdI4AIYr2eZKaWybAhAwfyXsGRGRREWqoVs9fTB26RHGfKqe/TPiM1S9T
         VNwlhRGGh5Ka0K/PRLo/Gq0i5PkTIC0MEqzKfeZTFGHeVxIBnpnYTLk17dtOuoBDme6d
         oNBVb8PFZAn3P+Xw543jh7Ugy7cwxkuzrZxSV/+lcayY/2EYWUOaOVCd8bNmxMIZJTRw
         q4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sMfSLSyUdZD2sFFf9RvMXhrSy7osdHVD4OZybN25Bfg=;
        b=lPkF0jMuEZnO+wie+9fmJH0t1odruCH58kropxanD5btCkzYaQHh2jgC+ebAB4HMRh
         jpHt6iraxSAECXFwrTcRDZCRydSeWgvfRiEjK7UbzKBtblsZvBfbunZrcv6pC49zhNw8
         OAkwua3tJRMcFWzg94x9sZI2KN0pQTT/ArLoU0XasOEYnNysghM4D9shAAAciULHpj58
         hKk4zjq72uqHI4EoNCZEpPlnGWaJOrCfFHI08gjjwo/tJvG73qKWSuhkmzqOLp9Rg6Fj
         KXrx3vpnWfUKKTqVLB02WB2DJJ3g/sJ1zqR1l/fc+CeGhaOVoSYwwcrp9+ZRUjBBqK9E
         f7fg==
X-Gm-Message-State: AOAM533jkzK/kbxKJkCWveHd6aAQ33Q0HGsqzzZrmjR+rJF2+72x3ZtL
        fFdW0upP7mWmGgPGBuuL4e2DaQ==
X-Google-Smtp-Source: ABdhPJz+7MKwpRP46xlOKiQKqHrbZk4Z5Bs24HfzKJnOcDI5fcwPP7qrOin9wcVB52qmtJAVDOf/Vw==
X-Received: by 2002:a63:cb01:: with SMTP id p1mr548648pgg.406.1611854835162;
        Thu, 28 Jan 2021 09:27:15 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:14 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 09/13] HID: playstation: add DualSense lightbar support
Date:   Thu, 28 Jan 2021 09:26:53 -0800
Message-Id: <20210128172657.24516-10-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 115 ++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 54b4eee222f9..cfa29dc17064 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -857,6 +857,7 @@ config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	depends on HID
 	select CRC32
+	select LEDS_CLASS_MULTICOLOR
 	select POWER_SUPPLY
 	help
 	  Provides support for Sony PS5 controllers including support for
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index bb49e2ef9017..58fdec0d32d4 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input/mt.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 
 #include <asm/unaligned.h>
@@ -99,6 +100,10 @@ struct ps_calibration_data {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
+#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
+#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
+#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
 
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
@@ -128,6 +133,13 @@ struct dualsense {
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
@@ -464,6 +476,42 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
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
+	mc_led_info = devm_kmalloc_array(&hdev->dev, 3, sizeof(*mc_led_info), GFP_KERNEL | __GFP_ZERO);
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
@@ -642,6 +690,26 @@ static int dualsense_get_mac_address(struct dualsense *ds)
 	return ret;
 }
 
+static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
+	enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct dualsense *ds = container_of(mc_cdev, struct dualsense, lightbar);
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
@@ -725,6 +793,15 @@ static void dualsense_output_worker(struct work_struct *work)
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
@@ -909,6 +986,31 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
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
+	/*
+	 * On Bluetooth the DualSense outputs an animation on the lightbar
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
@@ -980,6 +1082,19 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
+	/*
+	 * The hardware may have control over the LEDs (e.g. in Bluetooth on startup).
+	 * Reset the LEDs (lightbar, mute, player leds), so we can control them
+	 * from software.
+	 */
+	ret = dualsense_reset_leds(ds);
+	if (ret)
+		goto err;
+
+	ret = ps_lightbar_register(ps_dev, &ds->lightbar, dualsense_lightbar_set_brightness);
+	if (ret)
+		goto err;
+
 	return &ds->base;
 
 err:
-- 
2.26.2


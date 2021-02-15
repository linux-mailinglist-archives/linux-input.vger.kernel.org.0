Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B6931B3AC
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 01:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbhBOAqn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Feb 2021 19:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhBOAqm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Feb 2021 19:46:42 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092E7C0613D6
        for <linux-input@vger.kernel.org>; Sun, 14 Feb 2021 16:46:02 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id ba1so2811776plb.1
        for <linux-input@vger.kernel.org>; Sun, 14 Feb 2021 16:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uzBte6r7kxC0wtPH+qtBYHjK6eZ3c0NP6i9Dj0b96+Q=;
        b=lF5c4f2pMgf1p6UtuUxjSHLpmt4qHykUTcaRn6LkiWznxiykIzCKjfJ1plM0elUwKW
         oW3TDj3Z9Pv6Ut4tJI7gyfOoRLItYGEgr4+6zWGwmmFCJd1sbAsvCpMZ6XrWeYR4geqe
         Bax4U4i6Vr5qlXVBb3mFgA9KwHxvtpVdrMNgUUx0TR8mJF+jSYmqwlKDtbiDQrqtC55O
         dWdtd8n9Kvv3Q2njCFxUiApipJ1grVBfAYt8tYRI9L6npE1OnLlyaZcIQtGRrBsYrlpZ
         LdOwumGdTTxWxU6aN4m4uIvwADf7vOPmWBy4gFbnUPbQg6WORkTib/KRDl10pqBolbzV
         W4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uzBte6r7kxC0wtPH+qtBYHjK6eZ3c0NP6i9Dj0b96+Q=;
        b=px+x+7+UNU+RG7fnc6TlvCzJqUgQs7dw8HW7qZUli/bMiGuds4fiINZQ7pUVCJkU0a
         Ok/cWwl+0XW7PoJ7tPhUkJCS0Mphzor1LODlNaLe9rl+3tZPIeKc6vDLu7ENwQFzDRHn
         1hdojXA3aaiZRr2D4cklcqHzBevKdPPbOTZqlTQZ/9P4CRynoEDY+ocmdZbFbcGgnkgC
         fxRu9+qocR6eCu6TE7MpbLrU4njTGWELqq9k0VjNaeUTcbmpZ3Qjz65PC5NYrPT7InaH
         n7pmsQH9pfum1H3t8qS7ELH0yVWt7FBzIPP5DNfjwmbDpXc3mB15vcMwcp3sb+e7C72M
         1YwQ==
X-Gm-Message-State: AOAM532XSJfOFlwy2KcR0UrpmBFISvK43EitBbXal6jzMj7RrVtcBPKT
        uPoulWUDwaA3hhyUnQFPDjPObQ==
X-Google-Smtp-Source: ABdhPJzlNLG3TxLVXVEZ4XE1YJyZrjM65lM8qi46hGsb0wfqRyDClS+b7hBapO2vkr8t2qVxu/tDvQ==
X-Received: by 2002:a17:902:cf88:b029:e3:5daa:3239 with SMTP id l8-20020a170902cf88b02900e35daa3239mr926751ply.35.1613349961658;
        Sun, 14 Feb 2021 16:46:01 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id q188sm16127746pfb.8.2021.02.14.16.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 16:46:01 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        dmitry.torokhov@gmail.com, pobm@protonmail.com
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 1/4] HID: playstation: add DualSense lightbar support
Date:   Sun, 14 Feb 2021 16:45:46 -0800
Message-Id: <20210215004549.135251-2-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215004549.135251-1-roderick@gaikai.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 118 ++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

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
index 64193fdeaa0d..97c1118ba78f 100644
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
@@ -473,6 +485,45 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
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
+	led_cdev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "playstation::%pMR::rgb",
+			ps_dev->mac_address);
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
@@ -651,6 +702,26 @@ static int dualsense_get_mac_address(struct dualsense *ds)
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
@@ -734,6 +805,15 @@ static void dualsense_output_worker(struct work_struct *work)
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
@@ -918,6 +998,31 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
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
@@ -989,6 +1094,19 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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


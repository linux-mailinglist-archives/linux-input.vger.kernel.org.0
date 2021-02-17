Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9354A31DE56
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234146AbhBQRfM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:35:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60956 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234532AbhBQRdu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g1ddvgYZOFZVK7/IBzi4i+hpKLqhBihRi2iOVvbUUQM=;
        b=cMBnX1zjFQUA8z79EfC75WAA54QLIR2Vq7AMfwPK260vt9dyqjwvNMKmBmrEujZ+hQAvT7
        w9gLq+tbhBy/YyaZcfd4dDYvUkS+B1sBXBWypb+INbG7SbO9ONtW949qRLy8yjDuF6ummb
        Bu/+ptOQordOypU5JkM1mytxT4a1f58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-pGpklSFMPk-Gf88Z96AGjQ-1; Wed, 17 Feb 2021 12:32:19 -0500
X-MC-Unique: pGpklSFMPk-Gf88Z96AGjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94D01192CC42;
        Wed, 17 Feb 2021 17:32:18 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 166E160C61;
        Wed, 17 Feb 2021 17:32:14 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 06/11] Revert "HID: playstation: add DualSense lightbar support"
Date:   Wed, 17 Feb 2021 18:31:53 +0100
Message-Id: <20210217173158.3122868-7-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

This reverts commit ebbe998a4a52 ("HID: playstation: add
DualSense lightbar support")

There is currently an ongoing discussion on linux-leds LKML,
and so to give us more room, we need to revert those related
patches from linux-next.

This is not a big deal, they are still not pushed to Linus.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/Kconfig           |   1 -
 drivers/hid/hid-playstation.c | 118 ----------------------------------
 2 files changed, 119 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e7f17e78ff14..7ae9eef6ca64 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -857,7 +857,6 @@ config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	depends on HID
 	select CRC32
-	select LEDS_CLASS_MULTICOLOR
 	select POWER_SUPPLY
 	help
 	  Provides support for Sony PS5 controllers including support for
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 97c1118ba78f..64193fdeaa0d 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -10,7 +10,6 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input/mt.h>
-#include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 
 #include <asm/unaligned.h>
@@ -100,10 +99,6 @@ struct ps_calibration_data {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
-#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
-#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
-#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
-#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
 
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
@@ -133,13 +128,6 @@ struct dualsense {
 	uint8_t motor_left;
 	uint8_t motor_right;
 
-	/* RGB lightbar */
-	struct led_classdev_mc lightbar;
-	bool update_lightbar;
-	uint8_t lightbar_red;
-	uint8_t lightbar_green;
-	uint8_t lightbar_blue;
-
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -485,45 +473,6 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 	return 0;
 }
 
-/* Register a DualSense/DualShock4 RGB lightbar represented by a multicolor LED. */
-static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc *lightbar_mc_dev,
-	int (*brightness_set)(struct led_classdev *, enum led_brightness))
-{
-	struct hid_device *hdev = ps_dev->hdev;
-	struct mc_subled *mc_led_info;
-	struct led_classdev *led_cdev;
-	int ret;
-
-	mc_led_info = devm_kmalloc_array(&hdev->dev, 3, sizeof(*mc_led_info),
-					 GFP_KERNEL | __GFP_ZERO);
-	if (!mc_led_info)
-		return -ENOMEM;
-
-	mc_led_info[0].color_index = LED_COLOR_ID_RED;
-	mc_led_info[1].color_index = LED_COLOR_ID_GREEN;
-	mc_led_info[2].color_index = LED_COLOR_ID_BLUE;
-
-	lightbar_mc_dev->subled_info = mc_led_info;
-	lightbar_mc_dev->num_colors = 3;
-
-	led_cdev = &lightbar_mc_dev->led_cdev;
-	led_cdev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "playstation::%pMR::rgb",
-			ps_dev->mac_address);
-	if (!led_cdev->name)
-		return -ENOMEM;
-	led_cdev->brightness = 255;
-	led_cdev->max_brightness = 255;
-	led_cdev->brightness_set_blocking = brightness_set;
-
-	ret = devm_led_classdev_multicolor_register(&hdev->dev, lightbar_mc_dev);
-	if (ret < 0) {
-		hid_err(hdev, "Cannot register multicolor LED device\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static struct input_dev *ps_sensors_create(struct hid_device *hdev, int accel_range, int accel_res,
 		int gyro_range, int gyro_res)
 {
@@ -702,26 +651,6 @@ static int dualsense_get_mac_address(struct dualsense *ds)
 	return ret;
 }
 
-static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
-	enum led_brightness brightness)
-{
-	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
-	struct dualsense *ds = container_of(mc_cdev, struct dualsense, lightbar);
-	unsigned long flags;
-
-	led_mc_calc_color_components(mc_cdev, brightness);
-
-	spin_lock_irqsave(&ds->base.lock, flags);
-	ds->update_lightbar = true;
-	ds->lightbar_red = mc_cdev->subled_info[0].brightness;
-	ds->lightbar_green = mc_cdev->subled_info[1].brightness;
-	ds->lightbar_blue = mc_cdev->subled_info[2].brightness;
-	spin_unlock_irqrestore(&ds->base.lock, flags);
-
-	schedule_work(&ds->output_worker);
-	return 0;
-}
-
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -805,15 +734,6 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_rumble = false;
 	}
 
-	if (ds->update_lightbar) {
-		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE;
-		common->lightbar_red = ds->lightbar_red;
-		common->lightbar_green = ds->lightbar_green;
-		common->lightbar_blue = ds->lightbar_blue;
-
-		ds->update_lightbar = false;
-	}
-
 	spin_unlock_irqrestore(&ds->base.lock, flags);
 
 	dualsense_send_output_report(ds, &report);
@@ -998,31 +918,6 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
 	return 0;
 }
 
-static int dualsense_reset_leds(struct dualsense *ds)
-{
-	struct dualsense_output_report report;
-	uint8_t *buf;
-
-	buf = kzalloc(sizeof(struct dualsense_output_report_bt), GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	dualsense_init_output_report(ds, &report, buf);
-	/*
-	 * On Bluetooth the DualSense outputs an animation on the lightbar
-	 * during startup and maintains a color afterwards. We need to explicitly
-	 * reconfigure the lightbar before we can do any programming later on.
-	 * In USB the lightbar is not on by default, but redoing the setup there
-	 * doesn't hurt.
-	 */
-	report.common->valid_flag2 = DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE;
-	report.common->lightbar_setup = DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT; /* Fade light out. */
-	dualsense_send_output_report(ds, &report);
-
-	kfree(buf);
-	return 0;
-}
-
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
@@ -1094,19 +989,6 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
-	/*
-	 * The hardware may have control over the LEDs (e.g. in Bluetooth on startup).
-	 * Reset the LEDs (lightbar, mute, player leds), so we can control them
-	 * from software.
-	 */
-	ret = dualsense_reset_leds(ds);
-	if (ret)
-		goto err;
-
-	ret = ps_lightbar_register(ps_dev, &ds->lightbar, dualsense_lightbar_set_brightness);
-	if (ret)
-		goto err;
-
 	return &ds->base;
 
 err:
-- 
2.29.2


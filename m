Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DDE31DE57
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbhBQRfR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:35:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58139 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234523AbhBQRds (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583139;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=54eTaxqhuG8tNqKX5nc9nYgPl0Sz+nMYu04XxF9V+rA=;
        b=TsNfALgxfeov4hoIRZq7i340RACANMyN4EwB8axkWWfA6wMerWOfdAmm5KrZ8Ai1mJV9zs
        7vGu3DgoN9BdxOydWzvktwwgR09DIhbrnzRaFdMEOSUE6gylHYmpQKYZhASzqpyC/h84mL
        StjVSkDmXXDbiryGaV61LDtig4u08k0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-fwMzh9K0O56Js6C0zOl5Xg-1; Wed, 17 Feb 2021 12:32:16 -0500
X-MC-Unique: fwMzh9K0O56Js6C0zOl5Xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B558A192CC42;
        Wed, 17 Feb 2021 17:32:14 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0E0BB60C61;
        Wed, 17 Feb 2021 17:32:12 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 05/11] Revert "HID: playstation: add microphone mute support for DualSense."
Date:   Wed, 17 Feb 2021 18:31:52 +0100
Message-Id: <20210217173158.3122868-6-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

This reverts commit d5f7af85a537 ("HID: playstation: add microphone
mute support for DualSense.")

There is currently an ongoing discussion on linux-leds LKML,
and so to give us more room, we need to revert those related
patches from linux-next.

This is not a big deal, they are still not pushed to Linus.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/Kconfig           |  2 -
 drivers/hid/hid-playstation.c | 99 -----------------------------------
 2 files changed, 101 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index aee51d776b4f..e7f17e78ff14 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -857,8 +857,6 @@ config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	depends on HID
 	select CRC32
-	select NEW_LEDS
-	select LEDS_CLASS
 	select LEDS_CLASS_MULTICOLOR
 	select POWER_SUPPLY
 	help
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index c436ac8f7a6f..97c1118ba78f 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -10,7 +10,6 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input/mt.h>
-#include <linux/leds.h>
 #include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 
@@ -48,12 +47,6 @@ struct ps_calibration_data {
 	int sens_denom;
 };
 
-struct ps_led_info {
-	const char *name;
-	enum led_brightness (*brightness_get)(struct led_classdev *cdev);
-	void (*brightness_set)(struct led_classdev *cdev, enum led_brightness);
-};
-
 /* Seed values for DualShock4 / DualSense CRC32 for different report types. */
 #define PS_INPUT_CRC32_SEED	0xA1
 #define PS_OUTPUT_CRC32_SEED	0xA2
@@ -89,7 +82,6 @@ struct ps_led_info {
 #define DS_BUTTONS1_R3		BIT(7)
 #define DS_BUTTONS2_PS_HOME	BIT(0)
 #define DS_BUTTONS2_TOUCHPAD	BIT(1)
-#define DS_BUTTONS2_MIC_MUTE	BIT(2)
 
 /* Status field of DualSense input report. */
 #define DS_STATUS_BATTERY_CAPACITY	GENMASK(3, 0)
@@ -108,12 +100,9 @@ struct ps_led_info {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
-#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE BIT(0)
-#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
-#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
 
 /* DualSense hardware limits */
@@ -151,12 +140,6 @@ struct dualsense {
 	uint8_t lightbar_green;
 	uint8_t lightbar_blue;
 
-	/* Microphone */
-	bool update_mic_mute;
-	bool mic_muted;
-	bool last_btn_mic_state;
-	struct led_classdev mute_led;
-
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -502,32 +485,6 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 	return 0;
 }
 
-static int ps_led_register(struct ps_device *ps_dev, struct led_classdev *led,
-		const struct ps_led_info *led_info)
-{
-	int ret;
-
-	led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
-			"playstation::%pMR::%s", ps_dev->mac_address, led_info->name);
-
-	if (!led->name)
-		return -ENOMEM;
-
-	led->brightness = 0;
-	led->max_brightness = 1;
-	led->flags = LED_CORE_SUSPENDRESUME;
-	led->brightness_get = led_info->brightness_get;
-	led->brightness_set = led_info->brightness_set;
-
-	ret = devm_led_classdev_register(&ps_dev->hdev->dev, led);
-	if (ret) {
-		hid_err(ps_dev->hdev, "Failed to register LED %s: %d\n", led_info->name, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 /* Register a DualSense/DualShock4 RGB lightbar represented by a multicolor LED. */
 static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc *lightbar_mc_dev,
 	int (*brightness_set)(struct led_classdev *, enum led_brightness))
@@ -765,19 +722,6 @@ static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
 	return 0;
 }
 
-static enum led_brightness dualsense_mute_led_get_brightness(struct led_classdev *led)
-{
-	struct dualsense *ds = container_of(led, struct dualsense, mute_led);
-
-	return ds->mic_muted;
-}
-
-/* The mute LED is treated as read-only. This set call prevents ENOTSUP errors e.g. on unload. */
-static void dualsense_mute_led_set_brightness(struct led_classdev *led, enum led_brightness value)
-{
-
-}
-
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -870,23 +814,6 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_lightbar = false;
 	}
 
-	if (ds->update_mic_mute) {
-		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
-		common->mute_button_led = ds->mic_muted;
-
-		if (ds->mic_muted) {
-			/* Disable microphone */
-			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
-			common->power_save_control |= DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
-		} else {
-			/* Enable microphone */
-			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
-			common->power_save_control &= ~DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
-		}
-
-		ds->update_mic_mute = false;
-	}
-
 	spin_unlock_irqrestore(&ds->base.lock, flags);
 
 	dualsense_send_output_report(ds, &report);
@@ -901,7 +828,6 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
 	uint32_t sensor_timestamp;
-	bool btn_mic_state;
 	unsigned long flags;
 	int i;
 
@@ -957,23 +883,6 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
-	/*
-	 * The DualSense has an internal microphone, which can be muted through a mute button
-	 * on the device. The driver is expected to read the button state and program the device
-	 * to mute/unmute audio at the hardware level.
-	 */
-	btn_mic_state = !!(ds_report->buttons[2] & DS_BUTTONS2_MIC_MUTE);
-	if (btn_mic_state && !ds->last_btn_mic_state) {
-		spin_lock_irqsave(&ps_dev->lock, flags);
-		ds->update_mic_mute = true;
-		ds->mic_muted = !ds->mic_muted; /* toggle */
-		spin_unlock_irqrestore(&ps_dev->lock, flags);
-
-		/* Schedule updating of microphone state at hardware level. */
-		schedule_work(&ds->output_worker);
-	}
-	ds->last_btn_mic_state = btn_mic_state;
-
 	/* Parse and calibrate gyroscope data. */
 	for (i = 0; i < ARRAY_SIZE(ds_report->gyro); i++) {
 		int raw_data = (short)le16_to_cpu(ds_report->gyro[i]);
@@ -1121,10 +1030,6 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	uint8_t max_output_report_size;
 	int ret;
 
-	static const struct ps_led_info mute_led_info = {
-		"micmute", dualsense_mute_led_get_brightness, dualsense_mute_led_set_brightness
-	};
-
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
 	if (!ds)
 		return ERR_PTR(-ENOMEM);
@@ -1202,10 +1107,6 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
-	ret = ps_led_register(ps_dev, &ds->mute_led, &mute_led_info);
-	if (ret)
-		goto err;
-
 	return &ds->base;
 
 err:
-- 
2.29.2


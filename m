Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0242E8904
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbhABWc6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbhABWc4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:56 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDB4C0617A1
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:43 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id m6so14062082pfm.6
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yMI68uMciSYYmLeg0brYozbyH0Xy76HjSxb4i7CQueE=;
        b=esxYob6yTWhseJCzZFw4lz91uvb5oDGKhjRsa66rMtJ5ujtn8DUhJx4EFW8wlEAGP8
         YNJ8u6u4CPnFyTyiJpSuqoDM3lG3BiYlxw9jniv9y01KkWAJfgxWCtkfajf7xwHg5/yY
         nvxHwrvxg5PWgGtJwXv4WkyuhHWwIQkD89nbQl9zmGo4JRv7kSYyQsUgIsWD0YU48oCC
         Oq+PmRZrrbjV6fMoAS4TOj3Q6lMj6UOsIBYRvK8jdsHmPtAXck6QFWJpmuxYT8/EUj2T
         jc9Jc8670BSyzEoYhtXeJWiJWeSamqYeHYYOqP7AZp8uRfuz4/jJZ+9+mij1Ph5GgoXY
         tqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yMI68uMciSYYmLeg0brYozbyH0Xy76HjSxb4i7CQueE=;
        b=OLDXOpchhdROllPSRWv2hWVb6Wg1QPSogxC4trcpoyhKKq6rb46W/kNHcoPDYHccmz
         S2s1x9niLEqE6E/nm4Uz5Il3H1tLW9WCxLco9G+ihxeenToaAvATQE1rSEOe/VH5ltWn
         XEWoAJqSBdJROhSN0hc3jLyVhthoFy2mG9Pa1z3iX0MtFBrXOUg0ShgK0I33Pwspcro5
         jpLmflHD9JICd5CrSzeBvC3iqYNMsjpqWc4UJqQHUHD97z4lw8F1f1Sqe/XQBSl9staW
         b+/huwjn1t/MZgY7T4mSOdavcs7ZZXJ0sdV0VlDbdMajMx2+7L8dxE1JlvJGyyzcoBn8
         7PyA==
X-Gm-Message-State: AOAM532pH5hltIlbqcBP4UeArLLIvvNm00HRPNKK77F1OxwE4vMgPI0d
        wX1i03FEXjTPAklelE+0rsOHTA==
X-Google-Smtp-Source: ABdhPJxE0/LT4GTluc3wk4MP4W8GwW7xVpPt5rwdFcjyzOAdUcYOpM/Eapaz5il1KEOef5bBJ04weA==
X-Received: by 2002:a62:784f:0:b029:1a8:cbc:52d1 with SMTP id t76-20020a62784f0000b02901a80cbc52d1mr59149160pfc.26.1609626703421;
        Sat, 02 Jan 2021 14:31:43 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:43 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 10/13] HID: playstation: add microphone mute support for DualSense.
Date:   Sat,  2 Jan 2021 14:31:06 -0800
Message-Id: <20210102223109.996781-11-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210102223109.996781-1-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense controller has a built-in microphone exposed as an
audio device over USB (or HID using Bluetooth). A dedicated
button on the controller handles mute, but software has to configure
the device to mute the audio stream.

This patch captures the mute button and schedules an output report
to mute/unmute the audio stream as well as toggle the mute LED.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/Kconfig           |   1 +
 drivers/hid/hid-playstation.c | 102 ++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index c80c81916f4a..9b1803f8f935 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -857,6 +857,7 @@ config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	default !EXPERT
 	depends on HID
+	select LEDS_CLASS
 	select LEDS_CLASS_MULTICOLOR
 	select POWER_SUPPLY
 	help
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 3b26445acbb9..ebf8a6550308 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input/mt.h>
+#include <linux/leds.h>
 #include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 
@@ -47,6 +48,12 @@ struct ps_calibration_data {
 	int sens_denom;
 };
 
+struct ps_led_info {
+	const char *name;
+	enum led_brightness (*brightness_get)(struct led_classdev *cdev);
+	void (*brightness_set)(struct led_classdev *cdev, enum led_brightness);
+};
+
 #define DS_INPUT_REPORT_USB			0x01
 #define DS_INPUT_REPORT_BT			0x31
 #define DS_OUTPUT_REPORT_USB			0x02
@@ -73,6 +80,7 @@ struct ps_calibration_data {
 #define DS_BUTTONS1_R3		BIT(7)
 #define DS_BUTTONS2_PS_HOME	BIT(0)
 #define DS_BUTTONS2_TOUCHPAD	BIT(1)
+#define DS_BUTTONS2_MIC_MUTE	BIT(2)
 
 /* Status field of DualSense input report. */
 #define DS_STATUS_BATTERY_CAPACITY	GENMASK(3, 0)
@@ -88,9 +96,12 @@ struct ps_calibration_data {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE BIT(0)
+#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
+#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
 
 /* DualSense hardware limits */
@@ -128,6 +139,12 @@ struct dualsense {
 	uint8_t lightbar_green;
 	uint8_t lightbar_blue;
 
+	/* Microphone */
+	bool update_mic_mute;
+	bool mic_muted;
+	bool last_btn_mic_state;
+	struct led_classdev mute_led;
+
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -419,6 +436,32 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
 	return gamepad;
 }
 
+static int ps_led_register(struct ps_device *ps_dev, struct led_classdev *led,
+		struct ps_led_info *led_info)
+{
+	int ret;
+
+	led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
+			"playstation::%pMR::%s", ps_dev->mac_address, led_info->name);
+
+	if (!led->name)
+		return -ENOMEM;
+
+	led->brightness = 0;
+	led->max_brightness = 1;
+	led->flags = LED_CORE_SUSPENDRESUME;
+	led->brightness_get = led_info->brightness_get;
+	led->brightness_set = led_info->brightness_set;
+
+	ret = devm_led_classdev_register(&ps_dev->hdev->dev, led);
+	if (ret) {
+		hid_err(ps_dev->hdev, "Failed to register LED %s: %d\n", led_info->name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /* Register a DualSense/DualShock4 RGB lightbar represented by a multicolor LED. */
 static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc *lightbar_mc_dev,
 	int (*brightness_set)(struct led_classdev *, enum led_brightness))
@@ -673,6 +716,20 @@ static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
 	return 0;
 }
 
+static enum led_brightness dualsense_mute_led_get_brightness(struct led_classdev *led)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualsense *ds = hid_get_drvdata(hdev);
+
+	return ds->mic_muted;
+}
+
+/* The mute LED is treated as read-only. This set call prevents ENOTSUP errors e.g. on unload. */
+static void dualsense_mute_led_set_brightness(struct led_classdev *led, enum led_brightness value)
+{
+
+}
+
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -763,6 +820,26 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_lightbar = false;
 	}
 
+	if (ds->update_mic_mute) {
+		if (ds->mic_muted) {
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
+			common->mute_button_led = 1; /* Enable mute LED. */
+
+			/* Disable microphone */
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
+			common->power_save_control |= DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
+		} else {
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
+			common->mute_button_led = 0; /* Disable mute LED. */
+
+			/* Enable microphone */
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
+			common->power_save_control &= ~DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
+		}
+
+		ds->update_mic_mute = false;
+	}
+
 	spin_unlock_irqrestore(&ds->base.lock, flags);
 
 	dualsense_send_output_report(ds, &report);
@@ -777,6 +854,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
 	uint16_t sensor_timestamp;
+	bool btn_mic_state;
 	unsigned long flags;
 	int i;
 
@@ -829,6 +907,22 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
+	/* The DualSense has an internal microphone, which can be muted through a mute button
+	 * on the device. The driver expected to read the button state and program the device
+	 * to mute/unmute audio at the hardware level.
+	 */
+	btn_mic_state = !!(ds_report->buttons[2] & DS_BUTTONS2_MIC_MUTE);
+	if (btn_mic_state && !ds->last_btn_mic_state) {
+		spin_lock_irqsave(&ps_dev->lock, flags);
+		ds->update_mic_mute = true;
+		ds->mic_muted = !ds->mic_muted; /* toggle */
+		spin_unlock_irqrestore(&ps_dev->lock, flags);
+
+		/* Schedule updating of microphone state at hardware level. */
+		schedule_work(&ds->output_worker);
+	}
+	ds->last_btn_mic_state = btn_mic_state;
+
 	/* Parse and calibrate gyroscope data. */
 	for (i = 0; i < 3; i++) {
 		int raw_data = (short)le16_to_cpu(ds_report->gyro[i]);
@@ -973,6 +1067,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	uint8_t max_output_report_size;
 	int ret;
 
+	struct ps_led_info mute_led_info = {
+		"micmute", dualsense_mute_led_get_brightness, dualsense_mute_led_set_brightness
+	};
+
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
 	if (!ds)
 		return ERR_PTR(-ENOMEM);
@@ -1047,6 +1145,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret < 0)
 		goto err;
 
+	ret = ps_led_register(ps_dev, &ds->mute_led, &mute_led_info);
+	if (ret < 0)
+		goto err;
+
 	return &ds->base;
 
 err:
-- 
2.26.2


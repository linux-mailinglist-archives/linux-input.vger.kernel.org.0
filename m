Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E822DED7C
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgLSGZD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:25:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgLSGZD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:25:03 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13E2C0611CD
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:50 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id x126so2856742pfc.7
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WEi9kQM3S7EVMpWSeosqz4eMuHi/cwFOcMB7rIiddYA=;
        b=oGl1Cf2LrIpVhRCXlZulqVzywdwKCwmya+tA4JfRaOotM2hEql40JyddukPV1Wvfkx
         nML+zt382r4mbC28yCRyclUR/HfaX21ovf8rry3s7j5oM/iA59iXohXarKmvH+BdpRjJ
         yith7NB069lucfKipNzyGYWXOSRjuT4MkoijPSXZXvgCEjrfymQoWxG0kWneaKUrbF5E
         zQvSwWQ7XlwAsHOdEhEF275G7pwP9gWm+IMqrEVGAwxutqBJRLFCkqR4lvUgWywDt5Ut
         Zd9kPE4Mg7ySNyTC8lO07VJmzRuA0DzDqWhXgA7TSdtMqlJ9Mfai8u+6Gj2eEcHLu3A8
         MMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WEi9kQM3S7EVMpWSeosqz4eMuHi/cwFOcMB7rIiddYA=;
        b=YyX2BvCiJyTkR0wnClbAxtJejD1Z2dga+YZvIxZW/ofoIcdZrUtPh43kd6LoprG52p
         e6UcMjtte/BuAZxbV1gcpzzOoVfmJOsG4oZjUKpom6j14akdPdM4+ReBRarI9w9c7jfs
         JiEHbAhDJszeqCgndy371kB7AsF/VYlCL9+msjFmgHMnYMAMD8mmorvPoJyw9kvaE49V
         rgzmDa6Xw4FanRRyBtNpBLaAM7BlvEwJIsfXSUiYZ6K25mik/G7s8I+kxftm8enRoLQT
         4zcmCy4yEOWOK2CLnVTfBivHpu8J15cthER/6xUXeYGLjydn3a+r7HfjYqxtRtoIcH2N
         0QEQ==
X-Gm-Message-State: AOAM530stt86Aq5X39tyjClk/VQMhs3qXPv313zUxZmyQO9Aw5SP4MM6
        1CGhrWSeqzaqGOXbNJeZPE8EwQ==
X-Google-Smtp-Source: ABdhPJwGCz+fOerneBuIU33bGJsw7Oa3WJBb7VX+r6UERfAm4X8IEQy2eAXJq+tIhSEycc9EGqmvOQ==
X-Received: by 2002:a63:af50:: with SMTP id s16mr7317655pgo.448.1608359030430;
        Fri, 18 Dec 2020 22:23:50 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:50 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 10/13] HID: playstation: add microphone mute support for DualSense.
Date:   Fri, 18 Dec 2020 22:23:33 -0800
Message-Id: <20201219062336.72568-11-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
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
 drivers/hid/Kconfig           |  1 +
 drivers/hid/hid-playstation.c | 94 +++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

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
index f8cf82a27d43..ad8eedd3d2bf 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input/mt.h>
+#include <linux/leds.h>
 #include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 #include <linux/crc32.h>
@@ -43,6 +44,12 @@ struct ps_calibration_data {
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
@@ -69,6 +76,7 @@ struct ps_calibration_data {
 #define DS_BUTTONS1_R3		BIT(7)
 #define DS_BUTTONS2_PS_HOME	BIT(0)
 #define DS_BUTTONS2_TOUCHPAD	BIT(1)
+#define DS_BUTTONS2_MIC_MUTE	BIT(2)
 
 /* Status field of DualSense input report. */
 #define DS_STATUS_BATTERY_CAPACITY	GENMASK(3, 0)
@@ -78,9 +86,12 @@ struct ps_calibration_data {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE BIT(0)
+#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
+#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
@@ -117,6 +128,12 @@ struct dualsense {
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
@@ -407,6 +424,32 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
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
 /* Create a DualSense/DualShock4 RGB lightbar represented by a multicolor LED. */
 static struct led_classdev_mc *ps_lightbar_create(struct ps_device *ps_dev,
 	int (*brightness_set)(struct led_classdev *, enum led_brightness))
@@ -656,6 +699,14 @@ static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
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
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -746,6 +797,26 @@ static void dualsense_output_worker(struct work_struct *work)
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
@@ -760,6 +831,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
 	uint16_t sensor_timestamp;
+	bool btn_mic_state;
 	unsigned long flags;
 	int i;
 
@@ -812,6 +884,22 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
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
@@ -956,6 +1044,8 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	uint8_t max_output_report_size;
 	int ret;
 
+	struct ps_led_info mute_led_info = { "micmute", dualsense_mute_led_get_brightness, NULL };
+
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
 	if (!ds)
 		return ERR_PTR(-ENOMEM);
@@ -1032,6 +1122,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ret = ps_led_register((struct ps_device *)ds, &ds->mute_led, &mute_led_info);
+	if (ret < 0)
+		goto err;
+
 	return (struct ps_device *)ds;
 
 err:
-- 
2.26.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55AE72DED79
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgLSGZD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:25:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgLSGZC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:25:02 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AABC0611CB
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:48 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2so2859311pfq.5
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9lT5scLGyh2dEgzLhWtqiKwGu+/Z3LJGXWpAE0KPOzQ=;
        b=E/ySPbktENxk9NIOEh8HPP4OlDFKmdDrJ/yELwb2QtcMb2OX9Nfm9Du6332qmr/gd1
         38ZfZy0SNJhZ22LD6Woe6JSS4hbZFHpQFVeya2y5ANtuut1dX6tc1YqsomzyVt1z7z2U
         eTv4LLW1VHlam4WTflDNJa1rBhExk4UTb5d/vNp33tTSA3r1jZl3uS/nmHwXd0ki6/Kg
         dj2TVv+HZCQVGlLVkoOeAGhx7NhFyazNCMopqOXCDVkqMjOQm+D3G9fRICtmOxMdejwq
         ojjADPPlrpavkP24LNwkvHMVQ3qyO8FK9jzYUUBDpGXto0hNQX3+tVZSuAvCF1wlWCE5
         ZsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9lT5scLGyh2dEgzLhWtqiKwGu+/Z3LJGXWpAE0KPOzQ=;
        b=aYthKi5hDu/1X3u00qm6pau7ORNhqiISge1mGd8FqSpsFYW8hUV6L4Aes9ovpq7r1a
         W6wdHL1RIMa55iKWXId/IMSIIgNx5JHTRi4IPlGZFm3B0ZWte9wobyqwgFhVFnWxZ3sL
         mhws5bd5v5T0QTsj6W1gW7G0UCb5+QW5me/DBYGhLiz6XefHm9ncLcOUiCrXBBmgwwEi
         oonHWUoIzIwes2fBgHjOCmxJtQdRRDdaxpezSg2hYuHukB2pV5bEFlQYn9TFHKtpVGKX
         cjFNwNp7MYm1co0Dkf2vTHK5Vc3JlsTS+R8Ql+FojAeHxKzx6CmOg5JmFVZQVVeecH0s
         cGTA==
X-Gm-Message-State: AOAM530KuLAxSs/p1ApatS13HGJyZE2V9sVn5EuQ3c9nmvh7jm2piHqB
        P2mzeZyEFnWzilZnk6z7tEEXqA==
X-Google-Smtp-Source: ABdhPJw8LLNumrNdRvZgg/JXa7l184yLd//qzYvAjYSNATdL/48xYch239HohVzDG+T4bbySi8+0Fg==
X-Received: by 2002:a63:5856:: with SMTP id i22mr7133698pgm.349.1608359028427;
        Fri, 18 Dec 2020 22:23:48 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:48 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 08/13] HID: playstation: add DualSense classic rumble support.
Date:   Fri, 18 Dec 2020 22:23:31 -0800
Message-Id: <20201219062336.72568-9-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense features a haptics system based on voicecoil motors,
which requires PCM data (or special HID packets using Bluetooth). There
is no appropriate API yet in the Linux kernel to expose these. The
controller also provides a classic rumble feature for backwards
compatibility. Expose this classic rumble feature using the FF framework.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/Kconfig           |   8 ++
 drivers/hid/hid-playstation.c | 196 +++++++++++++++++++++++++++++++++-
 2 files changed, 202 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index ef175c1cb15c..e6c67aaa1a1a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -863,6 +863,14 @@ config HID_PLAYSTATION
 	  its special functionalities e.g. touchpad, lights and motion
 	  sensors.
 
+config PLAYSTATION_FF
+	bool "PlayStation force feedback support"
+	depends on HID_PLAYSTATION
+	select INPUT_FF_MEMLESS
+	help
+	  Say Y here if you would like to enable force feedback support for
+	  PlayStation game controllers.
+
 config HID_PRIMAX
 	tristate "Primax non-fully HID-compliant devices"
 	depends on HID
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 042fa8d2627d..0b62bcb28d8a 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -44,6 +44,8 @@ struct ps_calibration_data {
 
 #define DS_INPUT_REPORT_USB			0x01
 #define DS_INPUT_REPORT_BT			0x31
+#define DS_OUTPUT_REPORT_USB			0x02
+#define DS_OUTPUT_REPORT_BT			0x31
 
 #define DS_FEATURE_REPORT_CALIBRATION		5
 #define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
@@ -72,6 +74,10 @@ struct ps_calibration_data {
 #define DS_STATUS_CHARGING		GENMASK(7, 4)
 #define DS_STATUS_CHARGING_SHIFT	4
 
+/* Flags for DualSense output report. */
+#define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
+#define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
+
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
 #define DS_ACC_RANGE		(4*DS_ACC_RES_PER_G)
@@ -94,6 +100,15 @@ struct dualsense {
 	bool sensor_timestamp_initialized;
 	uint32_t prev_sensor_timestamp;
 	uint32_t sensor_timestamp_us;
+
+	/* Compatible rumble state */
+	bool update_rumble;
+	uint8_t motor_left;
+	uint8_t motor_right;
+
+	struct work_struct output_worker;
+	void *output_report_dmabuf;
+	uint8_t output_seq; /* Sequence number for output report. */
 };
 
 struct dualsense_touch_point {
@@ -126,6 +141,63 @@ struct dualsense_input_report {
 	uint8_t reserved4[11];
 } __packed;
 
+/* Common data between DualSense BT/USB main output report. */
+struct dualsense_output_report_common {
+	uint8_t valid_flag0;
+	uint8_t valid_flag1;
+
+	/* For DualShock 4 compatibility mode. */
+	uint8_t motor_right;
+	uint8_t motor_left;
+
+	/* Audio controls */
+	uint8_t reserved[4];
+	uint8_t mute_button_led;
+
+	uint8_t power_save_control;
+	uint8_t reserved2[28];
+
+	/* LEDs and lightbar */
+	uint8_t valid_flag2;
+	uint8_t reserved3[2];
+	uint8_t lightbar_setup;
+	uint8_t led_brightness;
+	uint8_t player_leds;
+	uint8_t lightbar_red;
+	uint8_t lightbar_green;
+	uint8_t lightbar_blue;
+} __packed;
+
+struct dualsense_output_report_bt {
+	uint8_t report_id; /* 0x31 */
+	uint8_t seq_tag;
+	uint8_t tag;
+	struct dualsense_output_report_common common;
+	uint8_t reserved[24];
+	__le32 crc32;
+} __packed;
+
+struct dualsense_output_report_usb {
+	uint8_t report_id; /* 0x02 */
+	struct dualsense_output_report_common common;
+} __packed;
+
+/* The DualSense has a main output report used to control most features. It is
+ * largely the same between Bluetooth and USB except for different headers and CRC.
+ * This structure hide the differences between the two to simplify sending output reports.
+ */
+struct dualsense_output_report {
+	uint8_t *data; /* Start of data */
+	uint8_t len; /* Size of output report */
+
+	/* Points to Bluetooth data payload in case for a Bluetooth report else NULL. */
+	struct dualsense_output_report_bt *bt;
+	/* Points to USB data payload in case for a USB report else NULL. */
+	struct dualsense_output_report_usb *usb;
+	/* Points to common section of report, so past any headers */
+	struct dualsense_output_report_common *common;
+};
+
 /* Common gamepad buttons across DualShock 3 / 4 and DualSense.
  * Note: for device with a touchpad, touchpad button is not included
  *        as it will be part of the touchpad device.
@@ -286,7 +358,8 @@ static bool ps_check_crc32(uint8_t seed, uint8_t *data, size_t len, uint32_t rep
 	return crc == report_crc;
 }
 
-static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
+static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
+		int (*play_effect)(struct input_dev *, void *, struct ff_effect *))
 {
 	struct input_dev *gamepad;
 	unsigned int i;
@@ -309,6 +382,13 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 	for (i = 0; i < ARRAY_SIZE(ps_gamepad_buttons); i++)
 		input_set_capability(gamepad, EV_KEY, ps_gamepad_buttons[i]);
 
+#if IS_ENABLED(CONFIG_PLAYSTATION_FF)
+	if (play_effect) {
+		input_set_capability(gamepad, EV_FF, FF_RUMBLE);
+		input_ff_create_memless(gamepad, NULL, play_effect);
+	}
+#endif
+
 	ret = input_register_device(gamepad);
 	if (ret)
 		return ERR_PTR(ret);
@@ -500,6 +580,92 @@ static int dualsense_get_mac_address(struct dualsense *ds)
 	return ret;
 }
 
+static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
+		void *buf)
+{
+	struct hid_device *hdev = ds->base.hdev;
+
+	if (hdev->bus == BUS_BLUETOOTH) {
+		struct dualsense_output_report_bt *bt = buf;
+
+		memset(bt, 0, sizeof(*bt));
+		bt->report_id = DS_OUTPUT_REPORT_BT;
+		bt->tag = 0x10; /* Magic number must be set to 0x10 */
+
+		/* Highest 4-bit is a sequence number, which needs to be increased
+		 * every report. Lowest 4-bit is tag and can be zero for now.
+		 */
+		bt->seq_tag = (ds->output_seq << 4) | 0x0;
+		if (++ds->output_seq == 15)
+			ds->output_seq = 0;
+
+		rp->data = buf;
+		rp->len = sizeof(*bt);
+		rp->bt = bt;
+		rp->usb = NULL;
+		rp->common = &bt->common;
+	} else { /* USB */
+		struct dualsense_output_report_usb *usb = buf;
+
+		memset(usb, 0, sizeof(*usb));
+		usb->report_id = DS_OUTPUT_REPORT_USB;
+
+		rp->data = buf;
+		rp->len = sizeof(*usb);
+		rp->bt = NULL;
+		rp->usb = usb;
+		rp->common = &usb->common;
+	}
+}
+
+/* Helper function to send DualSense output reports. Applies a CRC at the end of a report
+ * for Bluetooth reports.
+ */
+static void dualsense_send_output_report(struct dualsense *ds,
+		struct dualsense_output_report *report)
+{
+	struct hid_device *hdev = ds->base.hdev;
+
+	/* Bluetooth packets need to be signed with a CRC in the last 4 bytes. */
+	if (report->bt) {
+		uint32_t crc;
+		uint8_t seed = 0xA2;
+
+		crc = crc32_le(0xFFFFFFFF, &seed, 1);
+		crc = ~crc32_le(crc, report->data, report->len - 4);
+
+		report->bt->crc32 = cpu_to_le32(crc);
+	}
+
+	hid_hw_output_report(hdev, report->data, report->len);
+}
+
+static void dualsense_output_worker(struct work_struct *work)
+{
+	struct dualsense *ds = container_of(work, struct dualsense, output_worker);
+	struct dualsense_output_report report;
+	struct dualsense_output_report_common *common;
+	unsigned long flags;
+
+	dualsense_init_output_report(ds, &report, ds->output_report_dmabuf);
+	common = report.common;
+
+	spin_lock_irqsave(&ds->base.lock, flags);
+
+	if (ds->update_rumble) {
+		/* Select classic rumble style haptics and enable it. */
+		common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT;
+		common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION;
+		common->motor_left = ds->motor_left;
+		common->motor_right = ds->motor_right;
+		ds->update_rumble = false;
+	}
+
+	spin_unlock_irqrestore(&ds->base.lock, flags);
+
+	dualsense_send_output_report(ds, &report);
+}
+
 static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *report,
 		u8 *data, int size)
 {
@@ -656,9 +822,29 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	return 0;
 }
 
+static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_effect *effect)
+{
+	struct hid_device *hdev = input_get_drvdata(dev);
+	struct dualsense *ds = hid_get_drvdata(hdev);
+	unsigned long flags;
+
+	if (effect->type != FF_RUMBLE)
+		return 0;
+
+	spin_lock_irqsave(&ds->base.lock, flags);
+	ds->update_rumble = true;
+	ds->motor_left = effect->u.rumble.strong_magnitude / 256;
+	ds->motor_right = effect->u.rumble.weak_magnitude / 256;
+	spin_unlock_irqrestore(&ds->base.lock, flags);
+
+	schedule_work(&ds->output_worker);
+	return 0;
+}
+
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
+	uint8_t max_output_report_size;
 	int ret;
 
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
@@ -674,8 +860,14 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	ds->base.battery_capacity = 100; /* initial value until parse_report. */
 	ds->base.battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
 	ds->base.parse_report = dualsense_parse_report;
+	INIT_WORK(&ds->output_worker, dualsense_output_worker);
 	hid_set_drvdata(hdev, ds);
 
+	max_output_report_size = sizeof(struct dualsense_output_report_bt);
+	ds->output_report_dmabuf = devm_kzalloc(&hdev->dev, max_output_report_size, GFP_KERNEL);
+	if (!ds->output_report_dmabuf)
+		return ERR_PTR(-ENOMEM);
+
 	ret = dualsense_get_mac_address(ds);
 	if (ret < 0) {
 		hid_err(hdev, "Failed to get MAC address from DualSense\n");
@@ -693,7 +885,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
-	ds->gamepad = ps_gamepad_create(hdev);
+	ds->gamepad = ps_gamepad_create(hdev, dualsense_play_effect);
 	if (IS_ERR(ds->gamepad)) {
 		ret = PTR_ERR(ds->gamepad);
 		goto err;
-- 
2.26.2


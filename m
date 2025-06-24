Return-Path: <linux-input+bounces-13020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D75AE71D4
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBBFB1BC0F4E
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0FE25B1F9;
	Tue, 24 Jun 2025 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c2vA106L"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44325B1D8;
	Tue, 24 Jun 2025 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802256; cv=none; b=mz6YbZB9UJMfcEa0IyUe1Yv6ieYYQ42/kELV064EHjYts2ZB3FPI4z/WkNWd79QV4bkxJOlrvG78bqEsPeCnPv9r+fgsbt9jcBCuEcnSEmbBxjCpdy3wHMtbXk4oEFnrD7Poh57hgpjJ3sZ+cI2mmiwMVOyMPZzab5aFZP6LX0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802256; c=relaxed/simple;
	bh=UDoL9zS9wMcIHFN7/gaEbg0xGw1plofD64BIHJOFYao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHU3gWZ16hEp8Bte6Rq+SyFeqIMwLA56h0gM1yBGzPasCIJVVJv8eUhBf6TyfzZUfJBeq7A58qG99JO3gdzizPG7l4FdZKBzDNIPiHNI3f+v51d1svmZWwV2qqZf781tHnhC3YnTPJtEeGQSnP0146NzTy/aY35r9LHlHS83lSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c2vA106L; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802252;
	bh=UDoL9zS9wMcIHFN7/gaEbg0xGw1plofD64BIHJOFYao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c2vA106L8MQ1spsF8l5XPY8uuZVXlFCOmw/pMpdqB/N0wy3yha+FMFMmpt63/lDC/
	 jz6Zj4RZLWlQjfHQ8LIWlRpKOLzDmvPVfVC9cQdSwhUa3Iiz8Un/h9y8D3nmnWVZ2/
	 +ndsihwp4KHpi9iNC39lwGW7rlrG7lrHhhUn0ikMwskf5y2M7cXOks08OjIgDjAjZ0
	 Ed3uRKRrf2xuLmgU/gi/GAtepIrh2NcqIwHk4Hm5Xk0dQ0qd7l6sVCI6aEWFIA/UVm
	 Eq1Z90z3bA0EvurPdBvvBNT/XhPuYEMWl1zymbuivefoUFK5EPmsK+CZQccwC7eWcJ
	 xxoZlQHdm1uBA==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1DF0317E05BD;
	Tue, 24 Jun 2025 23:57:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:48 +0300
Subject: [PATCH v2 04/11] HID: playstation: Replace uint{32,16,8}_t with
 u{32,16,8}
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-4-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

And get rid of the following checkpatch.pl complaints:

  CHECK: Prefer kernel type 'u32' over 'uint32_t'
  CHECK: Prefer kernel type 'u16' over 'uint16_t'
  CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 272 +++++++++++++++++++++---------------------
 1 file changed, 136 insertions(+), 136 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index ab3a0c505c4db9110ae4d528ba70b32d9f90b81b..78d28a0eb697ecb3d0ad7601c89383b67f9a53d8 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -40,17 +40,17 @@ struct ps_device {
 	struct hid_device *hdev;
 	spinlock_t lock;
 
-	uint32_t player_id;
+	u32 player_id;
 
 	struct power_supply_desc battery_desc;
 	struct power_supply *battery;
-	uint8_t battery_capacity;
+	u8 battery_capacity;
 	int battery_status;
 
 	const char *input_dev_name; /* Name of primary input device. */
-	uint8_t mac_address[6]; /* Note: stored in little endian order. */
-	uint32_t hw_version;
-	uint32_t fw_version;
+	u8 mac_address[6]; /* Note: stored in little endian order. */
+	u32 hw_version;
+	u32 fw_version;
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 	void (*remove)(struct ps_device *dev);
@@ -168,7 +168,7 @@ struct dualsense {
 	struct input_dev *touchpad;
 
 	/* Update version is used as a feature/capability version. */
-	uint16_t update_version;
+	u16 update_version;
 
 	/* Calibration data for accelerometer and gyroscope. */
 	struct ps_calibration_data accel_calib_data[3];
@@ -176,21 +176,21 @@ struct dualsense {
 
 	/* Timestamp for sensor data */
 	bool sensor_timestamp_initialized;
-	uint32_t prev_sensor_timestamp;
-	uint32_t sensor_timestamp_us;
+	u32 prev_sensor_timestamp;
+	u32 sensor_timestamp_us;
 
 	/* Compatible rumble state */
 	bool use_vibration_v2;
 	bool update_rumble;
-	uint8_t motor_left;
-	uint8_t motor_right;
+	u8 motor_left;
+	u8 motor_right;
 
 	/* RGB lightbar */
 	struct led_classdev_mc lightbar;
 	bool update_lightbar;
-	uint8_t lightbar_red;
-	uint8_t lightbar_green;
-	uint8_t lightbar_blue;
+	u8 lightbar_red;
+	u8 lightbar_green;
+	u8 lightbar_blue;
 
 	/* Microphone */
 	bool update_mic_mute;
@@ -199,90 +199,90 @@ struct dualsense {
 
 	/* Player leds */
 	bool update_player_leds;
-	uint8_t player_leds_state;
+	u8 player_leds_state;
 	struct led_classdev player_leds[5];
 
 	struct work_struct output_worker;
 	bool output_worker_initialized;
 	void *output_report_dmabuf;
-	uint8_t output_seq; /* Sequence number for output report. */
+	u8 output_seq; /* Sequence number for output report. */
 };
 
 struct dualsense_touch_point {
-	uint8_t contact;
-	uint8_t x_lo;
-	uint8_t x_hi:4, y_lo:4;
-	uint8_t y_hi;
+	u8 contact;
+	u8 x_lo;
+	u8 x_hi:4, y_lo:4;
+	u8 y_hi;
 } __packed;
 static_assert(sizeof(struct dualsense_touch_point) == 4);
 
 /* Main DualSense input report excluding any BT/USB specific headers. */
 struct dualsense_input_report {
-	uint8_t x, y;
-	uint8_t rx, ry;
-	uint8_t z, rz;
-	uint8_t seq_number;
-	uint8_t buttons[4];
-	uint8_t reserved[4];
+	u8 x, y;
+	u8 rx, ry;
+	u8 z, rz;
+	u8 seq_number;
+	u8 buttons[4];
+	u8 reserved[4];
 
 	/* Motion sensors */
 	__le16 gyro[3]; /* x, y, z */
 	__le16 accel[3]; /* x, y, z */
 	__le32 sensor_timestamp;
-	uint8_t reserved2;
+	u8 reserved2;
 
 	/* Touchpad */
 	struct dualsense_touch_point points[2];
 
-	uint8_t reserved3[12];
-	uint8_t status;
-	uint8_t reserved4[10];
+	u8 reserved3[12];
+	u8 status;
+	u8 reserved4[10];
 } __packed;
 /* Common input report size shared equals the size of the USB report minus 1 byte for ReportID. */
 static_assert(sizeof(struct dualsense_input_report) == DS_INPUT_REPORT_USB_SIZE - 1);
 
 /* Common data between DualSense BT/USB main output report. */
 struct dualsense_output_report_common {
-	uint8_t valid_flag0;
-	uint8_t valid_flag1;
+	u8 valid_flag0;
+	u8 valid_flag1;
 
 	/* For DualShock 4 compatibility mode. */
-	uint8_t motor_right;
-	uint8_t motor_left;
+	u8 motor_right;
+	u8 motor_left;
 
 	/* Audio controls */
-	uint8_t reserved[4];
-	uint8_t mute_button_led;
+	u8 reserved[4];
+	u8 mute_button_led;
 
-	uint8_t power_save_control;
-	uint8_t reserved2[28];
+	u8 power_save_control;
+	u8 reserved2[28];
 
 	/* LEDs and lightbar */
-	uint8_t valid_flag2;
-	uint8_t reserved3[2];
-	uint8_t lightbar_setup;
-	uint8_t led_brightness;
-	uint8_t player_leds;
-	uint8_t lightbar_red;
-	uint8_t lightbar_green;
-	uint8_t lightbar_blue;
+	u8 valid_flag2;
+	u8 reserved3[2];
+	u8 lightbar_setup;
+	u8 led_brightness;
+	u8 player_leds;
+	u8 lightbar_red;
+	u8 lightbar_green;
+	u8 lightbar_blue;
 } __packed;
 static_assert(sizeof(struct dualsense_output_report_common) == 47);
 
 struct dualsense_output_report_bt {
-	uint8_t report_id; /* 0x31 */
-	uint8_t seq_tag;
-	uint8_t tag;
+	u8 report_id; /* 0x31 */
+	u8 seq_tag;
+	u8 tag;
 	struct dualsense_output_report_common common;
-	uint8_t reserved[24];
+	u8 reserved[24];
 	__le32 crc32;
 } __packed;
 static_assert(sizeof(struct dualsense_output_report_bt) == DS_OUTPUT_REPORT_BT_SIZE);
 
 struct dualsense_output_report_usb {
-	uint8_t report_id; /* 0x02 */
+	u8 report_id; /* 0x02 */
 	struct dualsense_output_report_common common;
-	uint8_t reserved[15];
+	u8 reserved[15];
 } __packed;
 static_assert(sizeof(struct dualsense_output_report_usb) == DS_OUTPUT_REPORT_USB_SIZE);
 
@@ -292,8 +292,8 @@ static_assert(sizeof(struct dualsense_output_report_usb) == DS_OUTPUT_REPORT_USB
  * This structure hide the differences between the two to simplify sending output reports.
  */
 struct dualsense_output_report {
-	uint8_t *data; /* Start of data */
-	uint8_t len; /* Size of output report */
+	u8 *data; /* Start of data */
+	u8 len; /* Size of output report */
 
 	/* Points to Bluetooth data payload in case for a Bluetooth report else NULL. */
 	struct dualsense_output_report_bt *bt;
@@ -395,26 +395,26 @@ struct dualshock4 {
 
 	/* Timestamp for sensor data */
 	bool sensor_timestamp_initialized;
-	uint32_t prev_sensor_timestamp;
-	uint32_t sensor_timestamp_us;
+	u32 prev_sensor_timestamp;
+	u32 sensor_timestamp_us;
 
 	/* Bluetooth poll interval */
 	bool update_bt_poll_interval;
-	uint8_t bt_poll_interval;
+	u8 bt_poll_interval;
 
 	bool update_rumble;
-	uint8_t motor_left;
-	uint8_t motor_right;
+	u8 motor_left;
+	u8 motor_right;
 
 	/* Lightbar leds */
 	bool update_lightbar;
 	bool update_lightbar_blink;
 	bool lightbar_enabled; /* For use by global LED control. */
-	uint8_t lightbar_red;
-	uint8_t lightbar_green;
-	uint8_t lightbar_blue;
-	uint8_t lightbar_blink_on; /* In increments of 10ms. */
-	uint8_t lightbar_blink_off; /* In increments of 10ms. */
+	u8 lightbar_red;
+	u8 lightbar_green;
+	u8 lightbar_blue;
+	u8 lightbar_blink_on; /* In increments of 10ms. */
+	u8 lightbar_blink_off; /* In increments of 10ms. */
 	struct led_classdev lightbar_leds[4];
 
 	struct work_struct output_worker;
@@ -423,88 +423,88 @@ struct dualshock4 {
 };
 
 struct dualshock4_touch_point {
-	uint8_t contact;
-	uint8_t x_lo;
-	uint8_t x_hi:4, y_lo:4;
-	uint8_t y_hi;
+	u8 contact;
+	u8 x_lo;
+	u8 x_hi:4, y_lo:4;
+	u8 y_hi;
 } __packed;
 static_assert(sizeof(struct dualshock4_touch_point) == 4);
 
 struct dualshock4_touch_report {
-	uint8_t timestamp;
+	u8 timestamp;
 	struct dualshock4_touch_point points[2];
 } __packed;
 static_assert(sizeof(struct dualshock4_touch_report) == 9);
 
 /* Main DualShock4 input report excluding any BT/USB specific headers. */
 struct dualshock4_input_report_common {
-	uint8_t x, y;
-	uint8_t rx, ry;
-	uint8_t buttons[3];
-	uint8_t z, rz;
+	u8 x, y;
+	u8 rx, ry;
+	u8 buttons[3];
+	u8 z, rz;
 
 	/* Motion sensors */
 	__le16 sensor_timestamp;
-	uint8_t sensor_temperature;
+	u8 sensor_temperature;
 	__le16 gyro[3]; /* x, y, z */
 	__le16 accel[3]; /* x, y, z */
-	uint8_t reserved2[5];
+	u8 reserved2[5];
 
-	uint8_t status[2];
-	uint8_t reserved3;
+	u8 status[2];
+	u8 reserved3;
 } __packed;
 static_assert(sizeof(struct dualshock4_input_report_common) == 32);
 
 struct dualshock4_input_report_usb {
-	uint8_t report_id; /* 0x01 */
+	u8 report_id; /* 0x01 */
 	struct dualshock4_input_report_common common;
-	uint8_t num_touch_reports;
+	u8 num_touch_reports;
 	struct dualshock4_touch_report touch_reports[3];
-	uint8_t reserved[3];
+	u8 reserved[3];
 } __packed;
 static_assert(sizeof(struct dualshock4_input_report_usb) == DS4_INPUT_REPORT_USB_SIZE);
 
 struct dualshock4_input_report_bt {
-	uint8_t report_id; /* 0x11 */
-	uint8_t reserved[2];
+	u8 report_id; /* 0x11 */
+	u8 reserved[2];
 	struct dualshock4_input_report_common common;
-	uint8_t num_touch_reports;
+	u8 num_touch_reports;
 	struct dualshock4_touch_report touch_reports[4]; /* BT has 4 compared to 3 for USB */
-	uint8_t reserved2[2];
+	u8 reserved2[2];
 	__le32 crc32;
 } __packed;
 static_assert(sizeof(struct dualshock4_input_report_bt) == DS4_INPUT_REPORT_BT_SIZE);
 
 /* Common data between Bluetooth and USB DualShock4 output reports. */
 struct dualshock4_output_report_common {
-	uint8_t valid_flag0;
-	uint8_t valid_flag1;
+	u8 valid_flag0;
+	u8 valid_flag1;
 
-	uint8_t reserved;
+	u8 reserved;
 
-	uint8_t motor_right;
-	uint8_t motor_left;
+	u8 motor_right;
+	u8 motor_left;
 
-	uint8_t lightbar_red;
-	uint8_t lightbar_green;
-	uint8_t lightbar_blue;
-	uint8_t lightbar_blink_on;
-	uint8_t lightbar_blink_off;
+	u8 lightbar_red;
+	u8 lightbar_green;
+	u8 lightbar_blue;
+	u8 lightbar_blink_on;
+	u8 lightbar_blink_off;
 } __packed;
 
 struct dualshock4_output_report_usb {
-	uint8_t report_id; /* 0x5 */
+	u8 report_id; /* 0x5 */
 	struct dualshock4_output_report_common common;
-	uint8_t reserved[21];
+	u8 reserved[21];
 } __packed;
 static_assert(sizeof(struct dualshock4_output_report_usb) == DS4_OUTPUT_REPORT_USB_SIZE);
 
 struct dualshock4_output_report_bt {
-	uint8_t report_id; /* 0x11 */
-	uint8_t hw_control;
-	uint8_t audio_control;
+	u8 report_id; /* 0x11 */
+	u8 hw_control;
+	u8 audio_control;
 	struct dualshock4_output_report_common common;
-	uint8_t reserved[61];
+	u8 reserved[61];
 	__le32 crc32;
 } __packed;
 static_assert(sizeof(struct dualshock4_output_report_bt) == DS4_OUTPUT_REPORT_BT_SIZE);
@@ -515,8 +515,8 @@ static_assert(sizeof(struct dualshock4_output_report_bt) == DS4_OUTPUT_REPORT_BT
  * This structure hide the differences between the two to simplify sending output reports.
  */
 struct dualshock4_output_report {
-	uint8_t *data; /* Start of data */
-	uint8_t len; /* Size of output report */
+	u8 *data; /* Start of data */
+	u8 len; /* Size of output report */
 
 	/* Points to Bluetooth data payload in case for a Bluetooth report else NULL. */
 	struct dualshock4_output_report_bt *bt;
@@ -555,7 +555,7 @@ static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
 static int dualshock4_get_calibration_data(struct dualshock4 *ds4);
 static inline void dualsense_schedule_work(struct dualsense *ds);
 static inline void dualshock4_schedule_work(struct dualshock4 *ds4);
-static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue);
+static void dualsense_set_lightbar(struct dualsense *ds, u8 red, u8 green, u8 blue);
 static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds4);
 
 /*
@@ -647,7 +647,7 @@ static int ps_battery_get_property(struct power_supply *psy,
 		union power_supply_propval *val)
 {
 	struct ps_device *dev = power_supply_get_drvdata(psy);
-	uint8_t battery_capacity;
+	u8 battery_capacity;
 	int battery_status;
 	int ret = 0;
 
@@ -710,9 +710,9 @@ static int ps_device_register_battery(struct ps_device *dev)
 }
 
 /* Compute crc32 of HID data and compare against expected CRC. */
-static bool ps_check_crc32(uint8_t seed, uint8_t *data, size_t len, uint32_t report_crc)
+static bool ps_check_crc32(u8 seed, u8 *data, size_t len, u32 report_crc)
 {
-	uint32_t crc;
+	u32 crc;
 
 	crc = crc32_le(0xFFFFFFFF, &seed, 1);
 	crc = ~crc32_le(crc, data, len);
@@ -758,7 +758,7 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
 	return gamepad;
 }
 
-static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *buf, size_t size,
+static int ps_get_report(struct hid_device *hdev, u8 report_id, u8 *buf, size_t size,
 		bool check_crc)
 {
 	int ret;
@@ -782,8 +782,8 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 
 	if (hdev->bus == BUS_BLUETOOTH && check_crc) {
 		/* Last 4 bytes contains crc32. */
-		uint8_t crc_offset = size - 4;
-		uint32_t report_crc = get_unaligned_le32(&buf[crc_offset]);
+		u8 crc_offset = size - 4;
+		u32 report_crc = get_unaligned_le32(&buf[crc_offset]);
 
 		if (!ps_check_crc32(PS_FEATURE_CRC32_SEED, buf, crc_offset, report_crc)) {
 			hid_err(hdev, "CRC check failed for reportID=%d\n", report_id);
@@ -976,7 +976,7 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	int range_2g;
 	int ret = 0;
 	int i;
-	uint8_t *buf;
+	u8 *buf;
 
 	buf = kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
 	if (!buf)
@@ -1090,7 +1090,7 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 
 static int dualsense_get_firmware_info(struct dualsense *ds)
 {
-	uint8_t *buf;
+	u8 *buf;
 	int ret;
 
 	buf = kzalloc(DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL);
@@ -1123,7 +1123,7 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
 
 static int dualsense_get_mac_address(struct dualsense *ds)
 {
-	uint8_t *buf;
+	u8 *buf;
 	int ret = 0;
 
 	buf = kzalloc(DS_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
@@ -1149,7 +1149,7 @@ static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
 {
 	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
 	struct dualsense *ds = container_of(mc_cdev, struct dualsense, lightbar);
-	uint8_t red, green, blue;
+	u8 red, green, blue;
 
 	led_mc_calc_color_components(mc_cdev, brightness);
 	red = mc_cdev->subled_info[0].brightness;
@@ -1247,8 +1247,8 @@ static void dualsense_send_output_report(struct dualsense *ds,
 
 	/* Bluetooth packets need to be signed with a CRC in the last 4 bytes. */
 	if (report->bt) {
-		uint32_t crc;
-		uint8_t seed = PS_OUTPUT_CRC32_SEED;
+		u32 crc;
+		u8 seed = PS_OUTPUT_CRC32_SEED;
 
 		crc = crc32_le(0xFFFFFFFF, &seed, 1);
 		crc = ~crc32_le(crc, report->data, report->len - 4);
@@ -1327,9 +1327,9 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
 	struct dualsense_input_report *ds_report;
-	uint8_t battery_data, battery_capacity, charging_status, value;
+	u8 battery_data, battery_capacity, charging_status, value;
 	int battery_status;
-	uint32_t sensor_timestamp;
+	u32 sensor_timestamp;
 	bool btn_mic_state;
 	int i;
 
@@ -1344,7 +1344,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	} else if (hdev->bus == BUS_BLUETOOTH && report->id == DS_INPUT_REPORT_BT &&
 			size == DS_INPUT_REPORT_BT_SIZE) {
 		/* Last 4 bytes of input report contain crc32 */
-		uint32_t report_crc = get_unaligned_le32(&data[size - 4]);
+		u32 report_crc = get_unaligned_le32(&data[size - 4]);
 
 		if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, report_crc)) {
 			hid_err(hdev, "DualSense input CRC's check failed\n");
@@ -1427,7 +1427,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 		ds->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp, 3);
 		ds->sensor_timestamp_initialized = true;
 	} else {
-		uint32_t delta;
+		u32 delta;
 
 		if (ds->prev_sensor_timestamp > sensor_timestamp)
 			delta = (U32_MAX - ds->prev_sensor_timestamp + sensor_timestamp + 1);
@@ -1527,7 +1527,7 @@ static void dualsense_remove(struct ps_device *ps_dev)
 static int dualsense_reset_leds(struct dualsense *ds)
 {
 	struct dualsense_output_report report;
-	uint8_t *buf;
+	u8 *buf;
 
 	buf = kzalloc(sizeof(struct dualsense_output_report_bt), GFP_KERNEL);
 	if (!buf)
@@ -1549,7 +1549,7 @@ static int dualsense_reset_leds(struct dualsense *ds)
 	return 0;
 }
 
-static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue)
+static void dualsense_set_lightbar(struct dualsense *ds, u8 red, u8 green, u8 blue)
 {
 	scoped_guard(spinlock_irqsave, &ds->base.lock) {
 		ds->update_lightbar = true;
@@ -1577,7 +1577,7 @@ static void dualsense_set_player_leds(struct dualsense *ds)
 		BIT(4) | BIT(3) | BIT(2) | BIT(1) | BIT(0)
 	};
 
-	uint8_t player_id = ds->base.player_id % ARRAY_SIZE(player_ids);
+	u8 player_id = ds->base.player_id % ARRAY_SIZE(player_ids);
 
 	ds->update_player_leds = true;
 	ds->player_leds_state = player_ids[player_id];
@@ -1588,7 +1588,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
 	struct ps_device *ps_dev;
-	uint8_t max_output_report_size;
+	u8 max_output_report_size;
 	int i, ret;
 
 	static const struct ps_led_info player_leds_info[] = {
@@ -1779,7 +1779,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	int range_2g;
 	int ret = 0;
 	int i;
-	uint8_t *buf;
+	u8 *buf;
 
 	if (ds4->base.hdev->bus == BUS_USB) {
 		int retries;
@@ -1943,7 +1943,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 
 static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
 {
-	uint8_t *buf;
+	u8 *buf;
 	int ret;
 
 	buf = kzalloc(DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL);
@@ -1971,7 +1971,7 @@ static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
 static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 {
 	struct hid_device *hdev = ds4->base.hdev;
-	uint8_t *buf;
+	u8 *buf;
 	int ret = 0;
 
 	if (hdev->bus == BUS_USB) {
@@ -2190,8 +2190,8 @@ static void dualshock4_output_worker(struct work_struct *work)
 
 	/* Bluetooth packets need additional flags as well as a CRC in the last 4 bytes. */
 	if (report.bt) {
-		uint32_t crc;
-		uint8_t seed = PS_OUTPUT_CRC32_SEED;
+		u32 crc;
+		u8 seed = PS_OUTPUT_CRC32_SEED;
 
 		/* Hardware control flags need to set to let the device know
 		 * there is HID data as well as CRC.
@@ -2219,9 +2219,9 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
 	struct dualshock4_input_report_common *ds4_report;
 	struct dualshock4_touch_report *touch_reports;
-	uint8_t battery_capacity, num_touch_reports, value;
+	u8 battery_capacity, num_touch_reports, value;
 	int battery_status, i, j;
-	uint16_t sensor_timestamp;
+	u16 sensor_timestamp;
 	bool is_minimal = false;
 
 	/*
@@ -2239,7 +2239,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	} else if (hdev->bus == BUS_BLUETOOTH && report->id == DS4_INPUT_REPORT_BT &&
 			size == DS4_INPUT_REPORT_BT_SIZE) {
 		struct dualshock4_input_report_bt *bt = (struct dualshock4_input_report_bt *)data;
-		uint32_t report_crc = get_unaligned_le32(&bt->crc32);
+		u32 report_crc = get_unaligned_le32(&bt->crc32);
 
 		/* Last 4 bytes of input report contains CRC. */
 		if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, report_crc)) {
@@ -2323,7 +2323,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 		ds4->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp * 16, 3);
 		ds4->sensor_timestamp_initialized = true;
 	} else {
-		uint16_t delta;
+		u16 delta;
 
 		if (ds4->prev_sensor_timestamp > sensor_timestamp)
 			delta = (U16_MAX - ds4->prev_sensor_timestamp + sensor_timestamp + 1);
@@ -2368,7 +2368,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	 * - 15: charge error
 	 */
 	if (ds4_report->status[0] & DS4_STATUS0_CABLE_STATE) {
-		uint8_t battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
+		u8 battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
 
 		if (battery_data < 10) {
 			/* Take the mid-point for each battery capacity value,
@@ -2389,7 +2389,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 			battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
 		}
 	} else {
-		uint8_t battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
+		u8 battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
 
 		if (battery_data < 10)
 			battery_capacity = battery_data * 10 + 5;
@@ -2498,7 +2498,7 @@ static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
 		schedule_work(&ds4->output_worker);
 }
 
-static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8_t interval)
+static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, u8 interval)
 {
 	ds4->bt_poll_interval = interval;
 	ds4->update_bt_poll_interval = true;
@@ -2518,7 +2518,7 @@ static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds4)
 		{ 0x20, 0x00, 0x20 }  /* Pink */
 	};
 
-	uint8_t player_id = ds4->base.player_id % ARRAY_SIZE(player_colors);
+	u8 player_id = ds4->base.player_id % ARRAY_SIZE(player_colors);
 
 	ds4->lightbar_enabled = true;
 	ds4->lightbar_red = player_colors[player_id][0];
@@ -2533,7 +2533,7 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 {
 	struct dualshock4 *ds4;
 	struct ps_device *ps_dev;
-	uint8_t max_output_report_size;
+	u8 max_output_report_size;
 	int i, ret;
 
 	/* The DualShock4 has an RGB lightbar, which the original hid-sony driver

-- 
2.49.0



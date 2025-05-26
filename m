Return-Path: <linux-input+bounces-12576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4311AC3F96
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9F5F16EAD9
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6881A20E00A;
	Mon, 26 May 2025 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UgthMB2U"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE1207DEF;
	Mon, 26 May 2025 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263921; cv=none; b=tYnmSjStechmMNcoN7a1/HCfO1/VrAjz78DIX1mHjOiLOI1+WmT128LukCja+y5QGJYl0aNGaje/vcc3iKRIDdcRAIWNAzO0qXRU67d4JOpd1+Bv6qzNvGAx5s/+Al3t7p9icBOGtCuBDf+WTXGjC5nNwA2IGqec2Pb2B+SCDN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263921; c=relaxed/simple;
	bh=FlkRkpLny0DRvpOj6J7BTjPRRUEqaFQAssZ/n61a/kE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIezZ1PcW6fZquZX0pkBnac2ftPuhBB2GRmrv/g2n1II3PqGOVZcTQcuoPD0JTczpX7hWmv2u9pPsY7/lMkoKLFe61tu95J8c64OkK0qZv3YgW+8rt4WVOi/cxWYRoA+CQxxsdyqGqw4j1YUoKzjXTynmQyG8zmApp2jCtbXUe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UgthMB2U; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263915;
	bh=FlkRkpLny0DRvpOj6J7BTjPRRUEqaFQAssZ/n61a/kE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UgthMB2Us939HBRhKDePvJLhcsDVFdXvLQZkbV585diV2KcCFv6qxwMC4S8h8lTjM
	 e2b4BUMqTA0cuUltGt5JNz4jyrhJ7nLWVS+uxXQzB0VaZjpX8IQSbaErrtnwp02i4e
	 QOWlbKFppkHBrO6VHwZucKwFEhfbUicu3YRAnfBAZO6rBB8MtzlNcfU/FYvidvzQoW
	 nzZvfKmDiaQa7bnw6owEYKkaE1GOViZsqOzi32B4z+t1fdUZlCXM8zwn9qpbke77z1
	 XipP2VC132BapE/NFs20vSV8q0y9az3IgMdB79lyhmFf5h8aEWJcgW1j56KByEzQ/c
	 Y9WWQKGoOEs+A==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 4E76F17E36B0;
	Mon, 26 May 2025 14:51:55 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:27 +0300
Subject: [PATCH 04/11] HID: playstation: Replace uint{32,16,8}_t with
 u{32,16,8}
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-4-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
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
index 16c576cc74284cc680cc7fc17e1bbe6bbcf84177..d36370d001edd0d82e8616f8f2803d8b7ad13954 100644
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
@@ -169,7 +169,7 @@ struct dualsense {
 	struct input_dev *touchpad;
 
 	/* Update version is used as a feature/capability version. */
-	uint16_t update_version;
+	u16 update_version;
 
 	/* Calibration data for accelerometer and gyroscope. */
 	struct ps_calibration_data accel_calib_data[3];
@@ -177,21 +177,21 @@ struct dualsense {
 
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
@@ -200,90 +200,90 @@ struct dualsense {
 
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
 
@@ -293,8 +293,8 @@ static_assert(sizeof(struct dualsense_output_report_usb) == DS_OUTPUT_REPORT_USB
  * This structure hide the differences between the two to simplify sending output reports.
  */
 struct dualsense_output_report {
-	uint8_t *data; /* Start of data */
-	uint8_t len; /* Size of output report */
+	u8 *data; /* Start of data */
+	u8 len; /* Size of output report */
 
 	/* Points to Bluetooth data payload in case for a Bluetooth report else NULL. */
 	struct dualsense_output_report_bt *bt;
@@ -396,26 +396,26 @@ struct dualshock4 {
 
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
@@ -424,88 +424,88 @@ struct dualshock4 {
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
@@ -516,8 +516,8 @@ static_assert(sizeof(struct dualshock4_output_report_bt) == DS4_OUTPUT_REPORT_BT
  * This structure hide the differences between the two to simplify sending output reports.
  */
 struct dualshock4_output_report {
-	uint8_t *data; /* Start of data */
-	uint8_t len; /* Size of output report */
+	u8 *data; /* Start of data */
+	u8 len; /* Size of output report */
 
 	/* Points to Bluetooth data payload in case for a Bluetooth report else NULL. */
 	struct dualshock4_output_report_bt *bt;
@@ -556,7 +556,7 @@ static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
 static int dualshock4_get_calibration_data(struct dualshock4 *ds4);
 static inline void dualsense_schedule_work(struct dualsense *ds);
 static inline void dualshock4_schedule_work(struct dualshock4 *ds4);
-static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue);
+static void dualsense_set_lightbar(struct dualsense *ds, u8 red, u8 green, u8 blue);
 static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds4);
 
 /*
@@ -648,7 +648,7 @@ static int ps_battery_get_property(struct power_supply *psy,
 		union power_supply_propval *val)
 {
 	struct ps_device *dev = power_supply_get_drvdata(psy);
-	uint8_t battery_capacity;
+	u8 battery_capacity;
 	int battery_status;
 	int ret = 0;
 
@@ -711,9 +711,9 @@ static int ps_device_register_battery(struct ps_device *dev)
 }
 
 /* Compute crc32 of HID data and compare against expected CRC. */
-static bool ps_check_crc32(uint8_t seed, uint8_t *data, size_t len, uint32_t report_crc)
+static bool ps_check_crc32(u8 seed, u8 *data, size_t len, u32 report_crc)
 {
-	uint32_t crc;
+	u32 crc;
 
 	crc = crc32_le(0xFFFFFFFF, &seed, 1);
 	crc = ~crc32_le(crc, data, len);
@@ -759,7 +759,7 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
 	return gamepad;
 }
 
-static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *buf, size_t size,
+static int ps_get_report(struct hid_device *hdev, u8 report_id, u8 *buf, size_t size,
 		bool check_crc)
 {
 	int ret;
@@ -783,8 +783,8 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 
 	if (hdev->bus == BUS_BLUETOOTH && check_crc) {
 		/* Last 4 bytes contains crc32. */
-		uint8_t crc_offset = size - 4;
-		uint32_t report_crc = get_unaligned_le32(&buf[crc_offset]);
+		u8 crc_offset = size - 4;
+		u32 report_crc = get_unaligned_le32(&buf[crc_offset]);
 
 		if (!ps_check_crc32(PS_FEATURE_CRC32_SEED, buf, crc_offset, report_crc)) {
 			hid_err(hdev, "CRC check failed for reportID=%d\n", report_id);
@@ -977,7 +977,7 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	int range_2g;
 	int ret = 0;
 	int i;
-	uint8_t *buf;
+	u8 *buf;
 
 	buf = kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
 	if (!buf)
@@ -1091,7 +1091,7 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 
 static int dualsense_get_firmware_info(struct dualsense *ds)
 {
-	uint8_t *buf;
+	u8 *buf;
 	int ret;
 
 	buf = kzalloc(DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL);
@@ -1124,7 +1124,7 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
 
 static int dualsense_get_mac_address(struct dualsense *ds)
 {
-	uint8_t *buf;
+	u8 *buf;
 	int ret = 0;
 
 	buf = kzalloc(DS_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
@@ -1150,7 +1150,7 @@ static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
 {
 	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
 	struct dualsense *ds = container_of(mc_cdev, struct dualsense, lightbar);
-	uint8_t red, green, blue;
+	u8 red, green, blue;
 
 	led_mc_calc_color_components(mc_cdev, brightness);
 	red = mc_cdev->subled_info[0].brightness;
@@ -1248,8 +1248,8 @@ static void dualsense_send_output_report(struct dualsense *ds,
 
 	/* Bluetooth packets need to be signed with a CRC in the last 4 bytes. */
 	if (report->bt) {
-		uint32_t crc;
-		uint8_t seed = PS_OUTPUT_CRC32_SEED;
+		u32 crc;
+		u8 seed = PS_OUTPUT_CRC32_SEED;
 
 		crc = crc32_le(0xFFFFFFFF, &seed, 1);
 		crc = ~crc32_le(crc, report->data, report->len - 4);
@@ -1328,9 +1328,9 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
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
 
@@ -1345,7 +1345,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	} else if (hdev->bus == BUS_BLUETOOTH && report->id == DS_INPUT_REPORT_BT &&
 			size == DS_INPUT_REPORT_BT_SIZE) {
 		/* Last 4 bytes of input report contain crc32 */
-		uint32_t report_crc = get_unaligned_le32(&data[size - 4]);
+		u32 report_crc = get_unaligned_le32(&data[size - 4]);
 
 		if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, report_crc)) {
 			hid_err(hdev, "DualSense input CRC's check failed\n");
@@ -1428,7 +1428,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 		ds->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp, 3);
 		ds->sensor_timestamp_initialized = true;
 	} else {
-		uint32_t delta;
+		u32 delta;
 
 		if (ds->prev_sensor_timestamp > sensor_timestamp)
 			delta = (U32_MAX - ds->prev_sensor_timestamp + sensor_timestamp + 1);
@@ -1528,7 +1528,7 @@ static void dualsense_remove(struct ps_device *ps_dev)
 static int dualsense_reset_leds(struct dualsense *ds)
 {
 	struct dualsense_output_report report;
-	uint8_t *buf;
+	u8 *buf;
 
 	buf = kzalloc(sizeof(struct dualsense_output_report_bt), GFP_KERNEL);
 	if (!buf)
@@ -1550,7 +1550,7 @@ static int dualsense_reset_leds(struct dualsense *ds)
 	return 0;
 }
 
-static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue)
+static void dualsense_set_lightbar(struct dualsense *ds, u8 red, u8 green, u8 blue)
 {
 	scoped_guard(spinlock_irqsave, &ds->base.lock) {
 		ds->update_lightbar = true;
@@ -1578,7 +1578,7 @@ static void dualsense_set_player_leds(struct dualsense *ds)
 		BIT(4) | BIT(3) | BIT(2) | BIT(1) | BIT(0)
 	};
 
-	uint8_t player_id = ds->base.player_id % ARRAY_SIZE(player_ids);
+	u8 player_id = ds->base.player_id % ARRAY_SIZE(player_ids);
 
 	ds->update_player_leds = true;
 	ds->player_leds_state = player_ids[player_id];
@@ -1589,7 +1589,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
 	struct ps_device *ps_dev;
-	uint8_t max_output_report_size;
+	u8 max_output_report_size;
 	int i, ret;
 
 	static const struct ps_led_info player_leds_info[] = {
@@ -1780,7 +1780,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	int range_2g;
 	int ret = 0;
 	int i;
-	uint8_t *buf;
+	u8 *buf;
 
 	if (ds4->base.hdev->bus == BUS_USB) {
 		int retries;
@@ -1944,7 +1944,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 
 static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
 {
-	uint8_t *buf;
+	u8 *buf;
 	int ret;
 
 	buf = kzalloc(DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL);
@@ -1972,7 +1972,7 @@ static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
 static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 {
 	struct hid_device *hdev = ds4->base.hdev;
-	uint8_t *buf;
+	u8 *buf;
 	int ret = 0;
 
 	if (hdev->bus == BUS_USB) {
@@ -2191,8 +2191,8 @@ static void dualshock4_output_worker(struct work_struct *work)
 
 	/* Bluetooth packets need additional flags as well as a CRC in the last 4 bytes. */
 	if (report.bt) {
-		uint32_t crc;
-		uint8_t seed = PS_OUTPUT_CRC32_SEED;
+		u32 crc;
+		u8 seed = PS_OUTPUT_CRC32_SEED;
 
 		/* Hardware control flags need to set to let the device know
 		 * there is HID data as well as CRC.
@@ -2220,9 +2220,9 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
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
@@ -2240,7 +2240,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	} else if (hdev->bus == BUS_BLUETOOTH && report->id == DS4_INPUT_REPORT_BT &&
 			size == DS4_INPUT_REPORT_BT_SIZE) {
 		struct dualshock4_input_report_bt *bt = (struct dualshock4_input_report_bt *)data;
-		uint32_t report_crc = get_unaligned_le32(&bt->crc32);
+		u32 report_crc = get_unaligned_le32(&bt->crc32);
 
 		/* Last 4 bytes of input report contains CRC. */
 		if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, report_crc)) {
@@ -2324,7 +2324,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 		ds4->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp * 16, 3);
 		ds4->sensor_timestamp_initialized = true;
 	} else {
-		uint16_t delta;
+		u16 delta;
 
 		if (ds4->prev_sensor_timestamp > sensor_timestamp)
 			delta = (U16_MAX - ds4->prev_sensor_timestamp + sensor_timestamp + 1);
@@ -2369,7 +2369,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	 * - 15: charge error
 	 */
 	if (ds4_report->status[0] & DS4_STATUS0_CABLE_STATE) {
-		uint8_t battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
+		u8 battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
 
 		if (battery_data < 10) {
 			/* Take the mid-point for each battery capacity value,
@@ -2390,7 +2390,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 			battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
 		}
 	} else {
-		uint8_t battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
+		u8 battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
 
 		if (battery_data < 10)
 			battery_capacity = battery_data * 10 + 5;
@@ -2499,7 +2499,7 @@ static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
 		schedule_work(&ds4->output_worker);
 }
 
-static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8_t interval)
+static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, u8 interval)
 {
 	ds4->bt_poll_interval = interval;
 	ds4->update_bt_poll_interval = true;
@@ -2519,7 +2519,7 @@ static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds4)
 		{ 0x20, 0x00, 0x20 }  /* Pink */
 	};
 
-	uint8_t player_id = ds4->base.player_id % ARRAY_SIZE(player_colors);
+	u8 player_id = ds4->base.player_id % ARRAY_SIZE(player_colors);
 
 	ds4->lightbar_enabled = true;
 	ds4->lightbar_red = player_colors[player_id][0];
@@ -2534,7 +2534,7 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 {
 	struct dualshock4 *ds4;
 	struct ps_device *ps_dev;
-	uint8_t max_output_report_size;
+	u8 max_output_report_size;
 	int i, ret;
 
 	/* The DualShock4 has an RGB lightbar, which the original hid-sony driver

-- 
2.49.0



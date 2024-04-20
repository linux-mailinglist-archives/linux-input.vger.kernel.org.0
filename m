Return-Path: <linux-input+bounces-3138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2597F8ABB8A
	for <lists+linux-input@lfdr.de>; Sat, 20 Apr 2024 14:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C26E1C20AE3
	for <lists+linux-input@lfdr.de>; Sat, 20 Apr 2024 12:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B075414AA8;
	Sat, 20 Apr 2024 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="ZUst7EC5"
X-Original-To: linux-input@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD28134DE
	for <linux-input@vger.kernel.org>; Sat, 20 Apr 2024 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713616476; cv=none; b=JT0b+G0+Srn6spi7vYXTxVzgU9hrEwO/wLZULmuPecyR0D8rQ/C6q1ZPyBRzYUXWls0uclkhmosH5ajl1Lq7sNfu9SlJHOJ5F26sWhqyLCNjhvUR2LoTgQkZHX/8GQeoX3p14+OCobTsomR4XVTbB7wUyY7W8CIQFek9ERfHSBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713616476; c=relaxed/simple;
	bh=KMr0K8DIDwe3NZEz5yRWgIu6Sv/Zygl5OdVwc8r2b40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ris4Hmazg6JiboDMonKrjFjRzIjtDo3Ar9EB/AUUiN7lRl4LFlCLqwQ3IAcq4KgFmdCp5wGPDZLqXZCHBeZ9hfRecQIX1pARuiBN7R2tIXYtj8V+EVG5Als5Xj3L+n3Rsu0J6xO6CBhFxE81iYvyLWZ2wf8q97pXyAf7KFOEn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=ZUst7EC5; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8E06F240105
	for <linux-input@vger.kernel.org>; Sat, 20 Apr 2024 14:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1713616465; bh=KMr0K8DIDwe3NZEz5yRWgIu6Sv/Zygl5OdVwc8r2b40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=ZUst7EC5fmNX5b5ix4K+OsTXguSz36YGOTCpJbQ+7Toz1h5wJ7ZrjpdEqQ73S9V58
	 CEdxj3kZa2KljOxeaVxUgZcuLa6Ex0Dae7pkmUl8UlLL6KPL6Z3hB0KEU1WEbuy8af
	 kaY/U+0bvFR8v33wNrHkoDVfr8byz6lXtROFm3KGk08weRatetW4mGCIDP9AbxXAC4
	 H5cUjaDO/qji+arzeI1IkxFN9rpnxZTpDgY81mm4MG7aD4a4Qmqqevddcw886L0/2U
	 WeIt2NK9/4z7ia4jrT2htNPYl7ZUWy936ZCnM/mYqpDU49n91WOFqnOybtDz4DUtY9
	 lOUMDSeC5j7ig==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VM9tm4Qsqz9rxM;
	Sat, 20 Apr 2024 14:34:24 +0200 (CEST)
From: Max Maisel <mmm-1@posteo.net>
To: jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vi@endrift.com
Cc: mmm-1@posteo.net
Subject: [PATCH v2] HID: hid-steam: Add Deck IMU support
Date: Sat, 20 Apr 2024 12:34:18 +0000
Message-ID: <20240420123418.4938-1-mmm-1@posteo.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Deck's controller features an accelerometer and gyroscope which
send their measurement values by default in the main HID input report.
Expose both sensors to userspace through a separate evdev node as it
is done by the hid-nintendo and hid-playstation drivers.

Signed-off-by: Max Maisel <mmm-1@posteo.net>
---

Changes in v2:
* Increased gyroscope range to 32768.
* Removed comment about factory calibration of sensor values.
* Removed STEAM_QUIRK_DECK check in steam_raw_event function.
* Silenced the IMU when gamepad mode is disabled.
* Added improved fuzz values for the input device.
  The new values are based on the average deviation from the average
  sensor values at rest.
* Rebased onto kernel v6.9-rc4.
* Improved the test procedure below.

Test procedure:

This patch was tested on a Steam Deck running Arch Linux. With it,
applications using latest SDL2/3 git libraries will pick up the sensors
without hidraw access. This was tested against the antimicrox gamepad
mapper.

Measurement value scaling was tested by logging and comparing sensors
values between the deck and a dualsense controller.
For the accelerometer, both controllers were aligned to gravity on all axes
and the reported values were compared.
For the gyroscope, both controllers were placed on a makeshift
rotational plate and the reported absolute angular velocity was compared.
Furthermore, it was tested that the axes have the same orientation
between the two controller types.
Finally, it was tested that the full scale values for both sensor types
can be reached by doing jerky movements with the deck.
All observed values matched within a few percent error range.

 drivers/hid/hid-steam.c | 155 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 147 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index b08a5ab58528..f166188c21ec 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -66,6 +66,14 @@ static LIST_HEAD(steam_devices);
 #define STEAM_DECK_TRIGGER_RESOLUTION 5461
 /* Joystick runs are about 5 mm and 32768 units */
 #define STEAM_DECK_JOYSTICK_RESOLUTION 6553
+/* Accelerometer has 16 bit resolution and a range of +/- 2g */
+#define STEAM_DECK_ACCEL_RES_PER_G 16384
+#define STEAM_DECK_ACCEL_RANGE 32768
+#define STEAM_DECK_ACCEL_FUZZ 32
+/* Gyroscope has 16 bit resolution and a range of +/- 2000 dps */
+#define STEAM_DECK_GYRO_RES_PER_DPS 16
+#define STEAM_DECK_GYRO_RANGE 32768
+#define STEAM_DECK_GYRO_FUZZ 1
 
 #define STEAM_PAD_FUZZ 256
 
@@ -288,6 +296,7 @@ struct steam_device {
 	struct mutex report_mutex;
 	unsigned long client_opened;
 	struct input_dev __rcu *input;
+	struct input_dev __rcu *sensors;
 	unsigned long quirks;
 	struct work_struct work_connect;
 	bool connected;
@@ -302,6 +311,7 @@ struct steam_device {
 	struct work_struct rumble_work;
 	u16 rumble_left;
 	u16 rumble_right;
+	unsigned int sensor_timestamp_us;
 };
 
 static int steam_recv_report(struct steam_device *steam,
@@ -825,6 +835,74 @@ static int steam_input_register(struct steam_device *steam)
 	return ret;
 }
 
+static int steam_sensors_register(struct steam_device *steam)
+{
+	struct hid_device *hdev = steam->hdev;
+	struct input_dev *sensors;
+	int ret;
+
+	if (!(steam->quirks & STEAM_QUIRK_DECK))
+		return 0;
+
+	rcu_read_lock();
+	sensors = rcu_dereference(steam->sensors);
+	rcu_read_unlock();
+	if (sensors) {
+		dbg_hid("%s: already connected\n", __func__);
+		return 0;
+	}
+
+	sensors = input_allocate_device();
+	if (!sensors)
+		return -ENOMEM;
+
+	input_set_drvdata(sensors, steam);
+	sensors->dev.parent = &hdev->dev;
+
+	sensors->name = "Steam Deck Motion Sensors";
+	sensors->phys = hdev->phys;
+	sensors->uniq = steam->serial_no;
+	sensors->id.bustype = hdev->bus;
+	sensors->id.vendor = hdev->vendor;
+	sensors->id.product = hdev->product;
+	sensors->id.version = hdev->version;
+
+	__set_bit(INPUT_PROP_ACCELEROMETER, sensors->propbit);
+	__set_bit(EV_MSC, sensors->evbit);
+	__set_bit(MSC_TIMESTAMP, sensors->mscbit);
+
+	input_set_abs_params(sensors, ABS_X, -STEAM_DECK_ACCEL_RANGE,
+			STEAM_DECK_ACCEL_RANGE, STEAM_DECK_ACCEL_FUZZ, 0);
+	input_set_abs_params(sensors, ABS_Y, -STEAM_DECK_ACCEL_RANGE,
+			STEAM_DECK_ACCEL_RANGE, STEAM_DECK_ACCEL_FUZZ, 0);
+	input_set_abs_params(sensors, ABS_Z, -STEAM_DECK_ACCEL_RANGE,
+			STEAM_DECK_ACCEL_RANGE, STEAM_DECK_ACCEL_FUZZ, 0);
+	input_abs_set_res(sensors, ABS_X, STEAM_DECK_ACCEL_RES_PER_G);
+	input_abs_set_res(sensors, ABS_Y, STEAM_DECK_ACCEL_RES_PER_G);
+	input_abs_set_res(sensors, ABS_Z, STEAM_DECK_ACCEL_RES_PER_G);
+
+	input_set_abs_params(sensors, ABS_RX, -STEAM_DECK_GYRO_RANGE,
+			STEAM_DECK_GYRO_RANGE, STEAM_DECK_GYRO_FUZZ, 0);
+	input_set_abs_params(sensors, ABS_RY, -STEAM_DECK_GYRO_RANGE,
+			STEAM_DECK_GYRO_RANGE, STEAM_DECK_GYRO_FUZZ, 0);
+	input_set_abs_params(sensors, ABS_RZ, -STEAM_DECK_GYRO_RANGE,
+			STEAM_DECK_GYRO_RANGE, STEAM_DECK_GYRO_FUZZ, 0);
+	input_abs_set_res(sensors, ABS_RX, STEAM_DECK_GYRO_RES_PER_DPS);
+	input_abs_set_res(sensors, ABS_RY, STEAM_DECK_GYRO_RES_PER_DPS);
+	input_abs_set_res(sensors, ABS_RZ, STEAM_DECK_GYRO_RES_PER_DPS);
+
+	ret = input_register_device(sensors);
+	if (ret)
+		goto sensors_register_fail;
+
+	rcu_assign_pointer(steam->sensors, sensors);
+	return 0;
+
+sensors_register_fail:
+	input_free_device(sensors);
+	return ret;
+}
+
 static void steam_input_unregister(struct steam_device *steam)
 {
 	struct input_dev *input;
@@ -838,6 +916,24 @@ static void steam_input_unregister(struct steam_device *steam)
 	input_unregister_device(input);
 }
 
+static void steam_sensors_unregister(struct steam_device *steam)
+{
+	struct input_dev *sensors;
+
+	if (!(steam->quirks & STEAM_QUIRK_DECK))
+		return;
+
+	rcu_read_lock();
+	sensors = rcu_dereference(steam->sensors);
+	rcu_read_unlock();
+
+	if (!sensors)
+		return;
+	RCU_INIT_POINTER(steam->sensors, NULL);
+	synchronize_rcu();
+	input_unregister_device(sensors);
+}
+
 static void steam_battery_unregister(struct steam_device *steam)
 {
 	struct power_supply *battery;
@@ -890,18 +986,28 @@ static int steam_register(struct steam_device *steam)
 	spin_lock_irqsave(&steam->lock, flags);
 	client_opened = steam->client_opened;
 	spin_unlock_irqrestore(&steam->lock, flags);
+
 	if (!client_opened) {
 		steam_set_lizard_mode(steam, lizard_mode);
 		ret = steam_input_register(steam);
-	} else
-		ret = 0;
+		if (ret != 0)
+			goto steam_register_input_fail;
+		ret = steam_sensors_register(steam);
+		if (ret != 0)
+			goto steam_register_sensors_fail;
+	}
+	return 0;
 
+steam_register_sensors_fail:
+	steam_input_unregister(steam);
+steam_register_input_fail:
 	return ret;
 }
 
 static void steam_unregister(struct steam_device *steam)
 {
 	steam_battery_unregister(steam);
+	steam_sensors_unregister(steam);
 	steam_input_unregister(steam);
 	if (steam->serial_no[0]) {
 		hid_info(steam->hdev, "Steam Controller '%s' disconnected",
@@ -1010,6 +1116,7 @@ static int steam_client_ll_open(struct hid_device *hdev)
 	steam->client_opened++;
 	spin_unlock_irqrestore(&steam->lock, flags);
 
+	steam_sensors_unregister(steam);
 	steam_input_unregister(steam);
 
 	return 0;
@@ -1030,6 +1137,7 @@ static void steam_client_ll_close(struct hid_device *hdev)
 	if (connected) {
 		steam_set_lizard_mode(steam, lizard_mode);
 		steam_input_register(steam);
+		steam_sensors_register(steam);
 	}
 }
 
@@ -1121,6 +1229,7 @@ static int steam_probe(struct hid_device *hdev,
 	INIT_DELAYED_WORK(&steam->mode_switch, steam_mode_switch_cb);
 	INIT_LIST_HEAD(&steam->list);
 	INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
+	steam->sensor_timestamp_us = 0;
 
 	/*
 	 * With the real steam controller interface, do not connect hidraw.
@@ -1380,12 +1489,12 @@ static void steam_do_input_event(struct steam_device *steam,
  *  18-19 | s16   | ABS_HAT0Y | left-pad Y value
  *  20-21 | s16   | ABS_HAT1X | right-pad X value
  *  22-23 | s16   | ABS_HAT1Y | right-pad Y value
- *  24-25 | s16   | --        | accelerometer X value
- *  26-27 | s16   | --        | accelerometer Y value
- *  28-29 | s16   | --        | accelerometer Z value
- *  30-31 | s16   | --        | gyro X value
- *  32-33 | s16   | --        | gyro Y value
- *  34-35 | s16   | --        | gyro Z value
+ *  24-25 | s16   | IMU ABS_X | accelerometer X value
+ *  26-27 | s16   | IMU ABS_Z | accelerometer Y value
+ *  28-29 | s16   | IMU ABS_Y | accelerometer Z value
+ *  30-31 | s16   | IMU ABS_RX | gyro X value
+ *  32-33 | s16   | IMU ABS_RZ | gyro Y value
+ *  34-35 | s16   | IMU ABS_RY | gyro Z value
  *  36-37 | s16   | --        | quaternion W value
  *  38-39 | s16   | --        | quaternion X value
  *  40-41 | s16   | --        | quaternion Y value
@@ -1546,6 +1655,32 @@ static void steam_do_deck_input_event(struct steam_device *steam,
 	input_sync(input);
 }
 
+static void steam_do_deck_sensors_event(struct steam_device *steam,
+		struct input_dev *sensors, u8 *data)
+{
+	/*
+	 * The deck input report is received every 4 ms on average,
+	 * with a jitter of +/- 4 ms even though the USB descriptor claims
+	 * that it uses 1 kHz.
+	 * Since the HID report does not include a sensor timestamp,
+	 * use a fixed increment here.
+	 */
+	steam->sensor_timestamp_us += 4000;
+
+	if (!steam->gamepad_mode)
+		return;
+
+	input_event(sensors, EV_MSC, MSC_TIMESTAMP, steam->sensor_timestamp_us);
+	input_report_abs(sensors, ABS_X, steam_le16(data + 24));
+	input_report_abs(sensors, ABS_Z, -steam_le16(data + 26));
+	input_report_abs(sensors, ABS_Y, steam_le16(data + 28));
+	input_report_abs(sensors, ABS_RX, steam_le16(data + 30));
+	input_report_abs(sensors, ABS_RZ, -steam_le16(data + 32));
+	input_report_abs(sensors, ABS_RY, steam_le16(data + 34));
+
+	input_sync(sensors);
+}
+
 /*
  * The size for this message payload is 11.
  * The known values are:
@@ -1583,6 +1718,7 @@ static int steam_raw_event(struct hid_device *hdev,
 {
 	struct steam_device *steam = hid_get_drvdata(hdev);
 	struct input_dev *input;
+	struct input_dev *sensors;
 	struct power_supply *battery;
 
 	if (!steam)
@@ -1628,6 +1764,9 @@ static int steam_raw_event(struct hid_device *hdev,
 		input = rcu_dereference(steam->input);
 		if (likely(input))
 			steam_do_deck_input_event(steam, input, data);
+		sensors = rcu_dereference(steam->sensors);
+		if (likely(sensors))
+			steam_do_deck_sensors_event(steam, sensors, data);
 		rcu_read_unlock();
 		break;
 	case ID_CONTROLLER_WIRELESS:

base-commit: 0bbac3facb5d6cc0171c45c9873a2dc96bea9680
-- 
2.44.0



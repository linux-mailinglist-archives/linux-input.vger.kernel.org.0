Return-Path: <linux-input+bounces-13018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB83AE71D0
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DBD417BE8F
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6843125B314;
	Tue, 24 Jun 2025 21:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jdStzxXT"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D4625B313;
	Tue, 24 Jun 2025 21:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802241; cv=none; b=J20DPtfsxzIT8wIiayoce6Go+FJMvEj8cgWndXX782wCFkcNZgnVtU1Fpalu2lYoewXwCFU/bixUkmKFh1C6bDHxzXZrtQd/y0zOOyh1ZSexNr2FCa7HFf6QWdcVqReaOxvgymb1XBOR3Zi8DBbUj8JUXWldluJlHkQpZ1lVV0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802241; c=relaxed/simple;
	bh=58Tb/BdGc+NPxdTW7+3xPHouBtguMronGIdSUGbsJG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6OHREc3BGj1C10B57DeZa/uNN2eeL4tQ3lPbr+hVKzJTTvCeV0cnCBm8D83ktvoc5WEqPQoBuhuXQ21lYxvDh5JI1CdNSs/b/W5hklMT+NUB+w501/zgomIsJvu4G/s/mXn0eHoqJbZ4pycIti2o8B/apK6uZNRvKvA45RgthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jdStzxXT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802237;
	bh=58Tb/BdGc+NPxdTW7+3xPHouBtguMronGIdSUGbsJG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jdStzxXTIQg/AJCD+RLJPaBYoD3fQF6snwI2agOqMjKCR3dsm5BQy7sh+H/PtC1qV
	 jNenR3oR0aGP0mAZA7UGQBT46nM38dT7nqgJHfdT/K0WUNVb6PY19NhigA48DHeTyr
	 /i9Rof6TI5FMYfm4nYOYlSA4z5/BESf5ra7ehrzo9gACbo0fJc6GxFNtuob6VwhBjL
	 mEZVDS9PtiErnPg4s02Zd7b7xyhDvGiol1dr5mw3qQhNxj5VBC5If1252YCOVHEPcu
	 t05H/Z2n7ogsdLaxzSV8TYpgCmJprGQZWNOr9W46Nk7VJMZT8zoDenZ4N2nKF5j78V
	 LzstFVKw0zLgQ==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 5E00417E05BD;
	Tue, 24 Jun 2025 23:57:17 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:46 +0300
Subject: [PATCH v2 02/11] HID: playstation: Add spaces around arithmetic
 operators
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-2-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Get rid of several checkpatch.pl complaints:

  CHECK: spaces preferred around that '*' (ctx:VxV)
  CHECK: spaces preferred around that '/' (ctx:VxV)

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 79190147fa00b90a4416dd2723c68bcae811684b..799b47cdfe034c2b78ec589ac19e3c7a764dc784 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -154,9 +154,9 @@ struct ps_led_info {
 
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
-#define DS_ACC_RANGE		(4*DS_ACC_RES_PER_G)
+#define DS_ACC_RANGE		(4 * DS_ACC_RES_PER_G)
 #define DS_GYRO_RES_PER_DEG_S	1024
-#define DS_GYRO_RANGE		(2048*DS_GYRO_RES_PER_DEG_S)
+#define DS_GYRO_RANGE		(2048 * DS_GYRO_RES_PER_DEG_S)
 #define DS_TOUCHPAD_WIDTH	1920
 #define DS_TOUCHPAD_HEIGHT	1080
 
@@ -363,9 +363,9 @@ struct dualsense_output_report {
 
 /* DualShock4 hardware limits */
 #define DS4_ACC_RES_PER_G	8192
-#define DS4_ACC_RANGE		(4*DS_ACC_RES_PER_G)
+#define DS4_ACC_RANGE		(4 * DS_ACC_RES_PER_G)
 #define DS4_GYRO_RES_PER_DEG_S	1024
-#define DS4_GYRO_RANGE		(2048*DS_GYRO_RES_PER_DEG_S)
+#define DS4_GYRO_RANGE		(2048 * DS_GYRO_RES_PER_DEG_S)
 #define DS4_LIGHTBAR_MAX_BLINK	255 /* 255 centiseconds */
 #define DS4_TOUCHPAD_WIDTH	1920
 #define DS4_TOUCHPAD_HEIGHT	942
@@ -1015,19 +1015,19 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	speed_2x = (gyro_speed_plus + gyro_speed_minus);
 	ds->gyro_calib_data[0].abs_code = ABS_RX;
 	ds->gyro_calib_data[0].bias = 0;
-	ds->gyro_calib_data[0].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
+	ds->gyro_calib_data[0].sens_numer = speed_2x * DS_GYRO_RES_PER_DEG_S;
 	ds->gyro_calib_data[0].sens_denom = abs(gyro_pitch_plus - gyro_pitch_bias) +
 			abs(gyro_pitch_minus - gyro_pitch_bias);
 
 	ds->gyro_calib_data[1].abs_code = ABS_RY;
 	ds->gyro_calib_data[1].bias = 0;
-	ds->gyro_calib_data[1].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
+	ds->gyro_calib_data[1].sens_numer = speed_2x * DS_GYRO_RES_PER_DEG_S;
 	ds->gyro_calib_data[1].sens_denom = abs(gyro_yaw_plus - gyro_yaw_bias) +
 			abs(gyro_yaw_minus - gyro_yaw_bias);
 
 	ds->gyro_calib_data[2].abs_code = ABS_RZ;
 	ds->gyro_calib_data[2].bias = 0;
-	ds->gyro_calib_data[2].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
+	ds->gyro_calib_data[2].sens_numer = speed_2x * DS_GYRO_RES_PER_DEG_S;
 	ds->gyro_calib_data[2].sens_denom = abs(gyro_roll_plus - gyro_roll_bias) +
 			abs(gyro_roll_minus - gyro_roll_bias);
 
@@ -1053,19 +1053,19 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	range_2g = acc_x_plus - acc_x_minus;
 	ds->accel_calib_data[0].abs_code = ABS_X;
 	ds->accel_calib_data[0].bias = acc_x_plus - range_2g / 2;
-	ds->accel_calib_data[0].sens_numer = 2*DS_ACC_RES_PER_G;
+	ds->accel_calib_data[0].sens_numer = 2 * DS_ACC_RES_PER_G;
 	ds->accel_calib_data[0].sens_denom = range_2g;
 
 	range_2g = acc_y_plus - acc_y_minus;
 	ds->accel_calib_data[1].abs_code = ABS_Y;
 	ds->accel_calib_data[1].bias = acc_y_plus - range_2g / 2;
-	ds->accel_calib_data[1].sens_numer = 2*DS_ACC_RES_PER_G;
+	ds->accel_calib_data[1].sens_numer = 2 * DS_ACC_RES_PER_G;
 	ds->accel_calib_data[1].sens_denom = range_2g;
 
 	range_2g = acc_z_plus - acc_z_minus;
 	ds->accel_calib_data[2].abs_code = ABS_Z;
 	ds->accel_calib_data[2].bias = acc_z_plus - range_2g / 2;
-	ds->accel_calib_data[2].sens_numer = 2*DS_ACC_RES_PER_G;
+	ds->accel_calib_data[2].sens_numer = 2 * DS_ACC_RES_PER_G;
 	ds->accel_calib_data[2].sens_denom = range_2g;
 
 	/*
@@ -1881,19 +1881,19 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	speed_2x = (gyro_speed_plus + gyro_speed_minus);
 	ds4->gyro_calib_data[0].abs_code = ABS_RX;
 	ds4->gyro_calib_data[0].bias = 0;
-	ds4->gyro_calib_data[0].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
+	ds4->gyro_calib_data[0].sens_numer = speed_2x * DS4_GYRO_RES_PER_DEG_S;
 	ds4->gyro_calib_data[0].sens_denom = abs(gyro_pitch_plus - gyro_pitch_bias) +
 			abs(gyro_pitch_minus - gyro_pitch_bias);
 
 	ds4->gyro_calib_data[1].abs_code = ABS_RY;
 	ds4->gyro_calib_data[1].bias = 0;
-	ds4->gyro_calib_data[1].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
+	ds4->gyro_calib_data[1].sens_numer = speed_2x * DS4_GYRO_RES_PER_DEG_S;
 	ds4->gyro_calib_data[1].sens_denom = abs(gyro_yaw_plus - gyro_yaw_bias) +
 			abs(gyro_yaw_minus - gyro_yaw_bias);
 
 	ds4->gyro_calib_data[2].abs_code = ABS_RZ;
 	ds4->gyro_calib_data[2].bias = 0;
-	ds4->gyro_calib_data[2].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
+	ds4->gyro_calib_data[2].sens_numer = speed_2x * DS4_GYRO_RES_PER_DEG_S;
 	ds4->gyro_calib_data[2].sens_denom = abs(gyro_roll_plus - gyro_roll_bias) +
 			abs(gyro_roll_minus - gyro_roll_bias);
 
@@ -1904,19 +1904,19 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	range_2g = acc_x_plus - acc_x_minus;
 	ds4->accel_calib_data[0].abs_code = ABS_X;
 	ds4->accel_calib_data[0].bias = acc_x_plus - range_2g / 2;
-	ds4->accel_calib_data[0].sens_numer = 2*DS4_ACC_RES_PER_G;
+	ds4->accel_calib_data[0].sens_numer = 2 * DS4_ACC_RES_PER_G;
 	ds4->accel_calib_data[0].sens_denom = range_2g;
 
 	range_2g = acc_y_plus - acc_y_minus;
 	ds4->accel_calib_data[1].abs_code = ABS_Y;
 	ds4->accel_calib_data[1].bias = acc_y_plus - range_2g / 2;
-	ds4->accel_calib_data[1].sens_numer = 2*DS4_ACC_RES_PER_G;
+	ds4->accel_calib_data[1].sens_numer = 2 * DS4_ACC_RES_PER_G;
 	ds4->accel_calib_data[1].sens_denom = range_2g;
 
 	range_2g = acc_z_plus - acc_z_minus;
 	ds4->accel_calib_data[2].abs_code = ABS_Z;
 	ds4->accel_calib_data[2].bias = acc_z_plus - range_2g / 2;
-	ds4->accel_calib_data[2].sens_numer = 2*DS4_ACC_RES_PER_G;
+	ds4->accel_calib_data[2].sens_numer = 2 * DS4_ACC_RES_PER_G;
 	ds4->accel_calib_data[2].sens_denom = range_2g;
 
 transfer_failed:
@@ -2058,8 +2058,10 @@ static int dualshock4_led_set_blink(struct led_classdev *led, unsigned long *del
 		ds4->lightbar_blink_off = 50;
 	} else {
 		/* Blink delays in centiseconds. */
-		ds4->lightbar_blink_on = min_t(unsigned long, *delay_on/10, DS4_LIGHTBAR_MAX_BLINK);
-		ds4->lightbar_blink_off = min_t(unsigned long, *delay_off/10, DS4_LIGHTBAR_MAX_BLINK);
+		ds4->lightbar_blink_on = min_t(unsigned long, *delay_on / 10,
+					       DS4_LIGHTBAR_MAX_BLINK);
+		ds4->lightbar_blink_off = min_t(unsigned long, *delay_off / 10,
+						DS4_LIGHTBAR_MAX_BLINK);
 	}
 
 	ds4->update_lightbar_blink = true;
@@ -2339,7 +2341,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	/* Convert timestamp (in 5.33us unit) to timestamp_us */
 	sensor_timestamp = le16_to_cpu(ds4_report->sensor_timestamp);
 	if (!ds4->sensor_timestamp_initialized) {
-		ds4->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp*16, 3);
+		ds4->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp * 16, 3);
 		ds4->sensor_timestamp_initialized = true;
 	} else {
 		uint16_t delta;
@@ -2348,7 +2350,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 			delta = (U16_MAX - ds4->prev_sensor_timestamp + sensor_timestamp + 1);
 		else
 			delta = sensor_timestamp - ds4->prev_sensor_timestamp;
-		ds4->sensor_timestamp_us += DIV_ROUND_CLOSEST(delta*16, 3);
+		ds4->sensor_timestamp_us += DIV_ROUND_CLOSEST(delta * 16, 3);
 	}
 	ds4->prev_sensor_timestamp = sensor_timestamp;
 	input_event(ds4->sensors, EV_MSC, MSC_TIMESTAMP, ds4->sensor_timestamp_us);

-- 
2.49.0



Return-Path: <linux-input+bounces-12573-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFCDAC3F93
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F4233BA585
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E421420ADE6;
	Mon, 26 May 2025 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZI5VMZVn"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5213202987;
	Mon, 26 May 2025 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263917; cv=none; b=EB/XsyUrR7i5uswneee0KYvDnleJ69wXikouiWWae/36yRZlxmOvkqXLGxiINAN0Z1taYDd4lRlGM9LCpfAR3Qbfd5nb+ncj8pZPyOnuqsCIhvXwVAiIs3ybP+PlrKajsyvG/HBoR5ISgTwCZRI7XBNvfgBMxGMmjWg51v2qeJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263917; c=relaxed/simple;
	bh=Q0uvfFWo+CyHlxhSoCwJOvWJjG5kS0VwsiOWygDyit4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdSoCQRtfMgKEbXt+4jJwWUCcARSysUD43XzvwWrsovsxiGDej23NmipKaal9o8K4wBWU0j+L41TkXTTzt4BIAQm2k2fl0TQAUQBZE83BcTbJHp+OWFWSnKXEjwbzd4xIXJbqKmtFkvTQpRjz+i89lLM/TRggDn2NXbP5w94nOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZI5VMZVn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263913;
	bh=Q0uvfFWo+CyHlxhSoCwJOvWJjG5kS0VwsiOWygDyit4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZI5VMZVn5sbxncnynDc2yswzbjrAJ7cGNdJub1gFk9lpfSLwf2LLR40P1KWlnE21G
	 1a7o5khv4MnGKe/SHFUFDP4u7DOgiNzircbHZnV7CAPN8d6hUuh8BicRevNCEtC2TZ
	 IvAhJyu1+KuzX3V5PdE30Gx2a8NFFVBGMlxLvul67837cx17opgQ+zvRs5/FsfnfEG
	 W1O3QSPJ2mIbsh90uTrP0Jgn7CBl5Jv6rp0ZlhPGX0YplbBr7NvpldLZIXB5ykeJP4
	 aQJ5HYvD3lHEwhW3OPQhEjLuXAOQqN5ED5m9nhK1tck0W0iuhXrfHIy7VwDTOYq8ON
	 5rt9PhFIhsUow==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id AEC9117E369F;
	Mon, 26 May 2025 14:51:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:25 +0300
Subject: [PATCH 02/11] HID: playstation: Add spaces around arithmetic
 operators
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-2-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
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
index 538194ce8902fe1383b57ac59743f32838dcb0df..a82174a21dcce6523a69a8ec374a72504614cedc 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -155,9 +155,9 @@ struct ps_led_info {
 
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
-#define DS_ACC_RANGE		(4*DS_ACC_RES_PER_G)
+#define DS_ACC_RANGE		(4 * DS_ACC_RES_PER_G)
 #define DS_GYRO_RES_PER_DEG_S	1024
-#define DS_GYRO_RANGE		(2048*DS_GYRO_RES_PER_DEG_S)
+#define DS_GYRO_RANGE		(2048 * DS_GYRO_RES_PER_DEG_S)
 #define DS_TOUCHPAD_WIDTH	1920
 #define DS_TOUCHPAD_HEIGHT	1080
 
@@ -364,9 +364,9 @@ struct dualsense_output_report {
 
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
@@ -1016,19 +1016,19 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
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
 
@@ -1054,19 +1054,19 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
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
@@ -1882,19 +1882,19 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
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
 
@@ -1905,19 +1905,19 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
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
@@ -2059,8 +2059,10 @@ static int dualshock4_led_set_blink(struct led_classdev *led, unsigned long *del
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
@@ -2340,7 +2342,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	/* Convert timestamp (in 5.33us unit) to timestamp_us */
 	sensor_timestamp = le16_to_cpu(ds4_report->sensor_timestamp);
 	if (!ds4->sensor_timestamp_initialized) {
-		ds4->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp*16, 3);
+		ds4->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp * 16, 3);
 		ds4->sensor_timestamp_initialized = true;
 	} else {
 		uint16_t delta;
@@ -2349,7 +2351,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
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



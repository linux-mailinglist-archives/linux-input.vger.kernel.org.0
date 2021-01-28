Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9D6307C73
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbhA1R3s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:29:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbhA1R10 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:27:26 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AFEC061788
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:10 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id u11so3697030plg.13
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0BNxZf2ibanKm0PakeuZU4wxa81L5UA5NxluIoI44Eo=;
        b=1XH212sKELsNlW++Oi+SLc9DzXMdVkoGqhcdQdCxj7SJIk73dfRcAksBYnI4bUS0u9
         ZAkvHO+XbTAvSv9KcTVdN7VMRA8xyW4JCralPbLVy9ZC9LnML8e0g/12FkQqfBzjTkKU
         jH0URoGj61Y7ugAvfQBTfNE1/PJd8m7DxrfZ8AjbPUbOVxjucSWkpgQ0QJvoq8FewM1N
         EThCeATTb5zHnH45+2bOzgtShLVyxqpeXco8avv0sCIuGpqLh6ei4Cw+M7rd6MDIrF9B
         wH5YMomeT38NiN7NkdaNhV+oLSfoXhKnK3wJERCAJTTeFeADuXDKh6cXGB2/4BSwzX5t
         EkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0BNxZf2ibanKm0PakeuZU4wxa81L5UA5NxluIoI44Eo=;
        b=hJs9/jYHCj/EYbbiqaGOtwtn0Jul17unObf72WhUu/1RTGK0703VMvak5MTR7X6UkB
         MU+ng0ArtOCp/yqLkINC5kEr6Yype0OJK3ko8qAv33Sm3m679KYN7DqElQiNCASFAzjU
         rNZEri6+dfqgWU5C4lVP8rToOBK1Hdszn7qI///bcr3OTIrRSuCPUCzTlMmE1hrFNNcr
         AyEzXk2emn2gcDbLXDkys8SSRg/lbVEP5vVoF5Vhs6QlhjG3RqAQYvYGo13eDZQTY4nq
         Fi9zh6dtcVzR64P5JW6bfWCgSJrnITtfeJiJMPaEvpQVFC6DR+0ri1V9UaQ+yDFlWFt5
         hoQg==
X-Gm-Message-State: AOAM531LAbVbyuJz96Am4vc/1vtvARHjVG+cZzMYyCaUDSEqQ+mS9DQ3
        amxiXb8FqnUSe/+NUoebegvta8f/F7OOcQ==
X-Google-Smtp-Source: ABdhPJyX2iY0jv8axDXP6WPKkgsbYIW+qfyc8d41M6ExdYk4YnYExrjhE2cmSkbE/H46sVRVHJqADw==
X-Received: by 2002:a17:902:d48a:b029:de:ae4d:2c7b with SMTP id c10-20020a170902d48ab02900deae4d2c7bmr558724plg.62.1611854830229;
        Thu, 28 Jan 2021 09:27:10 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:09 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 05/13] HID: playstation: add DualSense accelerometer and gyroscope support.
Date:   Thu, 28 Jan 2021 09:26:49 -0800
Message-Id: <20210128172657.24516-6-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense features an accelerometer and gyroscope. The data is
embedded into the main HID input reports. Expose both sensors through
through a separate evdev node.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 203 ++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 64d6d736c435..bcdeb2fd45d7 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -32,9 +32,19 @@ struct ps_device {
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
 
+/* Calibration data for playstation motion sensors. */
+struct ps_calibration_data {
+	int abs_code;
+	short bias;
+	int sens_numer;
+	int sens_denom;
+};
+
 #define DS_INPUT_REPORT_USB			0x01
 #define DS_INPUT_REPORT_USB_SIZE		64
 
+#define DS_FEATURE_REPORT_CALIBRATION		0x05
+#define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
 #define DS_FEATURE_REPORT_PAIRING_INFO		0x09
 #define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	20
 
@@ -68,13 +78,27 @@ struct ps_device {
 #define DS_TOUCH_POINT_INACTIVE BIT(7)
 
 /* DualSense hardware limits */
+#define DS_ACC_RES_PER_G	8192
+#define DS_ACC_RANGE		(4*DS_ACC_RES_PER_G)
+#define DS_GYRO_RES_PER_DEG_S	1024
+#define DS_GYRO_RANGE		(2048*DS_GYRO_RES_PER_DEG_S)
 #define DS_TOUCHPAD_WIDTH	1920
 #define DS_TOUCHPAD_HEIGHT	1080
 
 struct dualsense {
 	struct ps_device base;
 	struct input_dev *gamepad;
+	struct input_dev *sensors;
 	struct input_dev *touchpad;
+
+	/* Calibration data for accelerometer and gyroscope. */
+	struct ps_calibration_data accel_calib_data[3];
+	struct ps_calibration_data gyro_calib_data[3];
+
+	/* Timestamp for sensor data */
+	bool sensor_timestamp_initialized;
+	uint32_t prev_sensor_timestamp;
+	uint32_t sensor_timestamp_us;
 };
 
 struct dualsense_touch_point {
@@ -284,6 +308,43 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 	return 0;
 }
 
+static struct input_dev *ps_sensors_create(struct hid_device *hdev, int accel_range, int accel_res,
+		int gyro_range, int gyro_res)
+{
+	struct input_dev *sensors;
+	int ret;
+
+	sensors = ps_allocate_input_dev(hdev, "Motion Sensors");
+	if (IS_ERR(sensors))
+		return ERR_CAST(sensors);
+
+	__set_bit(INPUT_PROP_ACCELEROMETER, sensors->propbit);
+	__set_bit(EV_MSC, sensors->evbit);
+	__set_bit(MSC_TIMESTAMP, sensors->mscbit);
+
+	/* Accelerometer */
+	input_set_abs_params(sensors, ABS_X, -accel_range, accel_range, 16, 0);
+	input_set_abs_params(sensors, ABS_Y, -accel_range, accel_range, 16, 0);
+	input_set_abs_params(sensors, ABS_Z, -accel_range, accel_range, 16, 0);
+	input_abs_set_res(sensors, ABS_X, accel_res);
+	input_abs_set_res(sensors, ABS_Y, accel_res);
+	input_abs_set_res(sensors, ABS_Z, accel_res);
+
+	/* Gyroscope */
+	input_set_abs_params(sensors, ABS_RX, -gyro_range, gyro_range, 16, 0);
+	input_set_abs_params(sensors, ABS_RY, -gyro_range, gyro_range, 16, 0);
+	input_set_abs_params(sensors, ABS_RZ, -gyro_range, gyro_range, 16, 0);
+	input_abs_set_res(sensors, ABS_RX, gyro_res);
+	input_abs_set_res(sensors, ABS_RY, gyro_res);
+	input_abs_set_res(sensors, ABS_RZ, gyro_res);
+
+	ret = input_register_device(sensors);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return sensors;
+}
+
 static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width, int height,
 		unsigned int num_contacts)
 {
@@ -312,6 +373,96 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
 	return touchpad;
 }
 
+static int dualsense_get_calibration_data(struct dualsense *ds)
+{
+	short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
+	short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
+	short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
+	short gyro_speed_plus, gyro_speed_minus;
+	short acc_x_plus, acc_x_minus;
+	short acc_y_plus, acc_y_minus;
+	short acc_z_plus, acc_z_minus;
+	int speed_2x;
+	int range_2g;
+	int ret = 0;
+	uint8_t *buf;
+
+	buf = kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_CALIBRATION, buf,
+			DS_FEATURE_REPORT_CALIBRATION_SIZE);
+	if (ret) {
+		hid_err(ds->base.hdev, "Failed to retrieve DualSense calibration info: %d\n", ret);
+		goto err_free;
+	}
+
+	gyro_pitch_bias  = get_unaligned_le16(&buf[1]);
+	gyro_yaw_bias    = get_unaligned_le16(&buf[3]);
+	gyro_roll_bias   = get_unaligned_le16(&buf[5]);
+	gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
+	gyro_pitch_minus = get_unaligned_le16(&buf[9]);
+	gyro_yaw_plus    = get_unaligned_le16(&buf[11]);
+	gyro_yaw_minus   = get_unaligned_le16(&buf[13]);
+	gyro_roll_plus   = get_unaligned_le16(&buf[15]);
+	gyro_roll_minus  = get_unaligned_le16(&buf[17]);
+	gyro_speed_plus  = get_unaligned_le16(&buf[19]);
+	gyro_speed_minus = get_unaligned_le16(&buf[21]);
+	acc_x_plus       = get_unaligned_le16(&buf[23]);
+	acc_x_minus      = get_unaligned_le16(&buf[25]);
+	acc_y_plus       = get_unaligned_le16(&buf[27]);
+	acc_y_minus      = get_unaligned_le16(&buf[29]);
+	acc_z_plus       = get_unaligned_le16(&buf[31]);
+	acc_z_minus      = get_unaligned_le16(&buf[33]);
+
+	/*
+	 * Set gyroscope calibration and normalization parameters.
+	 * Data values will be normalized to 1/DS_GYRO_RES_PER_DEG_S degree/s.
+	 */
+	speed_2x = (gyro_speed_plus + gyro_speed_minus);
+	ds->gyro_calib_data[0].abs_code = ABS_RX;
+	ds->gyro_calib_data[0].bias = gyro_pitch_bias;
+	ds->gyro_calib_data[0].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
+	ds->gyro_calib_data[0].sens_denom = gyro_pitch_plus - gyro_pitch_minus;
+
+	ds->gyro_calib_data[1].abs_code = ABS_RY;
+	ds->gyro_calib_data[1].bias = gyro_yaw_bias;
+	ds->gyro_calib_data[1].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
+	ds->gyro_calib_data[1].sens_denom = gyro_yaw_plus - gyro_yaw_minus;
+
+	ds->gyro_calib_data[2].abs_code = ABS_RZ;
+	ds->gyro_calib_data[2].bias = gyro_roll_bias;
+	ds->gyro_calib_data[2].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
+	ds->gyro_calib_data[2].sens_denom = gyro_roll_plus - gyro_roll_minus;
+
+	/*
+	 * Set accelerometer calibration and normalization parameters.
+	 * Data values will be normalized to 1/DS_ACC_RES_PER_G g.
+	 */
+	range_2g = acc_x_plus - acc_x_minus;
+	ds->accel_calib_data[0].abs_code = ABS_X;
+	ds->accel_calib_data[0].bias = acc_x_plus - range_2g / 2;
+	ds->accel_calib_data[0].sens_numer = 2*DS_ACC_RES_PER_G;
+	ds->accel_calib_data[0].sens_denom = range_2g;
+
+	range_2g = acc_y_plus - acc_y_minus;
+	ds->accel_calib_data[1].abs_code = ABS_Y;
+	ds->accel_calib_data[1].bias = acc_y_plus - range_2g / 2;
+	ds->accel_calib_data[1].sens_numer = 2*DS_ACC_RES_PER_G;
+	ds->accel_calib_data[1].sens_denom = range_2g;
+
+	range_2g = acc_z_plus - acc_z_minus;
+	ds->accel_calib_data[2].abs_code = ABS_Z;
+	ds->accel_calib_data[2].bias = acc_z_plus - range_2g / 2;
+	ds->accel_calib_data[2].sens_numer = 2*DS_ACC_RES_PER_G;
+	ds->accel_calib_data[2].sens_denom = range_2g;
+
+err_free:
+	kfree(buf);
+	return ret;
+}
+
 static int dualsense_get_mac_address(struct dualsense *ds)
 {
 	uint8_t *buf;
@@ -343,6 +494,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	struct dualsense_input_report *ds_report;
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
+	uint32_t sensor_timestamp;
 	unsigned long flags;
 	int i;
 
@@ -387,6 +539,44 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
+	/* Parse and calibrate gyroscope data. */
+	for (i = 0; i < ARRAY_SIZE(ds_report->gyro); i++) {
+		int raw_data = (short)le16_to_cpu(ds_report->gyro[i]);
+		int calib_data = mult_frac(ds->gyro_calib_data[i].sens_numer,
+					   raw_data - ds->gyro_calib_data[i].bias,
+					   ds->gyro_calib_data[i].sens_denom);
+
+		input_report_abs(ds->sensors, ds->gyro_calib_data[i].abs_code, calib_data);
+	}
+
+	/* Parse and calibrate accelerometer data. */
+	for (i = 0; i < ARRAY_SIZE(ds_report->accel); i++) {
+		int raw_data = (short)le16_to_cpu(ds_report->accel[i]);
+		int calib_data = mult_frac(ds->accel_calib_data[i].sens_numer,
+					   raw_data - ds->accel_calib_data[i].bias,
+					   ds->accel_calib_data[i].sens_denom);
+
+		input_report_abs(ds->sensors, ds->accel_calib_data[i].abs_code, calib_data);
+	}
+
+	/* Convert timestamp (in 0.33us unit) to timestamp_us */
+	sensor_timestamp = le32_to_cpu(ds_report->sensor_timestamp);
+	if (!ds->sensor_timestamp_initialized) {
+		ds->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp, 3);
+		ds->sensor_timestamp_initialized = true;
+	} else {
+		uint32_t delta;
+
+		if (ds->prev_sensor_timestamp > sensor_timestamp)
+			delta = (U32_MAX - ds->prev_sensor_timestamp + sensor_timestamp + 1);
+		else
+			delta = sensor_timestamp - ds->prev_sensor_timestamp;
+		ds->sensor_timestamp_us += DIV_ROUND_CLOSEST(delta, 3);
+	}
+	ds->prev_sensor_timestamp = sensor_timestamp;
+	input_event(ds->sensors, EV_MSC, MSC_TIMESTAMP, ds->sensor_timestamp_us);
+	input_sync(ds->sensors);
+
 	for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
 		struct dualsense_touch_point *point = &ds_report->points[i];
 		bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
@@ -476,12 +666,25 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
+	ret = dualsense_get_calibration_data(ds);
+	if (ret) {
+		hid_err(hdev, "Failed to get calibration data from DualSense\n");
+		goto err;
+	}
+
 	ds->gamepad = ps_gamepad_create(hdev);
 	if (IS_ERR(ds->gamepad)) {
 		ret = PTR_ERR(ds->gamepad);
 		goto err;
 	}
 
+	ds->sensors = ps_sensors_create(hdev, DS_ACC_RANGE, DS_ACC_RES_PER_G,
+			DS_GYRO_RANGE, DS_GYRO_RES_PER_DEG_S);
+	if (IS_ERR(ds->sensors)) {
+		ret = PTR_ERR(ds->sensors);
+		goto err;
+	}
+
 	ds->touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
 	if (IS_ERR(ds->touchpad)) {
 		ret = PTR_ERR(ds->touchpad);
-- 
2.26.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DAC2F961B
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730610AbhAQXLN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730615AbhAQXKq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:10:46 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC55FC0613C1
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:05 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id m6so9117147pfm.6
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UHEwodg5gat5syZUMfnxGKTyC02P65S4cuJqByRu5xc=;
        b=ODlFds4xywVa6Milusuw1Hyg5WFZwDOGl9BMY+Ir2wpr7TsV2kcy+SiB/LsrJY3as5
         iaMrD3ppr9GigI6eB27i2YfaocZBfTTYWwgN0l4gNwDtC3p1nOUiDTk9znruA6JJUR9L
         a6EM9TX/bY2EyJd9o00B8hSgT+CAYhsOYvnsof2a/54jPBfqf1qxrcQCNzgzXdBaPtLU
         hbG55gdQdQ0R2wZpqQo9Vgj2B7em6R0jBSu8Sn/f43qdhS3KRabExsmm0y6gwY0CVUhP
         yv/ZGWrxdd7xPc1NOj7tixdPZzYrv1hPDmNhMzvsEbV0qO16udjDXqc/hgoiosSEVQ9n
         BOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UHEwodg5gat5syZUMfnxGKTyC02P65S4cuJqByRu5xc=;
        b=QI4jsUSJ3UvWaNoIK5bIPGltsZdeaFQAcx1sSTnEbOVZaA7JYWPgSJjZxdzdA9Gjwo
         W9r3hRTf8KSkMahPuxqtHGYFbINK9ZFg7LYKp/t4sgPKp5soBd7ZGVKQ2ANAhHJ34vBC
         lN8rV4A6QzvgfiGkQiEB83MapndkkB5p9P/Bhpfg+9ZvfRcJBA+/RFewWfQeXr9f83PK
         NB7t4ZItqMlgW0rCqFud6oelCHqjg8nSrpnJdDLnaGGG0HN6A3Dmr5R4mqa4U08Xj6mE
         dT5OC3TR9UZpA+mhqqlUf6UftI3NNidpB7tbXNfMZYuw8EgqrRRZ/s6pl6XYIoZJ1lfy
         4f/w==
X-Gm-Message-State: AOAM532ynFND94tFN0i975KhbR0omE+xYZrtYN2jYXK1jEMnZ18WN0V1
        YsXvI3JIzhBldwLG9WEFkCkSZw==
X-Google-Smtp-Source: ABdhPJzbUXPpujE1cWeXjPKjTqQiOnrrsHData4rDlIAe4/qiZqN18iex63qtZKVE7ecBeftLWcjFw==
X-Received: by 2002:a62:760b:0:b029:1b6:3897:3f86 with SMTP id r11-20020a62760b0000b02901b638973f86mr6652221pfc.24.1610925005281;
        Sun, 17 Jan 2021 15:10:05 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id g3sm14018746pjt.34.2021.01.17.15.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:10:04 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 04/12] HID: playstation: add DualSense touchpad support.
Date:   Sun, 17 Jan 2021 15:09:48 -0800
Message-Id: <20210117230956.173031-5-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117230956.173031-1-roderick@gaikai.com>
References: <20210117230956.173031-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Implement support for DualSense touchpad as a separate input device.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 269 ++++++++++++++++++++++++++++++++++
 1 file changed, 269 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index c5c450fc25db..cde7d7fe5bac 100644
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
 
@@ -60,9 +70,35 @@ struct ps_device {
 #define DS_STATUS_CHARGING		GENMASK(7, 4)
 #define DS_STATUS_CHARGING_SHIFT	4
 
+/*
+ * Status of a DualSense touch point contact.
+ * Contact IDs, with highest bit set are 'inactive'
+ * and any associated data is then invalid.
+ */
+#define DS_TOUCH_POINT_INACTIVE BIT(7)
+
+/* DualSense hardware limits */
+#define DS_ACC_RES_PER_G	8192
+#define DS_ACC_RANGE		(4*DS_ACC_RES_PER_G)
+#define DS_GYRO_RES_PER_DEG_S	1024
+#define DS_GYRO_RANGE		(2048*DS_GYRO_RES_PER_DEG_S)
+#define DS_TOUCHPAD_WIDTH	1920
+#define DS_TOUCHPAD_HEIGHT	1080
+
 struct dualsense {
 	struct ps_device base;
 	struct input_dev *gamepad;
+	struct input_dev *sensors;
+	struct input_dev *touchpad;
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
@@ -272,6 +308,161 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
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
+static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width, int height,
+		unsigned int num_contacts)
+{
+	struct input_dev *touchpad;
+	int ret;
+
+	touchpad = ps_allocate_input_dev(hdev, "Touchpad");
+	if (IS_ERR(touchpad))
+		return ERR_CAST(touchpad);
+
+	/* Map button underneath touchpad to BTN_LEFT. */
+	input_set_capability(touchpad, EV_KEY, BTN_LEFT);
+	__set_bit(INPUT_PROP_BUTTONPAD, touchpad->propbit);
+
+	input_set_abs_params(touchpad, ABS_MT_POSITION_X, 0, width - 1, 0, 0);
+	input_set_abs_params(touchpad, ABS_MT_POSITION_Y, 0, height - 1, 0, 0);
+
+	ret = input_mt_init_slots(touchpad, num_contacts, INPUT_MT_POINTER);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = input_register_device(touchpad);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return touchpad;
+}
+
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
@@ -303,7 +494,9 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	struct dualsense_input_report *ds_report;
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
+	uint32_t sensor_timestamp;
 	unsigned long flags;
+	int i;
 
 	/*
 	 * DualSense in USB uses the full HID report for reportID 1, but
@@ -346,6 +539,63 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
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
+	for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
+		struct dualsense_touch_point *point = &ds_report->points[i];
+		bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
+
+		input_mt_slot(ds->touchpad, i);
+		input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
+
+		if (active) {
+			int x = (point->x_hi << 8) | point->x_lo;
+			int y = (point->y_hi << 4) | point->y_lo;
+
+			input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
+			input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
+		}
+	}
+	input_mt_sync_frame(ds->touchpad);
+	input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
+	input_sync(ds->touchpad);
+
 	battery_data = ds_report->status & DS_STATUS_BATTERY_CAPACITY;
 	charging_status = (ds_report->status & DS_STATUS_CHARGING) >> DS_STATUS_CHARGING_SHIFT;
 
@@ -416,12 +666,31 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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
+					DS_GYRO_RANGE, DS_GYRO_RES_PER_DEG_S);
+	if (IS_ERR(ds->sensors)) {
+		ret = PTR_ERR(ds->sensors);
+		goto err;
+	}
+
+	ds->touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
+	if (IS_ERR(ds->touchpad)) {
+		ret = PTR_ERR(ds->touchpad);
+		goto err;
+	}
+
 	ret = ps_device_register_battery(ps_dev);
 	if (ret)
 		goto err;
-- 
2.26.2


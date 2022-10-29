Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD2D6124F7
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJ2StZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiJ2StY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:24 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7CC45986
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:23 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id g129so7480455pgc.7
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzLSy4hnUQdxSk7oGGKkSfdsYLI93s11XMcS8dFTWaY=;
        b=JGB7jGPkoSWsjVkScICnRy7Hz7MV5txWfBCgGAp30a63sp+RJoBvBXmVmnWO4JaNko
         GBAwLQGGrsvv8Q1keB1lSHF8lTM8igr/qFwAsNNC0Q8dDS/l8F3kHMI6eaphcrhpqSKr
         NKpXwIBdm+x70QTR3ugxDlXvUVPMiSpn/Cuf3vA4xvZsB/VvFtDYY6Jrtz/9YeVfURU9
         jLNMxUh2kyOPQFEhhjRCxFLVRD32muCcwV8aXXT0Wrvh2naTszQHjHj3WTekLc3+X+9l
         JlYHodeSYX5fuN4wwoii1qHj/bepeSKfn2/ac6FsVN5SNn4gmsEwJdHrarQYv186ifzT
         aC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzLSy4hnUQdxSk7oGGKkSfdsYLI93s11XMcS8dFTWaY=;
        b=agEaEQVeHyUvkJJJj7ci77e6qOx+46chcW9utMIzyasT2bg1hjnzv8UEIhaJZFhb2k
         +YSC5eYzZTn5K++uZP7NVfnFYKghdWOWtF7GtN6b3kY5JTqn9ETK+UG3d018WeU0Xqjg
         MahPIsLfb357M6AXw92calwlM5CVj2ycz4D54GoI3OwR0UbijxV75qP4BAaBeyQkmG/B
         pRmfWhdx5FJ5WqiIgzPx2kBDunHojvFnYMNhW+pwzlCgYQVEtZ3SrW4EI6xzhfBiXTpA
         158ygY0QwqoepVgEENVtVJO9umlzm24Lijyf2lIgicN6h92/M1LphVHl42Gz4aJJZrda
         JpXQ==
X-Gm-Message-State: ACrzQf1uac/IvtFvQWY2z7jAj0qAZrjF7/cJ77H9i9VUl1jEgvsjErZ3
        6cHGhyKTiUgL8LBREm5BMcn76w==
X-Google-Smtp-Source: AMsMyM5ziuuTclKh/4U7hI6sNWd5JSKuEg3vx4LiojBtgJ/sdYcEAjHE/3P3cfpXo/B+k9255SOCnQ==
X-Received: by 2002:a63:5c5a:0:b0:46e:be05:a79a with SMTP id n26-20020a635c5a000000b0046ebe05a79amr5142248pgm.138.1667069363398;
        Sat, 29 Oct 2022 11:49:23 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:22 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 05/13] HID: playstation: add DualShock4 accelerometer and gyroscope support.
Date:   Sat, 29 Oct 2022 11:48:43 -0700
Message-Id: <20221029184851.282366-6-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support accelerometer and gyroscope as separate input devices similar
how DualSense and hid-sony do it.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 170 +++++++++++++++++++++++++++++++++-
 1 file changed, 168 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 63fc3a67ea74..03f33dea5d93 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -286,6 +286,8 @@ struct dualsense_output_report {
 #define DS4_INPUT_REPORT_USB			0x01
 #define DS4_INPUT_REPORT_USB_SIZE		64
 
+#define DS4_FEATURE_REPORT_CALIBRATION		0x02
+#define DS4_FEATURE_REPORT_CALIBRATION_SIZE	37
 #define DS4_FEATURE_REPORT_FIRMWARE_INFO	0xa3
 #define DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE	49
 #define DS4_FEATURE_REPORT_PAIRING_INFO		0x12
@@ -305,13 +307,27 @@ struct dualsense_output_report {
 #define DS4_BATTERY_STATUS_FULL		11
 
 /* DualShock4 hardware limits */
+#define DS4_ACC_RES_PER_G	8192
+#define DS4_ACC_RANGE		(4*DS_ACC_RES_PER_G)
+#define DS4_GYRO_RES_PER_DEG_S	1024
+#define DS4_GYRO_RANGE		(2048*DS_GYRO_RES_PER_DEG_S)
 #define DS4_TOUCHPAD_WIDTH	1920
 #define DS4_TOUCHPAD_HEIGHT	942
 
 struct dualshock4 {
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
 
 struct dualshock4_touch_point {
@@ -334,9 +350,16 @@ struct dualshock4_input_report_common {
 	uint8_t rx, ry;
 	uint8_t buttons[3];
 	uint8_t z, rz;
-	uint8_t reserved[20];
+
+	/* Motion sensors */
+	__le16 sensor_timestamp;
+	uint8_t sensor_temperature;
+	__le16 gyro[3]; /* x, y, z */
+	__le16 accel[3]; /* x, y, z */
+	uint8_t reserved2[5];
+
 	uint8_t status[2];
-	uint8_t reserved2;
+	uint8_t reserved3;
 } __packed;
 static_assert(sizeof(struct dualshock4_input_report_common) == 32);
 
@@ -1531,6 +1554,97 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return ERR_PTR(ret);
 }
 
+static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
+{
+	struct hid_device *hdev = ds4->base.hdev;
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
+	buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
+			DS4_FEATURE_REPORT_CALIBRATION_SIZE);
+	if (ret) {
+		hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
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
+	 * Data values will be normalized to 1/DS4_GYRO_RES_PER_DEG_S degree/s.
+	 */
+	speed_2x = (gyro_speed_plus + gyro_speed_minus);
+	ds4->gyro_calib_data[0].abs_code = ABS_RX;
+	ds4->gyro_calib_data[0].bias = gyro_pitch_bias;
+	ds4->gyro_calib_data[0].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
+	ds4->gyro_calib_data[0].sens_denom = gyro_pitch_plus - gyro_pitch_minus;
+
+	ds4->gyro_calib_data[1].abs_code = ABS_RY;
+	ds4->gyro_calib_data[1].bias = gyro_yaw_bias;
+	ds4->gyro_calib_data[1].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
+	ds4->gyro_calib_data[1].sens_denom = gyro_yaw_plus - gyro_yaw_minus;
+
+	ds4->gyro_calib_data[2].abs_code = ABS_RZ;
+	ds4->gyro_calib_data[2].bias = gyro_roll_bias;
+	ds4->gyro_calib_data[2].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
+	ds4->gyro_calib_data[2].sens_denom = gyro_roll_plus - gyro_roll_minus;
+
+	/*
+	 * Set accelerometer calibration and normalization parameters.
+	 * Data values will be normalized to 1/DS4_ACC_RES_PER_G g.
+	 */
+	range_2g = acc_x_plus - acc_x_minus;
+	ds4->accel_calib_data[0].abs_code = ABS_X;
+	ds4->accel_calib_data[0].bias = acc_x_plus - range_2g / 2;
+	ds4->accel_calib_data[0].sens_numer = 2*DS4_ACC_RES_PER_G;
+	ds4->accel_calib_data[0].sens_denom = range_2g;
+
+	range_2g = acc_y_plus - acc_y_minus;
+	ds4->accel_calib_data[1].abs_code = ABS_Y;
+	ds4->accel_calib_data[1].bias = acc_y_plus - range_2g / 2;
+	ds4->accel_calib_data[1].sens_numer = 2*DS4_ACC_RES_PER_G;
+	ds4->accel_calib_data[1].sens_denom = range_2g;
+
+	range_2g = acc_z_plus - acc_z_minus;
+	ds4->accel_calib_data[2].abs_code = ABS_Z;
+	ds4->accel_calib_data[2].bias = acc_z_plus - range_2g / 2;
+	ds4->accel_calib_data[2].sens_numer = 2*DS4_ACC_RES_PER_G;
+	ds4->accel_calib_data[2].sens_denom = range_2g;
+
+err_free:
+	kfree(buf);
+	return ret;
+}
+
 static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
 {
 	uint8_t *buf;
@@ -1587,6 +1701,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	struct dualshock4_touch_report *touch_reports;
 	uint8_t battery_capacity, num_touch_reports, value;
 	int battery_status, i, j;
+	uint16_t sensor_timestamp;
 	unsigned long flags;
 
 	/*
@@ -1634,6 +1749,44 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	input_report_key(ds4->gamepad, BTN_MODE,   ds4_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds4->gamepad);
 
+	/* Parse and calibrate gyroscope data. */
+	for (i = 0; i < ARRAY_SIZE(ds4_report->gyro); i++) {
+		int raw_data = (short)le16_to_cpu(ds4_report->gyro[i]);
+		int calib_data = mult_frac(ds4->gyro_calib_data[i].sens_numer,
+					   raw_data - ds4->gyro_calib_data[i].bias,
+					   ds4->gyro_calib_data[i].sens_denom);
+
+		input_report_abs(ds4->sensors, ds4->gyro_calib_data[i].abs_code, calib_data);
+	}
+
+	/* Parse and calibrate accelerometer data. */
+	for (i = 0; i < ARRAY_SIZE(ds4_report->accel); i++) {
+		int raw_data = (short)le16_to_cpu(ds4_report->accel[i]);
+		int calib_data = mult_frac(ds4->accel_calib_data[i].sens_numer,
+					   raw_data - ds4->accel_calib_data[i].bias,
+					   ds4->accel_calib_data[i].sens_denom);
+
+		input_report_abs(ds4->sensors, ds4->accel_calib_data[i].abs_code, calib_data);
+	}
+
+	/* Convert timestamp (in 5.33us unit) to timestamp_us */
+	sensor_timestamp = le16_to_cpu(ds4_report->sensor_timestamp);
+	if (!ds4->sensor_timestamp_initialized) {
+		ds4->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp*16, 3);
+		ds4->sensor_timestamp_initialized = true;
+	} else {
+		uint16_t delta;
+
+		if (ds4->prev_sensor_timestamp > sensor_timestamp)
+			delta = (U16_MAX - ds4->prev_sensor_timestamp + sensor_timestamp + 1);
+		else
+			delta = sensor_timestamp - ds4->prev_sensor_timestamp;
+		ds4->sensor_timestamp_us += DIV_ROUND_CLOSEST(delta*16, 3);
+	}
+	ds4->prev_sensor_timestamp = sensor_timestamp;
+	input_event(ds4->sensors, EV_MSC, MSC_TIMESTAMP, ds4->sensor_timestamp_us);
+	input_sync(ds4->sensors);
+
 	for (i = 0; i < num_touch_reports; i++) {
 		struct dualshock4_touch_report *touch_report = &touch_reports[i];
 
@@ -1748,12 +1901,25 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = dualshock4_get_calibration_data(ds4);
+	if (ret) {
+		hid_err(hdev, "Failed to get calibration data from DualShock4\n");
+		goto err;
+	}
+
 	ds4->gamepad = ps_gamepad_create(hdev, NULL);
 	if (IS_ERR(ds4->gamepad)) {
 		ret = PTR_ERR(ds4->gamepad);
 		goto err;
 	}
 
+	ds4->sensors = ps_sensors_create(hdev, DS4_ACC_RANGE, DS4_ACC_RES_PER_G,
+			DS4_GYRO_RANGE, DS4_GYRO_RES_PER_DEG_S);
+	if (IS_ERR(ds4->sensors)) {
+		ret = PTR_ERR(ds4->sensors);
+		goto err;
+	}
+
 	ds4->touchpad = ps_touchpad_create(hdev, DS4_TOUCHPAD_WIDTH, DS4_TOUCHPAD_HEIGHT, 2);
 	if (IS_ERR(ds4->touchpad)) {
 		ret = PTR_ERR(ds4->touchpad);
-- 
2.37.3


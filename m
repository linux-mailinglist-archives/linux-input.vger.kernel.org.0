Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB3096124FD
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJ2Stn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiJ2Stn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:43 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E17E08C
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:41 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id j12so7539090plj.5
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J36xzuyhBLKi0VZ+Hws5Z6a9JxZxNltccSD7cDPx5q8=;
        b=5ywxbjDFHGEI974Vu2LnXKDz3IfeCWMUJIT/O2e4aJ1Fka5tHaTd88ccRolD8U375X
         kcrowyDf66l/9WnCUX0B0D954MlwKoZummyE1b5veveBjHGP0b2wGWS0LJhxN5ynlawb
         RO08kmhS6jzo/fLx44TCqEbG36hqgmsqVlDzzcoDVc0Oyk91rFZfjHlToByL+dbRp0ZJ
         phMCWJafSZHgY/GtdegRpZ+v1tnv948NK/hOtPj6WRcPt4/RCwWXzIcHFHW4BboXew6m
         6wTV1ysxi9rarBKFgU4x7ICkbMREJHIa9gFq5HzKJ84TQQdzVTwN+g9YkfeiyVOmNsRj
         elDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J36xzuyhBLKi0VZ+Hws5Z6a9JxZxNltccSD7cDPx5q8=;
        b=AVVi4NlS7Fz8FhXgWxvMIWgDiMhyusqZ9sq5YaaG7SufbakWNz+zUVr1mQV0xzbjvU
         JDLhBT0EbaP18in2cxaNCgTOGT9Jdc618TdU7lBg7ZhOEPkK+wGGiTUczBkA4AQwFe9/
         gUJ5IgNXxhCeS6ZPClgLnemvUe7ZZi6uJ1rKiTkJ8VexOzeRDbEQ076lx3rdTlUqvRim
         C++VERYDD845evHAWOWZ7tJKh70SpuyHiCAPzl9GALpZLiIzlw3MPJyRm9tODwGhY64Y
         oyTGqcG61cc6jvkHh5H/jYp36gXRzeaCn6fnSKlBlAedElxVAfap+h7IZGNZg9IyPEgO
         pi+w==
X-Gm-Message-State: ACrzQf02RtvLzQ6KfiRDzPnck5M6CJknAZN1ZV91Pyqeu2I993EoXVIf
        tmg7+NrtnItUsFg1mWHoBY9w8A==
X-Google-Smtp-Source: AMsMyM6UHH+zo/yWaqcifKSmc1/2QM7ruLSkB8JzfvTPkTYx+Yfy6GnpprTd7yud5cEguvWmwng11Q==
X-Received: by 2002:a17:902:8685:b0:186:cb66:d77b with SMTP id g5-20020a170902868500b00186cb66d77bmr5743741plo.39.1667069381087;
        Sat, 29 Oct 2022 11:49:41 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:40 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 11/13] HID: playstation: add DualShock4 bluetooth support.
Date:   Sat, 29 Oct 2022 11:48:49 -0700
Message-Id: <20221029184851.282366-12-roderick.colenbrander@sony.com>
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

Add support for DualShock4 in Bluetooth mode. In Bluetooth, the device
is a bit strange in that after 'calibration' it switches sending all its
input data from a basic report (only containing buttons/sticks) to an
extended report, which also contains touchpad, motion sensors and other
data. The overall design of this code is similar to the DualSense code.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 170 ++++++++++++++++++++++++++++------
 1 file changed, 144 insertions(+), 26 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 81a12aafed17..a2f1bd1400a2 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -287,11 +287,17 @@ struct dualsense_output_report {
 
 #define DS4_INPUT_REPORT_USB			0x01
 #define DS4_INPUT_REPORT_USB_SIZE		64
+#define DS4_INPUT_REPORT_BT			0x11
+#define DS4_INPUT_REPORT_BT_SIZE		78
 #define DS4_OUTPUT_REPORT_USB			0x05
 #define DS4_OUTPUT_REPORT_USB_SIZE		32
+#define DS4_OUTPUT_REPORT_BT			0x11
+#define DS4_OUTPUT_REPORT_BT_SIZE		78
 
 #define DS4_FEATURE_REPORT_CALIBRATION		0x02
 #define DS4_FEATURE_REPORT_CALIBRATION_SIZE	37
+#define DS4_FEATURE_REPORT_CALIBRATION_BT	0x05
+#define DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE	41
 #define DS4_FEATURE_REPORT_FIRMWARE_INFO	0xa3
 #define DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE	49
 #define DS4_FEATURE_REPORT_PAIRING_INFO		0x12
@@ -310,6 +316,9 @@ struct dualsense_output_report {
 /* Battery status within batery_status field. */
 #define DS4_BATTERY_STATUS_FULL		11
 
+#define DS4_OUTPUT_HWCTL_CRC32		0x40
+#define DS4_OUTPUT_HWCTL_HID		0x80
+
 /* Flags for DualShock4 output report. */
 #define DS4_OUTPUT_VALID_FLAG0_MOTOR		0x01
 #define DS4_OUTPUT_VALID_FLAG0_LED		0x02
@@ -401,6 +410,17 @@ struct dualshock4_input_report_usb {
 } __packed;
 static_assert(sizeof(struct dualshock4_input_report_usb) == DS4_INPUT_REPORT_USB_SIZE);
 
+struct dualshock4_input_report_bt {
+	uint8_t report_id; /* 0x11 */
+	uint8_t reserved[2];
+	struct dualshock4_input_report_common common;
+	uint8_t num_touch_reports;
+	struct dualshock4_touch_report touch_reports[4]; /* BT has 4 compared to 3 for USB */
+	uint8_t reserved2[2];
+	__le32 crc32;
+} __packed;
+static_assert(sizeof(struct dualshock4_input_report_bt) == DS4_INPUT_REPORT_BT_SIZE);
+
 /* Common data between Bluetooth and USB DualShock4 output reports. */
 struct dualshock4_output_report_common {
 	uint8_t valid_flag0;
@@ -425,6 +445,16 @@ struct dualshock4_output_report_usb {
 } __packed;
 static_assert(sizeof(struct dualshock4_output_report_usb) == DS4_OUTPUT_REPORT_USB_SIZE);
 
+struct dualshock4_output_report_bt {
+	uint8_t report_id; /* 0x11 */
+	uint8_t hw_control;
+	uint8_t audio_control;
+	struct dualshock4_output_report_common common;
+	uint8_t reserved[61];
+	__le32 crc32;
+} __packed;
+static_assert(sizeof(struct dualshock4_output_report_bt) == DS4_OUTPUT_REPORT_BT_SIZE);
+
 /*
  * The DualShock4 has a main output report used to control most features. It is
  * largely the same between Bluetooth and USB except for different headers and CRC.
@@ -434,6 +464,8 @@ struct dualshock4_output_report {
 	uint8_t *data; /* Start of data */
 	uint8_t len; /* Size of output report */
 
+	/* Points to Bluetooth data payload in case for a Bluetooth report else NULL. */
+	struct dualshock4_output_report_bt *bt;
 	/* Points to USB data payload in case for a USB report else NULL. */
 	struct dualshock4_output_report_usb *usb;
 	/* Points to common section of report, so past any headers. */
@@ -1646,26 +1678,49 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	int ret = 0;
 	uint8_t *buf;
 
-	buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
+	if (ds4->base.hdev->bus == BUS_USB) {
+		buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
 
-	ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
-			DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
-	if (ret) {
-		hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
-		goto err_free;
+		ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
+				DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
+		if (ret) {
+			hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
+			goto err_free;
+		}
+	} else { /* Bluetooth */
+		buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION_BT, buf,
+				DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, true);
+		if (ret) {
+			hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
+			goto err_free;
+		}
 	}
 
 	gyro_pitch_bias  = get_unaligned_le16(&buf[1]);
 	gyro_yaw_bias    = get_unaligned_le16(&buf[3]);
 	gyro_roll_bias   = get_unaligned_le16(&buf[5]);
-	gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
-	gyro_pitch_minus = get_unaligned_le16(&buf[9]);
-	gyro_yaw_plus    = get_unaligned_le16(&buf[11]);
-	gyro_yaw_minus   = get_unaligned_le16(&buf[13]);
-	gyro_roll_plus   = get_unaligned_le16(&buf[15]);
-	gyro_roll_minus  = get_unaligned_le16(&buf[17]);
+	if (ds4->base.hdev->bus == BUS_USB) {
+		gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
+		gyro_pitch_minus = get_unaligned_le16(&buf[9]);
+		gyro_yaw_plus    = get_unaligned_le16(&buf[11]);
+		gyro_yaw_minus   = get_unaligned_le16(&buf[13]);
+		gyro_roll_plus   = get_unaligned_le16(&buf[15]);
+		gyro_roll_minus  = get_unaligned_le16(&buf[17]);
+	} else {
+		/* BT + Dongle */
+		gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
+		gyro_yaw_plus    = get_unaligned_le16(&buf[9]);
+		gyro_roll_plus   = get_unaligned_le16(&buf[11]);
+		gyro_pitch_minus = get_unaligned_le16(&buf[13]);
+		gyro_yaw_minus   = get_unaligned_le16(&buf[15]);
+		gyro_roll_minus  = get_unaligned_le16(&buf[17]);
+	}
 	gyro_speed_plus  = get_unaligned_le16(&buf[19]);
 	gyro_speed_minus = get_unaligned_le16(&buf[21]);
 	acc_x_plus       = get_unaligned_le16(&buf[23]);
@@ -1731,8 +1786,11 @@ static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
 	if (!buf)
 		return -ENOMEM;
 
+	/* Note USB and BT support the same feature report, but this report
+	 * lacks CRC support, so must be disabled in ps_get_report.
+	 */
 	ret = ps_get_report(ds4->base.hdev, DS4_FEATURE_REPORT_FIRMWARE_INFO, buf,
-			DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, true);
+			DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, false);
 	if (ret) {
 		hid_err(ds4->base.hdev, "Failed to retrieve DualShock4 firmware info: %d\n", ret);
 		goto err_free;
@@ -1748,21 +1806,38 @@ static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
 
 static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 {
+	struct hid_device *hdev = ds4->base.hdev;
 	uint8_t *buf;
 	int ret = 0;
 
-	buf = kzalloc(DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
+	if (hdev->bus == BUS_USB) {
+		buf = kzalloc(DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		ret = ps_get_report(hdev, DS4_FEATURE_REPORT_PAIRING_INFO, buf,
+				DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, false);
+		if (ret) {
+			hid_err(hdev, "Failed to retrieve DualShock4 pairing info: %d\n", ret);
+			goto err_free;
+		}
 
-	ret = ps_get_report(ds4->base.hdev, DS4_FEATURE_REPORT_PAIRING_INFO, buf,
-			DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, true);
-	if (ret) {
-		hid_err(ds4->base.hdev, "Failed to retrieve DualShock4 pairing info: %d\n", ret);
-		goto err_free;
-	}
+		memcpy(ds4->base.mac_address, &buf[1], sizeof(ds4->base.mac_address));
+	} else {
+		/* Rely on HIDP for Bluetooth */
+		if (strlen(hdev->uniq) != 17)
+			return -EINVAL;
+
+		ret = sscanf(hdev->uniq, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",
+				&ds4->base.mac_address[5], &ds4->base.mac_address[4],
+				&ds4->base.mac_address[3], &ds4->base.mac_address[2],
+				&ds4->base.mac_address[1], &ds4->base.mac_address[0]);
 
-	memcpy(ds4->base.mac_address, &buf[1], sizeof(ds4->base.mac_address));
+		if (ret != sizeof(ds4->base.mac_address))
+			return -EINVAL;
+
+		ret = 0;
+	}
 
 err_free:
 	kfree(buf);
@@ -1859,7 +1934,18 @@ static void dualshock4_init_output_report(struct dualshock4 *ds4,
 {
 	struct hid_device *hdev = ds4->base.hdev;
 
-	if (hdev->bus == BUS_USB) {
+	if (hdev->bus == BUS_BLUETOOTH) {
+		struct dualshock4_output_report_bt *bt = buf;
+
+		memset(bt, 0, sizeof(*bt));
+		bt->report_id = DS4_OUTPUT_REPORT_BT;
+
+		rp->data = buf;
+		rp->len = sizeof(*bt);
+		rp->bt = bt;
+		rp->usb = NULL;
+		rp->common = &bt->common;
+	} else { /* USB */
 		struct dualshock4_output_report_usb *usb = buf;
 
 		memset(usb, 0, sizeof(*usb));
@@ -1867,6 +1953,7 @@ static void dualshock4_init_output_report(struct dualshock4 *ds4,
 
 		rp->data = buf;
 		rp->len = sizeof(*usb);
+		rp->bt = NULL;
 		rp->usb = usb;
 		rp->common = &usb->common;
 	}
@@ -1913,6 +2000,22 @@ static void dualshock4_output_worker(struct work_struct *work)
 
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 
+	/* Bluetooth packets need additional flags as well as a CRC in the last 4 bytes. */
+	if (report.bt) {
+		uint32_t crc;
+		uint8_t seed = PS_OUTPUT_CRC32_SEED;
+
+		/* Hardware control flags need to set to let the device know
+		 * there is HID data as well as CRC.
+		 */
+		report.bt->hw_control = DS4_OUTPUT_HWCTL_HID | DS4_OUTPUT_HWCTL_CRC32;
+
+		crc = crc32_le(0xFFFFFFFF, &seed, 1);
+		crc = ~crc32_le(crc, report.data, report.len - 4);
+
+		report.bt->crc32 = cpu_to_le32(crc);
+	}
+
 	hid_hw_output_report(ds4->base.hdev, report.data, report.len);
 }
 
@@ -1940,6 +2043,19 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 		ds4_report = &usb->common;
 		num_touch_reports = usb->num_touch_reports;
 		touch_reports = usb->touch_reports;
+	} else if (hdev->bus == BUS_BLUETOOTH && report->id == DS4_INPUT_REPORT_BT &&
+			size == DS4_INPUT_REPORT_BT_SIZE) {
+		struct dualshock4_input_report_bt *bt = (struct dualshock4_input_report_bt *)data;
+
+		/* Last 4 bytes of input report contains CRC. */
+		if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, bt->crc32)) {
+			hid_err(hdev, "DualShock4 input CRC's check failed\n");
+			return -EILSEQ;
+		}
+
+		ds4_report = &bt->common;
+		num_touch_reports = bt->num_touch_reports;
+		touch_reports = bt->touch_reports;
 	} else {
 		hid_err(hdev, "Unhandled reportID=%d\n", report->id);
 		return -1;
@@ -2354,7 +2470,9 @@ static void ps_remove(struct hid_device *hdev)
 
 static const struct hid_device_id ps_devices[] = {
 	/* Sony DualShock 4 controllers for PS4 */
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
 	/* Sony DualSense controllers for PS5 */
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
-- 
2.37.3


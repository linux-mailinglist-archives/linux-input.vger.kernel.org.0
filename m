Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498792DED80
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgLSGZC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:25:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgLSGZC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:25:02 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AE7C0611CA
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:47 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id j13so2599558pjz.3
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KBCJOjps1MWXYGsRWU9J6NRMIpobIhwnMUsT8AgwRPU=;
        b=NIUxx7kZUUTftEKAhCsuvhoc0GlSnC+rzi8ITPAPv/70N36BzMbBz5bC6GXelaUNK1
         u8grW1gyYgZht9dbRFZTUODPoFL/q7ToTEc0fvPxQ08e6YiijeIsmuH59fkovoOIs9it
         SrG5YaS2bINRrFhNf5VbZWoQI93NwzDgA3r07wVOfpcCboh2SzawIhg2RHWGrczE2SPH
         bClgciVzV3EUFiaSpWF1tz5ZX9tp676w5KQKtXn/ZmXHqbGYOyIzl67RGcDdB7XJiZ2G
         9MGEnN5cmNOlNafvM7uQXL9TXEDcyRQpOo49cnQ0Qw6RYJbH8tfcstm+okgBZ2Y8rPUN
         TU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KBCJOjps1MWXYGsRWU9J6NRMIpobIhwnMUsT8AgwRPU=;
        b=mjxvvB66sGsFktBix4/2uRs7kCmmErVdkTDAY/JqTRJk8QHFEEXpiWIymH6xLWCYd/
         ZzR2zgnlZqD+LntZ9V3yUVSiVFWzmk/HG1hmkDHNYSDpGQEZ2qCn66m3+aRlU00Cbts8
         1xMDzIO9unUMB20o1wddkt9fFrg6jJVccCvbOVksng3GHpKSzE2EeIpdzY1KTX5GxekI
         m+7x+nKEJX1tpV5mh3DP75MEbKq3tE7N0HflNXKCQt6A+7GmvrchviTUFgnJ4rl54j3+
         5eNWEzOnC4M3SQWFhbpgaIKnYGiH9e1eYVSJtovl+5UpE3Ybq+9z/G2sN8rGMOM2Fc+0
         EdfA==
X-Gm-Message-State: AOAM531S0qJeoIC3d3N04eMiHmqCGG5K2lDwtmFJBul90JKE5fTMDx4q
        Xk/N68G+IkszOGqp23ibcMYJ+w==
X-Google-Smtp-Source: ABdhPJxq1IoKeGCGlreiM8f/KXgb01kV4aGf7LHgBCCS1IHPwiFKHc/zWT3GOQ+64W5/qAt/Yc4Csw==
X-Received: by 2002:a17:90b:4b11:: with SMTP id lx17mr7898072pjb.154.1608359027429;
        Fri, 18 Dec 2020 22:23:47 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:47 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 07/13] HID: playstation: add DualSense Bluetooth support.
Date:   Fri, 18 Dec 2020 22:23:30 -0800
Message-Id: <20201219062336.72568-8-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

This patch adds support for the DualSense when operating in Bluetooth mode.
The device has the same behavior as the DualShock 4 in that by default it
sends a limited input report (0x1), but after requesting calibration data,
it switches to an extended input report (report 49), which adds data for
touchpad, motion sensors, battery and more.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 36 +++++++++++++++++++++++++++++++++++
 drivers/hid/hid-quirks.c      |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index b0c0286cfd2b..042fa8d2627d 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -43,6 +43,7 @@ struct ps_calibration_data {
 };
 
 #define DS_INPUT_REPORT_USB			0x01
+#define DS_INPUT_REPORT_BT			0x31
 
 #define DS_FEATURE_REPORT_CALIBRATION		5
 #define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
@@ -274,6 +275,17 @@ static int ps_device_register_battery(struct ps_device *dev)
 	return 0;
 }
 
+/* Compute crc32 of HID data and compare against expected CRC. */
+static bool ps_check_crc32(uint8_t seed, uint8_t *data, size_t len, uint32_t report_crc)
+{
+	uint32_t crc;
+
+	crc = crc32_le(0xFFFFFFFF, &seed, 1);
+	crc = ~crc32_le(crc, data, len);
+
+	return crc == report_crc;
+}
+
 static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 {
 	struct input_dev *gamepad;
@@ -390,6 +402,18 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	if (ret < 0)
 		goto err_free;
 
+	if (ds->base.hdev->bus == BUS_BLUETOOTH) {
+		/* Last 4 bytes contains crc32 */
+		uint8_t crc_offset = DS_FEATURE_REPORT_CALIBRATION_SIZE - 4;
+		uint32_t report_crc = get_unaligned_le32(&buf[crc_offset]);
+
+		if (!ps_check_crc32(0xa3, buf, crc_offset, report_crc)) {
+			hid_err(ds->base.hdev, "DualSense calibration report CRC's check failed\n");
+			ret = -EILSEQ;
+			goto err_free;
+		}
+	}
+
 	gyro_pitch_bias  = get_unaligned_le16(&buf[1]);
 	gyro_yaw_bias    = get_unaligned_le16(&buf[3]);
 	gyro_roll_bias   = get_unaligned_le16(&buf[5]);
@@ -494,6 +518,16 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	 */
 	if (report->id == DS_INPUT_REPORT_USB && hdev->bus == BUS_USB) {
 		ds_report = (struct dualsense_input_report *)&data[1];
+	} else if (report->id == DS_INPUT_REPORT_BT && hdev->bus == BUS_BLUETOOTH) {
+		/* Last 4 bytes of input report contain crc32 */
+		uint32_t report_crc = get_unaligned_le32(&data[size - 4]);
+
+		if (!ps_check_crc32(0xa1, data, size - 4, report_crc)) {
+			hid_err(hdev, "DualSense input CRC's check failed, size=%d\n", size);
+			return -EILSEQ;
+		}
+
+		ds_report = (struct dualsense_input_report *)&data[2];
 	} else {
 		hid_err(hdev, "Unhandled reportID=%d\n", report->id);
 		return -1;
@@ -756,6 +790,8 @@ static void ps_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id ps_devices[] = {
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER),
+		.driver_data = 0 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER),
 		.driver_data = 0 },
 };
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 1ca46cb445be..541c8837debd 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -567,6 +567,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #endif
 #if IS_ENABLED(CONFIG_HID_PLAYSTATION)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
++	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 #endif
 #if IS_ENABLED(CONFIG_HID_PRIMAX)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, USB_DEVICE_ID_PRIMAX_KEYBOARD) },
-- 
2.26.2


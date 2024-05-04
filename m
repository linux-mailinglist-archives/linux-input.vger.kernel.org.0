Return-Path: <linux-input+bounces-3449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA28BBD58
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 19:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B2E1F21518
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 17:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED2E5A4C0;
	Sat,  4 May 2024 17:09:16 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979846BB33;
	Sat,  4 May 2024 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714842556; cv=none; b=CXlg6aM4YDOgyloaY9eSWaRlHZ/6YsE0uK0rr8OFY6eHpmB+ZAg3JUzNoQTqpKuuW7IJqxofzIdwWWvztQABgofIva07t97Sy3eYG7ZQrMM5W72/W62+HhxEbY2ixD1pIISH13+895IIc16EnD14MOG6jJH1Pc+Zxh7bG2kuMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714842556; c=relaxed/simple;
	bh=yIjoJtSMB/U4omH3XyRyosupZ+BTbZUBwVD01ARDxjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J3VMp7IZQY/qHiH7xovGBl/PkB6pPuWd084VS/9SYz7Kp3S4TTHomDCs2cROfa56esRTjUGvJ3BRS+EzYh15kAeO7mCzMiikV63iGmm0V6hkrwHNBBRT3K4iBSMO21mNko2vrMb5Hvb9oSp8MJeILLqHUy3OKQFJppmXEckPVps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 50139FF9C3;
	Sat,  4 May 2024 16:59:19 +0000 (UTC)
From: Max Staudt <max@enpas.org>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	max@enpas.org
Subject: [PATCH v2] HID: playstation: DS4: Fix calibration workaround for clone devices
Date: Sun,  5 May 2024 01:55:32 +0900
Message-Id: <20240504165531.21315-1-max@enpas.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic in dualshock4_get_calibration_data() used uninitialised data
in case of a failed kzalloc() for the transfer buffer.

The solution is to group all business logic and all sanity checks
together, and jump only to the latter in case of an error.
While we're at it, factor out the axes' labelling, since it must happen
either way for input_report_abs() to succeed later on.

Thanks to Dan Carpenter for the Smatch static checker warning.

Fixes: a48a7cd85f55 ("HID: playstation: DS4: Don't fail on calibration data request")
Signed-off-by: Max Staudt <max@enpas.org>
---
Changes in v1 -> v2:
 - Restored assignments to .abs_code in their original location
 - Added assignments to .abs_code in the error handling loops
---
 drivers/hid/hid-playstation.c | 52 +++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index edc46fc02e9a..e7c309cfe3a0 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1787,7 +1787,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 		buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
 		if (!buf) {
 			ret = -ENOMEM;
-			goto no_buffer_tail_check;
+			goto transfer_failed;
 		}
 
 		/* We should normally receive the feature report data we asked
@@ -1807,6 +1807,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 
 				hid_warn(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
 				ret = -EILSEQ;
+				goto transfer_failed;
 			} else {
 				break;
 			}
@@ -1815,17 +1816,19 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 		buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, GFP_KERNEL);
 		if (!buf) {
 			ret = -ENOMEM;
-			goto no_buffer_tail_check;
+			goto transfer_failed;
 		}
 
 		ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION_BT, buf,
 				DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, true);
 
-		if (ret)
+		if (ret) {
 			hid_warn(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
+			goto transfer_failed;
+		}
 	}
 
-	/* Parse buffer. If the transfer failed, this safely copies zeroes. */
+	/* Transfer succeeded - parse the calibration data received. */
 	gyro_pitch_bias  = get_unaligned_le16(&buf[1]);
 	gyro_yaw_bias    = get_unaligned_le16(&buf[3]);
 	gyro_roll_bias   = get_unaligned_le16(&buf[5]);
@@ -1854,6 +1857,9 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	acc_z_plus       = get_unaligned_le16(&buf[31]);
 	acc_z_minus      = get_unaligned_le16(&buf[33]);
 
+	/* Done parsing the buffer, so let's free it. */
+	kfree(buf);
+
 	/*
 	 * Set gyroscope calibration and normalization parameters.
 	 * Data values will be normalized to 1/DS4_GYRO_RES_PER_DEG_S degree/s.
@@ -1877,26 +1883,6 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	ds4->gyro_calib_data[2].sens_denom = abs(gyro_roll_plus - gyro_roll_bias) +
 			abs(gyro_roll_minus - gyro_roll_bias);
 
-	/* Done parsing the buffer, so let's free it. */
-	kfree(buf);
-
-no_buffer_tail_check:
-
-	/*
-	 * Sanity check gyro calibration data. This is needed to prevent crashes
-	 * during report handling of virtual, clone or broken devices not implementing
-	 * calibration data properly.
-	 */
-	for (i = 0; i < ARRAY_SIZE(ds4->gyro_calib_data); i++) {
-		if (ds4->gyro_calib_data[i].sens_denom == 0) {
-			hid_warn(hdev, "Invalid gyro calibration data for axis (%d), disabling calibration.",
-					ds4->gyro_calib_data[i].abs_code);
-			ds4->gyro_calib_data[i].bias = 0;
-			ds4->gyro_calib_data[i].sens_numer = DS4_GYRO_RANGE;
-			ds4->gyro_calib_data[i].sens_denom = S16_MAX;
-		}
-	}
-
 	/*
 	 * Set accelerometer calibration and normalization parameters.
 	 * Data values will be normalized to 1/DS4_ACC_RES_PER_G g.
@@ -1919,6 +1905,23 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	ds4->accel_calib_data[2].sens_numer = 2*DS4_ACC_RES_PER_G;
 	ds4->accel_calib_data[2].sens_denom = range_2g;
 
+transfer_failed:
+	/*
+	 * Sanity check gyro calibration data. This is needed to prevent crashes
+	 * during report handling of virtual, clone or broken devices not implementing
+	 * calibration data properly.
+	 */
+	for (i = 0; i < ARRAY_SIZE(ds4->gyro_calib_data); i++) {
+		if (ds4->gyro_calib_data[i].sens_denom == 0) {
+			ds4->gyro_calib_data[i].abs_code = ABS_RX + i;
+			hid_warn(hdev, "Invalid gyro calibration data for axis (%d), disabling calibration.",
+					ds4->gyro_calib_data[i].abs_code);
+			ds4->gyro_calib_data[i].bias = 0;
+			ds4->gyro_calib_data[i].sens_numer = DS4_GYRO_RANGE;
+			ds4->gyro_calib_data[i].sens_denom = S16_MAX;
+		}
+	}
+
 	/*
 	 * Sanity check accelerometer calibration data. This is needed to prevent crashes
 	 * during report handling of virtual, clone or broken devices not implementing calibration
@@ -1926,6 +1929,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	 */
 	for (i = 0; i < ARRAY_SIZE(ds4->accel_calib_data); i++) {
 		if (ds4->accel_calib_data[i].sens_denom == 0) {
+			ds4->accel_calib_data[i].abs_code = ABS_X + i;
 			hid_warn(hdev, "Invalid accelerometer calibration data for axis (%d), disabling calibration.",
 					ds4->accel_calib_data[i].abs_code);
 			ds4->accel_calib_data[i].bias = 0;
-- 
2.39.2



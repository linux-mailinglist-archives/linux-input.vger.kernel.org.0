Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D88433456
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 13:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbhJSLGp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 07:06:45 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:52292 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235309AbhJSLGl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 07:06:41 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id C3B2FF40C36; Tue, 19 Oct 2021 13:04:24 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v4 4/5] HID: nintendo: drc: add accelerometer, gyroscope and magnetometer readings
Date:   Tue, 19 Oct 2021 13:04:17 +0200
Message-Id: <20211019110418.26874-5-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211019110418.26874-1-linkmauve@linkmauve.fr>
References: <20210519085924.1636-1-linkmauve@linkmauve.fr>
 <20211019110418.26874-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These are mostly untested so far, because I have no idea which userland
to test against, but evtest at least seems to give sensible values.

The magnetometer doesn’t have dedicated INPUT_PROP_ACCELEROMETER
buttons, so I used three clearly invalid absolute values, in the hope
that someone will fix that eventually.  Another solution might be to go
for the iio subsystem instead, but then it wouldn’t be tied to the HID
any longer and I would feel uneasy about that.  Especially because
multiple such gamepads could be connected to a single computer.

Signed-off-by: Ash Logan <ash@heyquark.com>
Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/hid/hid-nintendo-wiiu.c | 77 +++++++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-nintendo-wiiu.c b/drivers/hid/hid-nintendo-wiiu.c
index 144316d324cb..813abb104275 100644
--- a/drivers/hid/hid-nintendo-wiiu.c
+++ b/drivers/hid/hid-nintendo-wiiu.c
@@ -64,10 +64,19 @@
 #define TOUCH_BORDER_X	100
 #define TOUCH_BORDER_Y	200
 
+/* Accelerometer, gyroscope and magnetometer constants */
+#define ACCEL_MIN	-(1 << 15)
+#define ACCEL_MAX	((1 << 15) - 1)
+#define GYRO_MIN	-(1 << 23)
+#define GYRO_MAX	((1 << 23) - 1)
+#define MAGNET_MIN	-(1 << 15)
+#define MAGNET_MAX	((1 << 15) - 1)
+
 /*
  * The device is setup with multiple input devices:
  * - A joypad with the buttons and sticks.
  * - The touch area which works as a touchscreen.
+ * - An accelerometer + gyroscope + magnetometer device.
  */
 
 struct drc {
@@ -75,6 +84,7 @@ struct drc {
 	struct hid_device *hdev;
 	struct input_dev *joy_input_dev;
 	struct input_dev *touch_input_dev;
+	struct input_dev *accel_input_dev;
 };
 
 /*
@@ -89,7 +99,7 @@ int wiiu_hid_event(struct hid_device *hdev, struct hid_report *report,
 		   u8 *data, int len)
 {
 	struct drc *drc = hid_get_drvdata(hdev);
-	int i, x, y, pressure, base;
+	int i, x, y, z, pressure, base;
 	u32 buttons;
 
 	if (len != 128)
@@ -184,6 +194,31 @@ int wiiu_hid_event(struct hid_device *hdev, struct hid_report *report,
 	}
 	input_sync(drc->touch_input_dev);
 
+	/* accelerometer */
+	x = (data[16] << 8) | data[15];
+	y = (data[18] << 8) | data[17];
+	z = (data[20] << 8) | data[19];
+	input_report_abs(drc->accel_input_dev, ABS_X, (int16_t)x);
+	input_report_abs(drc->accel_input_dev, ABS_Y, (int16_t)y);
+	input_report_abs(drc->accel_input_dev, ABS_Z, (int16_t)z);
+
+	/* gyroscope */
+	x = (data[23] << 24) | (data[22] << 16) | (data[21] << 8);
+	y = (data[26] << 24) | (data[25] << 16) | (data[24] << 8);
+	z = (data[29] << 24) | (data[28] << 16) | (data[27] << 8);
+	input_report_abs(drc->accel_input_dev, ABS_RX, x >> 8);
+	input_report_abs(drc->accel_input_dev, ABS_RY, y >> 8);
+	input_report_abs(drc->accel_input_dev, ABS_RZ, z >> 8);
+
+	/* magnetometer */
+	x = (data[31] << 8) | data[30];
+	y = (data[33] << 8) | data[32];
+	z = (data[35] << 8) | data[34];
+	input_report_abs(drc->accel_input_dev, ABS_THROTTLE, (int16_t)x);
+	input_report_abs(drc->accel_input_dev, ABS_RUDDER, (int16_t)y);
+	input_report_abs(drc->accel_input_dev, ABS_WHEEL, (int16_t)z);
+	input_sync(drc->accel_input_dev);
+
 	/* let hidraw and hiddev handle the report */
 	return 0;
 }
@@ -299,6 +334,40 @@ static bool drc_setup_touch(struct drc *drc,
 	return true;
 }
 
+static bool drc_setup_accel(struct drc *drc,
+			    struct hid_device *hdev)
+{
+	struct input_dev *input_dev;
+
+	input_dev = allocate_and_setup(hdev, DEVICE_NAME " accelerometer, gyroscope and magnetometer");
+	if (!input_dev)
+		return false;
+
+	drc->accel_input_dev = input_dev;
+
+	set_bit(INPUT_PROP_ACCELEROMETER, input_dev->propbit);
+
+	/* 1G accel is reported as about -7900 */
+	input_set_abs_params(input_dev, ABS_X, ACCEL_MIN, ACCEL_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_Y, ACCEL_MIN, ACCEL_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_Z, ACCEL_MIN, ACCEL_MAX, 0, 0);
+
+	/* gyroscope */
+	input_set_abs_params(input_dev, ABS_RX, GYRO_MIN, GYRO_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_RY, GYRO_MIN, GYRO_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_RZ, GYRO_MIN, GYRO_MAX, 0, 0);
+
+	/* magnetometer */
+	/* TODO: Figure out which ABS_* would make more sense to expose, or
+	 * maybe go for the iio subsystem?
+	 */
+	input_set_abs_params(input_dev, ABS_THROTTLE, MAGNET_MIN, MAGNET_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_RUDDER, MAGNET_MIN, MAGNET_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_WHEEL, MAGNET_MIN, MAGNET_MAX, 0, 0);
+
+	return true;
+}
+
 int wiiu_hid_probe(struct hid_device *hdev,
 		   const struct hid_device_id *id)
 {
@@ -321,7 +390,8 @@ int wiiu_hid_probe(struct hid_device *hdev,
 	}
 
 	if (!drc_setup_joypad(drc, hdev) ||
-	    !drc_setup_touch(drc, hdev)) {
+	    !drc_setup_touch(drc, hdev) ||
+	    !drc_setup_accel(drc, hdev)) {
 		hid_err(hdev, "could not allocate interfaces\n");
 		return -ENOMEM;
 	}
@@ -333,7 +403,8 @@ int wiiu_hid_probe(struct hid_device *hdev,
 	}
 
 	ret = input_register_device(drc->joy_input_dev) ||
-	      input_register_device(drc->touch_input_dev);
+	      input_register_device(drc->touch_input_dev) ||
+	      input_register_device(drc->accel_input_dev);
 	if (ret) {
 		hid_err(hdev, "failed to register interfaces\n");
 		return ret;
-- 
2.33.1


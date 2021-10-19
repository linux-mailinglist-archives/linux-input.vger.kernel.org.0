Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A849433455
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 13:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235415AbhJSLGo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 07:06:44 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:52286 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235391AbhJSLGl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 07:06:41 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 12606F40C35; Tue, 19 Oct 2021 13:04:24 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v4 3/5] HID: nintendo: drc: implement touch reports
Date:   Tue, 19 Oct 2021 13:04:16 +0200
Message-Id: <20211019110418.26874-4-linkmauve@linkmauve.fr>
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

There is an inaccessible border on each side, 100 units on the left and
right sides, and 200 units at the top and bottom.  The Y axis is
inverted too, these are the two main quirks of this touch panel.

I’ve been testing with weston-simple-touch mostly, but it also with the
rest of Weston and it aligns perfectly without the need of any
additional calibration.

Signed-off-by: Ash Logan <ash@heyquark.com>
Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/hid/hid-nintendo-wiiu.c | 86 +++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-nintendo-wiiu.c b/drivers/hid/hid-nintendo-wiiu.c
index 0b9df62587ed..144316d324cb 100644
--- a/drivers/hid/hid-nintendo-wiiu.c
+++ b/drivers/hid/hid-nintendo-wiiu.c
@@ -52,15 +52,29 @@
 
 #define BUTTON_POWER	BIT(25)
 
+/* Touch constants */
+/* Resolution in pixels */
+#define RES_X		854
+#define RES_Y		480
+/* Display/touch size in mm */
+#define WIDTH		138
+#define HEIGHT		79
+#define NUM_TOUCH_POINTS 10
+#define MAX_TOUCH_RES	(1 << 12)
+#define TOUCH_BORDER_X	100
+#define TOUCH_BORDER_Y	200
+
 /*
  * The device is setup with multiple input devices:
  * - A joypad with the buttons and sticks.
+ * - The touch area which works as a touchscreen.
  */
 
 struct drc {
 	enum nintendo_driver driver;
 	struct hid_device *hdev;
 	struct input_dev *joy_input_dev;
+	struct input_dev *touch_input_dev;
 };
 
 /*
@@ -75,7 +89,7 @@ int wiiu_hid_event(struct hid_device *hdev, struct hid_report *report,
 		   u8 *data, int len)
 {
 	struct drc *drc = hid_get_drvdata(hdev);
-	int i;
+	int i, x, y, pressure, base;
 	u32 buttons;
 
 	if (len != 128)
@@ -134,6 +148,42 @@ int wiiu_hid_event(struct hid_device *hdev, struct hid_report *report,
 	input_report_abs(drc->joy_input_dev, ABS_VOLUME, data[14]);
 	input_sync(drc->joy_input_dev);
 
+	/* touch */
+	/*
+	 * Average touch points for improved accuracy.  Sadly these are always
+	 * reported extremely close from each other…  Even when the user
+	 * pressed two (or more) different points, all ten values will be
+	 * approximately in the middle of the pressure points.
+	 */
+	x = y = 0;
+	for (i = 0; i < NUM_TOUCH_POINTS; i++) {
+		base = 36 + 4 * i;
+
+		x += ((data[base + 1] & 0xF) << 8) | data[base];
+		y += ((data[base + 3] & 0xF) << 8) | data[base + 2];
+	}
+	x /= NUM_TOUCH_POINTS;
+	y /= NUM_TOUCH_POINTS;
+
+	/* Pressure reporting isn’t properly understood, so we don’t report it yet. */
+	pressure = 0;
+	pressure |= ((data[37] >> 4) & 7) << 0;
+	pressure |= ((data[39] >> 4) & 7) << 3;
+	pressure |= ((data[41] >> 4) & 7) << 6;
+	pressure |= ((data[43] >> 4) & 7) << 9;
+
+	if (pressure != 0) {
+		input_report_key(drc->touch_input_dev, BTN_TOUCH, 1);
+		input_report_key(drc->touch_input_dev, BTN_TOOL_FINGER, 1);
+
+		input_report_abs(drc->touch_input_dev, ABS_X, x);
+		input_report_abs(drc->touch_input_dev, ABS_Y, MAX_TOUCH_RES - y);
+	} else {
+		input_report_key(drc->touch_input_dev, BTN_TOUCH, 0);
+		input_report_key(drc->touch_input_dev, BTN_TOOL_FINGER, 0);
+	}
+	input_sync(drc->touch_input_dev);
+
 	/* let hidraw and hiddev handle the report */
 	return 0;
 }
@@ -225,6 +275,30 @@ static bool drc_setup_joypad(struct drc *drc,
 	return true;
 }
 
+static bool drc_setup_touch(struct drc *drc,
+			    struct hid_device *hdev)
+{
+	struct input_dev *input_dev;
+
+	input_dev = allocate_and_setup(hdev, DEVICE_NAME " touchscreen");
+	if (!input_dev)
+		return false;
+
+	drc->touch_input_dev = input_dev;
+
+	set_bit(INPUT_PROP_DIRECT, input_dev->propbit);
+
+	input_set_abs_params(input_dev, ABS_X, TOUCH_BORDER_X, MAX_TOUCH_RES - TOUCH_BORDER_X, 20, 0);
+	input_abs_set_res(input_dev, ABS_X, RES_X / WIDTH);
+	input_set_abs_params(input_dev, ABS_Y, TOUCH_BORDER_Y, MAX_TOUCH_RES - TOUCH_BORDER_Y, 20, 0);
+	input_abs_set_res(input_dev, ABS_Y, RES_Y / HEIGHT);
+
+	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
+	input_set_capability(input_dev, EV_KEY, BTN_TOOL_FINGER);
+
+	return true;
+}
+
 int wiiu_hid_probe(struct hid_device *hdev,
 		   const struct hid_device_id *id)
 {
@@ -246,8 +320,9 @@ int wiiu_hid_probe(struct hid_device *hdev,
 		return ret;
 	}
 
-	if (!drc_setup_joypad(drc, hdev)) {
-		hid_err(hdev, "could not allocate interface\n");
+	if (!drc_setup_joypad(drc, hdev) ||
+	    !drc_setup_touch(drc, hdev)) {
+		hid_err(hdev, "could not allocate interfaces\n");
 		return -ENOMEM;
 	}
 
@@ -257,9 +332,10 @@ int wiiu_hid_probe(struct hid_device *hdev,
 		return ret;
 	}
 
-	ret = input_register_device(drc->joy_input_dev);
+	ret = input_register_device(drc->joy_input_dev) ||
+	      input_register_device(drc->touch_input_dev);
 	if (ret) {
-		hid_err(hdev, "failed to register interface\n");
+		hid_err(hdev, "failed to register interfaces\n");
 		return ret;
 	}
 
-- 
2.33.1


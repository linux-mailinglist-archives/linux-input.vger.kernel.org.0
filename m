Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B55370FE6
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 01:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhEBXjF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 May 2021 19:39:05 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:55116 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbhEBXjD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 May 2021 19:39:03 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id DF23FF405D8; Mon,  3 May 2021 01:28:58 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     linux-input@vger.kernel.org
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] HID: wiiu-drc: Implement touch reports
Date:   Mon,  3 May 2021 01:28:33 +0200
Message-Id: <20210502232836.26134-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210502232836.26134-1-linkmauve@linkmauve.fr>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is a 100×200 inaccessible border on each side, and the Y axis is
inverted, these are the two main quirks of this touch panel.

I’ve been testing with weston-simple-touch mostly, but it also with the
rest of Weston.

Signed-off-by: Ash Logan <ash@heyquark.com>
Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/hid/hid-wiiu-drc.c | 83 +++++++++++++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-wiiu-drc.c b/drivers/hid/hid-wiiu-drc.c
index 018cbdb53a2c..77e70827c37d 100644
--- a/drivers/hid/hid-wiiu-drc.c
+++ b/drivers/hid/hid-wiiu-drc.c
@@ -49,13 +49,27 @@
 
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
 	struct input_dev *joy_input_dev;
+	struct input_dev *touch_input_dev;
 	struct hid_device *hdev;
 };
 
@@ -63,7 +77,7 @@ static int drc_raw_event(struct hid_device *hdev, struct hid_report *report,
 	 u8 *data, int len)
 {
 	struct drc *drc = hid_get_drvdata(hdev);
-	int i;
+	int i, x, y, pressure, base;
 	u32 buttons;
 
 	if (len != 128)
@@ -126,6 +140,37 @@ static int drc_raw_event(struct hid_device *hdev, struct hid_report *report,
 
 	input_sync(drc->joy_input_dev);
 
+	/* touch */
+	/* Average touch points for improved accuracy. */
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
@@ -168,6 +213,32 @@ static struct input_dev *allocate_and_setup(struct hid_device *hdev,
 	return input_dev;
 }
 
+static bool drc_setup_touch(struct drc *drc,
+		struct hid_device *hdev)
+{
+	struct input_dev *input_dev;
+
+	input_dev = allocate_and_setup(hdev, DEVICE_NAME " Touch");
+	if (!input_dev)
+		return false;
+
+	input_dev->evbit[0] = BIT(EV_ABS) | BIT(EV_KEY);
+
+	input_set_abs_params(input_dev, ABS_X, TOUCH_BORDER_X, MAX_TOUCH_RES - TOUCH_BORDER_X, 20, 0);
+	input_abs_set_res(input_dev, ABS_X, RES_X / WIDTH);
+	input_set_abs_params(input_dev, ABS_Y, TOUCH_BORDER_Y, MAX_TOUCH_RES - TOUCH_BORDER_Y, 20, 0);
+	input_abs_set_res(input_dev, ABS_Y, RES_Y / HEIGHT);
+
+	set_bit(BTN_TOUCH, input_dev->keybit);
+	set_bit(BTN_TOOL_FINGER, input_dev->keybit);
+
+	set_bit(INPUT_PROP_DIRECT, input_dev->propbit);
+
+	drc->touch_input_dev = input_dev;
+
+	return true;
+}
+
 static bool drc_setup_joypad(struct drc *drc,
 		struct hid_device *hdev)
 {
@@ -231,14 +302,16 @@ static int drc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	if (!drc_setup_joypad(drc, hdev)) {
-		hid_err(hdev, "could not allocate interface\n");
+	if (!drc_setup_joypad(drc, hdev) ||
+	    !drc_setup_touch(drc, hdev)) {
+		hid_err(hdev, "could not allocate interfaces\n");
 		return -ENOMEM;
 	}
 
-	ret = input_register_device(drc->joy_input_dev);
+	ret = input_register_device(drc->joy_input_dev) ||
+		input_register_device(drc->touch_input_dev);
 	if (ret) {
-		hid_err(hdev, "failed to register interface\n");
+		hid_err(hdev, "failed to register interfaces\n");
 		return ret;
 	}
 
-- 
2.31.1


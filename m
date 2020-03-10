Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4E017FFF9
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 15:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbgCJORP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 10:17:15 -0400
Received: from mail.astralinux.ru ([217.74.38.120]:50968 "EHLO astralinux.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727280AbgCJORO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 10:17:14 -0400
X-Greylist: delayed 3603 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Mar 2020 10:17:13 EDT
Received: from [46.148.196.138] (HELO mastykin.cct.rbt)
  by astralinux.ru (CommuniGate Pro SMTP 6.2.7)
  with ESMTPS id 1749904; Tue, 10 Mar 2020 16:15:02 +0300
From:   Dmitry Mastykin <dmastykin@astralinux.ru>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Dmitry Mastykin <dmastykin@astralinux.ru>
Subject: [PATCH 1/2] Input: goodix - Add support for touch-keys and keycode mapping
Date:   Tue, 10 Mar 2020 16:17:04 +0300
Message-Id: <20200310131705.13516-1-dmastykin@astralinux.ru>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

KEY_LEFTMETA is assigned to the first touch-key (it will be the default
keycode for devices with a single touch-key).
KEY_F1, KEY_F2... are assigned to other touch-keys.
One may assign any keycodes via HWDB.

Previous press/release behavior has changed.
Before: both press/release events were generated on key touch.
Now: press/release events correspond to real touch and release now.

Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>
---
 drivers/input/touchscreen/goodix.c | 54 ++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index fdec508..6a7ecc6 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -38,6 +38,7 @@
 #define GOODIX_CONTACT_SIZE		8
 #define GOODIX_MAX_CONTACT_SIZE		9
 #define GOODIX_MAX_CONTACTS		10
+#define GOODIX_MAX_KEYS			7
 
 #define GOODIX_CONFIG_MIN_LENGTH	186
 #define GOODIX_CONFIG_911_LENGTH	186
@@ -55,6 +56,7 @@
 #define GOODIX_REG_ID			0x8140
 
 #define GOODIX_BUFFER_STATUS_READY	BIT(7)
+#define GOODIX_HAVE_KEY			BIT(4)
 #define GOODIX_BUFFER_STATUS_TIMEOUT	20
 
 #define RESOLUTION_LOC		1
@@ -100,6 +102,7 @@ struct goodix_ts_data {
 	enum goodix_irq_pin_access_method irq_pin_access_method;
 	unsigned int contact_size;
 	u8 config[GOODIX_CONFIG_MAX_LENGTH];
+	unsigned short keymap[GOODIX_MAX_KEYS];
 };
 
 static int goodix_check_cfg_8(struct goodix_ts_data *ts,
@@ -285,8 +288,14 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 	 */
 	max_timeout = jiffies + msecs_to_jiffies(GOODIX_BUFFER_STATUS_TIMEOUT);
 	do {
+		/*
+		 * We are going to read ts->contact_size * max(1, touch_num) + 2
+		 * bytes, where + 2 consists of reading 1 extra byte for the
+		 * header + 1 extra byte for the footer which contains the
+		 * touch-key code.
+		 */
 		error = goodix_i2c_read(ts->client, GOODIX_READ_COOR_ADDR,
-					data, ts->contact_size + 1);
+					data, ts->contact_size + 2);
 		if (error) {
 			dev_err(&ts->client->dev, "I2C transfer error: %d\n",
 					error);
@@ -299,10 +308,10 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 				return -EPROTO;
 
 			if (touch_num > 1) {
-				data += 1 + ts->contact_size;
+				data += 2 + ts->contact_size;
 				error = goodix_i2c_read(ts->client,
 						GOODIX_READ_COOR_ADDR +
-							1 + ts->contact_size,
+							2 + ts->contact_size,
 						data,
 						ts->contact_size *
 							(touch_num - 1));
@@ -353,6 +362,23 @@ static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
 	input_report_abs(ts->input_dev, ABS_MT_WIDTH_MAJOR, input_w);
 }
 
+static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
+{
+	int touch_num;
+	u8 key_value;
+	int i;
+
+	if (data[0] & GOODIX_HAVE_KEY) {
+		touch_num = data[0] & 0x0f;
+		key_value = data[1 + ts->contact_size * touch_num];
+		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
+			if (key_value & (1 << i))
+				input_report_key(ts->input_dev, ts->keymap[i], 1);
+	} else
+		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
+			input_report_key(ts->input_dev, ts->keymap[i], 0);
+}
+
 /**
  * goodix_process_events - Process incoming events
  *
@@ -363,7 +389,7 @@ static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
  */
 static void goodix_process_events(struct goodix_ts_data *ts)
 {
-	u8  point_data[1 + GOODIX_MAX_CONTACT_SIZE * GOODIX_MAX_CONTACTS];
+	u8  point_data[2 + GOODIX_MAX_CONTACT_SIZE * GOODIX_MAX_CONTACTS];
 	int touch_num;
 	int i;
 
@@ -371,11 +397,7 @@ static void goodix_process_events(struct goodix_ts_data *ts)
 	if (touch_num < 0)
 		return;
 
-	/*
-	 * Bit 4 of the first byte reports the status of the capacitive
-	 * Windows/Home button.
-	 */
-	input_report_key(ts->input_dev, KEY_LEFTMETA, point_data[0] & BIT(4));
+	goodix_ts_report_key(ts, point_data);
 
 	for (i = 0; i < touch_num; i++)
 		if (ts->contact_size == 9)
@@ -961,6 +983,7 @@ static int goodix_i2c_test(struct i2c_client *client)
 static int goodix_configure_dev(struct goodix_ts_data *ts)
 {
 	int error;
+	int i;
 
 	ts->int_trigger_type = GOODIX_INT_TRIGGER;
 	ts->max_touch_num = GOODIX_MAX_CONTACTS;
@@ -978,8 +1001,19 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 	ts->input_dev->id.product = ts->id;
 	ts->input_dev->id.version = ts->version;
 
+	ts->input_dev->keycode = ts->keymap;
+	ts->input_dev->keycodesize = sizeof(ts->keymap[0]);
+	ts->input_dev->keycodemax = GOODIX_MAX_KEYS;
+
 	/* Capacitive Windows/Home button on some devices */
-	input_set_capability(ts->input_dev, EV_KEY, KEY_LEFTMETA);
+	for (i = 0; i < GOODIX_MAX_KEYS; ++i) {
+		if (i == 0)
+			ts->keymap[i] = KEY_LEFTMETA;
+		else
+			ts->keymap[i] = KEY_F1 + (i - 1);
+
+		input_set_capability(ts->input_dev, EV_KEY, ts->keymap[i]);
+	}
 
 	input_set_capability(ts->input_dev, EV_ABS, ABS_MT_POSITION_X);
 	input_set_capability(ts->input_dev, EV_ABS, ABS_MT_POSITION_Y);
-- 
2.23.0


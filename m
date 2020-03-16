Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38A118661C
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 09:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbgCPIIX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 04:08:23 -0400
Received: from mail.astralinux.ru ([217.74.38.120]:50963 "EHLO astralinux.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729662AbgCPIIX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 04:08:23 -0400
Received: from [46.148.196.138] (HELO mastykin.cct.rbt)
  by astralinux.ru (CommuniGate Pro SMTP 6.2.7)
  with ESMTPS id 1761857; Mon, 16 Mar 2020 11:06:00 +0300
From:   Dmitry Mastykin <dmastykin@astralinux.ru>
To:     Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, dmastykin@astralinux.ru
Subject: [PATCH v3 1/2] Input: goodix - Add support for more then one touch-key
Date:   Mon, 16 Mar 2020 10:53:03 +0300
Message-Id: <20200316075302.3759-1-dmastykin@astralinux.ru>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices with a goodix touchscreen have more then 1 capacitive
touch-key. This commit replaces the current support for a single
touch-key, which ignored the reported key-code. With support for
up to 7 touch-keys, based upon checking the key-code which is
post-fixed to any reported touch-data.

KEY_LEFTMETA is assigned to the first touch-key (it will still be
the default keycode for devices with a single touch-key).
KEY_F1, KEY_F2... are assigned as default keycode for the other
touch-keys.

This commit also add supports for keycode remapping, so that
systemd-udev's hwdb can be used to remap the codes to send
keycodes to match the icons on the buttons for devices with more
then 1 touch-key.

Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>
---
Changes in v3:
- Refactor to get rid of magic "2" in goodix_ts_read_input_report()

Changes in v2:
- Improve commit message
---
 drivers/input/touchscreen/goodix.c | 60 +++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index adb9b92..04b5c7b 100644
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
@@ -277,6 +280,13 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 	unsigned long max_timeout;
 	int touch_num;
 	int error;
+	u16 addr = GOODIX_READ_COOR_ADDR;
+	/*
+	 * We are going to read 1-byte header,
+	 * ts->contact_size * max(1, touch_num) bytes of coordinates
+	 * and 1-byte footer which contains the touch-key code.
+	 */
+	const int header_contact_keycode_size = 1 + ts->contact_size + 1;
 
 	/*
 	 * The 'buffer status' bit, which indicates that the data is valid, is
@@ -285,8 +295,8 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 	 */
 	max_timeout = jiffies + msecs_to_jiffies(GOODIX_BUFFER_STATUS_TIMEOUT);
 	do {
-		error = goodix_i2c_read(ts->client, GOODIX_READ_COOR_ADDR,
-					data, ts->contact_size + 1);
+		error = goodix_i2c_read(ts->client, addr, data,
+					header_contact_keycode_size);
 		if (error) {
 			dev_err(&ts->client->dev, "I2C transfer error: %d\n",
 					error);
@@ -299,11 +309,10 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 				return -EPROTO;
 
 			if (touch_num > 1) {
-				data += 1 + ts->contact_size;
+				addr += header_contact_keycode_size;
+				data += header_contact_keycode_size;
 				error = goodix_i2c_read(ts->client,
-						GOODIX_READ_COOR_ADDR +
-							1 + ts->contact_size,
-						data,
+						addr, data,
 						ts->contact_size *
 							(touch_num - 1));
 				if (error)
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


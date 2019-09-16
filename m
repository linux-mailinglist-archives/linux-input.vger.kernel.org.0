Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7A9B43D5
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 00:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729745AbfIPWQL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 18:16:11 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43817 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbfIPWQL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 18:16:11 -0400
Received: by mail-lj1-f194.google.com with SMTP id d5so1417284lja.10
        for <linux-input@vger.kernel.org>; Mon, 16 Sep 2019 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GuWyUzufusxmeNIsR+cby/JNgPrWziw6k4LaReLXBKU=;
        b=YPyxKkCtea18I4zn2kWPcHvo8oZ4puDFQQO7E/YBDqrREimwpKIYzHq11MYlUzGr/O
         ZnY0WigAq6aVCwrm1rIF0p1X9H5HUepZhD+MoIsH4zgAYOxUweCcv/vjUr9T3VJhbPgY
         ZhhzyYwGW6OCvThvosOjkWFujywGb3FguF3h+sTmUoeUKhjGErxzfJ/5vJfke5TA9uaX
         IlQi6f6iMmuebpwimpqaubNxgt+uy1sqCpsfGoGd9Ues+ivtypGJPoSt1xq4MspbK1H4
         K9iGYOlXfncbqvdyFeg4Jds2R2qyJzLiNS5Jn4lbdBIwEZM2nQalsqA+eugcpNT2ZXVd
         NhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GuWyUzufusxmeNIsR+cby/JNgPrWziw6k4LaReLXBKU=;
        b=TZlLGRTBfO4mQjIwNPsONVvQdRUUWStrKaM8rbfox7LciefIeiyzziMF8f9k154kvi
         JGEkyWy+8vEWyNWdKiYEz40+n4nu99zCbSV10inw9ZoR5CJswdljDGO+9Dj6TezaSou6
         jBs3dL0OhbQ4phAankJ0fe9I8GGPVRyiKRWyIMrKkPbwlzih2I5BdAOTalnrgJth8ZIm
         1NYboAXqI6D7x3MoqAk7bZbJwvc647r9phPZ44VR+HAtSgEEcHcZ+JKf4PR/KrqJPlDC
         BL2OMntaoPM6lSEfTjZWO+TxAufTVFzQ0wWICnaKw+GryuqLG92SQkZGQXPmgOXr1EDH
         zdqA==
X-Gm-Message-State: APjAAAUHsC9w/rOjJAQ+LzFKq6b6RPWA6VUx1kyhtHvRePkDEmMA2jNE
        DlXnIVxGrPSOY5RKZh4rfdA=
X-Google-Smtp-Source: APXvYqw1W7RR85vWN4JMFh4aqdAMcmJ3URZFNVjbPGSuQbSDnz58LZAa5hdc+HlHpyxaWtJ1OsuaFg==
X-Received: by 2002:a2e:4243:: with SMTP id p64mr68605lja.213.1568672168669;
        Mon, 16 Sep 2019 15:16:08 -0700 (PDT)
Received: from localhost.localdomain ([46.216.138.44])
        by smtp.gmail.com with ESMTPSA id t22sm16915lfg.91.2019.09.16.15.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 15:16:07 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.92.1)
        (envelope-from <jekhor@gmail.com>)
        id 1i9zHz-0000CJ-U2; Tue, 17 Sep 2019 01:16:07 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [RESEND PATCH 1/1] goodix touchscreen: Add support for 9-bytes reports
Date:   Tue, 17 Sep 2019 01:16:02 +0300
Message-Id: <20190916221602.715-2-jekhor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190916221602.715-1-jekhor@gmail.com>
References: <20190916221602.715-1-jekhor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some variants of Goodix touchscreen firmwares use 9-bytes finger
report format instead of common 8-bytes format.

This report format may be present as:

struct goodix_contact_data {
        uint8_t unknown1;
        uint8_t track_id;
        uint8_t unknown2;
        uint16_t x;
        uint16_t y;
        uint16_t w;
}__attribute__((packed));

Add support for such format and use it for Lenovo Yoga Book notebook
(which uses a Goodix touchpad as a touch keyboard).

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 drivers/input/touchscreen/goodix.c | 58 +++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 5178ea8b5f30..fb43aa708660 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -53,6 +53,7 @@ struct goodix_ts_data {
 	const char *cfg_name;
 	struct completion firmware_loading_complete;
 	unsigned long irq_flags;
+	unsigned int contact_size;
 };
 
 #define GOODIX_GPIO_INT_NAME		"irq"
@@ -62,6 +63,7 @@ struct goodix_ts_data {
 #define GOODIX_MAX_WIDTH		4096
 #define GOODIX_INT_TRIGGER		1
 #define GOODIX_CONTACT_SIZE		8
+#define GOODIX_MAX_CONTACT_SIZE		9
 #define GOODIX_MAX_CONTACTS		10
 
 #define GOODIX_CONFIG_MAX_LENGTH	240
@@ -144,6 +146,19 @@ static const struct dmi_system_id rotated_screen[] = {
 	{}
 };
 
+static const struct dmi_system_id nine_bytes_report[] = {
+#if defined(CONFIG_DMI) && defined(CONFIG_X86)
+	{
+		.ident = "Lenovo YogaBook",
+		/* YB1-X91L/F and YB1-X90L/F */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9")
+		}
+	},
+#endif
+	{}
+};
+
 /**
  * goodix_i2c_read - read data from a register of the i2c slave device.
  *
@@ -249,7 +264,7 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 	max_timeout = jiffies + msecs_to_jiffies(GOODIX_BUFFER_STATUS_TIMEOUT);
 	do {
 		error = goodix_i2c_read(ts->client, GOODIX_READ_COOR_ADDR,
-					data, GOODIX_CONTACT_SIZE + 1);
+					data, ts->contact_size + 1);
 		if (error) {
 			dev_err(&ts->client->dev, "I2C transfer error: %d\n",
 					error);
@@ -262,12 +277,12 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 				return -EPROTO;
 
 			if (touch_num > 1) {
-				data += 1 + GOODIX_CONTACT_SIZE;
+				data += 1 + ts->contact_size;
 				error = goodix_i2c_read(ts->client,
 						GOODIX_READ_COOR_ADDR +
-							1 + GOODIX_CONTACT_SIZE,
+							1 + ts->contact_size,
 						data,
-						GOODIX_CONTACT_SIZE *
+						ts->contact_size *
 							(touch_num - 1));
 				if (error)
 					return error;
@@ -286,7 +301,7 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 	return 0;
 }
 
-static void goodix_ts_report_touch(struct goodix_ts_data *ts, u8 *coor_data)
+static void goodix_ts_report_touch_8b(struct goodix_ts_data *ts, u8 *coor_data)
 {
 	int id = coor_data[0] & 0x0F;
 	int input_x = get_unaligned_le16(&coor_data[1]);
@@ -301,6 +316,21 @@ static void goodix_ts_report_touch(struct goodix_ts_data *ts, u8 *coor_data)
 	input_report_abs(ts->input_dev, ABS_MT_WIDTH_MAJOR, input_w);
 }
 
+static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
+{
+	int id = coor_data[1] & 0x0F;
+	int input_x = get_unaligned_le16(&coor_data[3]);
+	int input_y = get_unaligned_le16(&coor_data[5]);
+	int input_w = get_unaligned_le16(&coor_data[7]);
+
+	input_mt_slot(ts->input_dev, id);
+	input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER, true);
+	touchscreen_report_pos(ts->input_dev, &ts->prop,
+			       input_x, input_y, true);
+	input_report_abs(ts->input_dev, ABS_MT_TOUCH_MAJOR, input_w);
+	input_report_abs(ts->input_dev, ABS_MT_WIDTH_MAJOR, input_w);
+}
+
 /**
  * goodix_process_events - Process incoming events
  *
@@ -311,7 +341,7 @@ static void goodix_ts_report_touch(struct goodix_ts_data *ts, u8 *coor_data)
  */
 static void goodix_process_events(struct goodix_ts_data *ts)
 {
-	u8  point_data[1 + GOODIX_CONTACT_SIZE * GOODIX_MAX_CONTACTS];
+	u8  point_data[1 + GOODIX_MAX_CONTACT_SIZE * GOODIX_MAX_CONTACTS];
 	int touch_num;
 	int i;
 
@@ -326,8 +356,12 @@ static void goodix_process_events(struct goodix_ts_data *ts)
 	input_report_key(ts->input_dev, KEY_LEFTMETA, point_data[0] & BIT(4));
 
 	for (i = 0; i < touch_num; i++)
-		goodix_ts_report_touch(ts,
-				&point_data[1 + GOODIX_CONTACT_SIZE * i]);
+		if (ts->contact_size == 9)
+			goodix_ts_report_touch_9b(ts,
+				&point_data[1 + ts->contact_size * i]);
+		else
+			goodix_ts_report_touch_8b(ts,
+				&point_data[1 + ts->contact_size * i]);
 
 	input_mt_sync_frame(ts->input_dev);
 	input_sync(ts->input_dev);
@@ -730,6 +764,13 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 			"Applying '180 degrees rotated screen' quirk\n");
 	}
 
+	if (dmi_check_system(nine_bytes_report)) {
+		ts->contact_size = 9;
+
+		dev_dbg(&ts->client->dev,
+			"Non-standard 9-bytes report format quirk\n");
+	}
+
 	error = input_mt_init_slots(ts->input_dev, ts->max_touch_num,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error) {
@@ -810,6 +851,7 @@ static int goodix_ts_probe(struct i2c_client *client,
 	ts->client = client;
 	i2c_set_clientdata(client, ts);
 	init_completion(&ts->firmware_loading_complete);
+	ts->contact_size = GOODIX_CONTACT_SIZE;
 
 	error = goodix_get_gpio_config(ts);
 	if (error)
-- 
2.23.0.rc1


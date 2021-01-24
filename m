Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8F3301E95
	for <lists+linux-input@lfdr.de>; Sun, 24 Jan 2021 20:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbhAXTzX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 14:55:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbhAXTzR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 14:55:17 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E1DC061574;
        Sun, 24 Jan 2021 11:54:37 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u25so14785097lfc.2;
        Sun, 24 Jan 2021 11:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5fipUQXSU9R3bJJ9jDmFi4M35Ypo7EJbOcbqfP7VT9M=;
        b=IboA5c/ME16nU8GX/GAAZzOoZRv+SGdqJ2aKa3OYljt9/1vQbzvzUzGbkZy8sq25DM
         ho+EoHJB34SV6W9dNLNQIr8fmG4lW7hUlGSPBwo9v2Zyc9mFOUPGSuLyl+pm9KpF5FUB
         Lol3WQ0iew5zDUkQio0f4FT8PFG8k0pI/vLPX7mbq35QJMM8Dqx4eZz+rLFvR3vsKdv3
         IGmAEENqgqBPRhtcyPFqVavU5/GYHWzC8NXdfwgF238qC4SgSqCoOV5vwLA/EUe9MAXP
         4FCODXzEFMU7DuzohO6+z8LneA/hP7K8oQsSjyQBFlXTYNE87ZGzegKw0lolFnHGN+jJ
         7STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5fipUQXSU9R3bJJ9jDmFi4M35Ypo7EJbOcbqfP7VT9M=;
        b=RGQe5QPEyDrHKFzYBOEhTLAWFFYe7nlk2NqTY+z7RCybLoVIvV0kX+R1VrLSDEGaCE
         8UU4n6hVHdohpFFWcxgRPt6IY/yluZEa4PoLbrhFGbMgYQ1MMIpjfeLxR1Htw3ebK7+B
         5EMmYjbYRASZ7y/wFv7bkAZQnOfJLVhAq1GGvl/Uajz+Iuxs4P+mfuilgSwJswcW6zhT
         YEgXyQlQGIED5iDD01t479BBbWmP0s9mWCiPwafNXPS7ZWgJlZAj8aqYa71lxt5vVRcU
         egSU3mThH+H8HqouvwmKlHZgvFyb4+FopdVaKks2ntZWlQEYC6pXEtdP0enppjtmg3/I
         RaGQ==
X-Gm-Message-State: AOAM530vtjcM6VBONVZyNxJn9JNyDFu72VZV8aaY2XYSQlIU0Fa5FN4S
        TRVYDgUiyT5oxxRH+PU+oJXZKzpn1NE=
X-Google-Smtp-Source: ABdhPJzlEadZHd8Jt3Z08t9pcQvhVvU4u/HFpCQtFEoEPcJEoZzlJo45QQd0Qeph0yPQ4l+2MFfQVQ==
X-Received: by 2002:ac2:53b4:: with SMTP id j20mr58279lfh.502.1611518075723;
        Sun, 24 Jan 2021 11:54:35 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id o14sm1028019lfi.257.2021.01.24.11.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 11:54:35 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9] Input: elants_i2c - support eKTF3624
Date:   Sun, 24 Jan 2021 22:54:14 +0300
Message-Id: <20210124195414.27333-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Add ELAN KTF3624 touchscreen support to the elants_i2c driver.
The eKTF3624 TS is found on a series of ASUS Transformer tablet devices,
Nexus 7 tablet and etc. The firmware interface of eKTF3624 is nearly
identical to eKTH3500, which is already supported by the driver.
The minor differences of the firmware interface are now handled by
the driver. The eKTF3624 support was tested on ASUS Transformer TF700T,
TF300T and Nexus 7 tablets.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v9: - All eKTF3624 changes are squashed into this single patch,
      like it was requested by Dmitry Torokhov in a review comment to v8.

    - Added chip ID checks for the FW handling that is specific to eKTF3624,
      like it was requested by Dmitry Torokhov in a review comment to v8.

    - The chip ID is now assigned to OF / ACPI / etc types of drivers,
      like it was requested by Dmitry Torokhov in a review comment to v8.

    - Improved formatting of the code, like it was requested by
      Dmitry Torokhov in a review comment to v8.

    - Corrected calculation of TS resolution for eKTF3624, which uses the
      ts->prop, but the properties were initialized after the calculation
      in v8, hence resolution erroneously was always 0x0. Now assignment
      is done before the calculation.

 drivers/input/touchscreen/elants_i2c.c | 152 ++++++++++++++++++++++---
 1 file changed, 135 insertions(+), 17 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index d51cb910fba1..6f57ec579f00 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -56,6 +56,7 @@
 #define QUEUE_HEADER_SINGLE	0x62
 #define QUEUE_HEADER_NORMAL	0X63
 #define QUEUE_HEADER_WAIT	0x64
+#define QUEUE_HEADER_NORMAL2	0x66
 
 /* Command header definition */
 #define CMD_HEADER_WRITE	0x54
@@ -69,6 +70,7 @@
 #define CMD_HEADER_REK		0x66
 
 /* FW position data */
+#define PACKET_SIZE_OLD		40
 #define PACKET_SIZE		55
 #define MAX_CONTACT_NUM		10
 #define FW_POS_HEADER		0
@@ -90,6 +92,8 @@
 /* FW read command, 0x53 0x?? 0x0, 0x01 */
 #define E_ELAN_INFO_FW_VER	0x00
 #define E_ELAN_INFO_BC_VER	0x10
+#define E_ELAN_INFO_X_RES	0x60
+#define E_ELAN_INFO_Y_RES	0x63
 #define E_ELAN_INFO_REK		0xD0
 #define E_ELAN_INFO_TEST_VER	0xE0
 #define E_ELAN_INFO_FW_ID	0xF0
@@ -112,6 +116,11 @@
 #define ELAN_POWERON_DELAY_USEC	500
 #define ELAN_RESET_DELAY_MSEC	20
 
+enum elants_chip_id {
+	EKTH3500,
+	EKTF3624,
+};
+
 enum elants_state {
 	ELAN_STATE_NORMAL,
 	ELAN_WAIT_QUEUE_HEADER,
@@ -143,9 +152,12 @@ struct elants_data {
 	unsigned int y_res;
 	unsigned int x_max;
 	unsigned int y_max;
+	unsigned int phy_x;
+	unsigned int phy_y;
 	struct touchscreen_properties prop;
 
 	enum elants_state state;
+	enum elants_chip_id chip_id;
 	enum elants_iap_mode iap_mode;
 
 	/* Guards against concurrent access to the device via sysfs */
@@ -433,7 +445,51 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
 	return 0;
 }
 
-static int elants_i2c_query_ts_info(struct elants_data *ts)
+static int elants_i2c_query_ts_info_ektf(struct elants_data *ts)
+{
+	struct i2c_client *client = ts->client;
+	int error;
+	u8 resp[4];
+	u16 phy_x, phy_y;
+	const u8 get_xres_cmd[] = {
+		CMD_HEADER_READ, E_ELAN_INFO_X_RES, 0x00, 0x00
+	};
+	const u8 get_yres_cmd[] = {
+		CMD_HEADER_READ, E_ELAN_INFO_Y_RES, 0x00, 0x00
+	};
+
+	/* Get X/Y size in mm */
+	error = elants_i2c_execute_command(client, get_xres_cmd,
+					   sizeof(get_xres_cmd),
+					   resp, sizeof(resp), 1,
+					   "get X size");
+	if (error)
+		return error;
+
+	phy_x = resp[2] | ((resp[3] & 0xF0) << 4);
+
+	error = elants_i2c_execute_command(client, get_yres_cmd,
+					   sizeof(get_yres_cmd),
+					   resp, sizeof(resp), 1,
+					   "get Y size");
+	if (error)
+		return error;
+
+	phy_y = resp[2] | ((resp[3] & 0xF0) << 4);
+
+	dev_dbg(&client->dev, "phy_x=%d, phy_y=%d\n", phy_x, phy_y);
+
+	ts->phy_x = phy_x;
+	ts->phy_y = phy_y;
+
+	/* eKTF doesn't report max size, set it to default values */
+	ts->x_max = 2240 - 1;
+	ts->y_max = 1408 - 1;
+
+	return 0;
+}
+
+static int elants_i2c_query_ts_info_ekth(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
 	int error;
@@ -508,6 +564,8 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
 		ts->x_res = DIV_ROUND_CLOSEST(ts->x_max, phy_x);
 		ts->y_max = ELAN_TS_RESOLUTION(cols, osr);
 		ts->y_res = DIV_ROUND_CLOSEST(ts->y_max, phy_y);
+		ts->phy_x = phy_x;
+		ts->phy_y = phy_y;
 	}
 
 	return 0;
@@ -587,8 +645,20 @@ static int elants_i2c_initialize(struct elants_data *ts)
 		error = elants_i2c_query_fw_version(ts);
 	if (!error)
 		error = elants_i2c_query_test_version(ts);
-	if (!error)
-		error = elants_i2c_query_ts_info(ts);
+
+	switch (ts->chip_id) {
+	case EKTH3500:
+		if (!error)
+			error = elants_i2c_query_ts_info_ekth(ts);
+		break;
+	case EKTF3624:
+		if (!error)
+			error = elants_i2c_query_ts_info_ektf(ts);
+		break;
+	default:
+		unreachable();
+		break;
+	}
 
 	if (error)
 		ts->iap_mode = ELAN_IAP_RECOVERY;
@@ -853,7 +923,8 @@ static int elants_i2c_fw_update(struct elants_data *ts)
  * Event reporting.
  */
 
-static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
+static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
+				size_t packet_size)
 {
 	struct input_dev *input = ts->input;
 	unsigned int n_fingers;
@@ -880,8 +951,24 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
 			pos = &buf[FW_POS_XY + i * 3];
 			x = (((u16)pos[0] & 0xf0) << 4) | pos[1];
 			y = (((u16)pos[0] & 0x0f) << 8) | pos[2];
-			p = buf[FW_POS_PRESSURE + i];
-			w = buf[FW_POS_WIDTH + i];
+
+			/*
+			 * eKTF3624 may have use "old" touch-report format,
+			 * depending on a device and TS firmware version.
+			 * For example, ASUS Transformer devices use the "old"
+			 * format, while ASUS Nexus 7 uses the "new" formant.
+			 */
+			if (packet_size == PACKET_SIZE_OLD &&
+			    ts->chip_id == EKTF3624) {
+				w = buf[FW_POS_WIDTH + i / 2];
+				w >>= 4 * (~i & 1);
+				w |= w << 4;
+				w |= !w;
+				p = w;
+			} else {
+				p = buf[FW_POS_PRESSURE + i];
+				w = buf[FW_POS_WIDTH + i];
+			}
 
 			dev_dbg(&ts->client->dev, "i=%d x=%d y=%d p=%d w=%d\n",
 				i, x, y, p, w);
@@ -913,7 +1000,8 @@ static u8 elants_i2c_calculate_checksum(u8 *buf)
 	return checksum;
 }
 
-static void elants_i2c_event(struct elants_data *ts, u8 *buf)
+static void elants_i2c_event(struct elants_data *ts, u8 *buf,
+			     size_t packet_size)
 {
 	u8 checksum = elants_i2c_calculate_checksum(buf);
 
@@ -927,7 +1015,7 @@ static void elants_i2c_event(struct elants_data *ts, u8 *buf)
 			 "%s: unknown packet type: %02x\n",
 			 __func__, buf[FW_POS_HEADER]);
 	else
-		elants_i2c_mt_event(ts, buf);
+		elants_i2c_mt_event(ts, buf, packet_size);
 }
 
 static irqreturn_t elants_i2c_irq(int irq, void *_dev)
@@ -970,7 +1058,6 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 		switch (ts->buf[FW_HDR_TYPE]) {
 		case CMD_HEADER_HELLO:
 		case CMD_HEADER_RESP:
-		case CMD_HEADER_REK:
 			break;
 
 		case QUEUE_HEADER_WAIT:
@@ -985,9 +1072,24 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			break;
 
 		case QUEUE_HEADER_SINGLE:
-			elants_i2c_event(ts, &ts->buf[HEADER_SIZE]);
+			elants_i2c_event(ts, &ts->buf[HEADER_SIZE],
+					 ts->buf[FW_HDR_LENGTH]);
 			break;
 
+		case QUEUE_HEADER_NORMAL2: /* CMD_HEADER_REK */
+			/*
+			 * Depending on firmware version, eKTF3624 touchscreens
+			 * may utilize one of these opcodes for the touch events:
+			 * 0x63 (NORMAL) and 0x66 (NORMAL2).  The 0x63 is used by
+			 * older firmware version and differs from 0x66 such that
+			 * touch pressure value needs to be adjusted.  The 0x66
+			 * opcode of newer firmware is equal to 0x63 of eKTH3500.
+			 */
+			if (ts->chip_id != EKTF3624)
+				break;
+
+			fallthrough;
+
 		case QUEUE_HEADER_NORMAL:
 			report_count = ts->buf[FW_HDR_COUNT];
 			if (report_count == 0 || report_count > 3) {
@@ -998,7 +1100,12 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			}
 
 			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
-			if (report_len != PACKET_SIZE) {
+
+			if (report_len == PACKET_SIZE_OLD &&
+			    ts->chip_id == EKTF3624) {
+				dev_dbg_once(&client->dev,
+					     "using old report format\n");
+			} else if (report_len != PACKET_SIZE) {
 				dev_err(&client->dev,
 					"mismatching report length: %*ph\n",
 					HEADER_SIZE, ts->buf);
@@ -1007,8 +1114,8 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 
 			for (i = 0; i < report_count; i++) {
 				u8 *buf = ts->buf + HEADER_SIZE +
-							i * PACKET_SIZE;
-				elants_i2c_event(ts, buf);
+							i * report_len;
+				elants_i2c_event(ts, buf, report_len);
 			}
 			break;
 
@@ -1250,6 +1357,7 @@ static int elants_i2c_probe(struct i2c_client *client,
 	init_completion(&ts->cmd_done);
 
 	ts->client = client;
+	ts->chip_id = (enum elants_chip_id)id->driver_data;
 	i2c_set_clientdata(client, ts);
 
 	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
@@ -1331,13 +1439,20 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
 	input_set_abs_params(ts->input, ABS_MT_TOOL_TYPE,
 			     0, MT_TOOL_PALM, 0, 0);
+
+	touchscreen_parse_properties(ts->input, true, &ts->prop);
+
+	if (ts->chip_id == EKTF3624) {
+		/* calculate resolution from size */
+		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, ts->phy_x);
+		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, ts->phy_y);
+	}
+
 	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
 	if (ts->major_res > 0)
 		input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, ts->major_res);
 
-	touchscreen_parse_properties(ts->input, true, &ts->prop);
-
 	error = input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error) {
@@ -1466,14 +1581,16 @@ static SIMPLE_DEV_PM_OPS(elants_i2c_pm_ops,
 			 elants_i2c_suspend, elants_i2c_resume);
 
 static const struct i2c_device_id elants_i2c_id[] = {
-	{ DEVICE_NAME, 0 },
+	{ DEVICE_NAME, EKTH3500 },
+	{ "ekth3500", EKTH3500 },
+	{ "ektf3624", EKTF3624 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, elants_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id elants_acpi_id[] = {
-	{ "ELAN0001", 0 },
+	{ "ELAN0001", EKTH3500 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
@@ -1482,6 +1599,7 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
 #ifdef CONFIG_OF
 static const struct of_device_id elants_of_match[] = {
 	{ .compatible = "elan,ekth3500" },
+	{ .compatible = "elan,ektf3624" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, elants_of_match);
-- 
2.29.2


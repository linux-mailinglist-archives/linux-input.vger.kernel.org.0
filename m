Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C467A2A93CE
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 11:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgKFKMa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 05:12:30 -0500
Received: from goliath.siemens.de ([192.35.17.28]:44741 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgKFKMa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Nov 2020 05:12:30 -0500
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0A6ACIPv023943
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 6 Nov 2020 11:12:18 +0100
Received: from dev.vm7.ccp.siemens.com ([139.22.40.104])
        by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 0A6ACHg9025432;
        Fri, 6 Nov 2020 11:12:17 +0100
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 1BAD870FF87;
        Fri,  6 Nov 2020 11:06:56 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     robh@kernel.org, nick@shmanahar.org, hadess@hadess.net,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH v2 1/3] Input: st1232 - add support resolution reading
Date:   Fri,  6 Nov 2020 11:05:37 +0100
Message-Id: <20201106100539.6646-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029170313.25529-1-andrej.valek@siemens.com>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hard-coding resolution for st1633 device was wrong. Some of LCDs like
YTS700TLBC-02-100C has assembled Sitronix st1633 touchcontroller too. But
the resolution is not 320x480 as was hard-coded.
Add new function which reads correct resolution directly from register.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 drivers/input/touchscreen/st1232.c | 52 +++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 63b29c7279e2..1b4b139c8533 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -26,15 +26,14 @@
 #define ST1232_TS_NAME	"st1232-ts"
 #define ST1633_TS_NAME	"st1633-ts"
 
+#define REG_XY_RESOLUTION	0x04
+#define REG_XY_COORDINATES	0x12
 #define ST_TS_MAX_FINGERS	10
 
 struct st_chip_info {
 	bool	have_z;
-	u16	max_x;
-	u16	max_y;
 	u16	max_area;
 	u16	max_fingers;
-	u8	start_reg;
 };
 
 struct st1232_ts_data {
@@ -48,15 +47,14 @@ struct st1232_ts_data {
 	u8 *read_buf;
 };
 
-static int st1232_ts_read_data(struct st1232_ts_data *ts)
+static int st1232_ts_read_data(struct st1232_ts_data *ts, u8 reg)
 {
 	struct i2c_client *client = ts->client;
-	u8 start_reg = ts->chip_info->start_reg;
 	struct i2c_msg msg[] = {
 		{
 			.addr	= client->addr,
-			.len	= sizeof(start_reg),
-			.buf	= &start_reg,
+			.len	= sizeof(reg),
+			.buf	= &reg,
 		},
 		{
 			.addr	= client->addr,
@@ -74,6 +72,25 @@ static int st1232_ts_read_data(struct st1232_ts_data *ts)
 	return 0;
 }
 
+static int st1232_ts_read_resolution(struct st1232_ts_data *ts, u16 *max_x,
+				     u16 *max_y)
+{
+	u8 *buf;
+	int error;
+
+	/* select resolution register */
+	error = st1232_ts_read_data(ts, REG_XY_RESOLUTION);
+	if (error)
+		return error;
+
+	buf = ts->read_buf;
+
+	*max_x = ((buf[0] & 0x0070) << 4) | buf[1];
+	*max_y = ((buf[0] & 0x0007) << 8) | buf[2];
+
+	return 0;
+}
+
 static int st1232_ts_parse_and_report(struct st1232_ts_data *ts)
 {
 	struct input_dev *input = ts->input_dev;
@@ -123,7 +140,7 @@ static irqreturn_t st1232_ts_irq_handler(int irq, void *dev_id)
 	int count;
 	int error;
 
-	error = st1232_ts_read_data(ts);
+	error = st1232_ts_read_data(ts, REG_XY_COORDINATES);
 	if (error)
 		goto out;
 
@@ -157,20 +174,14 @@ static void st1232_ts_power_off(void *data)
 
 static const struct st_chip_info st1232_chip_info = {
 	.have_z		= true,
-	.max_x		= 0x31f, /* 800 - 1 */
-	.max_y		= 0x1df, /* 480 -1 */
 	.max_area	= 0xff,
 	.max_fingers	= 2,
-	.start_reg	= 0x12,
 };
 
 static const struct st_chip_info st1633_chip_info = {
 	.have_z		= false,
-	.max_x		= 0x13f, /* 320 - 1 */
-	.max_y		= 0x1df, /* 480 -1 */
 	.max_area	= 0x00,
 	.max_fingers	= 5,
-	.start_reg	= 0x12,
 };
 
 static int st1232_ts_probe(struct i2c_client *client,
@@ -179,6 +190,7 @@ static int st1232_ts_probe(struct i2c_client *client,
 	const struct st_chip_info *match;
 	struct st1232_ts_data *ts;
 	struct input_dev *input_dev;
+	u16 max_x, max_y;
 	int error;
 
 	match = device_get_match_data(&client->dev);
@@ -239,14 +251,22 @@ static int st1232_ts_probe(struct i2c_client *client,
 	input_dev->name = "st1232-touchscreen";
 	input_dev->id.bustype = BUS_I2C;
 
+	/* read resolution from chip */
+	error = st1232_ts_read_resolution(ts, &max_x, &max_y);
+	if (error) {
+		dev_err(&client->dev,
+			"Failed to read resolution: %d\n", error);
+		return error;
+	}
+
 	if (ts->chip_info->have_z)
 		input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0,
 				     ts->chip_info->max_area, 0, 0);
 
 	input_set_abs_params(input_dev, ABS_MT_POSITION_X,
-			     0, ts->chip_info->max_x, 0, 0);
+			     0, max_x, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_POSITION_Y,
-			     0, ts->chip_info->max_y, 0, 0);
+			     0, max_y, 0, 0);
 
 	touchscreen_parse_properties(input_dev, true, &ts->prop);
 
-- 
2.20.1


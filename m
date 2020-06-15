Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83A91F994E
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 15:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgFONuc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 09:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728510AbgFONub (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 09:50:31 -0400
X-Greylist: delayed 1477 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 15 Jun 2020 06:50:31 PDT
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77236C061A0E;
        Mon, 15 Jun 2020 06:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
        Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
        In-Reply-To:References; bh=RRZYWBoIuPtmDaMa0TmpMUNpOE6w5lqFYe+cBmKMpHQ=; b=mZ
        tmxJ86HeiW0lwKAyvmBD4KRIg5YF8PCP2O5yeE1Rijc6h9OARxc1Q6LRoqR/4jZg3M/1LKDcPYQSO
        0U7USPy44HMzdmtKIJqEIXVAWRUiMrHfZ/BnpcM38my8DkBAamvFzp0BylCzT+VYayVTN21AUuUdR
        v+c376q+HlrezE9kqQKY1GOVEBPHNaXr74Z64e0ECKapQhz+YrZ1+U9OS9zTMxHCFMk7cadYxDEuJ
        TAgJcghmrpnBCTq4oRyyjmdfii2EDEWSy9HeL+bqDQ5E/0a+mrE/+032ItujptIPYAdoWBJAdtfTo
        lOcZdKRRmlEiT02Q+tYK9FSxQyh6a83w==;
Received: from johnkeeping.plus.com ([81.174.171.191] helo=donbot.metanate.com)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1jkp7U-00024q-Lm; Mon, 15 Jun 2020 14:25:48 +0100
From:   John Keeping <john@metanate.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     John Keeping <john@metanate.com>,
        Martin Kepplinger <martink@posteo.de>,
        Dixit Parmar <dixitparmar19@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: st1232 - read resolution from touch panel
Date:   Mon, 15 Jun 2020 14:25:32 +0100
Message-Id: <20200615132533.3852637-1-john@metanate.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ST1232 and ST1633 touch controllers have read/write registers for
the X and Y resolution and it seems that these can also be
pre-programmed so that the resolution is matched to that of the display
paired with the touch panel.

Instead of hard coding the resolution in the driver, read it from the
controller when probing.  This requires a delay after de-asserting reset
in order to ensure that the I2C communication succeeds.

I have tested this on ST1633 and the datasheet for ST1232 indicates that
the format of these registers is the same there (and at the same
address).

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/input/touchscreen/st1232.c | 55 +++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 63b29c7279e2..4e032d3a3737 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -28,10 +28,10 @@
 
 #define ST_TS_MAX_FINGERS	10
 
+#define ST1232_RESOLUTION_REG	0x04
+
 struct st_chip_info {
 	bool	have_z;
-	u16	max_x;
-	u16	max_y;
 	u16	max_area;
 	u16	max_fingers;
 	u8	start_reg;
@@ -44,6 +44,8 @@ struct st1232_ts_data {
 	struct dev_pm_qos_request low_latency_req;
 	struct gpio_desc *reset_gpio;
 	const struct st_chip_info *chip_info;
+	u16 max_x;
+	u16 max_y;
 	int read_buf_len;
 	u8 *read_buf;
 };
@@ -117,6 +119,36 @@ static int st1232_ts_parse_and_report(struct st1232_ts_data *ts)
 	return n_contacts;
 }
 
+static int st1232_ts_read_resolution(struct st1232_ts_data *ts)
+{
+	struct i2c_client *client = ts->client;
+	u8 start_reg = ST1232_RESOLUTION_REG;
+	u8 buf[3];
+	struct i2c_msg msg[] = {
+		{
+			.addr	= client->addr,
+			.len	= sizeof(start_reg),
+			.buf	= &start_reg,
+		},
+		{
+			.addr	= client->addr,
+			.flags	= I2C_M_RD,
+			.len	= sizeof(buf),
+			.buf	= buf,
+		},
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret != ARRAY_SIZE(msg))
+		return ret < 0 ? ret : -EIO;
+
+	ts->max_x = (((buf[0] & 0xf0) << 4) | buf[1]) - 1;
+	ts->max_y = (((buf[0] & 0x0f) << 8) | buf[2]) - 1;
+
+	return 0;
+}
+
 static irqreturn_t st1232_ts_irq_handler(int irq, void *dev_id)
 {
 	struct st1232_ts_data *ts = dev_id;
@@ -146,8 +178,10 @@ static irqreturn_t st1232_ts_irq_handler(int irq, void *dev_id)
 
 static void st1232_ts_power(struct st1232_ts_data *ts, bool poweron)
 {
-	if (ts->reset_gpio)
+	if (ts->reset_gpio) {
 		gpiod_set_value_cansleep(ts->reset_gpio, !poweron);
+		msleep(100);
+	}
 }
 
 static void st1232_ts_power_off(void *data)
@@ -157,8 +191,6 @@ static void st1232_ts_power_off(void *data)
 
 static const struct st_chip_info st1232_chip_info = {
 	.have_z		= true,
-	.max_x		= 0x31f, /* 800 - 1 */
-	.max_y		= 0x1df, /* 480 -1 */
 	.max_area	= 0xff,
 	.max_fingers	= 2,
 	.start_reg	= 0x12,
@@ -166,8 +198,6 @@ static const struct st_chip_info st1232_chip_info = {
 
 static const struct st_chip_info st1633_chip_info = {
 	.have_z		= false,
-	.max_x		= 0x13f, /* 320 - 1 */
-	.max_y		= 0x1df, /* 480 -1 */
 	.max_area	= 0x00,
 	.max_fingers	= 5,
 	.start_reg	= 0x12,
@@ -236,6 +266,13 @@ static int st1232_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	error = st1232_ts_read_resolution(ts);
+	if (error) {
+		dev_err(&client->dev,
+			"Failed to read touch panel resolution: %d\n", error);
+		return error;
+	}
+
 	input_dev->name = "st1232-touchscreen";
 	input_dev->id.bustype = BUS_I2C;
 
@@ -244,9 +281,9 @@ static int st1232_ts_probe(struct i2c_client *client,
 				     ts->chip_info->max_area, 0, 0);
 
 	input_set_abs_params(input_dev, ABS_MT_POSITION_X,
-			     0, ts->chip_info->max_x, 0, 0);
+			     0, ts->max_x, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_POSITION_Y,
-			     0, ts->chip_info->max_y, 0, 0);
+			     0, ts->max_y, 0, 0);
 
 	touchscreen_parse_properties(input_dev, true, &ts->prop);
 
-- 
2.27.0


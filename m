Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10E33BF991
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhGHMCI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:02:08 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:47413 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231758AbhGHMCI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:02:08 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7B91158057A;
        Thu,  8 Jul 2021 07:59:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 08 Jul 2021 07:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=42U8DUxuirT24
        UG9G+vL9N8k4v79ZOffL9JMNB77jg0=; b=G9VTsOyA4qteaTeaIxSWb3b0Vl+f4
        tDBFgGL9mG++pp/HgIOMh5U+MvNueKYqydhvfAUEs2kUtyaCD7FDaGuGLpqL2bgr
        gnCevHiPkAdTDPkPOZmLv8ur8KsbjOMQDpbQuCp7TdU5CbixfBUzkT+892kQ9tLd
        wBnayOVXX9vh3CJXRGcsd9RouDH9xmZSoy6sDOjP9lbYHF9ZmoucdY45RvUHzQfQ
        drpTfa9d8RPjX2EXWY1oYZnXLftZVjVxu5R4USkrcJndNbvVpNTtu8nBO7NfKmJG
        t0rp8BQ1ADj6LGg7r15ffOvWJ74NGm3YoqBy2kEu/x2HoyownGRG9d9ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=42U8DUxuirT24UG9G+vL9N8k4v79ZOffL9JMNB77jg0=; b=X/SPauw9
        tIwvgl66IT3BBHAZLhU2LqHKZc2YjatGxU/xiOLdLvrSacv4C4BVt4RAek23myRu
        ENSZtm0JaLgnL8grXgWpnl76k5feHpuhVarwWrmHnlz1mZcAnr8cBYrvKj5IrBzS
        ZvI0PDFuak5g5AALPOWhkH6rkYIHakq7u300YKY+iptVZ07aS4foJhQsJ+WeGV9/
        NPIaa+3l/tXGfS+Q89YAh8pkW8gwtpL1T/mx5CqXXhJxS8eICgTnGWRJ4ExFxPXX
        lx/Wy72IGsVXnMRyO6iSz9g2itDWaidoVw3K6whH9ji57fTCWEaSypkrf8S2UFWK
        9bV+KM9F6QUFew==
X-ME-Sender: <xms:nujmYOK1krZqXbReyHlXr8z8CkMsuZhNPV1OS2XBZQ6C3Zig93KXsg>
    <xme:nujmYGKZLnwFjp5MPXWIX0VrRP3Ikdaz_Ge7EaQKm7JITISlmtjLiFeKj93rVFPX-
    cnv8KXxYW9N0JSJZjo>
X-ME-Received: <xmr:nujmYOuyXReYuLpJ2BsGnKa7NymDLoq4Kt47-G1Hn8eeInz7o76OyLNkouQwH1ZRWDxw3y5rFPIQ1A384qo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:nujmYDa8KyFSjvJb1gi78Q7RgHeaEe4OEHgkZMdicZ84mymlHi_hWQ>
    <xmx:nujmYFZrw_xAA_L_VXBqBDdy1BvlXZ2Tu63E6yTg54n1-2Xi87AZGQ>
    <xmx:nujmYPCT0jnChTV8_cZ_LxJjAe7ciptvybiOXhWsdL3_gz0_PkYvJA>
    <xmx:nujmYCR_0yfjqSBIUv7GfbQ3-AFempmZz4D6PjgJvDfkkZ7gdATIOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:21 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 4/9] Input: wacom_i2c - Add touchscren properties
Date:   Thu,  8 Jul 2021 21:58:48 +1000
Message-Id: <20210708115853.281-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708115853.281-1-alistair@alistair23.me>
References: <20210708115853.281-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Connect touchscreen properties to the wacom_i2c.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 28 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 6053595f2b30..b47bc08efdd1 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/irq.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
@@ -33,6 +34,8 @@ struct wacom_features {
 struct wacom_i2c {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct touchscreen_properties props;
+	struct wacom_features features;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -90,6 +93,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 {
 	struct wacom_i2c *wac_i2c = dev_id;
 	struct input_dev *input = wac_i2c->input;
+	struct wacom_features *features = &wac_i2c->features;
 	u8 *data = wac_i2c->data;
 	unsigned int x, y, pressure;
 	unsigned char tsw, f1, f2, ers;
@@ -114,12 +118,12 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 
 	wac_i2c->prox = data[3] & 0x20;
 
+	touchscreen_report_pos(input, &wac_i2c->props, features->x_max,
+			       features->y_max, true);
 	input_report_key(input, BTN_TOUCH, tsw || ers);
 	input_report_key(input, wac_i2c->tool, wac_i2c->prox);
 	input_report_key(input, BTN_STYLUS, f1);
 	input_report_key(input, BTN_STYLUS2, f2);
-	input_report_abs(input, ABS_X, x);
-	input_report_abs(input, ABS_Y, y);
 	input_report_abs(input, ABS_PRESSURE, pressure);
 	input_sync(input);
 
@@ -151,7 +155,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct wacom_i2c *wac_i2c;
 	struct input_dev *input;
-	struct wacom_features features = { 0 };
+	struct wacom_features *features;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -159,14 +163,15 @@ static int wacom_i2c_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	error = wacom_query_device(client, &features);
-	if (error)
-		return error;
-
 	wac_i2c = devm_kzalloc(dev, sizeof(*wac_i2c), GFP_KERNEL);
 	if (!wac_i2c)
 		return -ENOMEM;
 
+	features = &wac_i2c->features;
+	error = wacom_query_device(client, features);
+	if (error)
+		return error;
+
 	wac_i2c->client = client;
 
 	input = devm_input_allocate_device(dev);
@@ -178,7 +183,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	input->name = "Wacom I2C Digitizer";
 	input->id.bustype = BUS_I2C;
 	input->id.vendor = 0x56a;
-	input->id.version = features.fw_version;
+	input->id.version = features->fw_version;
 	input->open = wacom_i2c_open;
 	input->close = wacom_i2c_close;
 
@@ -190,10 +195,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	__set_bit(BTN_STYLUS2, input->keybit);
 	__set_bit(BTN_TOUCH, input->keybit);
 
-	input_set_abs_params(input, ABS_X, 0, features.x_max, 0, 0);
-	input_set_abs_params(input, ABS_Y, 0, features.y_max, 0, 0);
+	touchscreen_parse_properties(input, true, &wac_i2c->props);
+	input_set_abs_params(input, ABS_X, 0, features->x_max, 0, 0);
+	input_set_abs_params(input, ABS_Y, 0, features->y_max, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE,
-			     0, features.pressure_max, 0, 0);
+			     0, features->pressure_max, 0, 0);
 
 	input_set_drvdata(input, wac_i2c);
 
-- 
2.31.1


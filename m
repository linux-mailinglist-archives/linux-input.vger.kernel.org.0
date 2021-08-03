Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123DD3DE8D1
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 10:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234789AbhHCIti (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 04:49:38 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:40377 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234755AbhHCItg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Aug 2021 04:49:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id BEF985809FE;
        Tue,  3 Aug 2021 04:49:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 03 Aug 2021 04:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=42U8DUxuirT24
        UG9G+vL9N8k4v79ZOffL9JMNB77jg0=; b=Xyo0KgLDDAuLJy4StsXsBDlMYifDv
        CCt+rYN9eGUnG4A3AvE1LW/oitew5D+TzPWQrRhBSk7lM38VBRwAdbEXLgAdOn0o
        QDtnP8m5pDET/uTHJD54SEpOpr+lEpC8qQmWdnvaoLdc2GcyCsRknxYW1UnlXyu8
        T2IK+IHg6KmzHA9ItOIHkBGHmaZ0txRgq17PjELsW7O8FaBVxClpxQsunPiXZcMf
        IYPTjhgl5bA3n3vFHyXbWGrGyDYpzJgAzHkKtRvvfhkZVR1ilsHnwgN/n7bSDekO
        Z47dLK3XzbwRKd41D381Zld3nCM17lBIrLo9+d7LaJAJSYIPv5Ta+bDMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=42U8DUxuirT24UG9G+vL9N8k4v79ZOffL9JMNB77jg0=; b=ITVeK6Bz
        qOEHhaXImXM9YOyM0h15onQZDDi8WgXn9Xnr8nMmd6TMdoplv757PvolUHxYsnI+
        MoIYPgmZtGA7K901ptifwPDfSfmJblNU9Q0+Nno5lGOLVBvRKg3GOXbTNzlv6kT9
        IUiScpjH9+GjjIUeAOJ6DMqJlmQnDEbvU5wdxKvyLNeR8hx5s9hV+kmdrkQtBZi9
        5+FQ7/i76B8IIMGIzTrMjy/dwYwoVy7PMih+Ut3+EaWVxr9MPO0eqE3pTydHfi5F
        pxYFnGqu9BIx/hkvKY8Kza8+ZGWSBzXcLEwUYhvjWRdhxVC5TesYhfMTNGSnK+oF
        e+C4rEpiDmmxlQ==
X-ME-Sender: <xms:FQMJYdIOxnUHG1qt5ds2FpkLIMIyvQgcCAsW3qttuQhFcZ3nV77UeQ>
    <xme:FQMJYZIXMyRjJcTSA0dUm1ORif98iRnRQSWtzAlPaKne8Lq7b4YD-KtOOPEFf0f-N
    CgNAdeUrSGd9xSumT4>
X-ME-Received: <xmr:FQMJYVuN5p4_OWS33665y_nCbM1U_hAm6f2KO0Zed49UCE--Y8wmZy5JVqracdMXPKBztMl9usXZD6bi3lhcVeE-3earql2uGQ6b16EnVnKI7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:FQMJYeZd8UkpPSOiUzY8Hhe_UZG401laIH3soX48f6m3xG5u-ZxZnQ>
    <xmx:FQMJYUZjbZYkx-5fcyqGjNMqqjUgSWLsPGtqbFarhJtZKFSLmMKOoA>
    <xmx:FQMJYSDFMg13MH503jDTxWE3fyubNLCrBgcErQyLolL1T8XUGv997w>
    <xmx:FQMJYRRTq9gbUgHyb3pqNvJo2jX25ifc9p_uY3qP7mnA_vL_h0rfEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 04:49:21 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v8 4/9] Input: wacom_i2c - Add touchscren properties
Date:   Tue,  3 Aug 2021 18:48:57 +1000
Message-Id: <20210803084902.336-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803084902.336-1-alistair@alistair23.me>
References: <20210803084902.336-1-alistair@alistair23.me>
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


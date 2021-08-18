Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD203F17F6
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238689AbhHSLVc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:21:32 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:36485 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238745AbhHSLVa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:30 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id D2297580C0E;
        Thu, 19 Aug 2021 07:20:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 19 Aug 2021 07:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=wDxD148pGxNLo
        fDiRuvl3Q1zS4b7Jw1CAMW3y7CSj/k=; b=B682DwcRnHBaLDwRGnbLkSGLL7zV1
        +awkXg53d9OOHbnFzuGM1w+yzpeULlxzb+iHDaR4im6w0VXhVc4gG5pbQ/5AYJfa
        eW3erAUl+nP+orMRTIBp/ieFeA53ax4MV3C6j7xagmTLZwyo8+6J0BncaswjVv/N
        h9GWmOlWcKFJCnm47rpdcmqxaZ47nR+T8Yenj9Ca99wp+NUpHu47/1999GfNgTmL
        AUy3KRF2AOOHX4BVuemsuzVJ3Jb8JV1Uq8rNDZOQcXXHqwGLCoixZ+fkB/4+hfFa
        OJ7j+/YheAe79NjqBlO5B0nTeCpMii0r2pZBKifJ8HlKw6ih3kUWqwbGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=wDxD148pGxNLofDiRuvl3Q1zS4b7Jw1CAMW3y7CSj/k=; b=ijkfvo3N
        7y8sQZ0BnxwQ18ZzLNmy8zmAb0gjVKZlMlT9CmfG1+1iZKaUJLw39aAsFWGsoYjZ
        BFCTf79FK4ce8M6LMvR9K/Y2D+GKQC59TUG9Eiq9BCWZgNMNc6i+nbcU7nVwT67S
        Ec2fSGYWY5CbbRzMrkq37d4xmqFlMUk3WkAGod1UK/0e6CyPjobHetv21pbmIVg/
        z9N9aVebdwloHOhDpgsY1/tL210raNtWI+vflm7pa+MTCKXvOSzBbHZ2XbJTxm0I
        0whnlWKx/G14mjfNCwVxV/1CMGxBOAcrKODhjLNKvZdlqlYFm/FYOpq4RgPnE1b6
        OHJS2iEyhUttHA==
X-ME-Sender: <xms:lD4eYRdnRsi-o2_qqX0bxonKEjoaSOEl_VGylPN39KVqMVgUSReRiw>
    <xme:lD4eYfOqwsl6QVG6WynobvErYcHUMWl21ZB6eWRpTDYCSuDd2nxYkwqBHlpWLHgfM
    MTR4ozA7-IjVcBK-P8>
X-ME-Received: <xmr:lD4eYahz3RYzUBDcpyVd6vTfUkn5Cq9UHA4ro83SBYTA4U0j-YSRhyQ3UM71xnEBQKonKjxX7nLCBfBGxmhcNe1K316xAkYgiTsVNnloeHlc9FlX8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:lD4eYa-a9kUxhMLnzBXmxGE7dK1-rMkyR4_9Vd6X9_LVuCAve9-czw>
    <xmx:lD4eYdvakPCZiGS0JUVk_jF71N_A5UxBGnFivhUjDi4PH_F_HU0MeQ>
    <xmx:lD4eYZGNGL_kqgnqX-e2UVGKOqEMtVPE4vzBwfcfbWdP4FpZm4vIQw>
    <xmx:lT4eYenZHxLi0RIp_LMx_I2jhtPhLJWsUzlpapRgIOu1v-S6VUFy2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:20:48 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 04/11] Input: wacom_i2c - Add touchscren properties
Date:   Thu, 19 Aug 2021 01:49:28 +1000
Message-Id: <20210818154935.1154-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Connect touchscreen properties to the wacom_i2c.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 6053595f2b30..28255c77d426 100644
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
@@ -114,6 +118,8 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 
 	wac_i2c->prox = data[3] & 0x20;
 
+	touchscreen_report_pos(input, &wac_i2c->props, features->x_max,
+			       features->y_max, true);
 	input_report_key(input, BTN_TOUCH, tsw || ers);
 	input_report_key(input, wac_i2c->tool, wac_i2c->prox);
 	input_report_key(input, BTN_STYLUS, f1);
@@ -151,7 +157,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct wacom_i2c *wac_i2c;
 	struct input_dev *input;
-	struct wacom_features features = { 0 };
+	struct wacom_features *features;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -159,14 +165,15 @@ static int wacom_i2c_probe(struct i2c_client *client,
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
@@ -178,7 +185,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	input->name = "Wacom I2C Digitizer";
 	input->id.bustype = BUS_I2C;
 	input->id.vendor = 0x56a;
-	input->id.version = features.fw_version;
+	input->id.version = features->fw_version;
 	input->open = wacom_i2c_open;
 	input->close = wacom_i2c_close;
 
@@ -190,10 +197,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
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


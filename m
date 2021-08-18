Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9063F1809
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239043AbhHSLWC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:22:02 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:53079 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238896AbhHSLVx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:53 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id CCEC4580BC3;
        Thu, 19 Aug 2021 07:21:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 19 Aug 2021 07:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=FKbcG/SSuUeVV
        rDhhMj/yHt2PNjV6DYHgylyNKHb+uM=; b=aFrVOdzMM31ojGj0nTaWi8DHFW8ur
        7Qlm9TAwJcEelIU4YsaK0LCqgA8bXmxDHJ2+jYFl7+IuS/QZ0SfYITDrlOXhS2Gg
        DPBxlnkNIOaQrYXBATHm49uUN+EBfBQE7n68y5QrN9x4wYQ2lNXsKIGujCVHFpYH
        uHOUuvG5s0yYWvWuhr+Tk1ZC6am5P/zOdJ0ACpdsZoCL5ci+wOh77fN8Idi7inD3
        PPZyyBdAUcAesVy2xiXrlHjE6RP+32ItbT5P3rNRIour85W+ufU8aMpB25HXb4yG
        5VKqKA06hmJcZGmRT1QofHf04xBAngdQcrx/1jyE8E9CuDlZyqzq7LKfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=FKbcG/SSuUeVVrDhhMj/yHt2PNjV6DYHgylyNKHb+uM=; b=HTcDC1o/
        VMdFYJJH5khZT/fwJBT1Iml4jEmLmehKQLFrlBkGkib9oS1+t9kkwExvwx4DDWTb
        zykngBuJgEEvmDFnsFKj9svLTtUBKRs5CpsR7KxMp9rQoRFPN/dD0a4FWU28GMgZ
        31aRmpRZviDd7/D7b04V780ZcfS6iQIPO8qaxgIp6z8RmWbzw7TJLLV+ZsOT9EGy
        PeomLcedLL4T51iK9kp2GcnY+Pp2hEzIcBiOCpftnyKH2jQTVpZV10CcLuNVE2t3
        AXX6P63m6BGeG0ijgc4ETCXrCQGSUjLamNWKcv5POOEkuvs0obuSCMc2qm7Ncbu5
        6/yAllgPL50iOQ==
X-ME-Sender: <xms:rD4eYW31_thbJeObFJ-5F-khI_UTNlpP-gPz-Yh2mCPP4JvrC534GA>
    <xme:rD4eYZGJgIP8wKPSaugpOng94dsREMuyIuzQDsO8b_OQqHgIBEuiJGp_EeYkZKQBJ
    7Co5YjMnQoryaw0zcY>
X-ME-Received: <xmr:rD4eYe4wXwAcVFfcDfGdbfJ4h5GZ79B1j_Y9Mus2w2loVDSw1mYLWFvLeounYUx2iQ8RZ2Eu41LLjPsuzDUvzc7SKaioBAnLGd54E8N5ACmfnAqKcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:rD4eYX0VyXLu6o93F4XPuHp_aO2MZX8_JaSWVSV2noPa9Dz3qgfWDw>
    <xmx:rD4eYZE4bPoaiC1yKdG499oRIh0IBH-bUoNlmymNiWcJTrlkwjYQKw>
    <xmx:rD4eYQ_4eD_XbJssv-CUkJH6mskgSfTx5h5PcRrT8GPSBAag5bIyiA>
    <xmx:rD4eYR8RBgCbQTGxvWgzGhm4F_M9hS6htVknY3HeD7xMtxEDkuNDiA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:21:12 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 09/11] Input: wacom_i2c - Allow flipping the values from the DT
Date:   Thu, 19 Aug 2021 01:49:33 +1000
Message-Id: <20210818154935.1154-10-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the device tree properties to flip the tilx, position or distance
values.

This is required for the stylus to work correctly on the reMarkable 2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../input/touchscreen/wacom,generic.yaml      | 18 ++++++++++
 drivers/input/touchscreen/wacom_i2c.c         | 33 +++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
index a8a7f362b0ce..0da63fd92ea1 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
@@ -25,6 +25,24 @@ properties:
   vdd-supply:
     description: Power Supply
 
+  flip-tilt-x:
+    type: boolean
+
+  flip-tilt-y:
+    type: boolean
+
+  flip-pos-x:
+    type: boolean
+
+  flip-pos-y:
+    type: boolean
+
+  flip-distance:
+    type: boolean
+
+  flip-pressure:
+    type: boolean
+
 required:
   - compatible
   - reg
diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index c6579a1a8d04..82b62a768451 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -72,6 +72,13 @@ struct wacom_i2c {
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
+
+	bool flip_tilt_x;
+	bool flip_tilt_y;
+	bool flip_pos_x;
+	bool flip_pos_y;
+	bool flip_distance;
+	bool flip_pressure;
 };
 
 static int wacom_query_device(struct i2c_client *client,
@@ -140,6 +147,20 @@ static int wacom_query_device(struct i2c_client *client,
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static void wacom_of_read(struct wacom_i2c *wac_i2c)
+{
+	struct i2c_client *client = wac_i2c->client;
+
+	wac_i2c->flip_tilt_x = of_property_read_bool(client->dev.of_node, "flip-tilt-x");
+	wac_i2c->flip_tilt_y = of_property_read_bool(client->dev.of_node, "flip-tilt-y");
+	wac_i2c->flip_pos_x = of_property_read_bool(client->dev.of_node, "flip-pos-x");
+	wac_i2c->flip_pos_y = of_property_read_bool(client->dev.of_node, "flip-pos-y");
+	wac_i2c->flip_distance = of_property_read_bool(client->dev.of_node, "flip-distance");
+	wac_i2c->flip_pressure = of_property_read_bool(client->dev.of_node, "flip-pressure");
+}
+#endif
+
 static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 {
 	struct wacom_i2c *wac_i2c = dev_id;
@@ -176,6 +197,14 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 
 	wac_i2c->prox = data[3] & 0x20;
 
+	// Flip the values based on properties from the device tree
+	pressure = wac_i2c->flip_pressure ? (features->pressure_max - pressure) : pressure;
+	distance = wac_i2c->flip_distance ? -distance : distance;
+	x = wac_i2c->flip_pos_x ? (features->x_max - x) : x;
+	y = wac_i2c->flip_pos_y ? (features->y_max - y) : y;
+	tilt_x = wac_i2c->flip_tilt_x ? -tilt_x : tilt_x;
+	tilt_y = wac_i2c->flip_tilt_y ? -tilt_y : tilt_y;
+
 	touchscreen_report_pos(input, &wac_i2c->props, features->x_max,
 			       features->y_max, true);
 	input_report_key(input, BTN_TOUCH, tsw || ers);
@@ -303,6 +332,10 @@ static int wacom_i2c_probe(struct i2c_client *client,
 		return error;
 	}
 
+#ifdef CONFIG_OF
+	wacom_of_read(wac_i2c);
+#endif
+
 	return 0;
 }
 
-- 
2.31.1


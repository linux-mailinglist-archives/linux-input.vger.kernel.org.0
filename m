Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B253DE8D6
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 10:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234822AbhHCItm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 04:49:42 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:43351 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234831AbhHCItl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Aug 2021 04:49:41 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6CEC4580A6F;
        Tue,  3 Aug 2021 04:49:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 03 Aug 2021 04:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=jLYfQBxc5Fss5
        wHk6K78mpbcM1U0H/2OtEIpp1nXFxo=; b=KoUaDUdq0JGBRJfCaLpRGFYCR1vHK
        pECWLeVRHGjYQtdWLREJQBJ0SvKFF2zP5OuHbLu1HI+mZ5dMcbPEYo6oZM0Wy0DD
        FJopDVRO1JnHMyf6aPANXDRKrwr0tnYCnkyi3UvFdVFoWIQGjWM3h3rwttia062/
        1nFvC30ov6NZZpitt2TMZ6HV/RYA5OrQo/alCp82faCHnHU0JejSYECJ2gnPtOo+
        fKtRrRre923/u3mV4VV3EZZL+E6+MnHusnaPcqc8ozpPn2+Hp5ZZTJrs3rUeX5nJ
        NdvvZasj3AGvEOjk/ou4LEujhTgHIk7HRwKFYG1YS7sJXzs+g+5peHalg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=jLYfQBxc5Fss5wHk6K78mpbcM1U0H/2OtEIpp1nXFxo=; b=awA5LDpp
        6I3/0FfGrxZ+1Q7Rta4IbB9mTnzP2WD8oWDVxhfWQrfytADuilwTtSkjo9uALLna
        PI3hF82+OzT0kUjo/1OTj8cLFFLzUpyE8aidLz8v1pkclK7WCDT9Rm2HsKYXNTvb
        U6fKlRVVG/UJLLZhKoczH7eM8deOMP9CxHEjaMWJTovEGZ2gjSzfVgKis9cQdR4L
        UgWox0644+f5picRyFkx7r3e5Spjr8DR5893t+UcgHHNnFigpOHgnCzBqb+dvsiV
        GBy4csxR3tGFk7/iTjMp5tJ39dXx9IjUAHPizWn8Lw9vX2NNGiKhsVd5qT7N9Anw
        o1Fg7aGfmPDotw==
X-ME-Sender: <xms:GgMJYVrq2rYoLkosfBCzdDjH_n6M8KHOG1j0m2Sl0iXw9u5nmlAyog>
    <xme:GgMJYXrAsOhCk7AXbN6p5o30hnVTxQfnbSaCElTnOfplx9uaTo-G07tvBCERqsPRL
    ioj-N_H3VQYg7FhA1M>
X-ME-Received: <xmr:GgMJYSPoBxRYO_tSKBq0drvp86p49D4kI-fal3mjUctD_tvxrfX7bz0akcPtxoqNg83QzsTfx4pG7EURosLC737bOAPJMiP5Kpnoec_z3EFVkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:GgMJYQ61FEEovQzUiDrpVHUnMGD4ipGwE6EWXSR1BYvprhMJzZrHTg>
    <xmx:GgMJYU5vp5l_cPV_aeytKkE7g8gQGuQyZZYDujlkOoH2qBTSRC5RBw>
    <xmx:GgMJYYgUGZsyizb8vI1mtw8YVo84N42jLlgyD6B-Q9KbQDT8SGe6wQ>
    <xmx:GgMJYRxxIJLvsYXSCS3MnlJ5Rpwu2XFXyBbjjSHcOc_KtneYyLqluQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 04:49:26 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v8 5/9] Input: wacom_i2c - Add support for distance and tilt x/y
Date:   Tue,  3 Aug 2021 18:48:58 +1000
Message-Id: <20210803084902.336-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803084902.336-1-alistair@alistair23.me>
References: <20210803084902.336-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is based on the out of tree rM2 driver.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 34 +++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index b47bc08efdd1..e2449a4fa2e3 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -22,12 +22,18 @@
 #define WACOM_CMD_QUERY3	0x02
 #define WACOM_CMD_THROW0	0x05
 #define WACOM_CMD_THROW1	0x00
-#define WACOM_QUERY_SIZE	19
+#define WACOM_QUERY_SIZE	22
+
+#define WACOM_DISTANCE_TILT_VERSION	0x30
 
 struct wacom_features {
 	int x_max;
 	int y_max;
 	int pressure_max;
+	int distance_max;
+	int distance_physical_max;
+	int tilt_x_max;
+	int tilt_y_max;
 	char fw_version;
 };
 
@@ -80,6 +86,17 @@ static int wacom_query_device(struct i2c_client *client,
 	features->y_max = get_unaligned_le16(&data[5]);
 	features->pressure_max = get_unaligned_le16(&data[11]);
 	features->fw_version = get_unaligned_le16(&data[13]);
+	if (features->fw_version >= WACOM_DISTANCE_TILT_VERSION) {
+		features->distance_max = data[15];
+		features->distance_physical_max = data[16];
+		features->tilt_x_max = get_unaligned_le16(&data[17]);
+		features->tilt_y_max = get_unaligned_le16(&data[19]);
+	} else {
+		features->distance_max = -1;
+		features->distance_physical_max = -1;
+		features->tilt_x_max = -1;
+		features->tilt_y_max = -1;
+	}
 
 	dev_dbg(&client->dev,
 		"x_max:%d, y_max:%d, pressure:%d, fw:%d\n",
@@ -97,6 +114,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	u8 *data = wac_i2c->data;
 	unsigned int x, y, pressure;
 	unsigned char tsw, f1, f2, ers;
+	short tilt_x, tilt_y, distance;
 	int error;
 
 	error = i2c_master_recv(wac_i2c->client,
@@ -111,6 +129,11 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	x = le16_to_cpup((__le16 *)&data[4]);
 	y = le16_to_cpup((__le16 *)&data[6]);
 	pressure = le16_to_cpup((__le16 *)&data[8]);
+	distance = data[10];
+
+	/* Signed */
+	tilt_x = le16_to_cpup((__le16 *)&data[11]);
+	tilt_y = le16_to_cpup((__le16 *)&data[13]);
 
 	if (!wac_i2c->prox)
 		wac_i2c->tool = (data[3] & 0x0c) ?
@@ -125,6 +148,9 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	input_report_key(input, BTN_STYLUS, f1);
 	input_report_key(input, BTN_STYLUS2, f2);
 	input_report_abs(input, ABS_PRESSURE, pressure);
+	input_report_abs(input, ABS_DISTANCE, distance);
+	input_report_abs(input, ABS_TILT_X, tilt_x);
+	input_report_abs(input, ABS_TILT_Y, tilt_y);
 	input_sync(input);
 
 out:
@@ -200,7 +226,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_Y, 0, features->y_max, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE,
 			     0, features->pressure_max, 0, 0);
-
+	input_set_abs_params(input, ABS_DISTANCE, 0, features->distance_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_X, -features->tilt_x_max,
+			     features->tilt_x_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_Y, -features->tilt_y_max,
+			     features->tilt_y_max, 0, 0);
 	input_set_drvdata(input, wac_i2c);
 
 	error = devm_request_threaded_irq(dev, client->irq, NULL, wacom_i2c_irq,
-- 
2.31.1


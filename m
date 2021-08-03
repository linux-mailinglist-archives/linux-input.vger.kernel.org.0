Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07FC3DE8DC
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 10:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbhHCItw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 04:49:52 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:42519 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234866AbhHCItv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Aug 2021 04:49:51 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0C3065809FE;
        Tue,  3 Aug 2021 04:49:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 03 Aug 2021 04:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=gJSZFhKVP4HKE
        Mu49hVwBOwgPgn/uZOPWaLARXY00kE=; b=KzgbTPr3fywsrseIj9nRceS7V7xQV
        bzRppA5eueRyL7f/hlCdUZfQ61iETZJffDpzRATcxxHGQzpZ8GYavNrUOml/ijzA
        rkUOYCyZhDEXED6FwHtG8ZFB52WSMrTXSFr4pIQYd9AoHIzN/QOdRz8j0LVpZSMV
        w5j2Vq+menNA0VdPco/O9GLD3S5y8Whn5U9K7EqJ0V0JUQ2/m5OSIKRZ/qfx4rgW
        XoIXMkVWfNfB/Jn1Oy3IqW/2BWFwCltYUObfUeknlSfzSKQVaVSelrAzdNmhVT03
        00x/7aeNp34VO6h9QuWSx7dyKYLa1w+mfVX2byMc+/Xl/s2BM8SqrAqCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=gJSZFhKVP4HKEMu49hVwBOwgPgn/uZOPWaLARXY00kE=; b=EqW95L1f
        MImTkOFAbyMFJn8lSQKdr1zWlaHhlvxndLEJJgFsnxiQz/LwXctwkN8poo7EH4zh
        /8pV5mx/nvYpYD25qTQrgYB+4Qg1YG3m7WzbSPINnqm63QQOSwNYEDuhR2hqdvEZ
        lJ9R9wpCrzNYYMwrj4q0uzcoS7z1ySbDuuZtJjQPlwAEBo+SYLFzYwyLedKUhLnw
        sj4k51FsQuBWK96ErEO4pKGmvChEAENwoyhvjjFP1eDOqyx8Qf1bC9bto8LgphSH
        1OT+2tzOdN++0AOq99KE7YxzRjW4sIqdN14HBaZmrcHuC6EkdOWveS2os67ecuyV
        iRlXvhnH0Hf7dg==
X-ME-Sender: <xms:IwMJYejyJGEiy1ovePXxvS02c1UI1QvraZj25lh8vj61U1NAVk_ijQ>
    <xme:IwMJYfD4zfSBksx-6anQ4lXn9w2uVOJaewkc5mtwD5T6myxd4G1ZtX80z7HN43mVA
    c_CjBtUslShSCcY78s>
X-ME-Received: <xmr:IwMJYWH2-t0RWSNPN363PUzFwUY7u_ExDFAkpC6Yji1wZEXxkYkVnWYV_t42rUXpszso4m6YSr0rMX3kpxJlz4M2Tf2-UQ0ueZqS91F9LgKepg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:IwMJYXR5hYGlwqD7LwUzlsE_YvZ40sQXrT-SptzX4T8iw-rNmBXJrA>
    <xmx:IwMJYbyyJtyu288abQGKOtOyuX56X2kheHY8U9mCIZdyq8O6h0IfSg>
    <xmx:IwMJYV6eRc9UhqiWXlJlZIj1EfE6csppa3JhUs--avi2M5RJLJz1IQ>
    <xmx:JAMJYQpsz0DVUMMCYWN5a2eyh6JnoykcDxgsmLm7nY--jZoRBunZvg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 04:49:35 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v8 7/9] Input: wacom_i2c - Add support for vdd regulator
Date:   Tue,  3 Aug 2021 18:49:00 +1000
Message-Id: <20210803084902.336-7-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803084902.336-1-alistair@alistair23.me>
References: <20210803084902.336-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for a VDD regulator. This allows the kernel to prove the
Wacom-I2C device on the rM2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 49d1c15e623c..df77b17835e4 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -13,6 +13,7 @@
 #include <linux/irq.h>
 #include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
@@ -59,6 +60,7 @@ struct wacom_i2c {
 	struct input_dev *input;
 	struct touchscreen_properties props;
 	struct wacom_features features;
+	struct regulator *vdd;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -222,11 +224,24 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
+	wac_i2c->vdd = regulator_get(&client->dev, "vdd");
+	if (IS_ERR(wac_i2c->vdd))
+		return PTR_ERR(wac_i2c->vdd);
+
+	error = regulator_enable(wac_i2c->vdd);
+	if (error) {
+		regulator_put(wac_i2c->vdd);
+		return error;
+	}
+
 	wac_i2c->client = client;
 
 	input = devm_input_allocate_device(dev);
-	if (!input)
+	if (!input) {
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return -ENOMEM;
+	}
 
 	wac_i2c->input = input;
 
@@ -261,6 +276,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 					  IRQF_ONESHOT, "wacom_i2c", wac_i2c);
 	if (error) {
 		dev_err(dev, "Failed to request IRQ: %d\n", error);
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return error;
 	}
 
@@ -270,6 +287,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	error = input_register_device(wac_i2c->input);
 	if (error) {
 		dev_err(dev, "Failed to register input device: %d\n", error);
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return error;
 	}
 
-- 
2.31.1


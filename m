Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8453B3F1801
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238984AbhHSLVw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:21:52 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:37253 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238808AbhHSLVo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:44 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3BEFF580BC3;
        Thu, 19 Aug 2021 07:21:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 19 Aug 2021 07:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=9XSNySyo0dgk6
        L24Qtk6hYM/zTivuRW683XZ2ixCBOE=; b=LX19B2YJWu4ndo1pe2uF25KQCiEse
        FjxdgNdu6mMd8UDTHlIZ8VI3mCAT4e3ywJhCCHn/9mH5XHYr+gF2nxYd8lgtfoEC
        //1nRiLX8YfxHcqKHMGXPMkUfCm0X6KxGdMHaN50AoU3q47mvdaMmuIo+8DIGAsK
        ibEgViPYIj5psOlME9qVP9e4pHcc5CFOARhvylspqrk+nnCSNT/JcTnu1rkIPdgS
        vjYUkWfVIQB8z2JN11XBc3wdDaZZ5k0pLFOCBaG4fO9IKjC2oYL7+GFoEE7TV2j4
        XJy6IzIgBUUnEZA04oH0JXLUEIZyxwlXiCxeoiNRwW/SxmwNIxtJNmL/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=9XSNySyo0dgk6L24Qtk6hYM/zTivuRW683XZ2ixCBOE=; b=wuJnqduF
        fkvvlfCgLCRvfloNZrAirxV12ZmH6vZ/lw5bpMfUPRhEga7f0BDxpXkMDpskwn2u
        /Jh26IqB9VRSiV/+i6sf2XBmvOcfD4F16vxRO94TjTmPN6uQBRZSSYjoT7eZ+B01
        qQSjWinzGc/p099pvBwh3PniOAEyJFLTL6Fl8u15O3eTGr158T5jt6/8cjdIGWz3
        6KPYbZIupkht2iphQxcGPDA4Ozq3Bafhaa1G8kEn5U0XwIHWWD9O5ZxDBtqgLJFm
        zDivZcxUeZvtsgz4s1zJppo/0imtmgLRe5+7Xgq8oU7qzotG3SjX7v8VniKAc55C
        vdrDKmJ12/BkxQ==
X-ME-Sender: <xms:oz4eYStm54l0a4Y5Taj0UfLAEJ9aXErHQ64GRkuQ5EiXzIKpyM5sIA>
    <xme:oz4eYXc-615Sm8C2niAyaF2mVFJN9XHe-gFrtLfCjWt4A2zAZ62ljsXePjjCUV_EL
    AWlD_QSJb_1O7RQ_Ro>
X-ME-Received: <xmr:oz4eYdzaXINQyG1UXUOEO1yxGN3YtQYwMOT43AdLwqqsT_FZvrxolAfPZRRBRoWDULSnUHk24880_MwPnpOvQ-euElX9AinN9hYQScgqxbujUUr0Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:oz4eYdND3iq9fcf-PawuS30nfbxQl4Qz5SSOgbaFaiPajUi0ZMTbNg>
    <xmx:oz4eYS83Wq6ZbOLJV3RuStBmNnJl8PQsFt-t6SzvY9w-lkkOxBHfEg>
    <xmx:oz4eYVVVOGz7bagbJ7QBY-naywJLisZ9fDIvVGpmBWImhIS1H95GqA>
    <xmx:pD4eYT3zCCsAia6kFa4ciFVQs3q7G6O7ChFyvL7hbH9wN4un2nS7-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:21:02 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 07/11] Input: wacom_i2c - Add support for vdd regulator
Date:   Thu, 19 Aug 2021 01:49:31 +1000
Message-Id: <20210818154935.1154-8-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for a VDD regulator. This allows the kernel to probe the
Wacom-I2C device on the rM2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 33a3ba110171..fd486b8ef2cc 100644
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
@@ -220,6 +222,16 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	if (!wac_i2c)
 		return -ENOMEM;
 
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
 	features = &wac_i2c->features;
 	error = wacom_query_device(client, features);
 	if (error)
@@ -228,8 +240,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	wac_i2c->client = client;
 
 	input = devm_input_allocate_device(dev);
-	if (!input)
+	if (!input) {
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return -ENOMEM;
+	}
 
 	wac_i2c->input = input;
 
@@ -264,6 +279,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 					  IRQF_ONESHOT, "wacom_i2c", wac_i2c);
 	if (error) {
 		dev_err(dev, "Failed to request IRQ: %d\n", error);
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return error;
 	}
 
@@ -273,6 +290,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	error = input_register_device(wac_i2c->input);
 	if (error) {
 		dev_err(dev, "Failed to register input device: %d\n", error);
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return error;
 	}
 
-- 
2.31.1


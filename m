Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088963FAA5C
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235004AbhH2JVS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:21:18 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:49883 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235037AbhH2JVQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:21:16 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B1BAD580B14;
        Sun, 29 Aug 2021 05:20:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 29 Aug 2021 05:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=j08Pns4+NlfOm
        WdwOrXi5G1T1B1NXvmyECCHk9+fUro=; b=c07KQcnVosDVNiPrwsc+ezXMzW0oy
        fX0nJ3+hOSM1kKJFgQtEdn81R4QuWHKJGCEC436+3Gkm6T+81+SAJ8W71i1OBD0F
        wvyo9G59hgA1lYG8pOJb+3vwVtV3LUrhhZBXAJ3kPaAa8zsrXbiwpxjJWokmGiV8
        E1HnUg/NTzLJpR8HfcnGBadJYM9U6vtLdtplNwvjUvZhsHjM3zCYsK+KZ2slH3Ar
        0JcfHB8jJ1NmX97KzG8PAB7fbhYCc/EDKBwnIQjTzrUaD7tN+BIwx5YR+kJeLp+i
        NufoFtv13rBsGaiQTXKznyUdOpOP+FwN586UNm/BcGU9bM8VGKTS6B09g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=j08Pns4+NlfOmWdwOrXi5G1T1B1NXvmyECCHk9+fUro=; b=q5670IIO
        qyZ9XHNQMYVV4NfMcatRP7NS4SMaMxKJvhQGoJ1x4dZhzcZjWaF8FSX89pOdjDb7
        gs4Y30Q7Tf5iBrWio9YTo4WsgrHH1xnH2BWQLW82zYtG3h7Vrwub75uBz6qBNK1B
        8YOVzmzuea/I7N6rwSIGK9LRsGjCnjzKvUtWU9HKSqpd4o10AwG0F/tt6TtKqn+F
        wmztU1N1vSIDP/bisDO6Do5dTAtmsvqPcdt6TEg1yjqTIvAqfL3qAU5mzH2ZFLNp
        2qhh10Oq/Stl3qHKdX+e3GtOb292eO7Xk8C7AlnrTBzup8dDW0G/6DOwcnoda2WY
        c6zpE+43mJLYtw==
X-ME-Sender: <xms:WFErYXuZx-sEBj4hNIcKSyPOdIkiv7XC4so7sJT2frE6Tz24fiAAfw>
    <xme:WFErYYf3Oieg8yxNmLpqVeyqF4tC1s1Sqi_5b5BqtjLkyPvcofi0cV_FJAK8r6P_y
    039KSP1lFKR5GiDp_0>
X-ME-Received: <xmr:WFErYawGU-ixZ9wCBQGZCUKZTx9MMqiL3pwHcaZofmz6bdOGqpEHKD9k26zjmi1uAh0X5ZYf8f13oof3PfLRZdqUCUPs2bv3sf7gCp110-pr_XjrTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:WFErYWPLyxZwrNlinEjuAkA7txNYUFwe0lKMeXv60LMuagP7zpmZrA>
    <xmx:WFErYX9PCGPs9xUgtatzhMtLw1A-3fDy_i9tD1f90irq6ix-9Pk4Bw>
    <xmx:WFErYWWP8I3VK5PVFS878ONrFF6ITvq3H4OGSnusFJBqwhvlyRyy_Q>
    <xmx:WFErYWVFjQP1VATZSKvJnoVRDt-aaIJtA9ZYJxcnjarbxHm1YR_j_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:20:20 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 08/12] Input: wacom_i2c - Add support for vdd regulator
Date:   Sun, 29 Aug 2021 19:19:21 +1000
Message-Id: <20210829091925.190-10-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
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
index a35d8fda7e7b..13341e76368b 100644
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
@@ -92,6 +93,7 @@ struct wacom_i2c {
 	struct input_dev *input;
 	struct touchscreen_properties props;
 	struct wacom_features features;
+	struct regulator *vdd;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -278,6 +280,16 @@ static int wacom_i2c_probe(struct i2c_client *client,
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
@@ -286,8 +298,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	wac_i2c->client = client;
 
 	input = devm_input_allocate_device(dev);
-	if (!input)
+	if (!input) {
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return -ENOMEM;
+	}
 
 	wac_i2c->input = input;
 
@@ -322,6 +337,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 					  IRQF_ONESHOT, "wacom_i2c", wac_i2c);
 	if (error) {
 		dev_err(dev, "Failed to request IRQ: %d\n", error);
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return error;
 	}
 
@@ -331,6 +348,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	error = input_register_device(wac_i2c->input);
 	if (error) {
 		dev_err(dev, "Failed to register input device: %d\n", error);
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return error;
 	}
 
-- 
2.31.1


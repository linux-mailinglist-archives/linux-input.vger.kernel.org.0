Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571F63BF99B
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhGHMCW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:02:22 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:44565 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231382AbhGHMCW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:02:22 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3A17B58057A;
        Thu,  8 Jul 2021 07:59:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Jul 2021 07:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=gJSZFhKVP4HKE
        Mu49hVwBOwgPgn/uZOPWaLARXY00kE=; b=R7Exi59pvZZ1O/wLtUlwprEPR7Avy
        CfweQdojUBKlebCW5KK/a/V5SaxUEA95Ai9i+BvEgO+4yHaJ26O1ZUBzvV0divV0
        eZj50I1OUVWk7X3HrNexihvhvKVY9h1SvhYu/RiPv0txsoxSeaKJIxBEykqj229G
        UqQ/3RnR//UiyQdGmlouVeG3nkiz5QUgB6++xlgDhej/JBpmmdtDM7FTjSdlMS8K
        xaeh9RvB4JhXeIZc970w/ofKUjnYWlmvvqCmMkmRWKZlE6KSe5HMOanwiwPxaIBe
        vGawiAK/iNHJaTiknljf6bZkcqs05omDvgQIUzAY5qhhdTywLeWq0msyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=gJSZFhKVP4HKEMu49hVwBOwgPgn/uZOPWaLARXY00kE=; b=a4xKCPLT
        /5NqTguWL8CGD8JC2mFjL0q0ZoXwwcfnjU5DkQTk0SfV22qD7Ktt3HlVuKcxzJXD
        xIyNqCv66Jab/yokvzlQZKY3FRMoLxF+gzZnv/FC9/VIDNcTIGT0HMT1HQU+XoYH
        u9hWOF6DxIWecGWj+SwBnDgj8n+gpOobhylosoLY8/UdJY34WJnihZ4IMxYkS7OF
        OZstUGkamUvE9z9IkbttlsKJ3g5u0EdbcqmPqdXJXg8TBoi8jUFsrVKrunsqJH3u
        BCJRMi2V8Uk9v0uu99jt9fARm2FHu5lYVc+JKYVilH0QQ8x2uD7llmExhquZBHeg
        3JXdPSSCwKs1VA==
X-ME-Sender: <xms:rOjmYKz14GeITZuFJ84FscYzqk6-oZ80Q-Yk5eS7u2rcNBWNSmUJaw>
    <xme:rOjmYGQ-B0IKJCe3zGMevPRGCm8sl6RvwtZWHEOnioELEOakPmhD3XypWfvAK-AAc
    zyNfOFAVC4X1NPgkPE>
X-ME-Received: <xmr:rOjmYMXAs9L9UnoIT7Lwv7jTLKTFwQwU2k9fpQSJligBRWrgmqdZTKf7y2Q9w7H3I896R54_5r-JbIwmHE4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:rOjmYAh-OQbUB4uveQjKm0p7Ey-F5mI0m77SToExSB8Oh59dZAEPjA>
    <xmx:rOjmYMCdWameRohmnC2mFLA_nhgYzOiMU0Or4omDLo7p7KKzn8UdQQ>
    <xmx:rOjmYBJHyQzkk1TPjozBfZOx5k-a2RHB1gzsqEYcwefRLwqC7m-RRw>
    <xmx:rOjmYA4gY77ktbDK7XCki3SvWr5DXwjBs1Nb1gNE3P1Yb5Cw3n3Y-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:35 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 7/9] Input: wacom_i2c - Add support for vdd regulator
Date:   Thu,  8 Jul 2021 21:58:51 +1000
Message-Id: <20210708115853.281-8-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708115853.281-1-alistair@alistair23.me>
References: <20210708115853.281-1-alistair@alistair23.me>
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


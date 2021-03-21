Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5413432E2
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhCUOLQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:16 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42859 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229926AbhCUOLM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:12 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 6D4D85C00CB;
        Sun, 21 Mar 2021 10:11:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=32flhDWiUNY2V
        sj5ubaE1JFNCRDha2jAWNSmn4As7OM=; b=UQ9+vL0f0OMKIxa5KeLtca8UogsEt
        Psnoy6ARArYlTXcYAXm0pAVCU3FbsaqHszT95/Uo6h6Li7V4lwhkbhrCDUKvlgDY
        6uAMaO0mx1KlmcGnSPy67XZmF+5OtILdbkVEHhVkN7X0FAI9xDhZ46eFPbQwjDrJ
        2jhx/brmvEK6W+t2Ljdf7Ay6T6YzbU/0PrZOTjo6c+z/Rjsk9ZjHuB8/U0w0bLyO
        d3e/+PSztcnIh3+I0RZi3WSZAM4YD2qAORb2xFOgQnezKe5u2QPq7AAQZaubNxfi
        f5CBZuwX+9D4wAzdn9KKmxGd/t/mUmRW1ES/4qTYKBfCqa6mr7QB+YNRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=32flhDWiUNY2Vsj5ubaE1JFNCRDha2jAWNSmn4As7OM=; b=JGOyTmud
        +NGm30J11LpS9tbe0DFVvbZTX8XpB5lax6aNfHJ8a01KxGKtwI9JUZ4aZQqAVj7M
        ySGMRXJPVUS7RUb6zxPtzlwoJlbUId236WOhQ62hGkPzMm9s47T6WCPxx+Cuk8/y
        h64wLrc1haRTm6rh2Qwm00PCvztXyVpnSZ/Z6A27o2qIcLcpR25GGVW0nQpBm5R8
        zShKK7IFDbG4lqxvA0nAidQW6fwEgUsvGBWcjLozPs7rNdO71DtWWmeVWx7t+H/I
        F86Ghic1kZDRPw6XthGTJabF5FN1TWD4iuvd/zkTmEzSa6NgdMNnghY/lpgQgOA4
        quUh6br5Jxy7Hg==
X-ME-Sender: <xms:_1NXYId6HX7VH8n-X0Ol9d4ojZAsUlKVZWoIZKRHwUJzM6e7bOmwfg>
    <xme:_1NXYKORDH3Rl_YQs55rxtVdqU9COK44To8_DQrGRn1lRLwNq-r2ds5fqcIAFKobV
    HN92EptnWU6mBkZieg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:_1NXYJjM1hyTFRUksPJ0I68syjpY00PdmsJ3H8wg1SJFlr3YqwMAgg>
    <xmx:_1NXYN8YSfRZ_61ABAOg39USOKESYkdnSmH_X_x_Xz68MgI_fQ2-aw>
    <xmx:_1NXYEu1TzvEgxIhqHLYz8i936MvDPubV7J1z-Rc-FBm8dGoVaAYaQ>
    <xmx:_1NXYALcyJ-4uO72rBQneN-W488NdoOtGBDnjPuxFWWFum9xgGxCOg>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 79FD12400CC;
        Sun, 21 Mar 2021 10:11:10 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 7/9] Input: wacom_i2c - Add support for vdd regulator
Date:   Sun, 21 Mar 2021 10:10:47 -0400
Message-Id: <20210321141049.148-8-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321141049.148-1-alistair@alistair23.me>
References: <20210321141049.148-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for a VDD regulator. This allows the kernel to prove the
Wacom-I2C device on the rM2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 7aa0d1c3dbc9..00db516fa3de 100644
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
@@ -56,6 +57,7 @@ struct wacom_i2c {
 	struct i2c_client *client;
 	struct input_dev *input;
 	struct touchscreen_properties props;
+	struct regulator *vdd;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -203,11 +205,29 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	struct wacom_features features = { 0 };
 	int error;
 
+	wac_i2c = kzalloc(sizeof(*wac_i2c), GFP_KERNEL);
+	if (!wac_i2c)
+		return -ENOMEM;
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(&client->dev, "i2c_check_functionality error\n");
 		return -EIO;
 	}
 
+	wac_i2c->vdd = regulator_get(&client->dev, "vdd");
+	if (IS_ERR(wac_i2c->vdd)) {
+		error = PTR_ERR(wac_i2c->vdd);
+		kfree(wac_i2c);
+		return error;
+	}
+
+	error = regulator_enable(wac_i2c->vdd);
+	if (error) {
+		regulator_put(wac_i2c->vdd);
+		kfree(wac_i2c);
+		return error;
+	}
+
 	error = wacom_query_device(client, &features);
 	if (error)
 		return error;
@@ -275,6 +295,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 err_free_irq:
 	free_irq(client->irq, wac_i2c);
 err_free_mem:
+	regulator_disable(wac_i2c->vdd);
+	regulator_put(wac_i2c->vdd);
 	input_free_device(input);
 	kfree(wac_i2c);
 
-- 
2.30.1


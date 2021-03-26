Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6BF349F1E
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 02:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhCZBxO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 21:53:14 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50821 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230248AbhCZBws (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 21:52:48 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id DF2255C007B;
        Thu, 25 Mar 2021 21:52:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 25 Mar 2021 21:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=2qzggsfYr3Vfv
        yJSn0Ype9JxXkJamGloy+yUfPWg5tw=; b=BkcOFCDATxd+Hvjp8Dsl8So6DDoP4
        gL/hfkelE/TXxOr06Ae9HPiNXVo9VR1oWG3Lrrk+0yKcJ3rXnyhyQA6d2pI+Ob3n
        sf4q5pQbofq2asPdRE1Yaot7zYda27XhaczmuOZPsmzZ8y9dKCICeaOu5jSqiFn3
        2QS92bBC2S1dkcjdvNQDQEV/D4+KIihxkhDdEdgCqwKYAIpARzwZQPF6CtugiLGs
        pvULDAbBuh8cpBLx4aUP1XPdtfWdB1bPh8DunbOvUg9Vq25fMWHWEwxI2fwTZt3e
        Mzg1E71OjcPhUXUY4QmGH9mQ/w+/8CtxITt8bm2JQvpf7QuXXiZkbkNpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=2qzggsfYr3VfvyJSn0Ype9JxXkJamGloy+yUfPWg5tw=; b=JIBfih4B
        4JXx+gwg3vxKQ/pz35hybQxtg0FlifXTN3GJ9ehzkxjeNzGU5+P9ighpLbcWDFsF
        Wu9NtB04K82byd4iV4hIOMFWj3dvAq6qZXl5QGVdSKhCN3EfXLcq4TZabWqbUtd4
        TWMGxUTyCq8MB8I3K2whaLlV5vgJsZD9aMY7RDiIGH//56cAt+rT35WLHGRV+jzo
        xGm/HIhz+mqjOunsvX7JRRyPnMY0s/M9stdpFbpsuSnKNTaVG02U7CE5kE8FFAhf
        1053VHi5e+qcnoUQTg4lmfB8baDECP/Iht9kwur6lpyRATMxQezTFFu8PhR1QaHd
        eeFNLQSopBLazw==
X-ME-Sender: <xms:bz5dYPn9Bvl_1g08t5cREoGfqHdLfgm6v04oRhUqp8oW925dSBojzQ>
    <xme:bz5dYC31qadA0K6CDOPAGT3mjxJ_wRKp19hglUjWpzvQQIbCja0RYCXGMcv1r0VdC
    o6TeYEMjMVBDFR1NnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:bz5dYFoqgBj_Q5eNXtshJhq5edj_Luz9uyCseSZI4hILPyDRIgbWew>
    <xmx:bz5dYHlQevCFGqQLu6YQz40ebuOaT6_FUZizl2cCUJaBkCV-ajZYRQ>
    <xmx:bz5dYN29MKKEL2d0PW8MCh1-0_y_JkKnuwi0VeVYb4xhTCLgpjCwrA>
    <xmx:bz5dYGwJ-Z68PtoIeLNiTCIuSKgOtc2MUE4whQR8SsA5LfVO2eo0dQ>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id E7705108005C;
        Thu, 25 Mar 2021 21:52:46 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair22.me>
Subject: [PATCH v4 07/10] Input: wacom_i2c - Add support for reset control
Date:   Thu, 25 Mar 2021 21:52:27 -0400
Message-Id: <20210326015229.141-7-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326015229.141-1-alistair@alistair23.me>
References: <20210326015229.141-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Alistair Francis <alistair@alistair22.me>

Signed-off-by: Alistair Francis <alistair@alistair22.me>
---
v4:
 - Initial commit

 drivers/input/touchscreen/wacom_i2c.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 84c7ccb737bd..28004b1180c9 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -55,6 +55,7 @@ struct wacom_features {
 struct wacom_i2c {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct reset_control *rstc;
 	struct touchscreen_properties props;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
@@ -175,6 +176,8 @@ static int wacom_i2c_open(struct input_dev *dev)
 	struct wacom_i2c *wac_i2c = input_get_drvdata(dev);
 	struct i2c_client *client = wac_i2c->client;
 
+	reset_control_reset(wac_i2c->rstc);
+
 	enable_irq(client->irq);
 
 	return 0;
@@ -193,6 +196,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 {
 	struct wacom_i2c *wac_i2c;
 	struct input_dev *input;
+	struct reset_control *rstc;
 	struct wacom_features features = { 0 };
 	int error;
 
@@ -201,6 +205,12 @@ static int wacom_i2c_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
+	rstc = devm_reset_control_get_optional_exclusive(&client->dev, NULL);
+	if (IS_ERR(rstc)) {
+		dev_err(&client->dev, "Failed to get reset control before init\n");
+		return PTR_ERR(rstc);
+	}
+
 	error = wacom_query_device(client, &features);
 	if (error)
 		return error;
@@ -214,6 +224,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 
 	wac_i2c->client = client;
 	wac_i2c->input = input;
+	wac_i2c->rstc = rstc;
 
 	input->name = "Wacom I2C Digitizer";
 	input->id.bustype = BUS_I2C;
-- 
2.31.0


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC10B2FE379
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 08:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbhAUHI1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 02:08:27 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:40903 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727078AbhAUHAR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 02:00:17 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 023AC5C00EB;
        Thu, 21 Jan 2021 01:56:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 21 Jan 2021 01:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=Uht3iC/SsfC5u
        zyT3GSWG1iiRBlvfC4inAbmhJVb0aA=; b=KsNAtJHRIlTwkDfWoQOUOQ5ZNPc4g
        W3H+MCAZRA5F6iySliLpkHGzWcLzKMMNMZgUAR6vvGPJsbXDVJJPbJoiEBKUktLU
        iribAnAxqDx5U5l2+O2nzs3dx73mvF/hRDi+OLaKAI9ND6xbiVYU8uB3/Yv9kd4D
        xDLa6m0R6/EKKsgpWYv4pPLxdeR+nbwvD9aeHaaqADyobNYKOIQpIU7brM2mkfDE
        mGqt/GKEO4Ua1oH6I0zT+ylQwZqja6e/XYH07piet5jy/XygvOEB2xIu1jf6Vvq5
        h6Jv847hA74NhgtzR61ssPzU5O8SqjAFeHluayGf4dcYimiAaDcmg6c+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=Uht3iC/SsfC5uzyT3GSWG1iiRBlvfC4inAbmhJVb0aA=; b=GESiybsf
        VaUj5cXBQVJnpYIE/YCc7zTQl/FuYC3at7ROFguUAiAbqGG8iIA41cQf7XwZCHuX
        ig/mDpFPEMBlidBSQ+G+cmci3V/a4sy99ne76JbOOzpniv38UBdcM4IM8xYZPhXR
        AMpkAnsfEBI7mW4KO2eGYZlg2xmiZw2CB403lnP7c4sQ6g3Vdwp10BI4czVMfZse
        PclWsj7pZQxmNpMECRPaumpBd9YwgV7H2L+li4Azr6zUPzNUQYEN4gGsVRnqfC9M
        jMy3BIFSc+KmKjcw84uq4hQVw8ItfBO/1nNK1u+Fkcqyk0t/Z8leu1KKR0A2qAk+
        +N8R4Uc8XEaGvA==
X-ME-Sender: <xms:tCUJYDOkK2bPfrLZJHsQFMc_uxnrqdHiKkbDpjpi8D2IPLa0kw7yEQ>
    <xme:tCUJYN_XFJefQ23nZSs2HYnp3TLICDb1UEYF_o26-yYuTL6lmv3Mat-TZsV_kIcVO
    T2mzR4oZCCdiXwBs2U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepjeefrdel
    fedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:tCUJYCScxmhi7hFKBvipKA9V9BXMgaWiRqiEUqtDiEbZlRkZHe-ESw>
    <xmx:tCUJYHs_7HqXzgVNpb7HtnRDkuSFjs6QhU_6zO83bI1nPZn9rcaFOA>
    <xmx:tCUJYLdNRwNphXsdY-jMbGkrygnbvlDylUGu1rCdZdQg-OUrvHmkDg>
    <xmx:tCUJYH4Nj9HSWeyoFyuCaEfOJRoJ0DJ6TbSt_z4-cf6Ce6NWUaDRtw>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0FD7A1080057;
        Thu, 21 Jan 2021 01:56:51 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 5/6] touchscreen/wacom_i2c: Add support for vdd regulator
Date:   Wed, 20 Jan 2021 22:56:42 -0800
Message-Id: <20210121065643.342-6-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121065643.342-1-alistair@alistair23.me>
References: <20210121065643.342-1-alistair@alistair23.me>
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
index a22570adc939..6d85a7bd0502 100644
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
@@ -276,6 +296,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 err_free_irq:
 	free_irq(client->irq, wac_i2c);
 err_free_mem:
+	regulator_disable(wac_i2c->vdd);
+	regulator_put(wac_i2c->vdd);
 	input_free_device(input);
 	kfree(wac_i2c);
 
-- 
2.29.2


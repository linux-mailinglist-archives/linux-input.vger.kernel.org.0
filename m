Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD1A349F1B
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 02:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhCZBxM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 21:53:12 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35431 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230247AbhCZBwo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 21:52:44 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id C86F55C00FF;
        Thu, 25 Mar 2021 21:52:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 25 Mar 2021 21:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=2HPfEt7M1INSJ
        cMo62SZ395Kk+lvdGvgttkGIp4imdE=; b=klwS4GxuaHRgLj5VvlSveY0KrgEu1
        ukKVKhwxOExtJVBnkXeltMJjkq6mAzQzGJXnEF9HpwNl3TLBmQWHlt9s3VikT5lS
        lM/1MC+moOE3b/vo7y9WXwBiv/Wj+FKNqBhsggPgZEkmVFaSKX6el6bUNMSFu7go
        eQLQylxHgjIJNZNcXQej1blHu/7ZrOOhKHDhJcHBZMNU0RWRsRmNRypXsmxi/H7U
        +3xByktnsr67+v0iNulxJqTwev7o9+KRUkkt1KYvvJ1WMDgfg+cOA+bb7ZSJoAmm
        OHYNoIzYWRgxjy7A5UV4PzCAThowKAjwVK3qyxr1jugc/a4ziQYaWu1yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=2HPfEt7M1INSJcMo62SZ395Kk+lvdGvgttkGIp4imdE=; b=h4I3QcPn
        JLRHoUPITQ8RbbI6kDGBmpQqT/gUGRierIVxh5MYo4oTQtQpdMtfSCWhxUODYdS3
        35LII5JEwXZU9yH5n53HCU4m20nc8S1D8a/HNH08JBUg9JxlxpHw1MiENCLjgA4A
        yTRGozX07GKQVy1+7TCfUFLkq4qa09tPL67XeosxBM01U+gHu3OkxwSAFKNCktXH
        RReh5npakvTdnVagTNur1+GYJpoiFhSts9KKnPuUqg90iWi6C2rXKydxnvgwhC05
        e1MSqy2ZT1qKiL0AepttRxX+q/jabF25n5nzLvZAhQWKiP9LkO5ZlaMs24j2r+DA
        4B5lPsiUvRia4Q==
X-ME-Sender: <xms:az5dYLH5pltNOcjkX-8I444PMTeZxJ3pxeHqKeuvycsS-Jik2OszCQ>
    <xme:az5dYIVyj_8MwylsP4uJr0cLGh0FA5aO5PsTd4TrR5iPMpZqEfpV0pBwqvjNYFI0O
    oBkzU3A3FYDX4EwCiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:az5dYNKY85C50fimv3VsqNQsZGoCoTyBNVNtrKdcxY1bVOSF3T6N-Q>
    <xmx:az5dYJEpgNXqAvFTiVixHgbbUGpGEvuVQf62uTZtGST6QCUQPi1xFA>
    <xmx:az5dYBW92VizAewAOFlZh5RrG8wo7cXDY0SH-_FxMnt40HYVBfK76g>
    <xmx:az5dYESH_ZInFk1fvcv2DAXgBdo3nwfuHxBaIMj3hrjNBpfIBeE8gg>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id DE2F81080063;
        Thu, 25 Mar 2021 21:52:42 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 03/10] Input: wacom_i2c - Add device tree support to wacom_i2c
Date:   Thu, 25 Mar 2021 21:52:23 -0400
Message-Id: <20210326015229.141-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326015229.141-1-alistair@alistair23.me>
References: <20210326015229.141-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the wacom-i2c device to be exposed via device tree.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
v4:
 - Avoid unused variable warning by not using of_match_ptr()

 drivers/input/touchscreen/wacom_i2c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 1afc6bde2891..eada68770671 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <asm/unaligned.h>
 
 #define WACOM_CMD_QUERY0	0x04
@@ -262,10 +263,17 @@ static const struct i2c_device_id wacom_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
 
+static const struct of_device_id wacom_i2c_of_match_table[] = {
+	{ .compatible = "wacom,generic" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
+
 static struct i2c_driver wacom_i2c_driver = {
 	.driver	= {
 		.name	= "wacom_i2c",
 		.pm	= &wacom_i2c_pm,
+		.of_match_table = wacom_i2c_of_match_table,
 	},
 
 	.probe		= wacom_i2c_probe,
-- 
2.31.0


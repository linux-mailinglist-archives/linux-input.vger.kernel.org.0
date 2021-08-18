Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FB83F17F3
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238546AbhHSLV0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:21:26 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:33915 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238612AbhHSLVY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 22DEF580C0E;
        Thu, 19 Aug 2021 07:20:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 19 Aug 2021 07:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=PKUtGSy8iZDEY
        lpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=FZjrgi31aOzX0tC6eplSIA2U+IRFj
        1WmbGK0x5ng6hApjS/cZJSanEM7O1hseqJyXEX/fqZAXcmIE/ZEIlzVYUf4DhQ8G
        YPR+OTp5XXMJJMY8TEA9zkAhlBLS/5dgzUGIUREsR9koukUr0dCzQWBAATaz3JjT
        MMqZmRsr7jnIjn1WAiaTTTFdDueJAZBiszLeC9k5H2GVXj1rDdUanIQwLIl61qZp
        wKO4+YB8ER6q/PuFek00ElxotaZpVlpPpWdUo5obQymUbsUXfakMli2yRFppoB79
        vGKVaag+SmqMpivFyu1y1h59uJjkPbxNoFkFgthM4bd2v/6Ma7EctYORg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=PKUtGSy8iZDEYlpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=FmGFZrfQ
        ACGV/GXTGXAhjL5BNsDgDSjBrL8NtK7qbSPRlZG3srDO+/zF0z12nXYhGpXQzh4n
        /+BrorSAxJnW/lfrGJHM+QO4ltIFNdop23tZijRpKS3kHh1zc12qTXSDqZ9pSdHK
        iw5jH0ziYYmNh7QAAXlekUukgfZjG0MetyoBm0lxoxCS2BhAC31xECSeUbAt/o03
        bq80VtU+gIJYEDWKfWfva1NopX2R3GreH5I4+uisIoVug4AO2jGQEDqNP9QVfvGb
        jWXjAtRRM+oekDSWgN8DO5MOIlwKGIuzAj3DzlV6ZiGh/qXohQouMR7Y9mgaF1Lk
        ExYenqvgXm7RNg==
X-ME-Sender: <xms:kD4eYdNtdO47bB4j4PrmkDSYqp7aWCy9dDHWEKno0iP94rS2-6g7Jw>
    <xme:kD4eYf9wuKJoMgIjvFIzPU0qZ-6YCZ7As39c02sdA-nEfIzKNCWre65BMWgFgF0SU
    9m8NmobFlODFoojZHY>
X-ME-Received: <xmr:kD4eYcSOgUIOTsKHUxJngZbsSm89gaf-cSxwr7vD8mkzy4nVeCE55jtBSXSMfcMHelJ-X_NiHhVsOAjwJXbZSwIO9unnxJRVe0KmDxrut1yxifF87A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:kD4eYZtNAZEeibWg0_nB48BocZCyGtUDp_xGhGedjr4-Q3Wz_5b4Uw>
    <xmx:kD4eYVcRbxpAPZyi8uZIihkKkIlc14O9EsNEUhfBuFJFjyajkACYKw>
    <xmx:kD4eYV0o-fksXBcT9PxmupyK4A8b2Fi-tMFPDYIs3yeysj5dGJRNoA>
    <xmx:kD4eYWWnKKAbaAxvjnpxp5Iru9pxDosNDBfllpo2Rz9dwiElNTbG1A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:20:43 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 03/11] Input: wacom_i2c - Add device tree support to wacom_i2c
Date:   Thu, 19 Aug 2021 01:49:27 +1000
Message-Id: <20210818154935.1154-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the wacom-i2c device to be exposed via device tree.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 22826c387da5..6053595f2b30 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <asm/unaligned.h>
 
 #define WACOM_CMD_QUERY0	0x04
@@ -241,10 +242,17 @@ static const struct i2c_device_id wacom_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
 
+static const struct of_device_id wacom_i2c_of_match_table[] = {
+	{ .compatible = "wacom,i2c-30" },
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
2.31.1


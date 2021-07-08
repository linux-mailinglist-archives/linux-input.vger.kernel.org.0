Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF853BF98E
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhGHMCE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:02:04 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:50525 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231829AbhGHMCD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:02:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id AD0B758057A;
        Thu,  8 Jul 2021 07:59:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Jul 2021 07:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=PKUtGSy8iZDEY
        lpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=R4FFqUJK265CwMwmlI3sH0Af0QcF+
        JUGeE6oureqzZmIfPuNQK0AEB5iDZpHuVnXR5F1MMMHZbsL0s4UlvgI7smNe+UBf
        9KQ4n/umYLfpnJqO42XjMObWZ/UKEzArFWsf9fM18eYimvw09QX44/t54a1EiAe+
        rB4eCU+lWp4OUVgbhJed9rt8UyNpAJQXvWVhAjWESZ5emcpiu52L0xlJRebkY3sX
        6ABIJNojECC6PsYJvWjGtixlWEiRdIpqvRSWJjiaLEhCp4xogQLQrzeHkFzxcL6K
        KflkxqI++H+kTKOUBZJxwGqGGRs/NnshAktggNswDw1iJqRonNDBJSRiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=PKUtGSy8iZDEYlpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=SD1P3Rbb
        QcE8zP5Ds1cRJUY0bcbxkPyR0dFg7kxLFj9BEActDKtGwWnjXcUOjCk5M54DiiR7
        u+MG6z+Af0QvZ75HgDdkwkR1XhBCd7IzCw6w+s2m4/1862+QUZ4V66IFdLHiIgjm
        fgCpP9MF9CYbrkJR01jkqKSpMG5UqWaJqTAoXAJ6kGGMPEFsOShVq/9zSR08eF9e
        xzy12qifJhTQvH5ENPv4WUxpHbXPjh4j/eTbUuWACgeFlUJh8n/i4slG3/DytEiv
        z11MD7uTLjFdmzURH85HfEuKgXJeb92Wya7DZT9l9oKJgOgaKmkfkUGXmeDQu35Z
        i8yT/xtLRYW0gg==
X-ME-Sender: <xms:mejmYByqOtoVUBUKdx38XKDF40msZRSSOSF1tCJ1YL2o2cpZiC25Yg>
    <xme:mejmYBSylQGOWA3Eszc8Wenqb7Qq6nIQkOI4BVsi8-VbCbUNybNONxniHUFbt-hkO
    FB0J6dIVvwvCKkX8Eo>
X-ME-Received: <xmr:mejmYLUii6Tpf32aKZfhnH4HaVwl_eadEj6L1A3z9pM3BGWD_oFLFqh5VnNdXtkw50DPbbdWuqTc2YCPJHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:mejmYDjRK0rj6v1Str3kAa4-IJu5nznjEB0ODw0dJTiBGV-WTmakQQ>
    <xmx:mejmYDAphJ5IGp5egul00UQaFlf26miVnf72xfFLMbFcrG1nMb6LSQ>
    <xmx:mejmYMJFbVRZxPbLpJXUIudoIikh75nwUc5KAVMxt5RkkEYsjPgetA>
    <xmx:mejmYH5nB4Jv97lM9X_WajttTc5mckn5ZW4r6pYG2wMLe48xpZz4YA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:17 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 3/9] Input: wacom_i2c - Add device tree support to wacom_i2c
Date:   Thu,  8 Jul 2021 21:58:47 +1000
Message-Id: <20210708115853.281-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708115853.281-1-alistair@alistair23.me>
References: <20210708115853.281-1-alistair@alistair23.me>
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


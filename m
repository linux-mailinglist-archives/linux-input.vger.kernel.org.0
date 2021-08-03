Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0E93DE8CE
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 10:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbhHCIte (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 04:49:34 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:52235 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234622AbhHCItd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Aug 2021 04:49:33 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id E08D65809FE;
        Tue,  3 Aug 2021 04:49:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 03 Aug 2021 04:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=PKUtGSy8iZDEY
        lpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=T0svpK/Hftb2aU/J3aQiwbMPEE36/
        7kfZVWEvFFU3S4vIuMD5Y9WFDMYlpOPYXxG+x1NY0PQS3WtlxFD1ouqtoffI6YYc
        30xpGtRp2YbcGDsCRAiu+mtueYumMO/Wtg+RxYkhlF4pAkq1IGgn3/oLnhXoOILL
        Q66m/3iuUlRC4FkfoLztxNxo9E3aM2LgtVM3DsfW4xYg3XgqfJykpEOe9Ci6TMUG
        eBrCcx1VJTApxaWLjZ+SOlml+p3tuyn5KFLoA0udk65r0uTkTGiY0QDoa/QuhjOD
        6eRLFEcxm+oHwgp45T6Mtv4RsWyhirW9V4+A9hOvtHVetRXpgaRuXsL3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=PKUtGSy8iZDEYlpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=BbSBcnuE
        dyUHrc1CoDFauqrHWqPaMD6G3YoHkSgaMwkXnYHi0Uy/isfCXWqBn1umfEEiuUrC
        D11LrWABJ3UCJQdYyKy6/lsN24oVnh120TOMmkKFRFfphYVoHEL/URGMozwfRmm3
        PgODCtAqLhTextMe/JWzPO9E+MwFtOPXQS2l2iEy9A3TPSKCfpJ59Atky3SB4dsT
        eydqJHGf2hgKIUcgUvX1pGjRwHUUZLjIM3QRFSTggbxr29BYU1tn3/b/BHmTn+53
        yUu3Esf+wMcG4p5HEiZINzucgF2MuoiyLnVIMZLomFg/Z6zb4ftKaZdCHBYAROSy
        Xy+t+0PIdQZXYA==
X-ME-Sender: <xms:EAMJYVidKfr0-8Hl1fgRHT4a1WKohdqpMd1pqAG_ptuiaPPqB9JbnQ>
    <xme:EAMJYaAqK4xkyZ0uKyofnOe-q2G3HFAIeg7QSgf43OR4yDU5est7k8MQ7a_sls36A
    t1-c6xWRX-C5o5qAEM>
X-ME-Received: <xmr:EAMJYVE-jXm49Swk1EGflJsUGXqmflfI2GbKSBY-4DakIyeR1Us0oGhbRb9HPDr-LywC-syktuP4jIH6pfcP6v-66_m6v9CRYP4nOEYIgIFn6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:EAMJYaS6r5x97H35xPmxHy93m4GhhujiIEyVaT0MMvXUWrWRwM6dgw>
    <xmx:EAMJYSyU9Rt-0TXgqaIQc6JHTjr0ExQckjTjlsfDDYjynlqmmqIzUA>
    <xmx:EAMJYQ47JswNYg9p1svBSeVkREGJorB8hfntR-j9fD3BKmrv44cAow>
    <xmx:EAMJYXqJ2TgjxaYpSBZ5Q3ilUq7qPrcnjXwZdjlPgOBEU37FbI7q6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 04:49:16 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v8 3/9] Input: wacom_i2c - Add device tree support to wacom_i2c
Date:   Tue,  3 Aug 2021 18:48:56 +1000
Message-Id: <20210803084902.336-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803084902.336-1-alistair@alistair23.me>
References: <20210803084902.336-1-alistair@alistair23.me>
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


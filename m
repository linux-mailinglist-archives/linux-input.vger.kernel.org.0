Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A4B3FAA4D
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234967AbhH2JUx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:20:53 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:44849 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234922AbhH2JUw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:20:52 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9F98B580B0E;
        Sun, 29 Aug 2021 05:20:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 29 Aug 2021 05:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=PKUtGSy8iZDEY
        lpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=IRdhLvUxixmJyrZ0v5fLEOsjuQ69b
        PkmUUdvKuO45+zYev49jYJKTrk4XahfRkmT5zhELZpExJaQKBHfBpdQjHj5JZpZu
        iyuRo7GooK0xpUmhP4eSQMQMzvA2Y1MyTA5n37E9SYkAiZMsc/2s/B5nwINna4lz
        PA2x7XWb3kFQyxdR6aCqrvZRy/zm+hwPF5wXkcGftFQrPZCVcAZdKZaIN2UX5gyd
        sbou/usqJUAw8o6cv9yg3acTQiEsCeMtxQ6ESfkZh23iRukSuFLfkKIGHSU1+E02
        pHZ3rO1+T8DPFHTIvCDxSw01dneMT1994Fy5ctAcTOum50OsQpg5EDpow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=PKUtGSy8iZDEYlpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=jsskgRqS
        LOqFAceAtEY+Uesj1Xu6D0lQh4cNN9Afv/CyRt3RzgC1SmFxhUef4+7iKRhr2CMR
        PDDit7/hKuqeXD5VbbGO8fw8DXK6sVO84LarcW1TaoptJzfNce9kGjHyidlPt0Ul
        dYHCHooiU8BdS1/Cfx0aMeHAGegCCcWynpIkfbceNeh8vMdw6d3XPWb7nOLDiMDd
        YvZSzC4JPyRHAVdaKylIGCJM7H0wHyjMtS4YV7qHJXOHE5WPkBcx1DCoOtzdOjEd
        qFBhtx6vZUsOPAgOAZr9Mp5BimDcAXxw0uAUKB6Z71CqLQGz83sM28QBd0pWNn3Z
        bIRGPPVhSubdPw==
X-ME-Sender: <xms:QFErYa8vGvi0eJD0azEtsFwzfSWZSEWWTCMjQgGXNf5nEqiBNv9Eug>
    <xme:QFErYaujRynmL4PRTdvPZYLrxwVZY7VNrrb_L82jLrwbvINL-Yt3W9RZyYnVsk2M9
    VeIdMQTpMugTttL3YI>
X-ME-Received: <xmr:QFErYQCqkBPaa3P72pwZJjiJAmyMgGCOIIhfFJg_Sr8gdyMlyo3snYSIi3pEeFPuXkG2Ww0iN1LKPHv7o7HU35LR9F5_xgIRk5ZjgdoqFA14m3nV6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:QFErYSfON0o0yMKVbqffilIsDbBAfEbhAD-9EVqzJqspuCerakpqpQ>
    <xmx:QFErYfOUMdfONuJougV723iLYhJkGjhtzEKT4pOc3KUVadUedw5Zyg>
    <xmx:QFErYclZ2bZMETUXeiF7Sicbbt1p_6x7pG-Lh5l7S5Fwap5kbc02fA>
    <xmx:QFErYclwjW2TXySJ6ga2MN4GylyUghHni4CGsviBPe-mIRHNaM2EQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:19:56 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 03/12] Input: wacom_i2c - Add device tree support to wacom_i2c
Date:   Sun, 29 Aug 2021 19:19:16 +1000
Message-Id: <20210829091925.190-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
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


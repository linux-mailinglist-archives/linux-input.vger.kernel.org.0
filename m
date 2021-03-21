Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F613432DD
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhCUOLP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:15 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48109 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229903AbhCUOLH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:07 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 6CB925C00FF;
        Sun, 21 Mar 2021 10:11:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=0KBDSN+M//14L
        U3MrMHPCIQQOcg9+lHSbWSqHVh3st8=; b=qoNtAcyNRPweYLi5sQmbqpiUK/ZI+
        /HsSd+gJqVkdNHhQWtTCrwi3UGOJ1dNYY+d8ePP/nl3XyfNVgEPw5oWthSP7iSRE
        M1ZA0HRxQ+4JfsvEQBmZZRfBZMVOBLQX2Qn9aYUJ6mVmoudu4W4RESPeUGqWB8FA
        90klhyX8oTiEZw2i4z/khnKufuRc56fxunkmXE1mhEjrFp/pJApIPzhOttRuXJlW
        oTWya98/Khk1QKh4Ox2vgLUDgdaB8f9rTtvtrK8RahdBni/WHaoklE7Jq87zXTyz
        xJ395qTWG0dWCkZabDMaEeJyomOyIpxLR0uvhx4z9kZXA5fUB3GwKgOkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=0KBDSN+M//14LU3MrMHPCIQQOcg9+lHSbWSqHVh3st8=; b=SMsRnAMZ
        VudWXUuidvsyli9GCzV3eHKnRBW1eg3po9fqGdlg2fl/qZq9EiFA7VkxX4ObEuhG
        hzJx9/1ggdwKE8CpFeEBylF5jjQH83Z5/knIOCg6e0t1mcc434Vhc+PI94ZpNlnk
        Ju3lYsK9DsVBzY75CNUpmmbzwUQC1Vez/9uEN9pgJQuhsYOx4n0MuE4HNH1OKKFI
        jgHVAxG4JK43KKxNbqtLkB8d7nNU4KIc/jXZE6pN6YQYejO36VO8qwuthIrgkcQT
        fl8CNoU2HD/rcAQAxZGhFVodOCJ5/BLhPfXPcWIqeLRP8HX9TfPCdEgJWhIeCjsI
        zBoW/mKw9hHuYA==
X-ME-Sender: <xms:-1NXYIAcgtaDOm0M97LuXKJ5HO57LxoJTgxolDJKC0uT0W2XsOiQUA>
    <xme:-1NXYKg-98jvRKgAkyPaEv4f_SqXYVTi9vTkPIbzRmnPpoJqdEoArUsOZcJSS2qtq
    9i5ENXjfcx2oPoYP3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:-1NXYLn10B3OUmTQ8QMy3eB7WjtofI1dv9oSWY5z1pvArW-W8Oy8FA>
    <xmx:-1NXYOxBLKjM-l7QLp_H2pogVn0nhEAhlxAUdWTtsga8qAA2kmH5nA>
    <xmx:-1NXYNTd5QfygDGVrjZ56gqiBWj6Fhh85Ic2TAS_kKyrf6LvN6uSHA>
    <xmx:-1NXYPcJYMVK0a2YfSnz8MzD4wT2HrqEFmzfnkh5JARKUcU8HtLCXw>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7306D2400CC;
        Sun, 21 Mar 2021 10:11:06 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 3/9] Input: wacom_i2c - Add device tree support to wacom_i2c
Date:   Sun, 21 Mar 2021 10:10:43 -0400
Message-Id: <20210321141049.148-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321141049.148-1-alistair@alistair23.me>
References: <20210321141049.148-1-alistair@alistair23.me>
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
index 1afc6bde2891..fc0bf583d33b 100644
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
 
+static const struct of_device_id wacom_i2c_of_match_table[] __maybe_unused = {
+	{ .compatible = "wacom,generic" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
+
 static struct i2c_driver wacom_i2c_driver = {
 	.driver	= {
 		.name	= "wacom_i2c",
 		.pm	= &wacom_i2c_pm,
+		.of_match_table = of_match_ptr(wacom_i2c_of_match_table),
 	},
 
 	.probe		= wacom_i2c_probe,
-- 
2.30.1


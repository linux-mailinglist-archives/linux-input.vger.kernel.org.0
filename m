Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841F3349F24
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 02:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhCZBxO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 21:53:14 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41653 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230339AbhCZBwt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 21:52:49 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id CE8245C00FF;
        Thu, 25 Mar 2021 21:52:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 25 Mar 2021 21:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=oY4vgdU79AGvt
        gp9J4XcY2kWYX1gl+c/IYbXy3b3SyY=; b=YeEHJREH3t4Smp9gzJitoEMWNxMU/
        xxvz5brbasRM5+BLA0/tM/6dlOPn4eW9IPkYAUzGAu7RMibypqn/sSqhm8MmXD8m
        dTbUMdYI1b+oINEHfaKZAURHIjXtSswA0TScl+CA0zHFUtZ+0+rINOr51tgsANHS
        D6Udj3oDX1/e6qp1X3gyDOYak/UT2GD+2zP0N8zNU+7WispnG+komPNbkp5cTMzT
        faeNkl0ayOHkdx2QSYzzTvlmE2QNHlZTDwBaB1W7xtyV2aDbid08h7utlAMxExvu
        GV9jrWk7/bpAMGYFZp8gSCnZUV+5Hrde4/8s/3NGFP8hT6cg8h4tAghpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=oY4vgdU79AGvtgp9J4XcY2kWYX1gl+c/IYbXy3b3SyY=; b=uK/4CtG+
        nfVJiN1tdqsc8/zFo1AYEG3WoMXEdv/2IKzN9O5yA9BQWvpHwt0FGCCRMGBPehib
        QcvnVr93Voro8SQEWpJJIi2X5vdb+JmdZrv0SMhTRWq1aGN3uMV92B2AT1TUia9H
        Gc9UYQDxz6KijA4Jkx1n4IUW7px3K79z9MdHUKQA6MldMresu85ADB1lOpW5LO40
        i6XfGkf9+FlOfP30Ow8H26UChOkR7HPfKH7JNM+bzN5S2I88dMrrCcOvsmL3BpzP
        FVX1c1hAO1HmSyVEjQZhvz24hjeRPnGNx4RGRPtawbITctSYZv+Btt4LAVnPZqR/
        uHQYNDS1xG4/XQ==
X-ME-Sender: <xms:cD5dYPzfWdb1MrQgOYFqp2ef1cR1f3IPehY7pCxCzsGCQWl0msxO8Q>
    <xme:cD5dYHTixk-EpswSze2XVqKr0pgo5hXSho-VLLmAUfX8UnVet4TGX2QYtSJ5zeRGv
    nO8hCvrS7JNUibsfzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:cD5dYJX7cvkquy8_byOWI13_fx0EuFdCC3OcLLA5ka9bM_ug6YvU3g>
    <xmx:cD5dYJhoPOyuh2JrGZgLZXhCo2KV7lHSA2FrGDOG4M-uoLgD1xZtAA>
    <xmx:cD5dYBDdFFTmbIB6lgVV1XtbsCRKstbgVbQEDQ_dod6S-tsYXqA7Zw>
    <xmx:cD5dYAMk1Lzz9sXrsGpfCy9ERs4-swcaBwXNSYDMIo1ntvCyngD-QA>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id E445D108005C;
        Thu, 25 Mar 2021 21:52:47 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 08/10] Input: wacom_i2c - Add support for vdd regulator
Date:   Thu, 25 Mar 2021 21:52:28 -0400
Message-Id: <20210326015229.141-8-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326015229.141-1-alistair@alistair23.me>
References: <20210326015229.141-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for a VDD regulator. This allows the kernel to prove the
Wacom-I2C device on the rM2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
v4:
 - Don't double allocate wac_i2c

 drivers/input/touchscreen/wacom_i2c.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 28004b1180c9..c78195b6b3b1 100644
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
@@ -57,6 +58,7 @@ struct wacom_i2c {
 	struct input_dev *input;
 	struct reset_control *rstc;
 	struct touchscreen_properties props;
+	struct regulator *vdd;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -222,6 +224,20 @@ static int wacom_i2c_probe(struct i2c_client *client,
 		goto err_free_mem;
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
 	wac_i2c->client = client;
 	wac_i2c->input = input;
 	wac_i2c->rstc = rstc;
@@ -281,6 +297,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 err_free_irq:
 	free_irq(client->irq, wac_i2c);
 err_free_mem:
+	regulator_disable(wac_i2c->vdd);
+	regulator_put(wac_i2c->vdd);
 	input_free_device(input);
 	kfree(wac_i2c);
 
-- 
2.31.0


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFDBE427977
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 13:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbhJILjT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 07:39:19 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:38699 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232960AbhJILjS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 07:39:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 50DE63200DA8;
        Sat,  9 Oct 2021 07:37:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 09 Oct 2021 07:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=3mNRLjHegM/+z
        sOwmvU7YPcMf59k7n3IQSmcunFOm/k=; b=2oUdJxfvt4ge/cMZKSPjZ42LwtUsl
        ijUvpLsPwFaih0hmZSt+N0oih+aUMjuYtsG6oCjup+D9+beLyg4tCrrH8GSf+2x4
        h7g8POaDsmr0NBuHtUT2H12wW2Mdb2hjv99bgHhqG8WinR5+IPk3FTjY0OJue3y3
        dw2zsKYK0zxsUDpzqHkj9TTwAGJLPyck6sAk1pTHII+CeNWeus+I2WOnOHgXOoVf
        4NYnd4DdKQBgmUWtQpdmSbXhad7fLy8g5aWEWsAzNTFLOA1Ml2aeJm3piIHEFBHH
        XiEax6djYHgAzWEGNDK4b/kPC1MIDogaHqjtPFRcRtoY0JuKWStfRd7HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=3mNRLjHegM/+zsOwmvU7YPcMf59k7n3IQSmcunFOm/k=; b=lAvxDR+0
        3qGUQv+W5D9bnygahUXFVLlbRVaBUuu508MhZ20EUU4KOQuDlmXLCP+GxS20s+4N
        bxr1OFXmoMPxP76cHmOOjJO3AXPzGAPSE7pHenudP8qi/IgIz9+8XmIL++SqHzD2
        o+qso7GSeSc/IHa6JVzzJZtmYpqlC6/qgHoICJSSL3KqZxrsVAxrsTjykU2irNFZ
        IdE9eNBR6+J2eiDZgrl77Zo1lAscUFFiEpAYwJAJyMVav64kdocSvpAEijrce+BL
        1VrHFS6ykQX1dQbD8Uy7I+Rda4kxukL2xxk4Roi076iRIs159jiTXYUGq8TNmKpO
        Cf4M+MsxvLdNxA==
X-ME-Sender: <xms:8H5hYY9fNESsQZT1fyd0HrdELyXzpSTjAs2ylma4sxjmqnVQ_tW9qA>
    <xme:8H5hYQtG8XnpqMo_enEcqYoZSAacVGVzCvoqT1VYXrV81MOy6ZkuzJQT27mplERXH
    cdvJiP4aoU9gwt9vhU>
X-ME-Received: <xmr:8H5hYeAMLcTplPPUBcZXH0ygNWCZKaHNxG5SJb3CqCGAF8M_qF_FFw9-jvAxLl9P9aZI0Vf0M721JI_-IPN62n1CM_LuZNaqoiI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:8H5hYYcnI2TBOGZJhoKfS5gnGjEvDVp2syKv-RisdEu0vT2FZNiNqA>
    <xmx:8H5hYdPiMvdHeYKO9PZzbP6ZafgWfffOqZky7qO2pKPhCZ_QgdH4DA>
    <xmx:8H5hYSnC3o1QEY0k1kIqp01PxhV4jFjXoCu8x55puJdUNgF_G1lMcQ>
    <xmx:8H5hYerj4xDU1yzTUOwrXfDSEjrnc7aB1kglOa83tMZHJEXzXBaCYQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Oct 2021 07:37:18 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     alistair@alistair23.me, alistair23@gmail.com
Subject: [PATCH 2/2] Input: wacom_i2c - Use macros for the bit masks
Date:   Sat,  9 Oct 2021 21:37:07 +1000
Message-Id: <20211009113707.17568-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211009113707.17568-1-alistair@alistair23.me>
References: <20211009113707.17568-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

To make the code easier to read use macros for the bit masks.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 8d7267ccc661..6865342db659 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -14,6 +14,12 @@
 #include <linux/interrupt.h>
 #include <asm/unaligned.h>
 
+// Bitmasks (for data[3])
+#define WACOM_TIP_SWITCH_bm         (1 << 0)
+#define WACOM_BARREL_SWITCH_bm      (1 << 1)
+#define WACOM_ERASER_bm             (1 << 2)
+#define WACOM_BARREL_SWITCH_2_bm    (1 << 4)
+
 // Registers
 #define WACOM_COMMAND_LSB   0x04
 #define WACOM_COMMAND_MSB   0x00
@@ -110,10 +116,10 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	if (error < 0)
 		goto out;
 
-	tsw = data[3] & 0x01;
-	ers = data[3] & 0x04;
-	f1 = data[3] & 0x02;
-	f2 = data[3] & 0x10;
+	tsw = data[3] & WACOM_TIP_SWITCH_bm;
+	ers = data[3] & WACOM_ERASER_bm;
+	f1 = data[3] & WACOM_BARREL_SWITCH_bm;
+	f2 = data[3] & WACOM_BARREL_SWITCH_2_bm;
 	x = le16_to_cpup((__le16 *)&data[4]);
 	y = le16_to_cpup((__le16 *)&data[6]);
 	pressure = le16_to_cpup((__le16 *)&data[8]);
-- 
2.31.1


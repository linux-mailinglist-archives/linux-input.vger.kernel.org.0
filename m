Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149A73FAA5F
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbhH2JVX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:21:23 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:47013 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235037AbhH2JVW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:21:22 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5B141580B0E;
        Sun, 29 Aug 2021 05:20:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 29 Aug 2021 05:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=2joBurVjnCUY/
        ny4RIIcJNacs95WXqyqBLv4DbH7Oe0=; b=caJvALLIiXKhEr5dDxzXS/Mp4oWwM
        2Qnq3k+FjXKqhLRwgdqcDs82M7qIDl0N1+/RDpPuo7vmltZ04f2UoVsxzhmKoDgT
        5xdm8NQzVhz+1Peq2A5qY0oDAudPb921N+XWT2AhE12AddpbexWQ2ZBCyXN7fbyE
        O0JieUtLcW0FE72NmnD055x1AP5YtQByV0IZcVdqmTcIXdEOpr8nXNs4tthOKtYE
        UTWlEQam6uThGVUPCk6KAVG2xZk6j/nfiUfPQ71McOsUslfI0gTfTJDfsYRYEbMA
        7cpU8ByGEJa2fZCIsvg2pSFpj5aZIHgv6ffzAg5qvBjaIXg1TG2CPKCVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=2joBurVjnCUY/ny4RIIcJNacs95WXqyqBLv4DbH7Oe0=; b=HlAkA/C6
        xqugQbG3ny2rTM2YgrQ52qrshrc/+79WBh3nN3Js0EdrkokIjtBb7TLldbtEkrDm
        P4z79p5LVPf6WNgNgd4RnueIKrBUraZOUBbYlwn8aepifaylSgO72zGm6VUVHXu1
        A2GBpo184KTSOksLX6qks64TGM5fxaXodIiAQngRvqaPQqNfLkm5867RbCjbSY0T
        UfAKzVjkTcm+gBd98BQ+Bg6edWWf0c/Jvk3K9KOSUNSQVr7RLCVoA0AHTFTSN14N
        Oj7ybyTpjlXDU5MnYCJUwJ011X3aUuLnsnVICyGBDN/iAZlUU2CuxsBjjbY8etdK
        6RBPxTUPaeG1fA==
X-ME-Sender: <xms:XVErYcdTkbgNMPauH6AXoj4TJzzixRxoZmLes3tVCZX51cEK1NjL7Q>
    <xme:XVErYeORjzwxr08Ap3IM154E4ESbsfdIwLkHj1WQPNLAE7TTSaEgFrohG879eVIU7
    dnbkjjACgVBSOE-M9Y>
X-ME-Received: <xmr:XVErYdhn1xRZRWf6m5kXSxxUwtPhY-nvEM1T7n7YQ09LQBDBxDkMAEATCQzsThhVmT_0vIDGoxI1-fHVeTFApe8uEQ42WzrCGBprhbzFDae13XOoOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:XVErYR-zBrf6pnhv5wNXYObNaiMgMjodQb9H2fTwbImfR5hWihLkIg>
    <xmx:XVErYYvinzH4apYHr1-6nJk-qzBp0cyXVnBqlAWoIeD4VfAP-Ht-wg>
    <xmx:XVErYYHzpqnLsZq530mnnN1DfrvObWc3nURx-8XwmBQ43qazWGfNLA>
    <xmx:XlErYYHoVFYxHV-2RcC9RnEfBj8xICERRlWbnjEFyxSf9POthgH4vg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:20:25 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 09/12] Input: wacom_i2c - Use macros for the bit masks
Date:   Sun, 29 Aug 2021 19:19:22 +1000
Message-Id: <20210829091925.190-11-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

To make the code easier to read use macros for the bit masks.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 13341e76368b..f78a43212901 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -18,6 +18,14 @@
 #include <linux/of.h>
 #include <asm/unaligned.h>
 
+// Bitmasks (for data[3])
+#define WACOM_TIP_SWITCH_bm         (1 << 0)
+#define WACOM_BARREL_SWITCH_bm      (1 << 1)
+#define WACOM_ERASER_bm             (1 << 2)
+#define WACOM_INVERT_bm             (1 << 3)
+#define WACOM_BARREL_SWITCH_2_bm    (1 << 4)
+#define WACOM_IN_RANGE_bm           (1 << 5)
+
 // Registers
 #define WACOM_DESC_REG	0x01
 #define WACOM_COMMAND_LSB   0x04
@@ -206,10 +214,10 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
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


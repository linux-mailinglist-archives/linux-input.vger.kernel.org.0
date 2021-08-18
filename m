Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FD83F1806
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238912AbhHSLV4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:21:56 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:51437 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238828AbhHSLVs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:48 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 88E28580C0E;
        Thu, 19 Aug 2021 07:21:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 19 Aug 2021 07:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=sudXsL0XPHhcq
        21swpLW5Hc8hH7ACZW0Krc92I1Upyo=; b=epf/JGchTVtEAe4Qi35cQdLR2q1sJ
        /OwIjYoQr97Ajoo8QoQRayVGwzgs7E56r82NEJBoyXFK22FWMgkZI8NrKpjVGeOe
        hjDqJYzpcvxlXzwkxH1ryAP5ixvDBVIoEFFiPzSkkf0deb5gk8MrxXZMwNySY3x+
        v4vR0aMjWVtO1roEZOXcfhHz9UXZ0zSTrfOh3ibho5GLidUl4PJXvY0gzJKabuY8
        EEmOMPKh1Yxcxy36vK+k1ZHVsbMDp9DZ9yr/wyPzehJIYTRwxYivjElICaL1uJ7S
        O1H5a/GdoEYJrMaB/i3SRp1T1jUXaUMBzybmcywHrGFKM2CZuvz5aM3kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=sudXsL0XPHhcq21swpLW5Hc8hH7ACZW0Krc92I1Upyo=; b=DkCLnlal
        l2i5lh6cQc0LMeh3PAn08CtfGR2bwOCMfCK0CAWMkv85V/+JfgD8YIAtQpn0no+H
        ZDOhAnvGmnFiUUO25pstFbuVkXYBYpztlFZ+YgKj6+Rbq/uU4qUtMdPMBXVXycIC
        49AW78uBSrBruNLuVg7ZF1iiXvt0dD7vnCcA00Zydc/JhvKg+x6oMh+Enidj3OSO
        +NOQUy50az5Sdgbn7M044hKbJtJB4g56zCiFx/Xz/tVAS/ZEGuJqw0FPF6shpcWt
        Stgr8c4XhbHAj7SnFzS0Bdu0Ao3JeNVl8Huz8fGr3rxkibaOWcZlQmE2TLWQmBnP
        R3ntL6tVPFcyUA==
X-ME-Sender: <xms:qD4eYaZqqlmomJP2WG2VL_FRy8fWZSBfEEq6Je2AMNXuXbeH32bzpw>
    <xme:qD4eYdaoXtZ3piu3DmzF7j54I1de2xKUv6qUXxWa4mMhRMRshk8JnyeW2G7yGFJn8
    Uhe-RDnauqYLyU5-nk>
X-ME-Received: <xmr:qD4eYU9_poL-jkBtvV0Tj7oYORcp7TZBRwNfi4ayT0qW6kECrx-QxrVYalWOQ-jSCDOhfm-IRDirvtFCO1NPzRho9RhVeX5sDeDw3UOeXVxnGXD8cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:qD4eYcqa_Fo4FmY2KaTbGJXeF8ZhNYhsRk7W2bByxhBUsXDebHzRlA>
    <xmx:qD4eYVooG8tb-HQW8ANIOf9esnud2u4GqNVpMjo8RI3Y_N2Z0ahYeg>
    <xmx:qD4eYaSmr6CfWvK8ZezAsF2huy4nbQ-j2-oZGuC7xmwnLb-6lKbV4Q>
    <xmx:qD4eYSiFZGHoz3nIuBeA-T_4hQhXTbWZ-dAYcg_vW9r3JZrF8C9m7Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:21:08 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 08/11] Input: wacom_i2c - Use macros for the bit masks
Date:   Thu, 19 Aug 2021 01:49:32 +1000
Message-Id: <20210818154935.1154-9-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
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
index fd486b8ef2cc..c6579a1a8d04 100644
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
 #define WACOM_COMMAND_LSB   0x04
 #define WACOM_COMMAND_MSB   0x00
@@ -148,10 +156,10 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
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


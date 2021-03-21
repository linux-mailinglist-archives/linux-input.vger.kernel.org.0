Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9453432DF
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhCUOLO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:14 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43109 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229894AbhCUOLF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:05 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 6B5205C010E;
        Sun, 21 Mar 2021 10:11:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=WXcDtVZ73/eGv
        RVLeoiMWZHr3ueha3vyUKfjsdTInIo=; b=EiowsjA3okfqIkEcIAmPUtVOxhfM3
        Y5fedl4rmZOL9VCCShxdQamwEKL7D0IGO0jOHppQzxIjW8aQaceFSpo9zfLxUcpj
        ZPiD2DbAMvTdwaTofBBsiko6yO5c4CfAc3UFgBIxPMOfe8SxT0LYmRl1lrS7QedJ
        96Ps4T7q/7/YuqSgnhn9Qv0FbnVI4ZTG0PG9h4D+Z+iV/IPypZ0D/ZA+6/xTEThl
        HSCKNu9KQwTS0Wx94iZPSBJMlNJUCj+SXFl44Ge5Xwrx+mKQq6RDjkTqoktUvJ3D
        lAxIJfFZRpTz9Jmuoh6OpljPbQTHnEUbjLIORf2UC9uVnl4+EDaGdupeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=WXcDtVZ73/eGvRVLeoiMWZHr3ueha3vyUKfjsdTInIo=; b=bTYywoon
        ldrOj3nJLw2xIjQN2wYGlqN5XEn1FcJXajcqXecOMqxE0rc2S71uzH1kdiygtIZ1
        YS/bi0Fav1qs7VGd9jS7z0NJABHACnp0Z5TRPZFA8Cnx4AfB1IgXEmvpaekZ8PIo
        nbHoJ1Dq8IawFXwxHJNAsk/Q3TLfTIGGvIDu+m3+njiBZoCmtEDPeLC1KwRitLQT
        Eyp6fh1JA5LP1kxJ7DePYpWhY32P/0lWkNV5RIgR0mhXY+uIENkMym66ldtXdFhU
        JWD0lluuHd023AX0km6U+snaszDbSGnPMFlkLC4/i5fMkWZ72IJn7oS0k+U+5y/R
        dww5X925+ndNJQ==
X-ME-Sender: <xms:-VNXYM_JK4LJJXw1Sz1XnNZzMfERuuhztnLDUk56AOBNOFxuBvKH9w>
    <xme:-VNXYEsDv5gGmKPGXLv7i98prIZ1klnq7BNQdP52hUP_a7lJtzBWXJgalBK2ba6uD
    axua8mgBfbkB5soP7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:-VNXYCAhzrA2OQtxPlqovm-kVH_8dUL3Lu6oh6aB6xlv2Ec5MSuEQQ>
    <xmx:-VNXYMdG6geQ0gKJ732QR_7GFBgrZdj39q8xylr6c1j_rb0ffOe44w>
    <xmx:-VNXYBOxDug967PCs6TmMVJ1kznTYDS02pAKtX_G8oIbPYgSfZHXeg>
    <xmx:-VNXYCodCYaAJ8v3duBwSVS6Ey98770wYtuV89KN1k5p_yxg4ji7kw>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4818A2400CC;
        Sun, 21 Mar 2021 10:11:04 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 1/9] dt-bindings: Add Wacom to vendor bindings
Date:   Sun, 21 Mar 2021 10:10:41 -0400
Message-Id: <20210321141049.148-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321141049.148-1-alistair@alistair23.me>
References: <20210321141049.148-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a8e1e8d2ef20..996f4de2fff5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1216,6 +1216,8 @@ patternProperties:
     description: Vision Optical Technology Co., Ltd.
   "^vxt,.*":
     description: VXT Ltd
+  "^wacom,.*":
+    description: Wacom Co., Ltd
   "^wand,.*":
     description: Wandbord (Technexion)
   "^waveshare,.*":
-- 
2.30.1


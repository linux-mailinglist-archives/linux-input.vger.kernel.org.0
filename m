Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9E23A7BE3
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbhFOKcq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:32:46 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:50749 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231614AbhFOKcp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:32:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4FE07580729;
        Tue, 15 Jun 2021 06:30:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 15 Jun 2021 06:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=sXn/gj5O8k+bN
        hLDMHAC5azai265MJAlnFpI3cP2gy8=; b=M/m/OYzkyZeJ0MNAzta0CPgXWSLLI
        eZ/NrRsDum4NjKNKU5A7u5OrUVuhyFIn6t/8uk29GSF9f3bt7mbvBMT4UBNrlL6h
        Wl1Cdgv0lEnRTvv7/jFfBUaVnDyOUoquBy4CY8Fb5bD9Ve4Pix27qyJsmorIunEG
        x1h6CXafUyk5KUSw+rKZQS3FArFltqE9QhJxgYPI9XvwXd4jKcNzwv5Il8vHGWqC
        GHblqXpss43lonls9f9uGQFMahXsWN0y1L57tenn74D2489Vez73HRMg8u0eGidW
        X1wgugRQpX+ocPrx19bY+b6kNCuB0Md3tWuicYnJvnAJa1mdXqSGFamhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=sXn/gj5O8k+bNhLDMHAC5azai265MJAlnFpI3cP2gy8=; b=efuN/Dy9
        IfawoOtiBxK6V19b09+C/sOLUCTd6J/DUSHfb8tjMZHMaRIKP37MhLv7xRasfyFy
        voD54IapMxOAT/Rm3qslegW+P+WlpfUIxlCeoQvpQOwWJF5K1tn7WV5lT5QLqIfm
        hd56g4VWSivmBdbXgSGwnBTXEyy6LrQmcWsXFTJyGKkWD3f/DxIL3BTFOTIE7ByK
        KF/JXIuuXt7y1mVzT0fZdWaQFFqVhw86YSbwx2U4G825qKjZmSjC/RGRxwC9uES8
        qbQKqmLLPoTqgoyK2zNNSqlwVgyvh8LB7sRKrBKkfD79C/tkxkhyKXHTCHzop+OT
        kbjidC5/ZKARgg==
X-ME-Sender: <xms:UYHIYOfhko7qNt44_Qj5wBf-us9uKvxroqTMA5r6HA3DwGuET58tJA>
    <xme:UYHIYIPVaYZkGskBxiD_IK_Vh3t0t8LbnjaFEXFeEiw-iOgtOimoSMwoYWCN9RHfg
    UPtpDLjwcjKIZjep7s>
X-ME-Received: <xmr:UYHIYPjyB7dINoI_REnWF-YOccuvWn8WoU9vPh4xEJ6kA-HPQ0f-Au2QXTMjbvtfYTZ1vis2QyXD6z8r>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:UYHIYL-vMGSfdfYG5POEib9jsQ0TfUjDBMPAZtF7jndJwmd_htKcIg>
    <xmx:UYHIYKsy-Eh21kfp-CdEhZLL5_v1_VFMIJDu6Fvxo_v89_hBW8LO2g>
    <xmx:UYHIYCHRvY95usJx3j8ccDu8rA6xC6t7tHWyaPRL22ZKgR4lCMl_8Q>
    <xmx:UYHIYICJ-djJ4AMUN1lMLb3RPe2Ez1qqW9ZqHulY8i5Cla3Gm4yBMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:30:37 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 1/9] dt-bindings: Add Wacom to vendor bindings
Date:   Tue, 15 Jun 2021 20:30:06 +1000
Message-Id: <20210615103014.798-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103014.798-1-alistair@alistair23.me>
References: <20210615103014.798-1-alistair@alistair23.me>
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
index b868cefc7c55..abd878ff23d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1236,6 +1236,8 @@ patternProperties:
     description: Vision Optical Technology Co., Ltd.
   "^vxt,.*":
     description: VXT Ltd
+  "^wacom,.*":
+    description: Wacom Co., Ltd
   "^wand,.*":
     description: Wandbord (Technexion)
   "^waveshare,.*":
-- 
2.31.1


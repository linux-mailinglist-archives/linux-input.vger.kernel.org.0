Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28DF6403300
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 05:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347284AbhIHDlh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 23:41:37 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:54681 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344978AbhIHDlb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Sep 2021 23:41:31 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 543D62B002A5;
        Tue,  7 Sep 2021 23:40:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 07 Sep 2021 23:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=VpSD4pDAyZBDu
        HDV17+T6gzsAmNEwWelCiUqUhnNWR0=; b=p4jvzYAIrsMWl7PiPH97D3BPeCDFi
        AqI3H1SUPA08ZlVKhjJrx/qeVGGcrsFUnM80l3ETzBeoUaqPJv285LqWcWo3Rofk
        nbopSMxQmnGoLx20M+l2lEeJc9DesXs4ZOP4Tt9L6SQZj2aaugzX59k8aNo5wNez
        /+NxoCNlZRD4c6aL/fHCLSmCL5JSayfBH//xhqTS9J7MOwXrK5mdvIJbBkwuwBA1
        UC6LVZancAnRQ0uI40g0HwSngnyublcC8Ymg6KY0QHQVcu1Pl0/uisxh5/XxsJbl
        ZScHIA6+UdmpyciRJuh04erKiweMstzvSpm85EffeqMAhGyPE/g4o7NCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=VpSD4pDAyZBDuHDV17+T6gzsAmNEwWelCiUqUhnNWR0=; b=vtssCJV3
        TGV2U7WFjkDXty/Qn6trMasBaa4c5B8Kb4cW973n6D9DmoVenJsRQXgXbgZjDo9c
        Be+sm7xohcXzN9q9sHT2n1biP/VakBQ/4cMslLQkpUNBpChH79hEumGE4uTjWLt4
        qUGf3E68ChDB/2tu71Din0UTtPq2FGDyzaumcn85ut79y1jFNlZmRCB1AlbcxcPK
        Gj+ebbWSpIuA9tQh8j8WvqgOkcKH4b967wIokkX2HRjYGxOYvMMbgFsGBcdoDqlU
        JfSCigXlgX66zm7qBTWZQm/RQSmUnn1O5GQqtgI+X/JXwRdoI7UsVJH1XGFPW0t7
        etUgP5qF5d+FVA==
X-ME-Sender: <xms:pDA4YR3rLWeVwN5b-TEdg_VrxLGsczOQQCfNqVL-yodnKDZdzNuFgw>
    <xme:pDA4YYFFe1x8_WUfaELqQTPsEQxZyuJAmfjMM9axfRVl5iJ4XboU2T3Ih9gz3xMYw
    lt-z0TkCZIzr7pjKA>
X-ME-Received: <xmr:pDA4YR7WOglN4pD6_3kNCLzGhixTOwZ_fliGwrp4XVkKNqokIu4bkxeVE4Cj-lkun144gytQHITDTNjxT18W15cDTMgPE4VyP3SKCbTiHRRC5Gaez_NUDn90Q6QsWnqtKWQCjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:pDA4Ye2K93bH5DCi_bQ4HOCNCY3AKtMSDl8hGA3Qk8MkZHPa6AlXEw>
    <xmx:pDA4YUHZ9uIdJiCt7AnYkqEC6kbLfw0g8bN6pyG6Wvi6SibPx9M_EA>
    <xmx:pDA4Yf-CHZF1yWE1LC7Yfi2rjgN334FPWyIO7NWdr2PREG9JjlBpLA>
    <xmx:pDA4YX9Tpk2ctMb-06RYQv5PI2tz5Mh77sbkAlJjr6YPdhVgYU08vk0O2Wc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Sep 2021 23:40:20 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/3] dt-bindings: input: sun4i-lradc-keys: Add R329 and D1 compatibles
Date:   Tue,  7 Sep 2021 22:40:14 -0500
Message-Id: <20210908034016.24119-2-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908034016.24119-1-samuel@sholland.org>
References: <20210908034016.24119-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The R329 and D1 SoCs each contain an LRADC with a programming interface
compatible to earlier LRADCs. However, the LRADC now has its own clock
gate and reset line, instead of being always active.

To support this, add clock/reset properties to the binding, and require
them for the variant in the new SoCs.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../input/allwinner,sun4i-a10-lradc-keys.yaml | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index cffd02028d02..cfb84b8a1b90 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -18,10 +18,20 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-lradc
           - const: allwinner,sun8i-a83t-r-lradc
+      - const: allwinner,sun50i-r329-lradc
+      - items:
+          - const: allwinner,sun20i-d1-lradc
+          - const: allwinner,sun50i-r329-lradc
 
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
@@ -66,6 +76,18 @@ required:
   - interrupts
   - vref-supply
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - allwinner,sun50i-r329-lradc
+
+then:
+  required:
+    - clocks
+    - resets
+
 additionalProperties: false
 
 examples:
-- 
2.31.1


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB16B2F42CC
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 05:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbhAMEGc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 23:06:32 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:44217 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725984AbhAMEGc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 23:06:32 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 4F62219E4;
        Tue, 12 Jan 2021 23:05:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jan 2021 23:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=8xZa4eWx/5sRP
        OcRJ0U+DRorzREZeUYM6W9yKzDfhJA=; b=nSZutnc2knCRrqObMb91gEV0hS3xW
        MDb+5vj8UJbYZw/hzJ+q1gg/K+A73Ka3gDBW3Wa+LsgT6/fXX/r74sh4d+wquvjg
        +0lyZRFqiEIocvmThdrBQ7b2Zu0Im56B/ZhQZvby4xKBgkuIO3FdehnWlC/hZoRH
        BxkDaOQfr2fX4nuVsKndkryheup3lQaSpT71v6Qkif8grCSpDxNSsWZmTrsTr3mK
        TlwGAD4V1E6tJkvrjmq5xgHX1v2SxzYOlya9c2jmcjirwJ3fLeFt8PYXjWeJcuoP
        OSggpxbIikGQAiSUAvNud4INMwlBeqNwoMnjBteFbJZyrGCEk74xshDkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=8xZa4eWx/5sRPOcRJ0U+DRorzREZeUYM6W9yKzDfhJA=; b=cIWdSwGW
        LrAuy0t8bQdBhGJ/g/ZYTqQTyapBsu6VkmIEvSWKynTMkofovV4JIZl0Ntcb1GbN
        +nWku/rSpx2Y1lJ46WVx/zrxoZpk1VBlHi9J6+TyjzKWtGI7p7pJLsILFy4oKtPc
        wEQOzrgjufB8UXnEYU/tYOJUE4FFJGd0+uMn5WrQin+pdrKyX7XMKa6GxREL5QMK
        S1/fn2AiFdI2rIA0PMmkixchhE3anXYHkxibRMDn6WGZqeE4iMmhBJCsJI8BNRB0
        mDnoG8cplgtldrVv4nzUNNW+yJ9U+T3uU8oCphsL2KqTSA+GK++K9YqPNY++LFk7
        yi+czzU1omWIuQ==
X-ME-Sender: <xms:mHH-Xyj6FIDJG2R_UHzmPjyhmI3Euk26urQooY-yYx9E1GroFR_tUA>
    <xme:mHH-XzCPhPbXmtbJ9wNNbBBXVcgR0I4cmx67RzBnHQA-9H53MXQ6YHIr1awznNYZT
    YdAvykmPno06nSwpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:mHH-X6FvtqbpPJRB1Qaqc2pIeZKSrNWyrg-r0J08hagOVDF7Wi7wrQ>
    <xmx:mHH-X7SZR6_TBixqyvdiVqWpANrBiwBeMmiuY65qCmuwV3Li6uPmOQ>
    <xmx:mHH-X_ztx_vI2Ff-8ncHmic2WgBkFaFQ6aqNiTwlxISn8a_dh6mWWg>
    <xmx:mHH-X2mC1O2AY-7ErNzR0UpUUjnLlMALxjTfvnbdSRE0umTzdR96KFkChJQ>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2642424005E;
        Tue, 12 Jan 2021 23:05:44 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 1/3] dt-bindings: sun4i-a10-lradc-keys: Accept wakeup-source property
Date:   Tue, 12 Jan 2021 22:05:40 -0600
Message-Id: <20210113040542.34247-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113040542.34247-1-samuel@sholland.org>
References: <20210113040542.34247-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The LRADC provides an interrupt that can be used to wake the system.
Signify this by accepting a "wakeup-source" property in the binding.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index cffd02028d02..d74f2002409e 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -29,6 +29,8 @@ properties:
     description:
       Regulator for the LRADC reference voltage
 
+  wakeup-source: true
+
 patternProperties:
   "^button-[0-9]+$":
     type: object
-- 
2.26.2


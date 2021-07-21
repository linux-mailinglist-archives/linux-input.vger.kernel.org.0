Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10B83D109A
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 16:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238962AbhGUNYf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 09:24:35 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34301 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238984AbhGUNYe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 09:24:34 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 182CE58046C;
        Wed, 21 Jul 2021 10:05:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 21 Jul 2021 10:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=26adQT9dCZxNU
        s/Gjs9fuH+COg9+TAHjJyWh+QJ85Qg=; b=gEVRAN8Wig5shuNfNhkZ75L14Lvfq
        G5gnaUe/u+ryEKGDjcLooC77CJqFW37BMOnEuA9uX7jNpFRXGPEK1hWJaBJylb8n
        H+fiOugiqHgoGP/SC5UTVTCK31SX0kZRrNmWyBeRbPGaNv5z+QeINn5ZcVA2i7KW
        NludL6wWnkGC2aYcv+sSVViozf0OXZZ2nAxkofwBGlONkLEYWomsF9mGKgEr8Cr8
        LkaYhZnyUPOjvyzeQ8xK6c6J+gMbN8YN6v/N+/C3rxiMkA+SuO7Ku+aVPWFdD2Nq
        mHb8TJPN2wLRV0F1k6WviI07bR89Gz8PTlzB03x/EJYiux1/U7vwMMkww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=26adQT9dCZxNUs/Gjs9fuH+COg9+TAHjJyWh+QJ85Qg=; b=QFPf1W45
        aiuzRoQoaPajz2ipRtLCIKfeHz66TiJKRD5Ao+egn6MgEFilSt0Y91hH3G8UJ4GD
        8nofLCjIPJNxsZYAmuxiPXW5L0iTQ+beeEY8Kt9VKlKGWMuwFO9opOCkv9ZZvt3L
        GB1rthOa+rscG0rCfrdi77cg377qpGk3ptMyC0tEyLrGnlWVZ7eSM0Oq9rdYOPl/
        Q+jtJIyCv3QxULgBuq1Y22PpmCQ3POXs+eHawqz5uxE+qsPuXV7eswS7aDBfev7P
        w1/nD7FGB7ZxuaODjrhkNPLXz2a9nglHVff/xrI5y6rUacjB05/zhVpniAnoCVp8
        7r7qJeU7JcLVYg==
X-ME-Sender: <xms:lin4YONpaSGhBO327iNIZVVyL1BLOtQq027jxT56pMD1vvBCE1QKAw>
    <xme:lin4YM8jPq6U64UwQudm9mAb9ae_0s26K5Oa8JAIq7FUY_VkI-KN_mlW-UsQfHy60
    oMGpdhg4jEa52P_ci0>
X-ME-Received: <xmr:lin4YFSR1YCAhAulb8NT3Wbwz7yuIdUdKlmYoizZDBRTb1W0lgNx5Nk-CpXl3CU12ZZAuKqCwPvTQrRC9is8hX44xeU3H4kvlMF7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lin4YOvE09Ht1WOtDFsEG8uyP2CLptk8a2e38njscX_IWppWFJAMNQ>
    <xmx:lin4YGe-_SgjYDVHStKH28yUzQerkr07lMMry3QoYSWGfZS9NyY_aw>
    <xmx:lin4YC049cZUyDyFm4HGrcMW5IwrG-_Kgth3Ge9Dd_TbxsC0HSxTVQ>
    <xmx:lyn4YG7232VjOWF5nA69DmXKRA8goEDjeH7Dyw031rOGwV6eDDVyHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:10 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 20/54] dt-bindings: input: sun4i-lradc: Add wakeup-source
Date:   Wed, 21 Jul 2021 16:03:50 +0200
Message-Id: <20210721140424.725744-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The LRADC can be a wakeup source and is listed as such in some DT
already. Let's make sure we allow that property in the binding.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
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
2.31.1


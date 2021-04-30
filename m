Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6389A36F4DC
	for <lists+linux-input@lfdr.de>; Fri, 30 Apr 2021 06:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhD3EVZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Apr 2021 00:21:25 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:34699 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229879AbhD3EVW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Apr 2021 00:21:22 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id D2823580991;
        Fri, 30 Apr 2021 00:20:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 30 Apr 2021 00:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=ixJR37E3oo8sQ
        iV9OOsAEkbJU5R3uGTBiHNDIg4hTj4=; b=OZ3GbLuVHYHFZUp9cSvbFChyafdNS
        Y3Lzc2JXLozfV9ebsvxnh4IRT/9m6EL08qmJYLXSgtDb8ga0SpcX2qsZen7IKA+m
        HBMpU3gpbDDW7m6um+V7xRFvFNk9a2FaI7iiNbFW4NbyShGzqFxdKASBE88hxi7N
        G+5ul8Cewi1k2/i0Fy0y4GBHyH32OZy4rYvgPFYBf9ssHQbAiTE0xJDANh91iArS
        fNmsG6S/7YDowsNsAkgy0k0sPr4FcLmFCk3y6u/6YZm8sgvlypYDDIuRvo/uFYsC
        xMCR6Ak0WFQ3FZNw/UAT7ivNQNfoRNTYNB2yDffG8fHU6hKDpXBBtt/yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=ixJR37E3oo8sQiV9OOsAEkbJU5R3uGTBiHNDIg4hTj4=; b=lnyyeyBK
        fn/EriU24sC/PrnvrMdpo0PSRvJzwg+lGtdiv6pnO3zTfg0PbKYctruR8xCVRvEb
        QvzrvHf6m5f6CqqiRlXUsVcJaBWXGqlOwfRjTLI+7l4xWAH7Z4y818L157QikO6t
        zN3Ax9L4ynozpDMG8V26ofy4DwRqhJSEn2vIAdk3qKmMZU3lHkMdPnMyCMyuqBnq
        bpe0L2eTnQSHbaAfg9deOfFrrD7rIykrjlxepdh8gIubRuEK8L/FK6evAAsiAJ+3
        2QY/Y7/z1XvLv0JLwsenQgawsA2ADjAr8h32YBlbxEih9IOgOLpSws0I3QWu+M8/
        7O67/GE+ralYVQ==
X-ME-Sender: <xms:doWLYMDoakXmkimTWFa2dxp8QZ6Ho2amcxtZgAPY2alH817u3Go35Q>
    <xme:doWLYOi1l_Srz-GN6tdwM8_tSlQoRNzLIf6cOpNTgJNzZa68tdUIX_jUJcLcKKc2W
    qPcRV29573DaD9Tkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:doWLYPk7R0vMPfhpoYAc2R-nE6kVbYj8KEzTeLPohMOnuGvK-i6XKg>
    <xmx:doWLYCyrpYmVMXNx6P3d1C7xNVC7yRkgrdYPrtlPgOfuGeqLiv6HEA>
    <xmx:doWLYBQuJ6SVOhi8JfzXXYGWwLKMXQ5zsbR0y3Fde2c2Kt661BsojQ>
    <xmx:doWLYO_ua2vFhOLIHk45XgZ_VAqAnsRN5-V2fjMKZ6a0p6F2UayKFA>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Fri, 30 Apr 2021 00:20:05 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: sun4i-a10-lradc-keys: Accept wakeup-source property
Date:   Thu, 29 Apr 2021 23:20:02 -0500
Message-Id: <20210430042003.4591-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430042003.4591-1-samuel@sholland.org>
References: <20210430042003.4591-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The LRADC provides an interrupt that can be used to wake the system.
Signify this by accepting a "wakeup-source" property in the binding.

Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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
2.26.3


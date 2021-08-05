Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089BF3E0D94
	for <lists+linux-input@lfdr.de>; Thu,  5 Aug 2021 07:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236947AbhHEFNB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Aug 2021 01:13:01 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:45643 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231500AbhHEFNA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Aug 2021 01:13:00 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 3D2902B00469;
        Thu,  5 Aug 2021 01:12:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 05 Aug 2021 01:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=ixJR37E3oo8sQ
        iV9OOsAEkbJU5R3uGTBiHNDIg4hTj4=; b=f5xPgc/svR7u+AnQJLJioXq5EVJp2
        Bpf3T95ht1J5TS2Ls54wnxwA86uEPGs1As7pj2HKdX4e+xeO/p+RA9LCN/WUD1dV
        CWuWoX2IpfmqNVHPxcTJaokF9ILavIhxXDH4LfZ9jTYYSFsSJtbVr1emb9J/z9Az
        Y9WDfInsGgGel0oVHbcfbiQ+WHD7UpYappxhhfnMDCL1CNQW+K5xsg+PaOJh/bWF
        RQEzTWTvoJ0Uoctt2wcY0YsENQMCqo6CRUbCc+E3JpyCCuTM6y2CAJ9p1P6uBB62
        QxEZpbFnABNQnU8lOHeZE3fh+2xaQOtnhzsbOr6cn3HM82VQ7HaNZb0Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=ixJR37E3oo8sQiV9OOsAEkbJU5R3uGTBiHNDIg4hTj4=; b=kUrkrwLU
        ipD195MpxKq4j10oaNlyFcBPCGwqWI9naZYYUMVf/j5T+dw+uBvq8GEx1xOP5bAJ
        pxOrFPAIHyTCnLZfH6xvi7U731cSDjKsRZ/LSVEhfmPi8lb+y0lyK/i4dvGzUYnU
        gKzyEmyKDNUXu+aTLPONz1TtZ739dEL3P+vvL96Tgxv/D7CaAEnFyrLUsl3mVR/K
        0mWWpICqn25Mcm7yA5SfXl8FqyH/d6jQE/mQ2n6tLHtorRMshLRrJBsFVVTPQhdy
        xA2YPmgxYSZ8H5YH5wPgNyXJlAjN4J+ukau/FerE9VM+5E+ZUcdYOmRA300fDgQL
        7yAnsiWXZcXZ5Q==
X-ME-Sender: <xms:TXMLYVuHpPhtR4aPJ_rBEgstEOdhUslYV0LZiKpe-1zskW3yhSbt9Q>
    <xme:TXMLYed_g6mo9eKz9TbSTp2K7RWXIOyT6js3c863oHKk6A-4edJTK9jjk_8YdmY7A
    3Fv3v_r3cIHKRpT4w>
X-ME-Received: <xmr:TXMLYYxXO4T9l3JCYNk_Tgiobe3ltp_1K982wAiIKNPwcJQKk4OcK5D0gNU0WbBHuMxi0FzQQu5C6k3kR1Q01V_piQPNOf0_FwGn9rYeHxloWW5JbflOjEahiv63f7aaU-hsqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:TXMLYcN63_8SiGxfvu4oJRVDq_F8Zh8X8SXRUOg85iHy8zb1jxfU5w>
    <xmx:TXMLYV87ejw0JpnQ0oRC8g_Vd2_0a3WFiwaao6wQkBkZDkOtCaALxg>
    <xmx:TXMLYcU93S-yWdIOmFqFQQYrzXJ-cNjJz3_4LqdWylSz-JCxwvzCCQ>
    <xmx:TXMLYW1j8mboDJYvvOfW05VTXBiiyaMUX6BYpo9PDTV6ijwDp0PonHlp2bQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 01:12:45 -0400 (EDT)
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
Subject: [PATCH resend v3 1/2] dt-bindings: sun4i-a10-lradc-keys: Accept wakeup-source property
Date:   Thu,  5 Aug 2021 00:12:40 -0500
Message-Id: <20210805051241.47168-2-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805051241.47168-1-samuel@sholland.org>
References: <20210805051241.47168-1-samuel@sholland.org>
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


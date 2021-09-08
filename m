Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73F7403302
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 05:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347478AbhIHDlk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 23:41:40 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44219 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345480AbhIHDld (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Sep 2021 23:41:33 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 655D22B00247;
        Tue,  7 Sep 2021 23:40:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 07 Sep 2021 23:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=z/DhIupFja/3u
        n3TMROM4CDZ3kmgdNlpaaMI2P2BtL0=; b=IJn811RUQPHrjpxPO0QtzjhXwEIjR
        eGx11NcF+U6p/l2EwmRi8ZVBwpA6SUlZ3D21R0YCEbiHtMq46zpcBBt1Rdi/LLda
        xH2hfJsZ+yK5sAH8yTOEU55HeS08S7CvJT2/nlgp0ZY65zIDOpYRowHBFXzPrftO
        ajZQBlxsYp8KCnPiG0FaDXPNey4IPJzZvjQAo6TogrCnavwxjXNr1VF4AKLXYipA
        GD1Zp1zmSOivjSJjSCtVylKAugn8WYlFNOOAHkdSAzoReg1H+Dw3PMRMakqL5YTl
        pOIKwCyfTrSlzJkMecHPkk3CHYdez3sE58LCb9BqvYAixExXRIvR8cyYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=z/DhIupFja/3un3TMROM4CDZ3kmgdNlpaaMI2P2BtL0=; b=ta77mbg4
        9qskT2Y45piWYPeehClZHedklTtHUnUsKnALRLGjX6A2e3r09WxtSI0c8eOjgZ/s
        5HgK5OWBnWBF8MQg7LCD2m05biaGWXIhODdNIELLi3bFkTBRbQyr6ulMCXNZvzh7
        Udoo3gVoImDRRSYje4h0QOOCfx2ZHjEdPQrgPJhuze8NbMIblF/Df+ZJYo/M3gnc
        9rwV2ArcQQSbvXSoQaMwFh5i1fgUeVJmAwJXeHtMwD2ZhDRO7p7zcbvYuvTW4n81
        kUSLK8QXxfWcdP/kSJ4FQpJIWNVB4fnn1gJXZgyL/lSlLmi5iyflBKz/6RStDaVu
        5TxW57Irm+0LMA==
X-ME-Sender: <xms:qDA4YZ-DlUiw-K8a3N8w14a0Ya67KS0nPiXNbPxR_dg-fmKXTrFVnQ>
    <xme:qDA4YdsAdLztVPfqo0-u6xXtgoLtgsGlJF4NM6F4M_k2jpHIxfDXXYTDluyRC6piD
    MHPUvOQziY8f0P7TQ>
X-ME-Received: <xmr:qDA4YXB3bSErW9nSJFbQEYjisraMgdUL3PLaTtPwukttdYiI55f9b8-i5RFdE89GI2XWiMtNeAT-TQP-oPiM4w8S5ONMTVfSh0WOEMq80yvpg0D4g6kk81kX0XxSRa80dQSvgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:qDA4YdfmDRUqzt25xwKadZo7p33q1bL89g-b5WA3f-tLBakrB_jwpg>
    <xmx:qDA4YeM3yPCCCsiGDeHrWwC9Us5Z3Rl9PnerxY6PfqNYs1zO8OKnIg>
    <xmx:qDA4YflZoEepx_4pY3gJCtYAsqPkLX4N6QbWHiJ3rNnw6YlTltGX8w>
    <xmx:qTA4Yfnc1NNiKChg0F56H7JgeKnlEmgamDyJoXiclP4uaY4GGpF-rpzheLo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Sep 2021 23:40:24 -0400 (EDT)
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
Subject: [PATCH 3/3] Input: sun4i-lradc-keys: Add support for R329 and D1
Date:   Tue,  7 Sep 2021 22:40:16 -0500
Message-Id: <20210908034016.24119-4-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908034016.24119-1-samuel@sholland.org>
References: <20210908034016.24119-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This LRADC variant uses the same 3/4*AVCC reference voltage as the A83T
variant. The R329 and D1 LRADCs appear to be identical, so D1 support is
accomplished through having the R329 LRADC as a fallback compatible.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 50fc18052829..06e63c9560f9 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -319,6 +319,8 @@ static const struct of_device_id sun4i_lradc_of_match[] = {
 		.data = &lradc_variant_a10 },
 	{ .compatible = "allwinner,sun8i-a83t-r-lradc",
 		.data = &r_lradc_variant_a83t },
+	{ .compatible = "allwinner,sun50i-r329-lradc",
+		.data = &r_lradc_variant_a83t },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_lradc_of_match);
-- 
2.31.1


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7034032FB
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 05:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236835AbhIHDl2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 23:41:28 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:52395 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234382AbhIHDl1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Sep 2021 23:41:27 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 145672B00247;
        Tue,  7 Sep 2021 23:40:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 07 Sep 2021 23:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=5COa0wVVrtdfa0gTBNofmOof6q
        DfWnoFnqMWJA5jhro=; b=UUzw/24tsi4HOZOj5Jq4a0HIL6Bi1131y+cHyZyjAV
        /4/SkNY9jZjR65mg2faAFJPxlSmGAIelqzK2iObWTmgCu1hIphPG4lZrzSBpJB/A
        qS5tNbcki3CxsPP2Fh8LFOdQkYjaLSU/kUA4z3SuryFjrH+LdHGG3vPaN2+aOA75
        kL83JeOzizFftD9uTItODUNDQZKewWPTD96m+2u0ZDLtXwQQQE7XrePOdAoAom1s
        OxsrS2psO/IvczGkqJ+hggqX+pxZ5B9KLdkSTvzda1myaEj8LXbeZ7bvdV1QQoh2
        Do9LEwn/tc2D2zVVkdRTxRItd/S9UnYNx+dbP3fQLLKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5COa0wVVrtdfa0gTB
        NofmOof6qDfWnoFnqMWJA5jhro=; b=ipBdJ5vDzOY6Ga3yropOJdLFlfKk13Tw6
        NTa68FhJB48w1GIajZzy42na4J6vXSD51nqeB2MENC2y/RpVcomuN34R7rTjQCRD
        LOuWqErdruM2MORQLEIctMuD6H6eMX86r9w5kgYzc+oJJkHA9LRLpFh+ksi+dMap
        RZptotS0wPwxfXhmWRueemjJ2HSPb25PSHYAcOAIpcWANGwGbDDFmQzHuu8CZsDo
        rcRXuBItIXt5pMXo94eIue44ocqiAsFHQ/WBACRGvQIqu1EAC3wGxbjdlhnnBD+s
        kSAMp5IH+91SUmj//t4UTnd1EZNMouaiEk/dSVsIpwlOz7h+O2Irg==
X-ME-Sender: <xms:oTA4YYOfcy30WCQG_Y9IcGcy5bRcPoNYgof7Xt2fUNDE5Tsla3-yCQ>
    <xme:oTA4Ye-4RCpFyt5W_sfwGH-bGmwDzHjWHhGWPvkjpsdP2_gpEidwu64_Y7G-8oWz9
    030hGIWg4tI1Ni_jQ>
X-ME-Received: <xmr:oTA4YfTPHXOkyPhlloxxmxZ9-tM-VyTMlGSdhrnP66sJ-QU7UStLdPjqnGqE4jWMH1bZ0u7p1Yyt39d7VU1FKob3T9bWphbba9FFeg5Hf0kF4IVOSto9nCi_5O6CnF8z_r6mPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekkeffffetgfegfeeffeevgffhleehjefglefhveelkeeggeekgfevgeff
    hfeiueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:oTA4YQsvWl4MF_Ek8G_1exb0YvsEz-FZM3BufQ6VaL7CsVCwrYW42w>
    <xmx:oTA4YQeuEVfjPKEUt0lGFTxsMMB1FkNPMI9QXBh1SR12xDNmO9fAlQ>
    <xmx:oTA4YU3_O_Ys9SQScp5jgBMO6V06xvqWz1W8pNIN63BouSNpkmqKPw>
    <xmx:ojA4YU1_tMonsNiPpplJbNK64EhwVvFxx27KIAFWr1Nc2xLSZxRwGl5UV6M>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Sep 2021 23:40:17 -0400 (EDT)
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
Subject: [PATCH 0/3] Input: sun4i-lradc-keys: R329 and D1 support
Date:   Tue,  7 Sep 2021 22:40:13 -0500
Message-Id: <20210908034016.24119-1-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series adds R329 and D1 SoC support to the LRADC driver. These SoCs
do not change the register interface, only the platform integration.

I have another series[1] which adds wakeup support to this driver.
It has been reviewed/acked and is waiting to be merged for several
months[2]. That series merges cleanly with this one.

[1]: https://patchwork.kernel.org/project/linux-input/cover/20210805051241.47168-1-samuel@sholland.org/
[2]: https://patchwork.kernel.org/project/linux-input/cover/20210430042003.4591-1-samuel@sholland.org/

Samuel Holland (3):
  dt-bindings: input: sun4i-lradc-keys: Add R329 and D1 compatibles
  Input: sun4i-lradc-keys: Add optional clock/reset support
  Input: sun4i-lradc-keys: Add support for R329 and D1

 .../input/allwinner,sun4i-a10-lradc-keys.yaml | 22 +++++++++++++
 drivers/input/keyboard/sun4i-lradc-keys.c     | 31 +++++++++++++++++++
 2 files changed, 53 insertions(+)

-- 
2.31.1


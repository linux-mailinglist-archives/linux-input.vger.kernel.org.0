Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3200E439508
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 13:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbhJYLop (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 07:44:45 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46649 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233116AbhJYLop (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 07:44:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 856055804A8;
        Mon, 25 Oct 2021 07:42:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 25 Oct 2021 07:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm2; bh=mFmfwKE6NJwjJuKPURxDtcwRnD
        8ffKIphewM6DnRXhQ=; b=lwgJ0jaDrCSyhplEtJbMrW+0v+CecDvNr4cs4j8u/b
        V9TVp7FMLa3aFedS5wi5MVDSRF+MTqv5wlkVwNIw39iCustWMlC2pVH3SvtS/PWe
        kSkTDUK69QiRSADnh5k2zhbi+SPXozX5AaaIHtXEEZmuSPIm5VQX+JyZo9m3fkR/
        K1dDd+Ep7Jx/qXvfJ2zqxmAqcZB3NFQ0rRtoIG24dm8BtZPhphAJ/s/U0mhSqN5X
        wEc3qSJfXlvgrmHrOykC0lgbvstvyMBCJ3xlUxsN1cXTiDaTdPrJljn6ctVJsen3
        ZXZdaq9KS5p1nPBWo1Ps/PAtSs1JSh3lWYEsU7Reqc2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mFmfwK
        E6NJwjJuKPURxDtcwRnD8ffKIphewM6DnRXhQ=; b=WCHzm2JJVY39uMYAzGNmpX
        pfPI/IPpmMubCpZMTPLXPzwz1ThAWeYBR4FzN1NBmoddCplFpxs+/ntkZG3pQbG4
        ImQFksbRuhKC+LtZbBBycoCoyPhwL39nc334afKjQ13f3rxuMIHz98gRjTOoDtta
        V5jOiwF7gRf3A5+UAcfVwQaDe9XXldesfyLcEnIWWv/B+T4g2SDCA8PD6nn5WQig
        u4ipW6y//eB0u6osltu+i9hIATAzs+D82oVnVDG6N8w8HoCo8/cvmnQOQXxweEi+
        KgjMiypZPwmV0GbYAqeqaMSp2Y87VtssR/0maobpcHvxvrFa9AZeAlPq5yl1OjqA
        ==
X-ME-Sender: <xms:HZh2YQQzrHkVS4HhpDi4nQTAPyseyaYsX8zB0_FLY6Pt9B5PykAhdg>
    <xme:HZh2YdxszUsyI9wjHo_pBSmq2nXLrj0UZN8VXunpLWMdSNCb1PIT43BAdp7xpxiJs
    uyd3jsbeNN5RbUboaQ>
X-ME-Received: <xmr:HZh2Yd1ZdfDGYwdIKcBRgPe_7PnBSdTvkRTvquxX5XvlgUFxXXUjaZZhZ1xT_EpE86zJ4aw07FsL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofggtgfgsehtqhertd
    ertdejnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepffelvdegveefve
    efvddvffeiteefgfejveegieethfekgefhleeukefhjeehfffgnecuffhomhgrihhnpehl
    fihnrdhnvghtpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhm
    vg
X-ME-Proxy: <xmx:HZh2YUA9U5O4NXgkRqclJ685Yg_oxVxk-V-JFLbn3S7A94QH7ToWbA>
    <xmx:HZh2YZhYvLa7Ka2TlY9XVOeJoQyOxghCCkJiGUugPGJRP9wuRZtw_Q>
    <xmx:HZh2YQrl0AL04Uaw0lyK2Z6Eb-t_lcIEOjYYXJPI4wmv4HdILNTxUQ>
    <xmx:Hph2YeZAypMROMWPXHnBLaROJGcNkJVcP6Z1j4yGleTeLGDddya_UQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 07:42:16 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andreas@kemnade.info, alistair23@gmail.com,
        dmitry.torokhov@gmail.com, linus.walleij@linaro.org,
        robh+dt@kernel.org, rydberg@bitmath.org,
        mylene.josserand@free-electrons.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 0/4] Add support for the Cypress cyttsp5
Date:   Mon, 25 Oct 2021 21:42:10 +1000
Message-Id: <20211025114214.44617-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series builds on top of [1] and adds support for the cyttsp5=0D
touchscreen controller for the reMarkable 2.=0D
=0D
I first tried to add an I2C HID device. Although the cyttsp5 has some HID=0D
looking aspects it is not HID compatible. Just in trying to probe the devic=
e=0D
I found:=0D
 - The HID descriptor has extra padding=0D
 - The HID descriptor sets the high bytes of the descriptor length=0D
 - The HID descriptor has extra unrecognised tags=0D
 - The HID reset command doesn't appear to work=0D
=0D
I don't think there is a way to use the I2C HID framework with the cyttsp5.=
=0D
For anyone interested you can see the work here [2]. In that branch though =
I=0D
can only obtain a HID descriptor, nothing else works without more core=0D
changes.=0D
=0D
So instead I rebased the series from [1]. Converted to the new yaml DTS=0D
documentation, added regulator support and fixed a x/y miscalculation bug.=
=0D
=0D
1: https://lwn.net/ml/linux-kernel/20180703094309.18514-1-mylene.josserand@=
bootlin.com/=0D
2: https://github.com/alistair23/linux/commits/rM2-mainline-cyttsp5-hid=0D
=0D
Alistair Francis (2):=0D
  ARM: imx_v6_v7_defconfig: Enable the cyttsp5 touchscreen=0D
  ARM: dts: imx7d: remarkable2: Enable the cyttsp5=0D
=0D
Myl=C3=A8ne Josserand (2):=0D
  Input: Add driver for Cypress Generation 5 touchscreen=0D
  Documentation: DT: bindings: input: Add documentation for cyttsp5=0D
=0D
 .../input/touchscreen/cypress,cyttsp5.yaml    |   72 ++=0D
 arch/arm/boot/dts/imx7d-remarkable2.dts       |   88 ++=0D
 arch/arm/configs/imx_v6_v7_defconfig          |    1 +=0D
 drivers/input/touchscreen/Kconfig             |   14 +=0D
 drivers/input/touchscreen/Makefile            |    1 +=0D
 drivers/input/touchscreen/cyttsp5.c           | 1129 +++++++++++++++++=0D
 6 files changed, 1305 insertions(+)=0D
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cyp=
ress,cyttsp5.yaml=0D
 create mode 100644 drivers/input/touchscreen/cyttsp5.c=0D
=0D
-- =0D
2.31.1=0D
=0D

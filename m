Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021063E0D90
	for <lists+linux-input@lfdr.de>; Thu,  5 Aug 2021 07:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235058AbhHEFM7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Aug 2021 01:12:59 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:40675 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231500AbhHEFM6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Aug 2021 01:12:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 2EBA82B00468;
        Thu,  5 Aug 2021 01:12:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 05 Aug 2021 01:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=ylzuFqQalkG2vG2ySza3AsSddL
        2cK1QcJ+AnzriT8Ts=; b=FoxpSthifZIOSLQL24bF38ob04szUYrkDto3VLxEkJ
        Ntzx0Nw4kSTTTCOq7OO7lmrxp7GPG/AcczyeUnZE6i/nwldicKvLD9p+19RoD40y
        jeqVLhsFblqEAPk6Ysbh071FnctrqxmvuoLg71gXpy4dH1MvYDNuX+bA45SGUwJ4
        YE5cq9V9d1ZfkA8PaSM54iXaw5NwiBAstL/WgUfaISchZQZC0zG6rSpdq3JFqiVR
        /C8cAC8dEiCiVquPgUvloFb9B6noJ+FpUEAcOR0wZkclu0Z5etvlb81SmmFJH2HW
        pMfmHTTv4MY3tEpQrdxfN9MG52mrD9fcNMhOz7usJ5aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ylzuFqQalkG2vG2yS
        za3AsSddL2cK1QcJ+AnzriT8Ts=; b=BnyrL/l9BJU3S2otfiEOurEWr1yrjSE8P
        IduCla8GPr3AhElIrCMDWXQc5GTa31cecDSEKFkcu4mj8tKtNh4jHYq2oJ3PIsCi
        a+wKCncjQLkdQyUOmbjN9fj2o3kQHjJC/swWlolLsfFpT2BLGjb8Wm3lv++Niibn
        Q5fwncvd1jyqmc6u6D4Lq7t0Wp9bZqiPeSN/JcVfN+0UwmEYrdWFp5RDazFCSXkT
        NHZ0/6SrAUQAMOfpuAAPfnioYWlaJ+AGX74iUsxandIqmMx8cb1/BucP+qw1Jdg2
        98KPSgovsYdWb6zCZQkwEY9FKAySnSIAKZpeEnreQ9uHKxrFHqLsQ==
X-ME-Sender: <xms:S3MLYbSK95NhybXaTgihvq7wWwms57zmBVBAwZuSdam74VaATIKZAA>
    <xme:S3MLYczi6aSxvaJSF5UyytAUo573G2dljIsaW-cWlZJnguxqWQa-6h7Vnr05BQGYR
    bzjQgo4ZTv8o3O0Lg>
X-ME-Received: <xmr:S3MLYQ0xyUzytp8CQAoOpM9666ZXqZda_FGGUPR8-Q3hB7O3oxCobHEji6z0OHwmILcV14GTjgx01ttq1g83AE7rpBOC6zitTwACw4p9rhhCOA2R_9sVR8LiK5P6Wblo0PNX3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:S3MLYbD8mjaYmBy0E68oMP7Jxdu5bofDsQgYPBcj71Z2rLNEAcNXAg>
    <xmx:S3MLYUh7h00jPNGGWLN0XC1oix8uDeJFhnR7PeqWkmQRgRJQPawKYg>
    <xmx:S3MLYfrJuFIQ4JQZLgZ1pMxZE0OxBdxlbj1v0ukgOjc03txJvKzvfg>
    <xmx:S3MLYXOpKLDlAZ-qc8ECsa1zwoULZty3-5Se2H_2A6yikq9cwMOD9Tbt67g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 01:12:42 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH resend v3 0/2] sunxi LRADC/volume key wakeup support
Date:   Thu,  5 Aug 2021 00:12:39 -0500
Message-Id: <20210805051241.47168-1-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series allows the volume keys on the PinePhone (and other devices
with LRADC buttons) to wake up the device from sleep.

Currently `make dtbs_check` complains because the DT update was merged
without the binding.

Changes since v2:
  - Dropped unnecessary pr_err in platform_get_irq() error path
  - Dropped patch 3 (DT update) as it was merged
  - Added Acked-by/Reviewed-by tags

Changes since v1:
  - Add requisite DT binding change
  - Only add wakeup capability if "wakeup-source" is present
  - Warn but do not error out if setting the wake IRQ fails
  - Add "wakeup-source" property to PinePhone device tree

Ondrej Jirman (1):
  input: sun4i-lradc-keys - Add wakup support

Samuel Holland (1):
  dt-bindings: sun4i-a10-lradc-keys: Accept wakeup-source property

 .../input/allwinner,sun4i-a10-lradc-keys.yaml |  2 ++
 drivers/input/keyboard/sun4i-lradc-keys.c     | 20 +++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.26.3


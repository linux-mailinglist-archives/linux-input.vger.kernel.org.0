Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35EE836F4D7
	for <lists+linux-input@lfdr.de>; Fri, 30 Apr 2021 06:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhD3EVX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Apr 2021 00:21:23 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:43689 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229831AbhD3EVW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Apr 2021 00:21:22 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id C488A58098D;
        Fri, 30 Apr 2021 00:20:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 30 Apr 2021 00:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=2RsfJX3qRNd+TubqaEaS4NIHrv
        LwBjSMn2o26kiiNuA=; b=XE5yVhGcAT8L9kh+C/VeZo/f3yYl16FoHtoHYfgwm4
        Vm6GdmljNvvbp+hXcYIxmyEsijzN3e7xoWpmS90Ki3xgJzQyd/6HUiDom8hiDlnG
        JVmsv3a3NqiY4YS31QkAUfghs4mvv/FkM7VbyDEhLrU0SjmHHNPttPq8XiCj14es
        FugGfDRvkb8E5k11CnA2a60g2KyM6A3tEZB84X3EDRnzGzZNBfydUXs70INT4cTJ
        yWR334bLdpfGktc6LYloX++r+2Tza/lFRrWI9Y4D8Yn5RlSXloT/qmvRmvcelEJ6
        gS+7JuKgg2pDp7+OFExcN/rfYSKIrxK9tQAtmEdP5+Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2RsfJX3qRNd+Tubqa
        EaS4NIHrvLwBjSMn2o26kiiNuA=; b=QSQ+q1SBGrvTh2crttF0IZF0ECv9DpuHB
        RDLEN9ztQpl0Fwj4z/RI5LNRWis9C/qxuOt5Oo/UcyHMBzWjZO3nKO/SGkINyi2j
        CN8rkQ/fj4iLzHm9Qr/PTKVrRFn8IenGH/eCUHpu1zxM93IZ/5ZkfujHP+ia6vA4
        Ixbp7/As4Gug4DzIZ4RH3BiY0JpZ7mfLBHGsKO/UuhtPHrvBK87x0vZ1dp7tYDF0
        KGT0psg2NBJNKD/6XbJ2lPNFlM/8G6bwZ2m/LinrVsRYFjHOKE/ilLSzliGTIMka
        CG1ruYNWMCCj+sp0lYtatS1hE6/2U7VFbp5+aQv9C1Rzz21iY7zzA==
X-ME-Sender: <xms:dIWLYHbnJTFS3ArLfX59oa3IFNrQ9VnHlNWxbbLywbsp3qtIvvFP0Q>
    <xme:dIWLYGat1feZ0cuK4hB4yzVdBUoXqOP_wLk-yoQJOygcQA-80USqTbQHqc9rUZZX9
    YQXVhoJis6luyYOmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
    vedtveenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:dIWLYJ_QLMX4_EvCcpt3SCP_2NBliJxTm6hIAdPsmjuEdA9FJIWIfA>
    <xmx:dIWLYNoZ-7Cdq1dZq1KpkiVP2cdo14zhDht1XwCA7TVBexDDhujybQ>
    <xmx:dIWLYCqiXxHQMTCAmE0ylj0_0y7LE5xtfhEmWLepVSAh4KjQo6EvOA>
    <xmx:dYWLYOcevcl8bDRtZse8QpFEYp9Qta8KAa-z75AMvqWIR8dP6foHew>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Fri, 30 Apr 2021 00:20:04 -0400 (EDT)
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
Subject: [PATCH v3 0/2] sunxi LRADC/volume key wakeup support
Date:   Thu, 29 Apr 2021 23:20:01 -0500
Message-Id: <20210430042003.4591-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series allows the volume keys on the PinePhone (and other devices
with LRADC buttons) to wake up the device.

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
  input: sun4i-lradc-keys -  Add wakup support

Samuel Holland (1):
  dt-bindings: sun4i-a10-lradc-keys: Accept wakeup-source property

 .../input/allwinner,sun4i-a10-lradc-keys.yaml |  2 ++
 drivers/input/keyboard/sun4i-lradc-keys.c     | 20 +++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.26.3


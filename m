Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA272F42CE
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 05:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbhAMEGw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 23:06:52 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:37359 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726680AbhAMEGw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 23:06:52 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 57F9F19E8;
        Tue, 12 Jan 2021 23:05:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jan 2021 23:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=BhWOvfo7H2XzrPkb8Fylthz2bV
        LD4XJzNdlGE7vWgs0=; b=cqoj8wbbjV5OoHLqszrKBq1FsZnIjbnh0lVkJXP2tN
        E2tDBBQw7jQiHCpwTOQv4wtxCpRCuCjgy7CVXQU2H9ID2YwGMuHHaJkq5RqvEzLM
        +37mlKZVjVskjtSghhkoFlHmyKLDpgfKETkmtbl2lOh4++Ax5Xw+humiwY4FgBQE
        pieQ3VLrcsg4FQDgq3yzER2928biEizMoWMUwy+rW3wp/4AtEPCzVeLaLGBt6eca
        L+GFa/ALAbCjTeY9YZmU+JVtO+xA6MtarNUuZlG/TEhF3jnZ07K8na9hpYKf5onf
        2ERURvS760mMkV3m9VUCXNbbrTwP/oX3CaQRAwwk3/vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BhWOvfo7H2XzrPkb8
        Fylthz2bVLD4XJzNdlGE7vWgs0=; b=elhoO/JEQUR+wyY8m2zcDlTqb6ON7qIhP
        93pd1/FbsJUE++6mnxruegYILjCy9bLAWMahHT2gFYiz8C3FAijdynFm5LAe7mht
        gt2bLevdIhwUb+wn2dREcWtQfuTXMndNMpTAjo8BWhZGyIaaoOljSClFB1PxG/us
        F/Hx6dJtrQwhuqIXJkxhkqkuP+QQLeKYD5A3lc7uPKBVNcYfj5MrGdx7QABfWxWu
        wgK+/feLFe2YUtXSWHMVDQ9pAeHR8Pxqusxu+ZFz5hzItPxb2nSM0zhk3LeFG4On
        yDAOdPRKLM84gRRkSS9xWTUBffUjHM13XHw3bAw3HMR5NYFOCmsPQ==
X-ME-Sender: <xms:mHH-X3QVUH8t7Pnmliw6cgkko7-mn33soSsbV0MQ5Fm5rSFKVZcz2Q>
    <xme:mHH-X4x2Rc_311wJd9U5LSuGL7Km9WtFlRQWv-V-qXEpQaH-2n7T55g9BXg6LQPpz
    YRSHsgmJr7X7qh6Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdho
    rhhg
X-ME-Proxy: <xmx:mHH-X82ZhVERbJuoRmH21ynduH2ZEMgRbwk_n44Wfx_J_-3WfLuQHg>
    <xmx:mHH-X3AW8JEnqNgURohRkFJ42EhOp9s1ira16BLBNdHwpL57auixdA>
    <xmx:mHH-Xwjy5eKlhyBkj3Sm7Fziytl45GlnC_iaMJX8AIfxfisWpfxKww>
    <xmx:mHH-X5WPsoZ4YLt3y8-RyJpVB3Gg6I-6UatUVTXW5IHZcXe_tu9V6fbmchc>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id A6B13240057;
        Tue, 12 Jan 2021 23:05:43 -0500 (EST)
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
Subject: [PATCH v2 0/3] PinePhone volume key (LRADC) wakeup support
Date:   Tue, 12 Jan 2021 22:05:39 -0600
Message-Id: <20210113040542.34247-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series allows the volume keys on the PinePhone to wake up the
device. As pointed out for v1, wakeup should only be enabled when a
"wakeup-source" property is present, so v2 requires DT and binding
changes in addition to the driver change.

Changes since v1:
  - Add requisite DT binding change
  - Only add wakeup capability if "wakeup-source" is present
  - Warn but do not error out if setting the wake IRQ fails
  - Add "wakeup-source" property to PinePhone device tree

Ondrej Jirman (1):
  input: sun4i-lradc-keys -  Add wakup support

Samuel Holland (2):
  dt-bindings: sun4i-a10-lradc-keys: Accept wakeup-source property
  arm64: dts: allwinner: pinephone: Support volume key wakeup

 .../input/allwinner,sun4i-a10-lradc-keys.yaml |  2 ++
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   |  1 +
 drivers/input/keyboard/sun4i-lradc-keys.c     | 22 +++++++++++++++----
 3 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.26.2


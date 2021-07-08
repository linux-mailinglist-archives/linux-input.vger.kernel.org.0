Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855753BF9A1
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhGHMC2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:02:28 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:33113 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231915AbhGHMC1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:02:27 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6D07758057A;
        Thu,  8 Jul 2021 07:59:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 08 Jul 2021 07:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=ATQZFgAJhWZiG
        ySupWX/oJS6Wb8DhGdjsY6S4Ar60bs=; b=OG2Qyw+jXV0gHaz+tRS/bxu7zqzey
        m/kfVD+1ooNhcTP66KEy+Fsv+zXFI8mVE4ZcZEV5+u5f3bbXuUaxTDjziJKMUbvQ
        w+azZuT4P/ka/OqlcUGLvI280ateqZhRNOJCM42jh5fPefWaJFWcw+xPwfE8jN09
        ub3QZy/0yaX7VSH4RTTyutta5PJ4rlNRFrCPebn8lerfz99vVJU1vkfjGbTQZD1K
        VCu+hwv6LpfnR//x/xCdOwLy9upr6d6AebzrFAJhz3UjIDw6r2fs2eyyNfe/15NB
        +vinhCXwRRsi0jaQI3cch7oRBpKTvnorQThrzxsfML9tpK2Bsbyu88uFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=ATQZFgAJhWZiGySupWX/oJS6Wb8DhGdjsY6S4Ar60bs=; b=Ztqcdvdm
        YB0uqUP+Q8iud76oDZ/FeZjwnBstNMp/QHfaL5rCgWVzgATtVs4KFNi0kjupFsNf
        9Q3v6kBG9Onf0IlA0PUnJuT5VC6cfuZLTozJ0zEggUA+pXVr+X25TYU1AKOQCuer
        ZDBh+IzwUl+wlva8S89iuu18ab0i7+4H1ZgI/xSH/hfzwsYYo6AF0GVPTt4QcIX/
        M5xzpe28YQL1fyjbXrozKUfa0b7IiUBmUA46x2e+Wqmz3BM3pcBFqbIy0MkNTDU2
        2xMELDD5753SN/L52CvEIQEMB0/arKTTE6IfEmbWxJyKjba6nzcOqsJ9EAEHjegG
        CbHS3WmlnpiKVw==
X-ME-Sender: <xms:sejmYKFgNZd9GFb41i9QQrUWwd8AxuJhEZWbnG_tF4tbcco5_LLVrw>
    <xme:sejmYLXm7FBc3r9__ErO78mp9v_Hshm98-8mvT9lKRewEp2w5vLW8TG5vojSWNscP
    nx8Sf5f5siM22e5Xnc>
X-ME-Received: <xmr:sejmYEIxYeiTNVdJiIaTad22OGRuaiuBLrCIjqvn-RK1BMkse8lFf1HFiqlI6t4eSjlpuCBsrjj_V5omPJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:sejmYEGxXi2sEXGZ8DFx0YGM99jO_OAQF6VXmX-U4bwQ7PCDhwUGOg>
    <xmx:sejmYAWjwWZ-NAyl9v7VibPSzD16gDy8nNSkAmYmHiIar6ADE3YRpQ>
    <xmx:sejmYHODa9jYmce7aJIsMdGqR581A3tXYyMOFu3eoz3RYSiXAy7ZgQ>
    <xmx:sejmYJMAG-nVzZWDZVc1lcgNYUWDiaYP51n9usiD5TjdpDnTlWN8CA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:40 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 8/9] ARM: imx_v6_v7_defconfig: Enable Wacom I2C
Date:   Thu,  8 Jul 2021 21:58:52 +1000
Message-Id: <20210708115853.281-9-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708115853.281-1-alistair@alistair23.me>
References: <20210708115853.281-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable the Wacom I2C in the imx defconfig as it is used by the
reMarkable2 tablet.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 70928cc48939..cd80e85d37cf 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -174,6 +174,7 @@ CONFIG_TOUCHSCREEN_DA9052=y
 CONFIG_TOUCHSCREEN_EGALAX=y
 CONFIG_TOUCHSCREEN_GOODIX=y
 CONFIG_TOUCHSCREEN_ILI210X=y
+CONFIG_TOUCHSCREEN_WACOM_I2C=y
 CONFIG_TOUCHSCREEN_MAX11801=y
 CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
-- 
2.31.1


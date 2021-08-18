Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22A73F180C
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238808AbhHSLWF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:22:05 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:53235 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238828AbhHSLV7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id B7085580C0E;
        Thu, 19 Aug 2021 07:21:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 19 Aug 2021 07:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=+EvKAZLb0ChvJ
        XRDnM9S3OyJUJhWZBps8+iA1VzKiac=; b=k1mTW98Ui+eu9zfdoWUj4+xXi3zty
        DVZHGdZx0PRbinix7q4b5VGJajY7heTYV8Cf349XTbMaICKf8wCZcLusgFcsCFz7
        G92UOX6cKLfFShC3J6WClBgGDUDnl+/btbAGtxQPUliNKZ2Iui/oSKJ/RK+STWNx
        l86xqxm4n1q+C4mzVL+fVm1Zofey5Mek91lNLbqVstpus9yr12OerveWxU8tNj4v
        hKcQEKgEGQb/7dFF57OIG1AWKKLSslzJTOgqX/2S32DyeAchTwYgx7zgEasXP/k4
        0BlpfRXUX3cNs34YLsl+N63hF+HAh6Y6TFrQMnHshtcsAt1uXbDMR5chQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=+EvKAZLb0ChvJXRDnM9S3OyJUJhWZBps8+iA1VzKiac=; b=divLTssv
        7AVazRtCtzyFQ5+IbR+Rf5LLBoL5iX7TVj1jjWO9rl2aqxzWYY82BZZzhpGyAOBH
        g+gkkzC/KJeiGSDjnQ1+olE3ATO9FvhvHJ6o1nGakpuMFkTGz/XUuxaT6/vpZZZ+
        Jz5REIzHZodxXcfbJUzemEAeCVUgcsk8toBrs6fKGVELamwP/NSAx9Abq1jOAUwq
        GPKQmB7/oUu1HES+2nLvceDGEWMnu2jUfpVeQLL1d+sSCVJwxhMZkdF3ApGT1tOL
        alSHVj/3zDSh4YQB8BftgN6Zm5uM8VPTRIrIPCWRscxSBizPIti9WoNHddxuF9bw
        OCq/RV97q4pnxA==
X-ME-Sender: <xms:sT4eYQo_vS3yTsgfPIh7tRVCfb_EpRaKHUH2VQi7PKj_xyK8Ln9n1g>
    <xme:sT4eYWrvZJGWjLzUegFkGuuc2sZDnBiNgwwY_ZE_pbKkrXPzKXngaUExFL8abl5lU
    xGOvS7J8m2JBhyx0W8>
X-ME-Received: <xmr:sT4eYVOEKzBdAP8izT6Z2fIGyCfPIhZ9ry5xZ0PtLbHP_9PczQMRMayJabWyPRTK6-3y5ZUwzfqzp6dhxUC-kHnbYHxrb8ACRMsTbv962OXAuLlmFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:sT4eYX5V0dYuKVWezjRnYpGFjZB_YUpUo5WNgiVLHcPGypDghxxdZQ>
    <xmx:sT4eYf5eXNrIzpj97_VNAl-R2jHnPmrILhg9M7Q2iRXkRbHecCco1A>
    <xmx:sT4eYXhCu01l0aeyjhDDUD8EmkNV9pPJ0-as3bZ56fihIezrepoyFw>
    <xmx:sj4eYcyssAUiARDKzBtYCJ9-VKi4temvQ4lPQSbm-weZL--wvkLKBQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:21:17 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 10/11] ARM: imx_v6_v7_defconfig: Enable Wacom I2C
Date:   Thu, 19 Aug 2021 01:49:34 +1000
Message-Id: <20210818154935.1154-11-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
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
index 079fcd8d1d11..477dac1edc75 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -176,6 +176,7 @@ CONFIG_TOUCHSCREEN_DA9052=y
 CONFIG_TOUCHSCREEN_EGALAX=y
 CONFIG_TOUCHSCREEN_GOODIX=y
 CONFIG_TOUCHSCREEN_ILI210X=y
+CONFIG_TOUCHSCREEN_WACOM_I2C=y
 CONFIG_TOUCHSCREEN_MAX11801=y
 CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
-- 
2.31.1


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3084393F7
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 12:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbhJYKsv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 06:48:51 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:56599 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232838AbhJYKss (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 06:48:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id EF7DF58054C;
        Mon, 25 Oct 2021 06:46:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 25 Oct 2021 06:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=FvePu4DfaAI5Y
        pELNve5G7W9fZNbhwwYhYrMJeaayx4=; b=1Py5cquxesxqd9+4SlNTYXkZnFsM+
        3PNYELn9PrdNBKh9W/Q5Z0DWzzMaUnMhsBBkOmYY+0CuapCYBGF5tmA5NxoBY566
        G7tC3NkQxR/tyCRwBR5R8L8nEKpUqSirEUCgQbBEXNjMpNw3Hjx0UjULrcLqd8SV
        CRn5ks0o7ZVsa1WFhlCCxvxuUZXZdXy30JbA2t40nfs72DH7dHuDaxuxKXN/TVbH
        0zhxTK2zLWSuKlHUiDMZdiBeK3thfeifHHSoXnSHNWyA6Jx7ys22Xju/4dqQAuge
        P36erynZz2umMrH//UALOTmBr+XNYrhV4f0awKCs7g1K1av7rJWWUnnFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=FvePu4DfaAI5YpELNve5G7W9fZNbhwwYhYrMJeaayx4=; b=UA0g1DK6
        I4M+SfJjHVLosOrNSplscjD6vE0Vtq11BqeB8OE/mOq6G59wkLgbiCaBb8cGkqT5
        FkvxPlGmFZQXIgU/R35Aitd1nHJFQg6WfrFJ8Hy06BkIKBCDtLI+xbxobAB0+gYO
        P9wwU/KtvJWfzrMta43rlrujRGcc9kv9ey7whNALYxrgX+W9IOeGasfmcUmT8YOu
        uj4eVANeG2qva/xyWMBgqdhyXfC4EFbuVq0ksqMWDBfUNu8K7lpZUcmnd7KdzInI
        PjNRPaBc+4u+cfkSSIZmUpeiolvyo2lKHHVAFtZ19ZiHD+LZWuFSxyvR16crPRML
        UDIT2pWfxLISqg==
X-ME-Sender: <xms:AIt2YdNfGlniZtZhieKv2-YfAGK-wqZu7tzVfqbG5ktBf-iNBORyAA>
    <xme:AIt2Yf96zDoZXD4wQqY9QtPYRNHiI1B__JzCuhnScRU2osHEUoqlJHieWWj94A4x9
    ZI-wYa0CQy4KoMCzW4>
X-ME-Received: <xmr:AIt2YcTQBTy8eLROQA6GBjr-KI8D3TtQ6Di8qu-z784hmJf2f9-If0oaST8DCZ5jx216UrkHsrJR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:AIt2YZtnnXmPhTGxPNho7fI91vlJLKa8gwBlcEylHpils89hjL7TRg>
    <xmx:AIt2YVcjQlyQ5mVER8FDNsM4j3bxYngU0oHb1Y1f0N7o9c8ptKZH6g>
    <xmx:AIt2YV3SAzvWAe5SHKhnvU2OO3xSR2GmF5tlB4wSegZ-MCaV6tip_A>
    <xmx:AIt2YWU55CTjBccKVGUR0p71gxr8bV6Jzx6rtTC38kBUfsfIaG06Cw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 06:46:20 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     s.hauer@pengutronix.de, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, shawnguo@kernel.org
Cc:     alistair23@gmail.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        jikos@kernel.org, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v13 3/3] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Mon, 25 Oct 2021 20:46:05 +1000
Message-Id: <20211025104605.36364-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025104605.36364-1-alistair@alistair23.me>
References: <20211025104605.36364-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 59 +++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index 89cbf13097a4..a2a91bfdd98e 100644
--- a/arch/arm/boot/dts/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/imx7d-remarkable2.dts
@@ -34,6 +34,19 @@ reg_brcm: regulator-brcm {
 		startup-delay-us = <150>;
 	};
 
+	reg_digitizer: regulator-digitizer {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_DIGITIZER";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pinctrl_digitizer_reg>;
+		pinctrl-1 = <&pinctrl_digitizer_reg>;
+		gpio = <&gpio1 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100000>; /* 100 ms */
+	};
+
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		pinctrl-names = "default";
@@ -51,6 +64,26 @@ &clks {
 	assigned-clock-rates = <0>, <32768>;
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	wacom_digitizer: digitizer@9 {
+		compatible = "hid-over-i2c";
+		reg = <0x09>;
+		hid-descr-addr = <0x01>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_wacom>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		vdd-supply = <&reg_digitizer>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -117,6 +150,25 @@ &wdog1 {
 	fsl,ext-reset-output;
 };
 
+&iomuxc_lpsr {
+	pinctrl_digitizer_reg: digitizerreggrp {
+		fsl,pins = <
+			/* DIGITIZER_PWR_EN */
+			MX7D_PAD_LPSR_GPIO1_IO06__GPIO1_IO6	0x14
+		>;
+	};
+
+	pinctrl_wacom: wacomgrp {
+		fsl,pins = <
+			/*MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x00000014 FWE */
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x00000074 /* PDCTB */
+			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1	0x00000034 /* WACOM INT */
+			/*MX7D_PAD_LPSR_GPIO1_IO06__GPIO1_IO6	0x00000014 WACOM PWR ENABLE */
+			/*MX7D_PAD_LPSR_GPIO1_IO00__GPIO1_IO0	0x00000074 WACOM RESET */
+		>;
+	};
+};
+
 &iomuxc {
 	pinctrl_brcm_reg: brcmreggrp {
 		fsl,pins = <
@@ -125,6 +177,13 @@ MX7D_PAD_SAI1_TX_BCLK__GPIO6_IO13	0x14
 		>;
 	};
 
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX7D_PAD_I2C1_SDA__I2C1_SDA		0x4000007f
+			MX7D_PAD_I2C1_SCL__I2C1_SCL		0x4000007f
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX7D_PAD_UART1_TX_DATA__UART1_DCE_TX	0x79
-- 
2.31.1


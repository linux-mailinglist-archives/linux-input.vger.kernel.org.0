Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C859B3F180F
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239137AbhHSLWN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:22:13 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:53079 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238865AbhHSLWD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:22:03 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 498B3580BC3;
        Thu, 19 Aug 2021 07:21:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 19 Aug 2021 07:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=9COMIqJL2Ybx3
        3JZ6BTNawSa1Jp0SEZ7LgvLm9CZf2M=; b=NmbUesK+MechTdvj0rIrg2HcUdkrZ
        wxkOc04IruNeKOXmPdUk67Nm3G6+2w6Prdo8HtZTTLmhVb4KkRF/AYfI4YtEm4LC
        OL7ebnm+tD7NGSKHRXbNAiQRef/YyCq94J6rJJqEo9P3kLpe5QmC55G79Y1Vu6WN
        x2lvS6kMsMZRayTH99zaZnt5vPFwxR8s5ARHA1/0CTiiSgGVsnn86gQDlPwkp2CJ
        sHa0cZlnB/d2e3PtRAFTAt6sSOeNuoOq1PquLYl0CcRmpdMiAfxGCKtCOTB11oK+
        6ltGq8DZGHBA6K8TEBDZDymhdZcZxtppkBvopqLnoebjTT3N9yRVFjU7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=9COMIqJL2Ybx33JZ6BTNawSa1Jp0SEZ7LgvLm9CZf2M=; b=whUtOHHh
        9GThPGHKSfuW3SRKHHk7560a9pT62a9iR3QYdnz9e6sCFQ9hE9CKxyY7ZeeQ0yD+
        KYmG9p/qJ7E+LHwf02fjX2eESrjP3K1EAYjcawMafXNUKLAynnQj9EWwJm/t78go
        aqIzaovrKVIoXMRrPrtQD2/B52Zcfr0n0dGD+fI777xKMar9og1U0y64U3D4yRgf
        NXtbpbI5lha4cuokGaylR40kbtO5zfcmM+liLt9hFZ3OA5YLqxJ5ecOdDHwGwqwr
        +nl8LOGWAFsLaMjNBtn5ak5NJ9iE2o/UOPIr5cY1KHvS8x0iBx0zbvHNUdX7JWKO
        X21AzpBD09NkgA==
X-ME-Sender: <xms:tz4eYZU52GyUbvp0se-_2VMAFCBi4Jt--kC60KjGub4p74rOSPlw8A>
    <xme:tz4eYZl-Hi8Ju_CNlvl8J-Gr-dc6jHYZsSpsSVIVWiiX6wiVDevaxksBAwG-dWC4Y
    jeM3Uzn68nOTX1647o>
X-ME-Received: <xmr:tz4eYVa1JdAZLw52t6EyGThq1ggLAhiQsOn18vP7bAMCh86IqtgnLJYfvTeGHfx2hq96zs0kRPbd9jk9Ky-XvJfdWHkAMWX6bxbAuBzS9zHDeEquEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:tz4eYcXlJIUfvaF6YX4NSYawmrqOuBs_LiVrU7Si1_kJWfi1SqFDVg>
    <xmx:tz4eYTmXBLsYZbGBfvj9TN-fqeqmB2VFAO2cONgsLNDwndUEa-XSBA>
    <xmx:tz4eYZc1RBi-iPOCM0ciR3EQ-wlML6p1hjwcFaZd9wvxUjjJ3ZNxWw>
    <xmx:tz4eYcdpk_sYSiQNcTeF1Zd1np1Am4uCnRYGzVyG9RPxYSAs4ZM9bA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:21:23 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 11/11] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Thu, 19 Aug 2021 01:49:35 +1000
Message-Id: <20210818154935.1154-12-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable the wacom_i2c touchscreen for the reMarkable2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 61 +++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index 89cbf13097a4..052f9da32398 100644
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
@@ -51,6 +64,28 @@ &clks {
 	assigned-clock-rates = <0>, <32768>;
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	wacom_digitizer: digitizer@9 {
+		compatible = "wacom,i2c-30";
+		reg = <0x09>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_wacom>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		flip-tilt-x;
+		flip-tilt-y;
+		flip-pos-x;
+		flip-pos-y;
+		flip-distance;
+		vdd-supply = <&reg_digitizer>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -117,6 +152,25 @@ &wdog1 {
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
+			/*MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x00000014 /* FWE */
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x00000074 /* PDCTB */
+			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1	0x00000034 /* WACOM INT */
+			/*MX7D_PAD_LPSR_GPIO1_IO06__GPIO1_IO6	0x00000014 /* WACOM PWR ENABLE */
+			/*MX7D_PAD_LPSR_GPIO1_IO00__GPIO1_IO0	0x00000074 /* WACOM RESET */
+		>;
+	};
+};
+
 &iomuxc {
 	pinctrl_brcm_reg: brcmreggrp {
 		fsl,pins = <
@@ -125,6 +179,13 @@ MX7D_PAD_SAI1_TX_BCLK__GPIO6_IO13	0x14
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


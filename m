Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FE83BF9A4
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhGHMCc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:02:32 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:57341 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231441AbhGHMCc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:02:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3D07958057A;
        Thu,  8 Jul 2021 07:59:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Jul 2021 07:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=aTJFKJHurQDp2
        WDR9JQ4KJfW6/cQqFXs3yKB0BYzJAY=; b=AGb99ZfCs5k44OC6s/OdZUOWmnl/2
        LMYMQdhbwD/9HG43om6j2xBrBEu/5YJ+aUqPVSNQ5cc9ukuV8MCZVTqC2w7PN3jz
        4a0s+Xd19n8hBp6Min3tahI/2jhkuIWRHPAazBSQ4IcU6e6UrFPm32L1P5sJOIvQ
        LEOUVxp2nAWrtIo7W57LUvOLU+LCaoIYP4V1NHJconxiPcuhrq0Ej/97QFE2gvvb
        EvHNb38jkN7EN3YVizhJqS7pLSAfScSrqyOmKzrBk6/QRMHhoRoYN5Icu1oZ1/0A
        we1mYwvHQuJkyue04UVRQplabJjtdVPlimjmLQnpvbjCAVDs379NnsOuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=aTJFKJHurQDp2WDR9JQ4KJfW6/cQqFXs3yKB0BYzJAY=; b=KSwJbGbp
        Vtpkh2aUeO7nqSgWIjnWSjZqzB5KSpil/4Dcma9Y0Ba4Vmigu/5Ui5dns/WW7q6q
        DPCchSRIu3z7AYIPv9QwioIUpI80loHNMskUrwQX4cPJjomG4IJpNfzSzMF8vC8U
        9Tn3Boc/APS9h42rq9PUrNSmULBBcc7uCWhekbCN98FEQUbWuNG/gsclq8WoQuXD
        g6XKU3JaD07PNU1NfJhzKpmsJPj7Q2icd2yQRrsFPshtOuQNXXlhwoCdulKTvlAq
        jRKbGySW8y3p0Pny6KB6tYU5qPCBMD/IvQXytiJ5VzVF+FSfYh3SnYUCdU/ew9Ob
        ij57dgYIICqaEw==
X-ME-Sender: <xms:tujmYMQaoSJ2msUwN8r1T4YiEmhDsQR-nNKmMjxINY-YQEeAJSM5qw>
    <xme:tujmYJyZSmm3z7cR2t4Y3tMiV_MhoXqQmJO1mP2at9gLkiShIo0NagWMczFy1SSOR
    j-E87KlcIK8ahX3xcs>
X-ME-Received: <xmr:tujmYJ3n9bU9Hu87ZSdi-A2WELVMuHccW3xSZYhiUtxZBS3zJDJfV4FFdYFLD1LvroZvPtLoYrAwaac90II>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:tujmYAAYalfR8-0Joox2gPpaoeIpa2SR2SxRH7Nxp1EY5eF-qC_fYw>
    <xmx:tujmYFj8_-X8OLWLg4xnoH494KQznds_Q0nF_6b0Ec-wC5bLkCsPqg>
    <xmx:tujmYModvFyCaHPrZY5whp7BhPJQSjlm6_AcP_CsQEIhRf90qGTZEQ>
    <xmx:tujmYKZUPk7jAAhyKrTvnOx30F9VfRDyZFDuOijft_5MT9t4KXCpSA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:45 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 9/9] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Thu,  8 Jul 2021 21:58:53 +1000
Message-Id: <20210708115853.281-10-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708115853.281-1-alistair@alistair23.me>
References: <20210708115853.281-1-alistair@alistair23.me>
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
index 89cbf13097a4..cc33b53ae6ba 100644
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
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
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


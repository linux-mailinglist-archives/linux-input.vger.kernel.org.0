Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE6142798E
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 13:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244738AbhJILpl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 07:45:41 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:55419 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244718AbhJILpj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 07:45:39 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2CD525808B0;
        Sat,  9 Oct 2021 07:43:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 09 Oct 2021 07:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=N2p/XmNZUrQW2
        HDkxVdkDiS3njrfPhuY82V1/7CD1fU=; b=brXUnVffvQLw1ocSwR1y7L3TKXblo
        lcBhhFHqNfWZV6h7HByl8ugmaK4+Dd8Tf+5nTsjSf2+LT/eYQKL8+c0WPC8yRsqp
        cQ7cD3pZPSYA6phyJci4xyuHwUDczY3yfvUOBRJ9kCSG5BLxg7uH749EBa5r8prd
        AWRd+VFyJ57nXE8dvI8V3F9V79bRigXD3V0fO7PvCzg4Oew3OMATG6c++iPWjFQy
        EITi2ilLB3Ov+xJvqEUWjpmq6rjwP16Y5Oawa85vSMlTNejhAr33yOYQ+h2wKjJi
        wq48+6V9iCcu6gwdRxJ8Z8RrnGPA+wtysUIRS0r4H8d2frUrm9DHB4TfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=N2p/XmNZUrQW2HDkxVdkDiS3njrfPhuY82V1/7CD1fU=; b=MGKkmlpm
        Hbzdp4uCV7YDANHbas5N7Zfky7Cm7gD7ixx10G5ZwgGYB0pbcWvvr2NqdMDp8R0k
        /FakV3uP5+dIzLF0Q4aO4T1A5LlXcC0f2ojXy4gpBCiyIATH5ni2k3mdgHRLabBY
        RPCEjvxsOf92fIGAMqQBdHsBe9tdqVBxkA1pqSI4AIvQS8F7tIqX0NA37mGqlpLk
        Oo/AQXeG+QvZVv0EdR7CBw4p//+grCy/ZPmoMpTNtzsXjM7fMvyhuWucNZvIoq5P
        emWu5dWmAXQEmlU0+wYDrQmmp1tQSQj9Bt7wYqLTErCvxSJ+14vpMK3Yyj6eY1wI
        StOLPhylbF8/pQ==
X-ME-Sender: <xms:boBhYejQBOTOoPMx599JQh8peM_zGPldvjVtc1KOf1CY_NYu4BifZQ>
    <xme:boBhYfB-k3fImM9h-JemLgMLQwCCkWT6NRb1wHdl2ftqnyoI98iGN-VVXyAFmA9SJ
    5zPaMzVDjR2NNIKLpc>
X-ME-Received: <xmr:boBhYWEEeYpgU2Nc1asU0Y3GWQndUs-bu6C4gnTPGKKWGbjLjUnEPWQD4NJCEisVMGghCCi8NgLz_woLRTrDPvg_eA-UCwRJDLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:boBhYXRvxRvMpmwxa928QeL-ZRahRs6q0-Vaw3MWx_VApobwZoyqpA>
    <xmx:boBhYbxwZsjDawtQw-lc1tOrzd4GQy5Yy7vPh4crp7BpICSYCadVoQ>
    <xmx:boBhYV6EHdMc1fbZwXbbL-onvi4k_znOO011nuu6mLi0Ax-0Sj4tlA>
    <xmx:boBhYQqqetSZ_wN0yOwcyaBoNvdP5kG4i0wJLuUm74nl9Nq-NXNR3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Oct 2021 07:43:38 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     linux-imx@nxp.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alistair23@gmail.com, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v11 4/4] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Sat,  9 Oct 2021 21:43:13 +1000
Message-Id: <20211009114313.17967-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211009114313.17967-1-alistair@alistair23.me>
References: <20211009114313.17967-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index 89cbf13097a4..2099784d6515 100644
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
@@ -51,6 +64,29 @@ &clks {
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
@@ -117,6 +153,25 @@ &wdog1 {
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
@@ -125,6 +180,13 @@ MX7D_PAD_SAI1_TX_BCLK__GPIO6_IO13	0x14
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


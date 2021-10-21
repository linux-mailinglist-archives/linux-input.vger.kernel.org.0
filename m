Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA58435E55
	for <lists+linux-input@lfdr.de>; Thu, 21 Oct 2021 11:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhJUJy0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Oct 2021 05:54:26 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:40649 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231520AbhJUJy0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Oct 2021 05:54:26 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 208B5580CD9;
        Thu, 21 Oct 2021 05:52:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 21 Oct 2021 05:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=bEHXLxO6Up5MD
        ctE6v1ywV1vxtbvnylAp56M89YuQKM=; b=DsWtljH//28RyxDOmmIPSTxC33/fD
        5hZtt2txXwXYXQz1RhIiqmucyq8erTeCMzEQ215ORN8NKqHWRQltSEEh5Dc4GgDN
        xwL7iliCjsdK4wVvgvGglxzmH1SNzN5VyY99pH5MPsEjqJELjjc7sfx4/9/8VuiT
        1n0c28PrQ97Wjzf+QYNs2Bj3+WgofpLmjJbPXfAOeuF41g/rEFiN991XLBgjN7Ka
        aqx3S4oHXPbsJWHZ/3gvajrXKViTbQyHuqTzqSBJAPxMScdJIyzp8LfLxUuOn9Jm
        nxeZ0vGUDR6xxMpM5nTKy+q7JKbE5CKDpJqfKpEjqSG3mLqGAB90V3gMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=bEHXLxO6Up5MDctE6v1ywV1vxtbvnylAp56M89YuQKM=; b=IG+bAUsO
        ZkleDdVkhPRuzOW7ATaHbbMlBplwEAPnnxfQcfO2qQZgtysYOqO3XIvOiVGe8LJy
        zHZ1a1Uax6KE6mbtP1IppzPD6AmY74if4xrLELGiHKOlZPDvtv+BhGGl8u7g3jpb
        vilmW/s/l2b1SIe2AKJAPXSFTs0dRi8K2Ww7xN7n83ur/fm6+iih/o2bnxs2dceM
        09pK4mZhm/h4F5Vezp6K853CgOAeDeEgMB8RmPiNqfe5YiCHBgGu+V31YZdECyYe
        /Vh1MQCsRqwW2NGjaKyvYME0M1WC/4KhVnCt0dczdwnXOYsxYNOCBUFvupAdWPby
        DylDkOB/QjlRsQ==
X-ME-Sender: <xms:SjhxYWblx6aLoPgB9xNkBQjMOcdzca9x5IZtnqaBQ7SmIsa5JabTtQ>
    <xme:SjhxYZZsNNGb3rMTCf3seciiHV36cnmrfgzd8MDh3cJSp2pF_YIsmdt6i7xtl1BqT
    J4djtvdh5TV5o4PBCg>
X-ME-Received: <xmr:SjhxYQ9YiVI1SPCW2L5yGc2SqXXTiUz6H6Xf4r8FYZ_FzikdEYUlggxy72ul1rfQZPYNBIGTDNEn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddviedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:SjhxYYpkT_49il26S4eul69LQZXipS6TMtG5SaOsarnxYxZzpwge0Q>
    <xmx:SjhxYRqPnTOMKdlMxR_6OU1Fc3gjvby0EcK8SeRm_vM6618Q4X6Ysw>
    <xmx:SjhxYWTmhYHHkMTcWn3NFJR15u6qQ1ej7JSGGl-43HPOE4yCV749SA>
    <xmx:SjhxYegbTn60xi70FJNUuFKVihDlj-NSU3Vlb5-aECPa-V6mrFZt_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 05:52:05 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, benjamin.tissoires@redhat.com
Cc:     linux-imx@nxp.com, jikos@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v12 3/3] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Thu, 21 Oct 2021 19:51:07 +1000
Message-Id: <20211021095107.116292-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021095107.116292-1-alistair@alistair23.me>
References: <20211021095107.116292-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 57 +++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index 89cbf13097a4..6059544e7a2d 100644
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
@@ -51,6 +64,24 @@ &clks {
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
+		vdd-supply = <&reg_digitizer>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -117,6 +148,25 @@ &wdog1 {
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
@@ -125,6 +175,13 @@ MX7D_PAD_SAI1_TX_BCLK__GPIO6_IO13	0x14
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


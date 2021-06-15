Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB3E3A7BF5
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbhFOKdl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:33:41 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46333 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231742AbhFOKdk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:33:40 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 42CB058087B;
        Tue, 15 Jun 2021 06:31:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 15 Jun 2021 06:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=Vf0wsGrxQl7PO
        FKknrVYsjnKqkwGq57jfcRRmr9lURs=; b=IOnDx5sHciTrI+oIB47WVhPqMQXo2
        bVBMcb8pwF5h3PpsI1QUeSf8fjZDroIaTUxyE1YBnB/vDTtX5qyTkFSi03UOeF0/
        OZCf3njstVRf83+ibkCRu34dObYJXHEkMwM7gFy7/d9zN4F5zEAmTQtmbMk8Tvxw
        Is0YRvwW84r2iK9j83tTmpCI5IwjKJdzoo+nBymsJELd09pqvbqy5NVohE99/zn3
        KbLBkWXaXVM13rLOKBfqG9wr+JDvY4ilUV+SHeDJ6lKtFRbItpYBJpf5zMDsfV5l
        PvaCufXzLnW85tKO4t+YWRvU2GxbEQt3a9ikXlgUd1VSY7dMro/TESzXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Vf0wsGrxQl7POFKknrVYsjnKqkwGq57jfcRRmr9lURs=; b=Wz1EhSGd
        AMypqY+fxqr3mk0BhYtXjCCVfgVAin1UohWQbvunkbp1UquNgEYJbtMa+6o8b7Tb
        zajsBK1CCBiUD6gj9WyHVY99XQ64eWb4txhdtPJ5hHafXDPK8R9XD/1R+YS/M6oV
        16Q353KIPLd8lofIwUFX6sFuH6z0vnSoniSXTC5/IrtME0kbYDXLaPbKV7HccvvO
        IaUb1708Sl3FgFX6NTQoyZ2Y9hbrtHfbpcYsWMsvppCRA5cI3Oxj7NgymUvmLB1p
        A8z+04oKJPtHvf82JcdWeXUWj4vZpIp0sbrx3MMweNqli+oMaaWpbaF6VCt3uPZl
        Y/reHzxky1WbWQ==
X-ME-Sender: <xms:h4HIYDNGXTPpTXqjMFtfvW3WXASUcN5mpUHt3sNtoThNDFZVCUiWNw>
    <xme:h4HIYN_RwuSnigAYr4S4PuqoPn5z0baXuRhFTJkRBLVa6frjJcWtwiteoMPpdITUf
    p9jV4CU0MycT_G64bc>
X-ME-Received: <xmr:h4HIYCQOdkI3qzUd0-pFVFS6tSHujd9jM8c0ywGV6JoAJoYFfLxLk7boy8Ep4i8SFdnJzg2yIArbwwkY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:h4HIYHvJC-MYDtWFWeMdxAIE9UKaqQbgNwJtE1kHCV-6TU4dLJtaTA>
    <xmx:h4HIYLcPseYZ-3t4FRH5SLpCplZAwQ2xsSsbEs9wQta-TimTT_djsQ>
    <xmx:h4HIYD23HP3H5FrKsyN3pxNg3T5SW_HPfDbcFFDESZO5DWwJz1ZZ_w>
    <xmx:iIHIYKzHFOxRxAe_ugn2crK4SEh5VmNnpW2XUwRRNs_l-GBanRP2UQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:31:31 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 9/9] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Tue, 15 Jun 2021 20:30:14 +1000
Message-Id: <20210615103014.798-10-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103014.798-1-alistair@alistair23.me>
References: <20210615103014.798-1-alistair@alistair23.me>
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
index 7eebcd7f23bb..35262c60f015 100644
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
@@ -118,6 +153,25 @@ &wdog1 {
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
@@ -126,6 +180,13 @@ MX7D_PAD_SAI1_TX_BCLK__GPIO6_IO13	0x14
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


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A146E3DE8E3
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 10:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhHCIuC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 04:50:02 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50123 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234784AbhHCIuA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Aug 2021 04:50:00 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 46A615809FE;
        Tue,  3 Aug 2021 04:49:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 03 Aug 2021 04:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=aTJFKJHurQDp2
        WDR9JQ4KJfW6/cQqFXs3yKB0BYzJAY=; b=iZIxinplCmIp6MJ3epKnC2SgWTFaX
        pXrVWsF5fucYfIZg742gvITmCtSwY00ne7a8r3KfySj4ryvgusCUsb4MPEYBikYF
        HUS7PN3KaJNn5avYjNNip3wS0444IV0o9SX1nUn4NKeNxmiv/QnQcODnXZjmGAyq
        3BhPxMbNlSWLPc0FMCpaGOJrVflw2dj0/uu0J1tVWVwCzUdcH60T5ZVgUdXLvj65
        mDBCmS91b83YJfvULrOTSY0v45ny/5PE1IhChFweNdL35+d5FLnv06SLCvAuaP9D
        XcFUS3HkVm7vhutcI4nZvXAlEEZ40h9iHfF5wj/leajvY1p6yxhBzQBlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=aTJFKJHurQDp2WDR9JQ4KJfW6/cQqFXs3yKB0BYzJAY=; b=FxUlhqG+
        /DnSYzxh26JrrPEkvvkK/F1sjHBcLVPxq2DCTifi8OvzkCDBLWO0jDyvxpA6NmLV
        WN3dSBB8UZo79bQ7j4Tz1Z9I4dsdybPeIfEatFa9EXLvZ98vGs4krwS/VsPE6o4x
        Hol3c153qFSj8TdNiri+MIJjjqXWBB/AxV6ALPi6lHsyS8YvcfVg1hYM9j2/9FGE
        RpzQl6qEG4b0tKhNliJyT1aLUrVws1qa1YORPvfo3MolgUhzGG7CtGcdKFj5VQQc
        VnhbHBahK3dle10nYrUsX7VeSVN3ONhoGnty+hHY5aGQg+kgihXJLdVzEakIaecy
        7qGX/CkfFQ9YNw==
X-ME-Sender: <xms:LQMJYb1if0sUF-EP5kX7iyUtQpnSQgWnTUAdjdXIpIAr2TY95VZMIg>
    <xme:LQMJYaH0JMw1BAIWfWcgh-Fd2pPdpB51gRbnHLPgyqepOArDbefutJXwITMP2A5by
    X3s1e5XkvkD5n62IPg>
X-ME-Received: <xmr:LQMJYb4mUTnYhPFlWZiHwYTf6xyLaYa9MaO7dUSjZBYV0CwR-ki8dovnNg4bIa4Hux_gdlUYlvS0M4tb9ycbS7REv9e1Nhn0_f9KBNCp-dcwlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:LQMJYQ2fZxBTe4y_-N6O_KQ-oBDmSVZTlEI58ZVsCYbfldUc9vugrA>
    <xmx:LQMJYeEqRDdIbzulRpDgpt6kApjsCyXj-txQdc9SY3y3HGQ3kmygRg>
    <xmx:LQMJYR8E3-x-LmJqDXxtGZLwnbbXznOoj66dI94qqIu3bJEsBoP1Fw>
    <xmx:LQMJYW83_-7hFIFJpM8m4ZyYSoiVEtwkKMLA95-yBQRmeqDpqLssKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 04:49:45 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v8 9/9] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Tue,  3 Aug 2021 18:49:02 +1000
Message-Id: <20210803084902.336-9-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803084902.336-1-alistair@alistair23.me>
References: <20210803084902.336-1-alistair@alistair23.me>
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


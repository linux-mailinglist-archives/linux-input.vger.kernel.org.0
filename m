Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F72F3432ED
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhCUOLv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:51 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42939 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229949AbhCUOLN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 667625C00FF;
        Sun, 21 Mar 2021 10:11:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=FUpZqjlOgxXIY
        s30ynfwBw7aJ5BjzlYIhJyreti8lsQ=; b=J3dobLa5lMB+6VdFeOW7DVK8qno1J
        zlAFW5hyzccj017ayps3HiwOT0uF9JfZFXi8KYjOayWR11cuAC4w/uA7+1LRxnm0
        00BaKYkQ+4sOVS/+535OHpVgJXjvYh2gpghPqBWrXXt4lSiQvr9tlzwEFoj88Kzd
        XVGIYwcMcO6PaCo117Cb1cRDnBfFmVeiDHjIONPjT4mgfeGkx241Tnq4JaDIqcGb
        SIWn93qyj3UODhD3oekNmdx+IzG9c23xmhQ7yvegVUcCal2eLPSqAYoMQTxU+xp0
        AIEUtQxrjOGoEBVPTFAl5Ny6voXx4ILCVo7fA0c8exWbhPrtqOyTi5Rhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=FUpZqjlOgxXIYs30ynfwBw7aJ5BjzlYIhJyreti8lsQ=; b=dx+Am8ts
        49uWGdFJjX8Bnq1EaDh3nrtptzblrRypLP6y00/ORDSGUCM4aKEQi6+PGz13ztog
        krOmqcmIHcJfd3ehALlKde4gZBWoO8+3wQwTy5PwERFnSuYc+xvxd2PVnxMRYTSw
        2LCjc1i0ngQhIX3hdCjkp6yHQUcoFL4dy0m/ZgzCMYHctAUDtkeoeYeYGUa/Hfpa
        hl55vZB85Wortf6mYD84pEV2bNLLWEABTjI6xTrbTtWfKQsthQRZIwoTrDUhsscT
        1M91zCDXkvVvRK4XbOCWReUI0iQPZuWOtIHsx+U+HTitUBpplOqpHjsyfrTcCu5z
        DuWY/eGvenG3Kg==
X-ME-Sender: <xms:AVRXYFkvnH43iFtu35Ew8WEE788aZG-GEkld0GTzb7CYEu0vkHKg6Q>
    <xme:AVRXYA07DFftrjYJ0M93_-uZSjOiXeYi5MpYwiPoWy_ZYslDbIa1dlB2Jy3oZ0Mxe
    xJLmqU0Hk90rvUiRuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:AVRXYLoqn7r8ntNj10Ck55YBHJ1MrT7M9Q-GLVFIrTSJoRV0-lMPnw>
    <xmx:AVRXYFm5g2roXxasTdy5rSAJU3opOj8aXcSgIsiMm_APBk6MeUfkdA>
    <xmx:AVRXYD2l6_pBaxsKt1ruFfNSJxLZ3lzJK9Kg9I544nBOFEZTwQwIPw>
    <xmx:AVRXYExpjlIfstK4ATVGVFrTvK6TBW01xXGAxQGo2tCp7QzU3Y8H7w>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 780A32400CC;
        Sun, 21 Mar 2021 10:11:12 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 9/9] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Sun, 21 Mar 2021 10:10:49 -0400
Message-Id: <20210321141049.148-10-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321141049.148-1-alistair@alistair23.me>
References: <20210321141049.148-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable the wacom_i2c touchscreen for the reMarkable2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 52 +++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index 7ed4eb5b8ea9..aa22b77af440 100644
--- a/arch/arm/boot/dts/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/imx7d-remarkable2.dts
@@ -33,6 +33,19 @@ reg_brcm: regulator-brcm {
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
@@ -50,6 +63,28 @@ &clks {
 	assigned-clock-rates = <0>, <32768>;
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	wacom_digitizer: digitizer@9 {
+		compatible = "wacom,generic";
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
@@ -123,6 +158,16 @@ pinctrl_digitizer_reg: digitizerreggrp {
 			MX7D_PAD_LPSR_GPIO1_IO06__GPIO1_IO6	0x14
 		>;
 	};
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
 };
 
 &iomuxc {
@@ -133,6 +178,13 @@ MX7D_PAD_SAI1_TX_BCLK__GPIO6_IO13	0x14
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
2.30.1


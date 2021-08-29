Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC273FAA69
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhH2JVh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:21:37 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:39601 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235037AbhH2JVg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:21:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 55167580B14;
        Sun, 29 Aug 2021 05:20:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 29 Aug 2021 05:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=9COMIqJL2Ybx3
        3JZ6BTNawSa1Jp0SEZ7LgvLm9CZf2M=; b=m7hlypwHAe8y3g6j+f8yf7UfBt6Kf
        I7dWWiCliYnEZt/LnCqvMH97ryRmghS3nE7TfXmy/6QoF3ziRv7atJX8l78F9M/+
        C3usyUiZ018fGl3boO50txx5TABtSBMdYZ8h7qsu798dyhLEJ3cBB6jJX8LXZvpY
        57XAhrnwUpu6i1me04RpXJRn7iKxbY4NdTCguyJxZYFuSXIdiwxl+0acakLz0Bik
        LLn/ErN2wjMuLkLk9Bgcg3IsdZCs08igdPzGltNOkMJZ6eDWzmNUciaNyRRW3HPI
        f6K9EEV93IJz2AcHOi/EJf8KADhE55pw+nykaed/PTY4PqFK7IM6u8izQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=9COMIqJL2Ybx33JZ6BTNawSa1Jp0SEZ7LgvLm9CZf2M=; b=toEZuPc5
        2DW0kxDaESVwRMOTuhrdZqGMQcht1ObEjRuH6PkQntX3ASdhPfBs2RzPXMAleQQV
        GvRA1NcrwsCckXCpNFZXeQbbsXID1bZ5TLAae1Q9Df8Q0rdMbAXVbFr/0yMK15Ad
        ZOjB5r5LLSatkFhIYpv8f5aNrY1hbem8VFwNTmRxjUbkZill845bE3pkV6ahW998
        aieq9ubgX/NtR60hkYpqWSxJmvByB3/2yZY/XavaRwvg7phH+XGg91RtLGZDDaHl
        2GhfpubQNEu1riyYwwDCPSYvpGAsTL34dGJYuxYnsVvDmtqhmL8u/huCfoYPLSOG
        ltcfcMSCu672kA==
X-ME-Sender: <xms:bFErYflcmnR21wcGqE_fm4cNEH-ECI7inOVgztZts3vGHaiFYzs_tw>
    <xme:bFErYS1ow0CgstwPw67ZdUWDKYXMsJCrOL5KA23BtcOgHfAh88OKHYqXcB_0VNoLA
    MYmZNFnw1z8GP0v6Ag>
X-ME-Received: <xmr:bFErYVohqCmyROOTj-B3tkoMHfhh9kg1uneQRMp3Muhhy6xmgGNyfhZU3HluPBMjihvWyaAHv7j-Mdq1hPEbTbqVssPrz8PAmMuf4ZN_aLvjHFOfjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:bFErYXl7aNq0pCQ1-7B1oF3Xq6tuaWaBJlWr1Fo_qevne3HP2UlfQw>
    <xmx:bFErYd0MO9sVm5PFMIznTM3goL1o3cStG8WG38xn9TyUZ6VziPBTmQ>
    <xmx:bFErYWukVWhcFt8bOZwS0pGKdDkDySvj6yDY0mKk-IWtXnxv_6iskA>
    <xmx:bFErYeunGQgb7KLCbu808x_VXWLPv6bAmOFHOcrn3KHaHpdfZa8b7Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:20:40 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 12/12] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Sun, 29 Aug 2021 19:19:25 +1000
Message-Id: <20210829091925.190-14-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
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


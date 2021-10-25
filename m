Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71983439516
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 13:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbhJYLp0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 07:45:26 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50131 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233267AbhJYLpV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 07:45:21 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0A48F580502;
        Mon, 25 Oct 2021 07:42:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 25 Oct 2021 07:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=NEnxTENU6D2lo
        AT8L5o4yKpwKBAbVqwBodQstXPvkAM=; b=Ivx/RXj/ILCO3V26dAOCbIbMlrADh
        bRgQNyYLIsviTDgnW1qnATDsUIxqbcuJ4TCOJalSYhbG9ryIz65Ng8r3o6QlDL7s
        fsbfLui447JHcHJdcbkhjK5qFwGLEvy2dB0h+rvOeHMN1pilY+gkrvj1yvB/fUch
        rfWrnW7UMPnFnClB2oSnDb31xaFJEsS42PgWAp8TNxlngT1Zd4TY6/jsOxAEp6vz
        FsyEMwcMLct+w8JRNBWdn1ulMcxwO09QOKhy7zcIrYaZC6tQcWFXsYfr8RFNUgIn
        WJ3IR3Ipo+Sq6vHBw67x56eJwXxWAyWdIchw86cgc99rxNhMeLJn0WvMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=NEnxTENU6D2loAT8L5o4yKpwKBAbVqwBodQstXPvkAM=; b=lO/DbbbO
        gG+w06t2T3NsaxxDFZtbEptu07wC+FAqpr7eeSJNbvefyATjbXctETNR3EfXDmA0
        gd/hGgWxu156Za/ApYyTDerOKl1S1UBi+1XggRz4DSXQVXYG5c+nDoZvyVzWH9C7
        u9ewhL8Q7YWXUdHubf9BU8IETVOMqHEDyTG32NkaFu6k7slBR80wDhZa1VlYZyXJ
        sQlN0wbCygYJSheKaqzew8Z79ircWH5csaSDWX4x05Ntsz+v/FUGcRCyuIYr4k66
        Vs93PBQ9HdZ6dyMRKBeX35ZfypUY1kCPRoYQOw6+JcgpB5B3qXf6axBdArCY83BG
        RIXtNoCNd6kSoA==
X-ME-Sender: <xms:Qph2YaNkzxWsnbcqSZ0UhvLTf7caaGkuklxHq5BQZBnKK-uBIcFT5g>
    <xme:Qph2YY9n8gWchcZQAjZVR4R0nbHZ4UwJRaQ0Z2AieLMblvqOJIC5_Uhd3lDGGTUaP
    mtwf3Mu0Q31UdPdavI>
X-ME-Received: <xmr:Qph2YRTqdMLtwV8ygXi8PcdUAHQzXvpfRprqvLHM6950sA96oL8dx3riUhxkoJxdpvqN8uKyr1re>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:Qph2YasOaT3l_6sn6Yalpl8KNJTLZwZgvlsExxRSOuOcJTQ6cPpfKQ>
    <xmx:Qph2YSel0JQLoIS11MVo1keYAJNOj02QgbQMBWbP_lNZwiT5p6HywQ>
    <xmx:Qph2Ye33EWQ2rBisTg-NsRU8GJZVEukhn1EPwdotTbadxyTlUSh1Sw>
    <xmx:Q5h2YTXPVnBnoNx7z7YcMTNLmz16Vdu3jIPf-rawRwUsVnTeVFIojA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 07:42:50 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andreas@kemnade.info, alistair23@gmail.com,
        dmitry.torokhov@gmail.com, linus.walleij@linaro.org,
        robh+dt@kernel.org, rydberg@bitmath.org,
        mylene.josserand@free-electrons.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 4/4] ARM: dts: imx7d: remarkable2: Enable the cyttsp5
Date:   Mon, 25 Oct 2021 21:42:14 +1000
Message-Id: <20211025114214.44617-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025114214.44617-1-alistair@alistair23.me>
References: <20211025114214.44617-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 88 +++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index 89cbf13097a4..9a8558c970ad 100644
--- a/arch/arm/boot/dts/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/imx7d-remarkable2.dts
@@ -34,6 +34,18 @@ reg_brcm: regulator-brcm {
 		startup-delay-us = <150>;
 	};
 
+	reg_touch: regulator-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_TOUCH";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pinctrl_touch_reg>;
+		pinctrl-1 = <&pinctrl_touch_reg>;
+		gpio = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		pinctrl-names = "default";
@@ -51,6 +63,59 @@ &clks {
 	assigned-clock-rates = <0>, <32768>;
 };
 
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	tsc@24 {
+		compatible = "cypress,cyttsp5";
+		reg = <0x24>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio1 13 0>;
+		vdd-supply = <&reg_touch>;
+		touchscreen-size-x = <880>;
+		touchscreen-size-y = <1280>;
+
+		button@0 {
+			linux,code = <172>;	/* KEY_HOMEPAGE */
+		};
+
+		button@1 {
+			linux,code = <139>;	/* KEY_MENU */
+		};
+
+		button@2 {
+			linux,code = <158>;	/* KEY_BACK */
+		};
+
+		button@3 {
+			linux,code = <217>;	/* KEY_SEARCH */
+		};
+
+		button@4 {
+			linux,code = <114>;	/* KEY_VOLUMEDOWN */
+		};
+
+		button@5 {
+			linux,code = <115>;	/* KEY_VOLUMEUP */
+		};
+
+		button@6 {
+			linux,code = <212>;	/* KEY_CAMERA */
+		};
+
+		button@7 {
+			linux,code = <116>;	/* KEY_POWER */
+		};
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -125,6 +190,29 @@ MX7D_PAD_SAI1_TX_BCLK__GPIO6_IO13	0x14
 		>;
 	};
 
+	pinctrl_touch: touchgrp {
+		fsl,pins = <
+			/* CYTTSP interrupt */
+			MX7D_PAD_GPIO1_IO14__GPIO1_IO14		0x54
+			/* CYTTSP reset */
+			MX7D_PAD_GPIO1_IO13__GPIO1_IO13		0x04
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX7D_PAD_I2C3_SDA__I2C3_SDA		0x4000007f
+			MX7D_PAD_I2C3_SCL__I2C3_SCL		0x4000007f
+		>;
+	};
+
+	pinctrl_touch_reg: touchreggrp {
+		fsl,pins = <
+			/* TOUCH_PWR_EN */
+			MX7D_PAD_GPIO1_IO11__GPIO1_IO11		0x14
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX7D_PAD_UART1_TX_DATA__UART1_DCE_TX	0x79
-- 
2.31.1


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701C34440CB
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 12:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbhKCLvm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 07:51:42 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:38711 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232011AbhKCLvf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Nov 2021 07:51:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 60AC6580751;
        Wed,  3 Nov 2021 07:48:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 03 Nov 2021 07:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=TzoRqF1p5zbP2
        vPKhDksUN7ws6peTohrQ2WAt/oVnos=; b=HK4BG8Rk1gv7eCQrOc/8a/CnnpFG0
        Y8n0Z5NfYhPLjSKa6gqSG7knqwIeKD9jO1l3H4ZYbV18UvVz2umVZP+JXMuKz3sg
        TLNphvEPYZjW0TRvSE3sFCkJ8YmkV4U9miguGM4UTwYcdt/sIffdzZxdLwRnX6Rp
        xD34NaQ5+Xoo2er0Ajtijwe2Gc4Qh1QaMIFb5klTMqiP8EUmcEN5mX1CbEQKPsBY
        XXwXlPnE77Z1d3RW2+Etk0TDNO7WZWSlZRp0SEjmEbKibejOe11nsOmvdh2z9mWT
        OnhUjaJzqftcnf4Ik9jX8wWdLdoLxtzDvGNNO7C9EPew75BVZ8rArWFug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=TzoRqF1p5zbP2vPKhDksUN7ws6peTohrQ2WAt/oVnos=; b=MpwQOhD/
        XXrViqdAsN2uixwwdt2mNdajVaVfd3nbeYz8zTBizQISdWtvLZYsiDFc1E53szn4
        9nGYxEYj9mM0Dgerb5iK2dx5I26QbT1VFTCnmYbLO5YTTCW/4bAR+SCqa5qpYlrS
        FcBQsDBaBeGdS0n6fhZyHIKCt5J6OS7VeuRD3w23HNDvnDM55FXMzIVjpv/gTvsp
        QCPuAzP3I7HiUP87grQarTtA3VeCDwW43A6l5t/uGmBlm+3nmWwsmK/F7cRNF8A/
        NKXGQgzvFOWcXnlLlS/juj0rM8xAz9lQ6y0s3ycynpTVAP/iLHct9NhOrTGDuNwV
        wwlhhEDG+WZd+A==
X-ME-Sender: <xms:KneCYejDtLKOwd8obxJ8lTMtI6GcCIeeqiQULRiOmhoMUe_971rYsA>
    <xme:KneCYfD1z5AAPx2CogfV4L3XNomKWVLHJaz1YrH2goRaWYMH_HFGAoNRUQ-LC4rY1
    uOA324wm83gVR5cSKQ>
X-ME-Received: <xmr:KneCYWGvIVB6hSxR4hJOrxi1AvYBh7crmzGvB_hwFubHCScG1JCAoaPlQzLHLwhc0umG-WvzIRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:KneCYXQ-OHLc86FqCKbozjxEDwfRUVgNrzW94y2lU-d8FpKffxSYTg>
    <xmx:KneCYbyTQpHUmS5fxdIyP9IqKeYFlgvdnzCM85JCvbnuyLrMczfm9w>
    <xmx:KneCYV5rSmQvxnGm1nidBMUN3vg5CVQi6qutAHTXTFdRc8PTTXqK6w>
    <xmx:KneCYQqNpWi_Ugssl0brUSCmm9s9QJPNEf60Hn46RzLW6jHPbnO9_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 07:48:53 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     mylene.josserand@free-electrons.com, linus.walleij@linaro.org,
        andreas@kemnade.info, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        alistair23@gmail.com, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 4/4] ARM: dts: imx7d: remarkable2: Enable the cyttsp5
Date:   Wed,  3 Nov 2021 21:48:30 +1000
Message-Id: <20211103114830.62711-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103114830.62711-1-alistair@alistair23.me>
References: <20211103114830.62711-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 89 +++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index 89cbf13097a4..cb5c63963a3c 100644
--- a/arch/arm/boot/dts/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/imx7d-remarkable2.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "imx7d.dtsi"
+#include <dt-bindings/input/linux-event-codes.h>
 
 / {
 	model = "reMarkable 2.0";
@@ -34,6 +35,18 @@ reg_brcm: regulator-brcm {
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
@@ -51,6 +64,59 @@ &clks {
 	assigned-clock-rates = <0>, <32768>;
 };
 
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	tsc@24 {
+		compatible = "cypress,tt21000";
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
+			linux,code = <KEY_HOMEPAGE>;
+		};
+
+		button@1 {
+			linux,code = <KEY_MENU>;
+		};
+
+		button@2 {
+			linux,code = <KEY_BACK>;
+		};
+
+		button@3 {
+			linux,code = <KEY_SEARCH>;
+		};
+
+		button@4 {
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button@5 {
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		button@6 {
+			linux,code = <KEY_CAMERA>;
+		};
+
+		button@7 {
+			linux,code = <KEY_POWER>;
+		};
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -125,6 +191,29 @@ MX7D_PAD_SAI1_TX_BCLK__GPIO6_IO13	0x14
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


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E472F4440B5
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 12:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhKCLkx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 07:40:53 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58345 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230250AbhKCLkv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Nov 2021 07:40:51 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 32440580680;
        Wed,  3 Nov 2021 07:38:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 03 Nov 2021 07:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=FvePu4DfaAI5Y
        pELNve5G7W9fZNbhwwYhYrMJeaayx4=; b=3QVckZcxW4F6Ps8FsH9z2mCcp6l+z
        5zMyyseeFPDvxOqO9upZ5owEDnAgTfXmS4+R/7+44smMJY5jofnoMEL9MZXi+Sm+
        LoLrBldRQQxsFLKl08MiwD7fNo89bpTlJGgViwCzOUTVWGy6G1T2BJTy2C3Rsei5
        0mz+I27dJyrbW6sZ87NaShuy04/EbUDgtYWIe0fT3GnS++BLYZgmzmMNayOYTyV9
        9Trsc9OBOWfuCOKzayqzOmL1GydzsrFOz4GCoDGLBow9ykeXiTR6b/HarEO9Uuw8
        ohQ1nkMcjvJWjGpxZLNMoC8egvyd4aSLWlkEJ4UXOWyvTZ3tO/iZNZmqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=FvePu4DfaAI5YpELNve5G7W9fZNbhwwYhYrMJeaayx4=; b=GQ55MAZc
        Oo/JWokrJS7n6YRNfkY4Fze5So4qABHG18DHUvT73N9mGe2i3Ta3MDw6kno9rUxk
        Rtj7ovXQMnAULjeR2q1gmJaKnPu/6PECIoT+FRxGU/d5N8p6xCksWEfTjKvy5c+k
        Y0lnd5mHl+XLEmP68FmVLr8ZSvrwVAV9I9aLqbLyTmRLU5PPeGjzsdxIJpkOHauR
        fR/nqeBaJL+81ojnKkGx3lL8hhaia0XPtVQbEsDFcWqSRZ8BNgCIeCurM5yWflcF
        PWGhVGG573MvltV/V4W1p90QQqlJ06zF9MXGovoDk3BeXJsQvDbiXwC0aq7gq27o
        fTeH2vKNrmc5bA==
X-ME-Sender: <xms:p3SCYbFpqJuz1O96VpoNCTQQbrV6Tu6SntWyy5ZSsaSzGbi7We0kLQ>
    <xme:p3SCYYUizMqgFxT9n5z6ew-7zrnAdfqA9Vy-onn_y2qs4rQNliFiL2-fjWd6hlV-Q
    6MGVvWyQm9bpcLzwQY>
X-ME-Received: <xmr:p3SCYdKI6t8ocG0wNGGSB8Xlgw8x6S5b57D7B7pcutQT0XQFUfH0J7PXLH0o02DccSVVTuk5nzs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:p3SCYZFZRJCkxJd-TX2X1jBwhTh-z4x5wJ6drJYco5EEs_M1-6c4zg>
    <xmx:p3SCYRUtgmHqoSzeeSxVoehBW_yuG60BGOxVN7-dbaa3Vs-kr9RUPA>
    <xmx:p3SCYUOsML-vB78sDtUdPgd2QOJfGqP_7Slpg5SgrkrfhdkOYkd7Mg>
    <xmx:p3SCYaMuUqSrxfEHc5-g-PDfZ2jv-ths9Z1RsJVEHOvBOsQRCqec5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 07:38:10 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, benjamin.tissoires@redhat.com
Cc:     linux-imx@nxp.com, jikos@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v14 3/3] ARM: dts: imx7d: remarkable2: add wacom digitizer device
Date:   Wed,  3 Nov 2021 21:37:48 +1000
Message-Id: <20211103113748.61046-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103113748.61046-1-alistair@alistair23.me>
References: <20211103113748.61046-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 59 +++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index 89cbf13097a4..a2a91bfdd98e 100644
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
@@ -51,6 +64,26 @@ &clks {
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
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		vdd-supply = <&reg_digitizer>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -117,6 +150,25 @@ &wdog1 {
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
@@ -125,6 +177,13 @@ MX7D_PAD_SAI1_TX_BCLK__GPIO6_IO13	0x14
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


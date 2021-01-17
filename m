Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1F22F9651
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbhAQXnW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:43:22 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:48499 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730687AbhAQXm6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:42:58 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 45C545C0114;
        Sun, 17 Jan 2021 18:42:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 17 Jan 2021 18:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=I+9i7Zg7kl5zs
        7aTybIaXEt2e7jVzXYo07W5LPwCSgc=; b=HARRe+SQ9rxwaOlqMMNULU/drSBAB
        8xk3oDFQahqA6wqzfMGD9Q1yyfxZ9oNoxQcbwh6zzdm4F0IwYOH2Kjc4s1xEghd7
        xjHFxaj61VyoZpbYHOzXQw/xX+l+R5sguZZjkVYVz9zSigKINom8Ll6zqJCEArHx
        QWQ2ZrnX99H4bKAPjsp9TpM8MGVSOSfH+GnJIfINYNdU9a41h1ZmC7hSzo0FR2S8
        f2DMBRLUfSjA1eAuCibu8g9NLX1/SRxjbEABptFBR6Q/Vz5bchavfDGL8l8byBU6
        DnIMi3d/tb0129e+v2BHtIb4PlE76UYKNvIUdOJ5Uw54QSUN58dAeBT3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=I+9i7Zg7kl5zs7aTybIaXEt2e7jVzXYo07W5LPwCSgc=; b=g12Umfli
        J8b17sYmju67qdV5xJklSHdAYv2cBqezsClo+fVTd7wEDneRHy/ZiJMJLbqQT+3s
        qGf18lHfOLtTbiPi46somi4j/VmKB1IYfV4VZ5Vb5d4BbEVAd5bJ95LapiqaqAML
        z0WXDbCqYXcwPhmU3uYzDKXPJSgPQ/SEeX4HSQxrGtgf/zE5z6X5NKLuSIlwJt/j
        dok6YfSZPS862KsyIu1NsUhzDLV4k5V6Byt5iMAbCMoh0PzT/PsW4K8dleBBTH0z
        5KkSLcDg4fDWXX32sniRTPdqXcKCFfsFG+mXCwHLv5H/dazISIMj4cYDYiiozjT8
        UY+5sr9SW2Boow==
X-ME-Sender: <xms:VMsEYHvTXKuEfVxxKbKMo-VQTUj2d7OUGWI7hqIj_UuntQINsu2Zhw>
    <xme:VMsEYIep4EMvCng5ohDqlTrVEemEKA0iMh53WqU8KTRAJvcSp20m54mnk2NeShmKI
    0m2kJUJ0sWNaXh8BsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecukfhppeejfedrleef
    rdekgedrvddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:VMsEYKzQyxDk_h65elFpfDqKVgKwhnhbgPr98Cp7wUjmDDX5feF_fQ>
    <xmx:VMsEYGPNtQ-8pr52DXfDkL3c6hDUeVFzAEQ9RwaY-H9xFBgHfQk91g>
    <xmx:VMsEYH8pd3QEyVSSE1NdRfvqFbiM1VtImL3TtcMUU7wR2oErB6Rlag>
    <xmx:VMsEYKauqhsEjSGT9Sjkv4Mgz75eotORsyLhPMprSCDKVFwsyFqchQ>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6551E24005E;
        Sun, 17 Jan 2021 18:42:11 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 3/3] arch/arm: reMarkable2: Enable wacom_i2c
Date:   Sat, 16 Jan 2021 20:24:28 -0800
Message-Id: <20210117042428.1497-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210117042428.1497-1-alistair@alistair23.me>
References: <20210117042428.1497-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable the wacom_i2c touchscreen for the reMarkable2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 41 +++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index fba55a0e028a..8052d884a5e5 100644
--- a/arch/arm/boot/dts/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/imx7d-remarkable2.dts
@@ -150,6 +150,30 @@ &dma_apbh {
 	status = "disabled";
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	digitizer: wacom-i2c@9 {
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pinctrl_wacom>;
+		pinctrl-1 = <&pinctrl_wacom>;
+		compatible = "wacom,wacom-i2c";
+		reg = <0x09>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 2>;
+		flip-tilt-x;
+		flip-tilt-y;
+		flip-pos-x;
+		flip-pos-y;
+		flip-distance;
+		vdd-supply = <&reg_digitizer>;
+	};
+};
+
 &sdma {
 	status = "okay";
 };
@@ -221,6 +245,16 @@ &wdog1 {
 };
 
 &iomuxc_lpsr {
+	pinctrl_wacom: wacomgrp {
+		fsl,pins = <
+			/*MX7D_PAD_LPSR_GPIO1_IO00__GPIO1_IO0	0x00000074 /* WACOM RESET */
+			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1	0x00000034 /* WACOM INT */
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x00000074 /* PDCTB */
+			/*MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x00000014 /* FWE */
+			/*MX7D_PAD_LPSR_GPIO1_IO06__GPIO1_IO6	0x00000014 /* WACOM PWR ENABLE */
+		>;
+	};
+
 	pinctrl_digitizer_reg: digitizerreggrp {
 		fsl,pins = <
 			/* DIGITIZER_PWR_EN */
@@ -236,6 +270,13 @@ MX7D_PAD_SAI1_RX_SYNC__GPIO6_IO16	0x59
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
2.29.2


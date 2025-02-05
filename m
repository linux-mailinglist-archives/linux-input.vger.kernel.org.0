Return-Path: <linux-input+bounces-9801-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45EA2963F
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 17:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B27837A3ABF
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 16:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5661DC198;
	Wed,  5 Feb 2025 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bt+2vxaK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EC61A76BC;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772857; cv=none; b=tYfE9a4LsZwmLFMiG8fd3D99AokoFhlEUWe7tM7o0QpYuTYbhY7Wvzew1Dt02rbbpxOYSUAYQjRcIr6mAa8kS77tbQ6I/T4m0QQYXvQHjq4E3W/kQRDGkZkrWmwQBv0PPes68hIuw6p7ACisic59WrZm+3wVXy2AHCuACIvJ//s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772857; c=relaxed/simple;
	bh=eERR3miXDmPoZPUvazmB4D07WYuPXpsErlKPDcu9knc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPSHVAWrYzh6M28gSHuNPm6QVB9FfiU0Rt8OaLcX/rICFPlFomBx80EL0a4VjgZ5Duml6iEKIt6/PHnwdqDGI7jEkBcnmiw2xH75B0zAgDSHnez6asb/oH5LafuNo+t1B8bocLPVwewCaTKF1q9S1XAP6HN0rfbeR7ymSij7YL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bt+2vxaK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA17FC4CEE4;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738772856;
	bh=eERR3miXDmPoZPUvazmB4D07WYuPXpsErlKPDcu9knc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Bt+2vxaKO1ir63gQNo6sJsB9kD5L6/K0l7d8DN0SgUeUrSvUVXjpkagZGQ/jKJz/i
	 8oTsGAfaQ4CMP3dv0MXIk2qlyEuWcS95Q+RJMU3wXbCvdbX51qUfsoaGJG5KCh7Hdm
	 uAMHQBaIlK6hR3C5bSs00WYARcVKIpZY8viLBjPUVGL8+2DVFGWnUwaQB1FuLRXMAO
	 byAOTJ24a6IcqzZKoSursAcQr6yD5QiXhQuCnz2cRu5qID3W+qQ3WbOUHF8wcjWuu1
	 7AmRbWo/zyr39rLtFl7QhOEowVUupKSjyznJKlsj7/hQt8Su3mhusb8srAgHMx/33w
	 iVUdyY7TxQZ8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB68C02198;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 05 Feb 2025 17:27:28 +0100
Subject: [PATCH v6 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-z2-v6-3-cc60cbee1d5b@gmail.com>
References: <20250205-z2-v6-0-cc60cbee1d5b@gmail.com>
In-Reply-To: <20250205-z2-v6-0-cc60cbee1d5b@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738772855; l=5236;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=pO6QvHypFPEWULVv91eQJ5BCrneBWG97gpW2e4dJtPE=;
 b=iVY+YwXr+AV89FI6a6bpZ0TmrAH9Vxi+xfbY6VF1BtfwtB8uzY7yLPufuRmBnC5yLcQzrsW5U
 PLM+KA/k5HnC51ybiPl88ng6cAhkyUPn6HzmL2oqIEA9Ym8KzyotNSU
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Adds device tree entries for the touchbar digitizer

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Acked-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 27 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 19 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 14 ++++++++++++++
 4 files changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 56b0c67bfcda321b60c621de092643017693ff91..0a93d3891c23da8b8c77dce64001caacb69ee140 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -17,6 +17,14 @@ / {
 	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
 	model = "Apple MacBook Pro (13-inch, M1, 2020)";
 
+	/*
+	 * All of those are used by the bootloader to pass calibration
+	 * blobs and other device-specific properties
+	 */
+	aliases {
+		touchbar0 = &touchbar0;
+	};
+
 	led-controller {
 		compatible = "pwm-leds";
 		led-0 {
@@ -49,3 +57,22 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+&spi0 {
+	cs-gpios = <&pinctrl_ap 109 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	touchbar0: touchbar@0 {
+		compatible = "apple,j293-touchbar";
+		reg = <0>;
+		spi-max-frequency = <11500000>;
+		spi-cs-setup-delay-ns = <2000>;
+		spi-cs-hold-delay-ns = <2000>;
+		reset-gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
+		firmware-name = "apple/dfrmtfw-j293.bin";
+		touchscreen-size-x = <23045>;
+		touchscreen-size-y = <640>;
+		touchscreen-inverted-y;
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..dc72aae3844bf33579f623f0b01abc7de4033af4 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -326,6 +326,13 @@ clkref: clock-ref {
 		clock-output-names = "clkref";
 	};
 
+	clk_200m: clock-200m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+		clock-output-names = "clk_200m";
+	};
+
 	/*
 	 * This is a fabulated representation of the input clock
 	 * to NCO since we don't know the true clock tree.
@@ -441,6 +448,18 @@ fpwm1: pwm@235044000 {
 			status = "disabled";
 		};
 
+		spi0: spi@235100000 {
+			compatible = "apple,t8103-spi", "apple,spi";
+			reg = <0x2 0x35100000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_200m>;
+			power-domains = <&ps_spi0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled"; /* only used in J293 */
+		};
+
 		serial0: serial@235200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x35200000 0x0 0x1000>;
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 0ad908349f55406783942735a2e9dad54cda00ec..045bd0716cb7d20c1379ebc1e3ff7f4d0dddc179 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -17,8 +17,13 @@ / {
 	compatible = "apple,j493", "apple,t8112", "apple,arm-platform";
 	model = "Apple MacBook Pro (13-inch, M2, 2022)";
 
+	/*
+	 * All of those are used by the bootloader to pass calibration
+	 * blobs and other device-specific properties
+	 */
 	aliases {
 		bluetooth0 = &bluetooth0;
+		touchbar0 = &touchbar0;
 		wifi0 = &wifi0;
 	};
 
@@ -67,3 +72,21 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+&spi3 {
+	status = "okay";
+
+	touchbar0: touchbar@0 {
+		compatible = "apple,j493-touchbar";
+		reg = <0>;
+		spi-max-frequency = <8000000>;
+		spi-cs-setup-delay-ns = <2000>;
+		spi-cs-hold-delay-ns = <2000>;
+		reset-gpios = <&pinctrl_ap 170 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&pinctrl_ap 174 IRQ_TYPE_EDGE_FALLING>;
+		firmware-name = "apple/dfrmtfw-j493.bin";
+		touchscreen-size-x = <23045>;
+		touchscreen-size-y = <640>;
+		touchscreen-inverted-y;
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..bb6c9e769c65330a32a3c7aa2f074c1f63e195fd 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -467,6 +467,20 @@ fpwm1: pwm@235044000 {
 			status = "disabled";
 		};
 
+		spi3: spi@23510c000 {
+			compatible = "apple,t8112-spi", "apple,spi";
+			reg = <0x2 0x3510c000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkref>;
+			pinctrl-0 = <&spi3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_spi3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled"; /* only used in J493 */
+		};
+
 		serial0: serial@235200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x35200000 0x0 0x1000>;

-- 
2.48.1




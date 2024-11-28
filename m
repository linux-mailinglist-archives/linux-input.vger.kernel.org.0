Return-Path: <linux-input+bounces-8307-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736669DBD89
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 23:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04CBD2822C3
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 22:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560491C4A15;
	Thu, 28 Nov 2024 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqF4Ay0a"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECE31C3045;
	Thu, 28 Nov 2024 22:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732832963; cv=none; b=pEpP+6vMqn8k/7+Gl5Ggb0b3ILHyJCIXWBJoGRWGfDx9gPCnUBAlOU/C7QrCTJciQaoDPtsg5qyiep2hCNl5x+2hS98P7BUj8CBHUx+/Z4wG0fv1lRJ/vEnetDJjgQD/x714hDBpWh1Ordnnb892tfqYHsjKu0lz8btWDktGbRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732832963; c=relaxed/simple;
	bh=nFKy5PWFnllh2Nvg/Zxy7+7J22v4t/Ihd7HtCcKxeuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4jvvlfbgQoVoxjuuxWw/85giDBuZzkCzaGsQqC9NW/QbOlcci+mJ4yCLj9g/EmzWo1ejmf/e2e5dS5g89ARsfGE6XN2P7+xzCKFptuxw2Dn9fUiKHou25YFO26jgMpQFb2i4fOAijp6rDdJVxZ39uEtu4fzO7o6TXgEcpJu77Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqF4Ay0a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CADC0C4CED8;
	Thu, 28 Nov 2024 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732832962;
	bh=nFKy5PWFnllh2Nvg/Zxy7+7J22v4t/Ihd7HtCcKxeuk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iqF4Ay0aBQzIdjUO+NwRpKomDryWTeCzc6uHsTgZo26PBaT9s707tWDSrMgrSAVo6
	 XnX7s6X5USkF1X40Zzr9pUMrWR7SA2K0qScgxwuR/ylcYCg7TdnA9OuOzepN2NITIE
	 ATYzB4xlIn5C0sJ3i1I1ObmC0q7n9dwHQMtLDJxGiFmgfSIwjwzBvgknWcZaGYMFFS
	 dy5/LLOodJpoSL7v7ogyZ9VAAUFm1MOyOBNb8dlS01gWrZAt3AiVk44UdMKF98F7HG
	 QigYpSVrigAgXZcEr0sM4wqR3qf13a0VGA2Ao+L7thNpbhjJ62qbGEOq41Gw0WJ1ow
	 hxq/8K2+48wyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C123AD70DF8;
	Thu, 28 Nov 2024 22:29:22 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 28 Nov 2024 23:29:18 +0100
Subject: [PATCH v2 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-z2-v2-3-76cc59bbf117@gmail.com>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
In-Reply-To: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732832961; l=5133;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=z8oLT47i5sni374Wote7Xm731uRJeSKzgjn2mB31bRE=;
 b=vkJJjk22h7t1ShUWWM4Oss5KomULzwLuU5dhYO5PgeBhnlYdClzxU1IaLAMiQ9RRdtmjCOr0I
 ePGH4/TVvUDDvQWYMa32B7AXx6wmmmOdIr8t9wcZJus4tFfddPMFSfN
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
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 26 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 24 ++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 14 ++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 56b0c67bfcda321b60c621de092643017693ff91..c31eb3f6f54268cafc9197a9244a5954fbb42802 100644
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
@@ -49,3 +57,21 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+&spi0 {
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
index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b83341a799d9a37578e5461e6b184f81ee7435c 100644
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
@@ -441,6 +448,19 @@ fpwm1: pwm@235044000 {
 			status = "disabled";
 		};
 
+		spi0: spi@235100000 {
+			compatible = "apple,t8103-spi", "apple,spi";
+			reg = <0x2 0x35100000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
+			cs-gpios = <&pinctrl_ap 109 GPIO_ACTIVE_LOW>;
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
index 0ad908349f55406783942735a2e9dad54cda00ec..3332cc87cdf1a418c4c2247639baf5d2a42ed3c2 100644
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
 
@@ -67,3 +72,22 @@ &i2c4 {
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
+
+		reset-gpios = <&pinctrl_ap 170 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&pinctrl_ap 174 IRQ_TYPE_EDGE_FALLING>;
+		firmware-name = "apple/dfrmtfw-j493.bin";
+		touchscreen-size-x = <23045>;
+		touchscreen-size-y = <640>;
+		touchscreen-inverted-y;
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..977c1ca5e8c1b566bb3876b6619ea8812b98e072 100644
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
+			status = "disabled";
+		};
+
 		serial0: serial@235200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x35200000 0x0 0x1000>;

-- 
2.47.1




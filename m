Return-Path: <linux-input+bounces-7405-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF099EA5A
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 14:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2007B1C21B01
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 12:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36EE1C07F6;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfC8smwn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8794F1C07E5;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996812; cv=none; b=RWDq5uwHdlO5fAKJV1kNDfOHqsJYPq3FIeCdWlRnaJ85ZG3rqa4Q3OZy3gXoJK1JpSaWORRo2Xi7YqEC35gc7QRy4ail8ZWecqqnaS0SBtoA7o67Xblxus7Ug4Wg44EoNhh9XzP7iE0+X7NCX5m3MrXTP4JSr4W3fyLWq9JbZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996812; c=relaxed/simple;
	bh=Udnv1koDwbInVk0nEtEsG9PIAwZTO9fQsSD5ERFyx0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VemFn+q2ufe1aXCqrIpPVHrkO74vDYsO0Plw8U6BSx3jx61TeRJl27q5aNXNlqEw9PhP+vtRaoHAgpsdLA4Sn/e2KSot/0/KLmGDgCR8KGe1dMPLQTJdsClti2JAzaCpb88f7xYPg3ZJhnxAEJwgnORok0QqO8LgEUeL5YFh4C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfC8smwn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29C2CC4CED2;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728996812;
	bh=Udnv1koDwbInVk0nEtEsG9PIAwZTO9fQsSD5ERFyx0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AfC8smwnmghjBAVSSws9C+MKUkIKkYWPsE7UTBzl7Q3hpSImONJ70FotEYB2Z5y4m
	 sz72barFcKYLrtP+1dG6e7uq1XDqvBHJxupt2nCpPenvJ9gIBn10bl9WQlzMeqlhO1
	 BDbFnJEkLPKdKrLZMFTF1zDfh0SzXmecpvBwLFkHA9x3Zr8k6Iju98UZ5Hekxw/Lxr
	 woZa874ilKx7Yc+4tRol1Q3u4QAaOVK29947kGYaTqebw1v+V9+Vj4ORBx5ZGs5uBj
	 ZGOcpM1TmXlS5N3zt/Xvq6tYUYf/xS5yjRBBdBYRI5JCUYaL6j433btFB3qtLqodpu
	 C3z0gtsB9rXZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDDBD216A2;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Tue, 15 Oct 2024 20:53:31 +0800
Subject: [PATCH RFC/RFT 3/3] dts: sm7125-xiaomi-joyeuse: Sample device tree
 for reference
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-nt36xxx-v1-3-3919d0bffee6@gmail.com>
References: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
In-Reply-To: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Del Regno <kholk11@gmail.com>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728996810; l=6157;
 i=gchan9527@gmail.com; s=20241015; h=from:subject:message-id;
 bh=tWQZcmPANb4gyYg3Iy7tm37YDTp8/euoXHalxbM18xI=;
 b=LpMt6KwLQJJNw2ApXjiVTFev3urGDEjLrV4ifAm4rghDhKju/6l5pSvCF1By3ymwJAdwDXGAl
 4I6CBpnVE/IACDBLermLo56NxcrYbTBr/dDOEjn2heqvCAV/cAjwTXP
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=dscYWhT+BiQOBMpPE19NFQAjBBmcpipc6zdf2MTze/U=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20241015 with
 auth_id=248
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Provide a include-made-easy devicetree file for demo.
This sample file aimed including novatek touch support.

Reviewers please ignore this patch.

The full device tree is at below:
https://github.com/99degree/linux/tree/working-20241015/arch/arm64/boot/dts/qcom

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sm7125-xiaomi-joyeuse-touch.dts  | 183 +++++++++++++++++++++
 2 files changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index aea1d69db5..ba9786555b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -235,6 +235,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-curtana.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse-touch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse-touch.dts b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse-touch.dts
new file mode 100644
index 0000000000..4a43db701d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse-touch.dts
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#ifndef SM7125_XIAOMI_JOYEUSE_TOUCH_DTS
+#define SM7125_XIAOMI_JOYEUSE_TOUCH_DTS
+
+#include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/gpio/gpio.h>
+
+#include "sm7125-xiaomi-joyeuse-display.dts"
+
+&soc {
+	gpi_dma0: dma-controller@800000  {
+		compatible = "qcom,sm7125-gpi-dma", "qcom,sm6350-gpi-dma";
+		reg = <0 0x00800000 0 0x60000>;
+		interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+		dma-channels = <10>;
+		dma-channel-mask = <0x1f>;
+		iommus = <&apps_smmu 0x56 0x0>;
+		#dma-cells = <3>;
+		
+		status = "disabled";
+	};
+
+	gpi_dma1: dma-controller@a00000 {
+		compatible = "qcom,sm7125-gpi-dma", "qcom,sm6350-gpi-dma";
+		reg = <0 0x00a00000 0 0x60000>;
+		interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 646 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 648 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 649 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 650 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>;
+		dma-channels = <10>;
+		dma-channel-mask = <0x3f>;
+		iommus = <&apps_smmu 0x4d6 0x0>;
+		#dma-cells = <3>;
+		
+		status = "disabled";
+	};
+};
+
+//spi@880000
+&spi0 {
+	dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+		<&gpi_dma0 1 0 QCOM_GPI_SPI>;
+	dma-names = "tx", "rx";
+};
+
+//spi@884000
+&spi1 {
+	dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+		<&gpi_dma0 1 1 QCOM_GPI_SPI>;
+	dma-names = "tx", "rx";
+};
+//spi@88c000
+&spi3 {
+	dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+		<&gpi_dma0 1 3 QCOM_GPI_SPI>;
+	dma-names = "tx", "rx";
+};
+
+//spi@88c000
+&spi3 {
+	dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+		<&gpi_dma0 1 3 QCOM_GPI_SPI>;
+	dma-names = "tx", "rx";
+};
+
+//spi@894000
+&spi5 {
+        dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+                <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+        dma-names = "tx", "rx";
+};
+
+//spi@a80000
+&spi6 {
+	dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+		<&gpi_dma1 1 0 QCOM_GPI_SPI>;
+	dma-names = "tx", "rx";
+};
+
+//spi@a88000
+&spi8 {
+	dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+		<&gpi_dma1 1 2 QCOM_GPI_SPI>;
+	dma-names = "tx", "rx";
+};
+
+//spi@a90000
+&spi10 {
+	dma-names = "tx", "rx";
+        dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+                <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+};
+
+//spi@a94000
+&spi11 {
+	dma-names = "tx", "rx";
+	dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+		<&gpi_dma1 1 5 QCOM_GPI_SPI>;
+};
+
+&spi11 {
+        status = "okay";
+
+        touchscreen: touchscreen@0 {
+                compatible = "novatek,nt36675-spi",
+				"novatek,nt36xxx-spi",
+				"novatek,NVT-ts-spi";
+			
+                reg = <0>;
+
+                /* caught from joyeuse dtb*/
+                spi-max-frequency = <4000000>;
+
+                /* ts->irq report 194 */
+                /* interrupts = <&tlmm 194 IRQ_TYPE_EDGE_FALLING>; */
+                /* interrupt= <&tlmm 13 2>; */ //dtb specified, but GPIO13 is CAM_MCLK0
+
+                novatek,reset-gpio = <&tlmm 8 0x00>;
+                novatek,irq-gpio = <&tlmm 9 0x2001>;
+
+                /* 672C */
+                novatek,swrst-n8-addr = <0x03F0FE>;
+                novatek,spi-rd-fast-addr = <0x03F310>;
+
+                reset-gpio = <&tlmm 8 0x00>;
+                /* dtb show <&tlmm 13 2>*/
+                irq-gpio = <&tlmm 9 0x2001>;
+
+/*
+                touch_ibb-supply = <0x241>; //lcdb_ncp
+                touch_lab-supply = <0x240>; //qcom,qpnp-lcdb-regulator ldo
+                touch_vddio-supply = <0x33c>; //pm6150_l18
+*/
+
+                vio-supply = <&vreg_l18a_3p0>;
+                vdd-supply = <&vreg_l18a_3p0>;
+
+                panel = <&panel0>;
+                status = "okay";
+        };
+};
+
+
+&qup_spi11_spi {
+        drive-strength = <2>;
+        //bias-disable;
+};
+
+&qup_spi11_cs {
+        drive-strength = <2>;
+        //bias-disable;
+};
+
+&qup_spi11_cs_gpio {
+        drive-strength = <2>;
+        bias-disable;
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+        status = "okay";
+};
+
+#endif

-- 
2.43.0




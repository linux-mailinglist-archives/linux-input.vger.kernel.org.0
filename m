Return-Path: <linux-input+bounces-14273-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD0AB32950
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 16:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 226ED7BAC71
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 14:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645BB26CE17;
	Sat, 23 Aug 2025 14:40:03 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564D925E469;
	Sat, 23 Aug 2025 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755960003; cv=none; b=q55EcqUffsZTFEcl9PEoWNdPmgrw8436NBn/LBDNImq3+xqIr0HWH5lA4YkUuPmLNxoxQYGSqvNnfZ0lvagXVCYHAhrUpV/W922XILGTqo+C96KM+TAFz4v9wxjNlcPXDLPv2RCnJXG2g62PrsMr37A8n1Jf4pEhavGefUfdmM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755960003; c=relaxed/simple;
	bh=t4PafNcy4c4y1ZS9W00utdfkHpmQRmiBBhLJvz3xluc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pAT3qP6NkQotHc+4zmzqv6kvl4ToeIx2bP9nW0/PFTXzA2QvP/BqSjzkkPQKseAnAoV/5v8bdqmwhuUzlj9BojWoIaC97PQKcL7Hu2AF5JWrdj6tdpm+rSzV7xEtIfb3YsxFrtynXSuT8Xj1yfoRX9mLASxMdVtTGtMBDJxQFTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57NEitFV012755;
	Sat, 23 Aug 2025 14:44:55 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57NEit2H012749;
	Sat, 23 Aug 2025 14:44:55 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v2 7/9] ARM: dts: imx: Use fsl,led-control as mc13xxx node name
Date: Sat, 23 Aug 2025 14:44:39 +0000
Message-Id: <20250823144441.12654-8-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250823144441.12654-1-akurz@blala.de>
References: <20250823144441.12654-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to fsl,mc13xxx.yaml, the node name for led-control is
vendor prefixed. Change it accordingly.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
index e958d7286ae9..7785eda84a5d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
@@ -75,7 +75,7 @@ pmic: mc13783@0 {
 		pmicleds: leds {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			led-control = <0x001 0x000 0x000 0x000 0x000 0x000>;
+			fsl,led-control = <0x001 0x000 0x000 0x000 0x000 0x000>;
 		};
 
 		regulators {
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
index 06545a6052f7..6bc749c70a44 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
@@ -396,7 +396,7 @@ vgen3_reg: vgen3 {
 		leds {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			led-control = <0x0 0x0 0x3f83f8 0x0>;
+			fsl,led-control = <0x0 0x0 0x3f83f8 0x0>;
 
 			sysled0@3 {
 				reg = <3>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
index 26eb7a9506e4..1bc78e88d2a9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
@@ -223,7 +223,7 @@ vgen3_reg: vgen3 {
 		leds {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			led-control = <0x0 0x0 0x3f83f8 0x0>;
+			fsl,led-control = <0x0 0x0 0x3f83f8 0x0>;
 
 			sysled3: led3@3 {
 				reg = <3>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
index 19a3b142c964..a4fbfaf532ed 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
@@ -151,7 +151,7 @@ vgen3_reg: vgen3 {
 		leds {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			led-control = <0x0 0x0 0x3f83f8 0x0>;
+			fsl,led-control = <0x0 0x0 0x3f83f8 0x0>;
 
 			sysled3: led3@3 {
 				reg = <3>;
-- 
2.39.5



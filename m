Return-Path: <linux-input+bounces-5496-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F375A94DE07
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 20:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7338CB21A7C
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 18:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6277C1386D2;
	Sat, 10 Aug 2024 18:48:14 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F03482DB;
	Sat, 10 Aug 2024 18:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723315694; cv=none; b=oY5C9fTBlQptej1PbtECgTX57+Eg4JzCpb7ApYrpmllczoSEzRHTlGkFm8SW9plttQo+MVzSOtRwzirUgw4m0V9QOSAZKm8qt2j7bmbaU8TzUj8uGlRj1SzQE38P/4J+XmwY/MlABrUxR/h7Kwx2gIpvBr9+cEImsYDBwuMFg90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723315694; c=relaxed/simple;
	bh=3oRagH2yyp/5JVazFAZWcnGYexHP4Uw1cLEt7HEAvTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r4EH9RXYL9ngilVMX8jyjl9mC20VZqZ4fVS6ae1WD1D4xhm36m8Bsb/ntxEWEVo9W2jG0uOKTaJRX+lFp12+kQDfVVpWz5uUHfxb0TQWZiLTU3OY0a/VB/8WGvC/jeJLIa/pwPe9Mzw+J6JP1C7ChDesJuwZBumssEycXk/UjdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b02.versanet.de ([83.135.91.2] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1scr84-0006GR-HN; Sat, 10 Aug 2024 20:47:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 7/7] arm64: dts: rockchip: set hdd led labels on qnap-ts433
Date: Sat, 10 Aug 2024 20:47:43 +0200
Message-Id: <20240810184743.277248-8-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240810184743.277248-1-heiko@sntech.de>
References: <20240810184743.277248-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The automatically generated names for the LEDs from color and function
do not match nicely for the 4 hdds, so set them manually per the label
property to also match the LEDs generated from the MCU.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 6405ec7d47361..110c323786848 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -50,6 +50,7 @@ led-0 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DISK;
 			gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
+			label = "hdd1:green:disk";
 			linux,default-trigger = "disk-activity";
 			pinctrl-names = "default";
 			pinctrl-0 = <&hdd1_led_pin>;
@@ -59,6 +60,7 @@ led-1 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DISK;
 			gpios = <&gpio1 RK_PD6 GPIO_ACTIVE_LOW>;
+			label = "hdd2:green:disk";
 			linux,default-trigger = "disk-activity";
 			pinctrl-names = "default";
 			pinctrl-0 = <&hdd2_led_pin>;
@@ -68,6 +70,7 @@ led-2 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DISK;
 			gpios = <&gpio1 RK_PD7 GPIO_ACTIVE_LOW>;
+			label = "hdd3:green:disk";
 			linux,default-trigger = "disk-activity";
 			pinctrl-names = "default";
 			pinctrl-0 = <&hdd3_led_pin>;
@@ -77,6 +80,7 @@ led-3 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DISK;
 			gpios = <&gpio2 RK_PA0 GPIO_ACTIVE_LOW>;
+			label = "hdd4:green:disk";
 			linux,default-trigger = "disk-activity";
 			pinctrl-names = "default";
 			pinctrl-0 = <&hdd4_led_pin>;
-- 
2.39.2



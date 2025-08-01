Return-Path: <linux-input+bounces-13759-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF9B18252
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 15:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 757953B5EF6
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 13:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0642625FA2C;
	Fri,  1 Aug 2025 13:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZRHanWdp"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058B253B64;
	Fri,  1 Aug 2025 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754054218; cv=none; b=Qsp5JS+fEB9uV+43LnKVjr1waMcyPc20usX6y2Gz6BFZ13wJToKmQwqiblS50vudXphWJ8S/A3lcR6dJ/epc24Z3tmtGqmj+SvxWpXzbvTvzZkOQDU2VCoda88xa9Ip5yQSCn2DVGkxRLW3R6Ya9tr/Md/RVzVqk67LrStTtVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754054218; c=relaxed/simple;
	bh=8dchQqi4TIXOkNjmPENd+y2u2n3RjTnFEQP+olfB+Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVeRM2aFtUw5j1RcHfeAcXrwNE/NwvB3L6r0J+eIyEOxVLPC3X+gv22WuRcaZPxS6Z9iOzA7ZEOcIfrJ6Eg8BhM9DUb6u5vQVWOgq4L3uwqmIW1PlgxK5MIhh7B/khyltPi2+ODiMqzraJy1Py5IGrBBnE8mkvY1pFzjyERkEAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZRHanWdp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754054214;
	bh=8dchQqi4TIXOkNjmPENd+y2u2n3RjTnFEQP+olfB+Xs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZRHanWdpElEYhuQM6x/oecXJEwYMmV3QA5K+YiepFDMRKXLxMZIxmDjTzUk/J/RbJ
	 R1Kd0VxPCYsgLdrLk+DJCh9USPbSP4J7wsD3EBJ53Eau6pstXjomdV9zzeK+O6O7Hw
	 NMUjQS+3HLw5joqFVz5K6r6ppXNkXAZC3IhKiv6XWCt9I+uCbrEAbEjptxkqE7cESL
	 Xzd3ZKtE7qSqdxFTFassl3WwCGEmg0V1bAubUnjcGVeahR+bt7TcuFIRYHiWBRdfD4
	 q+cs6V0ejX8zYqZ54U0S8/NQlRGM8gRiFTb4F5pzU7F3S50WRwZrWhRCppv6McA3LR
	 1AXz6yZRzfpqw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53A5917E129D;
	Fri,  1 Aug 2025 15:16:54 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 15:16:51 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support for
 blue and red LEDs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-radxa-nio-12-l-gpio-v1-3-d0840f85d2c8@collabora.com>
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

The Radxa NIO 12L board has an RGB LED, of which only red and blue
are controllable.

Red and blue LEDs: no need to choose, both are enabled.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index fd596e2298285361ad7c2fb828feec598d75a73e..12288ad4d2932b7f78c96c0efe366a046721f919 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
 #include <dt-bindings/spmi/spmi.h>
@@ -73,6 +74,28 @@ button-volume-up {
 		};
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&gpio_leds_pins>;
+		pinctrl-names = "default";
+
+		/*
+		 * This board has a RGB LED, of which only R and B
+		 * are controllable.
+		 */
+		led-0 {
+			label = "rgb-blue";
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			label = "rgb-red";
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	wifi_vreg: regulator-wifi-3v3-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wifi_3v3_en";
@@ -647,6 +670,14 @@ pins {
 		};
 	};
 
+	gpio_leds_pins: gpio-leds-pins {
+		pins {
+			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>,
+				 <PINMUX_GPIO7__FUNC_GPIO7>;
+			output-low;
+		};
+	};
+
 	i2c2_pins: i2c2-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,

-- 
2.50.1



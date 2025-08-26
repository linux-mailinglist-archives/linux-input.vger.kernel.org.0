Return-Path: <linux-input+bounces-14326-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26625B367FD
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 16:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FB865630F2
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 14:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6C4353363;
	Tue, 26 Aug 2025 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WIYB6cX4"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5665334DCF6;
	Tue, 26 Aug 2025 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216920; cv=none; b=t1hDpcrtKHBlcJ5FnJRx/+Wnwo2tjKIWbzJJvxthWMuBgxIIrPTRS1pDAL/jLCM2cw2r5VG9rh/eb6qWfYKsVG6GsrCO9vhufdbbUkL66CyniPh6OYuN2qqjNeXN5M87Fad5gFE/TZBuvwAU9LQeuVEkvCb70PEG0rPHrTABjVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216920; c=relaxed/simple;
	bh=1orjOVOBQPF16N4NkcngIDGSPWhXZVsgtixMp4piRVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qg5MVAo6ofwp3XpCLwajtBOoRCdBquhJVYov+Go8LBz1qnf03hFuP1AqhsEOwddY6rxJRktljKu3MJayK2xtBj/gQxDjbKnKoOT+BO2GecG7NCZzL74rB3z7rwaeoEMJVlpzZ6RWxzz3duVRgEyRzhU+4OH7t+MQRsDXCEzg2uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WIYB6cX4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756216916;
	bh=1orjOVOBQPF16N4NkcngIDGSPWhXZVsgtixMp4piRVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WIYB6cX4ZURN1Z8+3WvjWgaAcP0G0sSFewET80YNTMTNDEodE9YPbmacm013xGVwD
	 Wu4dWex+I1eKg6q/s9SaiND/BAVXxSkTxBqwBcnXJRpAdJILEDCyzlSilLDAzc9k2r
	 xmOauOKfgJDDPmTCFe0KBk5pf9ZCQyXtQ+LN8mpRvFdEvR7UEoh2Lha8yTpFcknaia
	 k9MsO3PmYsLWPn9Db9PTEIEk/SNnrsfE0XpIVgtdP2P5g7S0MQLJuMUdn5Q72G+dqe
	 MBLeoPsNf/77dqM7Wgsv0HSTw2Dg+DatxUsy5z0i3I2ou+xNlekwQB6blwfK3I5CUj
	 naPVwQJ+Wam4A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E70C17E0C21;
	Tue, 26 Aug 2025 16:01:56 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 16:01:54 +0200
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support
 for blue and red LEDs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-radxa-nio-12-l-gpio-v2-3-7f18fa3fbfc8@collabora.com>
References: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
In-Reply-To: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

The Radxa NIO 12L board has an RGB LED, of which only red and blue
are controllable.

Red and blue LEDs: no need to choose, both are enabled.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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



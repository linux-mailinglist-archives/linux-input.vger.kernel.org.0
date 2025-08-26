Return-Path: <linux-input+bounces-14325-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDCFB36735
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 16:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B08A7B91CA
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 14:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F34352FD4;
	Tue, 26 Aug 2025 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jjIfeuha"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E609302CA6;
	Tue, 26 Aug 2025 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216919; cv=none; b=hWeQLicosKP7lpEtwJdmPryPDafST1PFKjAueBuz4qmTXwYSBraChgflsYeSgTY9miI63MRlcwMQbMSB//LWUnhRE1Pw0XnZY18Hn/vjJ5NfHKK+64VYIqIPkn70LYkZqVU5KMY/oMGDArxcyhHQvwSBkG1UDQl9gIIRpu0m72U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216919; c=relaxed/simple;
	bh=aTzc19rNzhfUwnKHgHEs3yztG7QPsMFThY65PshM7MA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgcFMlmc7gyXhwNXFiZTiVcpoLgGh416Xf8yHLG/arsG4DK7ACdWU6D3OTBqUII9eUDMtbNa7DW3rHEMWQhoZcj0qE+uirYL8K1FoINlZdCBb7REA/jt8jYN5YlTcVEr5lCxKKxWAkGiXAc+AlG1cSAel+03aV1wRvDDU9/Fxis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jjIfeuha; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756216915;
	bh=aTzc19rNzhfUwnKHgHEs3yztG7QPsMFThY65PshM7MA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jjIfeuha8TBM5GDPmpevTC75pb4zYfQnmaB4K36nx5sp92f7qmlalZkBORQb4M5xh
	 uqizmcUulNBCXqQrntFVOyps0lIfTGr0ecz/FU8EbtzCX7KUnH0ptff7MMXbTXlpzf
	 tOjUfg6fzvOhYx61AFWjWyNT/lVP4GQcHIQHNpk3+9YGpgR0kikGkwHowgFu2oUtX9
	 UUcKu4bfRVFQtNisCypHDnOVI37ZeknQE9Pqv916XG6K/pmZYdpEG/qRf1XHKXRPrD
	 EkMqRUVhliLUvbTfSoTbF2S2cthrTOiiO8dqMMO95JhszEK3yez8jZGO44ky5rI+WB
	 zJmrulzQi/iEw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FA0217E086B;
	Tue, 26 Aug 2025 16:01:55 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 16:01:53 +0200
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8395-nio-12l: add PMIC and
 GPIO keys support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-radxa-nio-12-l-gpio-v2-2-7f18fa3fbfc8@collabora.com>
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

Add support for PMIC and GPIO keys on the Radxa NIO 12L board:
Declare a gpio-keys node for the Volume Up button using GPIO106.
Add the corresponding pin configuration in the pinctrl node.
Add a mediatek,mt6359-keys subnode under the PMIC to handle the
power and home buttons exposed by the MT6359.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 329c60cc6a6be0b4be8c0b8bb033b32d35302804..fd596e2298285361ad7c2fb828feec598d75a73e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -8,6 +8,7 @@
 #include "mt8195.dtsi"
 #include "mt6359.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
@@ -60,6 +61,18 @@ backlight: backlight {
 		status = "disabled";
 	};
 
+	keys: gpio-keys {
+		compatible = "gpio-keys";
+
+		button-volume-up {
+			wakeup-source;
+			debounce-interval = <100>;
+			gpios = <&pio 106 GPIO_ACTIVE_LOW>;
+			label = "volume_up";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
 	wifi_vreg: regulator-wifi-3v3-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wifi_3v3_en";
@@ -626,6 +639,14 @@ pins-txd {
 		};
 	};
 
+	gpio_key_pins: gpio-keys-pins {
+		pins {
+			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
 	i2c2_pins: i2c2-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
@@ -880,6 +901,21 @@ &pciephy {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+
+	mt6359keys: keys {
+		compatible = "mediatek,mt6359-keys";
+		mediatek,long-press-mode = <1>;
+		power-off-time-sec = <0>;
+
+		power-key {
+			linux,keycodes = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		home {
+			linux,keycodes = <KEY_HOME>;
+		};
+	};
 };
 
 &scp {

-- 
2.50.1



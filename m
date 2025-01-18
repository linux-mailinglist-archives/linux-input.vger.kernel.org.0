Return-Path: <linux-input+bounces-9373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D974A15F0F
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 23:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5308188688E
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 22:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7601DE88A;
	Sat, 18 Jan 2025 22:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQqUg/Ay"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B4D1B393C;
	Sat, 18 Jan 2025 22:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737240233; cv=none; b=WXQzBV1A/LablSKKETy33YKP37puqDZkIlb3JIt0/ViANW+bwZy0aC4zJ1I7dRr4sfkS0O9Eiysme3ftVJRT6R/wl93u4Upw88M74cd24VF2qSjRSBwYLfOvGwKCTS+nSOJF5EKJk0rVfNoVo9FRQoHLne+QUadS9r9ZtF3jqXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737240233; c=relaxed/simple;
	bh=4mqO9fFAzT1FG6ss/NQO1jdCRuZdLW3O8dLx4waQ6Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ps1SwfwldFMEgLLvQAu56wVMMveXLjyuZtoQnn2VhkUHJlrNVd5q6MDAofetNBn86H0KJnFgB4z+MNt3Jgt2m7ARntT/V0bVGZVB17Wn5hXg6CaxER/LtyTVLCVraUK0NC/jxqQmYOC2LRN1u0EfCI9Chfcp8fm+WiZbk9DlTK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQqUg/Ay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A738FC4CEE2;
	Sat, 18 Jan 2025 22:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737240232;
	bh=4mqO9fFAzT1FG6ss/NQO1jdCRuZdLW3O8dLx4waQ6Qc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EQqUg/AyGYPCAxoZ3cWxh8r17Vle9qUrKYa2qqk1KbAFRVT2ApUjbuUPPFutx1ERS
	 QkvS5O10OdLG+Zy/g4Og1IVcNrK2bEGS5jUZksUPDrPFWACgsGp/x8vsiFlNg73uj4
	 KF7UZf3PBFyqwJSH3yj9zpWoMk4NdItrvaohhqHJKXYugjXAPdu+pP8awEzxrN084W
	 9WWHpACDWWrErcLEWboYmIjL0ZRPs3W59W49AGeHJoTi/qYKvE+kRXb5EjTAqLoB/2
	 OW1ajtwDSim4DYnOHA5nftpUmR9XKLpLYrRpee2NH/NuGyzcm/DSjRC/844fRCfBz4
	 QSBAg1/b3H7qA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E71C02187;
	Sat, 18 Jan 2025 22:43:52 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sat, 18 Jan 2025 23:42:22 +0100
Subject: [PATCH v5 1/4] dt-bindings: input: touchscreen: Add Z2 controller
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-z2-v5-1-6d38b2582169@gmail.com>
References: <20250118-z2-v5-0-6d38b2582169@gmail.com>
In-Reply-To: <20250118-z2-v5-0-6d38b2582169@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737240231; l=2558;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=WsWmSiIz/nvoXKk6dP9ylONnNigrsJDQdxWpfEhh4J8=;
 b=cRcSvQajD464oBnDbG3cM25KgLe4PtAbvmSC2Hf2k3Cq/bJpsp052e7+OLmKFrH2bq7+HebIp
 Gyi7ZqIwy+2AQ0BziQRNIzW+wVwEhHXTn+vngkn/bT1h6WIZulpZ9p3
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for touchscreen controllers attached using the Z2 protocol.
Those are present in most Apple devices.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../input/touchscreen/apple,z2-multitouch.yaml     | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..402ca6bffd3473a1a889ced7890e9836e6a76e45
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/apple,z2-multitouch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple touchscreens attached using the Z2 protocol
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description: A series of touschscreen controllers used in Apple products
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - apple,j293-touchbar
+      - apple,j493-touchbar
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+  apple,z2-cal-blob:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 4096
+    description:
+      Calibration blob supplied by the bootloader
+
+required:
+  - compatible
+  - interrupts
+  - reset-gpios
+  - firmware-name
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@0 {
+            compatible = "apple,j293-touchbar";
+            reg = <0>;
+            spi-max-frequency = <11500000>;
+            reset-gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
+            interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
+            firmware-name = "apple/dfrmtfw-j293.bin";
+            touchscreen-size-x = <23045>;
+            touchscreen-size-y = <640>;
+        };
+    };
+
+...

-- 
2.48.0




Return-Path: <linux-input+bounces-9160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF84FA0AB79
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 19:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FB717A23EB
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 18:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1F01C175A;
	Sun, 12 Jan 2025 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXxNY5vs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29E01BFE00;
	Sun, 12 Jan 2025 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736707302; cv=none; b=kTIZwnXEfS0OGOlqWaeM1NJXlIXt8PuB2//p1fDavIH9aZp0cNRD9pF2MdQObKhbAXFmNw6/97GPjd+TzwHvrCU4INdcyVFEmRygx/1C51XgiK2Bui1bZwPFpPza7uN/JloI1RZhiRAu8PJ0IUkbOAu3cCplhFKXPf+i4oZj+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736707302; c=relaxed/simple;
	bh=4mqO9fFAzT1FG6ss/NQO1jdCRuZdLW3O8dLx4waQ6Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Blf/LrC0+C/HzWtsj58x0MTSs5oNEEsk7/PTPRnxvvNq93ptU8E+7r0dp3EHMCYhYP7jMam7ddL5TVSwP0GAeJhMwic4ZlLLH9YTXHMSlx9p80jz7qKu5PAvV7gxeSIHD9LDo/UstlRwGDzkRFvdlvuOS2OsFqVM1jGlJhKruyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXxNY5vs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D47FC4CEE3;
	Sun, 12 Jan 2025 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736707302;
	bh=4mqO9fFAzT1FG6ss/NQO1jdCRuZdLW3O8dLx4waQ6Qc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OXxNY5vsrOkEsbqwpqaYy4AVp00apThon+0YJEumcVcStXajAg8Ihy/0gWudXw/ko
	 YkruGloWRBOfebYxw31EE8dqR0ld2AsXy7LGqyxIwUwsc/LrUvW2fAyvTUCT498W3h
	 Zs4yKiNstfCc98s77BwHLDeCiEL5G0mBw631exxW/h/arM0O4PdT/YTIrQSbeblP7d
	 TlOvjBw7CcXn0vnBhFrMTEn7NfdliVCR30kwsZLjh/1kAlBmNc9e0vowzNuPhEaH37
	 qCXq70VuuCMsNNAJXChEKokR5PVbLl7mmmPu4YKZ3D6fijgO2ofFjaC1UPPY5B39g1
	 Ytrpnxb/KKcww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B23E7719E;
	Sun, 12 Jan 2025 18:41:42 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sun, 12 Jan 2025 19:41:32 +0100
Subject: [PATCH v3 1/4] dt-bindings: input: touchscreen: Add Z2 controller
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-z2-v3-1-5c0e555d3df1@gmail.com>
References: <20250112-z2-v3-0-5c0e555d3df1@gmail.com>
In-Reply-To: <20250112-z2-v3-0-5c0e555d3df1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736707300; l=2558;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=WsWmSiIz/nvoXKk6dP9ylONnNigrsJDQdxWpfEhh4J8=;
 b=25Hjpk1gYKKA3cczAjUbTxP/t1xDDPDhf/BwB5z0VSF2oRZHPFlSSbB3wM+5uiNt74QF0C0Fa
 h7DjJVV4xS6AyXqhaCWmblMysSCaQbXzBSmkzctG55vDfpfdURY9WK1
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




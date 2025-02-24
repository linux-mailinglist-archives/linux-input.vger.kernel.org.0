Return-Path: <linux-input+bounces-10289-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D590A41BEC
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 12:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20324188CDD7
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 11:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9692586D0;
	Mon, 24 Feb 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4zBdgvR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662482580D7;
	Mon, 24 Feb 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394877; cv=none; b=iYI4WD1VXP44ruoGKU4WWaem904hGan8v66h/lBfipfWu7vGZR23w+9W6s0YHM94PCfpOfpD0He64Yw1Tq9xIeQ1zhDT8VPuUACdhTTYncravePhuA3Z0uIvHHQC9juYpip9/iDcY5rF4GaVsOKP9/GjOBbIegbroXQFOF9vUyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394877; c=relaxed/simple;
	bh=3WCeHKUquon5irHUJD4jzhZkUaSii5krx8N1K9lpJEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkQzYFziQf1mUCJ4giSzaPQWf5AXctRRgoqiUeGomJWWZqhg9Zaf++WV/04uW8S8xBvGfmAeRlRNyZFNZQVUhb8xUh8VA8D0PZulyiUWb/7l2cclKLOlWN8MnNu7jqzOh+m/ZmHZ5cFGnEF+J0wzQxEBmFHBK1c/2UbTIWKbyhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4zBdgvR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFEA7C4CEE9;
	Mon, 24 Feb 2025 11:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740394876;
	bh=3WCeHKUquon5irHUJD4jzhZkUaSii5krx8N1K9lpJEs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D4zBdgvRQCmbgxUuwKQex8rzb8YJuhsTOKVn/VBtmQ0FiYagGnLdwxuvVRaF4TeMU
	 LqJYVrKA41B1v3fFC3EZyt5ZbtLxdiwZOYnBev2IRFYGuxXRaU2CbRTrMDVqyhoyzw
	 3f13fa4kywyxui0ZkGxqP1C40sr4Hu6rLoi0qz2jytScrs/0Cc6Aro+2RtKgbh8A0c
	 r44XSQobNnS1i3kTIGTkh0OIqBUoOkQX6Kr7qHUTzic/Wu1bwrZoXLXaiq4ey32cOz
	 XcEhg2BQGNs/Mb+T5zX5sTG1s+1xiZwZomzLo1QiYugvcKVRCfRtrqB+IE590oDEjL
	 hbkdq0oapEdBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE816C021A6;
	Mon, 24 Feb 2025 11:01:16 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Mon, 24 Feb 2025 12:01:09 +0100
Subject: [PATCH v7 1/4] dt-bindings: input: touchscreen: Add Z2 controller
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-z2-v7-1-2746f2bd07d0@gmail.com>
References: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
In-Reply-To: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740394875; l=2558;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=YsJBZIlUWueL847WfE8oTE2SBEqURcyodFewZWJ1ffc=;
 b=VDrQ81shtQtkLggsNGLzhJX1bELrail/rynND+4lXftYyxvE4uNd/+/B+/KSr6uq3KKS/UnYQ
 bwtjV32DoGaBsF9lmsCa63oXUTkO83H1cim18EO0Vs0PaE5ECqnViUI
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
2.48.1




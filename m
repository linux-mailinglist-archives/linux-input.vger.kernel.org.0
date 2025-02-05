Return-Path: <linux-input+bounces-9799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DACF0A2963A
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 17:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72981168A98
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 16:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1531DAC92;
	Wed,  5 Feb 2025 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaKiVLR9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E6C19258B;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772857; cv=none; b=ObcvdftuYTh3lDjEaYqXBx4HKCsUE5N3AE3DrWA0IDs2dY9qQMcN2gwUqjTu2XcBYCZPv129qQg3uhQWlQ5eUGumZEiQzbNUQtlt1CCP99ONFOdZQYa8KVtLtIins6C9IQMPaPq6W3Ag4Ij8K+ZuWtaLA3PMslUi7mL81NFFc8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772857; c=relaxed/simple;
	bh=3WCeHKUquon5irHUJD4jzhZkUaSii5krx8N1K9lpJEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iL4IJRuDQ5X9rhjzlUtHnFrFFvEqI3ZHxTXvW2CNxqUipwszUmcG+KJfymdLW+SUlnhNubWxui4M7QpNMAgnJAQ33ne6vKJsLzgyZS4AkGOtE0A9BkJFDS5q3JU9DtMsqrpesv9j1E0o2ROusDZ6LhX44RWuqJEdikjwt+xjMRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaKiVLR9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8D8DC4CED6;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738772856;
	bh=3WCeHKUquon5irHUJD4jzhZkUaSii5krx8N1K9lpJEs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MaKiVLR9PJtglvsok8HHlCEQ/Jnjbm02RXX/B24BJszKAIPZwDu8Ud9y63AVE4IP0
	 2uTBM+Q5JPJBqcs0FKeXg/wjdL5WMAhuJSmWk7+5Ywbj+AOgKWahLgTWKKu4t6rwKK
	 43axh8nhSilU7w7de0UQr2eUwmbnm3Ji1MSHjwrZDBdVQattZOYovr52zz4wO0Qq9Y
	 kRGPETu508cXiSPx5DJU3/WaWNGWXEnP6pk1GoRV3P92wvo69obSpL2wkvW1tPUAkQ
	 G/zJEiPAB5J+1SiZ6tDL1tPFYfriPZUujLALrp8zHBn156ZQ1cWrEDCB48QAjPUkEh
	 WRWsw04WJF7oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96150C02192;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 05 Feb 2025 17:27:26 +0100
Subject: [PATCH v6 1/4] dt-bindings: input: touchscreen: Add Z2 controller
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-z2-v6-1-cc60cbee1d5b@gmail.com>
References: <20250205-z2-v6-0-cc60cbee1d5b@gmail.com>
In-Reply-To: <20250205-z2-v6-0-cc60cbee1d5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738772855; l=2558;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=YsJBZIlUWueL847WfE8oTE2SBEqURcyodFewZWJ1ffc=;
 b=P0nOwVrC2TEhvCSXsYluQLtg1ChRx6e4J/55HYolTaLijokWgUeudF/wkqncsKzx08uZ9+Ee8
 Po7Rsn0zhnyD4vWdm4VMjQySuG+eYLX+6dno9UjoJPRyaGRSqpT1/Su
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




Return-Path: <linux-input+bounces-8250-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 457D09D9E82
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 21:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CB7628198E
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 20:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B22C1D63E9;
	Tue, 26 Nov 2024 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p375jSE/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9FD1DE894;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732654094; cv=none; b=dw03nrOroGeRj1sduec2WrPzYEo5Ixw2xHzfjblUW3sVrlxAkkxzyBCSHh8iYeUkqpLBUY5iv94VpuF2PubZkYfeAioLXwaqfF5Pi4mHlQqM4dEBuw2E1UBIyrgC/TCAleXFnwPBSaRuIObGMSYFU2douBTulc5SnIPQlRJ42xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732654094; c=relaxed/simple;
	bh=nPlVVBDGKjV5+b5plwup/oaCwem/vGJJlIuA9WfZlTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u06sTQD1TTv93mUwSryC0BXSyXW/m0EtVU+A2fJOL+WHHICjTch12fOyd1jGuP2QkLFBf7yAQ23O/TLc7djNM8L5SvxovJZG0i3oXpG8xvD+6YJ5iRxfPc3YxrF14S3d+uIVf4s1f5fMwJ8QKasD7375m56x0ql0S9iHWHsPxdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p375jSE/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B69C5C4CED0;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732654093;
	bh=nPlVVBDGKjV5+b5plwup/oaCwem/vGJJlIuA9WfZlTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p375jSE/nhXtMxzvEOS9mugsU2ApN2vVdpuN9R4/WGM07+3cDR4KMSZ1FHNvh1/8L
	 mGU4Yk19FQw3WXOe9K4jdRKyYJqPNlB507wa57oOxm8xes2D0Bn5XIpd//ZpRvDvTK
	 J9k4ZSuTPm2L9ZKhturx9xqqP9qtJbEqZjWtueQQA9dfChBzOi1FhhsZyJwaPNFzEx
	 G5uPkfjBD4ClIrN2Tk7Xq4z/yUDDhmRqKJbnNaeHWXNFyS8ZW1bmlZrEmeKbxV52EC
	 ZAGTz3cNm+KE080l7XHoANzMB7xnijTu5TsR2I8caY3/PaOZZHNcwWpkB9FprjkTnY
	 J6Yd/ECCPBP0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BD0D65553;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 26 Nov 2024 21:47:59 +0100
Subject: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
In-Reply-To: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732654092; l=2804;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=UHvXgMi/23w7qON+PGUGo++6lr9MH2GBkiekDOSsTok=;
 b=v2an5Zj1C0uzlwCBhHF2ZQWwt6rSGPADVo45ZAjcVatoE2WRViXstwZvsJUf7P6F9MtmnBKza
 2GOjGYozUJwDVOHKJNJtRTlkyNCJtsYdABKic9dSMOvOWgu8iwJqldS
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for touchscreen controllers attached using the Z2 protocol.
Those are present in most Apple devices.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../input/touchscreen/apple,z2-multitouch.yaml     | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0387e2178b91d5658dfd60cb44099a8048dc97df
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
@@ -0,0 +1,83 @@
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
+    items:
+      - enum:
+          - apple,j293-touchbar
+          - apple,j493-touchbar
+      - const: apple,z2-touchbar
+      - const: apple,z2-multitouch
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  cs-gpios:
+    maxItems: 1
+    description: |
+      J293 has a hardware quirk where the CS line is unusable and has
+      to the be driven by a GPIO pin instead
+
+  firmware-name:
+    maxItems: 1
+
+  label:
+    maxItems: 1
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+
+required:
+  - compatible
+  - interrupts
+  - reset-gpios
+  - firmware-name
+  - label
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
+            compatible = "apple,j293-touchbar", "apple,z2-touchbar",
+                         "apple,z2-multitouch";
+            reg = <0>;
+            spi-max-frequency = <11500000>;
+            reset-gpios = <&pinctrl_ap 139 0>;
+            cs-gpios = <&pinctrl_ap 109 0>;
+            interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
+            firmware-name = "apple/dfrmtfw-j293.bin";
+            touchscreen-size-x = <23045>;
+            touchscreen-size-y = <640>;
+            label = "MacBookPro17,1 Touch Bar";
+        };
+    };
+
+...

-- 
2.47.1




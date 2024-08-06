Return-Path: <linux-input+bounces-5378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD8948B9E
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 10:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B197A28174A
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 08:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FD41BD50B;
	Tue,  6 Aug 2024 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rKONZjv7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9431BD02E;
	Tue,  6 Aug 2024 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722934168; cv=none; b=CfIuz+vnXWODpQBipymdIyITyZWXFLqR94YpZ9h+VzZfnSnuTv+kA8b9Lbr1dFiaVXZsv9eULkp1dYUqk39qXJa03uMrHXwJ23OMC8d65VkBmX7sXBTMuncqxLzGDLLw+R0wNbqe+Q1qRJAoO5LDR+eQFg/4HXZ8WNzZiKvGKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722934168; c=relaxed/simple;
	bh=tJoJFGQ6IN0XztrjKcoZyFy8IrqvD4zzAblubbny+Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKuZSizfGT6Icv+dLIsr+c2Wf7UrTqkocOahgVWSQV9Kds0G4ETg7KL9wd79G79xJKpd+hOu2lA7e9Kro09VgaVuBKSAabe9VN9RE7oj9ElprCK/Y4ak8Iq/nWdPmxfBlt5EBhieCsZ+SvlQFqhd9LlvhTkyZrWjA6gHurlos8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rKONZjv7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B5F7C4AF13;
	Tue,  6 Aug 2024 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722934168;
	bh=tJoJFGQ6IN0XztrjKcoZyFy8IrqvD4zzAblubbny+Ew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rKONZjv7/XPGBfVjmQBQT1aC+lQ5O6yiy/A1VO+S+Rxxb6U0AouGsRdvV9Olq4js5
	 WpGLN7ZgNJ8EzqAXtJZZWjGg183m+oNn9/9Ds/OiLSwPBGZpvBbhZgQNSxEmKEt9UM
	 JnygT81oLgSyH4EuS4QsEfUvhbZRPV8DBWPfBMqmgqyZ+EswNp93eTQkcHVE3oEXi7
	 65LF+MSp5mGS94uECWoL4VrX8vu1XQtk/bhdm66ihpyCbzy5lJ01fnvkybm71UsTC2
	 +PVfR60hxr5A6oeHsfATMov4BrjWvy9kn0iLaDPw+51nu/LyeXTgoqFoOyhkIN/fIL
	 BX7kWuc/91R6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C353C52D74;
	Tue,  6 Aug 2024 08:49:28 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Tue, 06 Aug 2024 09:48:04 +0100
Subject: [PATCH v9 3/3] dt-bindings: input: Update dtbinding for adp5588
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-adp5588_gpio_support-v9-3-4d6118b6d653@analog.com>
References: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
In-Reply-To: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
To: Utsav Agarwal <utsav.agarwal@analog.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, 
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>, 
 Oliver Gaskell <oliver.gaskell@analog.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722934106; l=2787;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=IDMT5Xee1oJ9GPx4m0/4wO3JYqcHE0m3oSwjk4wtz/Q=;
 b=1VJE7OxfyBh+HyB2sg8jCGAiaPX6IljGy32ThG2UCCSgwOUQ9DJdVWiS64yEjyUaQ1PN3ItWR
 M/7PbvE7P8bCWHc+iIrmLFeRpgnneDx3o+/vrid2ZPlKrw3sItod4ci
X-Developer-Key: i=utsav.agarwal@analog.com; a=ed25519;
 pk=mIG5Dmd3TO5rcICwTsixl2MoUcf/i2u+jYqifd7+fmI=
X-Endpoint-Received: by B4 Relay for utsav.agarwal@analog.com/20240701 with
 auth_id=178
X-Original-From: Utsav Agarwal <utsav.agarwal@analog.com>
Reply-To: utsav.agarwal@analog.com

From: Utsav Agarwal <utsav.agarwal@analog.com>

Updating dt bindings for adp5588. Since the device can now function in a
purely gpio mode, the following keypad specific properties are now made
optional:
	- interrupts
	- keypad,num-rows
	- keypad,num-columns
	- linux,keymap

However the above properties are required to be specified when
configuring the device as a keypad, dependencies have been added
such that specifying either one would require the remaining as well.

Note that interrupts are optional, but required when the device has
either been configured in keypad mode or as an interrupt controller.

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 .../devicetree/bindings/input/adi,adp5588.yaml     | 51 +++++++++++++++++++---
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
index 26ea66834ae2..827d72ece54b 100644
--- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
+++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
@@ -49,7 +49,12 @@ properties:
   interrupt-controller:
     description:
       This property applies if either keypad,num-rows lower than 8 or
-      keypad,num-columns lower than 10.
+      keypad,num-columns lower than 10. This property is optional if
+      keypad,num-rows or keypad,num-columns are not specified since the
+      device then acts as gpio only, during which interrupts may or may
+      not be utilized. If specified however, interrupts must be also be
+      provided as all interrupt communication is handled via a single
+      interrupt line.
 
   '#interrupt-cells':
     const: 2
@@ -65,13 +70,30 @@ properties:
     minItems: 1
     maxItems: 2
 
+
+dependencies:
+  keypad,num-rows:
+    - linux,keymap
+    - keypad,num-columns
+  keypad,num-columns:
+    - linux,keymap
+    - keypad,num-rows
+  linux,keymap:
+    - keypad,num-rows
+    - keypad,num-columns
+  interrupt-controller:
+    - interrupts
+
+if:
+  required:
+    - linux,keymap
+then:
+  required:
+    - interrupts
+
 required:
   - compatible
   - reg
-  - interrupts
-  - keypad,num-rows
-  - keypad,num-columns
-  - linux,keymap
 
 unevaluatedProperties: false
 
@@ -108,4 +130,21 @@ examples:
             >;
         };
     };
-...
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpio@34 {
+            compatible = "adi,adp5588";
+            reg = <0x34>;
+
+            #gpio-cells = <2>;
+            gpio-controller;
+        };
+    };
+
+.

-- 
2.34.1




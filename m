Return-Path: <linux-input+bounces-5542-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6599C9501AC
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 11:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10A4E1F2162E
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 09:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36F8192B69;
	Tue, 13 Aug 2024 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSyB9LG+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732A81898EB;
	Tue, 13 Aug 2024 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723542764; cv=none; b=JyWu6pDiNCT6ikNuk6I2v/S7Xav8lLvUVJoUEHe8FpyuJjCcW17K/lVFTbF/PyUwEd5m/4HPwPnhR6xCMYI3RnemvDoi9pb5k7qI4CAmbi+bxYVGlfHzjb+NIHUcMVJk+dO5xA65zfnOz+V/5F0aHzmheHnTYJAyMzOv5cOuFLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723542764; c=relaxed/simple;
	bh=BLT/Gf70iMGxhhfoB0MrhPoyame+Ks9oeqNTMocq8Dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWydENWRxe5j2TWmydIHN3XA47dhLGtoppK+AOEcFrObUBUaN0Vvg9Z0McPqJpy/5peTjeU1TNjkowW1nuWI32KgmZISrOmpxAIhjf9wAeWf6M8gqR2r2hW1El2986Py4QCmCMg4po2ZbBJrbEP5GVOI3FnwQORgJr9ISvKj8Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSyB9LG+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1317DC4AF12;
	Tue, 13 Aug 2024 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723542764;
	bh=BLT/Gf70iMGxhhfoB0MrhPoyame+Ks9oeqNTMocq8Dg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XSyB9LG+/lndNHJJL3di6g6+8eAQzy0DDGE7HA8YGPvoTISGIrpXg4++D9T6ESUhJ
	 b2YjNGpqSGLc2aC/qz2NfP7RBaD6iMMTsExy2tjo0wWT9bjgchk/e+nVtH444149W1
	 cv3UzwOgoFHzBrOrqS0AQiRSjN1pKPZlSWiiq2aah57YtsbhMItJj/CG0whex82VEC
	 mfXqdMHq5YqAx9cdH+BKfPQTupFSAzRl6jU1Fdx47kekDo4WJCygrxBy6spYswEJgr
	 SiE2sVyIUmjomlX5IIogrp42/VvFBU3kMtipsXUmXaAcD0IE8zizjWnODEmBfpSqm6
	 YIZ4K5wKHBHIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0482EC52D7D;
	Tue, 13 Aug 2024 09:52:44 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Tue, 13 Aug 2024 10:51:33 +0100
Subject: [PATCH v10 3/3] dt-bindings: input: pure gpio support for adp5588
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-adp5588_gpio_support-v10-3-aab3c52cc8bf@analog.com>
References: <20240813-adp5588_gpio_support-v10-0-aab3c52cc8bf@analog.com>
In-Reply-To: <20240813-adp5588_gpio_support-v10-0-aab3c52cc8bf@analog.com>
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
 Oliver Gaskell <oliver.gaskell@analog.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723542691; l=2851;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=zxni+ke8R259oDqwVVzRtBCB7/NKDEt1SGzAW3iTS44=;
 b=Mtcv0z5GVBIilTZ1VsOGVVpBQjyoAgGr65qSRlXeZsP1uKjf3W2oZ4asZJ2ApfW4i/xMWCET7
 JiVMRm+/BlJAczxPQJVboYO+QJbouyP2dopyej8vmk9hdwcFTGQJFj6
X-Developer-Key: i=utsav.agarwal@analog.com; a=ed25519;
 pk=mIG5Dmd3TO5rcICwTsixl2MoUcf/i2u+jYqifd7+fmI=
X-Endpoint-Received: by B4 Relay for utsav.agarwal@analog.com/20240701 with
 auth_id=178
X-Original-From: Utsav Agarwal <utsav.agarwal@analog.com>
Reply-To: utsav.agarwal@analog.com

From: Utsav Agarwal <utsav.agarwal@analog.com>

Adding software support for enabling the pure gpio capability of the
device - which allows all I/O to be used as GPIO. Previously, I/O
configuration was limited by software to partial GPIO support only.

When working in a pure gpio mode, the device does not require the
certain properties and hence, the following are now made optional:
	- interrupts
	- keypad,num-rows
	- keypad,num-columns
	- linux,keymap

However, note that the above are required to be specified when
configuring the device as a keypad, for which dependencies have been added
such that specifying either one requires the remaining as well.

Also, note that interrupts are made optional, but required when the device
has either been configured in keypad mode or as an interrupt controller.
This has been done since they may not necessarily be used when leveraging
the device purely for GPIO.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 .../devicetree/bindings/input/adi,adp5588.yaml     | 40 ++++++++++++++++++----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
index 26ea66834ae2..0721eef7139d 100644
--- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
+++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
@@ -49,7 +49,10 @@ properties:
   interrupt-controller:
     description:
       This property applies if either keypad,num-rows lower than 8 or
-      keypad,num-columns lower than 10.
+      keypad,num-columns lower than 10. This property is optional if
+      keypad,num-rows or keypad,num-columns are not specified as the
+      device is then configured to be used purely for gpio during which
+      interrupts may or may not be utilized.
 
   '#interrupt-cells':
     const: 2
@@ -65,13 +68,23 @@ properties:
     minItems: 1
     maxItems: 2
 
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
+    - interrupts
+  interrupt-controller:
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
 
@@ -108,4 +121,19 @@ examples:
             >;
         };
     };
-...
+
+  - |
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




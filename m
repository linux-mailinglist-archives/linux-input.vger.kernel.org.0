Return-Path: <linux-input+bounces-5559-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E8950D9E
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 22:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2556A1C21A9C
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 20:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726701A4F3D;
	Tue, 13 Aug 2024 20:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFvXBXfQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180E1A4F29;
	Tue, 13 Aug 2024 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579722; cv=none; b=YndhplyLaY0VNmiLnKFNhahibSNNzkQNGpspz3dbugYP/n+YxE9+cexOYJJotUlEP9XiN+hv5zs9CzcHiIGfxd6i+2qDRUKYc700z7WF5YK+/wVBZuTbZ03MRxdioRJZwemU5E5NkzbkVqIK9cqKxtQSLnQwr/wHbuFTBh9uYrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579722; c=relaxed/simple;
	bh=Sw38NxgEBd0FI0cz03ax43Gc8YUQhNKE+vphoIaIiO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrpKDtDGLkblYHBpToLvBO+JEhvcSqrf8bVyhamSahwhLSr9gR6UTQdAS/T4js/5OvxIDb5KQCxCSMc4e2Djv7V7OCsDKy9iQTlyFAPuhHnSANFyFx/aLEcA3k0CEr7UTENpHrxKt3zt3EaoIuiX4WlHrPizdEQW4RuLpRBOMAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFvXBXfQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC08BC4AF0E;
	Tue, 13 Aug 2024 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723579721;
	bh=Sw38NxgEBd0FI0cz03ax43Gc8YUQhNKE+vphoIaIiO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nFvXBXfQwlLQaudarE2/L07pwg+cjjEJGtRbm/kL01/H9wUIy2hnJ1yEVDeQo3RC5
	 VgroC3c5DFg8hvDzyKTTfRr/zL96Hiydayd3Y1Nk0lbJJZeiKy2jZ+o/8rB2PVeRYb
	 EqXJ4FQDB4Zp7Zfh5uI99kmZwhtzzNOHDv+VtFfMm1HUik/472q24TGA44osNYRlE5
	 4h8BekfFj4lwexjBHzAmOLbWFLwJxtEIGrqm5VF6HSxafEJi+v46/V8Wtle5YPBNJ8
	 cg27qH3dDPYoKzSu1heHiAWLCQ8IuYkfvuFZs85si+BagB+JnW2+dRXiKQhC8O5ghR
	 9BRlbk0daXIlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEBAC52D7C;
	Tue, 13 Aug 2024 20:08:41 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Tue, 13 Aug 2024 21:07:19 +0100
Subject: [PATCH v11 3/3] dt-bindings: input: pure gpio support for adp5588
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-adp5588_gpio_support-v11-3-9ea490d6c41d@analog.com>
References: <20240813-adp5588_gpio_support-v11-0-9ea490d6c41d@analog.com>
In-Reply-To: <20240813-adp5588_gpio_support-v11-0-9ea490d6c41d@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723579648; l=2847;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=6COPIRO0bw4RfEE2lJUqSvRth5I5w5rGF5z/Z1lH4ik=;
 b=avdzCcIhKEgUqv4cRAAAVhMdtEs83/HdjZP15P01DzfYjUY6Jg9faU3gJq5D4ArjXKb+unyob
 OT2PUfUCgFpDqk4s7bEjK0CLmhZz4CvmBon06a1naoY3/wFD4cKXZrZ
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
 .../devicetree/bindings/input/adi,adp5588.yaml     | 38 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
index 26ea66834ae2..336bc352579a 100644
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
 ...

-- 
2.34.1




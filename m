Return-Path: <linux-input+bounces-4810-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4640925BB9
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 13:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BAA01F2898B
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 11:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F63719DF44;
	Wed,  3 Jul 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDW5hu17"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF35019D8A7;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004303; cv=none; b=LMzOBHJoaUx22Tl4mm+H/Hpn6U+k29aHDcV+uVkTYCX1B9IQQmquR3oZQGIHEbZX6riO7OSL+ZxN/u4WvagiwzOGEUX36vUH1gPjobxX3Z9zIpHI0mmDDuPx0+I19QKqDTfQt6644euBS2YR/tB1FXFp1Os7fFhO6kzTNI4d+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004303; c=relaxed/simple;
	bh=FUmSJ3hCqUQZpVdVyEjx9kxZ6fyN1xtB8s0g5QGOEwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nK2+D1Ao9BVBP2VhCYbogq3r1YSKI3zQ9IIXHcJUWD5AspZ7weNVVKebzV08SfqTghwNyxUe+6F3aI7pZR7aFgEaYlh4ugNZDxJvdUkGBQ0qS+TbomDFtkCnmg3XaYs4xb/YFyfviYCupCmm0YiQz65/E2K+n3vGSZg79ADbbS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDW5hu17; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFF76C4AF14;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720004302;
	bh=FUmSJ3hCqUQZpVdVyEjx9kxZ6fyN1xtB8s0g5QGOEwg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TDW5hu17btpZvvBazsa/Pg+npcggsqhGUvVtMg5EDn+FtX0B8bSfkrtS3RO/fTASF
	 ABgXqmlgMlJz+/Xtd60Wu4xsak2vE3RX4A9K/vXvaraACnWexRLBUNprYhjg9TT4XV
	 oN9cH+/64JPcI5xC57Z3KrlxD3L8LEbhSvONXp87+yNKY6u81ugXtPcetv+VCYaX4x
	 yzeDh2/eZNsXhWSME/0ERC6GCIhqr3Hx74NHY8eNMmELapS3UfaZztiTXknHsx/OQY
	 WKE76KmqCXsZxNKtiVSLNX4Dj2DzPIVHlGc+zc13+SjszwGyBdiJInLCbOzAuwj0gS
	 dWAT/6851Lf5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52E8C31D97;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Wed, 03 Jul 2024 11:58:16 +0100
Subject: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for adp5588
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-adp5588_gpio_support-v5-3-49fcead0d390@analog.com>
References: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
In-Reply-To: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004298; l=2319;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=tjToYmfL/IEyCDgaXOsMEe4jog3UMGcJT5HUGpTVFL0=;
 b=mHTnfZZzd4M7OG8aN82knWmCDe4h3Ye/4JzKymjrAuucTMwx+XDs9c9mL2A8SUgrfG2KkNFcg
 uVEgfOKNmsHAFmnWG41J0MPhCGXbio5m2/Sgq/p/A/AlrTG4X0XDDJ0
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

However since the above properties are required to be specified when
configuring the device as a keypad, dependencies have been added
such that specifying either one would require the remaining as well.

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 .../devicetree/bindings/input/adi,adp5588.yaml     | 33 ++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
index 26ea66834ae2..6c06464f822b 100644
--- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
+++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
@@ -49,7 +49,10 @@ properties:
   interrupt-controller:
     description:
       This property applies if either keypad,num-rows lower than 8 or
-      keypad,num-columns lower than 10.
+      keypad,num-columns lower than 10. This property does not apply if
+      keypad,num-rows or keypad,num-columns are not specified since the
+      device then acts as gpio only, during which interrupts are not
+      utilized.
 
   '#interrupt-cells':
     const: 2
@@ -65,13 +68,15 @@ properties:
     minItems: 1
     maxItems: 2
 
+dependencies:
+  keypad,num-rows: ["keypad,num-columns"]
+  keypad,num-cols: ["keypad,num-rows"]
+  linux,keymap: ["keypad,num-rows"]
+  interrupts: ["linux,keymap"]
+
 required:
   - compatible
   - reg
-  - interrupts
-  - keypad,num-rows
-  - keypad,num-columns
-  - linux,keymap
 
 unevaluatedProperties: false
 
@@ -108,4 +113,22 @@ examples:
             >;
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+        gpio@34 {
+            compatible = "adi,adp5588";
+            reg = <0x34>;
+
+            #gpio-cells = <2>;
+            gpio-controller;
+            };
+        };
+
 ...

-- 
2.34.1




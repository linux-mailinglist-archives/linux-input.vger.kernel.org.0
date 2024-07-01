Return-Path: <linux-input+bounces-4770-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 885D491E365
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 17:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73B6CB278D2
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 15:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BECD16D322;
	Mon,  1 Jul 2024 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s64otzxt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C0816C86F;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846303; cv=none; b=YkxGcWpcjYosAx0+A5JyNXaYnIRf5GoquvRHgVOIThnozQrPKra1XO82Z3ggEAFMfxH45MuRRPWM8WO/2TbPd1tuWOGbk9wuyPur7MPEflGf5A9VHV1LlVk/8ja9Qc6KCpvaT2cgq7MIeva9fF5WYDFUni1Ff2Xy1pbtiNmyBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846303; c=relaxed/simple;
	bh=h7iGe0Nh7IPjp654fHg/MivCpi9BUQ3tEVx6hM5y4KY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RqF7ZYL7eSaM9P40CiPbm50E6O75UekqLNe/rlSfMzhGIncGZk3NRJURApLy1ciViY0wHyzz9K3aI6CRffFxjMR0yWOvX55extTqpVyXiZR0FQuG8KjRc13Vs6EO2ogyzg0d1NkATUja7+jhKn1vp5VQXfJel4ll7Q7Gil9BAc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s64otzxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57C35C32786;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719846303;
	bh=h7iGe0Nh7IPjp654fHg/MivCpi9BUQ3tEVx6hM5y4KY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s64otzxtlKTKDDSZJwaVIiJJNK4UXnspi14ImzYhUOWOae85KlHO/qTLt6caLUDCB
	 bJQIAy1u+qZyoiJGhuAL4vQOYqbrq4wx99i6HbdgPEJvwfHsUX5JqxYuXF19MV3JdW
	 3dLeVx/FZgzdOj/GexvwPuYTBhwsk9ojORCtKT/YGRRUsIxBm9OyGeTc1qGp/mV73M
	 hyAElEuWJV1nm+SbAL3BUUaHft18s8HUMVT1k8+2S0dwlMYZtOB9Wi//WfK2/tiQEq
	 DJFd+0q9Kcsn66HSmM/1tKn5XoCMY+TB4uAMrg9zXV5oariS7IYf+r048SRSFeGXqF
	 g28nthQb8pyJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B6DC3065A;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Mon, 01 Jul 2024 16:04:51 +0100
Subject: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for adp5588
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>
References: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
In-Reply-To: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719846302; l=1849;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=R/G0DKQvnInMMKOi2Ti6N/j7TpAXEYOccy0wLPhCRJc=;
 b=S6UwSAlomrXIllsnT//Gm6AItJFxmvZCHA+3ptH9mIbPrtpnFw7JXQXJ9x/7Jr0po8RxHyeuM
 6dkgupGl/TMDOhuKDMkWgSUzy6aTIovcjGi/JfjgJ3VdEW5OwibrtAq
X-Developer-Key: i=utsav.agarwal@analog.com; a=ed25519;
 pk=mIG5Dmd3TO5rcICwTsixl2MoUcf/i2u+jYqifd7+fmI=
X-Endpoint-Received: by B4 Relay for utsav.agarwal@analog.com/20240701 with
 auth_id=178
X-Original-From: Utsav Agarwal <utsav.agarwal@analog.com>
Reply-To: utsav.agarwal@analog.com

From: Utsav Agarwal <utsav.agarwal@analog.com>

Updating dt bindings for adp5588. Following properties are now made
optional:
	- interrupts
	- keypad,num-rows
	- keypad,num-columns
	- linux,keymap
The proposed new property "gpio-only" has been added as an optional
property with an additional example.

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 .../devicetree/bindings/input/adi,adp5588.yaml     | 28 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
index 26ea66834ae2..158fbf02cc16 100644
--- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
+++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
@@ -46,6 +46,11 @@ properties:
   '#gpio-cells':
     const: 2
 
+  gpio-only:
+    description:
+      This property applies if keypad,num-rows, keypad,num-columns and
+      linux,keypad are not specified. All keys will be marked as gpio.
+
   interrupt-controller:
     description:
       This property applies if either keypad,num-rows lower than 8 or
@@ -68,10 +73,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
-  - keypad,num-rows
-  - keypad,num-columns
-  - linux,keymap
 
 unevaluatedProperties: false
 
@@ -108,4 +109,23 @@ examples:
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
+            gpio-only;
+            };
+        };
+
 ...

-- 
2.34.1




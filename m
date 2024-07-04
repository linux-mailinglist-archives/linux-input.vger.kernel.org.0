Return-Path: <linux-input+bounces-4848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0822D92744C
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 12:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF1DD280FCC
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 10:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7F61AC235;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpD4FRDA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4D01AC225;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089955; cv=none; b=IrZLpNKbccPGgPnzzKfiZG1ERGE+pLbpTU+JqYkTOEG0nPiQadeHs4Du60h97XNyJeyeAiI7xnEm+jGfIh09XxvD47Nie4JoMTUfZN6bAHYjMdpaPW/ME4Zkvp3WdUJ8/96VTjWNNdxiqoDEAQhHf2DTb+rGXIBG41m0qbrmavo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089955; c=relaxed/simple;
	bh=btyKYgKxulxcREhhqyKc6sMNH2B3Tv+O/a65GEtdop4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jOOTf9n6WKX8rMChNPw0gcNo9UGLiDg0qS7ORlEDlL7Ewp1IrUIRa8iU8U0SvYXRhCDdR3nrqFzzSuW/7RZIt611VLnuLYaES/YB234v0pXSFtadU6TgEZYS4YKYf//Uia9XDa6DXqT77+UkIEkFR/ieYmd21urG61vbRdet8eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpD4FRDA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5764BC4AF15;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720089955;
	bh=btyKYgKxulxcREhhqyKc6sMNH2B3Tv+O/a65GEtdop4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qpD4FRDAbaVyvUL/OXOGxR0hLGQj29pj8wdUTnFugmEB4wuBeZ+MqMPSoNk13G+J6
	 NaHjT+LC3d5o9HjWABcT5GrmU2WrNoyykLTDQsotiPZEjqKqphT75v6JBamNpm+EeS
	 jhhfxFuvVrBNv94HXUQiEj3IXloIwL4yfbLfSz9qnUXbXq34WvuelXQJx3Y31t+3z8
	 b6VKAsHJkNUqsHvIfMGiaxKDqwh9SPzSFrgYO/gMOqVBFC+oEBjiyv8cU/wICvN/tF
	 YfwoyllG8ZW7x7x9TJ3h8WJ08sgoQIqFNyrpw2pEwTzPOo9/8erkSB8b9+tIWzu/XK
	 g3h6YSerc51cw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413B4C30653;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Thu, 04 Jul 2024 11:45:47 +0100
Subject: [PATCH v6 3/3] dt-bindings: input: Update dtbinding for adp5588
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-adp5588_gpio_support-v6-3-cb65514d714b@analog.com>
References: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
In-Reply-To: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720089949; l=2563;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=OMFJbwEMECu/NabLGM/jlM9LLkgSio9rGjjfimXDvFE=;
 b=w0DRxFawt5rT6euOYCLq1XMbhrD5o5CR6egqwE3Z8jaR5wHjnStjwzeRHKnnOUyTEs7tgo1y9
 itLHk6X5J2EDnrPtnP2KYEtaQ4CRBUidUsu1i3e5QykvmyzcVk/LDRh
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

Note that interrupts are optional, but required when the device has been
configured in keypad mode.

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 .../devicetree/bindings/input/adi,adp5588.yaml     | 46 +++++++++++++++++++---
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
index 26ea66834ae2..83d1fe19e300 100644
--- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
+++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
@@ -49,7 +49,10 @@ properties:
   interrupt-controller:
     description:
       This property applies if either keypad,num-rows lower than 8 or
-      keypad,num-columns lower than 10.
+      keypad,num-columns lower than 10. This property is optional if
+      keypad,num-rows or keypad,num-columns are not specified since the
+      device then acts as gpio only, during which interrupts may or may
+      not be utilized.
 
   '#interrupt-cells':
     const: 2
@@ -65,13 +68,28 @@ properties:
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
 
@@ -108,4 +126,22 @@ examples:
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




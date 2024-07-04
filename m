Return-Path: <linux-input+bounces-4865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8346B92784E
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 16:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA4828B3E2
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 14:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6484D1B011C;
	Thu,  4 Jul 2024 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXQNJ/K5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7351B0103;
	Thu,  4 Jul 2024 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103199; cv=none; b=epssv83wSbW3hpJqbRriuYgAsBOOfE0S9smS0YtE1+2zf+V6eYyzlyrFv05uVzqP3gnooG4k4luXDDJRm9vQYqGXXTtVSCBIIzMnmd9nY7jdDKw/BJWy6AvSbR2ggQ0ZM9ixEL7qAwTBcT3bu8P1kCGf07GrBspKf956zMf3LO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103199; c=relaxed/simple;
	bh=I7gIk1P9S6nG2gciBBlkLoH607NzfMspV0b9zqkWr9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOoJcvxY2zKgx44iAqkvnrM8aGt/RvwHw+9odEZtkYm4rTPC2Gefw5OIhuYQAKqdS70SmzKa38wD47BPYI8MtWLkuwQ1fo5WJA9aVofpCQBvXTggCiXv6n3DqdjSjkBawhNrVJI9pl9qm+cIh6o4nGeX17hlSJrNs67BPJPQoaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXQNJ/K5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD7F7C4AF0F;
	Thu,  4 Jul 2024 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103198;
	bh=I7gIk1P9S6nG2gciBBlkLoH607NzfMspV0b9zqkWr9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZXQNJ/K5p4qnTn30/BzCmmPnRxI1MfVRk0jf+2hJ+4kE38kLf/onTFOautxi5AGKT
	 f0zCKfttCqglUspDT9+DXbhjIBl+Zg8LHeQ6nYajRjMxkSeyv6yR6n+gTjorhyy725
	 QEdvYFv+cuwmQD4kgOKoKXUge0K1CErUnYC8HiDDUnRHuxQhnioHvIHT+xL9lTInM5
	 beTaf0m7sjIBDd1ppFCmgnQxClAwRk36lc53dZZWmkFcsSedniKDWslMwtsvaK3a3k
	 HeNlEM/KoZdWky1OJw7xufg77gOE0a5k6+KMn9dk7CiTpGbZF7We0fcc9i5eDaQASz
	 WIoMO+0+1hz7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE571C3DA41;
	Thu,  4 Jul 2024 14:26:38 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Thu, 04 Jul 2024 15:26:32 +0100
Subject: [PATCH v8 3/3] dt-bindings: input: Update dtbinding for adp5588
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-adp5588_gpio_support-v8-3-208cf5d4c2d6@analog.com>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
In-Reply-To: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720103192; l=2556;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=Ra3/HCJMBQdCHapgLF9TJHngpmod+ZLUYz39Zx5T23w=;
 b=gctcYHlXbmcVtUQMIZy8b7CyfVJegJbSWAOh8ARG/WmcsFFdM04FPzu58rwSuYJEovK5yAiYR
 oFB38/kwgslBGqF7W+8e0TjAcpBWM10g8+KEdl10mQOHUQxN1D/I00x
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
 .../devicetree/bindings/input/adi,adp5588.yaml     | 45 +++++++++++++++++++---
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
index 26ea66834ae2..ccb24b8b7566 100644
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
 
@@ -108,4 +126,21 @@ examples:
             >;
         };
     };
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
 ...

-- 
2.34.1




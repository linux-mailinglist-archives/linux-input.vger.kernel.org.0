Return-Path: <linux-input+bounces-5884-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66BA95F7E4
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 19:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EBB8282670
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 17:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C5F1990AB;
	Mon, 26 Aug 2024 17:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJNTUzTI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B28198E6F;
	Mon, 26 Aug 2024 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724692942; cv=none; b=u3jLsYTnKLxWBy3cpaKs6s/mdfXW4WtB5UpjFbNkBkUlfLqkWJbpscaCZ572+US4N23CQhrIKq+jXyue5qhFXS8etgNxQA6DQyzJxPYHkZ1+4uLEZXAAjZ6iO9B/la9nQESRckvmvADJdx4q2fNT87fSbSMsA/urpR2LPTQFa80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724692942; c=relaxed/simple;
	bh=Sw38NxgEBd0FI0cz03ax43Gc8YUQhNKE+vphoIaIiO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyOYwn7rNahYKZ03BqO90zKBkvOTLpQqWRMwy5XfRnaWN2LAv134ZxZSHQz20JZpoGxcHSowWNf+j/Bo1R5ok+b/nvb9iArBal26o4ZE6foJJnltL+f9r4nmV4vC7bDk2XUokeiRIcHsgH0JSCC31fS4veAE9z+JZBfFcVs+2TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJNTUzTI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6388BC4CA57;
	Mon, 26 Aug 2024 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724692941;
	bh=Sw38NxgEBd0FI0cz03ax43Gc8YUQhNKE+vphoIaIiO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PJNTUzTIicWFpI7+JiPAoIt8R3Ge6k1Zu3cvh24JMfUi6fEoSK2mGVByJtFQNCniK
	 AguEU+bT9agZf/kxDQD0n686Ecj9mhJYWThUJWLGZsLIWPDWv8LaFa+a6mrpVKLjcQ
	 z40h3gt+BROneZ1hXC3HaLeKE/2qtXENDWhoB4ttiJynFg67awqaOdW0sw2+W2Jj6C
	 Hcn7NVq3q5Z9HfUIxr70/30gJ9oOHAqVQZkr7f8ZT9IzwemmlKEQEfeLPtpdvxQD4W
	 uqO9PTHPxrBRGTA277K4txv8d6jGAvON1FcryFPG9qljAS1BUvyDOlFACC+OR3xOhC
	 alboczShMY9QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8DDC5321D;
	Mon, 26 Aug 2024 17:22:21 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Mon, 26 Aug 2024 18:22:03 +0100
Subject: [PATCH RESEND v11 3/3] dt-bindings: input: pure gpio support for
 adp5588
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-adp5588_gpio_support-v11-3-3e5ac2bd31b7@analog.com>
References: <20240826-adp5588_gpio_support-v11-0-3e5ac2bd31b7@analog.com>
In-Reply-To: <20240826-adp5588_gpio_support-v11-0-3e5ac2bd31b7@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724692968; l=2847;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=6COPIRO0bw4RfEE2lJUqSvRth5I5w5rGF5z/Z1lH4ik=;
 b=IjWudUKa7aKS1rr/siLsgaP4s7mxSufAJhsuS61xlwozYgJkTayIUxIYehIzoqa9MvvhxzKWQ
 31bsvJ0nRK7CYp023fSA9aSD9GabAgm2nyMwqwKqbwzOclCPwF1xrRF
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




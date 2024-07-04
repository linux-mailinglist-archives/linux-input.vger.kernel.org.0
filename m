Return-Path: <linux-input+bounces-4859-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A99276C0
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 15:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 657911F25AD7
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 13:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEB71AED49;
	Thu,  4 Jul 2024 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoGwRvG9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70351AE86E;
	Thu,  4 Jul 2024 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098239; cv=none; b=fdTpv0iL64OySGDwsGU3R+wH+IQS4U+jreNy5IACcfJexZrqusaYiZJe7b2fLUy0W6ov5b1Fklw2EEvcOBXgLOlLFnGjb8f5fy+1YBaCQzWaes2d5AYRh3tYHry78EY87XGYC1ZmjBkLqq4pcITJgIYXLQmWirL0YTdk4uh/wxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098239; c=relaxed/simple;
	bh=oINsYhT7NF/Wgei6dCm5TiYvPE41JzzV2B2CC4hHUho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwv/92PxbZrpoFDsW/dlh9wIJBq1NjSD+DNfC8n1aiSRnZAySf/ERPG6LZWyGi1Cyd8V2zZy5jAgXYw1rNZpoCXi4y4or/9dSznWlAXyIAiJGpDQQ1Yf0I6G4Lk6ANwfxpzIUCkU0/VwqIdX8q130tnDhhtvAsDt+OY09c+ymds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoGwRvG9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EE97C4AF0B;
	Thu,  4 Jul 2024 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720098239;
	bh=oINsYhT7NF/Wgei6dCm5TiYvPE41JzzV2B2CC4hHUho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DoGwRvG9n6PUZ3Q/F++qFAiwGWCTcDnWPhqbc9Go060qvMfLujpdJ+YzEr4ULNLF6
	 9I8WsX3cNB+iMw8gKLW+HGOT4DwOY2HojN39zdu7LA+rRcA6oJ+jx8+hUGCkn4Im4O
	 ouct4VnTP8DbILmAfpXXL1Wcbezqv0ygythSD1CxTrBaMR2gbxdkmU42mcpn2vVcUq
	 QIXKa2rZWeotMHbiKbdUnZ+qe9cdtqQ6HmRcoZ8mFpisotyPuwbO2PtW51mj7AiKTm
	 6XsX9rRG9F89jF62k428+QpEAl3CCTGlGXPFu/hWyxDB2JhmeMPRbaBaOhFwmmLLhu
	 N3Drnxu43VnDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E069C38150;
	Thu,  4 Jul 2024 13:03:59 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Date: Thu, 04 Jul 2024 14:03:55 +0100
Subject: [PATCH v7 3/3] dt-bindings: input: Update dtbinding for adp5588
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-adp5588_gpio_support-v7-3-e34eb7eba5ab@analog.com>
References: <20240704-adp5588_gpio_support-v7-0-e34eb7eba5ab@analog.com>
In-Reply-To: <20240704-adp5588_gpio_support-v7-0-e34eb7eba5ab@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720098233; l=2571;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=sh5kxWaWTPDhoj+9cSNSDb/To5x40jIzkhKcv9bAB0s=;
 b=QGYunNBcclKpPb9VVbUtY1xwjnsovjF13ANGHaAGFHgvKDbwuEQ3hCIiKjs2VBREbN7C6SKwz
 fObnnKxMINxBN9+17mWsqlhr6n+WiIzcyH+DrCRwtoKTFkk6N3xRXet
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
index 26ea66834ae2..481c37595ebb 100644
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpio@34 {
+              compatible = "adi,adp5588";
+              reg = <0x34>;
+
+              #gpio-cells = <2>;
+              gpio-controller;
+          };
+      };
+
 ...

-- 
2.34.1




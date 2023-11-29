Return-Path: <linux-input+bounces-329-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A07FD4E4
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 12:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A12A282967
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 11:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEF61BDE1;
	Wed, 29 Nov 2023 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="uP89EbkW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DF11707;
	Wed, 29 Nov 2023 03:06:57 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 9F559603F4;
	Wed, 29 Nov 2023 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701256016;
	bh=NNHh2O5OrEdJoEBrrlI3WR9bFXRtApPJeE2ytpFLV9w=;
	h=From:To:Cc:Subject:Date:From;
	b=uP89EbkW275ztvlvlbHJF/Zw4iYhKc3OhWAg+t9RQxbOGa/OGj7uEujUi0HqiBSyH
	 KH+3h/IhCI/tTDmBR+OXHHuUiN6Zy35cT8y5fPId5O/LY7nPfX6zN4kaq6bJgIKrF3
	 PLAXkn8yLhh8eDuG3I6V55ZB6vo8BDa6dVVGEhQYVCRndNBZAQo4CY7teV2ePrS9E/
	 CIgKhugRNe0XrzTaTLSUzpYdrgdKO893kXRz4Jp0rQFfnLBM/eEFHA7qGKa2vWt4S8
	 d+t+8LfQkxSB+vjz1l1gzx9fpGd1UjDedas5MzpAzFVQIwSPAk5MM06FAcKvc91KBC
	 /W88r/cgvOMWw==
From: Tony Lindgren <tony@atomide.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: input: gpio-keys: Allow optional dedicated wakeirq
Date: Wed, 29 Nov 2023 13:06:14 +0200
Message-ID: <20231129110618.27551-1-tony@atomide.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow configuring an optional dedicated wakeirq for gpio-keys that
some SoCs have.

Let's use the common interrupt naming "irq" and "wakeup" that we already
have in use for some drivers and subsystems like i2c framework.

Note that the gpio-keys interrupt property is optional. If only a gpio
property is specified, the driver tries to translate the gpio into an
interrupt.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

No changes since v3

Changes since v2:
- Fix indentation as noted by Rob's bot

- Add Reviewed-by from Rob

Changes since v1:

- Run make dt_binding_check on the binding

- Add better checks for interrupt-names as suggested by Rob, it is
  now required if two interrupts are configured

- Add more decription entries

- Add a new example for key-wakeup

---
 .../devicetree/bindings/input/gpio-keys.yaml  | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -31,7 +31,23 @@ patternProperties:
         maxItems: 1
 
       interrupts:
-        maxItems: 1
+        oneOf:
+          - items:
+              - description: Optional key interrupt or wakeup interrupt
+          - items:
+              - description: Key interrupt
+              - description: Wakeup interrupt
+
+      interrupt-names:
+        description:
+          Optional interrupt names, can be used to specify a separate dedicated
+          wake-up interrupt in addition to the gpio irq
+        oneOf:
+          - items:
+              - enum: [ irq, wakeup ]
+          - items:
+              - const: irq
+              - const: wakeup
 
       label:
         description: Descriptive name of the key.
@@ -97,6 +113,20 @@ patternProperties:
       - required:
           - gpios
 
+    allOf:
+      - if:
+          properties:
+            interrupts:
+              minItems: 2
+          required:
+            - interrupts
+        then:
+          properties:
+            interrupt-names:
+              minItems: 2
+          required:
+            - interrupt-names
+
     dependencies:
       wakeup-event-action: [ wakeup-source ]
       linux,input-value: [ gpios ]
@@ -137,6 +167,15 @@ examples:
             linux,code = <108>;
             interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
         };
+
+        key-wakeup {
+            label = "GPIO Key WAKEUP";
+            linux,code = <143>;
+            interrupts-extended = <&intc 2 IRQ_TYPE_EDGE_FALLING>,
+                                  <&intc_wakeup 0 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "irq", "wakeup";
+            wakeup-source;
+        };
     };
 
 ...
-- 
2.42.1


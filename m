Return-Path: <linux-input+bounces-14714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B575B56BBE
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 21:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 029EE7ABF99
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA912E0902;
	Sun, 14 Sep 2025 19:35:48 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D05E2E040E;
	Sun, 14 Sep 2025 19:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878547; cv=none; b=NUIG0AEjSLbdjCM3HMxnOAZqnGyJqhgAZ4PP1xUChrsR4cLKCJG3A2qMiz1Y6ZIL6xAQ1wnRhkW99M4bP9uSCWq5FMbxVG2hgGyhZsUW5eFfVYRp/nnXJutrgTFIuFK1vaAhFGE2Natt4yLKx08yTFKA8sRzRG6HSb79jTdjfJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878547; c=relaxed/simple;
	bh=aTTK8wXZDxPXBF8SHgvVkxik6q6jd8mnQIwiJTIgEr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gb5v7AYndkOKckArQ0vLI57O49gMk+vbBsA99AYBkCOvTYBOGfjMak0mp0BC1n8HvphMiOyUBjzUJNf4ntswidqsarpxQd9rkm+g77rlVjCxh0FvnIP8pmlZyAKWbaYvoMuhU/0V1SCW69f+S0QVVVhrS3CrWRBWjYJ1d6riRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 58EJbPsL010603;
	Sun, 14 Sep 2025 19:37:25 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 58EJbPVQ010598;
	Sun, 14 Sep 2025 19:37:25 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v4 2/8] dt-bindings: mfd: fsl,mc13xxx: add buttons node
Date: Sun, 14 Sep 2025 19:37:17 +0000
Message-Id: <20250914193723.10544-3-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250914193723.10544-1-akurz@blala.de>
References: <20250914193723.10544-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a buttons node and properties describing the "ONOFD" (MC13783) and
"PWRON" (MC13892/MC34708) buttons available in the fsl,mc13xxx PMIC ICs.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
index 007c2e3eee91..d2886f2686a8 100644
--- a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
@@ -39,6 +39,58 @@ properties:
   interrupts:
     maxItems: 1
 
+  buttons:
+    type: object
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^onkey@[0-2]$":
+        $ref: /schemas/input/input.yaml#
+        unevaluatedProperties: false
+        type: object
+
+        properties:
+          reg:
+            description: |
+              One of
+              MC13783 BUTTON IDs:
+                0: ONOFD1
+                1: ONOFD2
+                2: ONOFD3
+
+              MC13892 BUTTON IDs:
+                0: PWRON1
+                1: PWRON2
+                2: PWRON3
+
+              MC34708 BUTTON IDs:
+                0: PWRON1
+                1: PWRON2
+            maximum: 2
+
+          debounce-delay-ms:
+            enum: [0, 30, 150, 750]
+            default: 30
+            description:
+              Sets the debouncing delay in milliseconds.
+
+          active-low:
+            description: Set active when pin is pulled low.
+
+          linux,code: true
+
+          fsl,enable-reset:
+            description:
+              Setting of the global reset option.
+            type: boolean
+
+    unevaluatedProperties: false
+
   leds:
     type: object
     $ref: /schemas/leds/common.yaml#
@@ -159,6 +211,12 @@ allOf:
             const: fsl,mc34708
     then:
       properties:
+        buttons:
+          patternProperties:
+            "^onkey@[0-2]$":
+              properties:
+                reg:
+                  maximum: 1
         leds:
           properties:
             led-control:
@@ -187,6 +245,18 @@ examples:
             fsl,mc13xxx-uses-rtc;
             fsl,mc13xxx-uses-adc;
 
+            buttons {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                onkey@0 {
+                    reg = <0>;
+                    debounce-delay-ms = <30>;
+                    active-low;
+                    fsl,enable-reset;
+                };
+            };
+
             leds {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.39.5



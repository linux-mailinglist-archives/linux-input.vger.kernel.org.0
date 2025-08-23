Return-Path: <linux-input+bounces-14271-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0CBB3294E
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 16:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B8647B9CE5
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 14:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB626268C55;
	Sat, 23 Aug 2025 14:40:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5656025E471;
	Sat, 23 Aug 2025 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755960002; cv=none; b=uR0Sb63/o8qH1upXEV2ap3QKSa+iLOCAWW5i1XrNC6CPFcbWoC1/kNDyaM/05KFQaMXeRVaB0f0XcwFSc0ZYTht/ChR59enMcY4i8YWC5O87bSTx6XQ0+D2P3Y3FSNAxBZCaFjo6JhKHb/SJQ+9nhVWs+K048A3epHIAL57KCXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755960002; c=relaxed/simple;
	bh=yAqUi0vUkFv1gPM5Ui24XB+h4cFyRAn//u5F7iaviZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=um7Qf1UvT9gWHvjPZJTC0MiSFa2iTqNs1S7jettdRv8KG5dFGD/LC6Ul151N857tpy3uHtIYnCf9UVNth6AOvzkIwOjF+S0Ht+4R2NJVZB4w/jB55aGwGNQJA3l9bcsoYxLeIVRezPR93+qPGMXy3IJDufb3FBLz07HaKjIlXhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57NEit5U012747;
	Sat, 23 Aug 2025 14:44:55 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57NEitlq012741;
	Sat, 23 Aug 2025 14:44:55 GMT
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
Subject: [PATCH v2 6/9] dt-bindings: mfd: fsl,mc13xxx: add buttons node
Date: Sat, 23 Aug 2025 14:44:38 +0000
Message-Id: <20250823144441.12654-7-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250823144441.12654-1-akurz@blala.de>
References: <20250823144441.12654-1-akurz@blala.de>
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
 .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
index 94e2f6557376..761267b42c85 100644
--- a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
@@ -39,6 +39,41 @@ properties:
   interrupts:
     maxItems: 1
 
+  buttons:
+    type: object
+    $ref: /schemas/input/input.yaml#
+    description: Buttons
+    properties:
+      reg:
+        description: |
+          One of
+          MC13783 BUTTON IDs:
+            0: ONOFD1
+            1: ONOFD2
+            2: ONOFD3
+          MC13892 BUTTON IDs:
+            0: PWRON1
+            1: PWRON2
+            2: PWRON3
+          MC34708 BUTTON IDs:
+            0: PWRON1
+            1: PWRON2
+
+      debounce-delay-ms:
+        enum: [0, 30, 150, 750]
+        default: 30
+        description: |
+          Sets the debouncing delay in milliseconds.
+          Valid values: 0, 30, 150 and 750ms.
+
+      active-low:
+        description: Set active when pin is pulled low.
+
+      fsl,enable-reset:
+        description: |
+          Setting of the global reset option.
+        type: boolean
+
   leds:
     type: object
     $ref: /schemas/leds/common.yaml#
@@ -119,6 +154,10 @@ allOf:
             const: fsl,mc13783
     then:
       properties:
+        buttons:
+          properties:
+            reg:
+              enum: [0, 1, 2]
         leds:
           properties:
             fsl,led-control:
@@ -137,6 +176,10 @@ allOf:
             const: fsl,mc13892
     then:
       properties:
+        buttons:
+          properties:
+            reg:
+              enum: [0, 1, 2]
         leds:
           properties:
             fsl,led-control:
@@ -155,6 +198,10 @@ allOf:
             const: fsl,mc34708
     then:
       properties:
+        buttons:
+          properties:
+            reg:
+              enum: [0, 1]
         leds:
           properties:
             fsl,led-control:
@@ -183,6 +230,17 @@ examples:
             fsl,mc13xxx-uses-rtc;
             fsl,mc13xxx-uses-adc;
 
+            buttons {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                onkey1@0 {
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



Return-Path: <linux-input+bounces-13167-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1749AECEA1
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 18:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E613F3B4025
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 16:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1752185AA;
	Sun, 29 Jun 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8hHMycJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377BB5227;
	Sun, 29 Jun 2025 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751214344; cv=none; b=JBHhktHepK9Dp2CmiahLxCTnABIZL60JKv0CMkeRYuRUZUste9MMRvXX/pJYr3KlpKlSp9rl8mbI3K353Mvj90NjxNFRzNj0hAZUpFFGqwE7e1jncm1VehF3msx55Et95pD2WyQ3448PUil1l/pmftweB2dP6U5X5OJ6LvWmBx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751214344; c=relaxed/simple;
	bh=VzC5+8Yx2Fp/7c1rhewqiH0aBG687UtNIr6k9EYVnPg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W/U2wCzGJVpTosADEBr52z4X2u/iflLOO8akNyZ99H89DVGfOq9Z8va0OQvkr0kmqcxMR4QidRuIiFwOiUTDJnjns07CY7vP0yHTuxkog2OuXgw3AFQ+kSI1QZfEGJKmAA1Y3xNLTktwkrC2L87xm9ARBhgpsG2aKKaGjbr3Tlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8hHMycJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ade76b8356cso267476566b.2;
        Sun, 29 Jun 2025 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751214341; x=1751819141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8INUcl0PtiikOd5/1IGf09GJC42lrmFmT2c+1bjVqc=;
        b=R8hHMycJtyGJ6Q4sPORVoOacMgS17NRcTiGoCD73OCJhJdP8cptYHcavy9GnlL8rPM
         If9+k2B8VZCOulIDNp24hHSq5Dhqn5LzftxXdCVrVEcpvfEFdMmDIVRU7DC7IPOez371
         ibbZvdkDxraIFAL6udyUmCPLu1fhhoEDKvt4p6h8N6gMsz3Oz87DeAh1HM/EnK7g7DZf
         2H7jHz/Nt4ui4jgwKUyxP6p3wVGILkTy8qWq7pxIt93LJzD2Q2U9Js0wBv6qdUZR9P6g
         K4CcDxoEGBlGHyGbHcaL04FLIJFvcylutRvrV/ZeW5a1V2ia1HCJLTv+P/9YqJLg5sQr
         9+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751214341; x=1751819141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8INUcl0PtiikOd5/1IGf09GJC42lrmFmT2c+1bjVqc=;
        b=U4jtZGZ6s40gzrgjTJeaw1Kj5/BD4lp/HzBg5tUenwVMFbihtXvEdop79a+enIBzUv
         DV5dMkvReBAtULozuctuO10nMTxTYlboRH16NuWxCn2/Ob70oJiQCPl2f7E5tGuHc85I
         lEJBk4hM+CVPXNnDpXjbAuxFfnj5bZ1U+vIdsgCfPTZOpIlu2q/FtqHonzJAoTtfvpjw
         fyDJZ3XyxByBwAkGSC20PYjco8CBR82YnGkwfDaKOSpThg/9qax6UyRSR1AuzPZ7Q8b1
         YhHqHQ9BeqsXddJdL6elg8pZqq9rR172BkBmIfykxyve24u1+YArn3l5/BPEc6hhg1jr
         3OrA==
X-Forwarded-Encrypted: i=1; AJvYcCULMD5GsTgev/EN0aXMtHz41d+EbEO6kew2BbNS71cAYQ/Hxfx2MqOLwH9Gwo31c3JWB3XnKa3dg9+ksMqx@vger.kernel.org, AJvYcCVcgE6K/d1BO19aSPuV/tAMVZjK1s7QsX3KZjddspdXExIR85SoRdapKx6c/07wDsYss8pVy1SYcE2H@vger.kernel.org, AJvYcCXpHlMkQ0twqnOKduPPUmfy/R1HqXqzkv4XnOfLXH7/FmjzGupc99BEuCcxPHt2R0GVasY67PNqb4vOmck=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoIG8ewn0SFy3xvWsFTV7m3g/eqjcJXjP70j5Tq5e5BN0LMyIT
	RXEeClnMxlgEha24NGTs0J9xCnWn/XSlKMmM20cHUXCqHLUpsXbkjsz1
X-Gm-Gg: ASbGncuYSmHAWYhweKu0j7o0TV3oiDfsYEAX8VHNniv4HVW7LDTmSfPHlQfMdsNN1BZ
	nzeQFwnHMqVjFHIgQ0IFuDBU7sYCY42opkGu3QV9/wq4yy/haX4pVn/xX3lYKo43/L4JVixw771
	MGSivReoSHKDnrIuMXhiG/TnobdYpzrc7mmI96niH62Ux2VHmU90IRZO0DSGsuOKIQ0VmH4Pe2M
	nLYAmg4sjX9rCa+HCoHlcXQafwsxnE84u8keuwcNQIk2Zp2zWADdBYatYsE9L9i2O/E0z6e0OwO
	KU/d+QZ4qxlGZUqzbobEkp4cie77Y+8uxc13vT7RCXihFh9Uus2kNYdQ/ALfNFEwaghmvrY7tua
	wAsde8seD/gsFiPs9XZS3KzCBfW3hsnOwEYyWlNiHdInltA==
X-Google-Smtp-Source: AGHT+IGQ6kOPKoMJrJYat5DnXyilwKNMiwiHAXtv/Et71vYS1a5qs+54hAabuynrgFykq6d5GrdIUQ==
X-Received: by 2002:a17:907:9715:b0:ad5:1c28:3c4b with SMTP id a640c23a62f3a-ae3501cd6ebmr938369166b.52.1751214341357;
        Sun, 29 Jun 2025 09:25:41 -0700 (PDT)
Received: from kuzhyl-vm.home (46.205.205.61.nat.ftth.dynamic.t-mobile.pl. [46.205.205.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a02csm514505466b.70.2025.06.29.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 09:25:40 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Janne Grunau <j@jannau.net>,
	Igor Opaniuk <igor.opaniuk@gmail.com>,
	Neal Gompa <neal@gompa.dev>,
	Jeff LaBundy <jeff@labundy.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/2] dt-bindings: input: touchscreen: add hynitron cst816x
Date: Sun, 29 Jun 2025 18:25:22 +0200
Message-Id: <20250629162523.291887-1-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Hynitron CST816x series touchscreen bindings.

Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---
Changes in v8:
 - Use linux,keycodes to map touch gestures to key events
 - Refactore binding properties based on feedback from Jeff LaBundy
   and Krzysztof Kozlowski to align with official documentation

Changes in v7:
 - Introduce the gestures field along with its sub-fields
 - Make reset-gpio property optional
 - Extend main description
 - Remove "touchscreen" reference

Changes in v6:
 - Fix minor tweak adviced by Krzysztof:
 - Move additionalProperties field after required

Changes in v5:
 - No code changes

Changes in v4:
 - Add Conor's Dooley "Reviewed-by" tag

Changes in v3:
 - Rename filename to hynitron,cst816s.yaml
 - Update description with display details

Changes in v2:
 - Apply pin definitions and DT headers
 - Use generic name for DT node
 - Drop status field

 .../input/touchscreen/hynitron,cst816x.yaml   | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
new file mode 100644
index 000000000000..0d358463d7f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynitron CST816x Series Capacitive Touch controller
+
+maintainers:
+  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
+
+description: |
+  Bindings for CST816x high performance self-capacitance touch chip series
+  with single point gesture and real two-point operation.
+
+properties:
+  compatible:
+    enum:
+      - hynitron,cst816s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  linux,keycodes:
+    minItems: 1
+    maxItems: 16
+    description: |
+      Specifies the numeric keycodes associated with each available gesture in
+      the following order (enter 0 for unused and reserved gestures):
+      0: Touch
+      1: Swipe up
+      2: Swipe down
+      3: Swipe left
+      4: Swipe right
+      5-11: Reserved
+      12: Long press
+      13-15: Reserved
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/input/linux-event-codes.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          touchscreen@15 {
+              compatible = "hynitron,cst816s";
+              reg = <0x15>;
+              interrupt-parent = <&gpio0>;
+              interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+              reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+              linux,keycodes = <BTN_TOUCH>,
+                               <KEY_UP>,
+                               <KEY_DOWN>,
+                               <KEY_LEFT>,
+                               <KEY_RIGHT>,
+                               <KEY_RESERVED>,
+                               <KEY_RESERVED>,
+                               <KEY_RESERVED>,
+                               <KEY_RESERVED>,
+                               <KEY_RESERVED>,
+                               <KEY_RESERVED>,
+                               <KEY_RESERVED>,
+                               <BTN_TOOL_TRIPLETAP>;
+          };
+    };
+
+...
-- 
2.34.1



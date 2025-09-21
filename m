Return-Path: <linux-input+bounces-14952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56FB8E22A
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 19:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C676A4402EC
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 17:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57957242D87;
	Sun, 21 Sep 2025 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rWdiQ7zE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6363B261595
	for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758476040; cv=none; b=Kd2kKtNkggYc3cv3WPYKYfYpJnnSy0JIk1KvWqXXg6AQYYW7GVTTkANopKgmEMnnYVe3EPJoISY6Ch6or9Dfq2FYxymG4jHHbCL4WFNoBdPk2u46sAqgQziGrqZQSGtGMhj5Ud+pO9GuzMNfa2Pfy3PrPB0IpbGHH+40p/ytQdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758476040; c=relaxed/simple;
	bh=s0wtb16+WYtZYmqbQuhwOOKqXNOpQ/C9gSRHXahTcjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GhN/E6hLP5Cx1nifWjkzkIWlqWzKsFaxrjL5+NZIS8ZENiXR+defKwMe/mgO0mgQli/5NpmZV/AxitAtPKMSFjrqNGHM1tQhpW3P6I9Kk2vDXBtXsnueP2UX1dzb6wjMzS+UJbnKYN8yGyxRJOkBpkA6wGiO73DZJQib679FR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rWdiQ7zE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b07d4d24d09so610055966b.2
        for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 10:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758476036; x=1759080836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VlMcTg6rrPiR0yGZcHHVwQeIzN9BkasZ+MFuim5ZowE=;
        b=rWdiQ7zEHhlmglpEAtyeyqXk5E30jLzwySonWdlo+smYdaGi5IsTP46UJSyqfEh/4R
         CCo32hun4jgPmL6qKY2B6olEC97StMsd6m1AFKc4/Ve5gjc9gEl3iNcjKAqlOb86NCvv
         0+MGMs+QE+NUs4uR9NZdj89wZIyxsRDTnBEVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758476036; x=1759080836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlMcTg6rrPiR0yGZcHHVwQeIzN9BkasZ+MFuim5ZowE=;
        b=tro39o182+2ut5H4EpchS8j6Yp5FeZKEjgHqAnhnf7wkwfEq7K+shaEO5WNW54rWP0
         MRG1n8rZEvNGKys9YK5Why3aRy0/lBq8sH4V2gpNHF+MHkUdKyM2wzr+9TcmFPdjwhOc
         Dgd0XwqBgvlxiPcADaH5mWKTiE+KYtlDiq4qFFlMih4S7sqbFJh+vdAuHa4j/DDavqzo
         11onplr5etEwHqM39wSVfYue0UALWmScDxGWjfAAxfJbiKzMXHV6mO3pcYZ0FXs54d9m
         5lxIsbZ3Lv4eC23s/EBQqIKfTaXTfFcZGZtnlU/XlWC8n65z3pCsCe40MHf7TTasHL1p
         moDA==
X-Forwarded-Encrypted: i=1; AJvYcCXWQtU+m8AH3hRqns1dLnJHZdxw5/deEcQh4OSP47ByaCZWF3pTw+om/fB/Etwcwhpw9DM1sJG0Ahp9HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQhPpf+5htHLTMLf1ptw5YxiXG+AbtuITtR1kZKN5cSKWshIt
	beCptb0fwLutvDFSFH4IPii4vV1IUc7PJ3IV17kZyYkkrvC4h9ffKOVcB8GwBY0bDNE=
X-Gm-Gg: ASbGnctSpb70v5XtzKWZTB58tTJ8+hH2adrxUqpY+SDY7P9uLkn2+rtk/lEioGNQEPW
	K8H0FM9Nn9+DgZQdfAY9EmjFZUfzBgg68uguQtr/D+kqi+LDtp+amkWXn4yMclq++moubzUiyQK
	YUuUnOH0UtqHo1Vy221qxsPY5K2b3LWmI4Gzl4JCKqoaClqhZd6dCMv5JPfNKVAUKRoe3u/LzSK
	VngLj0bM2c8gL0dTAYRJZCWxBVQTZ5pHHrYrGBdX8JSavpfE1jRNY9Jxee1GiJou7lop5I39h7b
	n2orqtHl3WbAQa4+bFf/IOpN2aLQ3TFtV0kOXEx0PV/ZRkppGc5tkxwLoGuNJTw6axUjYEtGGY0
	frobM02uPfKhUs1wGrgRN4Nhowne8iiFO67TlDr+d0/JmJJACRMHfBAtgmKcewVI7nBVZwWFxzP
	LMhhu3RAMcrJPs9vwnjkvebZlzn5kqMBI2GbMAu1xrntZqqIAtRBd2luVzZimuqP7WUYlErLf4k
	iM=
X-Google-Smtp-Source: AGHT+IHxamUkl30RF3owHcmhG83KfUakWGC62WX2ylNqw9YsGCV4aiWsbPmH7Wal0ci05bSxKrJ0Nw==
X-Received: by 2002:a17:906:a99:b0:b27:95f9:e20b with SMTP id a640c23a62f3a-b2795f9e3camr589661166b.33.1758476036375;
        Sun, 21 Sep 2025 10:33:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2928cd31a6sm324347266b.102.2025.09.21.10.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:33:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	sebastian.reichel@collabora.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: touchscreen: convert eeti bindings to json schema
Date: Sun, 21 Sep 2025 19:33:42 +0200
Message-ID: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert EETI touchscreen controller device tree binding to json-schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Add deprected to the compatible string and attn-gpios
  property
- Put const 0x2a i2c address for reg property only in case
  of not eeti,exc3000-i2c.
- Put false the attn-gpios property in case of not
  eeti,exc3000-i2c..
- Drop example for eeti,exc3000-i2c.

Changes in v5:
- Move bindings into eeti,exc3000.yaml
- Remove eeti.yaml

Changes in v2:
- Added in v2

 .../input/touchscreen/eeti,exc3000.yaml       | 33 +++++++++++++++----
 .../bindings/input/touchscreen/eeti.txt       | 30 -----------------
 2 files changed, 27 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
index 1c7ae05a8c15..517ec721e724 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
@@ -9,39 +9,59 @@ title: EETI EXC3000 series touchscreen controller
 maintainers:
   - Dmitry Torokhov <dmitry.torokhov@gmail.com>
 
-allOf:
-  - $ref: touchscreen.yaml#
-
 properties:
   compatible:
     oneOf:
       - const: eeti,exc3000
       - const: eeti,exc80h60
       - const: eeti,exc80h84
+      - const: eeti,exc3000-i2c
+        deprecated: true
       - items:
           - enum:
               - eeti,exc81w32
           - const: eeti,exc80h84
   reg:
-    const: 0x2a
+    maxItems: 1
   interrupts:
     maxItems: 1
   reset-gpios:
     maxItems: 1
   vdd-supply:
     description: Power supply regulator for the chip
+  attn-gpios:
+    deprecated: true
+    maxItems: 1
+    description: Phandle to a GPIO to check whether interrupt is still
+                 latched. This is necessary for platforms that lack
+                 support for level-triggered IRQs.
   touchscreen-size-x: true
   touchscreen-size-y: true
   touchscreen-inverted-x: true
   touchscreen-inverted-y: true
   touchscreen-swapped-x-y: true
 
+allOf:
+  - $ref: touchscreen.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: eeti,exc3000-i2c
+    then:
+      properties:
+        attn-gpios: false
+        reg:
+          const: 0x2a
+      required:
+        - touchscreen-size-x
+        - touchscreen-size-y
+
 required:
   - compatible
   - reg
   - interrupts
-  - touchscreen-size-x
-  - touchscreen-size-y
 
 additionalProperties: false
 
@@ -51,6 +71,7 @@ examples:
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
+
         touchscreen@2a {
                 compatible = "eeti,exc3000";
                 reg = <0x2a>;
diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
deleted file mode 100644
index 32b3712c916e..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Bindings for EETI touchscreen controller
-
-Required properties:
-- compatible:	should be "eeti,exc3000-i2c"
-- reg:		I2C address of the chip. Should be set to <0xa>
-- interrupts:	interrupt to which the chip is connected
-
-Optional properties:
-- attn-gpios:	A handle to a GPIO to check whether interrupt is still
-		latched. This is necessary for platforms that lack
-		support for level-triggered IRQs.
-
-The following optional properties described in touchscreen.txt are
-also supported:
-
-- touchscreen-inverted-x
-- touchscreen-inverted-y
-- touchscreen-swapped-x-y
-
-Example:
-
-i2c-master {
-	touchscreen@a {
-		compatible = "eeti,exc3000-i2c";
-		reg = <0xa>;
-		interrupt-parent = <&gpio>;
-		interrupts = <123 IRQ_TYPE_EDGE_RISING>;
-		attn-gpios = <&gpio 123 GPIO_ACTIVE_HIGH>;
-	};
-};
-- 
2.43.0

base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
branch: drop-touchscreen.txt


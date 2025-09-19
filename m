Return-Path: <linux-input+bounces-14892-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E782B884C9
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 09:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1CEB3B6147
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 07:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2492F2FE05D;
	Fri, 19 Sep 2025 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UF3Dw8nY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDB32FD7B8
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268710; cv=none; b=LMmpYXe5rxarlt3DJhFwhetR1CYgLz4XQHWvdi9ApdseKfbLpgX/fSg2fda5rIPM5Er6FKzvSs6kjLkmXsQkxBsgpzlJ9s+vGDs0TXOCMt8LlZ+xZJ1o/x2pXeOSGm/UkF5+f5jzo6RdjyRYTgL30hj18NQaB4WdoazfVs/DHqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268710; c=relaxed/simple;
	bh=Lj2uEzG5agUE2RHJzdnwo1ffUTOyQQbwoO2pzyDmVtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XjXUR2kEm2aGPZc4cwZMUWSET9ja+L/VQ8UugHloi2zY77Xs0rNcU3PYcCE9ucEYcLEH0T8G89RxUdWNpvxqnhAS67SReMWv35O1fk0GbL+43/5/WKJ09qtuxjTs88wX9C0p1sZjc9H+nJdYHsfFdekrVWEwIKEddNY4bvsKzTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UF3Dw8nY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b07c2908f3eso273038566b.1
        for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758268706; x=1758873506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p9578/uirUkkp2k5bMsZp24lZhySSSKPvOmDT8OQ4lc=;
        b=UF3Dw8nYii3PdfipIkhFhreSDlim9GBTzzez9Dfrg28GPhiDnTN4aazm688GWR+EVE
         RQYlxtz4aWdgzq6bpA9gkHRNNxF36Ra/ryhX+VIJSvHCsBim8GZmb9xCxEscU7hOCvdo
         Ajq6jsp/v2yPhUllk5SxN7F7TZo8V+pC1A/ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268706; x=1758873506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9578/uirUkkp2k5bMsZp24lZhySSSKPvOmDT8OQ4lc=;
        b=vyF0KPkMf1u3l1oNn9CmIhJKJmKxUaJ95am+baA9azorTt3F7izUWKa/jE2j5NVLs6
         LG8/9MeGagNMNgo3vkjlN+rtfWcoXYMXDR1QTIYpPo4TiiqErx4swgakZqC4KE00F7Jq
         kCTHHlf+RfJAkwohzNZjtPW8KQApeV73n98aCFpxlHAkeg5VbU7jgpBV0eolbo4AslCH
         q9v9WLu6SDeMV3Rrfx/jJPmtE/ATOI/So1t1WEIjUj/Kbwe8h6cJiO0ETaN1Ct8k+c4T
         vkXUsGcWI7AvQyMC567D1/QqXKFVo/MDG18i8FOIBzzFkCEcxINICsiF7RxvQgrxyQur
         dPGg==
X-Forwarded-Encrypted: i=1; AJvYcCWr1+dABlwQBHb40tPpsIS0f8D6uG5WvR0pVcQLRlMi/O24hqyFGjrh8qX/phkSE3Q8hsbG8w+7zB0cvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVvdGTt1NBuAD/u6Juc/Ko+ZCZGJRCA5ihDcrZqw9MG+emEsNX
	aH5avhrVEEihMinqQdGqBVPvU2TnAAO05zx9CG7OEb8XJrsk7McHQ/LNrPXzHoGL2vdAAx6Zpmy
	2GjdC
X-Gm-Gg: ASbGncs/aTjNnaDasGeZS2jf5q/lNMSf8l4VaGvcbju1nxQ8c4Ag4V24U431VOUjmg6
	NJZg+Qo1gReAktUDpBYN89oqX5o+YgPRKgRa4iUMdgSTO0Y44geyLp5NqdWnuI3Oa6BtYZMwecV
	IHqtIvOEVCxPXtfRy+qi+/k2PIMvL17EcXGamCymQFiuyVcD6RCK/t1czR4UrSrM3ea0CxGbNM3
	ID7r4rdacVQhDD8x090s/uW482taH+pIjAaoLiHd/15+3dT6Kg70VTXo0KuQciVmzrQA0wEpSxJ
	U9Ns4vu62Eos+ga7rXWbFHaA84y6xJvcfp3JuZCN8N82lf9lldBRyueTisMi+5wbc3gWdbZMNFJ
	U2rfyY4cXKX8fubo6Js0hQepKzI7szverahichu9Y7uNNb/jw4jqkvwoXu2Tj4sQuw2BRRtD4x4
	8jcdkiDM8rFgZidEvIyT7iXe1Ap9p2IsOE0tw1Kb5aCGuVz8jRDINzIrSeSddLk75e
X-Google-Smtp-Source: AGHT+IEnosLPm4/115DGDj89OoPe3E2TW7ffbXpMYL8GXe41HW9RHehoRuoXYtnX+dYEmz19esIzgA==
X-Received: by 2002:a17:907:3fa0:b0:b04:26f2:b83 with SMTP id a640c23a62f3a-b24f3e58447mr184128366b.35.1758268706330;
        Fri, 19 Sep 2025 00:58:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc890cc98sm384693466b.49.2025.09.19.00.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 00:58:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: touchscreen: convert eeti bindings to json schema
Date: Fri, 19 Sep 2025 09:58:09 +0200
Message-ID: <20250919075823.2557865-1-dario.binacchi@amarulasolutions.com>
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

Changes in v5:
- Move bindings into eeti,exc3000.yaml
- Remove eeti.yaml

Changes in v2:
- Added in v2

 .../input/touchscreen/eeti,exc3000.yaml       | 41 ++++++++++++++++---
 .../bindings/input/touchscreen/eeti.txt       | 30 --------------
 2 files changed, 36 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
index 1c7ae05a8c15..13b865d3ee58 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
@@ -9,15 +9,13 @@ title: EETI EXC3000 series touchscreen controller
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
       - items:
           - enum:
               - eeti,exc81w32
@@ -30,18 +28,34 @@ properties:
     maxItems: 1
   vdd-supply:
     description: Power supply regulator for the chip
+  attn-gpios:
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
 
@@ -51,6 +65,7 @@ examples:
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
+
         touchscreen@2a {
                 compatible = "eeti,exc3000";
                 reg = <0x2a>;
@@ -62,3 +77,19 @@ examples:
                 touchscreen-swapped-x-y;
         };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include "dt-bindings/interrupt-controller/irq.h"
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@2a {
+            compatible = "eeti,exc3000-i2c";
+            reg = <0x2a>;
+            interrupt-parent = <&gpio>;
+            interrupts = <123 IRQ_TYPE_EDGE_RISING>;
+            attn-gpios = <&gpio 123 GPIO_ACTIVE_HIGH>;
+        };
+    };
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

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: drop-touchscreen.txt


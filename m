Return-Path: <linux-input+bounces-14949-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B4CB8DB79
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 14:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF186189E26E
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 13:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B50E2D12E4;
	Sun, 21 Sep 2025 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDLmlFQv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7022C0F8A
	for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758459588; cv=none; b=IggxRTYfbfBD1Gh+Pw1KLAKcBTEQLHMks92B7Pjpwxetz08U1qx57c5Vs4EilbnW34I2n3rU1M1h34jSA8FDqQ0M9RwF2YO1rxpcsesLO+aWkP3+bKZSoJZx5Tdl3V3gy58vIjX0yJ+X+EUAIvfZZyPtNIKbVBvazstfEuDXK8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758459588; c=relaxed/simple;
	bh=JBjh6tWinHQ8j2zeq/CGszjnQcF7SdBlIAR8B2+vUVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M/RM8A5Wi+gqtRrTg2IwWPUWJEl929pDCGIBJqc1XwOuaTu7kks/WM8ptBdWvtHjJxjIYvgBjS6oBh29AWt+KPktH+e+SpQpK8lYsGurGJEfHbBsBU1H1znVhy9k0FPMlPRUzVEc7hjW+wCwg7RgNg1d97XxDHuynLQPogFJEy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDLmlFQv; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so658758e87.0
        for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758459584; x=1759064384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+TxbCJDfqUR5usrZF8ZGw7MDVN54yzt0d/I/rO53p4=;
        b=MDLmlFQvgaoMi3LQR9IqprMfIURmz/SY2C2jLZH/ZsXIyUksEyB60ZlFfo4xqe4ac8
         XvJt4t4vhYk968kecPMKmDfvvFsklqsYw0ux6HCwWD8ni5QHZyuqN2OMLsJA2Sp0I40x
         VOrbp99oBYG3yVPn/GmOvXZd3x9nEc8LO5YC8XYI4QHJNZ0xDYphAZYRZczzqz79fSS3
         RCSJgrYBPV9U+XTNph7H8Wd7l8MHaZHgnJGeQgGOV4EYbUv/ylhFtwsDPNNaOvOv/rkv
         bNsKuwhZAM4a4wg7rLToVAYuo4hrmGzTmafzyTr3XEDPF3LGUUbCcqTZrHmuEgqBQ6dt
         p/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758459584; x=1759064384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+TxbCJDfqUR5usrZF8ZGw7MDVN54yzt0d/I/rO53p4=;
        b=YwAg+RHepN5/WPV032mmuioAMvuBJ6VzjKX9mMGTtdFtrvI0R+khsSuCSVFP9BJRvb
         D9GROZ40PzC7pARBw9/BidECN7cd94+Brf1c0xRG9cyT51Gb2Nh06mVitJjBZghF3kC5
         t32xpPbiqBo5NSbanM1XOlND6z3R2zv8k02UcplEyV6Itvkec+WVhA07H2VtVNFGRc2/
         /rqJ9yv2TCI4HVd2qAfKrpfeiSUoAuVxZ2H9t+U8eDa6PVndoNkaxyMUGEgMSslgKL/b
         c3fRE8F+H3BD77a9VRQq12bZawWfoQbmrZ2nrmXs2s5cym3zcgfvhGRcsXI9Gs49nckY
         5nyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6O2Xc8jG+fdGJidaLLPIaxySG8uNcZpitxZgErrBuE04tdLNF/gbrAie/p60HEMAKzgxVhSP5bGQprA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYwHOGFE7wqcNA4uaIhbvELHf4jXLGcEVFiPoAsICXH4APzYjV
	3kjs5+1mfcahIL7g7EFUf0NCyj2y3uV5ovOCMURMQj1bYgpg9eOfN6+v
X-Gm-Gg: ASbGncsMF5XmOFrOeT1IcN2cdI/Lr63pE0tOgdGg0Yf/ndQ/nWTsDfkeDQw3L0AQBMl
	lKwFt964gZAhiivXaSBhuUTOUw4XR896UKiPRQi8uXkyiAnE32N9SYP/x4kqv6BR72MS+4lpD1+
	T1p2Q4QRxd3OFhdZbtRmytTF8Ax/3t0kIZq7pUXZcC6E6ebmSq5cDkYjsKR/XMMd98oSbM4Six0
	8pl/nVh/1tWQpmg0O8GPybna4rMnFhGFp9hK/KCJ4rG5v1sSdhOC3l5HCgSFEQta9un/Himq/sN
	q2S7BQEjd9uzSPpswSEkg4t5jvGk6aDIJEkwgZaNml2VnI1hslWjC7uJvEtt9E5dVh3Yim7ITTX
	sGCc5WEv11/2Sp4F9eOOYTSjgM9vS5gSMVn6/ICxPUn0QdtUWRZobAxDs1YqOlNKmgFxJGoB+dA
	==
X-Google-Smtp-Source: AGHT+IGYaR2gQ4apuGZRpv2ImMcFvulHtA0EBUVIq7xsH5xPkqYWo+X8dnpiiDAv7FxtRFcsrTFnrg==
X-Received: by 2002:a05:6512:6809:b0:57a:1846:9514 with SMTP id 2adb3069b0e04-57a184695b9mr2571830e87.9.1758459584177;
        Sun, 21 Sep 2025 05:59:44 -0700 (PDT)
Received: from kuzhyl-vm.home (46.205.205.154.nat.ftth.dynamic.t-mobile.pl. [46.205.205.154])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e079e7sm22297751fa.13.2025.09.21.05.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 05:59:43 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Sven Peter <sven@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 1/2] dt-bindings: input: touchscreen: add hynitron cst816x series
Date: Sun, 21 Sep 2025 14:59:38 +0200
Message-ID: <20250921125939.249788-1-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Hynitron CST816x series touchscreen bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---
Changes in v10:
 - No code changes

Changes in v9:
 - Adjust linux,keycodes: Add items with event descriptions, and remove maxItems
 - Adjust dt example: Fix four-spaces indentation

Changes in v8:
 - Update the bindings title to indicate CST816x series support
 - Rephrase bindings description to describe controller more precisely
 - Remove redundant description field from the reset-gpio property
 - Completely remove cst816x,gestures object with all dependants
 - Apply linux,keycodes to represent gestures (slide up, slide down, etc.)
 - Extend dt example with linux,keycodes
 - Align indentation in dt example to use four spaces

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

 .../input/touchscreen/hynitron,cst816x.yaml   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
new file mode 100644
index 000000000000..72d4da636881
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
@@ -0,0 +1,65 @@
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
+    items:
+      - description: Slide up gesture
+      - description: Slide down gesture
+      - description: Slide left gesture
+      - description: Slide right gesture
+      - description: Long press gesture
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+        touchscreen@15 {
+            compatible = "hynitron,cst816s";
+            reg = <0x15>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+            reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+            linux,keycodes = <KEY_UP>, <KEY_DOWN>, <KEY_LEFT>, <KEY_RIGHT>,
+                             <BTN_TOOL_TRIPLETAP>;
+        };
+    };
+
+...
-- 
2.43.0



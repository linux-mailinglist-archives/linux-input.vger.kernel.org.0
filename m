Return-Path: <linux-input+bounces-2362-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8CA879B5A
	for <lists+linux-input@lfdr.de>; Tue, 12 Mar 2024 19:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F247B20E3A
	for <lists+linux-input@lfdr.de>; Tue, 12 Mar 2024 18:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581FA13958E;
	Tue, 12 Mar 2024 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8gGhv2A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F07B139585
	for <linux-input@vger.kernel.org>; Tue, 12 Mar 2024 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268208; cv=none; b=C0BsMTG1Uwpa42DYvJkS6mKHmGweXTRqGqz56y0ZKoIvmnu7Z36ipiyw7T2OGWMUssGA+qJzJEsUGs6gQQOCj8V2yTQLfsKU9AlYCDZ8yyatgL7JVcSxvVRu06DG2IaTJlbBhuQqthzTUxvQmt0qrLYoKpm8vSmR5eHpP7ZnWUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268208; c=relaxed/simple;
	bh=nP46n0jcTTeYpauXe/+zfoUjzDQ2EGZv67UMSWODJdM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TE30osWDHDfaIEqlH0YJM7rJL6P+Kp19YNBPuQKRGmPm7N+VkSwfBXUnp3zIPSQluQwpQy14Mv1QxuUJcY8Gmjf0+QODCoPwERGYYhFZp+jndRStPbL3Kzgncdl+6KzMsiW5K/97BnmqheJp9SQS44wtbP4GDWOmuVTEhHc/YVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8gGhv2A; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33e6aca1ca9so5701910f8f.2
        for <linux-input@vger.kernel.org>; Tue, 12 Mar 2024 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710268204; x=1710873004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wj0RwfzSeaH3zu2ZUByQWF3Tyva/dlg0AmgzMmpsYvQ=;
        b=d8gGhv2AV6PfsE7LCNNRKdLiUg+6uFFITODBycCaH4RozOBJId+rMpQCRXARG7osDz
         C+3MWlgKfcI+UGwRJ9/lWntPAb/8sn6xc19jBuiGMI6HGrJTzPEgca8wKLTNbl+pEezC
         XmYj8+8PAHbK3+crolGYcdvC6cmQBaFtqnFeOqpR87liCEhEgbOVnTSBd89UhLLU5XPx
         3k+Zfu8I8bOj5HxDluFPHou1fGEQeOy0nq6Cx54iO7Xiq4c7iew4WYddT6kdp3D54vdS
         Ghahj9uU1mXdabTEk0vFeN01sleAcn5cxAD1feqj25q+J8dVF5dVkDBS5bgANe7EG2yF
         U/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710268204; x=1710873004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wj0RwfzSeaH3zu2ZUByQWF3Tyva/dlg0AmgzMmpsYvQ=;
        b=r7opaN/YlkJJMVTt3Ur3Y8l+kGs13eyMDZoz88g5koAQileq2rrSegFfdpY+gfRbDo
         JBtlKeuQftDzY1+wY8m1fADygGQMg64n0qA+7TOzeKPjq4+dJKYnPeTmXosX5GaYg6Fj
         WyxQ+erF6AjqMyY9iAc5O8wFteqfyr4Rx0QUpjRCpcqugWGmi6fo3D2jnXWdFGlAnhug
         QvQAVlMcyx8wgHidyzswXkBBAVxwc4CHA4GedVRISJ1TjYXrHQ5NQWbQBtBl3GJspc87
         7KqV//5pAnJIDI2RRWY+Mfr7EA+7HnYObVbe6UWesMDCxezZfvGa2EVQUNKe1G/Trcot
         aQ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVhyxH3/HPU77Jz+s0zIy2L1dBu1KBZlna2KYsLQPXYxBmTsaU2rPelvGrsel5Pr5BCYM27tAXyGJ24rZDU8hv4GXMY5RW+4MQkOSg=
X-Gm-Message-State: AOJu0YwU+LNm1XbJGi1GkOWkM7IK91du77bOdhX+bXLOLKM/oQ3ZBPjx
	Ven8Wny7O+RGK/2mWGLH20gGR4vWXDZjD9u9V5LzZqy+jA810LD+MM+wRpKtQlMKoZpcQfTxX/u
	W
X-Google-Smtp-Source: AGHT+IEOapWwkAs6vj2cpDcE/owqSppl0uIbcEtSOOx4QNZ+Byu8ijzqekKkbvcA5v0rUfCYfySxbg==
X-Received: by 2002:a5d:544c:0:b0:33e:20a:99d with SMTP id w12-20020a5d544c000000b0033e020a099dmr196396wrv.30.1710268204290;
        Tue, 12 Mar 2024 11:30:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id f19-20020adfb613000000b0033dc931eb06sm9822974wre.0.2024.03.12.11.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 11:30:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: input: samsung,s3c6410-keypad: convert to DT Schema
Date: Tue, 12 Mar 2024 19:30:01 +0100
Message-Id: <20240312183001.714626-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Samsung SoC Keypad bindings to DT schema with changes:
1. Rename "linux,keypad-no-autorepeat" property to
   "linux,input-no-autorepeat", because the latter was implemented in
   the Linux driver.
2. Add clocks and clock-names, already used by DTS and the Linux driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../input/samsung,s3c6410-keypad.yaml         | 121 ++++++++++++++++++
 .../bindings/input/samsung-keypad.txt         |  77 -----------
 .../bindings/power/wakeup-source.txt          |   2 +-
 3 files changed, 122 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/samsung-keypad.txt

diff --git a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
new file mode 100644
index 000000000000..a53569aa0ee7
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/samsung,s3c6410-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC series Keypad Controller
+
+description:
+  Samsung SoC Keypad controller is used to interface a SoC with a matrix-type
+  keypad device. The keypad controller supports multiple row and column lines.
+  A key can be placed at each intersection of a unique row and a unique column.
+  The keypad controller can sense a key-press and key-release and report the
+  event using a interrupt to the cpu.
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - samsung,s3c6410-keypad
+      - samsung,s5pv210-keypad
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: keypad
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  linux,input-no-autorepeat:
+    type: boolean
+    description:
+      Do no enable autorepeat feature.
+
+  linux,input-wakeup:
+    type: boolean
+    deprecated: true
+
+  samsung,keypad-num-columns:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of column lines connected to the keypad controller.
+
+  samsung,keypad-num-rows:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of row lines connected to the keypad controller.
+
+patternProperties:
+  '^key-[0-9a-z]+$':
+    type: object
+    $ref: input.yaml#
+    additionalProperties: false
+    description:
+      Each key connected to the keypad controller is represented as a child
+      node to the keypad controller device node.
+
+    properties:
+      keypad,column:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: The column number to which the key is connected.
+
+      keypad,row:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: The row number to which the key is connected.
+
+      linux,code: true
+
+    required:
+      - keypad,column
+      - keypad,row
+      - linux,code
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - samsung,keypad-num-columns
+  - samsung,keypad-num-rows
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos4.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    keypad@100a0000 {
+        compatible = "samsung,s5pv210-keypad";
+        reg = <0x100a0000 0x100>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock CLK_KEYIF>;
+        clock-names = "keypad";
+
+        samsung,keypad-num-rows = <2>;
+        samsung,keypad-num-columns = <8>;
+        linux,input-no-autorepeat;
+        wakeup-source;
+
+        key-1 {
+            keypad,row = <0>;
+            keypad,column = <3>;
+            linux,code = <2>;
+        };
+
+        key-2 {
+            keypad,row = <0>;
+            keypad,column = <4>;
+            linux,code = <3>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/samsung-keypad.txt b/Documentation/devicetree/bindings/input/samsung-keypad.txt
deleted file mode 100644
index 4c5c0a82586d..000000000000
--- a/Documentation/devicetree/bindings/input/samsung-keypad.txt
+++ /dev/null
@@ -1,77 +0,0 @@
-* Samsung's Keypad Controller device tree bindings
-
-Samsung's Keypad controller is used to interface a SoC with a matrix-type
-keypad device. The keypad controller supports multiple row and column lines.
-A key can be placed at each intersection of a unique row and a unique column.
-The keypad controller can sense a key-press and key-release and report the
-event using a interrupt to the cpu.
-
-Required SoC Specific Properties:
-- compatible: should be one of the following
-  - "samsung,s3c6410-keypad": For controllers compatible with s3c6410 keypad
-    controller.
-  - "samsung,s5pv210-keypad": For controllers compatible with s5pv210 keypad
-    controller.
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- interrupts: The interrupt number to the cpu.
-
-Required Board Specific Properties:
-- samsung,keypad-num-rows: Number of row lines connected to the keypad
-  controller.
-
-- samsung,keypad-num-columns: Number of column lines connected to the
-  keypad controller.
-
-- Keys represented as child nodes: Each key connected to the keypad
-  controller is represented as a child node to the keypad controller
-  device node and should include the following properties.
-  - keypad,row: the row number to which the key is connected.
-  - keypad,column: the column number to which the key is connected.
-  - linux,code: the key-code to be reported when the key is pressed
-    and released.
-
-- pinctrl-0: Should specify pin control groups used for this controller.
-- pinctrl-names: Should contain only one value - "default".
-
-Optional Properties:
-- wakeup-source: use any event on keypad as wakeup event.
-		 (Legacy property supported: "linux,input-wakeup")
-
-Optional Properties specific to linux:
-- linux,keypad-no-autorepeat: do no enable autorepeat feature.
-
-
-Example:
-	keypad@100a0000 {
-		compatible = "samsung,s5pv210-keypad";
-		reg = <0x100A0000 0x100>;
-		interrupts = <173>;
-		samsung,keypad-num-rows = <2>;
-		samsung,keypad-num-columns = <8>;
-		linux,input-no-autorepeat;
-		wakeup-source;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&keypad_rows &keypad_columns>;
-
-		key_1 {
-			keypad,row = <0>;
-			keypad,column = <3>;
-			linux,code = <2>;
-		};
-
-		key_2 {
-			keypad,row = <0>;
-			keypad,column = <4>;
-			linux,code = <3>;
-		};
-
-		key_3 {
-			keypad,row = <0>;
-			keypad,column = <5>;
-			linux,code = <4>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/power/wakeup-source.txt b/Documentation/devicetree/bindings/power/wakeup-source.txt
index 75bc20b95688..a6c8978964aa 100644
--- a/Documentation/devicetree/bindings/power/wakeup-source.txt
+++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
@@ -27,7 +27,7 @@ List of legacy properties and respective binding document
 				Documentation/devicetree/bindings/mfd/tc3589x.txt
 				Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
 4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
-5. "linux,input-wakeup"		Documentation/devicetree/bindings/input/samsung-keypad.txt
+5. "linux,input-wakeup"		Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
 6. "nvidia,wakeup-source"	Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt
 
 Examples
-- 
2.34.1



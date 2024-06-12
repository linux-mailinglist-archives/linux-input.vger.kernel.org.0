Return-Path: <linux-input+bounces-4325-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB0905674
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 17:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 489DBB27A19
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 15:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB56180A74;
	Wed, 12 Jun 2024 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UaMfkBp5"
X-Original-To: linux-input@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB81017F51D;
	Wed, 12 Jun 2024 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718204839; cv=none; b=Ck7YHyd4EKoCOSGnst8L48afOyNLppja63VhK6Om76+GjJc68Hf0ME7eTMR0Li7VWORzTGszBgYIvQY5eZeIuVJnQxis/14qXKSw/vy/GjvvL7dPqeG8y+LPHzznvC0oUuQ0E5nHJ16RSUlAx3Xm+9QYpCDgC/wm3VB0XSCrkd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718204839; c=relaxed/simple;
	bh=zEWuCAoO2uNYvaqGht66j45VjIoDAy1oI5JMwk8VCn4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=elQFA2f0R02vBGRSG/ctvZupumHMKUe+wmbJ6ieObO9DT9W1yMnAf6IzJrdjJK/RSJcn3MB3aMtLbDV7QhWytpTQMF6o3YUiRPxEXKnSCVUyCFqfRkDV23wHjTwsHCzFdLm3J0H8VgwyyTH/jREWzuXI6sKIXj8HbxWQzCshPAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UaMfkBp5; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45CF7CAt009684;
	Wed, 12 Jun 2024 10:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718204832;
	bh=+e6m33PRrkfeoKJB8tWne+G0mb2Nm9QwOT+TQzuvl+Q=;
	h=From:To:CC:Subject:Date;
	b=UaMfkBp5pfqlADHSY9trtk6Xnv7nKcPeKglhgG8k6sIncMeRWFoONm+K0V5AOEteT
	 EKbjq92SPOqLgvw/bMw5Vt4iziIvxxfMMddV2YH+G4THlmiLDeXHLKKjFAUGGBIInq
	 xCpCGlZAcPCnefviisg/LOmfR04z1vjmKBhdvoZ4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45CF7CWT027678
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2024 10:07:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Jun 2024 10:07:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Jun 2024 10:07:12 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45CF7BDF095064;
	Wed, 12 Jun 2024 10:07:12 -0500
From: Andrew Davis <afd@ti.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH] dt-bindings: input: ti,nspire-keypad: convert to YAML format
Date: Wed, 12 Jun 2024 10:07:11 -0500
Message-ID: <20240612150711.26706-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Convert TI-NSPIRE Keypad controller bindings to DT schema.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../bindings/input/ti,nspire-keypad.txt       | 60 ---------------
 .../bindings/input/ti,nspire-keypad.yaml      | 74 +++++++++++++++++++
 2 files changed, 74 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/ti,nspire-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,nspire-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/ti,nspire-keypad.txt b/Documentation/devicetree/bindings/input/ti,nspire-keypad.txt
deleted file mode 100644
index 513d94d6e899e..0000000000000
--- a/Documentation/devicetree/bindings/input/ti,nspire-keypad.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-TI-NSPIRE Keypad
-
-Required properties:
-- compatible: Compatible property value should be "ti,nspire-keypad".
-
-- reg: Physical base address of the peripheral and length of memory mapped
-  region.
-
-- interrupts: The interrupt number for the peripheral.
-
-- scan-interval: How often to scan in us. Based on a APB speed of 33MHz, the
-	maximum and minimum delay time is ~2000us and ~500us respectively
-
-- row-delay: How long to wait before scanning each row.
-
-- clocks: The clock this peripheral is attached to.
-
-- linux,keymap: The keymap to use
-	(see Documentation/devicetree/bindings/input/matrix-keymap.txt)
-
-Optional properties:
-- active-low: Specify that the keypad is active low (i.e. logical low signifies
-	a key press).
-
-Example:
-
-input {
-	compatible = "ti,nspire-keypad";
-	reg = <0x900E0000 0x1000>;
-	interrupts = <16>;
-
-	scan-interval = <1000>;
-	row-delay = <200>;
-
-	clocks = <&apb_pclk>;
-
-	linux,keymap = <
-	0x0000001c	0x0001001c	0x00040039
-	0x0005002c	0x00060015	0x0007000b
-	0x0008000f	0x0100002d	0x01010011
-	0x0102002f	0x01030004	0x01040016
-	0x01050014	0x0106001f	0x01070002
-	0x010a006a	0x02000013	0x02010010
-	0x02020019	0x02030007	0x02040018
-	0x02050031	0x02060032	0x02070005
-	0x02080028	0x0209006c	0x03000026
-	0x03010025	0x03020024	0x0303000a
-	0x03040017	0x03050023	0x03060022
-	0x03070008	0x03080035	0x03090069
-	0x04000021	0x04010012	0x04020020
-	0x0404002e	0x04050030	0x0406001e
-	0x0407000d	0x04080037	0x04090067
-	0x05010038	0x0502000c	0x0503001b
-	0x05040034	0x0505001a	0x05060006
-	0x05080027	0x0509000e	0x050a006f
-	0x0600002b	0x0602004e	0x06030068
-	0x06040003	0x0605006d	0x06060009
-	0x06070001	0x0609000f	0x0708002a
-	0x0709001d	0x070a0033	>;
-};
diff --git a/Documentation/devicetree/bindings/input/ti,nspire-keypad.yaml b/Documentation/devicetree/bindings/input/ti,nspire-keypad.yaml
new file mode 100644
index 0000000000000..ed3cfff13addc
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,nspire-keypad.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ti,nspire-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI-NSPIRE Keypad
+
+maintainers:
+  - Andrew Davis <afd@ti.com>
+
+allOf:
+  - $ref: input.yaml#
+  - $ref: matrix-keymap.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,nspire-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  scan-interval:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: How often to scan in us. Based on a APB speed of 33MHz, the
+      maximum and minimum delay time is ~2000us and ~500us respectively
+
+  row-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: How long to wait between scanning each row in us.
+
+  active-low:
+    description: Specify that the keypad is active low.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - scan-interval
+  - row-delay
+  - linux,keymap
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    keypad@900e0000 {
+        compatible = "ti,nspire-keypad";
+        reg = <0x900e0000 0x1000>;
+        interrupts = <16>;
+
+        clocks = <&apb_pclk>;
+
+        scan-interval = <1000>;
+        row-delay = <200>;
+
+        linux,keymap = <
+            MATRIX_KEY(0,  0, KEY_ENTER)
+            MATRIX_KEY(0,  1, KEY_ENTER)
+            MATRIX_KEY(0,  4, KEY_SPACE)
+            MATRIX_KEY(0,  5, KEY_Z)
+            MATRIX_KEY(0,  6, KEY_Y)
+            MATRIX_KEY(0,  7, KEY_0)
+        >;
+    };
-- 
2.39.2



Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B02F1D9F4E
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 20:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgESSZG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 14:25:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56176 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgESSZF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 14:25:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 11C7F2A2604
Received: by jupiter.universe (Postfix, from userid 1000)
        id 995A3480100; Tue, 19 May 2020 20:25:01 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 1/5] dt-bindings: touchscreen: Convert EETI EXC3000 touchscreen to json-schema
Date:   Tue, 19 May 2020 20:24:43 +0200
Message-Id: <20200519182447.73405-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519182447.73405-1-sebastian.reichel@collabora.com>
References: <20200519182447.73405-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the EETI EXC3000 binding to DT schema format using json-schema

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/input/touchscreen/exc3000.txt    | 26 ---------
 .../bindings/input/touchscreen/exc3000.yaml   | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt b/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
deleted file mode 100644
index 68291b94fec2..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* EETI EXC3000 Multiple Touch Controller
-
-Required properties:
-- compatible: must be "eeti,exc3000"
-- reg: i2c slave address
-- interrupts: touch controller interrupt
-- touchscreen-size-x: See touchscreen.txt
-- touchscreen-size-y: See touchscreen.txt
-
-Optional properties:
-- touchscreen-inverted-x: See touchscreen.txt
-- touchscreen-inverted-y: See touchscreen.txt
-- touchscreen-swapped-x-y: See touchscreen.txt
-
-Example:
-
-	touchscreen@2a {
-		compatible = "eeti,exc3000";
-		reg = <0x2a>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
-		touchscreen-size-x = <4096>;
-		touchscreen-size-y = <4096>;
-		touchscreen-inverted-x;
-		touchscreen-swapped-x-y;
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
new file mode 100644
index 000000000000..5d2e7496d6dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/exc3000.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EETI EXC3000 series touchscreen controller
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: eeti,exc3000
+  reg:
+    const: 0x2a
+  interrupts:
+    maxItems: 1
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/interrupt-controller/irq.h"
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        touchscreen@2a {
+                compatible = "eeti,exc3000";
+                reg = <0x2a>;
+                interrupt-parent = <&gpio1>;
+                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+                touchscreen-size-x = <4096>;
+                touchscreen-size-y = <4096>;
+                touchscreen-inverted-x;
+                touchscreen-swapped-x-y;
+        };
+    };
-- 
2.26.2


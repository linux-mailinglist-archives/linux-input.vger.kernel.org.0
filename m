Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02919653F6
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2019 11:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfGKJki (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Jul 2019 05:40:38 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:59921 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKJki (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Jul 2019 05:40:38 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 68A69240011;
        Thu, 11 Jul 2019 09:38:40 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: input: Convert Allwinner LRADC to a schema
Date:   Thu, 11 Jul 2019 11:38:35 +0200
Message-Id: <20190711093835.20663-1-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Allwinner SoCs have an LRADC used to report keys and supported in
Linux, with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../input/allwinner,sun4i-a10-lradc-keys.yaml | 95 +++++++++++++++++++
 .../bindings/input/sun4i-lradc-keys.txt       | 65 -------------
 2 files changed, 95 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
new file mode 100644
index 000000000000..b3bd8ef7fbd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/allwinner,sun4i-a10-lradc-keys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 LRADC Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-lradc-keys
+      - const: allwinner,sun8i-a83t-r-lradc
+      - items:
+        - const: allwinner,sun50i-a64-lradc
+        - const: allwinner,sun8i-a83t-r-lradc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      Regulator for the LRADC reference voltage
+
+patternProperties:
+  "^button-[0-9]+$":
+    type: object
+    properties:
+      label:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Descriptive name of the key
+
+      linux,code:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Keycode to emit
+
+      channel:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1]
+        description: ADC Channel this key is attached to
+
+      voltage:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Voltage in microvolts at LRADC input when this key is
+          pressed
+
+    required:
+      - label
+      - linux,code
+      - channel
+      - voltage
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vref-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    lradc: lradc@1c22800 {
+        compatible = "allwinner,sun4i-a10-lradc-keys";
+        reg = <0x01c22800 0x100>;
+        interrupts = <31>;
+        vref-supply = <&reg_vcc3v0>;
+
+        button-191 {
+            label = "Volume Up";
+            linux,code = <115>;
+            channel = <0>;
+            voltage = <191274>;
+        };
+
+        button-392 {
+            label = "Volume Down";
+            linux,code = <114>;
+            channel = <0>;
+            voltage = <392644>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
deleted file mode 100644
index 507b737612ea..000000000000
--- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Allwinner sun4i low res adc attached tablet keys
-------------------------------------------------
-
-Required properties:
- - compatible: should be one of the following string:
-		"allwinner,sun4i-a10-lradc-keys"
-		"allwinner,sun8i-a83t-r-lradc"
-		"allwinner,sun50i-a64-lradc", "allwinner,sun8i-a83t-r-lradc"
- - reg: mmio address range of the chip
- - interrupts: interrupt to which the chip is connected
- - vref-supply: powersupply for the lradc reference voltage
-
-Each key is represented as a sub-node of the compatible mentioned above:
-
-Required subnode-properties:
-	- label: Descriptive name of the key.
-	- linux,code: Keycode to emit.
-	- channel: Channel this key is attached to, must be 0 or 1.
-	- voltage: Voltage in µV at lradc input when this key is pressed.
-
-Example:
-
-#include <dt-bindings/input/input.h>
-
-	lradc: lradc@1c22800 {
-		compatible = "allwinner,sun4i-a10-lradc-keys";
-		reg = <0x01c22800 0x100>;
-		interrupts = <31>;
-		vref-supply = <&reg_vcc3v0>;
-
-		button@191 {
-			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
-			channel = <0>;
-			voltage = <191274>;
-		};
-
-		button@392 {
-			label = "Volume Down";
-			linux,code = <KEY_VOLUMEDOWN>;
-			channel = <0>;
-			voltage = <392644>;
-		};
-
-		button@601 {
-			label = "Menu";
-			linux,code = <KEY_MENU>;
-			channel = <0>;
-			voltage = <601151>;
-		};
-
-		button@795 {
-			label = "Enter";
-			linux,code = <KEY_ENTER>;
-			channel = <0>;
-			voltage = <795090>;
-		};
-
-		button@987 {
-			label = "Home";
-			linux,code = <KEY_HOMEPAGE>;
-			channel = <0>;
-			voltage = <987387>;
-		};
-	};
-- 
2.21.0


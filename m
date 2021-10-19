Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53B443424E
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 01:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhJSXwI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 19:52:08 -0400
Received: from ixit.cz ([94.230.151.217]:54124 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229707AbhJSXwG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 19:52:06 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 7CB8A20064;
        Wed, 20 Oct 2021 01:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634687390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=o0YUdAIctq2TetXHh6SB+UpGOdk4PznD4UiezKrfJFE=;
        b=odQQVx7NvELSo+dlqWMtuSoKvOhB3zqZ4Hc0NR06yCy/fQiJDmVc07849woMVUfn092gzn
        e++WO2/HQnzvxogNqfpWdf3InSiL/UN38/Pt9TDS1ddbL9IvUtwhJFy4FlA9DtnZmZQz+U
        Yfr8dr5k/RWfPA4JpKFipCcu/TdHx9E=
From:   David Heidelberg <david@ixit.cz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH v2] dt-bindings: input: microchip,cap11xx: Convert txt bindings to yaml
Date:   Wed, 20 Oct 2021 01:48:16 +0200
Message-Id: <20211019234816.32060-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert binding for the Microchip CAP11xx series HW to the YAML syntax.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
v2:
 - changed mail to robh (original author seems to be not actively
   maintaining the driver since 2015)
 - common.yaml path fixed
 - $ref input.yaml added

 .../devicetree/bindings/input/cap11xx.txt     |  78 ---------
 .../bindings/input/microchip,cap11xx.yaml     | 148 ++++++++++++++++++
 2 files changed, 148 insertions(+), 78 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cap11xx.txt
 create mode 100644 Documentation/devicetree/bindings/input/microchip,cap11xx.yaml

diff --git a/Documentation/devicetree/bindings/input/cap11xx.txt b/Documentation/devicetree/bindings/input/cap11xx.txt
deleted file mode 100644
index 8c67a0b5058d..000000000000
--- a/Documentation/devicetree/bindings/input/cap11xx.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-Device tree bindings for Microchip CAP11xx based capacitive touch sensors
-
-The node for this device must be a child of a I2C controller node, as the
-device communication via I2C only.
-
-Required properties:
-
-	compatible:		Must contain one of:
-					"microchip,cap1106"
-					"microchip,cap1126"
-					"microchip,cap1188"
-
-	reg:			The I2C slave address of the device.
-
-	interrupts:		Property describing the interrupt line the
-				device's ALERT#/CM_IRQ# pin is connected to.
-				The device only has one interrupt source.
-
-Optional properties:
-
-	autorepeat:		Enables the Linux input system's autorepeat
-				feature on the input device.
-
-	microchip,sensor-gain:	Defines the gain of the sensor circuitry. This
-				effectively controls the sensitivity, as a
-				smaller delta capacitance is required to
-				generate the same delta count values.
-				Valid values are 1, 2, 4, and 8.
-				By default, a gain of 1 is set.
-
-	microchip,irq-active-high:	By default the interrupt pin is active low
-				open drain. This property allows using the active
-				high push-pull output.
-
-	linux,keycodes:		Specifies an array of numeric keycode values to
-				be used for the channels. If this property is
-				omitted, KEY_A, KEY_B, etc are used as
-				defaults. The array must have exactly six
-				entries.
-
-Example:
-
-i2c_controller {
-	cap1106@28 {
-		compatible = "microchip,cap1106";
-		interrupt-parent = <&gpio1>;
-		interrupts = <0 0>;
-		reg = <0x28>;
-		autorepeat;
-		microchip,sensor-gain = <2>;
-
-		linux,keycodes = <103>,		/* KEY_UP */
-				 <106>,		/* KEY_RIGHT */
-				 <108>,		/* KEY_DOWN */
-				 <105>,		/* KEY_LEFT */
-				 <109>,		/* KEY_PAGEDOWN */
-				 <104>;		/* KEY_PAGEUP */
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		usr@0 {
-			label = "cap11xx:green:usr0";
-			reg = <0>;
-		};
-
-		usr@1 {
-			label = "cap11xx:green:usr1";
-			reg = <1>;
-		};
-
-		alive@2 {
-			label = "cap11xx:green:alive";
-			reg = <2>;
-			linux,default_trigger = "heartbeat";
-		};
-	};
-}
diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
new file mode 100644
index 000000000000..fa0f37a90ac9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/input/microchip,cap11xx.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree bindings for Microchip CAP11xx based capacitive touch sensors
+
+description: |
+  The Microchip CAP1xxx Family of RightTouchTM multiple-channel capacitive
+  touch controllers and LED drivers. The device communication via I2C only.
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - microchip,cap1106
+      - microchip,cap1126
+      - microchip,cap1188
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+    description: |
+      Property describing the interrupt line the
+      device's ALERT#/CM_IRQ# pin is connected to.
+      The device only has one interrupt source.
+
+  autorepeat:
+    description: |
+      Enables the Linux input system's autorepeat feature on the input device.
+
+  linux,keycodes:
+    minItems: 6
+    maxItems: 6
+    description: |
+      Specifies an array of numeric keycode values to
+      be used for the channels. If this property is
+      omitted, KEY_A, KEY_B, etc are used as defaults.
+      The array must have exactly six entries.
+
+  microchip,sensor-gain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 1
+    enum: [1, 2, 4, 8]
+    description: |
+      Defines the gain of the sensor circuitry. This
+      effectively controls the sensitivity, as a
+      smaller delta capacitance is required to
+      generate the same delta count values.
+
+  microchip,irq-active-high:
+    type: boolean
+    description: |
+      By default the interrupt pin is active low
+      open drain. This property allows using the active
+      high push-pull output.
+
+patternProperties:
+  "^led@[0-7]$":
+    type: object
+    description: CAP11xx LEDs
+    $ref: /schemas/leds/common.yaml#
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      label: true
+
+      linux,default-trigger: true
+
+      default-state: true
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+allOf:
+  - $ref: input.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,cap1106
+    then:
+      patternProperties:
+        "^led@[0-7]$": false
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cap1188@28 {
+        compatible = "microchip,cap1188";
+        interrupt-parent = <&gpio1>;
+        interrupts = <0 0>;
+        reg = <0x28>;
+        autorepeat;
+        microchip,sensor-gain = <2>;
+
+        linux,keycodes = <103>,	/* KEY_UP */
+                         <106>,	/* KEY_RIGHT */
+                         <108>,	/* KEY_DOWN */
+                         <105>,	/* KEY_LEFT */
+                         <109>,	/* KEY_PAGEDOWN */
+                         <104>;	/* KEY_PAGEUP */
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@0 {
+                label = "cap11xx:green:usr0";
+                reg = <0>;
+        };
+
+        led@1 {
+                label = "cap11xx:green:usr1";
+                reg = <1>;
+        };
+
+        led@2 {
+                label = "cap11xx:green:alive";
+                reg = <2>;
+                linux,default-trigger = "heartbeat";
+        };
+      };
+    };
-- 
2.33.0


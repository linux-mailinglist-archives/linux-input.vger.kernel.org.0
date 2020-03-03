Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA922177D6D
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 18:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbgCCRZx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 12:25:53 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59942 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728242AbgCCRZx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Mar 2020 12:25:53 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C35B928E664
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     devicetree@vger.kernel.org
Cc:     nick@shmanahar.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        enric.balletbo@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH] dt-bindings: input: atmel_mxt_ts: convert atmel,maxtouch.txt to yaml
Date:   Tue,  3 Mar 2020 19:25:33 +0200
Message-Id: <20200303172533.30602-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the binding file atmel,maxtouch.txt to yaml format.
Also change the file name in the MAINTAINERS file.

This was tested and verified on ARM and ARM64 with:

make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/atmel,maxtouch.yaml

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../bindings/input/atmel,maxtouch.txt         | 41 ------------
 .../bindings/input/atmel,maxtouch.yaml        | 64 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 65 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.txt
 create mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
deleted file mode 100644
index c88919480d37..000000000000
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Atmel maXTouch touchscreen/touchpad
-
-Required properties:
-- compatible:
-    atmel,maxtouch
-
-    The following compatibles have been used in various products but are
-    deprecated:
-	atmel,qt602240_ts
-	atmel,atmel_mxt_ts
-	atmel,atmel_mxt_tp
-	atmel,mXT224
-
-- reg: The I2C address of the device
-
-- interrupts: The sink for the touchpad's IRQ output
-    See ../interrupt-controller/interrupts.txt
-
-Optional properties for main touchpad device:
-
-- linux,gpio-keymap: When enabled, the SPT_GPIOPWN_T19 object sends messages
-    on GPIO bit changes. An array of up to 8 entries can be provided
-    indicating the Linux keycode mapped to each bit of the status byte,
-    starting at the LSB. Linux keycodes are defined in
-    <dt-bindings/input/input.h>.
-
-    Note: the numbering of the GPIOs and the bit they start at varies between
-    maXTouch devices. You must either refer to the documentation, or
-    experiment to determine which bit corresponds to which input. Use
-    KEY_RESERVED for unused padding values.
-
-- reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
-
-Example:
-
-	touch@4b {
-		compatible = "atmel,maxtouch";
-		reg = <0x4b>;
-		interrupt-parent = <&gpio>;
-		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
-	};
diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
new file mode 100644
index 000000000000..024dc4ded4f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel maXTouch touchscreen/touchpad
+
+maintainers:
+  - Nick Dyer <nick@shmanahar.org>
+
+description: |
+  Atmel maXTouch touchscreen/touchpad
+
+properties:
+  compatible:
+    const: atmel,maxtouch
+
+  reg:
+    description: The I2C address of the device
+    maxItems: 1
+
+  interrupts:
+    description: The sink for the touchpad's IRQ output
+
+  linux,gpio-keymap:
+    description:
+      When enabled, the SPT_GPIOPWN_T19 object sends messages
+      on GPIO bit changes. An array of up to 8 entries can be provided
+      indicating the Linux keycode mapped to each bit of the status byte,
+      starting at the LSB. Linux keycodes are defined in
+      <dt-bindings/input/input.h>.
+      Note, the numbering of the GPIOs and the bit they start at varies between
+      maXTouch devices. You must either refer to the documentation, or
+      experiment to determine which bit corresponds to which input. Use
+      KEY_RESERVED for unused padding values.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 8
+
+  reset-gpios:
+    description: GPIO specifier for the touchscreen's reset pin (active low)
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          touch@4b {
+                compatible = "atmel,maxtouch";
+                reg = <0x4b>;
+                interrupt-parent = <&gpio>;
+                interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
+          };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46fdb834d1fb..d553aa315734 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2877,7 +2877,7 @@ ATMEL MAXTOUCH DRIVER
 M:	Nick Dyer <nick@shmanahar.org>
 T:	git git://github.com/ndyer/linux.git
 S:	Maintained
-F:	Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+F:	Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
 F:	drivers/input/touchscreen/atmel_mxt_ts.c
 
 ATMEL WIRELESS DRIVER
-- 
2.17.1


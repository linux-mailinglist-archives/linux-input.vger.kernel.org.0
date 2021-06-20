Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCB53AE089
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 23:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFTVJc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Jun 2021 17:09:32 -0400
Received: from phobos.denx.de ([85.214.62.61]:36194 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230051AbhFTVJb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Jun 2021 17:09:31 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DB30F800B2;
        Sun, 20 Jun 2021 23:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1624223237;
        bh=fllZnftIcVJajq/vV7VV4xYVuAx6Ki13fNQtt68JPco=;
        h=From:To:Cc:Subject:Date:From;
        b=VBtTru811O7I9iEmQRuKDU5fOA78LswVrcmC43yF5Ut7QVjpItAo6vc922DznXjz4
         MGDiNUCW5pKqoHyWoYIAgPXXMWPCeglOew7JiUGnfU8TNLoU+AlE/5DdZjqJvFDq59
         CYYm2QWb6uCXCssm6w25duvu3CsUU+jItZ1uwraq+PEvzlU3hr8lJpfQj1yaZ9IONf
         R6S0k4GszqYfRNSPAfE+ju2xjfII3eetcv+VgH1cjjNUnvT7jhQGrUFY2knGe/uD8z
         +T77p3al/06vZGtR40Us1JrnQbIazmRlZSk6OXfpd9jmeXwiJAnX+2raqoCuy3DyLk
         d/9mVTTzCXfyQ==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Welling <mwelling@ieee.org>,
        Rob Herring <robh+dt@kernel.org>, kernel@dh-electronics.com,
        linux-input@vger.kernel.org
Subject: [PATCH v3] dt-bindings: input: tsc2005: Convert to YAML schema
Date:   Sun, 20 Jun 2021 23:07:08 +0200
Message-Id: <20210620210708.100147-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the TI TSC2004/TSC2005 DT bindings to YAML schema.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael Welling <mwelling@ieee.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: kernel@dh-electronics.com
Cc: linux-input@vger.kernel.org
To: devicetree@vger.kernel.org
---
V2: - Switch the license to (GPL-2.0-only OR BSD-2-Clause)
V3: - Drop quotes, use enum: instead of oneOf+const
    - Add maxItems to reg: and reset-gpios:
    - Drop ref uint32
---
 .../input/touchscreen/ti,tsc2005.yaml         | 128 ++++++++++++++++++
 .../bindings/input/touchscreen/tsc2005.txt    |  64 ---------
 2 files changed, 128 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
new file mode 100644
index 000000000000..938aab016cc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TSC2004 and TSC2005 touchscreen controller bindings
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+  - Michael Welling <mwelling@ieee.org>
+
+properties:
+  $nodename:
+    pattern: "^touchscreen(@.*)?$"
+
+  compatible:
+    enum:
+      - ti,tsc2004
+      - ti,tsc2005
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address when used on the I2C bus, or the SPI chip select index
+      when used on the SPI bus
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO specifier for the controller reset line
+
+  spi-max-frequency:
+    description: TSC2005 SPI bus clock frequency.
+    maximum: 25000000
+
+  ti,x-plate-ohms:
+    description: resistance of the touchscreen's X plates in ohm (defaults to 280)
+
+  ti,esd-recovery-timeout-ms:
+    description: |
+        if the touchscreen does not respond after the configured time
+        (in milli seconds), the driver will reset it. This is disabled
+        by default.
+
+  vio-supply:
+    description: Regulator specifier
+
+  touchscreen-fuzz-pressure: true
+  touchscreen-fuzz-x: true
+  touchscreen-fuzz-y: true
+  touchscreen-max-pressure: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,tsc2004
+    then:
+      properties:
+        spi-max-frequency: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        touchscreen@48 {
+            compatible = "ti,tsc2004";
+            reg = <0x48>;
+            vio-supply = <&vio>;
+
+            reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
+            interrupts-extended = <&gpio1 27 IRQ_TYPE_EDGE_RISING>;
+
+            touchscreen-fuzz-x = <4>;
+            touchscreen-fuzz-y = <7>;
+            touchscreen-fuzz-pressure = <2>;
+            touchscreen-size-x = <4096>;
+            touchscreen-size-y = <4096>;
+            touchscreen-max-pressure = <2048>;
+
+            ti,x-plate-ohms = <280>;
+            ti,esd-recovery-timeout-ms = <8000>;
+        };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        touchscreen@0 {
+            compatible = "ti,tsc2005";
+            spi-max-frequency = <6000000>;
+            reg = <0>;
+
+            vio-supply = <&vio>;
+
+            reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>; /* 104 */
+            interrupts-extended = <&gpio4 4 IRQ_TYPE_EDGE_RISING>; /* 100 */
+
+            touchscreen-fuzz-x = <4>;
+            touchscreen-fuzz-y = <7>;
+            touchscreen-fuzz-pressure = <2>;
+            touchscreen-size-x = <4096>;
+            touchscreen-size-y = <4096>;
+            touchscreen-max-pressure = <2048>;
+
+            ti,x-plate-ohms = <280>;
+            ti,esd-recovery-timeout-ms = <8000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt b/Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt
deleted file mode 100644
index b80c04b0e5c0..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-* Texas Instruments tsc2004 and tsc2005 touchscreen controllers
-
-Required properties:
- - compatible		      : "ti,tsc2004" or "ti,tsc2005"
- - reg			      : Device address
- - interrupts		      : IRQ specifier
- - spi-max-frequency	      : Maximum SPI clocking speed of the device
-			        (for tsc2005)
-
-Optional properties:
- - vio-supply		      : Regulator specifier
- - reset-gpios		      : GPIO specifier for the controller reset line
- - ti,x-plate-ohms	      : integer, resistance of the touchscreen's X plates
-				in ohm (defaults to 280)
- - ti,esd-recovery-timeout-ms : integer, if the touchscreen does not respond after
-				the configured time (in milli seconds), the driver
-				will reset it. This is disabled by default.
- - properties defined in touchscreen.txt
-
-Example:
-
-&i2c3 {
-	tsc2004@48 {
-		compatible = "ti,tsc2004";
-		reg = <0x48>;
-		vio-supply = <&vio>;
-
-		reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
-		interrupts-extended = <&gpio1 27 IRQ_TYPE_EDGE_RISING>;
-
-		touchscreen-fuzz-x = <4>;
-		touchscreen-fuzz-y = <7>;
-		touchscreen-fuzz-pressure = <2>;
-		touchscreen-size-x = <4096>;
-		touchscreen-size-y = <4096>;
-		touchscreen-max-pressure = <2048>;
-
-		ti,x-plate-ohms = <280>;
-		ti,esd-recovery-timeout-ms = <8000>;
-	};
-}
-
-&mcspi1 {
-	tsc2005@0 {
-		compatible = "ti,tsc2005";
-		spi-max-frequency = <6000000>;
-		reg = <0>;
-
-		vio-supply = <&vio>;
-
-		reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>; /* 104 */
-		interrupts-extended = <&gpio4 4 IRQ_TYPE_EDGE_RISING>; /* 100 */
-
-		touchscreen-fuzz-x = <4>;
-		touchscreen-fuzz-y = <7>;
-		touchscreen-fuzz-pressure = <2>;
-		touchscreen-size-x = <4096>;
-		touchscreen-size-y = <4096>;
-		touchscreen-max-pressure = <2048>;
-
-		ti,x-plate-ohms = <280>;
-		ti,esd-recovery-timeout-ms = <8000>;
-	};
-}
-- 
2.30.2


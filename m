Return-Path: <linux-input+bounces-14720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADD7B56BD0
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 21:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D45EB189E70E
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9800A2E3B11;
	Sun, 14 Sep 2025 19:36:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFD12E3703;
	Sun, 14 Sep 2025 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878562; cv=none; b=kx7YbGZ+HM24Gzd5uqY92kVrE+1M/wZKGJyV3DyFGYed0t+4E3TvSqWKjprPC0CLVh+3MCYke3Pey6ofzoX/2J/P9DsBmpQMQDFi1lcdwUQXR8e+cufLz96NEy8d6xhfKgc0bixAZeOxuNaDSP5EB3yRPdGULaDlCJ4ZWwkj6UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878562; c=relaxed/simple;
	bh=DmzhXWCjdabYnUMwC5X+hM2e6Qhw44ROMKNmOpHX65A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rFM1CXl+3u3I4+/5oyVyx7czB4dDX76L3/lXrwgToqrFxbOFR9XSoWuL+6Tb4mKY7IEDpUtDFZOcRN6nstCCsC9HBDj24KYp3PsyYfpqrj8p9sht8JcCfndDEhPejdN1BDXpoYDr0HR4c+AhhrPefs/+1jNK0FhqQ+oEtSXCF7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 58EJbPAi010595;
	Sun, 14 Sep 2025 19:37:25 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 58EJbP7B010591;
	Sun, 14 Sep 2025 19:37:25 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v4 1/8] dt-bindings: mfd: fsl,mc13xxx: convert txt to DT schema
Date: Sun, 14 Sep 2025 19:37:16 +0000
Message-Id: <20250914193723.10544-2-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250914193723.10544-1-akurz@blala.de>
References: <20250914193723.10544-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the txt mc13xxx bindings to DT schema attempting to keep most
information. The nodes codec and touchscreen are not part of the new
schema since it was only briefly mentioned before.
Following the convention, rename led-control to fsl,led-control.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 218 ++++++++++++++++++
 .../devicetree/bindings/mfd/mc13xxx.txt       | 156 -------------
 2 files changed, 218 insertions(+), 156 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mc13xxx.txt

diff --git a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
new file mode 100644
index 000000000000..007c2e3eee91
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
@@ -0,0 +1,218 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,mc13xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MC13xxx Power Management Integrated Circuits (PMIC)
+
+maintainers:
+  - Alexander Kurz <akurz@blala.de>
+
+description: >
+  The MC13xxx PMIC series consists of the three models MC13783, MC13892
+  and MC34708 and provide regulators and other features like RTC, ADC,
+  LED, touchscreen, codec and input buttons.
+
+  Link to datasheets
+    https://www.nxp.com/docs/en/data-sheet/MC13783.pdf
+    https://www.nxp.com/docs/en/data-sheet/MC13892.pdf
+    https://www.nxp.com/docs/en/data-sheet/MC34708.pdf
+
+properties:
+  compatible:
+    enum:
+      - fsl,mc13783
+      - fsl,mc13892
+      - fsl,mc34708
+
+  reg:
+    description: I2C slave address or SPI chip select number.
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  spi-cs-high: true
+
+  system-power-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  leds:
+    type: object
+    $ref: /schemas/leds/common.yaml#
+
+    properties:
+      reg:
+        description: |
+          One of
+          MC13783 LED IDs
+            0: Main display
+            1: AUX display
+            2: Keypad
+            3: Red 1
+            4: Green 1
+            5: Blue 1
+            6: Red 2
+            7: Green 2
+            8: Blue 2
+            9: Red 3
+            10: Green 3
+            11: Blue 3
+
+          MC13892 LED IDs
+            0: Main display
+            1: AUX display
+            2: Keypad
+            3: Red
+            4: Green
+            5: Blue
+
+          MC34708 LED IDs
+            0: Charger Red
+            1: Charger Green
+        maxItems: 1
+
+      led-control:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          Setting for LED-Control register array length depends on model,
+          mc13783: 6, mc13892: 4, mc34708: 1
+
+  regulators:
+    type: object
+
+    additionalProperties:
+      type: object
+
+    description: |
+      List of child nodes specifying the regulators, depending on chip variant.
+      Each child node is defined using the standard binding for regulators and
+      the optional regulator properties defined below.
+
+  fsl,mc13xxx-uses-adc:
+    type: boolean
+    description: Indicate the ADC is being used
+
+  fsl,mc13xxx-uses-codec:
+    type: boolean
+    description: Indicate the Audio Codec is being used
+
+  fsl,mc13xxx-uses-rtc:
+    type: boolean
+    description: Indicate the RTC is being used
+
+  fsl,mc13xxx-uses-touch:
+    type: boolean
+    description: Indicate the touchscreen controller is being used
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,mc13783
+    then:
+      properties:
+        leds:
+          properties:
+            led-control:
+              minItems: 6
+              maxItems: 6
+        regulators:
+          patternProperties:
+            "^gpo[1-4]|pwgt[12]spi|sw[12][ab]|sw3|vaudio|vcam|vdig|vesim|vgen|viohi|violo|vmmc[12]|vrf[12]|vrfbg|vrfcp|vrfdig|vrfref|vsim|vvib$":
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+
+              unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,mc13892
+    then:
+      properties:
+        leds:
+          properties:
+            led-control:
+              minItems: 4
+              maxItems: 4
+        regulators:
+          patternProperties:
+            "^gpo[1-4]|pwgt[12]spi|sw[1-4]|swbst|vaudio|vcam|vcoincell|vdig|vgen[1-3]|viohi|vpll|vsd|vusb|vusb2|vvideo$":
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+
+              unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,mc34708
+    then:
+      properties:
+        leds:
+          properties:
+            led-control:
+              minItems: 1
+              maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic: mc13892@0 {
+            compatible = "fsl,mc13892";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            spi-cs-high;
+            interrupt-parent = <&gpio0>;
+            interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,mc13xxx-uses-rtc;
+            fsl,mc13xxx-uses-adc;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                led-control = <0x000 0x000 0x0e0 0x000>;
+
+                sysled@3 {
+                    reg = <3>;
+                    label = "system:red:live";
+                    linux,default-trigger = "heartbeat";
+                };
+            };
+
+            regulators {
+                sw1_reg: sw1 {
+                    regulator-min-microvolt = <600000>;
+                    regulator-max-microvolt = <1375000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                sw2_reg: sw2 {
+                    regulator-min-microvolt = <900000>;
+                    regulator-max-microvolt = <1850000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
deleted file mode 100644
index 8261ea73278a..000000000000
--- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
+++ /dev/null
@@ -1,156 +0,0 @@
-* Freescale MC13783/MC13892 Power Management Integrated Circuit (PMIC)
-
-Required properties:
-- compatible : Should be "fsl,mc13783" or "fsl,mc13892"
-
-Optional properties:
-- fsl,mc13xxx-uses-adc : Indicate the ADC is being used
-- fsl,mc13xxx-uses-codec : Indicate the Audio Codec is being used
-- fsl,mc13xxx-uses-rtc : Indicate the RTC is being used
-- fsl,mc13xxx-uses-touch : Indicate the touchscreen controller is being used
-
-Sub-nodes:
-- codec: Contain the Audio Codec node.
-  - adc-port: Contain PMIC SSI port number used for ADC.
-  - dac-port: Contain PMIC SSI port number used for DAC.
-- leds : Contain the led nodes and initial register values in property
-  "led-control". Number of register depends of used IC, for MC13783 is 6,
-  for MC13892 is 4, for MC34708 is 1. See datasheet for bits definitions of
-  these registers.
-  - #address-cells: Must be 1.
-  - #size-cells: Must be 0.
-  Each led node should contain "reg", which used as LED ID (described below).
-  Optional properties "label" and "linux,default-trigger" is described in
-  Documentation/devicetree/bindings/leds/common.txt.
-- regulators : Contain the regulator nodes. The regulators are bound using
-  their names as listed below with their registers and bits for enabling.
-
-MC13783 LED IDs:
-    0  : Main display
-    1  : AUX display
-    2  : Keypad
-    3  : Red 1
-    4  : Green 1
-    5  : Blue 1
-    6  : Red 2
-    7  : Green 2
-    8  : Blue 2
-    9  : Red 3
-    10 : Green 3
-    11 : Blue 3
-
-MC13892 LED IDs:
-    0  : Main display
-    1  : AUX display
-    2  : Keypad
-    3  : Red
-    4  : Green
-    5  : Blue
-
-MC34708 LED IDs:
-    0  : Charger Red
-    1  : Charger Green
-
-MC13783 regulators:
-    sw1a      : regulator SW1A      (register 24, bit 0)
-    sw1b      : regulator SW1B      (register 25, bit 0)
-    sw2a      : regulator SW2A      (register 26, bit 0)
-    sw2b      : regulator SW2B      (register 27, bit 0)
-    sw3       : regulator SW3       (register 29, bit 20)
-    vaudio    : regulator VAUDIO    (register 32, bit 0)
-    viohi     : regulator VIOHI     (register 32, bit 3)
-    violo     : regulator VIOLO     (register 32, bit 6)
-    vdig      : regulator VDIG      (register 32, bit 9)
-    vgen      : regulator VGEN      (register 32, bit 12)
-    vrfdig    : regulator VRFDIG    (register 32, bit 15)
-    vrfref    : regulator VRFREF    (register 32, bit 18)
-    vrfcp     : regulator VRFCP     (register 32, bit 21)
-    vsim      : regulator VSIM      (register 33, bit 0)
-    vesim     : regulator VESIM     (register 33, bit 3)
-    vcam      : regulator VCAM      (register 33, bit 6)
-    vrfbg     : regulator VRFBG     (register 33, bit 9)
-    vvib      : regulator VVIB      (register 33, bit 11)
-    vrf1      : regulator VRF1      (register 33, bit 12)
-    vrf2      : regulator VRF2      (register 33, bit 15)
-    vmmc1     : regulator VMMC1     (register 33, bit 18)
-    vmmc2     : regulator VMMC2     (register 33, bit 21)
-    gpo1      : regulator GPO1      (register 34, bit 6)
-    gpo2      : regulator GPO2      (register 34, bit 8)
-    gpo3      : regulator GPO3      (register 34, bit 10)
-    gpo4      : regulator GPO4      (register 34, bit 12)
-    pwgt1spi  : regulator PWGT1SPI  (register 34, bit 15)
-    pwgt2spi  : regulator PWGT2SPI  (register 34, bit 16)
-
-MC13892 regulators:
-    vcoincell : regulator VCOINCELL (register 13, bit 23)
-    sw1       : regulator SW1	    (register 24, bit 0)
-    sw2       : regulator SW2	    (register 25, bit 0)
-    sw3       : regulator SW3	    (register 26, bit 0)
-    sw4       : regulator SW4	    (register 27, bit 0)
-    swbst     : regulator SWBST	    (register 29, bit 20)
-    vgen1     : regulator VGEN1	    (register 32, bit 0)
-    viohi     : regulator VIOHI	    (register 32, bit 3)
-    vdig      : regulator VDIG	    (register 32, bit 9)
-    vgen2     : regulator VGEN2	    (register 32, bit 12)
-    vpll      : regulator VPLL	    (register 32, bit 15)
-    vusb2     : regulator VUSB2	    (register 32, bit 18)
-    vgen3     : regulator VGEN3	    (register 33, bit 0)
-    vcam      : regulator VCAM	    (register 33, bit 6)
-    vvideo    : regulator VVIDEO    (register 33, bit 12)
-    vaudio    : regulator VAUDIO    (register 33, bit 15)
-    vsd       : regulator VSD	    (register 33, bit 18)
-    gpo1      : regulator GPO1	    (register 34, bit 6)
-    gpo2      : regulator GPO2	    (register 34, bit 8)
-    gpo3      : regulator GPO3	    (register 34, bit 10)
-    gpo4      : regulator GPO4	    (register 34, bit 12)
-    pwgt1spi  : regulator PWGT1SPI  (register 34, bit 15)
-    pwgt2spi  : regulator PWGT2SPI  (register 34, bit 16)
-    vusb      : regulator VUSB	    (register 50, bit 3)
-
-  The bindings details of individual regulator device can be found in:
-  Documentation/devicetree/bindings/regulator/regulator.txt
-
-Examples:
-
-ecspi@70010000 { /* ECSPI1 */
-	cs-gpios = <&gpio4 24 0>, /* GPIO4_24 */
-		   <&gpio4 25 0>; /* GPIO4_25 */
-
-	pmic: mc13892@0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "fsl,mc13892";
-		spi-max-frequency = <6000000>;
-		reg = <0>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <8>;
-
-		leds {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			led-control = <0x000 0x000 0x0e0 0x000>;
-
-			sysled@3 {
-				reg = <3>;
-				label = "system:red:live";
-				linux,default-trigger = "heartbeat";
-			};
-		};
-
-		regulators {
-			sw1_reg: mc13892__sw1 {
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <1375000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sw2_reg: mc13892__sw2 {
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <1850000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-		};
-	};
-};
-- 
2.39.5



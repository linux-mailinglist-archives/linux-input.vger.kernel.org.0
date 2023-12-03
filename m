Return-Path: <linux-input+bounces-416-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FEF802325
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 12:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAB561F21034
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 11:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48922BA29;
	Sun,  3 Dec 2023 11:33:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7BD569B;
	Sun,  3 Dec 2023 03:33:02 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,247,1695654000"; 
   d="scan'208";a="188990163"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2023 20:33:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id ADEF6418B3F9;
	Sun,  3 Dec 2023 20:32:55 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 11/11] dt-bindings: mfd: dlg,da9063: Convert da9062 to json-schema
Date: Sun,  3 Dec 2023 11:31:59 +0000
Message-Id: <20231203113159.92316-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203113159.92316-1-biju.das.jz@bp.renesas.com>
References: <20231203113159.92316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the da9062 PMIC and da906{1,2} thermal device tree binding
documentation to json-schema.

Update the example to match reality and the MAINTAINERS entry for
da906{1,2} thermal device tree binding. Update description for
da9062-onkey bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Fixed bot errors related to MAINTAINERS entry, invalid doc
   references and thermal examples by merging patch#4.
v2:
 * New patch
---
 .../bindings/input/dlg,da9062-onkey.yaml      |   1 -
 .../devicetree/bindings/mfd/da9062.txt        | 124 ------------
 .../devicetree/bindings/mfd/dlg,da9063.yaml   | 185 +++++++++++++++++-
 .../bindings/thermal/da9062-thermal.txt       |  36 ----
 .../bindings/thermal/dlg,da9062-thermal.yaml  |  78 ++++++++
 MAINTAINERS                                   |   2 +-
 6 files changed, 258 insertions(+), 168 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9062.txt
 delete mode 100644 Documentation/devicetree/bindings/thermal/da9062-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml

diff --git a/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
index 34f2e00cf045..859238d5df80 100644
--- a/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
+++ b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
@@ -11,7 +11,6 @@ maintainers:
 
 description: |
   This module is part of the DA9061/DA9062/DA9063. For more details about entire
-  DA9062 and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt
   For DA906{1,2,3} see Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
 
   This module provides the KEY_POWER event.
diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
deleted file mode 100644
index 7dd641deea1d..000000000000
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ /dev/null
@@ -1,124 +0,0 @@
-* Dialog DA9062 Power Management Integrated Circuit (PMIC)
-
-Product information for the DA9062 and DA9061 devices can be found here:
-- https://www.dialog-semiconductor.com/products/da9062
-- https://www.dialog-semiconductor.com/products/da9061
-
-The DA9062 PMIC consists of:
-
-Device                   Supply Names    Description
-------                   ------------    -----------
-da9062-regulator        :               : LDOs & BUCKs
-da9062-rtc              :               : Real-Time Clock
-da9062-onkey            :               : On Key
-da9062-watchdog         :               : Watchdog Timer
-da9062-thermal          :               : Thermal
-da9062-gpio             :               : GPIOs
-
-The DA9061 PMIC consists of:
-
-Device                   Supply Names    Description
-------                   ------------    -----------
-da9062-regulator        :               : LDOs & BUCKs
-da9062-onkey            :               : On Key
-da9062-watchdog         :               : Watchdog Timer
-da9062-thermal          :               : Thermal
-
-======
-
-Required properties:
-
-- compatible : Should be
-    "dlg,da9062" for DA9062
-    "dlg,da9061" for DA9061
-- reg : Specifies the I2C slave address (this defaults to 0x58 but it can be
-  modified to match the chip's OTP settings).
-
-Optional properties:
-
-- gpio-controller : Marks the device as a gpio controller.
-- #gpio-cells     : Should be two. The first cell is the pin number and the
-                    second cell is used to specify the gpio polarity.
-
-See Documentation/devicetree/bindings/gpio/gpio.txt for further information on
-GPIO bindings.
-
-- interrupts : IRQ line information.
-- interrupt-controller
-
-See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt for
-further information on IRQ bindings.
-
-Sub-nodes:
-
-- regulators : This node defines the settings for the LDOs and BUCKs.
-  The DA9062 regulators are bound using their names listed below:
-
-    buck1    : BUCK_1
-    buck2    : BUCK_2
-    buck3    : BUCK_3
-    buck4    : BUCK_4
-    ldo1     : LDO_1
-    ldo2     : LDO_2
-    ldo3     : LDO_3
-    ldo4     : LDO_4
-
-  The DA9061 regulators are bound using their names listed below:
-
-    buck1    : BUCK_1
-    buck2    : BUCK_2
-    buck3    : BUCK_3
-    ldo1     : LDO_1
-    ldo2     : LDO_2
-    ldo3     : LDO_3
-    ldo4     : LDO_4
-
-  The component follows the standard regulator framework and the bindings
-  details of individual regulator device can be found in:
-  Documentation/devicetree/bindings/regulator/regulator.txt
-
-  regulator-initial-mode may be specified for buck regulators using mode values
-  from include/dt-bindings/regulator/dlg,da9063-regulator.h.
-
-- rtc : This node defines settings required for the Real-Time Clock associated
-  with the DA9062. There are currently no entries in this binding, however
-  compatible = "dlg,da9062-rtc" should be added if a node is created.
-
-- onkey : See ../input/dlg,da9062-onkey.yaml
-
-- watchdog: See ../watchdog/da9062-watchdog.yaml
-
-- thermal : See ../thermal/dlg,da9062-thermal.yaml
-
-Example:
-
-	pmic0: da9062@58 {
-		compatible = "dlg,da9062";
-		reg = <0x58>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
-
-		rtc {
-			compatible = "dlg,da9062-rtc";
-		};
-
-		regulators {
-			DA9062_BUCK1: buck1 {
-				regulator-name = "BUCK1";
-				regulator-min-microvolt = <300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp = <500000>;
-				regulator-max-microamp = <2000000>;
-				regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
-				regulator-boot-on;
-			};
-			DA9062_LDO1: ldo1 {
-				regulator-name = "LDO_1";
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <3600000>;
-				regulator-boot-on;
-			};
-		};
-	};
-
diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
index ecdef322723d..54bb23dbc73f 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
+title: Dialog DA906{3L,3,2,1} Power Management Integrated Circuit (PMIC)
 
 maintainers:
   - Steve Twiss <stwiss.opensource@diasemi.com>
@@ -17,13 +17,17 @@ description: |
   moment where all voltage monitors are disabled. Next, as da9063 only supports
   UV *and* OV monitoring, both must be set to the same severity and value
   (0: disable, 1: enable).
-  Product information for the DA906{3L,3} devices can be found here:
+  Product information for the DA906{3L,3,2,1} devices can be found here:
   - https://www.dialog-semiconductor.com/products/da9063l
   - https://www.dialog-semiconductor.com/products/da9063
+  - https://www.dialog-semiconductor.com/products/da9062
+  - https://www.dialog-semiconductor.com/products/da9061
 
 properties:
   compatible:
     enum:
+      - dlg,da9061
+      - dlg,da9062
       - dlg,da9063
       - dlg,da9063l
 
@@ -38,6 +42,19 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  gpio:
+    type: object
+    $ref: /schemas/gpio/gpio.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9062-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
   onkey:
     $ref: /schemas/input/dlg,da9062-onkey.yaml
 
@@ -45,7 +62,7 @@ properties:
     type: object
     additionalProperties: false
     patternProperties:
-      "^(ldo([1-9]|1[01])|bcore([1-2]|s-merged)|b(pro|mem|io|peri)|bmem-bio-merged)$":
+      "^(ldo([1-9]|1[01])|bcore([1-2]|s-merged)|b(pro|mem|io|peri)|bmem-bio-merged|buck[1-4])$":
         $ref: /schemas/regulator/regulator.yaml
         unevaluatedProperties: false
 
@@ -55,7 +72,12 @@ properties:
     unevaluatedProperties: false
     properties:
       compatible:
-        const: dlg,da9063-rtc
+        enum:
+          - dlg,da9063-rtc
+          - dlg,da9062-rtc
+
+  thermal:
+    $ref: /schemas/thermal/dlg,da9062-thermal.yaml
 
   watchdog:
     $ref: /schemas/watchdog/dlg,da9062-watchdog.yaml
@@ -63,8 +85,65 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
-  - interrupt-controller
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - dlg,da9063
+              - dlg,da9063l
+    then:
+      properties:
+        thermal: false
+        gpio: false
+        gpio-controller: false
+        "#gpio-cells": false
+        regulators:
+          patternProperties:
+            "^buck[1-4]$": false
+      required:
+        - interrupts
+        - interrupt-controller
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - dlg,da9062
+    then:
+      properties:
+        regulators:
+          patternProperties:
+            "^(ldo([5-9]|10|11)|bcore([1-2]|s-merged)|b(pro|mem|io|peri)|bmem-bio-merged)$": false
+      required:
+        - gpio
+        - onkey
+        - rtc
+        - thermal
+        - watchdog
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - dlg,da9061
+    then:
+      properties:
+        gpio: false
+        gpio-controller: false
+        "#gpio-cells": false
+        regulators:
+          patternProperties:
+            "^(ldo([5-9]|10|11)|bcore([1-2]|s-merged)|b(pro|mem|io|peri)|bmem-bio-merged|buck4)$": false
+        rtc: false
+      required:
+        - onkey
+        - thermal
+        - watchdog
 
 additionalProperties: false
 
@@ -121,4 +200,98 @@ examples:
         };
       };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/dlg,da9063-regulator.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      pmic@58 {
+        compatible = "dlg,da9062";
+        reg = <0x58>;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gpio1>;
+        interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-controller;
+
+        gpio {
+          compatible = "dlg,da9062-gpio";
+          status = "disabled";
+        };
+
+        onkey {
+          compatible = "dlg,da9062-onkey";
+        };
+
+        regulators {
+          buck1 {
+            regulator-name = "vdd_arm";
+            regulator-min-microvolt = <925000>;
+            regulator-max-microvolt = <1380000>;
+            regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
+            regulator-always-on;
+          };
+          buck2 {
+            regulator-name = "vdd_soc";
+            regulator-min-microvolt = <1150000>;
+            regulator-max-microvolt = <1380000>;
+            regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
+            regulator-always-on;
+          };
+          buck3 {
+            regulator-name = "vdd_ddr3";
+            regulator-min-microvolt = <1500000>;
+            regulator-max-microvolt = <1500000>;
+            regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
+            regulator-always-on;
+          };
+          buck4 {
+            regulator-name = "vdd_eth";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <1200000>;
+            regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
+            regulator-always-on;
+          };
+          ldo1 {
+            regulator-name = "vdd_snvs";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3000000>;
+            regulator-always-on;
+          };
+          ldo2 {
+            regulator-name = "vdd_high";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3000000>;
+            regulator-always-on;
+          };
+          ldo3 {
+            regulator-name = "vdd_eth_io";
+            regulator-min-microvolt = <2500000>;
+            regulator-max-microvolt = <2500000>;
+          };
+          ldo4 {
+            regulator-name = "vdd_emmc";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-always-on;
+          };
+        };
+
+        rtc {
+          compatible = "dlg,da9062-rtc";
+          status = "disabled";
+        };
+
+        thermal {
+          compatible = "dlg,da9062-thermal";
+          status = "disabled";
+        };
+
+        watchdog {
+          compatible = "dlg,da9062-watchdog";
+          dlg,use-sw-pm;
+        };
+      };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/thermal/da9062-thermal.txt b/Documentation/devicetree/bindings/thermal/da9062-thermal.txt
deleted file mode 100644
index e241bb5a5584..000000000000
--- a/Documentation/devicetree/bindings/thermal/da9062-thermal.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Dialog DA9062/61 TJUNC Thermal Module
-
-This module is part of the DA9061/DA9062. For more details about entire
-DA9062 and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt
-
-Junction temperature thermal module uses an interrupt signal to identify
-high THERMAL_TRIP_HOT temperatures for the PMIC device.
-
-Required properties:
-
-- compatible: should be one of the following valid compatible string lines:
-        "dlg,da9061-thermal", "dlg,da9062-thermal"
-        "dlg,da9062-thermal"
-
-Optional properties:
-
-- polling-delay-passive : Specify the polling period, measured in
-    milliseconds, between thermal zone device update checks.
-
-Example: DA9062
-
-	pmic0: da9062@58 {
-		thermal {
-			compatible = "dlg,da9062-thermal";
-			polling-delay-passive = <3000>;
-		};
-	};
-
-Example: DA9061 using a fall-back compatible for the DA9062 onkey driver
-
-	pmic0: da9061@58 {
-		thermal {
-			compatible = "dlg,da9061-thermal", "dlg,da9062-thermal";
-			polling-delay-passive = <3000>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml b/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml
new file mode 100644
index 000000000000..1c15b10e797c
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/dlg,da9062-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog DA9062/61 TJUNC Thermal Module
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  This module is part of the DA9061/DA9062. For more details about entire
+  DA906{1,2} see Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+
+  Junction temperature thermal module uses an interrupt signal to identify
+  high THERMAL_TRIP_HOT temperatures for the PMIC device.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - dlg,da9062-thermal
+      - items:
+          - enum:
+              - dlg,da9061-thermal
+          - const: dlg,da9062-thermal # da9062-thermal fallback
+
+  polling-delay-passive:
+    description:
+      Specify the polling period, measured in milliseconds, between
+      thermal zone device update checks.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      pmic@58 {
+        compatible = "dlg,da9062";
+        reg = <0x58>;
+        interrupt-parent = <&gpio6>;
+        interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-controller;
+
+        gpio {
+          compatible = "dlg,da9062-gpio";
+          status = "disabled";
+        };
+
+        onkey {
+          compatible = "dlg,da9062-onkey";
+          status = "disabled";
+        };
+
+         rtc {
+          compatible = "dlg,da9062-rtc";
+          status = "disabled";
+        };
+
+        thermal {
+          compatible = "dlg,da9062-thermal";
+          polling-delay-passive = <3000>;
+        };
+
+        watchdog {
+          compatible = "dlg,da9062-watchdog";
+          status = "disabled";
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f2afaa22229d..d629eb14ec47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6136,7 +6136,7 @@ F:	Documentation/devicetree/bindings/regulator/da92*.txt
 F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,slg51000.yaml
 F:	Documentation/devicetree/bindings/sound/da[79]*.txt
-F:	Documentation/devicetree/bindings/thermal/da90??-thermal.txt
+F:	Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml
 F:	Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
 F:	Documentation/hwmon/da90??.rst
 F:	drivers/gpio/gpio-da90??.c
-- 
2.39.2



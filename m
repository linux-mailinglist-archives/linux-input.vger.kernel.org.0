Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE3C7C9821
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 08:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbfJCGND (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 02:13:03 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:44170 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727382AbfJCGND (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 02:13:03 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id 1427DA0962;
        Thu,  3 Oct 2019 08:13:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1570083181;
        bh=wke8h2wbrfQNZ42H8T4keUHJBoM895dO4SfW7Gsx5cs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vlq3MXY94LPhnRgAvVyr9K4iVpJXW1YJQ56inc7cTe5OOSuFSicFKDKho+ijX9byp
         nZtPIdNhB4ANQ1G/tzy4AlbO3OUX2r+aNDYdkKaGoPhSbaQhfdXuE8lN6G+9YmUvVy
         cBIiYmQyIDU49Ij5UN/vXPdC+jC6M9vhpkrwbSws=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v3 2/5] dt-bindings: input: Convert mpr121 binding to json-schema
Date:   Thu,  3 Oct 2019 08:12:53 +0200
Message-Id: <1570083176-8231-3-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the mpr121 binding to DT schema format using json-schema.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
Changes since v2:
 - None

Changes since v1:
 - Extract the common input properties into the input.yaml schema.
 - Fix the wakeup-source description.
 - Fix the example to pass validation. Put the mpr121 device sub-node
   into a i2c {} node.

The linux,keycodes property is not valid as it is. If I put the minItems
and maxItems into the common schema, it is valid and the min/max length
check works fine. Rob, could you advice how to fix this please?

The error is not very specific..

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
/home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml: ignoring, error in schema 'linux,ke
warning: no schema found in file: /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
/home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/Makefile:33: recipe for target 'Documentation/devicetree/bindings/p
make[3]: *** [Documentation/devicetree/bindings/processed-schema.yaml] Error 255
/home/vokac/development/sources/linux-fslc/Makefile:1264: recipe for target 'dt_binding_check' failed

 .../bindings/input/fsl,mpr121-touchkey.yaml        | 66 ++++++++++++++++++++++
 .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 ----------
 2 files changed, 66 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt

diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
new file mode 100644
index 000000000000..c6fbcdf78556
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/fsl,mpr121-touchkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MPR121 capacitive touch sensor controller
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+description: |
+  The MPR121 supports up to 12 completely independent electrodes/capacitance
+  sensing inputs in which 8 are multifunctional for LED driving and GPIO.
+  https://www.nxp.com/docs/en/data-sheet/MPR121.pdf
+
+allOf:
+  - $ref: input.yaml#
+
+properties:
+  compatible:
+    const: fsl,mpr121-touchkey
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    maxItems: 1
+
+  linux,keycodes:
+    minItems: 1
+    maxItems: 12
+
+  wakeup-source:
+    description: Use any event on keypad as wakeup event.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vdd-supply
+  - linux,keycodes
+
+examples:
+  - |
+    #include "dt-bindings/input/input.h"
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mpr121@5a {
+            compatible = "fsl,mpr121-touchkey";
+            reg = <0x5a>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <28 2>;
+            autorepeat;
+            vdd-supply = <&ldo4_reg>;
+            linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
+                             <KEY_4>, <KEY_5>, <KEY_6>, <KEY_7>,
+                             <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt b/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
deleted file mode 100644
index b7c61ee5841b..000000000000
--- a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* Freescale MPR121 Controllor
-
-Required Properties:
-- compatible:		Should be "fsl,mpr121-touchkey"
-- reg:			The I2C slave address of the device.
-- interrupts:		The interrupt number to the cpu.
-- vdd-supply:		Phandle to the Vdd power supply.
-- linux,keycodes:	Specifies an array of numeric keycode values to
-			be used for reporting button presses. The array can
-			contain up to 12 entries.
-
-Optional Properties:
-- wakeup-source:	Use any event on keypad as wakeup event.
-- autorepeat:		Enable autorepeat feature.
-
-Example:
-
-#include "dt-bindings/input/input.h"
-
-	touchkey: mpr121@5a {
-		compatible = "fsl,mpr121-touchkey";
-		reg = <0x5a>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <28 2>;
-		autorepeat;
-		vdd-supply = <&ldo4_reg>;
-		linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
-				<KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
-				<KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
-	};
-- 
2.1.4


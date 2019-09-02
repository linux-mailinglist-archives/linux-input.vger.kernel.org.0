Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4906A5526
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 13:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730975AbfIBLkp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 07:40:45 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:43740 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbfIBLko (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Sep 2019 07:40:44 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id 68154A3571;
        Mon,  2 Sep 2019 13:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1567424442;
        bh=g2zj8HfSEmTE0qiGw11gtqv9RzAZhOnAIcQRCrM+ug4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pxLI+ln6Db9UcJOcDa381qrjzV+Nqd2MrecDTZcop3XJb7HDppvzu4Wzuhl6S/W5k
         K4iKWAu0ZT2CpzqATVnP4+YVCvvN3xCFqNY+07ajlozIRjGmioOyBZAf5wQLEte/w3
         2IbpXrHiMbAX07EKBCH5V6Rhv14msTGgCc0UAJMA=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH input-next 1/4] dt-bindings: input: Convert mpr121 binding to json-schema
Date:   Mon,  2 Sep 2019 13:40:14 +0200
Message-Id: <1567424417-3914-2-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
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
Hi Rob,

I will appreciate your help converting this binding. Currently
the scheme is not valid and the error output of dt_binding_check
is not really helpful.

Also, who shoud be the maintainer of this binding?
I put Dmitry in there as he is the input subsystem maintainer but
I am not sure it is correct.

Thank you,
Michal

 .../bindings/input/fsl,mpr121-touchkey.yaml        | 64 ++++++++++++++++++++++
 .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 ----------
 2 files changed, 64 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt

diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
new file mode 100644
index 000000000000..c463c1c81755
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
@@ -0,0 +1,64 @@
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
+    description:
+      Specifies an array of numeric keycode values to be used for reporting
+      button presses. The array can contain up to 12 entries.
+    minItems: 1
+    maxItems: 12
+
+  wakeup-source: Use any event on keypad as wakeup event.
+    type: boolean
+
+  autorepeat:
+    description: Enable autorepeat when key is pressed and held down.
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
+    touchkey: mpr121@5a {
+        compatible = "fsl,mpr121-touchkey";
+        reg = <0x5a>;
+        interrupt-parent = <&gpio1>;
+        interrupts = <28 2>;
+        autorepeat;
+        vdd-supply = <&ldo4_reg>;
+        linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
+                         <KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
+                         <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
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


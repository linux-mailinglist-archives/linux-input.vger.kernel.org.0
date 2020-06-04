Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16841EDD91
	for <lists+linux-input@lfdr.de>; Thu,  4 Jun 2020 08:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgFDGxz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Jun 2020 02:53:55 -0400
Received: from inva021.nxp.com ([92.121.34.21]:51582 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgFDGxz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Jun 2020 02:53:55 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6539620116D;
        Thu,  4 Jun 2020 08:53:53 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 55FD2200180;
        Thu,  4 Jun 2020 08:53:48 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AADBD40299;
        Thu,  4 Jun 2020 14:53:41 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gnuiyl@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] dt-bindings: input: Convert imx keypad to json-schema
Date:   Thu,  4 Jun 2020 14:43:21 +0800
Message-Id: <1591253001-6497-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the i.MX KEYPAD binding to DT schema format using json-schema

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/input/imx-keypad.txt       | 53 -------------
 .../devicetree/bindings/input/imx-keypad.yaml      | 89 ++++++++++++++++++++++
 2 files changed, 89 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/imx-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/imx-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/imx-keypad.txt b/Documentation/devicetree/bindings/input/imx-keypad.txt
deleted file mode 100644
index 2ebaf7d..0000000
--- a/Documentation/devicetree/bindings/input/imx-keypad.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Freescale i.MX Keypad Port(KPP) device tree bindings
-
-The KPP is designed to interface with a keypad matrix with 2-point contact
-or 3-point contact keys. The KPP is designed to simplify the software task
-of scanning a keypad matrix. The KPP is capable of detecting, debouncing,
-and decoding one or multiple keys pressed simultaneously on a keypad.
-
-Required SoC Specific Properties:
-- compatible: Should be "fsl,<soc>-kpp".
-
-- reg: Physical base address of the KPP and length of memory mapped
-  region.
-
-- interrupts: The KPP interrupt number to the CPU(s).
-
-- clocks: The clock provided by the SoC to the KPP. Some SoCs use dummy
-clock(The clock for the KPP is provided by the SoCs automatically).
-
-Required Board Specific Properties:
-- pinctrl-names: The definition can be found at
-pinctrl/pinctrl-bindings.txt.
-
-- pinctrl-0: The definition can be found at
-pinctrl/pinctrl-bindings.txt.
-
-- linux,keymap: The definition can be found at
-bindings/input/matrix-keymap.txt.
-
-Example:
-kpp: kpp@73f94000 {
-	compatible = "fsl,imx51-kpp", "fsl,imx21-kpp";
-	reg = <0x73f94000 0x4000>;
-	interrupts = <60>;
-	clocks = <&clks 0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_kpp_1>;
-	linux,keymap = <0x00000067	/* KEY_UP */
-			0x0001006c	/* KEY_DOWN */
-			0x00020072	/* KEY_VOLUMEDOWN */
-			0x00030066	/* KEY_HOME */
-			0x0100006a	/* KEY_RIGHT */
-			0x01010069	/* KEY_LEFT */
-			0x0102001c	/* KEY_ENTER */
-			0x01030073	/* KEY_VOLUMEUP */
-			0x02000040	/* KEY_F6 */
-			0x02010042	/* KEY_F8 */
-			0x02020043	/* KEY_F9 */
-			0x02030044	/* KEY_F10 */
-			0x0300003b	/* KEY_F1 */
-			0x0301003c	/* KEY_F2 */
-			0x0302003d	/* KEY_F3 */
-			0x03030074>;	/* KEY_POWER */
-};
diff --git a/Documentation/devicetree/bindings/input/imx-keypad.yaml b/Documentation/devicetree/bindings/input/imx-keypad.yaml
new file mode 100644
index 0000000..a1350cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/imx-keypad.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/imx-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX Keypad Port(KPP) device tree bindings
+
+maintainers:
+  - Liu Ying <gnuiyl@gmail.com>
+
+description: |
+  The KPP is designed to interface with a keypad matrix with 2-point contact
+  or 3-point contact keys. The KPP is designed to simplify the software task
+  of scanning a keypad matrix. The KPP is capable of detecting, debouncing,
+  and decoding one or multiple keys pressed simultaneously on a keypad.
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,imx21-kpp
+      - items:
+          - enum:
+            - fsl,imx25-kpp
+            - fsl,imx27-kpp
+            - fsl,imx31-kpp
+            - fsl,imx35-kpp
+            - fsl,imx51-kpp
+            - fsl,imx53-kpp
+            - fsl,imx50-kpp
+            - fsl,imx6q-kpp
+            - fsl,imx6sx-kpp
+            - fsl,imx6sl-kpp
+            - fsl,imx6sll-kpp
+            - fsl,imx6ul-kpp
+            - fsl,imx7d-kpp
+          - const: fsl,imx21-kpp
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
+  linux,keymap:
+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
+    description: |
+      An array of packed 1-cell entries containing the equivalent of row,
+      column and linux key-code. The 32-bit big endian cell is packed as:
+      row << 24 | column << 16 | key-code
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - linux,keymap
+
+additionalProperties: false
+
+examples:
+  - |
+    keypad@73f94000 {
+        compatible = "fsl,imx51-kpp", "fsl,imx21-kpp";
+        reg = <0x73f94000 0x4000>;
+        interrupts = <60>;
+        clocks = <&clks 0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_kpp_1>;
+        linux,keymap = <0x00000067	/* KEY_UP */
+                        0x0001006c	/* KEY_DOWN */
+                        0x00020072	/* KEY_VOLUMEDOWN */
+                        0x00030066	/* KEY_HOME */
+                        0x0100006a	/* KEY_RIGHT */
+                        0x01010069	/* KEY_LEFT */
+                        0x0102001c	/* KEY_ENTER */
+                        0x01030073	/* KEY_VOLUMEUP */
+                        0x02000040	/* KEY_F6 */
+                        0x02010042	/* KEY_F8 */
+                        0x02020043	/* KEY_F9 */
+                        0x02030044	/* KEY_F10 */
+                        0x0300003b	/* KEY_F1 */
+                        0x0301003c	/* KEY_F2 */
+                        0x0302003d	/* KEY_F3 */
+                        0x03030074>;	/* KEY_POWER */
+    };
-- 
2.7.4


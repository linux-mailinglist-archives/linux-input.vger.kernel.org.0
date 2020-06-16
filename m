Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2A01FA855
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 07:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgFPFmS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 01:42:18 -0400
Received: from inva020.nxp.com ([92.121.34.13]:39856 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgFPFmS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 01:42:18 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 666D41A05D4;
        Tue, 16 Jun 2020 07:42:15 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EAF3B1A0592;
        Tue, 16 Jun 2020 07:42:09 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7292740302;
        Tue, 16 Jun 2020 13:42:02 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gnuiyl@gmail.com, olof@lixom.net, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 1/2] dt-bindings: input: Convert matrix-keymap to json-schema
Date:   Tue, 16 Jun 2020 13:31:06 +0800
Message-Id: <1592285467-18371-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the matrix-keymap binding to DT schema format using json-schema

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
New patch.
---
 .../devicetree/bindings/input/matrix-keymap.txt    | 28 +------------
 .../devicetree/bindings/input/matrix-keymap.yaml   | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/matrix-keymap.yaml

diff --git a/Documentation/devicetree/bindings/input/matrix-keymap.txt b/Documentation/devicetree/bindings/input/matrix-keymap.txt
index c54919f..79f6d01 100644
--- a/Documentation/devicetree/bindings/input/matrix-keymap.txt
+++ b/Documentation/devicetree/bindings/input/matrix-keymap.txt
@@ -1,27 +1 @@
-A simple common binding for matrix-connected key boards. Currently targeted at
-defining the keys in the scope of linux key codes since that is a stable and
-standardized interface at this time.
-
-Required properties:
-- linux,keymap: an array of packed 1-cell entries containing the equivalent
-  of row, column and linux key-code. The 32-bit big endian cell is packed
-  as:
-	row << 24 | column << 16 | key-code
-
-Optional properties:
-Properties for the number of rows and columns are optional because some
-drivers will use fixed values for these.
-- keypad,num-rows: Number of row lines connected to the keypad controller.
-- keypad,num-columns: Number of column lines connected to the keypad
-  controller.
-
-Some users of this binding might choose to specify secondary keymaps for
-cases where there is a modifier key such as a Fn key. Proposed names
-for said properties are "linux,fn-keymap" or with another descriptive
-word for the modifier other from "Fn".
-
-Example:
-	linux,keymap = < 0x00030012
-			 0x0102003a >;
-	keypad,num-rows = <2>;
-	keypad,num-columns = <8>;
+This file has been moved to matrix-keymap.yaml
diff --git a/Documentation/devicetree/bindings/input/matrix-keymap.yaml b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
new file mode 100644
index 0000000..c3bf091
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/matrix-keymap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common key matrices binding for matrix-connected key boards
+
+maintainers:
+  - Olof Johansson <olof@lixom.net>
+
+description: |
+  A simple common binding for matrix-connected key boards. Currently targeted at
+  defining the keys in the scope of linux key codes since that is a stable and
+  standardized interface at this time.
+
+  Some users of this binding might choose to specify secondary keymaps for
+  cases where there is a modifier key such as a Fn key. Proposed names
+  for said properties are "linux,fn-keymap" or with another descriptive
+  word for the modifier other from "Fn".
+
+properties:
+  linux,keymap:
+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
+    description: |
+      An array of packed 1-cell entries containing the equivalent of row,
+      column and linux key-code. The 32-bit big endian cell is packed as:
+          row << 24 | column << 16 | key-code
+
+  keypad,num-rows:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of row lines connected to the keypad controller.
+
+  keypad,num-columns:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of column lines connected to the keypad controller.
+
+examples:
+  - |
+    keypad {
+        /* ... */
+        linux,keymap = < 0x00030012
+                         0x0102003a >;
+        keypad,num-rows = <2>;
+        keypad,num-columns = <8>;
+    };
-- 
2.7.4


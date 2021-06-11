Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9333A430B
	for <lists+linux-input@lfdr.de>; Fri, 11 Jun 2021 15:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhFKNcJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Jun 2021 09:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhFKNcI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Jun 2021 09:32:08 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D87BC061574
        for <linux-input@vger.kernel.org>; Fri, 11 Jun 2021 06:30:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
        by albert.telenet-ops.be with bizsmtp
        id FpW82500P25eH3q06pW8XV; Fri, 11 Jun 2021 15:30:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrhEe-00Fgkx-5u; Fri, 11 Jun 2021 15:30:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrhEd-00CnbF-Nc; Fri, 11 Jun 2021 15:30:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bastian Hecht <hechtb@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: input: touchscreen: st1232: Convert to json-schema
Date:   Fri, 11 Jun 2021 15:30:05 +0200
Message-Id: <fbba650cff07780c28ad6dd8dbef5cc1451b7762.1623418065.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the Sitronix st1232/st1633 touchscreen controller Device Tree
binding documentation to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../input/touchscreen/sitronix,st1232.yaml    | 50 +++++++++++++++++++
 .../input/touchscreen/sitronix-st1232.txt     | 28 -----------
 2 files changed, 50 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
new file mode 100644
index 0000000000000000..1d8ca19fd37ae3fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix st1232 or st1633 touchscreen controller
+
+maintainers:
+  - Bastian Hecht <hechtb@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sitronix,st1232
+      - sitronix,st1633
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpios:
+    description: A phandle to the reset GPIO
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            touchscreen@55 {
+                    compatible = "sitronix,st1232";
+                    reg = <0x55>;
+                    interrupts = <2 0>;
+                    gpios = <&gpio1 166 0>;
+            };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt b/Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt
deleted file mode 100644
index 019373253b28c08c..0000000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Sitronix st1232 or st1633 touchscreen controller
-
-Required properties:
-- compatible: must contain one of
-  * "sitronix,st1232"
-  * "sitronix,st1633"
-- reg: I2C address of the chip
-- interrupts: interrupt to which the chip is connected
-
-Optional properties:
-- gpios: a phandle to the reset GPIO
-
-For additional optional properties see: touchscreen.txt
-
-Example:
-
-	i2c@00000000 {
-		/* ... */
-
-		touchscreen@55 {
-			compatible = "sitronix,st1232";
-			reg = <0x55>;
-			interrupts = <2 0>;
-			gpios = <&gpio1 166 0>;
-		};
-
-		/* ... */
-	};
-- 
2.25.1


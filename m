Return-Path: <linux-input+bounces-415-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD36802316
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 12:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1429C1C203B8
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 11:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F68B670;
	Sun,  3 Dec 2023 11:32:32 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id C3188C1;
	Sun,  3 Dec 2023 03:32:28 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,247,1695654000"; 
   d="scan'208";a="188990132"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2023 20:32:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9C23A403E66D;
	Sun,  3 Dec 2023 20:32:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 04/11] dt-bindings: input: Convert da906{1,2,3} onkey to json-schema
Date: Sun,  3 Dec 2023 11:31:52 +0000
Message-Id: <20231203113159.92316-5-biju.das.jz@bp.renesas.com>
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

Convert the da906{1,2,3} onkey device tree binding documentation to
json-schema.

Update MAINTAINERS entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated MAINTAINERS entries.
v2:
 * New patch
---
 .../bindings/input/da9062-onkey.txt           | 47 --------------
 .../bindings/input/dlg,da9062-onkey.yaml      | 61 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 62 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/da9062-onkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml

diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt b/Documentation/devicetree/bindings/input/da9062-onkey.txt
deleted file mode 100644
index e5eef59a93dc..000000000000
--- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Dialog DA9061/62/63 OnKey Module
-
-This module is part of the DA9061/DA9062/DA9063. For more details about entire
-DA9062 and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt
-For DA9063 see Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
-
-This module provides the KEY_POWER event.
-
-Required properties:
-
-- compatible: should be one of the following valid compatible string lines:
-	"dlg,da9061-onkey", "dlg,da9062-onkey"
-	"dlg,da9062-onkey"
-	"dlg,da9063-onkey"
-
-Optional properties:
-
-- dlg,disable-key-power : Disable power-down using a long key-press. If this
-    entry exists the OnKey driver will remove support for the KEY_POWER key
-    press when triggered using a long press of the OnKey.
-
-Example: DA9063
-
-	pmic0: da9063@58 {
-		onkey {
-			compatible = "dlg,da9063-onkey";
-			dlg,disable-key-power;
-		};
-	};
-
-Example: DA9062
-
-	pmic0: da9062@58 {
-		onkey {
-			compatible = "dlg,da9062-onkey";
-			dlg,disable-key-power;
-		};
-	};
-
-Example: DA9061 using a fall-back compatible for the DA9062 onkey driver
-
-	pmic0: da9061@58 {
-		onkey {
-			compatible = "dlg,da9061-onkey", "dlg,da9062-onkey";
-			dlg,disable-key-power;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
new file mode 100644
index 000000000000..34f2e00cf045
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/dlg,da9062-onkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog DA9061/62/63 OnKey Module
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  This module is part of the DA9061/DA9062/DA9063. For more details about entire
+  DA9062 and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt
+  For DA906{1,2,3} see Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+
+  This module provides the KEY_POWER event.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - dlg,da9062-onkey
+              - dlg,da9063-onkey
+      - items:
+          - enum:
+              - dlg,da9061-onkey
+          - const: dlg,da9062-onkey # da9062-onkey fallback
+
+  dlg,disable-key-power:
+    type: boolean
+    description:
+      Disable power-down using a long key-press. If this entry exists
+      the OnKey driver will remove support for the KEY_POWER key press
+      when triggered using a long press of the OnKey.
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
+        compatible = "dlg,da9063";
+        reg = <0x58>;
+        interrupt-parent = <&gpio6>;
+        interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-controller;
+
+        onkey {
+          compatible = "dlg,da9063-onkey";
+          dlg,disable-key-power;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ab455fc2d64a..f2afaa22229d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6128,7 +6128,7 @@ DIALOG SEMICONDUCTOR DRIVERS
 M:	Support Opensource <support.opensource@diasemi.com>
 S:	Supported
 W:	http://www.dialog-semiconductor.com/products
-F:	Documentation/devicetree/bindings/input/da90??-onkey.txt
+F:	Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
 F:	Documentation/devicetree/bindings/input/dlg,da72??.txt
 F:	Documentation/devicetree/bindings/mfd/da90*.txt
 F:	Documentation/devicetree/bindings/mfd/dlg,da90*.yaml
-- 
2.39.2



Return-Path: <linux-input+bounces-1568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3956843C92
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 11:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24A881C29CA3
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 10:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514CC6F067;
	Wed, 31 Jan 2024 10:27:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B25569946;
	Wed, 31 Jan 2024 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696846; cv=none; b=MkuTujVWXCEdSo+J6MzdwI9m+lhTRrPx5uNCQOM+LNocYL7LRJTnsdEDZCZyRvX/Bda8lE1UO0lzaUFwllR5gTwOOPIqL0ExR5IIpghjTHqWcZM+gcedhOksNmWlDpogrLZUk6pz/EbnYROVCUXYcdyWfwslFpZQFULcf6+Fqpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696846; c=relaxed/simple;
	bh=zhfoulCMgDFiptKNGz12veM+H41fJTHzTtiB+OHREdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dsji8q7NPamdNv1mv5mCybs0hEPMBthgeKi7AaBgj1n9aw7Q4JY4hiTfIxz7s+PZh2S6sMZnzm8jNy1tUpvzxuggpjoOia/1ZQxKYzIM9F3KLwvAryUlNTvaK4/w0Q0FF02mwCI+5GG8Up6PGm97gKPXGfIDAZLetQA/5s49AWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,231,1701097200"; 
   d="scan'208";a="196288301"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2024 19:27:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1E6DB41DF0AB;
	Wed, 31 Jan 2024 19:27:15 +0900 (JST)
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
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v6 RESEND 3/6] dt-bindings: input: Convert da906{1,2,3} onkey to json-schema
Date: Wed, 31 Jan 2024 10:26:53 +0000
Message-Id: <20240131102656.3379-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102656.3379-1-biju.das.jz@bp.renesas.com>
References: <20240131102656.3379-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the da906{1,2,3} onkey device tree binding documentation to
json-schema.

Update MAINTAINERS entries, description and onkey property by
referring to dlg,da9062-onkey binding file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Lee Jones <lee@kernel.org>
---
v6->v6 resend:
 * Added Ack from Lee Jones.
v5->v6:
 * No change.
v4->v5:
 * Added Rb tag from Krzysztof and Conor
 * Dropped Items, Just enum as it is easier to read compatibles.
 * Retained tags as the changes are trivial.
v3->v4:
 * Squashed with patch#6 and patch#9 from v2.
 * Replaced enum->const for dlg,da9061-onkey and its fallback.
 * Dropped example
v2->v3:
 * Updated MAINTAINERS entries.
v2:
 * New patch
---
 .../bindings/input/da9062-onkey.txt           | 47 -------------------
 .../bindings/input/dlg,da9062-onkey.yaml      | 39 +++++++++++++++
 .../devicetree/bindings/mfd/da9062.txt        |  2 +-
 .../devicetree/bindings/mfd/dlg,da9063.yaml   | 15 +-----
 MAINTAINERS                                   |  2 +-
 5 files changed, 42 insertions(+), 63 deletions(-)
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
index 000000000000..757a522c102c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
@@ -0,0 +1,39 @@
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
+  For DA9063 see Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+
+  This module provides the KEY_POWER event.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - dlg,da9062-onkey
+          - dlg,da9063-onkey
+      - items:
+          - const: dlg,da9061-onkey
+          - const: dlg,da9062-onkey
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
diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index 18463b7fbb42..154c31fa4443 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -84,7 +84,7 @@ Sub-nodes:
   with the DA9062. There are currently no entries in this binding, however
   compatible = "dlg,da9062-rtc" should be added if a node is created.
 
-- onkey : See ../input/da9062-onkey.txt
+- onkey : See ../input/dlg,da9062-onkey.yaml
 
 - watchdog: See ../watchdog/dlg,da9062-watchdog.yaml
 
diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
index ce81e0b029cc..1e5a847a6be2 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -44,20 +44,7 @@ properties:
         const: dlg,da9063-rtc
 
   onkey:
-    type: object
-    $ref: /schemas/input/input.yaml#
-    unevaluatedProperties: false
-    properties:
-      compatible:
-        const: dlg,da9063-onkey
-
-      dlg,disable-key-power:
-        type: boolean
-        description: |
-          Disable power-down using a long key-press.
-          If this entry does not exist then by default the key-press triggered
-          power down is enabled and the OnKey will support both KEY_POWER and
-          KEY_SLEEP.
+    $ref: /schemas/input/dlg,da9062-onkey.yaml
 
   regulators:
     type: object
diff --git a/MAINTAINERS b/MAINTAINERS
index e0091af90973..2aab4f5d634a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6163,8 +6163,8 @@ DIALOG SEMICONDUCTOR DRIVERS
 M:	Support Opensource <support.opensource@diasemi.com>
 S:	Supported
 W:	http://www.dialog-semiconductor.com/products
-F:	Documentation/devicetree/bindings/input/da90??-onkey.txt
 F:	Documentation/devicetree/bindings/input/dlg,da72??.txt
+F:	Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
 F:	Documentation/devicetree/bindings/mfd/da90*.txt
 F:	Documentation/devicetree/bindings/mfd/dlg,da90*.yaml
 F:	Documentation/devicetree/bindings/regulator/da92*.txt
-- 
2.39.2



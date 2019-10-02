Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA71C87EE
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 14:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfJBMGx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 08:06:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:56992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfJBMGx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Oct 2019 08:06:53 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECB95218DE;
        Wed,  2 Oct 2019 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570018012;
        bh=BRjR7cgK8oDZRXoILOXWVS7VjsEqlprYhyXRBZYgXM0=;
        h=From:To:Cc:Subject:Date:From;
        b=uiWgwYHJMPqydTnL83AaLxC2EwSLbxNlla9OyLXqvRFm3DhDWFvOYCGJJtZQgQ3gA
         5pvLWiiOCeQjuxkhwem2HZu8yz08U/oS1nLOmCclKgxkwsWWV8q+6puP2abvfrZXLw
         SvHK8v/b2H+MTsA1w5AOuJs8UkgcdbAb+Cv4CwGE=
From:   Maxime Ripard <mripard@kernel.org>
To:     dmitry.torokhov@gmail.com, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] dt-bindings: serio: Convert Allwinner PS2 controller to a schema
Date:   Wed,  2 Oct 2019 14:06:45 +0200
Message-Id: <20191002120645.102805-1-mripard@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The older Allwinner SoCs have a PS2 controller that is supported in Linux,
with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../serio/allwinner,sun4i-a10-ps2.yaml        | 51 +++++++++++++++++++
 .../bindings/serio/allwinner,sun4i-ps2.txt    | 22 --------
 2 files changed, 51 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml
 delete mode 100644 Documentation/devicetree/bindings/serio/allwinner,sun4i-ps2.txt

diff --git a/Documentation/devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml b/Documentation/devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml
new file mode 100644
index 000000000000..ee9712f1c97d
--- /dev/null
+++ b/Documentation/devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serio/allwinner,sun4i-a10-ps2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 PS2 Host Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+description:
+  A20 PS2 is dual role controller (PS2 host and PS2 device). These
+  bindings for PS2 A10/A20 host controller. IBM compliant IBM PS2 and
+  AT-compatible keyboard and mouse can be connected.
+
+properties:
+  compatible:
+    const: allwinner,sun4i-a10-ps2
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun7i-a20-ccu.h>
+
+    ps20: ps2@1c2a000 {
+        compatible = "allwinner,sun4i-a10-ps2";
+        reg = <0x01c2a000 0x400>;
+        interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_APB1_PS20>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/serio/allwinner,sun4i-ps2.txt b/Documentation/devicetree/bindings/serio/allwinner,sun4i-ps2.txt
deleted file mode 100644
index 75996b6111bb..000000000000
--- a/Documentation/devicetree/bindings/serio/allwinner,sun4i-ps2.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Device tree bindings for Allwinner A10, A20 PS2 host controller
-
-A20 PS2 is dual role controller (PS2 host and PS2 device). These bindings are
-for PS2 A10/A20 host controller. IBM compliant IBM PS2 and AT-compatible keyboard
-and mouse can be connected.
-
-Required properties:
-
- - reg             : Offset and length of the register set for the device.
- - compatible      : Should be as of the following:
-                     - "allwinner,sun4i-a10-ps2"
- - interrupts      : The interrupt line connected to the PS2.
- - clocks          : The gate clk connected to the PS2.
-
-
-Example:
-	ps20: ps2@01c2a000 {
-		compatible = "allwinner,sun4i-a10-ps2";
-		reg = <0x01c2a000 0x400>;
-		interrupts = <0 62 4>;
-		clocks = <&apb1_gates 6>;
-	};
-- 
2.23.0


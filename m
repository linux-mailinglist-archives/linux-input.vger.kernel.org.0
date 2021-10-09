Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDDA427C02
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 18:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhJIQcL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 12:32:11 -0400
Received: from ixit.cz ([94.230.151.217]:42376 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229587AbhJIQcK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 12:32:10 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 5A6F320064;
        Sat,  9 Oct 2021 18:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633797011;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nBWOQv0pTlqmNgfp2b0RbFU2Q1khA5xPlByV7Wpeaf0=;
        b=caJFTm66qBUsNrdYhlndZ4xsVC5f0C1mMo4ZB+zgjkJEOyrkQd3lt9PZJHrZmBVkJl+ZPQ
        WR8H/sswop+ykf7siWd7oCYWp5A2ssrlTM3DnNZtqS8NNG/mngNkafcrKjOs413TnJBJY6
        VyQEaoE/fXBdx3Gba6QSa1vPhMZDPEY=
From:   David Heidelberg <david@ixit.cz>
To:     Duson Lin <dusonlin@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH] dt-bindings: input: elan,ekth3000: Convert txt bindings to yaml
Date:   Sat,  9 Oct 2021 18:28:45 +0200
Message-Id: <20211009162845.44378-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert Elan touchpad documentation to the YAML syntax.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/input/elan,ekth3000.yaml         | 76 +++++++++++++++++++
 .../devicetree/bindings/input/elan_i2c.txt    | 44 -----------
 2 files changed, 76 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/elan,ekth3000.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/elan_i2c.txt

diff --git a/Documentation/devicetree/bindings/input/elan,ekth3000.yaml b/Documentation/devicetree/bindings/input/elan,ekth3000.yaml
new file mode 100644
index 000000000000..2a1961ac15ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/elan,ekth3000.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/elan,ekth3000.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Elantech I2C Touchpad
+
+maintainers:
+  - Duson Lin <dusonlin@emc.com.tw>
+
+allOf:
+  - $ref: touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    const: elan,ekth3000
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source:
+    type: boolean
+    description: touchpad can be used as a wakeup source
+
+  vcc-supply:
+    description: a phandle for the regulator supplying 3.3V power
+
+  elan,trackpoint:
+    type: boolean
+    description: touchpad can support a trackpoint
+
+  elan,clickpad:
+    type: boolean
+    description: touchpad is a clickpad (the entire surface is a button)
+  elan,middle-button:
+    type: boolean
+    description: touchpad has a physical middle button
+
+  elan,x_traces:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: number of antennas on the x axis
+  elan,y_traces:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: number of antennas on the y axis
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-x-mm: true
+  touchscreen-y-mm: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchpad@15 {
+            compatible = "elan,ekth3000";
+            reg = <0x15>;
+            interrupt-parent = <&gpio4>;
+            interrupts = <0x0 IRQ_TYPE_EDGE_FALLING>;
+            wakeup-source;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/elan_i2c.txt b/Documentation/devicetree/bindings/input/elan_i2c.txt
deleted file mode 100644
index 9963247706f2..000000000000
--- a/Documentation/devicetree/bindings/input/elan_i2c.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Elantech I2C Touchpad
-
-Required properties:
-- compatible: must be "elan,ekth3000".
-- reg: I2C address of the chip.
-- interrupts: interrupt to which the chip is connected (see interrupt
-  binding[0]).
-
-Optional properties:
-- wakeup-source: touchpad can be used as a wakeup source.
-- pinctrl-names: should be "default" (see pinctrl binding [1]).
-- pinctrl-0: a phandle pointing to the pin settings for the device (see
-  pinctrl binding [1]).
-- vcc-supply: a phandle for the regulator supplying 3.3V power.
-- elan,trackpoint: touchpad can support a trackpoint (boolean)
-- elan,clickpad: touchpad is a clickpad (the entire surface is a button)
-- elan,middle-button: touchpad has a physical middle button
-- elan,x_traces: number of antennas on the x axis
-- elan,y_traces: number of antennas on the y axis
-- some generic touchscreen properties [2]:
-  * touchscreen-size-x
-  * touchscreen-size-y
-  * touchscreen-x-mm
-  * touchscreen-y-mm
-
-
-[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-[1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
-
-Example:
-	&i2c1 {
-		/* ... */
-
-		touchpad@15 {
-			compatible = "elan,ekth3000";
-			reg = <0x15>;
-			interrupt-parent = <&gpio4>;
-			interrupts = <0x0 IRQ_TYPE_EDGE_FALLING>;
-			wakeup-source;
-		};
-
-		/* ... */
-	};
-- 
2.33.0


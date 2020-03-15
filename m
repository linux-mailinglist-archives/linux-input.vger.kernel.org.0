Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC7D9185BD1
	for <lists+linux-input@lfdr.de>; Sun, 15 Mar 2020 11:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgCOKEY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Mar 2020 06:04:24 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:50276 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgCOKEY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Mar 2020 06:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1584266661; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=OPgCFclnK+dYLWIKySdQ0LeSCQYlJQFqnweXUYr2lRo=;
        b=ysAKBEQwfZwp6cOlmO4u+3BgcS/CCdEDygsjhdOMkCSKoxy6/WEn1P5MGahPXsWKU3c7W8
        Rd/6leiWLqbLWtQdq/U3ztJJX7cEoDhYyqRou0GzIyYMSQmrGUwYYTR1yWU/HRiUQIQ/tC
        /POQvZVhIAQWEplzYVD3EJg05swJNRs=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] dt-bindings: input: Update atmel,maxtouch.txt to YAML
Date:   Sun, 15 Mar 2020 11:04:15 +0100
Message-Id: <20200315100416.14151-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Update atmel,maxtouch.txt to YAML. The new 'vdd-supply' property was
added in the process.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/input/atmel,maxtouch.txt         | 41 -----------
 .../bindings/input/atmel,maxtouch.yaml        | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.txt
 create mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
deleted file mode 100644
index c88919480d37..000000000000
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Atmel maXTouch touchscreen/touchpad
-
-Required properties:
-- compatible:
-    atmel,maxtouch
-
-    The following compatibles have been used in various products but are
-    deprecated:
-	atmel,qt602240_ts
-	atmel,atmel_mxt_ts
-	atmel,atmel_mxt_tp
-	atmel,mXT224
-
-- reg: The I2C address of the device
-
-- interrupts: The sink for the touchpad's IRQ output
-    See ../interrupt-controller/interrupts.txt
-
-Optional properties for main touchpad device:
-
-- linux,gpio-keymap: When enabled, the SPT_GPIOPWN_T19 object sends messages
-    on GPIO bit changes. An array of up to 8 entries can be provided
-    indicating the Linux keycode mapped to each bit of the status byte,
-    starting at the LSB. Linux keycodes are defined in
-    <dt-bindings/input/input.h>.
-
-    Note: the numbering of the GPIOs and the bit they start at varies between
-    maXTouch devices. You must either refer to the documentation, or
-    experiment to determine which bit corresponds to which input. Use
-    KEY_RESERVED for unused padding values.
-
-- reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
-
-Example:
-
-	touch@4b {
-		compatible = "atmel,maxtouch";
-		reg = <0x4b>;
-		interrupt-parent = <&gpio>;
-		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
-	};
diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
new file mode 100644
index 000000000000..1b138a9836bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel maXTouch touchscreen/touchpad DT bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  compatible:
+    enum:
+      - atmel,maxtouch
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description: Phandle to regulator providing power to the touchscreen
+
+  linux,gpio-keymap:
+    minItems: 1
+    maxItems: 8
+    description: >
+      When enabled, the SPT_GPIOPWN_T19 object sends messages
+      on GPIO bit changes. An array of up to 8 entries can be provided
+      indicating the Linux keycode mapped to each bit of the status byte,
+      starting at the LSB. Linux keycodes are defined in
+      <dt-bindings/input/input.h>.
+
+      Note: the numbering of the GPIOs and the bit they start at varies between
+      maXTouch devices. You must either refer to the documentation, or
+      experiment to determine which bit corresponds to which input. Use
+      KEY_RESERVED for unused padding values.
+
+  reset-gpios:
+    description: GPIO specifier for the touchscreen's reset pin (active low)
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
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mxt224-touchscreen@4a {
+        compatible = "atmel,maxtouch";
+        reg = <0x4a>;
+
+        interrupt-parent = <&gpx0>;
+        interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+
+        vdd-supply = <&tsp_reg>;
+      };
+    };
-- 
2.25.1


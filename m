Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919792CD69C
	for <lists+linux-input@lfdr.de>; Thu,  3 Dec 2020 14:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387869AbgLCNW4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Dec 2020 08:22:56 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:8186 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387653AbgLCNW4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Dec 2020 08:22:56 -0500
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Dec 2020 08:22:54 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607001603;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=CTgCZe7d7nfdeH38bxJEE0AJMFZdf1suWYy3usg1nro=;
        b=rWEEgPvsXl2KcmCjSzDKpKkVdAwCjiBIvBXPcKuU5twWnKdLzns+BlPfD98bNo2Bmb
        LMiKDqKmBm7B+4itx6Pr6Tog8LYwE3I9o/aHcmSr7Q3BYk+mjkcQKT9kTeGJ3rp5DtzL
        ezW762dDTeRfxZ3u6b/H7Ru9c3hidj1s3miJbzMaJN8PwCNuZ2A1tWpge+T80vaq7Uxw
        kmji/qr/CwRY0zxEfYQ4EZ5l8AVh8pclceXQCsXSt4jHhy9++S1vz+0kW1BK3oYgSId4
        dC1lyYPB8iA6lwEwCwfU3dZTYHIcjn3KaKcP/bb+4q/T9oKnL1JIZo3TfMLPPwqbEbyL
        vmjg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5G6JlbU="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id Z061efwB3DDuqib
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 3 Dec 2020 14:13:56 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] dt-bindings: Input: tm2-touchkey - convert to yaml
Date:   Thu,  3 Dec 2020 14:12:40 +0100
Message-Id: <20201203131242.44397-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the device tree bindings for tm2-touchkey to the YAML format.

While we're at it, clarify the descriptions a bit to make it clear that
this driver can be used for many different MCUs that all implement
a similar I2C protocol. Depending on the MCU the voltage requirements
may be different, on some devices the controller uses 2.2V, 2.8V or
even 3.3V for vcc-supply instead of 1.8V.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/input/cypress,tm2-touchkey.txt   | 33 ---------
 .../bindings/input/cypress,tm2-touchkey.yaml  | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml

diff --git a/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt b/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
deleted file mode 100644
index 921172f689b8..000000000000
--- a/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Samsung tm2-touchkey
-
-Required properties:
-- compatible:
-    * "cypress,tm2-touchkey" - for the touchkey found on the tm2 board
-    * "cypress,midas-touchkey" - for the touchkey found on midas boards
-    * "cypress,aries-touchkey" - for the touchkey found on aries boards
-    * "coreriver,tc360-touchkey" - for the Coreriver TouchCore 360 touchkey
-- reg: I2C address of the chip.
-- interrupts: interrupt to which the chip is connected (see interrupt
-	binding[0]).
-- vcc-supply : internal regulator output. 1.8V
-- vdd-supply : power supply for IC 3.3V
-
-Optional properties:
-- linux,keycodes: array of keycodes (max 4), default KEY_PHONE and KEY_BACK
-
-[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-
-Example:
-	&i2c0 {
-		/* ... */
-
-		touchkey@20 {
-			compatible = "cypress,tm2-touchkey";
-			reg = <0x20>;
-			interrupt-parent = <&gpa3>;
-			interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
-			vcc-supply=<&ldo32_reg>;
-			vdd-supply=<&ldo33_reg>;
-			linux,keycodes = <KEY_PHONE KEY_BACK>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml b/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml
new file mode 100644
index 000000000000..90d4def83182
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/cypress,tm2-touchkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung TM2 touch key controller
+
+maintainers:
+  - Stephan Gerhold <stephan@gerhold.net>
+
+description: |
+  Touch key controllers similar to the TM2 can be found in a wide range of
+  Samsung devices. They are implemented using many different MCUs, but use
+  a similar I2C protocol.
+
+allOf:
+  - $ref: input.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cypress,tm2-touchkey
+      - cypress,midas-touchkey
+      - cypress,aries-touchkey
+      - coreriver,tc360-touchkey
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description: Optional regulator for LED voltage, 3.3V.
+
+  vcc-supply:
+    description: Optional regulator for MCU, 1.8V-3.3V (depending on MCU).
+
+  linux,keycodes:
+    minItems: 1
+    maxItems: 4
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
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchkey@20 {
+            compatible = "cypress,tm2-touchkey";
+            reg = <0x20>;
+            interrupt-parent = <&gpa3>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            vcc-supply = <&ldo32_reg>;
+            vdd-supply = <&ldo33_reg>;
+            linux,keycodes = <KEY_MENU KEY_BACK>;
+        };
+    };
-- 
2.29.2


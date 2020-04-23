Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5D41B6217
	for <lists+linux-input@lfdr.de>; Thu, 23 Apr 2020 19:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729973AbgDWRim (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Apr 2020 13:38:42 -0400
Received: from ip-78-45-52-129.net.upcbroadband.cz ([78.45.52.129]:46432 "EHLO
        ixit.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729908AbgDWRim (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Apr 2020 13:38:42 -0400
X-Greylist: delayed 312 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 Apr 2020 13:38:40 EDT
Received: from localhost.localdomain (227.146.230.94.awnet.cz [94.230.146.227])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 58C6524E0F;
        Thu, 23 Apr 2020 19:33:28 +0200 (CEST)
From:   David Heidelberg <david@ixit.cz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: input: touchscreen: elants_i2c: convert to YAML
Date:   Thu, 23 Apr 2020 19:32:53 +0200
Message-Id: <20200423173253.711725-2-david@ixit.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200423173253.711725-1-david@ixit.cz>
References: <20200423173253.711725-1-david@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert elants_i2c.txt DT binding to YAML and put into correct directory.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/input/elants_i2c.txt  | 34 ---------
 .../input/touchscreen/elan,elants_i2c.yaml    | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/elants_i2c.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml

diff --git a/Documentation/devicetree/bindings/input/elants_i2c.txt b/Documentation/devicetree/bindings/input/elants_i2c.txt
deleted file mode 100644
index 5edac8be0802..000000000000
--- a/Documentation/devicetree/bindings/input/elants_i2c.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Elantech I2C Touchscreen
-
-Required properties:
-- compatible: must be "elan,ekth3500".
-- reg: I2C address of the chip.
-- interrupts: interrupt to which the chip is connected (see interrupt
-  binding[0]).
-
-Optional properties:
-- wakeup-source: touchscreen can be used as a wakeup source.
-- pinctrl-names: should be "default" (see pinctrl binding [1]).
-- pinctrl-0: a phandle pointing to the pin settings for the device (see
-  pinctrl binding [1]).
-- reset-gpios: reset gpio the chip is connected to.
-- vcc33-supply: a phandle for the regulator supplying 3.3V power.
-- vccio-supply: a phandle for the regulator supplying IO power.
-
-[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-[1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-Example:
-	&i2c1 {
-		/* ... */
-
-		touchscreen@10 {
-			compatible = "elan,ekth3500";
-			reg = <0x10>;
-			interrupt-parent = <&gpio4>;
-			interrupts = <0x0 IRQ_TYPE_EDGE_FALLING>;
-			wakeup-source;
-		};
-
-		/* ... */
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
new file mode 100644
index 000000000000..a792d6377b1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/input/touchscreen/elan,elants_i2c.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Elantech I2C Touchscreen
+
+maintainers:
+  - David Heidelberg <david@ixit.cz>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - elan,ektf3624
+      - elan,ekth3500
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source:
+    type: boolean
+    description: touchscreen can be used as a wakeup source.
+
+  reset-gpios:
+    description: reset gpio the chip is connected to.
+
+  vcc33-supply:
+    description: a phandle for the regulator supplying 3.3V power.
+
+  vccio-supply:
+    description: a phandle for the regulator supplying IO power.
+
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@10 {
+            compatible = "elan,ekth3500";
+            reg = <0x10>;
+
+            interrupt-parent = <&gpio4>;
+            interrupts = <0x0 IRQ_TYPE_EDGE_FALLING>;
+            wakeup-source;
+        };
+    };
-- 
2.26.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EADF41B927D
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 19:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgDZRsD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 13:48:03 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:19424 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgDZRr6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 13:47:58 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499Fk42VKNzHm;
        Sun, 26 Apr 2020 19:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587923276; bh=VVHDBG7wI4JZcl43VJfD/dKYlksYXkwfm3IxtXgBjYo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=dCC6omVNi/3omstHxngq+reUIrkw9xK5iiw1bk+dIjEtkGXzbkgg4cVGcHubhMjYz
         cnM0Vg+1FTrmC4WWqSfcQZ4P05Te/+RqLTEj1mhV90rMTGi0wbJNSRirXtCnHLNWe7
         ucuKIUJGuF7VQNjAgCvJ3KIIxU3h34Zr4HfudUhRXfxWnfL8yS9vCI4OlO1eZhOmcW
         4qliKBR99LX2S+GJlimduOxTWRtBbrY77BrbCTbZjCR2B9h55C6XLGaLYNBSMaglUy
         lSBtwSldp9FaTCj4CNpEpVTLEdKRGJLmYR9cyoIbdjD/tdjSd4817RHZzUkEvOlDCb
         nkkLWJOn4tcug==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 19:47:55 +0200
Message-Id: <e8becd365c8c083e31a502568ebabb1019d4ee2d.1587923061.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 10/10] dt-bindings: input: touchscreen: elants_i2c: convert
 to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: David Heidelberg <david@ixit.cz>

Convert elants_i2c.txt DT binding to YAML and put into correct directory.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/input/elants_i2c.txt  | 38 ----------
 .../input/touchscreen/elan,elants_i2c.yaml    | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elants_i2c.txt b/Documentation/devicetree/bindings/input/elants_i2c.txt
deleted file mode 100644
index 1bc60303f0ea..000000000000
--- a/Documentation/devicetree/bindings/input/elants_i2c.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Elantech I2C Touchscreen
-
-Required properties:
-- compatible: must be "elan,ekth3500" or "elan,ektf3624".
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
-- see [2] for additional properties
-
-For additional optional properties see: touchscreen.txt
-
-[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-[1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
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
2.20.1


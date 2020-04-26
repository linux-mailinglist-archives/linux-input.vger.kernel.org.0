Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC5D1B9178
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgDZQLU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:11:20 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:45311 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726284AbgDZQLU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:11:20 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499CZZ2XMmzwy;
        Sun, 26 Apr 2020 18:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587917478; bh=pLd6gI8UsCtCyhmvOgm9x0+Kq3kK3Z23+Rp586y0csg=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=pbhLM48Il2zWD2AmWmcGIwyxS3T3gHFcj6K0SwXKJ0HWISgKXjNfaIJAAdr6ICR0h
         yq57N9sZBSicMtNA7YcKuL27azSKnG8vJjGXJoEYF/fbUu0Ac2767y0WhctvuWe0pV
         CcK0C7KVYsbPO9VJsB5wAV8CS+aHZQ6ePQOHnaUW0zwj0U0YrXuP+OFq3YfcrancG5
         TKVHfYrIb8UK04zbDPRQiZnFXwLWSCBh2oGlEKbU0GhA0iyT113i1R2Wy0CM7qxALc
         8HDGpgGpC+264OGk5M7xAhHbwgcpJrHYgyl2u3mkaq1ChOSb15d5mGq3m63nFjdVxk
         sWAz68IS8GDAA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 18:11:17 +0200
Message-Id: <222105a9c09ac85f0c03224ef7acb8a6d6e237d5.1587916846.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 10/10] dt-bindings: input: touchscreen: elants_i2c: convert
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
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
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


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7296031CE2F
	for <lists+linux-input@lfdr.de>; Tue, 16 Feb 2021 17:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhBPQi2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 11:38:28 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:54194 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhBPQi1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 11:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1613493451; bh=61cjcV4vm7hp71QE5K1+zqR55gWG1VsNotJuszOLCrU=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
         MIME-Version:Content-Transfer-Encoding;
        b=OhNVi2XToQ9AKmWbmQ88UVd8SYjN0GMqsOen80rJjp/d0S6W+2VgIY3ahC5Z6u/ky
         iCeId483TnX/x/CyV4s0tx1pyEPzIuOE++QsVd6ZSFAIwEpHCkPpn2yUk6h/VTxokG
         2GvHYElFgZVyerEivQwLGoLiNFDrhqS3fe7QCKrM=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Tue, 16 Feb 2021 17:37:31 +0100 (CET)
X-EA-Auth: Ahv/PLdy1jtD33SUIK3JDAsmna0BaNxMNZt2HApz8wZSL2Hm6YlLvN7iixpgk5Ba8rcEVGUTXU+4h014UqPUdYGr6eIO2wCJirNzhgP6ErI=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: input/touchscreen: add bindings for msg2638
Date:   Tue, 16 Feb 2021 17:36:37 +0100
Message-Id: <20210216163647.34264-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds dts bindings for the mstar msg2638 touchscreen.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
Changed in v5: nothing
Changed in v4:
- don't use wildcards in compatible strings (Rob H)
- rename from msg26xx to msg2638
- rename example pinctrl-0 to &ts_int_reset_default for consistency
Changed in v3:
- added `touchscreen-size-x: true` and `touchscreen-size-y: true` properties
Changed in v2:
- changed M-Star to MStar in title line
- changed reset gpio to active-low in example section
---
 .../input/touchscreen/mstar,msg2638.yaml      | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
new file mode 100644
index 000000000000..12f44d9e4d41
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/mstar,msg2638.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar msg2638 touchscreen controller Bindings
+
+maintainers:
+  - Vincent Knecht <vincent.knecht@mailoo.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: mstar,msg2638
+
+  reg:
+    const: 0x26
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: Power supply regulator for the chip
+
+  vddio-supply:
+    description: Power supply regulator for the I2C bus
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@26 {
+        compatible = "mstar,msg2638";
+        reg = <0x26>;
+        interrupt-parent = <&msmgpio>;
+        interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&msmgpio 100 GPIO_ACTIVE_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&ts_int_reset_default>;
+        vdd-supply = <&pm8916_l17>;
+        vddio-supply = <&pm8916_l5>;
+        touchscreen-size-x = <720>;
+        touchscreen-size-y = <1280>;
+      };
+    };
+
+...
-- 
2.29.2




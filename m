Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13E82FF24C
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 18:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388938AbhAURp7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 12:45:59 -0500
Received: from msg-2.mailo.com ([213.182.54.12]:49144 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388987AbhAURps (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 12:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1611251056; bh=yDRRZw5pkRK++DBQV9BF8M/0EOWbSJfi9/2x6S2Gfqo=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
         MIME-Version:Content-Transfer-Encoding;
        b=bNnntQ2OEwj+eMYrLUf4wNUEOtoAGH5+/JQdJGMeunLwOYAmmT+etU2JbV2wrju2c
         /QSGXenFyKshNRcXIWDx/VfAmvUOAk6q3QIiFQ6jZz/d+Ysnt4kK9T6ITTr1EDLBrc
         t4YLk5Hob83RI1vd8rmTTAGzfuYk1Ji3np6+fWjE=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Thu, 21 Jan 2021 18:44:16 +0100 (CET)
X-EA-Auth: yvnxX2YCMXfd8+j5vum/rlMzFImFoka0+8XUJVCOReMxMR5Cci/wevHfDaVtigmpJxionMsX21uMIXROVD/F7cehNkoysxV80Su6uSka/Lw=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v3 1/2] dt-bindings: input/touchscreen: add bindings for msg26xx
Date:   Thu, 21 Jan 2021 18:43:47 +0100
Message-Id: <20210121174359.1455393-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds dts bindings for the mstar msg26xx touchscreen.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
Changed in v3:
- added `touchscreen-size-x: true` and `touchscreen-size-y: true` properties
Changed in v2:
- changed M-Star to MStar in title line
- changed reset gpio to active-low in example section
---
 .../input/touchscreen/mstar,msg26xx.yaml      | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
new file mode 100644
index 000000000000..5d26a1008bf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/mstar,msg26xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar msg26xx touchscreen controller Bindings
+
+maintainers:
+  - Vincent Knecht <vincent.knecht@mailoo.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: mstar,msg26xx
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
+        compatible = "mstar,msg26xx";
+        reg = <0x26>;
+        interrupt-parent = <&msmgpio>;
+        interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&msmgpio 100 GPIO_ACTIVE_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&ts_int_active>;
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




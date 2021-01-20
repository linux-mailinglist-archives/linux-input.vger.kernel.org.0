Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711DC2FD9D2
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 20:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388071AbhATSok (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Jan 2021 13:44:40 -0500
Received: from msg-2.mailo.com ([213.182.54.12]:45534 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404659AbhATS01 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jan 2021 13:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1611165723; bh=le8GKqnpf07xFgYkEQht38PiHCLXIAgWGRaKmqWgx3k=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
         MIME-Version:Content-Transfer-Encoding;
        b=SUtAYyrHEQqJ3VhWvn3oAio4Wgb/2axtvDeKd9WRu8xWcTDTqZHJ8Jo5AYtubej+S
         W8RUEbLHuf/n5f2qRsD19gSsy9ei4r49lNj/857Y97UtnxgVtFkNwGv0LvKjp+NP6q
         R7fSCuHXSIwKZk5WkLmvgrgavXpMZvFf3hHFpKxg=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Wed, 20 Jan 2021 19:02:03 +0100 (CET)
X-EA-Auth: EvUWT4BUI8p9MqU6ezCA/ldRkY1BoQkU59gI+gq+K5b96B31dFa1af3Rfjs/6guuEcgR5A520V/zHKHaw6nezV8wzro/8ZGcHy8yiOaG26s=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 1/2] dt-bindings: input/touchscreen: add bindings for msg26xx
Date:   Wed, 20 Jan 2021 19:01:07 +0100
Message-Id: <20210120180119.849588-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds dts bindings for the mstar msg26xx touchscreen.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 .../input/touchscreen/mstar,msg26xx.yaml      | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
new file mode 100644
index 000000000000..50e1c8495cd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/mstar,msg26xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: M-Star msg26xx touchscreen controller Bindings
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
+        reset-gpios = <&msmgpio 100 GPIO_ACTIVE_HIGH>;
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




Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04960316D5C
	for <lists+linux-input@lfdr.de>; Wed, 10 Feb 2021 18:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbhBJRxa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Feb 2021 12:53:30 -0500
Received: from ip-15.mailobj.net ([213.182.54.15]:36928 "EHLO msg-4.mailo.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233394AbhBJRxR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Feb 2021 12:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1612978454; bh=EXG7f7uNuaToBdDu8mdjVFdsXTtJGfa9dWahPfAMOKs=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
         MIME-Version:Content-Transfer-Encoding;
        b=YSvRQy0e5tYpdB0gkwZJlqcVagIyjF277QHXddXCKXqaEleE/JRVyFb8stWMHqRgK
         w/5MxPNHtp3hRcsP5/6lZI2RrCYbBcSIoOD2oaXLy1zbIpGZl+OKRmG3bgE41qwK31
         udCtG3RvR8WXiQoTRhTCkg4Rmy0KlF4NOcoU+cBs=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Wed, 10 Feb 2021 18:34:13 +0100 (CET)
X-EA-Auth: Jn1gIZeHdPCnKZ3x43DoTVcJ6WAq6xemBNdS8aTzyQQ4kLdZCyLrp3HFlwQR8olvu5D2A1I63k+EebvUDUGkhNou/bO5U/iiUfxdaEQEG7o=
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
Subject: [PATCH v4 1/2] dt-bindings: input/touchscreen: add bindings for msg2638
Date:   Wed, 10 Feb 2021 18:33:51 +0100
Message-Id: <20210210173403.667482-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds dts bindings for the mstar msg2638 touchscreen.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
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




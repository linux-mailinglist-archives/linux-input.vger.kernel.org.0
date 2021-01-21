Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1F62FE916
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 12:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730332AbhAULkz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 06:40:55 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:39164 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730362AbhAULkv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 06:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1611229161; bh=gx2xN8p0PTbeaZMZMJNHoRSUTMV0yxFfQDZSoDI5YcQ=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
         MIME-Version:Content-Transfer-Encoding;
        b=cpDepdyervIK8zmbW+8PPEWzNvhuJ8FiPQEs5bsNqDgH30U+bEGdsMfcCkUlwmnO3
         BBPYdsarVlaEiO8DRumsNoU3nDtccMSf1inOhosS5Gj9mUWfIiDovPz+avjWyhjwdq
         E4QDdfxjtu76q8/R3MhNd9GQNY2SMfuv8OGfdTs4=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Thu, 21 Jan 2021 12:39:21 +0100 (CET)
X-EA-Auth: NAR8yWs8WWV1oQ3PgjFi+9sPda5uIBshXZF+jqGgKP0D5zQxvcICe/vI2iWZ2S1SxtJL5m4OJ2uTzSFRTrC34SYFZ5tdsCXM35u+lp1u4XM=
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
Subject: [PATCH v2 1/2] dt-bindings: input/touchscreen: add bindings for msg26xx
Date:   Thu, 21 Jan 2021 12:38:52 +0100
Message-Id: <20210121113904.1272852-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds dts bindings for the mstar msg26xx touchscreen.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
Changed in v2:
- changed M-Star to MStar in title line
- changed reset gpio to active-low in example section
---
 .../input/touchscreen/mstar,msg26xx.yaml      | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
new file mode 100644
index 000000000000..ddac0ce057c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
@@ -0,0 +1,66 @@
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




Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80BB367E7F
	for <lists+linux-input@lfdr.de>; Thu, 22 Apr 2021 12:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235791AbhDVKTJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Apr 2021 06:19:09 -0400
Received: from mail.ilitek.com.tw ([60.248.80.92]:42320 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235097AbhDVKTJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Apr 2021 06:19:09 -0400
X-UUID: 9030aeda153247179e58f4009fc66e0e-20210422
X-UUID: 9030aeda153247179e58f4009fc66e0e-20210422
Received: from ex2.ili.com.tw [(192.168.1.132)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 220770923; Thu, 22 Apr 2021 18:18:27 +0800
Received: from EX2.ili.com.tw (192.168.1.132) by EX2.ili.com.tw
 (192.168.1.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 22 Apr
 2021 18:18:25 +0800
Received: from joehung-Ilitek.mshome.net (192.168.18.73) by EX2.ili.com.tw
 (192.168.1.133) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 22 Apr 2021 18:18:25 +0800
From:   Joe Hung <joe_hung@ilitek.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <joe_hung@ilitek.com>,
        <luca_hsu@ilitek.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c: Add bindings
Date:   Thu, 22 Apr 2021 18:18:27 +0800
Message-ID: <20210422101828.65371-1-joe_hung@ilitek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add binding documentation for ILITEK touch devices.

Signed-off-by: Joe Hung <joe_hung@ilitek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v8:
  - None

Changes in v7:
  - None

Changes in v6:
  - Add Reviewed-by trailer

Changes in v5:
  - Remove tab in yaml

Changes in v4:
  - Change IRQ flag to level interrupt
  - Add support for common touchscreen-related properties
  - Modify reset gpio to active low
  - Modify irq type to LEVEL_LOW
  - Add compatible for Lego series ICs

Changes in v3:
  - Add include header in examples, and pass the dt binding check

Changes in v2:
  - Convert to DT schema format
  - Using interrupts instead of irq-gpios

 .../input/touchscreen/ilitek_ts_i2c.yaml      | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
new file mode 100644
index 000000000000..a190e7baac31
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/ilitek_ts_i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek I2C Touchscreen Controller
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ilitek,ili2130
+      - ilitek,ili2131
+      - ilitek,ili2132
+      - ilitek,ili2316
+      - ilitek,ili2322
+      - ilitek,ili2323
+      - ilitek,ili2326
+      - ilitek,ili2520
+      - ilitek,ili2521
+
+  reg:
+    const: 0x41
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  wakeup-source:
+    type: boolean
+    description: touchscreen can be used as a wakeup source.
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@41 {
+            compatible = "ilitek,ili2520";
+            reg = <0x41>;
+
+            interrupt-parent = <&gpio1>;
+            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+            touchscreen-inverted-y;
+            wakeup-source;
+        };
+    };
--
2.25.1



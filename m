Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACAF331D574
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 07:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhBQGtW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 01:49:22 -0500
Received: from mail.ilitek.com ([60.248.80.92]:58554 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229553AbhBQGtV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 01:49:21 -0500
X-UUID: d76856d363cb4fc5b66720f90e22847a-20210217
X-UUID: d76856d363cb4fc5b66720f90e22847a-20210217
Received: from ex1.ili.com.tw [(192.168.1.131)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Cellopoint E-mail Firewall v4.1.12 Build 0701 with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 1677636651; Wed, 17 Feb 2021 14:41:59 +0800
Received: from EX1.ili.com.tw (192.168.1.131) by EX1.ili.com.tw
 (192.168.1.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 17 Feb
 2021 14:41:57 +0800
Received: from joehung-Ilitek.ili.com.tw (192.168.18.73) by EX1.ili.com.tw
 (192.168.1.133) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 17 Feb 2021 14:41:57 +0800
From:   Joe Hung <joe_hung@ilitek.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <joe_hung@ilitek.com>,
        <luca_hsu@ilitek.com>
Subject: [PATCH v2 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c: Add bindings
Date:   Wed, 17 Feb 2021 14:41:54 +0800
Message-ID: <20210217064155.126173-1-joe_hung@ilitek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add binding documentation for ILITEK touch devices.

Signed-off-by: Joe Hung <joe_hung@ilitek.com>
---
Changes in v2:
  - Convert bindings file to DT schema format
  - Using interrupts instead of irq-gpios

 .../input/touchscreen/ilitek_ts_i2c.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
new file mode 100644
index 000000000000..f2e710cf4505
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
@@ -0,0 +1,45 @@
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
+properties:
+  compatible:
+    enum:
+      - ilitek,ili2520
+      - ilitek,ili2510
+  reg:
+    const: 0x41
+  interrupts:
+    maxItems: 1
+  reset-gpios:
+    maxItems: 1
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        touchscreen@41 {
+                compatible = "ilitek,ili2520";
+                reg = <0x41>;
+                interrupt-parent = <&gpio1>;
+                interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+                reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+        };
+    };
--
2.25.1



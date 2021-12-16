Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD594780B5
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 00:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhLPXgB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 18:36:01 -0500
Received: from finn.gateworks.com ([108.161.129.64]:36186 "EHLO
        finn.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229673AbhLPXgB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 18:36:01 -0500
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by finn.localdomain with esmtp (Exim 4.93)
        (envelope-from <tharvey@gateworks.com>)
        id 1my0I4-0093bq-4T; Thu, 16 Dec 2021 23:36:00 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>
Subject: [RFC PATCH 2/3] dt-bindings: touchscreen: Add dfr0550 bindings
Date:   Thu, 16 Dec 2021 15:35:56 -0800
Message-Id: <20211216233557.9393-3-tharvey@gateworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211216233557.9393-1-tharvey@gateworks.com>
References: <20211216233557.9393-1-tharvey@gateworks.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds device tree bindings for the touchscreen controller used on
the DFRobot DFR0550 touchscreen.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 .../bindings/input/touchscreen/dfr0550.yaml   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/dfr0550.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/dfr0550.yaml b/Documentation/devicetree/bindings/input/touchscreen/dfr0550.yaml
new file mode 100644
index 000000000000..77373211b4d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/dfr0550.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/dfr0550.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DFRobot DFR0550 Touch Controller Bindings
+
+maintainers:
+  - Tim Harvey <tharvey@gateworks.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: dfr,dfr0550
+
+  reg:
+    maxItems: 1
+
+  poll-interval:
+    description: Poll interval time in milliseconds.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-fuzz-x: true
+  touchscreen-fuzz-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - poll-interval
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@38 {
+        compatible = "dfr,dfr0550";
+        reg = <0x38>;
+      };
+    };
+
+...
-- 
2.17.1


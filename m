Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25B3511601
	for <lists+linux-input@lfdr.de>; Wed, 27 Apr 2022 13:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbiD0L3O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Apr 2022 07:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232770AbiD0L3E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Apr 2022 07:29:04 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDFD9340F2;
        Wed, 27 Apr 2022 04:25:53 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD0691474;
        Wed, 27 Apr 2022 04:25:53 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EE603F5A1;
        Wed, 27 Apr 2022 04:25:52 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 05/11] dt-bindings: serio: add Arm PL050 DT schema
Date:   Wed, 27 Apr 2022 12:25:22 +0100
Message-Id: <20220427112528.4097815-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427112528.4097815-1-andre.przywara@arm.com>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Arm PL050 "Keyboard/Mouse Interface" is an Arm system IP providing a
PS/2 compatible serial interface.

Add a simple DT schema binding, based on the TRM[1], the existing DTs and
the Linux driver.

[1] https://developer.arm.com/documentation/ddi0143/latest

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/serio/amba-pl050.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serio/amba-pl050.yaml

diff --git a/Documentation/devicetree/bindings/serio/amba-pl050.yaml b/Documentation/devicetree/bindings/serio/amba-pl050.yaml
new file mode 100644
index 0000000000000..9732a84550098
--- /dev/null
+++ b/Documentation/devicetree/bindings/serio/amba-pl050.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serio/amba-pl050.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Ltd. PrimeCell PL050 PS/2 Keyboard/Mouse Interface
+
+maintainers:
+  - Andre Przywara <andre.przywara@arm.com>
+
+description:
+  The Arm PrimeCell PS2 Keyboard/Mouse Interface (KMI) is an AMBA compliant
+  peripheral that can be used to implement a keyboard or mouse interface that
+  is IBM PS2 or AT compatible.
+
+# We need a select here so we don't match all nodes with 'arm,primecell'
+select:
+  properties:
+    compatible:
+      contains:
+        const: arm,pl050
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: arm,pl050
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: KMI reference clock, used to generate the bus timing
+      - description: APB register access clock
+
+  clock-names:
+    items:
+      - const: KMIREFCLK
+      - const: apb_pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    kmi@70000 {
+            compatible = "arm,pl050", "arm,primecell";
+            reg = <0x070000 0x1000>;
+            interrupts = <8>;
+            clocks = <&mb_clk24mhz>, <&soc_smc50mhz>;
+            clock-names = "KMIREFCLK", "apb_pclk";
+    };
+
+...
-- 
2.25.1


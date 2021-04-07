Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F93B357382
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 19:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354964AbhDGRtY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 13:49:24 -0400
Received: from smtpcmd11117.aruba.it ([62.149.156.117]:46688 "EHLO
        smtpcmd11117.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355003AbhDGRtX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 13:49:23 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id UCIflJuxlkeOqUCIhl3jGA; Wed, 07 Apr 2021 19:49:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617817751; bh=azGFKvFhDur3Jztuo3XscJilz7KGJuUzRYEPx93Nyj4=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=OivDNs9WIpZaznxmyZo4IlhbN8WGKpk/pI8uuVPLWajnRTm4lkBJS4NrFZ75fmmRG
         ATZd9rHksWfF8uFf+KA8waSILJtivfct6ne9PSI0JpVJqDf6iNmrD6od0i6GhrbxYR
         +VuLllojKS4/5NCeAM8wK9BV0+Umusll0Bb1Shw5LJMIggTmzaa0ZR4rU1P3k2e7Ai
         dlRflWQb0GCLJTkafbz+aytrc8W+1UrGD9MeoNCkFKAmyO4iLJRZX/eZSlSgx8E0Wr
         u9r9pRvwhJoKxsTCtpwpz+daU96zDnrVitASzGN6E3AS1fGSPQF0hC9ITRseVExxYe
         DaaSNXc5q4nqA==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v4 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Wed,  7 Apr 2021 19:49:08 +0200
Message-Id: <20210407174909.1475150-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407174909.1475150-1-giulio.benetti@benettiengineering.com>
References: <YGxkB6icZSJfx/VB@latitude>
 <20210407174909.1475150-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAV4WZ3IVi/2R8QQoP/HrPt9htOZGOtbFBA6uhq6im6YM0s6uUUDrluWT7AqcIwljssCeU6trZhD1SONBLqGqVaazkXc7g4At3kEkGg50SUO5ADppIi4
 mJIgyP76/ot78crzmTjFRzCxhYk0JpOlSZfAcWlc99UlRc76i9BddA7TgCYa+J5OKhEfeG4Pht7/M6T7Yb6eDNeoUQrsFUMMPaLvwbrwtf5T3JykJw+HRwWW
 G45ty56YEB7SMPBJ/8ND/0z6BWG99Wf14D0e+EMCavJY/pxquVYoV8fvNVnhuGkHj17fOe5h4nhPSMfu/Yb/ZURmbL4qdH5my0VbCnOh6ocDzjGtZ5xVizMW
 uLZ6wBxjjJq4hIXMTpfQ6Jpvi/h5XsswqId0kCAxrDf5HYVK1BvBOpFrEXg6cBAwOzYSjIU9o6nJnka4n1serStUq3/T3qxZuvE+MzuH6yxDd2GZA37q1CMh
 FWcV92KvUaSJJ2Yr
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds device tree bindings for the Hycon HY46XX touchscreen series.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
As suggested by Rob Herring:
* fixed $id: address
* added "hycon," in front of every custom property
* changed all possible property to boolean type
* removed proximity-sensor-switch property since it's not handled in driver
V2->V3:
As suggested by Jonathan Neuschäfer:
* fixed some typo
* fixed description indentation
* improved boolean properties descriptions
* improved hycon,report-speed description
V3->V4:
* fixed binding compatible string in example as suggested by Jonathan Neuschäfer
---
 .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
new file mode 100644
index 000000000000..8860613a12ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hycon,hy46xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hycon HY46XX series touchscreen controller bindings
+
+description: |
+  There are 6 variants of the chip for various touch panel sizes and cover lens material
+   Glass: 0.3mm--4.0mm
+    PET/PMMA: 0.2mm--2.0mm
+    HY4613(B)-N048  < 6"
+    HY4614(B)-N068  7" .. 10.1"
+    HY4621-NS32  < 5"
+    HY4623-NS48  5.1" .. 7"
+   Glass: 0.3mm--8.0mm
+    PET/PMMA: 0.2mm--4.0mm
+    HY4633(B)-N048  < 6"
+    HY4635(B)-N048  < 7" .. 10.1"
+
+maintainers:
+  - Giulio Benetti <giulio.benetti@benettiengineering.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - hycon,hycon-hy4613
+      - hycon,hycon-hy4614
+      - hycon,hycon-hy4621
+      - hycon,hycon-hy4623
+      - hycon,hycon-hy4633
+      - hycon,hycon-hy4635
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vcc-supply: true
+
+  hycon,threshold:
+    description: Allows setting the sensitivity in the range from 0 to 255.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+
+  hycon,glove-enable:
+    type: boolean
+    description: Allows enabling glove setting.
+
+  hycon,report-speed:
+    description: Allows setting the report speed in Hertz.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+
+  hycon,power-noise-enable:
+    type: boolean
+    description: Allows enabling power noise filter.
+
+  hycon,filter-data:
+    description: Allows setting the filtering data before reporting touch
+                 in the range from 0 to 5.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+
+  hycon,gain:
+    description: Allows setting the sensitivity distance in the range from 0 to 5.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+
+  hycon,edge-offset:
+    description: Allows setting the edge compensation in the range from 0 to 16.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 16
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-fuzz-x: true
+  touchscreen-fuzz-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+  interrupt-controller: true
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      hycon-hy4633@1c {
+        compatible = "hycon,hycon-hy4633";
+        reg = <0x1c>;
+        interrupt-parent = <&gpio2>;
+        interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c80ad735b384..d022ff09e609 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8243,6 +8243,12 @@ S:	Maintained
 F:	mm/hwpoison-inject.c
 F:	mm/memory-failure.c
 
+HYCON HY46XX TOUCHSCREEN SUPPORT
+M:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
+
 HYGON PROCESSOR SUPPORT
 M:	Pu Wen <puwen@hygon.cn>
 L:	linux-kernel@vger.kernel.org
-- 
2.25.1


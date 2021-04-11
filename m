Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5319835B3C5
	for <lists+linux-input@lfdr.de>; Sun, 11 Apr 2021 13:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235532AbhDKLse (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Apr 2021 07:48:34 -0400
Received: from smtpcmd0642.aruba.it ([62.149.156.42]:56155 "EHLO
        smtpcmd0642.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235552AbhDKLsc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Apr 2021 07:48:32 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id VYZRl4bJnZCSXVYZSlNrfQ; Sun, 11 Apr 2021 13:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618141686; bh=m35TLWHgbOnHN+BMo7VmrEM+moVvZmt5L3sDtfthCKk=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=k8t7xlXcPL5e5JiQg5rVrspCaZaFY3Ev+Kk2XrPoXFh0IX4Prb7qtTmvSRfxSLohF
         /E72+/29gtZGgVEtp389qnRk1O9mpOtOMdL8iBS1mKtY9HbxM8oqJ/mN/hWoFJN2m3
         yU76f1PhY9Gsc8R4uz8dhv4TBwvsugptHChbOmIaVq8lht7Uh8rrgo3io2iYxJdPob
         Hg+PaIKYm8xwtcRlXW8QtDpY0zStZw99XgMOXGtNUd51oidsB/THt6UCDIKWzJQ7Sz
         EAx5PNDlOoxZz7Es76UmGw3ApfdoLXGEJjXw97DXfK+Dvly3IFgnlWvTI2FizaDcDm
         GSIPpK57Mbj4Q==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v5 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Sun, 11 Apr 2021 13:48:03 +0200
Message-Id: <20210411114804.151754-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210411114804.151754-1-giulio.benetti@benettiengineering.com>
References: <20210408202137.GA1890401@robh.at.kernel.org>
 <20210411114804.151754-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJdBFV8gRcmhPgIJczoxbm88ALqio9MVOIxv1dH6IWrX1Mjdmz3h8Yb6uJuUwAhO0LnHgv6Ckae5/rOVvuebReDoKaw6yIDtrNqiz982HIRUxaOWV/Ht
 d1iqD8+eB4Ohe4vStDR6VDykQ+6pAXvmETYmAqrkjYMgph/vlLr4j3G9hkaG2yIelzlQVL0ExZ6iuZU24lXxg6OLLNgLBGfutgUfw24RArkEyuCWC7OW6JEQ
 SNaEOlu9RCK7f0yoXE1KXrU1vdw7KDV9uC/G1T/g3i+FWh3wf00QkDIJxsnplAzChS/0XcGYqztsFowDmnXQY4jiKGWtXgliXkPGRP/XWIS9JGtD6TDpL4tt
 +Ffy6MlNbo/ieCGiTaD4h0wjo+NnIq1u8VOT7YRI0c4zko3YNna8//2Vh+48Vv8i70oQ89QPKih0OjX/llDm6NuIgGIrLhnTMMczw6ZYxAgtR5ijZEwEDlCy
 962sfVF1c1X4SPn6
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
V4->V5:
As suggested by Rob Herring:
* drop hycon- prefix from compatible
* use Hertz unit suffix for hycon,report-speed instead of u32
* set hycon,report-speed minimum to 1Hz, 0Hz make controller to do nothing
* change hycon,power-noise-enable property name to hycon,noise-filter-enable
* improve hycon,filter-data property description
* use generic touchscreen node name in example
---
 .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
new file mode 100644
index 000000000000..ae792e3716ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
@@ -0,0 +1,119 @@
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
+      - hycon,hy4613
+      - hycon,hy4614
+      - hycon,hy4621
+      - hycon,hy4623
+      - hycon,hy4633
+      - hycon,hy4635
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
+    minimum: 1
+    maximum: 255
+
+  hycon,noise-filter-enable:
+    type: boolean
+    description: Allows enabling power noise filter.
+
+  hycon,filter-data:
+    description: Allows setting how many samples throw before reporting touch
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
+      touchscreen@1c {
+        compatible = "hycon,hy4633";
+        reg = <0x1c>;
+        interrupt-parent = <&gpio2>;
+        interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 7fdc513392f4..18a50942c019 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8250,6 +8250,12 @@ S:	Maintained
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


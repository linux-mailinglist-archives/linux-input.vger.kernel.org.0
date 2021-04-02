Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63DA352D95
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 18:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbhDBQQi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Apr 2021 12:16:38 -0400
Received: from smtpcmd12131.aruba.it ([62.149.156.131]:48891 "EHLO
        smtpcmd12131.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbhDBQQh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Apr 2021 12:16:37 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id SMTElkkEVik8wSMTKlXAQV; Fri, 02 Apr 2021 18:16:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617380194; bh=o1wcycORft1S7rOHGGLlQR3o+Dutt3Z88XELS34Qbts=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=lEgDu5LgN/Q/A1VrDRWd4OlSf1gRSt3Vb7MLnDFE2vqR7j4CIdhfCZVvAb8/ENqBC
         gHbDPONZDxrZCBaY6go6cNFsmSYCEdocgvSB3PRJqe9vek5c3RTxrOq2lcGK8oBA6j
         rh40xTlQ64V1VBUyqSiJOlj3evWroCBda4vOVGdw8YBhyoWP2M1rhcdxLp5JOLl38K
         JHzE7q5p8f+hfIfGQBqgpyLt+3qCagk3jJp5hRw3DljwknjQsHfyrbc8C4LSdg4UGm
         Thi4zoX7i6o/uHK22U5WbqRW/f1t9G2ySoJe+Y6/0vJlqtKni1UaCorejB2THyi0cX
         n6qT7u0IdIY3A==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Fri,  2 Apr 2021 18:16:26 +0200
Message-Id: <20210402161627.2546145-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
References: <YGbc7Qbu6s659Mx4@latitude>
 <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAn22ZS6640d6wQU0xrLwtdcW2w0XJWRg6Hs7GkbH8TubKuFKt8xogcjquEDySuKr8IIvqh/w5/MZ4qUw9klDEvbxluHQUZp5P50C49C6EprEmIxGUlD
 TrBvIhc0px3O19edTVJSAM2ZYpapyOW8jefuO9vnmMqe1Pk1cTAZ8tGBjd9BeW5uWRiHcw664T8jiNZWP/e22JGSKx5Xt8ch6LD/ItBYv3nClPsCDYWVz3AH
 1PJB5OAlw8qUBY9WYefXkuNA4jmN4smpm5H/46QKuAMSuVZRF+6eEnyx+Vh/XSJtzP+NWc+43wYSYaIhghyNUOiGOBG19Z3y0yfsLyZ6tB3RvKmSIej9kkKl
 zqbpadX6ND74yhoGtNyFnOllgrY2nWao6Wxm09Qpo3K8YjC7l+QXeKvvc9+PYJaoxp0id2hFvSyz3UKyJDsAQ0EY/Eap2nj63BXgyvcXXd4o+bcHHjU=
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
---
 .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
new file mode 100644
index 000000000000..dddc6e3e654f
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
index 6e91994b8d3b..5e9cc7e610ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8242,6 +8242,12 @@ S:	Maintained
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


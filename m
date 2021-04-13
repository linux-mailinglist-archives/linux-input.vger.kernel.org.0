Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2412835E1CE
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 16:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344861AbhDMOpS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 10:45:18 -0400
Received: from smtpcmd15177.aruba.it ([62.149.156.177]:50735 "EHLO
        smtpcmd15177.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344738AbhDMOpM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 10:45:12 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id WKHXlmrLILwkNWKHYlJXte; Tue, 13 Apr 2021 16:44:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618325089; bh=m7bZ87n2o1oW/r2wNSc2s5Jn0szuQPQPqRbmK5W8j9I=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=BhZQtEMPGdpMHV8M9KQr8g13PX7a094D7YosVzf9wlkLe9DGmL6ebBN/Pe//r49nT
         hi7zga5EAyu+sdfcSPCwnZNezaEIlDKCAZaDDcrE7zFkFFUH/MpafH+nQLzlZ7i5tK
         T58Da3vl1GljBlJogFfBZWdIRdUygOgSIiK/5tNb0xmWiKrHsdnmnHFEoWbQMgr0iF
         BjyUoMXLNj/jetANO7pMCXqPvIl5K9KmNEa3AZayqLFBZVAy7XWhImiOpoXewRr6Nm
         +j9yvYgYxbdTMDMwP5fem4zyygXWgSxdrkGCb+2BaRH5FpFWMUoG6TYICV4UsUo8kS
         jDzNJGB4dTRNA==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v7 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Tue, 13 Apr 2021 16:44:45 +0200
Message-Id: <20210413144446.2277817-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfE8wZGv3MBqoMApu0NukcYI2Ko/+zltVFuSpAc4yQiVTE8WU12ZDI+iU49dl6VOzWVG+zb0lSKflTwZSM0o5SO1nbsW/wk7U+KTTZzXLKEXYjjarnDUJ
 SsM1QcaEheShYQdS2SjdbQXmX0KpAhdYCNfxstslQv0ruanQXQW0g4iTu/ICczzrFW7f3DW+ohrPjaVIU0or/UBl9V2vVn0qeavo+Q2CqOqmRaZ4cFjXouuA
 IDEZ/WTTczx3VZslEpIc2j7RN8oMOMpS70jb2j3nVMF+1W9kT5jYLsGGQB3gAuweBr9xkS7MGRj12LpHV9j719mxrmlQ2fo79mHXneJb9tJeilKLZ8jui6k9
 /yIqjGgSGfSlL1514qs8Kmr7gQQTGvYUTftJJ3e1i+Y9znOK8DVdbSPGA9+Yd5GR62WutajjHviRI+Y6yekjYR1QSkIH4w5d1WJGj7P0CzTPLkCVYa7Hhlwq
 Y1dJhamIsnMf9Cg/JByDIMUCltiwNIAxmQikZg==
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
V5->V6:
* changed report-speed property name into report-speed-hz according to
Rob Herring's suggestion
---
 .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
new file mode 100644
index 000000000000..942562f1e45b
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
+  hycon,report-speed-hz:
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


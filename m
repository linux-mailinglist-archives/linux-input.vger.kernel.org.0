Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3494D35232F
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 01:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234366AbhDAXLI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Apr 2021 19:11:08 -0400
Received: from smtpcmd0872.aruba.it ([62.149.156.72]:41008 "EHLO
        smtpcmd0872.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbhDAXLH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Apr 2021 19:11:07 -0400
Received: from ubuntu.localdomain ([146.241.168.220])
        by Aruba Outgoing Smtp  with ESMTPSA
        id S6M3lCwpyHTbyS6M7lYQzV; Fri, 02 Apr 2021 01:04:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617318244; bh=ZNoLjp0jCYqB/Dmy5QQkjRqhQSD2bt7VZgx1mRVJt9g=;
        h=From:To:Subject:Date:MIME-Version;
        b=nmQP2p3OS/qEtkHvOhiWsBMmZF/KzgvzxrEV4YBcviyLI/K3lvKsmqQUbPsH9CulS
         D7TFJEN3XWHhPBSfNrCgxUde3rv4eY80kW7avX7hlpif9e81n89e6wK25Gl3QIb8cM
         1qXGpYC4UysGHYWR+bf+kZI+L8WTu59BoCWZ5kKCYCrPH2mIma/SGbpxvoKSEB1ikh
         mpD46bn7CHYNDYNfeWqvkGWreqUPIl1O6IW1ZrIzcKJMcxhPNdh2xnmEbsTFfXiVb6
         9C7h5YdPL2wwmdLIGrQuQeK8o7sE8nMc2uY2sk4MPcW6EeDaV1TmDu5XToBBtluqgO
         B2gL6StSL7ssQ==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Subject: [PATCH v2 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Fri,  2 Apr 2021 01:03:57 +0200
Message-Id: <20210401230358.2468618-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401230358.2468618-1-giulio.benetti@benettiengineering.com>
References: <20210306194120.GA1075725@robh.at.kernel.org>
 <20210401230358.2468618-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfG6y2eeTY2f89k+HTw4YSq2OS5rwPIexcjxkC95SARU1tCKtWxwpG4VKYxjHxvRWz0IYTw4Rn68RVAQpWwxhk0Massyx7TtHwhKJbaZ6zmFWE73m/D90
 KlZ1XOIhkNHH81+DfQr0wRwWXisEX9kINTUeVSrZW6JWWZCpbTtca+EWWTnAtgXvldOtWbQKChKdgVyUTa5yscDax6qX33VJwcunFgIiw1U+XHpMXG1j91AD
 nwFr5gjvi43HExbrNQtXsbDlgyfTQ+U5sY0yu18rlXbh5H5Nx14Vo3cmbB/r9AHZwkxvqdjNrjy3iQxaSWnGRFp7jgJMckPkXzRyfHEG/ySTtnfUQ2i9ZIdG
 feMT5RTUzyYqbLnNgTgzqxqLw/XVQ2wkff2xK32P9oFKsa33X2YaUIn2ggMX4daodeJW6DZ2GjWqg512nXD68nDMqeeFnY81Od+pmWoVk86lEafDYn6oC0sM
 Gu02eGArl/8NnSDC
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
---
 .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
new file mode 100644
index 000000000000..71a1dbabcd4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hycon,hy46xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: hycon HY46XX series touchscreen controller Bindings
+
+description: |
+             There are 6 variants of the chip for various touch panel sizes and coverl len material
+              Glass: 0.3mm--4.0mm
+              PET/PMMA: 0.2mm--2.0mm
+               HY4613(B)-N048  < 6"
+               HY4614(B)-N068  7" .. 10.1"
+               HY4621-NS32  < 5"
+               HY4623-NS48  5.1" .. 7"
+              Glass: 0.3mm--8.0mm
+              PET/PMMA: 0.2mm--4.0mm
+               HY4633(B)-N048  < 6"
+               HY4635(B)-N048  < 7" .. 10.1"
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
+    description: Allows enabling or disabling glove setting.
+
+  hycon,report-speed:
+    description: Allows setting the report speed(i.e 0x64 => 100Hz).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+
+  hycon,power-noise-enable:
+    type: boolean
+    description: Allows enabling or disabling power noise filter.
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


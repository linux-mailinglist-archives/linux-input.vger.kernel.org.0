Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E80E43D0B7
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 20:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243555AbhJ0S2G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 14:28:06 -0400
Received: from box.trvn.ru ([194.87.146.52]:42991 "EHLO box.trvn.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243547AbhJ0S2F (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 14:28:05 -0400
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by box.trvn.ru (Postfix) with ESMTPSA id 019E8404F2;
        Wed, 27 Oct 2021 23:15:25 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
        t=1635358526; bh=UJOfoe8/1TWY2klOu4+O2XWeWSwlbPuk+rK16FmF44w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jot7LV8hVq51fTAYU2PYoFinpAvcSR04DM6KasqNjuZk5aufhxmOWxCpg2wPHPOPK
         sSVrrtsGE5MVdvhNovgP3mYIs16I86sBF1Tw+hvSo3ePQKO580hfMWxIWYhDOfDhEl
         REWAnpfKJX6b0ic3UkU2yytTQxqNmC/5zoib9lTQsU3CwMBm12BzzbdkcoUS5MYukd
         PfujXmuBHhjQQLI6TNT9Cb7Pw2HkeuNUTNVgYNgkL7xl7rkxDx5HV9j55bwSMx/Hv0
         j8YaD+5ePHO+fMlVeVPMOMr9eLCXiUVQh3aacpnXQLZfgovcXMrSAQFsth2/rsR/PC
         x1OHiM1LVXNig==
From:   Nikita Travkin <nikita@trvn.ru>
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, Michael.Srba@seznam.cz,
        linus.walleij@linaro.org, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH 2/6] dt-bindings: input/ts/zinitix: Convert to YAML, fix and extend
Date:   Wed, 27 Oct 2021 23:13:46 +0500
Message-Id: <20211027181350.91630-3-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-1-nikita@trvn.ru>
References: <20211027181350.91630-1-nikita@trvn.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

This converts the Zinitix BT4xx and BT5xx touchscreen bindings to YAML, fix
them up a bit and extends them.

We list all the existing BT4xx and BT5xx components with compatible strings.
These are all similar, use the same bindings and work in similar ways.

We rename the supplies from the erroneous vdd/vddo to the actual supply
names vcca/vdd as specified on the actual component. It is long established
that supplies shall be named after the supply pin names of a component.
The confusion probably stems from that in a certain product the rails to the
component were named vdd/vddo. Drop some notes on how OS implementations should
avoid confusion by first looking for vddo, and if that exists assume the
legacy binding pair and otherwise use vcca/vdd.

Add reset-gpios as sometimes manufacturers pulls a GPIO line to the reset
line on the chip.

Add optional touchscreen-fuzz-x and touchscreen-fuzz-y properties.

Cc: Mark Brown <broonie@kernel.org>
Cc: Michael Srba <Michael.Srba@seznam.cz>
Cc: phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
[Fixed dt_schema_check error]
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
This patch was previously submited here:
https://lore.kernel.org/linux-input/20210625113435.2539282-1-linus.walleij@linaro.org/

Changes since the original patch:
 - Use enum for compatible list instead of oneOf + const
---
 .../input/touchscreen/zinitix,bt400.yaml      | 115 ++++++++++++++++++
 .../bindings/input/touchscreen/zinitix.txt    |  40 ------
 2 files changed, 115 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
new file mode 100644
index 000000000000..b4e5ba7c0b49
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/zinitix,bt400.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zinitix BT4xx and BT5xx series touchscreen controller bindings
+
+description: The Zinitix BT4xx and BT5xx series of touchscreen controllers
+  are Korea-produced touchscreens with embedded microcontrollers. The
+  BT4xx series was produced 2010-2013 and the BT5xx series 2013-2014.
+
+maintainers:
+  - Michael Srba <Michael.Srba@seznam.cz>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  $nodename:
+    pattern: "^touchscreen(@.*)?$"
+
+  compatible:
+    enum:
+      - zinitix,bt402
+      - zinitix,bt403
+      - zinitix,bt404
+      - zinitix,bt412
+      - zinitix,bt413
+      - zinitix,bt431
+      - zinitix,bt432
+      - zinitix,bt531
+      - zinitix,bt532
+      - zinitix,bt538
+      - zinitix,bt541
+      - zinitix,bt548
+      - zinitix,bt554
+      - zinitix,at100
+
+  reg:
+    description: I2C address on the I2C bus
+
+  clock-frequency:
+    description: I2C client clock frequency, defined for host when using
+      the device on the I2C bus
+    minimum: 0
+    maximum: 400000
+
+  interrupts:
+    description: Interrupt to host
+    maxItems: 1
+
+  vcca-supply:
+    description: Analog power supply regulator on the VCCA pin
+
+  vdd-supply:
+    description: Digital power supply regulator on the VDD pin.
+      In older device trees this can be the accidental name for the analog
+      supply on the VCCA pin, and in that case the deprecated vddo-supply is
+      used for the digital power supply.
+
+  vddo-supply:
+    description: Deprecated name for the digital power supply, use vdd-supply
+      as this reflects the real name of the pin. If this supply is present,
+      the vdd-supply represents VCCA instead of VDD. Implementers should first
+      check for this property, and if it is present assume that the vdd-supply
+      represents the analog supply.
+    deprecated: true
+
+  reset-gpios:
+    description: Reset line for the touchscreen, should be tagged
+      as GPIO_ACTIVE_LOW
+
+  zinitix,mode:
+    description: Mode of reporting touch points. Some modes may not work
+      with a particular ts firmware for unknown reasons. Available modes are
+      1 and 2. Mode 2 is the default and preferred.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-fuzz-x: true
+  touchscreen-fuzz-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@20 {
+        compatible = "zinitix,bt541";
+        reg = <0x20>;
+        interrupt-parent = <&gpio>;
+        interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+        vcca-supply = <&reg_vcca_tsp>;
+        vdd-supply = <&reg_vdd_tsp>;
+        touchscreen-size-x = <540>;
+        touchscreen-size-y = <960>;
+        zinitix,mode = <2>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt b/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
deleted file mode 100644
index 446efb9f5f55..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Device tree bindings for Zinitx BT541 touchscreen controller
-
-Required properties:
-
- - compatible		: Should be "zinitix,bt541"
- - reg			: I2C address of the chip. Should be 0x20
- - interrupts		: Interrupt to which the chip is connected
-
-Optional properties:
-
- - vdd-supply		: Analog power supply regulator on VCCA pin
- - vddo-supply		: Digital power supply regulator on VDD pin
- - zinitix,mode		: Mode of reporting touch points. Some modes may not work
-			  with a particular ts firmware for unknown reasons. Available
-			  modes are 1 and 2. Mode 2 is the default and preferred.
-
-The touchscreen-* properties are documented in touchscreen.txt in this
-directory.
-
-Example:
-
-	i2c@00000000 {
-		/* ... */
-
-		bt541@20 {
-			compatible = "zinitix,bt541";
-			reg = <0x20>;
-			interrupt-parent = <&msmgpio>;
-			interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&tsp_default>;
-			vdd-supply = <&reg_vdd_tsp>;
-			vddo-supply = <&pm8916_l6>;
-			touchscreen-size-x = <540>;
-			touchscreen-size-y = <960>;
-			zinitix,mode = <2>;
-		};
-
-		/* ... */
-	};
-- 
2.30.2


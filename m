Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453C23B429F
	for <lists+linux-input@lfdr.de>; Fri, 25 Jun 2021 13:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhFYLjK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Jun 2021 07:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhFYLjJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Jun 2021 07:39:09 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF10C061767
        for <linux-input@vger.kernel.org>; Fri, 25 Jun 2021 04:36:48 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id d13so12042598ljg.12
        for <linux-input@vger.kernel.org>; Fri, 25 Jun 2021 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mFVix5hj4qMWkWTebg8/V8+S9K9ne/G74p8v6BIfU6o=;
        b=I2So+MXmqnpvFXypMoaFVV6uKyzK7GRRg14dhmjcbQaxRXBweaj2GX5hHc00YS6YRc
         kqNOoF7S4ESkn2VDsouQFHdx5zMYdbQaHyS1Zouc4VTgJkpdWiyIJHNqK9g91PxbpGRr
         xustDbI3DEeAOrO8FxjI7O/HA+SC/n2gefMOGdr+DoCU3ihT4wyi8+fmL0XGCq5qcUtk
         P1tbAxddEoFqC4FFN3rBSJIfI5TkD0WVbng42trX0B0Uy196AUuxCEOQT8l7NzT4mbM/
         QINoGWYJ2T1KicpeY3kAKyc/rhBfX6kebAjGkl4e4FXYBUSYeu7+P1Gd2oH4g8fLtdfv
         Jt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mFVix5hj4qMWkWTebg8/V8+S9K9ne/G74p8v6BIfU6o=;
        b=DGGAsb0dof3kKwgG26nOjhXAqj25YHROUAlNGvSEM3sCsHGOUuI1nUe5XMTB4rZRTm
         +/ctmevWyiWN6zQvrqdZRbH4EPEv1aoKSY7NS7xIeyPbcTuKCXJ+FqDNHSR6i0+dtqho
         7PSDPEhkf6xJmd43yzB7shjwTQAgJ+LYuFJ+i5KWHt8j7yJJ/9DEo4SIHLFN3G1YAmHD
         KDN4vtxNDvxNgkWAw53posZjkb9H1/w9tTIAZDC8JmvDlxiN691bBJfdkl2I0sh8efhT
         qkt+SGL4FtS6ZzMqdkID8cQZS0+rAll9TUjt2lvSv2mSJLfZfEFmD60bmClDuzOmcB/v
         DsoA==
X-Gm-Message-State: AOAM532vdcwE+nOYC2J2FWJQga15slq1WrDj4AwbZdwzOpj4z0RZDloz
        n316WyBMkjN13zE84Rh9t2rZ1w==
X-Google-Smtp-Source: ABdhPJyhgY8f/6Jz/KKUMwRU1cFzxqjiaNfbIahMe0T7VNKkBkdz3XX3DHfDtNLtGxzoKRkwCUkFIA==
X-Received: by 2002:a2e:8ecd:: with SMTP id e13mr38921ljl.193.1624621006511;
        Fri, 25 Jun 2021 04:36:46 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id g24sm489682lfv.228.2021.06.25.04.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 04:36:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: input/ts/zinitix: Convert to YAML, fix and extend
Date:   Fri, 25 Jun 2021 13:34:34 +0200
Message-Id: <20210625113435.2539282-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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
---
 .../input/touchscreen/zinitix,bt400.yaml      | 115 ++++++++++++++++++
 .../bindings/input/touchscreen/zinitix.txt    |  40 ------
 2 files changed, 115 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
new file mode 100644
index 000000000000..6e8b4dede9d7
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
+    oneOf:
+      - const: zinitix,bt402
+      - const: zinitix,bt403
+      - const: zinitix,bt404
+      - const: zinitix,bt412
+      - const: zinitix,bt413
+      - const: zinitix,bt431
+      - const: zinitix,bt432
+      - const: zinitix,bt531
+      - const: zinitix,bt532
+      - const: zinitix,bt538
+      - const: zinitix,bt541
+      - const: zinitix,bt548
+      - const: zinitix,bt554
+      - const: zinitix,at100
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
2.31.1


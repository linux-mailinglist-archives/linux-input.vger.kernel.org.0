Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00143358441
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 15:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhDHNMb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 09:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhDHNMa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 09:12:30 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59B4C061761
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 06:12:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j18so3945796lfg.5
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 06:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mg1rnmzYlGS0W73zSpiFdEvCZx/ufEx400E1vd3zKK4=;
        b=oTCHNhCRwwzS55aMYQxja6D+CShYifEG+L+pSHzGe3fyVw8Pk/iifaUNfwcG6Sk2ds
         3cQSKIFIqFM2Afua8eJWBGqOUCx4XO9ouF1M64XFDjBt6jPq+iLu3SgtGV5SiYRLPjTL
         0PqoeBO9GsBUxl9vj1b+/KhzWwahcgfu82XXxV5Pz7FaDTTYwSH59LUiR9DswiTUfPoL
         /HM9tJskbLHyD4VVFxkKA/ZPN0Ho/k+hwbaUEgvOiuBm3M3MWFHBgWtMJnR0PPaeOIpj
         wca/TkmpCDIeevD95XTWr/cFPVWs1+bhthDfYseK2T2f3pePoJllpI6TJgFpFY5ACG2X
         8nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mg1rnmzYlGS0W73zSpiFdEvCZx/ufEx400E1vd3zKK4=;
        b=AUPrQiNXMBe8qtidpl3k9WyAD4Z6KpSOqKMU8hrO2iTjnMBgpfN3IpWfqfEycd0gkr
         TgyMLOtAewwKqghhBfMP9gSbrZ8+ewkPOYnSyDRReKrFhUa+60H4/D29W48VdYiBYkc8
         zDgtcoCjykkESdhNiz2/l+HByS/19rd7quWAahRA3g63QUux0SA6sCexzT0FeOzsGB1+
         uS1Usyzhdk3ZlUbU4RIW+bYYp6cJ/V39m6MyWCodHPprqbXWiZQ8CfqNOd6DePf/ICmX
         WYo8k/7NAwsUxF7WL2J34w5D9qhmV+0UnQY7DJQBHfsscyGa4AyKXuAtnpsqH7eYYHUq
         QiEg==
X-Gm-Message-State: AOAM532z6gi6RfHAfChrne+h9Y83W78+ml8nWapXFAczkeBeLWS5UFwY
        aQArNQ6PhvxHfKmgD954IArqklD8flW1nILi
X-Google-Smtp-Source: ABdhPJzG3mcaE/NMLOaw3b0Bdglvyn2CIV/h0P/DAgPlUjfUXQqKlhqnLaTGC52y0GGeay8yC3gb7A==
X-Received: by 2002:a19:700d:: with SMTP id h13mr6278116lfc.17.1617887537081;
        Thu, 08 Apr 2021 06:12:17 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z7sm126936ljm.102.2021.04.08.06.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:12:11 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/8 v3] Input: cyttsp - Convert bindings to YAML and extend
Date:   Thu,  8 Apr 2021 15:11:46 +0200
Message-Id: <20210408131153.3446138-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408131153.3446138-1-linus.walleij@linaro.org>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This converts the CYTTSP "Cypress TrueTouch Standard Product"
to YAML bindings and fixes and adds some things in the process:

- Rename the bindings file to cypress,cy8ctma340 after the main
  product in the series.
- Add proper compatibles for the two known products:
  CY8CTMA340 and CY8CTST341.
- Deprecate "cypress,cyttsp-spi" and "cypress,cyttsp-i2c"
  because device compatibles should be named after the
  hardware and not after which bus they are connected to.
  The topology implicitly tells us which bus it is and what
  interface to used.
- Add VCPIN and VDD supplies, these are present just like
  on the CY8CTMA140.

Cc: devicetree@vger.kernel.org
Cc: Ferruh Yigit <fery@cypress.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Collect Robs and Javiers Review tags.
- Use the right mail address for Javier.
- Include in the patch series with the rest of the CYTTSP
  fixes.
ChangeLog v1->v2:
- Use minItems and maxItems directly without -items
- Drop u32 type from all properties ending with "-ms"
  that thus have implicit types.
- Add maintiner to Cc.

Patch to add the new compatibles to the Linux driver is sent
separately.
---
 .../input/touchscreen/cypress,cy8ctma340.yaml | 149 ++++++++++++++++++
 .../bindings/input/touchscreen/cyttsp.txt     |  93 -----------
 2 files changed, 149 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
new file mode 100644
index 000000000000..29eb0b7ebe6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/cypress,cy8ctma340.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress CY8CTMA340 series touchscreen controller bindings
+
+description: The Cypress CY8CTMA340 series (also known as "CYTTSP" after
+  the marketing name Cypress TrueTouch Standard Product) touchscreens can
+  be connected to either I2C or SPI buses.
+
+maintainers:
+  - Javier Martinez Canillas <javier@dowhile0.org>
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
+      - const: cypress,cy8ctma340
+      - const: cypress,cy8ctst341
+      - const: cypress,cyttsp-spi
+        description: Legacy compatible for SPI connected CY8CTMA340
+        deprecated: true
+      - const: cypress,cyttsp-i2c
+        description: Legacy compatible for I2C connected CY8CTMA340
+        deprecated: true
+
+  reg:
+    description: I2C address when used on the I2C bus, or the SPI chip
+      select index when used on the SPI bus
+
+  clock-frequency:
+    description: I2C client clock frequency, defined for host when using
+      the device on the I2C bus
+    minimum: 0
+    maximum: 400000
+
+  spi-max-frequency:
+    description: SPI clock frequency, defined for host, defined when using
+      the device on the SPI bus. The throughput is maximum 2 Mbps so the
+      typical value is 2000000, if higher rates are used the total throughput
+      needs to be restricted to 2 Mbps.
+    minimum: 0
+    maximum: 6000000
+
+  interrupts:
+    description: Interrupt to host, must be flagged as
+      IRQ_TYPE_EDGE_FALLING.
+    maxItems: 1
+
+  vcpin-supply:
+    description: Analog power supply regulator on VCPIN pin
+
+  vdd-supply:
+    description: Digital power supply regulator on VDD pin
+
+  reset-gpios:
+    description: Reset line for the touchscreen, should be tagged
+      as GPIO_ACTIVE_LOW
+
+  bootloader-key:
+    description: the 8-byte bootloader key that is required to switch
+      the chip from bootloader mode (default mode) to application mode
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 8
+    maxItems: 8
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-fuzz-x: true
+  touchscreen-fuzz-y: true
+
+  active-distance:
+    description: the distance in pixels beyond which a touch must move
+      before movement is detected and reported by the device
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+
+  active-interval-ms:
+    description: the minimum period in ms between consecutive
+      scanning/processing cycles when the chip is in active mode
+    minimum: 0
+    maximum: 255
+
+  lowpower-interval-ms:
+    description: the minimum period in ms between consecutive
+      scanning/processing cycles when the chip is in low-power mode
+    minimum: 0
+    maximum: 2550
+
+  touch-timeout-ms:
+    description: minimum time in ms spent in the active power state while no
+      touches are detected before entering low-power mode
+    minimum: 0
+    maximum: 2550
+
+  use-handshake:
+    description: enable register-based handshake (boolean). This should only
+      be used if the chip is configured to use 'blocking communication with
+      timeout' (in this case the device generates an interrupt at the end of
+      every scanning/processing cycle)
+    $ref: /schemas/types.yaml#/definitions/flag
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - bootloader-key
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      num-cs = <1>;
+      cs-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+
+      touchscreen@0 {
+        compatible = "cypress,cy8ctma340";
+        reg = <0>;
+        interrupt-parent = <&gpio>;
+        interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio 21 GPIO_ACTIVE_LOW>;
+        vdd-supply = <&ldo_aux1_reg>;
+        vcpin-supply = <&ldo_aux2_reg>;
+        bootloader-key = /bits/ 8 <0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07>;
+        touchscreen-size-x = <480>;
+        touchscreen-size-y = <800>;
+        active-interval-ms = <0>;
+        touch-timeout-ms = <255>;
+        lowpower-interval-ms = <10>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt b/Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt
deleted file mode 100644
index 6ee274aa8b03..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt
+++ /dev/null
@@ -1,93 +0,0 @@
-* Cypress cyttsp touchscreen controller
-
-Required properties:
- - compatible		: must be "cypress,cyttsp-i2c" or "cypress,cyttsp-spi"
- - reg			: Device I2C address or SPI chip select number
- - spi-max-frequency	: Maximum SPI clocking speed of the device (for cyttsp-spi)
- - interrupts		: (gpio) interrupt to which the chip is connected
-			  (see interrupt binding[0]).
- - bootloader-key	: the 8-byte bootloader key that is required to switch
-			  the chip from bootloader mode (default mode) to
-			  application mode.
-			  This property has to be specified as an array of 8
-			  '/bits/ 8' values.
-
-Optional properties:
- - reset-gpios		: the reset gpio the chip is connected to
-			  (see GPIO binding[1] for more details).
- - touchscreen-size-x	: horizontal resolution of touchscreen (in pixels)
- - touchscreen-size-y	: vertical resolution of touchscreen (in pixels)
- - touchscreen-fuzz-x	: horizontal noise value of the absolute input device
-			  (in pixels)
- - touchscreen-fuzz-y	: vertical noise value of the absolute input device
-			  (in pixels)
- - active-distance	: the distance in pixels beyond which a touch must move
-			  before movement is detected and reported by the device.
-			  Valid values: 0-15.
- - active-interval-ms	: the minimum period in ms between consecutive
-			  scanning/processing cycles when the chip is in active mode.
-			  Valid values: 0-255.
- - lowpower-interval-ms	: the minimum period in ms between consecutive
-			  scanning/processing cycles when the chip is in low-power mode.
-			  Valid values: 0-2550
- - touch-timeout-ms	: minimum time in ms spent in the active power state while no
-			  touches are detected before entering low-power mode.
-			  Valid values: 0-2550
- - use-handshake	: enable register-based handshake (boolean). This should
-			  only be used if the chip is configured to use 'blocking
-			  communication with timeout' (in this case the device
-			  generates an interrupt at the end of every
-			  scanning/processing cycle).
-
-[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-[1]: Documentation/devicetree/bindings/gpio/gpio.txt
-
-Example:
-	&i2c1 {
-		/* ... */
-		cyttsp@a {
-			compatible = "cypress,cyttsp-i2c";
-			reg = <0xa>;
-			interrupt-parent = <&gpio0>;
-			interrupts = <28 0>;
-			reset-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
-
-			touchscreen-size-x = <800>;
-			touchscreen-size-y = <480>;
-			touchscreen-fuzz-x = <4>;
-			touchscreen-fuzz-y = <7>;
-
-			bootloader-key = /bits/ 8 <0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08>;
-			active-distance = <8>;
-			active-interval-ms = <0>;
-			lowpower-interval-ms = <200>;
-			touch-timeout-ms = <100>;
-		};
-
-		/* ... */
-	};
-
-	&mcspi1 {
-		/* ... */
-		cyttsp@0 {
-			compatible = "cypress,cyttsp-spi";
-			spi-max-frequency = <6000000>;
-			reg = <0>;
-			interrupt-parent = <&gpio0>;
-			interrupts = <28 0>;
-			reset-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
-
-			touchscreen-size-x = <800>;
-			touchscreen-size-y = <480>;
-			touchscreen-fuzz-x = <4>;
-			touchscreen-fuzz-y = <7>;
-
-			bootloader-key = /bits/ 8 <0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08>;
-			active-distance = <8>;
-			active-interval-ms = <0>;
-			lowpower-interval-ms = <200>;
-			touch-timeout-ms = <100>;
-		};
-
-		/* ... */
-	};
-- 
2.29.2


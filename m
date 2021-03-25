Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91466349C57
	for <lists+linux-input@lfdr.de>; Thu, 25 Mar 2021 23:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhCYWfp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 18:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhCYWf3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 18:35:29 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB4BC06175F
        for <linux-input@vger.kernel.org>; Thu, 25 Mar 2021 15:35:29 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id f16so5224804ljm.1
        for <linux-input@vger.kernel.org>; Thu, 25 Mar 2021 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1JAZYhKa2MLtClN+ScQ1RoGv4LWD7JrDwZRRxkN6SwM=;
        b=SmZUd/sPZBKGbLTqGY5mu5V2qeyJUb7ZGnZ0N+Idifvqlo6+OQw63eOf44wsxllmw5
         /pX9XS/Eg2tpqCJ+Hc+15sVhiKbADg2nRJ19zzkjnx5x8z4zoHbHc/CtAR9PrWURSEzX
         c9hJmOcHRLMsyhFJrFIriZHEWTD261pn6E06U8yEcSXlv0YoaS6hzl4TrWznP0qzFz7l
         K+StieRCjkzD9ZQOs26S+kEIAJMdITdg6t4IfVdhhWUMdbhBi6q484FpQhj9oh8RFqyS
         z/1UseCeDN+FD4yjVq5n2PPyzzRG/zFLrd61SiS0FjMu5ahtMmdnvPiBcz5EVdS/9VQO
         fdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1JAZYhKa2MLtClN+ScQ1RoGv4LWD7JrDwZRRxkN6SwM=;
        b=e1cSBnY0czPaYGcuV+miw4hou9mW6JHyQgTpFxw6rEAtXyamar40on4bkOlnmEbcly
         gL6VgoFyY9X6MuhymkQe0mVLy+kRmQU0QHhwpumqkOc6CQw/Om1ekdBtVI4RVwc30Tje
         +MUfxxeqDUMIM29rXvpaYTDtIWp97XV+7m0P6xRftr68WWUJ7pT+dbjA/SMVLbH9fyZ7
         6bbW0LDI9z/M4yEO584ofafakwnegOLJzfkvIIpuGJ9avEGBAPQpzgq1vfU1ES+BXL4b
         U9Kcio5LhSsjRjiDKMPJwBZFzBzitDPvAJxIiv7xYm5SPwPqOY34a3eAPkTg1EauT6l9
         UepA==
X-Gm-Message-State: AOAM533bUib/kXPVijZkK/R3LIGPoolrl42KObT2EH4fHatyOeOvhltb
        EaLM+B1+jsaJ2tu07BE6pcnXdQ==
X-Google-Smtp-Source: ABdhPJwwSpWtNq9mr/DcJF39mt1wLs6D4TTjE3l5nlDbAMjQvslukYriX9OxnfxVP2OKPKNteALyPQ==
X-Received: by 2002:a2e:bc13:: with SMTP id b19mr7186796ljf.381.1616711727378;
        Thu, 25 Mar 2021 15:35:27 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z14sm927586ljk.33.2021.03.25.15.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 15:35:26 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH] Input: cyttsp - Convert bindings to YAML and extend
Date:   Thu, 25 Mar 2021 23:35:20 +0100
Message-Id: <20210325223520.1653715-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
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
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Patch to add the new compatibles to the Linux driver is sent
separately.
---
 .../input/touchscreen/cypress,cy8ctma340.yaml | 153 ++++++++++++++++++
 .../bindings/input/touchscreen/cyttsp.txt     |  93 -----------
 2 files changed, 153 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
new file mode 100644
index 000000000000..063c140afbbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
@@ -0,0 +1,153 @@
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
+    items:
+      - minItems: 8
+        maxItems: 8
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
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+
+  lowpower-interval-ms:
+    description: the minimum period in ms between consecutive
+      scanning/processing cycles when the chip is in low-power mode
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 2550
+
+  touch-timeout-ms:
+    description: minimum time in ms spent in the active power state while no
+      touches are detected before entering low-power mode
+    $ref: /schemas/types.yaml#/definitions/uint32
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


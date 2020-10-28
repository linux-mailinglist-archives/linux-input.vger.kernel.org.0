Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585D429DB99
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 01:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389264AbgJ2AEQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 20:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389390AbgJ2ACd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 20:02:33 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC551C0613CF
        for <linux-input@vger.kernel.org>; Wed, 28 Oct 2020 17:02:32 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id dn5so1278657edb.10
        for <linux-input@vger.kernel.org>; Wed, 28 Oct 2020 17:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6uS0r7y6biXYa9U4d4/PAE9n89ZvBxgMX312oRTh6lg=;
        b=CCVxFxGmfy05Q68akXSjQsCJFHYqa+w34YILpnkF6uWLOR1JVX3zVzQAJ09p/D0SNU
         yaRazFZb/HzW5pt2hhCSd9T9zrUglfJqPd/3iMBDS9/FTaCAp7pAAOZzE1wbX8irW3Bl
         iHWBdBqdyMV/GAnLlNrq/8iIcWCTcRSpc1w6C/XPODtf0BkG48hyVb5ICDUEJPK5ZHY0
         VD09tvGnmncQdfN4AJOFm5ll5Fl3tc5HIw8yZ18CpR+BLVSrjmldEids37qAg1Mjb3DV
         N6clHFsGF0VuqcKva8oB+E2XWD6uEwdLcDAFDkt96dzJYWc9DhyeedHFlsZokT+NnilL
         +7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6uS0r7y6biXYa9U4d4/PAE9n89ZvBxgMX312oRTh6lg=;
        b=jlegUGwrha+7qPlOa2h2blWYY5DeU7WKVcwdkp5BAS3NYClx1eYs2NOoCAvYB1ohtP
         8cNQjNwo5fsXEEwb2PrYhbRigqLiXJl0Yz6SKzvGQli55Gk+Z3U/+bDX5JZk6Q9e6TP/
         THRxIhF4EJLEwxvgeKvMtunFL/TxpUA4mWTPdUve6uC+7Wbn4ub3Qm2r0ZNJdzrjjATi
         e6HCI8eskFOXYDmiJWipzlaIEpYijONFCpSlc7sApA6cyzxvnjV9/vIpz5w3rn33HzHD
         z18Aef7QDnTaD3Jzg8r2v8bmaPBY64g5NP07/mMUGdm1Ik9LaSdmqPCBdkZNR+lReJyX
         Q9/Q==
X-Gm-Message-State: AOAM532o29pdERuQreEocxvxLPzbV1E8wKCQfEsPQxfb2rPCTYdkojBM
        yfKeWMvGii5groa4Ur7y6ys2q3meNNO0qMD2
X-Google-Smtp-Source: ABdhPJwX9hHG1DBF/vrwPA04qfIX4Usd1mJ95bLF2KJvyhKPLYcFMFc73JombKwmPQcjeBlKxSuh6g==
X-Received: by 2002:a2e:3c10:: with SMTP id j16mr558726lja.236.1603880237980;
        Wed, 28 Oct 2020 03:17:17 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id b12sm478741lfo.177.2020.10.28.03.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 03:17:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nick Dyer <nick@shmanahar.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] Input: atmel_mxt_ts: Convert bindings to YAML and extend
Date:   Wed, 28 Oct 2020 11:17:10 +0100
Message-Id: <20201028101711.696423-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This converts the Armel MXT touchscreen bindings to YAML
format and extends them with the following two properties:

- vdda-supply: the optional analog supply voltage
- vdd-supply: the optional digital supply voltage

I also explained about the reset-gpios property that this
better be flagged as active high (0) despite actually
being active low, because all current device trees and
drivers assume that this is the case and will actively
drive the line low to assert RESET.

Tested the schema with all in-tree users and they verify
fine.

Cc: Nick Dyer <nick@shmanahar.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/input/atmel,maxtouch.txt         | 41 ---------
 .../bindings/input/atmel,maxtouch.yaml        | 83 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 84 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.txt
 create mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
deleted file mode 100644
index c88919480d37..000000000000
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Atmel maXTouch touchscreen/touchpad
-
-Required properties:
-- compatible:
-    atmel,maxtouch
-
-    The following compatibles have been used in various products but are
-    deprecated:
-	atmel,qt602240_ts
-	atmel,atmel_mxt_ts
-	atmel,atmel_mxt_tp
-	atmel,mXT224
-
-- reg: The I2C address of the device
-
-- interrupts: The sink for the touchpad's IRQ output
-    See ../interrupt-controller/interrupts.txt
-
-Optional properties for main touchpad device:
-
-- linux,gpio-keymap: When enabled, the SPT_GPIOPWN_T19 object sends messages
-    on GPIO bit changes. An array of up to 8 entries can be provided
-    indicating the Linux keycode mapped to each bit of the status byte,
-    starting at the LSB. Linux keycodes are defined in
-    <dt-bindings/input/input.h>.
-
-    Note: the numbering of the GPIOs and the bit they start at varies between
-    maXTouch devices. You must either refer to the documentation, or
-    experiment to determine which bit corresponds to which input. Use
-    KEY_RESERVED for unused padding values.
-
-- reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
-
-Example:
-
-	touch@4b {
-		compatible = "atmel,maxtouch";
-		reg = <0x4b>;
-		interrupt-parent = <&gpio>;
-		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
-	};
diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
new file mode 100644
index 000000000000..6173562f328a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel maXTouch touchscreen/touchpad
+
+maintainers:
+  - Nick Dyer <nick@shmanahar.org>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  Atmel maXTouch touchscreen or touchpads such as the mXT244
+  and similar devices.
+
+properties:
+  compatible:
+    const: atmel,maxtouch
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdda-supply:
+    description:
+      Optional regulator for the AVDD analog voltage.
+
+  vdd-supply:
+    description:
+      Optional regulator for the VDD digital voltage.
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Optional GPIO specifier for the touchscreen's reset pin
+      (active low). The operating system should actively drive
+      the line low to assert reset, so the line must NOT be
+      flagged with GPIO_ACTIVE_LOW, it should (counterintuitively)
+      be set to GPIO_ACTIVE_HIGH.
+
+  linux,gpio-keymap:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      When enabled, the SPT_GPIOPWN_T19 object sends messages
+      on GPIO bit changes. An array of up to 8 entries can be provided
+      indicating the Linux keycode mapped to each bit of the status byte,
+      starting at the LSB. Linux keycodes are defined in
+      <dt-bindings/input/input.h>.
+
+      Note: the numbering of the GPIOs and the bit they start at varies
+      between maXTouch devices. You must either refer to the documentation,
+      or experiment to determine which bit corresponds to which input. Use
+      KEY_RESERVED for unused padding values.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@4a {
+        compatible = "atmel,maxtouch";
+        reg = <0x4a>;
+        interrupt-parent = <&gpio>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
+        vdda-supply = <&ab8500_ldo_aux2_reg>;
+        vdd-supply = <&ab8500_ldo_aux5_reg>;
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..b4b46fcb82db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2966,7 +2966,7 @@ ATMEL MAXTOUCH DRIVER
 M:	Nick Dyer <nick@shmanahar.org>
 S:	Maintained
 T:	git git://github.com/ndyer/linux.git
-F:	Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+F:	Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
 F:	drivers/input/touchscreen/atmel_mxt_ts.c
 
 ATMEL WIRELESS DRIVER
-- 
2.26.2


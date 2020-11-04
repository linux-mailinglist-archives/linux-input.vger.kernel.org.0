Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D8B2A67AE
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 16:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730434AbgKDPao (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 10:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgKDPao (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 10:30:44 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6525AC0613D4
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 07:30:42 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id i6so27699047lfd.1
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 07:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yRASjRKxtplopJt2MsU1Jw8BgtmuvKdoRaCX+NVYm3Q=;
        b=q4ZJAOCqlJKBmGhQnreQ8Zb8K3jzZs0mfQJ2yqw+tBw7LbIlue4ATYMP59/eTQSvXU
         IZPbK7je3rzunmuSe68rLjQ1y4S5hP3DxF9t1UOLgTH3qBp3HN0UWmnJAAsTnnttNY/R
         t4LT9+5mEPsK9kJpu4iksE8z2oe41ZO3/LY3N87YLsWYeq3sKa5CwpOjtR9Olvob3kss
         uowK4ZfjG9eRIUdm/J1WuVq5kml79TdeYBAbbKW9LrlmfroS8Ka7hHUe5WnuWzCddA1m
         TMtzrXLMGd3ro/MGjAJ771RK02x33cjmMAo8ILH/lQ+LbRvpWA7PXERGPU9+4yKLJb2l
         TqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yRASjRKxtplopJt2MsU1Jw8BgtmuvKdoRaCX+NVYm3Q=;
        b=V+jH63OJrmdIlYEDxAbN0e/5+5H/PFQbFI1GvF8xVu3Vycn/TN7Q07IB9Cw5JBtQsB
         eNM3eDZlPkQOb9XOOsfMny76Sa569YDz+peRXAJauBykosEiCO/P+HCX+tI1DcZpumUA
         IWgxS1XpHlpqo7VYO/Wj+cbAWYYK4kfyCvCsWvntjZoaSjjJbBEur4sVmjW7FpCK/EYH
         tPKzltZIR60ggoltZyya0Q/Kt7HIvdgdXUUQqTf5zrZRCd4qiv7MsgjAZzNFtMAMbHmF
         y1LtZYHjrDlHRHXOpy1XU961TeQCMQbY05R3YJa1fcgZ4q6A+Ihyppd+HyRqQQ5a3wf7
         kI8A==
X-Gm-Message-State: AOAM532fDkBSgqQsSpPgRduBHY/oGiZzQbq25swvvHU+atBfHwMAw1Ps
        i+9BUj08SXktv1UDNv8DCWaviA==
X-Google-Smtp-Source: ABdhPJwWQDsL0nXkNgeMZUogdSYafFiiuG6oByvxrPGnXX6eGh7JZVn6u8AeKhsFNyOcYWJM2yXMHw==
X-Received: by 2002:a19:7518:: with SMTP id y24mr7062984lfe.133.1604503840859;
        Wed, 04 Nov 2020 07:30:40 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c131sm440453lfg.110.2020.11.04.07.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:30:40 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nick Dyer <nick@shmanahar.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3 v2] Input: atmel_mxt_ts - Convert bindings to YAML and extend
Date:   Wed,  4 Nov 2020 16:30:31 +0100
Message-Id: <20201104153032.1387747-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104153032.1387747-1-linus.walleij@linaro.org>
References: <20201104153032.1387747-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- State that the GPIO lines shall be flagged as active low.
  We will fix all users.
---
 .../bindings/input/atmel,maxtouch.txt         | 41 ----------
 .../bindings/input/atmel,maxtouch.yaml        | 81 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 82 insertions(+), 42 deletions(-)
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
index 000000000000..8c6418f76e94
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -0,0 +1,81 @@
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
+      (active low). The line must be flagged with
+      GPIO_ACTIVE_LOW.
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
+        reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
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


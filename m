Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA0A69B28A
	for <lists+linux-input@lfdr.de>; Fri, 17 Feb 2023 19:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjBQStK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Feb 2023 13:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjBQStJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Feb 2023 13:49:09 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7264E3C2C;
        Fri, 17 Feb 2023 10:49:08 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bk11so2059754oib.13;
        Fri, 17 Feb 2023 10:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGjpuoHToThUojmYOw0QiZ7tHvBkaksCb1ZjIQGUb8s=;
        b=IhuHwJ5AOQ1tMYgRa7H14VFW3Ad6DRVwGiO+2L3b5lWyZ/9qI/7ew+vp4sPhc3P40F
         MFmPQZ2mqZ1N6RePXea61bxkRGhCJlQtcKceMqqjVVkiWkzcpcuM/lSvNmn/23PRpAkx
         9MWgh7c4x0Slo1IWFSTP73mm0nDwttAD+vGoOuoXQurzYpntafjj3fXLpe6u5iBpQLD0
         woN4Y5UV6Blhg4JtIDad1CxX5gioDyy2h6rk43bIX4+wlfvM1YYSuFoeopnr1fb/a3zL
         IAtb0YqrEgQ1qhrM3rGjjCZgm+3GTVSXLWkoSC8w76l0l0kt2kRz/felNVCqZDZQYgop
         MEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGjpuoHToThUojmYOw0QiZ7tHvBkaksCb1ZjIQGUb8s=;
        b=RX46+GOr+327eCG5iGv+7n2B42avqIcGvPYZnu5qgo5FPvq6OfTBTNjnl8j+MXL7Xf
         9sRYcJQZIZb+4nS6+Z1si5jW7xjKivygyJEWJkiOeWPLpA3yAtS8GJwX6uc2/1Q2ZD3c
         ZCT0gb/BUZKG+n1Ck5dujoyWmczVacXq2F8iTtLJGZDb7IlSol/aCekNZiCjIg8R0nnj
         vZrb09j5N8MUarpcDzN0t90e3gBG8BahPzc5QKgU4GbSSma7P98Dl+chn1+1TdjajlTJ
         ON6Xygd3r8TDm7wxg5Z2K4y1AlsskJRsPIx9aUbsBS4EFM5WPflNmeHiOmxT/i3YxaOF
         ZhTw==
X-Gm-Message-State: AO0yUKULls5W45BZ37jjJ0hS1UAv+9Vxc5Oz9iTdy8GYuUytIQux5/A6
        6pSTgF759y4rw+S5ragghpw=
X-Google-Smtp-Source: AK7set+OD1vw4/qalPmJjvKoW0eLx84iB5jzcU90B6X714jWINjVpNjwfNO5fOE2fLeCrgaax7ErZw==
X-Received: by 2002:a54:4896:0:b0:378:974b:4fe6 with SMTP id r22-20020a544896000000b00378974b4fe6mr924901oic.8.1676659747607;
        Fri, 17 Feb 2023 10:49:07 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id s22-20020acaa916000000b0037fa61eb1dasm1198521oie.47.2023.02.17.10.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:49:07 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v6 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
Date:   Fri, 17 Feb 2023 12:49:02 -0600
Message-Id: <20230217184904.1290-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217184904.1290-1-kaehndan@gmail.com>
References: <20230217184904.1290-1-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a USB HID device which includes an I2C controller and 8 GPIO pins.

The binding allows describing the chip's gpio and i2c controller in DT
using the subnodes named "gpio" and "i2c", respectively. This is
intended to be used in configurations where the CP2112 is permanently
connected in hardware.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 .../bindings/i2c/silabs,cp2112.yaml           | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml

diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
new file mode 100644
index 000000000000..a27509627804
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CP2112 HID USB to SMBus/I2C Bridge
+
+maintainers:
+  - Danny Kaehn <kaehndan@gmail.com>
+
+description:
+  The CP2112 is a USB HID device which includes an integrated I2C controller
+  and 8 GPIO pins. Its GPIO pins can each be configured as inputs, open-drain
+  outputs, or push-pull outputs.
+
+properties:
+  compatible:
+    const: usb10c4,ea90
+
+  reg:
+    maxItems: 1
+    description: The USB port number on the host controller
+
+  i2c:
+    description: The SMBus/I2C controller node for the CP2112
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      sda-gpios:
+        maxItems: 1
+
+      scl-gpios:
+        maxItems: 1
+
+      clock-frequency:
+        minimum: 10000
+        default: 100000
+        maximum: 400000
+
+  gpio:
+    description: The GPIO controller node for the CP2112
+    type: object
+    unevaluatedProperties: false
+
+    properties:
+      interrupt-controller: true
+      "#interrupt-cells":
+        const: 2
+
+      gpio-controller: true
+      "#gpio-cells":
+        const: 2
+
+      gpio-line-names:
+        minItems: 1
+        maxItems: 8
+
+    patternProperties:
+      "-hog(-[0-9]+)?$":
+        type: object
+
+        required:
+          - gpio-hog
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      device@1 {
+        compatible = "usb10c4,ea90";
+        reg = <1>;
+
+        i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          sda-gpios = <&cp2112_gpio 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+          scl-gpios = <&cp2112_gpio 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+          temp@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+          };
+        };
+
+        cp2112_gpio: gpio {
+          gpio-controller;
+          interrupt-controller;
+          #gpio-cells = <2>;
+          gpio-line-names = "CP2112_SDA", "CP2112_SCL", "TEST2",
+            "TEST3","TEST4", "TEST5", "TEST6";
+
+          fan-rst-hog {
+              gpio-hog;
+              gpios = <7 GPIO_ACTIVE_HIGH>;
+              output-high;
+              line-name = "FAN_RST";
+          };
+        };
+      };
+    };
-- 
2.25.1


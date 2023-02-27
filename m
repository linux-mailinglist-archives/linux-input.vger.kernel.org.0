Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A227F6A43B9
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 15:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjB0OIH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Feb 2023 09:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjB0OIG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Feb 2023 09:08:06 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AD06581;
        Mon, 27 Feb 2023 06:08:02 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id z5so4021004ilq.0;
        Mon, 27 Feb 2023 06:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ttf/oycojer2AjXga/cynyrMrsDrjxN9x+nUsxDh+I=;
        b=F91bpEpe9t9wAE/KAfGoqfnf9wJSYhXJoRsDpCmHMeFwyxOdg2ulEsst++T4+fo/DL
         E+Y/LrL9p7A2GLD4nSB0lSd1kyoVpnntZDEefIduPE9OZKUOWFzT1IdIyR2F0M+qd0qf
         2wwKM29uX6xE+KtamSq2qOYXfOo7y02E+IHkBo/G2/l6/ymaip+8HWcKbcnbDJDMNrnH
         ZkKrIYiMrpeSVGOXg7AyMwhG1CGKP5SfD1T8al8tbgSZjna2azTqIUrq6sRjo9wAASMX
         dyD8ELbyR05nTaRqLITNHj9mB3Zy81NL2knmwTS2zMqfYw0h4CbcBtTfAQyXE+e3x22I
         6Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ttf/oycojer2AjXga/cynyrMrsDrjxN9x+nUsxDh+I=;
        b=70/EG419Y+CmkNxc/HwGDGx1ZG4+yg25IE7C5j6nxh+UTjcSrvYPw8+g335BmOKJHJ
         A9S901LMmfXBattRNKfsMQzWa75djdqXdsx0e2aWI/oUkhRpw+hwEDGRI28CCyFnebqF
         e9JinqydjE/JQ5crWietTAzQgJjbnFUes3JgrDHkH6rrrGQJq2WxMpbqyw6npou590U2
         lZCyKXrrepTQ76wW8R04rmr56zo/+ZLvZiS7FtsuaPESLA8IrsTOpzGeypsV8S2hfge1
         mQOMFGMB6z3cwBppQLlW7qj9l1cgSj4E+2vAgTaMwqEBWbjrT3KSs9kxIwLxI2qRvikC
         RkXQ==
X-Gm-Message-State: AO0yUKVZiItxIe+VE4gjryVDLAayMek3901bYvy4PqFUGYN7hbh3KSUX
        POeeuKgITq3ThmWMAFtSBBE=
X-Google-Smtp-Source: AK7set/VqyzFWPzFk29nBxAQTBZFTbD2iqQxGVQbUgZyEnD87tkN4zwYB3AtVKxubkIsBS7f0RRNyg==
X-Received: by 2002:a05:6e02:16cd:b0:316:acef:e65a with SMTP id 13-20020a056e0216cd00b00316acefe65amr23013277ilx.17.1677506881858;
        Mon, 27 Feb 2023 06:08:01 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id 14-20020a056e020cae00b00316dc3afe57sm1921503ilg.86.2023.02.27.06.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 06:08:01 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
Date:   Mon, 27 Feb 2023 08:07:56 -0600
Message-Id: <20230227140758.1575-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227140758.1575-1-kaehndan@gmail.com>
References: <20230227140758.1575-1-kaehndan@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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


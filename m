Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4D3D6C04E9
	for <lists+linux-input@lfdr.de>; Sun, 19 Mar 2023 21:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjCSUsP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Mar 2023 16:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjCSUsJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Mar 2023 16:48:09 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD8044B3;
        Sun, 19 Mar 2023 13:48:06 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id ek9so11111736qtb.10;
        Sun, 19 Mar 2023 13:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679258885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ttf/oycojer2AjXga/cynyrMrsDrjxN9x+nUsxDh+I=;
        b=d/fiXBbaM4kPZXzhr6gXVAEj6UaXsTspmarNLmT3nubpgN0gikONximY813mxnSHJi
         aTYOUa9mrqWPijLcdupDE5YDeh0W5J0UwAd4z436qr/PrA6jbF5XSSZd7wX9lqHpdrK7
         GprjqSxLLJrOkXHG2269xjHCfwLUfbvwWoX6JeoAkYPD71yA14keKLmUIVcSZN8FMNUH
         x5hW0laKJI/MpEpXuOV+QAzT6YyHyX9dpKJjCjRioGEynEerIPsbRzOlhsebdlrP6VJq
         yg3+1uQwKW14xdm91nX+HWj0e5gYy1HKqtatiBc78UOklgoiC0peQydf3/0p6kwK+Ags
         xp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679258885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ttf/oycojer2AjXga/cynyrMrsDrjxN9x+nUsxDh+I=;
        b=4gqZnaoV+cICmqFPaa+Cl2pmxHn+1FPHseq/brtYD1+n8nFJa4LcBNlU+SnsWQdP6L
         x8l7+NP9IsITmbbyBqAgO8Do1OViqRwN/1XGK2DoRaUNY6mNNNzHoE2CFrorR4ovfFWQ
         tnDpMTzQ+x0Q/9TWvhpTu8y3JB95koZEAoPG5YNDJnaBwifZ8m+cDLAW7jpT3x78S/x8
         loNcUtvRd6uqkMwsH0NbtF+lrrXn0MwFHOoUHfra6/MgikpmfMi2IikIhjhRMBUsZ+1+
         1uoEWv//16+xO29+JccFyDMgOmM29hUKsSflaK9oQJ0lvH90xOivNI9CWXJlaqhdV/RZ
         Z1GQ==
X-Gm-Message-State: AO0yUKVUmYsghMUZWQcZsqnhOgcVDkTAPagVASRuy1MQbHyQtDZJuNeu
        ZLbzhqitEuSy16ZmOylb5j4=
X-Google-Smtp-Source: AK7set8Vg9bg0tcHzT+90i8EgOVq+QBNOt5SEgSnPb2qlHgV0hKOWBArFvUXoCMtdp9Z50Pefjidpw==
X-Received: by 2002:ac8:5792:0:b0:3e0:d161:29ad with SMTP id v18-20020ac85792000000b003e0d16129admr3010884qta.28.1679258884743;
        Sun, 19 Mar 2023 13:48:04 -0700 (PDT)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id m24-20020ac866d8000000b003b7e8c04d2esm5186021qtp.64.2023.03.19.13.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 13:48:04 -0700 (PDT)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
Date:   Sun, 19 Mar 2023 15:48:00 -0500
Message-Id: <20230319204802.1364-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230319204802.1364-1-kaehndan@gmail.com>
References: <20230319204802.1364-1-kaehndan@gmail.com>
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


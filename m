Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82165692A3E
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 23:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbjBJWgi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 17:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233878AbjBJWgh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 17:36:37 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D271733;
        Fri, 10 Feb 2023 14:36:36 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id z5so7578467qtn.8;
        Fri, 10 Feb 2023 14:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HbCbFVY56AQbOfarvrsKxEUIEroNNwPD9YmXZj1dKo=;
        b=UpRcOFYzkCh/hMqT2g2b+IY81PDaB0XAmE0pkyH5YpEYwPUBwtDgOZEaPbSV1NWZCS
         8mxFq/DnbVYB12zb1f50MIie+trezc86WnnyMtv4MxaEXmMIHQjstG7RNic3JFq2SGmD
         bTOtKZS8zjapQDYowbV+e9rd8Ll6fbj1Wq8mTNwY/ReyhB/rVdMmd9qbW1ubbkdQS280
         BEvFd5N6lQ7VOTfMVqO6IGQxhfZWhkpqiqQESUzHHtf/KzDazyAmaR6BmBzscVCckG5j
         MzYQrq1NhLeRSqnzC5/bpK63z/wnAc6tBfK3msXFFO3lm4v5P5SJxh1IetCCNdyge/yO
         ssOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HbCbFVY56AQbOfarvrsKxEUIEroNNwPD9YmXZj1dKo=;
        b=HImgn6G0gIfmqx54jHCufyeRgQXJFnMcDxU2Y8EvXlCMziPYM3QC2g5hcHjR7zxmrh
         eWAVv6venLOZFdZw9P9sPUnig9gbXjWzr0nLwhkd2qFZ6eosP8C7L6xy5LMKpuh08EJ2
         VlkrctaCq+epO3WDUBgA18kPlBc/ncGF1g+urA+xTV35U4vD3ANX6b2NuZqgh/E3LTjp
         9p/S9bAWlgkm5pacb3WcbyX6SKUDnndb00GMRqf0uDvKVx0oFwH9A7vguXzOw5p4f1bx
         G3/nAXYBAgaGB2vVXyisontp8oHuQG13WNq2EQKKqUKVNL28NTpq8WIFLFJSNeHX3X8K
         glQw==
X-Gm-Message-State: AO0yUKXbF6PVFYE66Zt3md+Y2lsQpiP336FENPO5TlZ3wwcjtRNaMCcg
        UvEX3g7cXP4l9pnt3V3ItEM=
X-Google-Smtp-Source: AK7set/t5KCDDzxI//shjx+QfrH+JPOUIyKMgV35NLZj8reyhs0rasCIdzb1bCTkonnNunieNUM9+g==
X-Received: by 2002:ac8:5a54:0:b0:3ba:1acd:4f8 with SMTP id o20-20020ac85a54000000b003ba1acd04f8mr30070350qta.42.1676068595351;
        Fri, 10 Feb 2023 14:36:35 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id o5-20020ac80245000000b003b64f1b1f40sm4166063qtg.40.2023.02.10.14.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 14:36:35 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v5 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
Date:   Fri, 10 Feb 2023 16:36:36 -0600
Message-Id: <20230210223638.12796-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210223638.12796-1-kaehndan@gmail.com>
References: <20230210223638.12796-1-kaehndan@gmail.com>
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
index 000000000000..81eda01ebda5
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
+      "^(.+-hog(-[0-9]+)?)$":
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


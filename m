Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEF56A120D
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 22:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjBWVby (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 16:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBWVbx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 16:31:53 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804DB56505;
        Thu, 23 Feb 2023 13:31:52 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id bo10so11437555qvb.12;
        Thu, 23 Feb 2023 13:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGjpuoHToThUojmYOw0QiZ7tHvBkaksCb1ZjIQGUb8s=;
        b=f5XCKjkefDjBnd3OEPHxB1xZ/PIFjIcRyTnv1x0kR3QEYWJTdfwnIMN3eEf+CyDqTO
         CK6LZE6zjJ4d36yO8JqiH9zTFztkNsEfDLEiHfSn7mKyMSh0xm5/Wwmp3F67LQEmjWyN
         0SbvBjKF+wmvsStu46P/JXbLYzwgiG6AlJKzDXBVgmaQqpwRhuhiaKE4vVuHIVdDXtLJ
         qarTd4AypLPAnVzxc+sJpV7JTvPGn3W5nPEeV8qu5aw+SWhj9skpgrEVEXecLFq9fnFh
         VfkFWEDjvLFt6EBzhqr1oCKty7lo0dQdS4UhPvlg60lo+MQPDlk0taR2xiHeE0tg8XFK
         8n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGjpuoHToThUojmYOw0QiZ7tHvBkaksCb1ZjIQGUb8s=;
        b=1fbX0l6IH5tOer0xHjGYxN/oD3rc2VTjnblPqftIcjHxuEvGcH/KX2PDlzUi3PijIa
         oJVNaNaW/6U8W4FuYGzKqlHuvy3knlaS9+iw1dezJWrmR9EesahU6pU51BZrMndyQjeR
         7QxoIkTx74E3K3SBr/ATQtcyp2zVUBdeB35SnNG1LF7Pzm4jeRr2ESD7kfdD6Ld4XkKc
         AdWgNEetevHVqN2AHoduScKFKLtwgp7dZF9t0U9KUYokw3DnWjnQ1Dcl55a1Arx8CINq
         s7g6qW1KeXe7U5h3mBXVDOgdhfTh4Y0DjcbH15Njm3fMR3Cnf67IN1TFW4+iov74pdOM
         0FEQ==
X-Gm-Message-State: AO0yUKVXAT3LIfcWLoul1e0lZsvBS5bZDMwXtkjMxD94UbM7jFjgVjka
        OdeiXtY9WHG+2Slh7twp0mo=
X-Google-Smtp-Source: AK7set9RzhT4ZDlYzVXnJruzI7aeFlwLU63R+z6Vt0wL83Pxc2a8ACPoelftg6Y96MHWS931JjNUMQ==
X-Received: by 2002:a05:6214:f24:b0:56b:ee46:5c3c with SMTP id iw4-20020a0562140f2400b0056bee465c3cmr24322608qvb.49.1677187911429;
        Thu, 23 Feb 2023 13:31:51 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id j187-20020a3787c4000000b00739e7e10b71sm3475394qkd.114.2023.02.23.13.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 13:31:51 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v7 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
Date:   Thu, 23 Feb 2023 15:31:45 -0600
Message-Id: <20230223213147.268-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223213147.268-1-kaehndan@gmail.com>
References: <20230223213147.268-1-kaehndan@gmail.com>
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


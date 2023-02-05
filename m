Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFBF68B067
	for <lists+linux-input@lfdr.de>; Sun,  5 Feb 2023 15:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjBEOyx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Feb 2023 09:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjBEOyw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Feb 2023 09:54:52 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C311E1E6;
        Sun,  5 Feb 2023 06:54:51 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id d13so5738613qvj.8;
        Sun, 05 Feb 2023 06:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1Jbawl9+A9VS/WlcILwvsKK4Zc/TOJc/i6wLNt0AFo=;
        b=It0FvL4svdzCpNV5+yI5JOQQkErwIUTEtOecA+CdFeag0vUM0l6eTjDx+NniIkbE7E
         l4tRvMnbzubUu8F3Hr/Pyj1UmgDvTZK829MmRIbAlFLg1ikds8NbAVX++klfe8nNp+70
         P/YCB5XUajaVXzT7pfnIheWRWXBLRjuz848bP3sUCLkguB4hRZJ4FDkw5MOrsb1DJdqc
         XKOlYhHFZCUmx4OPYhSoZL2NgvNETF0SCvKgHPeLp3xR6BG2/AVRZoJyILV6ledgYLat
         Km803MG2hpFo1EH6ZRrOFd+X3TjBvgBTANFyeUtKnKOeS10eXEwBrG658w3TALI4M3gx
         YiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1Jbawl9+A9VS/WlcILwvsKK4Zc/TOJc/i6wLNt0AFo=;
        b=ue0doU3k3KsLAbLc34Ct+g42Wj0SvdL4TaW6vrE7ls8pltlN8BeMt16avEhvCDhBMX
         JaTdgV/cago+jksDtYazJjXQheqOWOWzUReLTSwSzqrnNHMA1jt/odczyonHoeyTMIr8
         VohjCG8qQ8q6T85/zUn5dU3MZGvDku71NKj2ZaWJOZK9SaLUXUPLtdRQtRwdJhLK71XF
         wFoYZMD2UlSC4q0iv3K/DdfM8XbjK0+nplCXMRyVyZlc6vqCemU+1mY6GNE7vmjSK6JS
         cRtLRj8zgfmyNaliKcy/y56Rz3FSZHKEXWBjWyO9JlHum51g+QE1uh3Tc1cgmcBfRAuq
         wGXA==
X-Gm-Message-State: AO0yUKX32R81pVoPxQ0jKXa1NlokQK0Shuyaa+LptAtyPyhf6DkaouU6
        YbawXOVLh8NiA9wjZByZsRf3Pd6n2KHjOQ==
X-Google-Smtp-Source: AK7set9Kjf2TlFCFGApRIQ9oiII7LNze98AE7FN13F8OO8Q/qFjLdjuxdxgBD3ruQihiUeIB30BZMw==
X-Received: by 2002:ad4:5945:0:b0:56b:ebff:6850 with SMTP id eo5-20020ad45945000000b0056bebff6850mr7265826qvb.8.1675608890803;
        Sun, 05 Feb 2023 06:54:50 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id b5-20020a37b205000000b00719165e9e72sm5560048qkf.91.2023.02.05.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 06:54:50 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v3 1/4] dt-bindings: input: Add CP2112 HID USB to SMBus Bridge
Date:   Sun,  5 Feb 2023 08:54:47 -0600
Message-Id: <20230205145450.3396-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205145450.3396-1-kaehndan@gmail.com>
References: <20230205145450.3396-1-kaehndan@gmail.com>
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
 .../bindings/input/silabs,cp2112.yaml         | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/silabs,cp2112.yaml

diff --git a/Documentation/devicetree/bindings/input/silabs,cp2112.yaml b/Documentation/devicetree/bindings/input/silabs,cp2112.yaml
new file mode 100644
index 000000000000..eb2e89edb80a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/silabs,cp2112.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/silabs,cp2112.yaml#
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
+    properties:
+      clock-frequency:
+        minimum: 10000
+        default: 100000
+        maximum: 400000
+
+  gpio:
+    description: The GPIO controller node for the CP2112
+    type: object
+    properties:
+      interrupt-controller: true
+      "#interrupt-cells":
+        const: 2
+
+      gpio-controller: true
+      "#gpio-cells":
+        const: 2
+
+      ngpios:
+        const: 8
+
+      gpio-line-names:
+        minItems: 1
+        maxItems: 8
+
+    patternProperties:
+      "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+        type: object
+        properties:
+          gpio-hog: true
+          input: true
+          output-high: true
+          output-low: true
+          line-name: true
+          gpios:
+            minItems: 1
+            maxItems: 8
+
+        required:
+          - gpio-hog
+          - gpios
+
+        additionalProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
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
+
+          temp@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+          };
+        };
+
+        gpio {
+          gpio-controller;
+          interrupt-controller;
+          #gpio-cells = <2>;
+          gpio-line-names = "TEST0", "TEST1", "TEST2",
+            "TEST3", "TEST4", "TEST5", "TEST6", "TEST7";
+        };
+      };
+    };
-- 
2.25.1


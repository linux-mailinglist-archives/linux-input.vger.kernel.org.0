Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9125B16F5F5
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2020 04:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729652AbgBZDKi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Feb 2020 22:10:38 -0500
Received: from mail-pf1-f174.google.com ([209.85.210.174]:33117 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgBZDKi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Feb 2020 22:10:38 -0500
Received: by mail-pf1-f174.google.com with SMTP id n7so680287pfn.0
        for <linux-input@vger.kernel.org>; Tue, 25 Feb 2020 19:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZOVDf2cfnyC0v+3gtlmyMf276AJH5zfo1llXk1BdAfY=;
        b=JMqqLXXdiM2EB0OzopVIZ1OdSarmbVggpxnOOFdVm4lOa7t8Btc5s7xVKlYQNPEyod
         UsuyUXpKy7eBfxyiFu3rjQ+go9yOtrRdevKQydAubSEZPrRUtR3DdMssU/9Ipnp4c2N9
         DdTwn9KxosTaJeMDbvmVUcFoOBn/ObPkQ3v8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZOVDf2cfnyC0v+3gtlmyMf276AJH5zfo1llXk1BdAfY=;
        b=d6G1tpzkF7sIHZwNaHA+HRFDD3537Sl9E88zOUrfLqvMrHGUnNAOOxeQJ8oiqp5YiG
         KytpIa1pfe+sYXWq2u3aXY/I42SpxVZ/j/zytobE+Htht1pX/tH8lphywXdHnPuwnabc
         eNvJUrHos67AeALXsVfqwZJ9MnMTSf14b/5Oc9QlpAe5evwzj0sdXknyjCWbx5G1koaL
         CVjEXYNl+6sM2Y3KLYSWb7AJXtYW/Q4CneQncX8zyAzYclwK1hivas7ImbWsxjewQEuU
         VDXVzP/ShYl9R5uRGvOPO2XaGl9r4CYQjdTNBOjHDJx6D5ExPACMLZ5CQk4dcPnNWRv9
         CYSw==
X-Gm-Message-State: APjAAAWh7i80vdtiPu2Uc/GZzeqXp9xvqvIAV5R6mQinADwdLrBnIp2r
        Bwsqm+GsPWJ+tJy5sEKWqCJLAg==
X-Google-Smtp-Source: APXvYqwZ7+1GtOpKixpQZac9ZFaWWdFQjrXAwirQ5B3VRhL/Y0kDcFoNpSAQaTur8cou0rw3G5zk0w==
X-Received: by 2002:a63:354b:: with SMTP id c72mr1425435pga.99.1582686636759;
        Tue, 25 Feb 2020 19:10:36 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id z4sm487885pfn.42.2020.02.25.19.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 19:10:36 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v5] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
Date:   Wed, 26 Feb 2020 11:10:09 +0800
Message-Id: <20200226031009.164703-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the ChromeOS EC bindings to json-schema.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
v5: unset additionalProperties
v4: text reflows, add type references, and fix examples
v3: node name changed in rpmsg example
v2: cleanup description, fix typos, remove LPC, and add RPMSG example

some properties defined under allOf/if/compatible/google,cros-ec-spi
are recongnized as additional properties by dt-validate.

Is there more cleaner ways to handle this? (property depending on
another one)
---
 .../devicetree/bindings/mfd/cros-ec.txt       |  76 ----------
 .../devicetree/bindings/mfd/cros-ec.yaml      | 140 ++++++++++++++++++
 2 files changed, 140 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
deleted file mode 100644
index 4860eabd0f72..000000000000
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ /dev/null
@@ -1,76 +0,0 @@
-ChromeOS Embedded Controller
-
-Google's ChromeOS EC is a Cortex-M device which talks to the AP and
-implements various function such as keyboard and battery charging.
-
-The EC can be connect through various means (I2C, SPI, LPC, RPMSG) and the
-compatible string used depends on the interface. Each connection method has
-its own driver which connects to the top level interface-agnostic EC driver.
-Other Linux driver (such as cros-ec-keyb for the matrix keyboard) connect to
-the top-level driver.
-
-Required properties (I2C):
-- compatible: "google,cros-ec-i2c"
-- reg: I2C slave address
-
-Required properties (SPI):
-- compatible: "google,cros-ec-spi"
-- reg: SPI chip select
-
-Required properties (RPMSG):
-- compatible: "google,cros-ec-rpmsg"
-
-Optional properties (SPI):
-- google,cros-ec-spi-pre-delay: Some implementations of the EC need a little
-  time to wake up from sleep before they can receive SPI transfers at a high
-  clock rate. This property specifies the delay, in usecs, between the
-  assertion of the CS to the start of the first clock pulse.
-- google,cros-ec-spi-msg-delay: Some implementations of the EC require some
-  additional processing time in order to accept new transactions. If the delay
-  between transactions is not long enough the EC may not be able to respond
-  properly to subsequent transactions and cause them to hang. This property
-  specifies the delay, in usecs, introduced between transactions to account
-  for the time required by the EC to get back into a state in which new data
-  can be accepted.
-
-Required properties (LPC):
-- compatible: "google,cros-ec-lpc"
-- reg: List of (IO address, size) pairs defining the interface uses
-
-Optional properties (all):
-- google,has-vbc-nvram: Some implementations of the EC include a small
-  nvram space used to store verified boot context data. This boolean flag
-  is used to specify whether this nvram is present or not.
-
-Example for I2C:
-
-i2c@12ca0000 {
-	cros-ec@1e {
-		reg = <0x1e>;
-		compatible = "google,cros-ec-i2c";
-		interrupts = <14 0>;
-		interrupt-parent = <&wakeup_eint>;
-		wakeup-source;
-	};
-
-
-Example for SPI:
-
-spi@131b0000 {
-	ec@0 {
-		compatible = "google,cros-ec-spi";
-		reg = <0x0>;
-		interrupts = <14 0>;
-		interrupt-parent = <&wakeup_eint>;
-		wakeup-source;
-		spi-max-frequency = <5000000>;
-		controller-data {
-		cs-gpio = <&gpf0 3 4 3 0>;
-		samsung,spi-cs;
-		samsung,spi-feedback-delay = <2>;
-		};
-	};
-};
-
-
-Example for LPC is not supplied as it is not yet implemented.
diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.yaml b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
new file mode 100644
index 000000000000..8416a1299321
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/cros-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS Embedded Controller
+
+maintainers:
+  - Benson Leung <bleung@chromium.org>
+  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
+  - Guenter Roeck <groeck@chromium.org>
+
+description:
+  Google's ChromeOS EC is a microcontroller which talks to the AP and
+  implements various functions such as keyboard and battery charging.
+  The EC can be connected through various interfaces (I2C, SPI, and others)
+  and the compatible string specifies which interface is being used.
+
+properties:
+  compatible:
+    oneOf:
+      - description:
+          For implementations of the EC is connected through I2C.
+        const: google,cros-ec-i2c
+      - description:
+          For implementations of the EC is connected through SPI.
+        const: google,cros-ec-spi
+      - description:
+          For implementations of the EC is connected through RPMSG.
+        const: google,cros-ec-rpmsg
+
+  google,has-vbc-nvram:
+    description:
+      Some implementations of the EC include a small nvram space used to
+      store verified boot context data. This boolean flag is used to specify
+      whether this nvram is present or not.
+    type: boolean
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: google,cros-ec-i2c
+    then:
+      properties:
+        reg:
+          description: I2C slave address
+          maxItems: 1
+
+      required:
+        - reg
+  - if:
+      properties:
+        compatible:
+          const: google,cros-ec-spi
+    then:
+      properties:
+        reg:
+          description: SPI chip select
+          maxItems: 1
+
+        google,cros-ec-spi-pre-delay:
+          description:
+            This property specifies the delay in usecs between the
+            assertion of the CS and the first clock pulse.
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/uint32
+            - default: 0
+            - minimum: 0
+
+        google,cros-ec-spi-msg-delay:
+          description:
+            This property specifies the delay in usecs between messages.
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/uint32
+            - default: 0
+            - minimum: 0
+
+      required:
+        - reg
+
+# FIXME: spi-related properties are not additional properties
+#additionalProperties: false
+
+examples:
+  # Example for I2C
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cros-ec@1e {
+            compatible = "google,cros-ec-i2c";
+            reg = <0x1e>;
+            interrupts = <6 0>;
+            interrupt-parent = <&gpio0>;
+        };
+    };
+
+  # Example for SPI
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cros-ec@0 {
+            compatible = "google,cros-ec-spi";
+            reg = <0x0>;
+            google,cros-ec-spi-msg-delay = <30>;
+            google,cros-ec-spi-pre-delay = <10>;
+            interrupts = <99 0>;
+            interrupt-parent = <&gpio7>;
+            spi-max-frequency = <5000000>;
+        };
+    };
+
+  # Example for RPMSG
+  - |
+    scp0 {
+        cros-ec@0 {
+            compatible = "google,cros-ec-rpmsg";
+        };
+    };
+...
-- 
2.25.0.265.gbab2e86ba0-goog


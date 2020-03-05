Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B584F17A0B8
	for <lists+linux-input@lfdr.de>; Thu,  5 Mar 2020 08:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgCEHxk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 02:53:40 -0500
Received: from mail-pj1-f54.google.com ([209.85.216.54]:34113 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgCEHxk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Mar 2020 02:53:40 -0500
Received: by mail-pj1-f54.google.com with SMTP id gc16so214884pjb.1
        for <linux-input@vger.kernel.org>; Wed, 04 Mar 2020 23:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4wAyu+t5aSw4KcrZpSdM6QFGT5rj2kkyRN/of+Er2Q=;
        b=JQK6kdmjQOR34nas9KWBhs807hBp5uBSt35wMjG/8a6T/CrC74xyi4U8MnAgo8boUn
         Myp1k0CqbctXaKOilI2+eBdkRX7L7TdL+5+6730Jbwk1G+/s183uVpkMUqL2Pxg5vRSD
         earF8ttbP1xgL/AKgm0EZ8tzo9ql9vvaMYawQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4wAyu+t5aSw4KcrZpSdM6QFGT5rj2kkyRN/of+Er2Q=;
        b=mqINJm5/l8klABDvyoTmx6W+gHgRMz7COGVq8pasT30tTausqATEYCcSJ3oAyaOCbt
         RHzFMlwofIz9ajwyzNSABw9Lpsb5JX6NamdwLUT4QaR5ah/1ZdIry5McMwImEEo0Og4f
         O20l8XHJmb/NI1BnUrufiT+t/eBIHkySpmHspb3YGh4k0+0Vz3GB1BRPhnMtGUQLQ8Ef
         gH3wv9V12VXvM2eks76yNqimmemwBrYLL+m94Rn0Xpk7U4dyUItYmFS0lnldOMhBnciI
         gL0f2wYA9JyDV1GSpVLhXfxHEmCDka2GPyKB/MCBqE68k/AQSAPsLhlIlTtmSKVJreKY
         +4Pg==
X-Gm-Message-State: ANhLgQ1U0P/I45tKyCFBdCLNTyd4hNfZI73Qk90E1NqewK4vsrGKdpsr
        +/yz35sEj5CYiH6rPOgmkiq61A==
X-Google-Smtp-Source: ADFU+vv9yuRlW+qxmU08BvlngQOTpfzsm2jaFkjG7wcGPmOoWJT5sMHYFbRJ8YjizR5pYKFpTR+r+g==
X-Received: by 2002:a17:902:aa01:: with SMTP id be1mr6637419plb.293.1583394817370;
        Wed, 04 Mar 2020 23:53:37 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id h95sm5173893pjb.48.2020.03.04.23.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 23:53:36 -0800 (PST)
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
Subject: [PATCH v6] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
Date:   Thu,  5 Mar 2020 15:53:02 +0800
Message-Id: <20200305075302.200959-1-ikjn@chromium.org>
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
v6: adjust property dependencies, drop duplicated definitions,
    and set additionalProperties
v5: unset additionalProperties
v4: text reflows, add type references, and fix examples
v3: node name changed in rpmsg example
v2: cleanup description, fix typos, remove LPC, and add RPMSG example
---
 .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
 .../devicetree/bindings/mfd/cros-ec.yaml      | 125 ++++++++++++++++++
 2 files changed, 125 insertions(+), 76 deletions(-)
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
index 000000000000..19add9d6bd09
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
@@ -0,0 +1,125 @@
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
+  google,cros-ec-spi-pre-delay:
+    description:
+      This property specifies the delay in usecs between the
+      assertion of the CS and the first clock pulse.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - default: 0
+      - minimum: 0
+
+  google,cros-ec-spi-msg-delay:
+    description:
+      This property specifies the delay in usecs between messages.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - default: 0
+      - minimum: 0
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
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - google,cros-ec-i2c
+          - google,cros-ec-rpmsg
+then:
+  properties:
+    google,cros-ec-spi-pre-delay: false
+    google,cros-ec-spi-msg-delay: false
+
+additionalProperties: false
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


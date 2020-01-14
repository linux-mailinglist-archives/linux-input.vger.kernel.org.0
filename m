Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661B5139F6F
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 03:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgANCTv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 21:19:51 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39744 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729030AbgANCTv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 21:19:51 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so4592852plp.6
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 18:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dqEckbXPcfEUqWhZqBJ6PLYPFoSJZMoENeqIIUphVrg=;
        b=FDVtaIks8h5cHACCyLs3Pmb5QWY44/zulF/aRPl1D/iQVlGOHgHWhMcujCAbxWLo4d
         GkROgNx+6EvrBGFuryyXlEFFt6UOrwco+BG171HX85xqiS6PkyxeWtjV7FpAtLx9v0Ze
         ufbcWFSvCR2evHRpsKVeQwCpoKy/sm1WVQ8qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dqEckbXPcfEUqWhZqBJ6PLYPFoSJZMoENeqIIUphVrg=;
        b=Vkfji45QAYxnCbOohcvIiYrEom+lD1T9TgtawejKSQnfrkKf64u9Qa9xcPo8oljdMw
         HShftoh2xm7BYZM7IL++vKeKxmwDXY4etenSpfCDWW2LOukpRlq3orgzZq1mxOI7K2Yh
         fe6b3KcY/nYuNrszw8qSOkfHDzDn45aQnrwU3SONYatkdYaWwjFQOWLRQs3nGDm7L5gp
         Egrj+JfScX6SyQb0k2z4MzN79aiB4gQ6tDi1Ebm1ri9zb/YVZHEqvZmfH7wWGbHJF5Em
         vBdQ3NqcW2+3qJeItmE/x97yMCoKO02ZG9dYPqovVTMzlijGwgBNvs4FNeC+XDf89QaB
         DtBQ==
X-Gm-Message-State: APjAAAWPW3AOleYHvGzk5gHDtPNAAft5FgrArh8oiLCvAEruxh6InrTK
        4YZjRbLyEo8AK5qmIuiLzSD6jA==
X-Google-Smtp-Source: APXvYqwlGH3Ognm6z0tQ+Au+E2DQFBMhX51rM1Vy+V6FDYSrDbwBvzchGYk5q8S/YQoLJsxpgjH9jw==
X-Received: by 2002:a17:902:8e87:: with SMTP id bg7mr17654652plb.279.1578968389360;
        Mon, 13 Jan 2020 18:19:49 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id e15sm4080353pja.13.2020.01.13.18.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 18:19:48 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
Date:   Tue, 14 Jan 2020 10:19:34 +0800
Message-Id: <20200114021934.178057-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the ChromeOS EC bindings to json-schema.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 .../devicetree/bindings/mfd/cros-ec.txt       |  76 ----------
 .../devicetree/bindings/mfd/cros-ec.yaml      | 138 ++++++++++++++++++
 2 files changed, 138 insertions(+), 76 deletions(-)
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
index 000000000000..ea430f0a553b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
@@ -0,0 +1,138 @@
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
+description: |
+  Google's ChromeOS EC is a Cortex-M device which talks to the AP and
+  implements various function such as keyboard and battery charging.
+  The EC can be connect through various means (I2C, SPI, LPC, RPMSG)
+  and the compatible string used depends on the interface.
+  Each connection method has its own driver which connects to the
+  top level interface-agnostic EC driver. Other Linux driver
+  (such as cros-ec-keyb for the matrix keyboard) connect to the
+  top-level driver.
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
+          For implementations of the EC is connected through LPC.
+        const: google,cros-ec-lpc
+      - description:
+          For implementations of the EC is connected through RPMSG.
+        const: google,cros-ec-rpmsg
+
+  google,has-vbc-nvram:
+    description: |
+      Some implementations of the EC include a small
+      nvram space used to store verified boot context data.
+      This boolean flag is used to specify whether this nvram is present or not.
+    type: boolean
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
+        google,cros-ec-spi-pre-delay:
+          description: |
+            Some implementations of the EC need a little time to wake up
+            from sleep before they can receive SPI transfers
+            at a high clock rate. This property specifies the delay,
+            in usecs, between the assertion of the CS to the start of
+            the first clock pulse.
+        google,cros-ec-spi-msg-delay:
+          description: |
+            Some implementations of the EC require some additional
+            processing time in order to accept new transactions.
+            If the delay between transactions is not long enough
+            the EC may not be able to respond properly to
+            subsequent transactions and cause them to hang.
+            This property specifies the delay, in usecs,
+            introduced between transactions to account for the
+            time required by the EC to get back into a state
+            in which new data can be accepted.
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          const: google,cros-ec-lpc
+    then:
+      properties:
+        reg:
+          description: |
+            List of (IO address, size) pairs defining the interface uses
+      required:
+        - reg
+
+examples:
+  - |+
+    // Example for I2C
+    i2c@12ca0000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        cros-ec@1e {
+            reg = <0x1e>;
+            compatible = "google,cros-ec-i2c";
+            interrupts = <14 0>;
+            interrupt-parent = <&wakeup_eint>;
+            wakeup-source;
+        };
+    };
+  - |+
+    // Example for SPI
+    spi@131b0000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        ec@0 {
+            compatible = "google,cros-ec-spi";
+            reg = <0x0>;
+            interrupts = <14 0>;
+            interrupt-parent = <&wakeup_eint>;
+            wakeup-source;
+            spi-max-frequency = <5000000>;
+            controller-data {
+                cs-gpio = <&gpf0 3 4 3 0>;
+                samsung,spi-cs;
+                samsung,spi-feedback-delay = <2>;
+            };
+        };
+    };
+
+...
-- 
2.25.0.rc1.283.g88dfdc4193-goog


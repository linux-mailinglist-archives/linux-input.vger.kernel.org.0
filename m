Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E47D213D793
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2020 11:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730768AbgAPKNX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Jan 2020 05:13:23 -0500
Received: from mail-pf1-f181.google.com ([209.85.210.181]:40676 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbgAPKNX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Jan 2020 05:13:23 -0500
Received: by mail-pf1-f181.google.com with SMTP id q8so9986556pfh.7
        for <linux-input@vger.kernel.org>; Thu, 16 Jan 2020 02:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r1sI7lAqNnLEnbchiRP56pTzqI/JEzXDZ8b3ti+XLkA=;
        b=WL+Drc9gk/mUasLjms6PomBTphQEodUltcPZKWmLdJhPopa5scrOWkO1yYq/cyiaxK
         Hgq3gXwb0OSr3rCEuqJWGkuzfyGWl6MNBzNmce9LToCqmRxVYzgNobBfUREWonmRQ8Eh
         zE9C6UV+95bw21Z0BKH8+VE4SdcqoBp7dEOZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r1sI7lAqNnLEnbchiRP56pTzqI/JEzXDZ8b3ti+XLkA=;
        b=SFzx5pEtTgXU80t9kn0EcAWzBjzgPWdap9oQWgquglUXfmDk3G+6QCnsOJc9f8rSfi
         fKxGFmlLuwzt3kVcHAekyM8bu+hropzanTtVwp4+pGhcS7bXmo+9u+oWdOZTeMItY2TX
         4uYHPegpxPBAc8lvDCSkk4YZSsY/6TsHTSTHmf8fEdo+DhUMFD6bXJcRCl4sLGZ0qaiJ
         H8TYXgWzDPn/iS3VmXhWiEAh8AYpn6A7pav/8+H89X9iPL9bbSmWMYMKqmNaWdNuUjAC
         zuFMpSU80IyIZaZNk2SQgvoeJVnBC5aGxRlNdLL93fH+W4qnCccuTib03HLCa8yK2ZAb
         5x5g==
X-Gm-Message-State: APjAAAWPeN924JAkWsrEDmgHvxgGfcD7QxakUaM0RfMxK51eSGubhy4P
        tk7UlmdRpWMLymOLKY6ywy9fRA==
X-Google-Smtp-Source: APXvYqx9xXrOzmTugFFcaOpOtNUFC+7dQM2ZpynEucnsLnuh6AHIYdbSlRIsEYPle8Enwj5lBryQBw==
X-Received: by 2002:aa7:93c1:: with SMTP id y1mr35119935pff.200.1579169602631;
        Thu, 16 Jan 2020 02:13:22 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id p5sm23758367pgs.28.2020.01.16.02.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 02:13:22 -0800 (PST)
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
Subject: [PATCH] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
Date:   Thu, 16 Jan 2020 18:13:16 +0800
Message-Id: <20200116101316.12108-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200114021934.178057-1-ikjn@chromium.org>
References: <20200114021934.178057-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the ChromeOS EC bindings to json-schema.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 .../devicetree/bindings/mfd/cros-ec.txt       |  76 ------------
 .../devicetree/bindings/mfd/cros-ec.yaml      | 111 ++++++++++++++++++
 2 files changed, 111 insertions(+), 76 deletions(-)
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
index 000000000000..633fa32c5746
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
@@ -0,0 +1,111 @@
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
+    description: |
+      Some implementations of the EC include a small
+      nvram space used to store verified boot context data.
+      This boolean flag is used to specify whether this nvram is
+      present or not.
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
+            This property specifies the delay in usecs between the
+            assertion of the CS and the first clock pulse.
+        google,cros-ec-spi-msg-delay:
+          description: |
+            This property specifies the delay in usecs between messages.
+      required:
+        - reg
+
+examples:
+  # Example for I2C
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cros-ec@1e {
+            compatible = "google,cros-ec-i2c";
+            reg = <0x1e>;
+            interrupts = <6 0>;
+            interrupt-parent = <&gpx1>;
+        };
+    };
+  # Example for SPI
+  - |
+    spi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cros-ec@0 {
+            compatible = "google,cros-ec-spi";
+            reg = <0x0>;
+            google,cros-ec-spi-msg-delay = <30>;
+            interrupts = <99 0>;
+            interrupt-parent = <&gpio7>;
+            spi-max-frequency = <5000000>;
+        };
+    };
+  # Example for RPMSG
+  - |
+    scp0 {
+        cros_ec@0 {
+            compatible = "google,cros-ec-rpmsg";
+        };
+    };
+...
-- 
2.25.0.rc1.283.g88dfdc4193-goog


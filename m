Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5890D14734C
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2020 22:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgAWVmZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jan 2020 16:42:25 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43417 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728709AbgAWVmZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jan 2020 16:42:25 -0500
Received: by mail-oi1-f193.google.com with SMTP id p125so4376354oif.10;
        Thu, 23 Jan 2020 13:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+ry1MAu70tZr2FgVHmRvVlaDtdq+05ktArHvCwvt8Fs=;
        b=OXu90mda5VekPjaVac/k/tWIeF8YyFfCEtNSCPbqO+PK+kxC84gTeKTrJx60m9H0YV
         NDigJlaMHFp97Vn+pyMDCc90ScpXuQf9yaTHz8JXp0e1vSd5F32PeO+mV3sYncMLUmrs
         dc0VnVLltUBkWLqO81v8brmcMw8lzilE2EHU6WH5f0P+EZtrwCHB4zFeIgRxJhXxT/ng
         CwysaYtwWI+GTlde2dFZwhyr5z/AB60VwvhG9B2tpINgYN4oPmMDYxP5jEeOzKLXWncy
         G+szTz3/YPZJP8BrWR5dVys0LQsoVz3vjQqTfqA9wEP4WmU40IhN1exOFs+3+vCNGwpO
         9tZg==
X-Gm-Message-State: APjAAAUpBG8mEtnkeU7L3MpyYpJvrEVRGwSEK+H+8Ko7IXrNtHQ4FteT
        61xZD/rAiO0dubNfxbca/mPSBgI=
X-Google-Smtp-Source: APXvYqxgP9at/bfrdtnsOuKRlURXg1Q2nHW10kiYoW6toA4xhFgn6O+wgORJ6I/IrUpRPXLh8O5e7g==
X-Received: by 2002:aca:3909:: with SMTP id g9mr7555oia.118.1579815743411;
        Thu, 23 Jan 2020 13:42:23 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id n2sm1069346oia.58.2020.01.23.13.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 13:42:22 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] dt-bindings: input: Convert gpio-keys bindings to schema
Date:   Thu, 23 Jan 2020 15:42:22 -0600
Message-Id: <20200123214222.17897-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the gpio-keys and gpio-keys-polled bindings to a DT schema. As
both bindings are almost the same, combine them into a single schema.

The binding said 'interrupts' was required, but testing on dts files
showed that it isn't required.

'linux,input-value' was only documented for gpio-keys-polled, but there
doesn't seem to be any reason for it to be specific to that.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/input/gpio-keys-polled.txt       |  45 ------
 .../devicetree/bindings/input/gpio-keys.txt   |  58 -------
 .../devicetree/bindings/input/gpio-keys.yaml  | 151 ++++++++++++++++++
 3 files changed, 151 insertions(+), 103 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-keys-polled.txt
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-keys.txt
 create mode 100644 Documentation/devicetree/bindings/input/gpio-keys.yaml

diff --git a/Documentation/devicetree/bindings/input/gpio-keys-polled.txt b/Documentation/devicetree/bindings/input/gpio-keys-polled.txt
deleted file mode 100644
index 4d9a3717eaaf..000000000000
--- a/Documentation/devicetree/bindings/input/gpio-keys-polled.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Device-Tree bindings for input/gpio_keys_polled.c keyboard driver
-
-Required properties:
-	- compatible = "gpio-keys-polled";
-	- poll-interval: Poll interval time in milliseconds
-
-Optional properties:
-	- autorepeat: Boolean, Enable auto repeat feature of Linux input
-	  subsystem.
-
-Each button (key) is represented as a sub-node of "gpio-keys-polled":
-Subnode properties:
-
-	- gpios: OF device-tree gpio specification.
-	- label: Descriptive name of the key.
-	- linux,code: Key / Axis code to emit.
-
-Optional subnode-properties:
-	- linux,input-type: Specify event type this button/key generates.
-	  If not specified defaults to <1> == EV_KEY.
-	- linux,input-value: If linux,input-type is EV_ABS or EV_REL then this
-	  value is sent for events this button generates when pressed.
-	  EV_ABS/EV_REL axis will generate an event with a value of 0 when
-	  all buttons with linux,input-type == type and linux,code == axis
-	  are released. This value is interpreted as a signed 32 bit value,
-	  e.g. to make a button generate a value of -1 use:
-	  linux,input-value = <0xffffffff>; /* -1 */
-	- debounce-interval: Debouncing interval time in milliseconds.
-	  If not specified defaults to 5.
-	- wakeup-source: Boolean, button can wake-up the system.
-			 (Legacy property supported: "gpio-key,wakeup")
-
-Example nodes:
-
-	gpio_keys_polled {
-			compatible = "gpio-keys-polled";
-			poll-interval = <100>;
-			autorepeat;
-
-			button21 {
-				label = "GPIO Key UP";
-				linux,code = <103>;
-				gpios = <&gpio1 0 1>;
-			};
-			...
diff --git a/Documentation/devicetree/bindings/input/gpio-keys.txt b/Documentation/devicetree/bindings/input/gpio-keys.txt
deleted file mode 100644
index 7cccc49b6bea..000000000000
--- a/Documentation/devicetree/bindings/input/gpio-keys.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-Device-Tree bindings for input/keyboard/gpio_keys.c keyboard driver
-
-Required properties:
-	- compatible = "gpio-keys";
-
-Optional properties:
-	- autorepeat: Boolean, Enable auto repeat feature of Linux input
-	  subsystem.
-	- label: String, name of the input device.
-
-Each button (key) is represented as a sub-node of "gpio-keys":
-Subnode properties:
-
-	- gpios: OF device-tree gpio specification.
-	- interrupts: the interrupt line for that input.
-	- label: Descriptive name of the key.
-	- linux,code: Keycode to emit.
-
-Note that either "interrupts" or "gpios" properties can be omitted, but not
-both at the same time. Specifying both properties is allowed.
-
-Optional subnode-properties:
-	- linux,input-type: Specify event type this button/key generates.
-	  If not specified defaults to <1> == EV_KEY.
-	- debounce-interval: Debouncing interval time in milliseconds.
-	  If not specified defaults to 5.
-	- wakeup-source: Boolean, button can wake-up the system.
-			 (Legacy property supported: "gpio-key,wakeup")
-	- wakeup-event-action: Specifies whether the key should wake the
-	  system when asserted, when deasserted, or both. This property is
-	  only valid for keys that wake up the system (e.g., when the
-	  "wakeup-source" property is also provided).
-	  Supported values are defined in linux-event-codes.h:
-		EV_ACT_ASSERTED		- asserted
-		EV_ACT_DEASSERTED	- deasserted
-		EV_ACT_ANY		- both asserted and deasserted
-	- linux,can-disable: Boolean, indicates that button is connected
-	  to dedicated (not shared) interrupt which can be disabled to
-	  suppress events from the button.
-
-Example nodes:
-
-	gpio-keys {
-			compatible = "gpio-keys";
-			autorepeat;
-
-			up {
-				label = "GPIO Key UP";
-				linux,code = <103>;
-				gpios = <&gpio1 0 1>;
-			};
-
-			down {
-				label = "GPIO Key DOWN";
-				linux,code = <108>;
-				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-			};
-			...
diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
new file mode 100644
index 000000000000..05b96a17af21
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/gpio-keys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device-Tree bindings for GPIO attached keys
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - gpio-keys
+      - gpio-keys-polled
+
+patternProperties:
+  ".*":
+    if:
+      type: object
+    then:
+      allOf:
+        - $ref: input.yaml#
+
+      properties:
+        gpios:
+          maxItems: 1
+
+        interrupts:
+          maxItems: 1
+
+        label:
+          description: Descriptive name of the key.
+
+        linux,code:
+          description: Key / Axis code to emit.
+          $ref: /schemas/types.yaml#definitions/uint32
+
+        linux,input-type:
+          description:
+            Specify event type this button/key generates. If not specified defaults to
+            <1> == EV_KEY.
+          allOf:
+            - $ref: /schemas/types.yaml#definitions/uint32
+          default: 1
+
+        linux,input-value:
+          description: |
+            If linux,input-type is EV_ABS or EV_REL then this
+            value is sent for events this button generates when pressed.
+            EV_ABS/EV_REL axis will generate an event with a value of 0
+            when all buttons with linux,input-type == type and
+            linux,code == axis are released. This value is interpreted
+            as a signed 32 bit value, e.g. to make a button generate a
+            value of -1 use:
+
+            linux,input-value = <0xffffffff>; /* -1 */
+
+          allOf:
+            - $ref: /schemas/types.yaml#definitions/uint32
+
+        debounce-interval:
+          description:
+            Debouncing interval time in milliseconds. If not specified defaults to 5.
+          allOf:
+            - $ref: /schemas/types.yaml#definitions/uint32
+          default: 5
+
+        wakeup-source:
+          description: Button can wake-up the system.
+
+        wakeup-event-action:
+          description: |
+            Specifies whether the key should wake the system when asserted, when
+            deasserted, or both. This property is only valid for keys that wake up the
+            system (e.g., when the "wakeup-source" property is also provided).
+
+            Supported values are defined in linux-event-codes.h:
+
+              EV_ACT_ANY        - both asserted and deasserted
+              EV_ACT_ASSERTED   - asserted
+              EV_ACT_DEASSERTED - deasserted
+          allOf:
+            - $ref: /schemas/types.yaml#definitions/uint32
+          enum: [ 0, 1, 2 ]
+
+        linux,can-disable:
+          description:
+            Indicates that button is connected to dedicated (not shared) interrupt
+            which can be disabled to suppress events from the button.
+          type: boolean
+
+        pinctrl-0:
+          maxItems: 1
+
+        pinctrl-names:
+          maxItems: 1
+
+      required:
+        - linux,code
+
+      anyOf:
+        - required:
+            - interrupts
+        - required:
+            - gpios
+
+      dependencies:
+        wakeup-event-action: [ wakeup-source ]
+
+      unevaluatedProperties: false
+
+if:
+  properties:
+    compatible:
+      const: gpio-keys-polled
+then:
+  properties:
+    poll-interval:
+      description:
+        Poll interval time in milliseconds
+      $ref: /schemas/types.yaml#definitions/uint32
+
+  required:
+    - poll-interval
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio-keys {
+        compatible = "gpio-keys";
+        autorepeat;
+
+        up {
+            label = "GPIO Key UP";
+            linux,code = <103>;
+            gpios = <&gpio1 0 1>;
+        };
+
+        down {
+            label = "GPIO Key DOWN";
+            linux,code = <108>;
+            interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+        };
+    };
+
+...
-- 
2.20.1


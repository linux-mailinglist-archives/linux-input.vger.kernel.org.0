Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C532605D8
	for <lists+linux-input@lfdr.de>; Mon,  7 Sep 2020 22:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgIGUky (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Sep 2020 16:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgIGUkx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Sep 2020 16:40:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DD2C061575;
        Mon,  7 Sep 2020 13:40:51 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 797D7290D19
Received: by jupiter.universe (Postfix, from userid 1000)
        id 05CA448010D; Mon,  7 Sep 2020 22:40:47 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Myl=C3=A8ne=20Josserand?= 
        <mylene.josserand@collabora.com>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 1/4] dt-bindings: input: Convert rotary-encoder bindings to schema
Date:   Mon,  7 Sep 2020 22:40:42 +0200
Message-Id: <20200907204045.95530-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907204045.95530-1-sebastian.reichel@collabora.com>
References: <20200907204045.95530-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert rotary-encoder bindings to YAML schema.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/input/rotary-encoder.txt         |  50 ---------
 .../bindings/input/rotary-encoder.yaml        | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.txt
 create mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.yaml

diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.txt b/Documentation/devicetree/bindings/input/rotary-encoder.txt
deleted file mode 100644
index a644408b33b8..000000000000
--- a/Documentation/devicetree/bindings/input/rotary-encoder.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Rotary encoder DT bindings
-
-Required properties:
-- gpios: a spec for at least two GPIOs to be used, most significant first
-
-Optional properties:
-- linux,axis: the input subsystem axis to map to this rotary encoder.
-  Defaults to 0 (ABS_X / REL_X)
-- rotary-encoder,steps: Number of steps in a full turnaround of the
-  encoder. Only relevant for absolute axis. Defaults to 24 which is a
-  typical value for such devices.
-- rotary-encoder,relative-axis: register a relative axis rather than an
-  absolute one. Relative axis will only generate +1/-1 events on the input
-  device, hence no steps need to be passed.
-- rotary-encoder,rollover: Automatic rollover when the rotary value becomes
-  greater than the specified steps or smaller than 0. For absolute axis only.
-- rotary-encoder,steps-per-period: Number of steps (stable states) per period.
-  The values have the following meaning:
-  1: Full-period mode (default)
-  2: Half-period mode
-  4: Quarter-period mode
-- wakeup-source: Boolean, rotary encoder can wake up the system.
-- rotary-encoder,encoding: String, the method used to encode steps.
-  Supported are "gray" (the default and more common) and "binary".
-
-Deprecated properties:
-- rotary-encoder,half-period: Makes the driver work on half-period mode.
-  This property is deprecated. Instead, a 'steps-per-period ' value should
-  be used, such as "rotary-encoder,steps-per-period = <2>".
-
-See Documentation/input/devices/rotary-encoder.rst for more information.
-
-Example:
-
-		rotary@0 {
-			compatible = "rotary-encoder";
-			gpios = <&gpio 19 1>, <&gpio 20 0>; /* GPIO19 is inverted */
-			linux,axis = <0>; /* REL_X */
-			rotary-encoder,encoding = "gray";
-			rotary-encoder,relative-axis;
-		};
-
-		rotary@1 {
-			compatible = "rotary-encoder";
-			gpios = <&gpio 21 0>, <&gpio 22 0>;
-			linux,axis = <1>; /* ABS_Y */
-			rotary-encoder,steps = <24>;
-			rotary-encoder,encoding = "binary";
-			rotary-encoder,rollover;
-		};
diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.yaml b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
new file mode 100644
index 000000000000..5b60ea86bd62
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/rotary-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Rotary Encoder
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+description:
+  See Documentation/input/devices/rotary-encoder.rst for more information.
+
+properties:
+  compatible:
+    const: rotary-encoder
+
+  gpios:
+    minItems: 2
+    description: GPIOs for the rotation signals, most significant first
+
+  linux,axis:
+    description:
+      The input subsystem axis to map to this rotary encoder.
+      Defaults to (ABS_X / REL_X).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+  rotary-encoder,rollover:
+    description:
+      Automatic rollover when the rotary value becomes greater than the
+      specified steps or smaller than 0. For absolute axis only.
+    type: boolean
+
+  rotary-encoder,steps-per-period:
+    description: The values have the following meaning
+      1 - Full-period mode
+      2 - Half-period mode
+      4 - Quarter-period mode
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4]
+    default: 1
+
+  wakeup-source:
+    description: Rotary encoder can wake up the system.
+    type: boolean
+
+  rotary-encoder,encoding:
+    description:
+      Method used to encode steps. Gray code is more common.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: ["gray", "binary"]
+    default: "gray"
+
+  rotary-encoder,half-period:
+    description:
+      Deprecated, use "rotary-encoder,steps-per-period = <2>" instead.
+    type: boolean
+    deprecated: True
+
+  rotary-encoder,steps:
+    description:
+      Number of steps in a full turnaround of the encoder. Only relevant
+      for absolute axis. Defaults to 24 which is a typical value for such
+      devices.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 24
+
+  rotary-encoder,relative-axis:
+    description:
+      register a relative axis rather than an absolute one. Relative axis
+      will only generate +1/-1 events on the input device, hence no steps
+      need to be passed.
+    type: boolean
+
+required:
+  - compatible
+  - gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/gpio/gpio.h"
+    #include "dt-bindings/input/input.h"
+    rotary-encoder0 {
+            compatible = "rotary-encoder";
+            gpios = <&gpio 19 GPIO_ACTIVE_LOW>, <&gpio 20 GPIO_ACTIVE_HIGH>;
+            linux,axis = <REL_X>;
+            rotary-encoder,encoding = "gray";
+            rotary-encoder,relative-axis;
+    };
+    rotary-encoder1 {
+            compatible = "rotary-encoder";
+            gpios = <&gpio 21 GPIO_ACTIVE_HIGH>, <&gpio 22 GPIO_ACTIVE_HIGH>;
+            linux,axis = <ABS_Y>;
+            rotary-encoder,encoding = "binary";
+            rotary-encoder,rollover;
+    };
-- 
2.28.0


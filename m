Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A4746F91E
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 03:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235977AbhLJCaf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Dec 2021 21:30:35 -0500
Received: from mail-0201.mail-europe.com ([51.77.79.158]:44544 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235928AbhLJCaf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Dec 2021 21:30:35 -0500
Date:   Fri, 10 Dec 2021 02:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1639103217;
        bh=oKftemVxgPQunBy+T7L2ItW0dv51KOOA8rbWWaGzHoE=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=pA2A2og8f6mPaXZHsXNWn4z6XscYDFGpKPnsXAfPCkoIRsWomtGVYWZuJcExydw97
         mfdvZgrfT4BhWb1y8yo45KnGeRZ3YezNCrrhOIbgpzxm4u7ovKjIiTaMbs3GTC3mFG
         cZaZoR4+D8ZI5drj4jcOfXkIuVeajZLcM9zGtgBg=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Jami Kettunen <jami.kettunen@somainline.org>,
        Joel Selvaraj <jo@jsfamily.in>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v4 1/6] dt-bindings: input: add Qualcomm SPMI haptics driver
Message-ID: <20211210022639.2779173-2-caleb@connolly.tech>
In-Reply-To: <20211210022639.2779173-1-caleb@connolly.tech>
References: <20211210022639.2779173-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add bindings for qcom PMIC SPMI haptics driver.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../bindings/input/qcom,spmi-haptics.yaml     | 123 ++++++++++++++++++
 include/dt-bindings/input/qcom,spmi-haptics.h |  32 +++++
 2 files changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,spmi-hapti=
cs.yaml
 create mode 100644 include/dt-bindings/input/qcom,spmi-haptics.h

diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml=
 b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
new file mode 100644
index 000000000000..d02a30c7554c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2020 Unisoc Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies Inc PMI8998 spmi haptics
+
+maintainers:
+  - Caleb Connolly <caleb@connolly.tech>
+
+description: |
+  Qualcomm SPMI haptics is a peripheral on some QTI PMICs. It supports lin=
ear resonant
+  actuators and eccentric rotating mass type haptics commonly found in mob=
ile devices.
+  It supports multiple sources of wave data such as an internal buffer, di=
rect play
+  (from kernel or userspace) as well as an audio output mode.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,pmi8998-haptics
+          - qcom,pmi8996-haptics
+          - qcom,pmi8941-haptics
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: short circuit interrupt
+      - description: play interrupt
+
+  interrupt-names:
+    items:
+      - const: short
+      - const: play
+
+  qcom,actuator-type:
+    description: |
+      The type of actuator attached to the hardware.
+      Allowed values are,
+        0 - HAP_TYPE_LRA
+        1 - HAP_TYPE_ERM
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1 ]
+    default: 0
+
+  qcom,wave-shape:
+    description: |
+      Selects the wave shape to use.
+      Allowed values are,
+        0 - HAP_WAVE_SINE
+        1 - HAP_WAVE_SQUARE
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1 ]
+    default: 0
+
+  qcom,play-mode:
+    description: |
+      Selects the play mode to use.
+      Allowed values are,
+        0 - HAP_PLAY_DIRECT
+        1 - HAP_PLAY_BUFFER
+        2 - HAP_PLAY_AUDIO
+        3 - HAP_PLAY_PWM
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1, 2, 3 ]
+    default: 2
+
+  qcom,wave-play-rate-us:
+    description: |
+      Wave sample durection in microseconds, 1/f where f
+      is the resonant frequency of the actuator.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 20475
+
+  qcom,brake-pattern:
+    minItems: 4
+    maxItems: 4
+    description: |
+      The brake pattern are the strengths of the pattern
+      used to brake the haptics. Allowed values are,
+        0 - 0V
+        1 - Vmax/4
+        2 - Vmax/2
+        3 - Vmax
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    default: [0x3, 0x3, 0x2, 0x1]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - qcom,wave-play-rate-us
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/interrupt-controller/irq.h>
+      #include <dt-bindings/input/qcom,spmi-haptics.h>
+
+      spmi {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        pmi8998_haptics: haptics@c000 {
+          compatible =3D "qcom,pmi8998-haptics";
+          reg =3D <0xc000>;
+
+          interrupts =3D <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
+                      <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;
+          interrupt-names =3D "short", "play";
+
+          qcom,wave-shape =3D <HAP_WAVE_SINE>;
+          qcom,play-mode =3D <HAP_PLAY_BUFFER>;
+          qcom,brake-pattern =3D <0x3 0x3 0x2 0x1>;
+
+          status =3D "disabled";
+        };
+      };
diff --git a/include/dt-bindings/input/qcom,spmi-haptics.h b/include/dt-bin=
dings/input/qcom,spmi-haptics.h
new file mode 100644
index 000000000000..14a7e7d1471e
--- /dev/null
+++ b/include/dt-bindings/input/qcom,spmi-haptics.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header provides constants for pmi8998 SPMI haptics options.
+ */
+
+#ifndef _DT_BINDINGS_QCOM_PMIC_SPMI_HAPTICS_
+#define _DT_BINDINGS_QCOM_PMIC_SPMI_HAPTICS_
+
+// Actuator types
+#define HAP_TYPE_LRA=09=090
+#define HAP_TYPE_ERM=09=091
+
+// LRA Wave type
+#define HAP_WAVE_SINE=09=090
+#define HAP_WAVE_SQUARE=09=091
+
+// Play modes
+#define HAP_PLAY_DIRECT=09=090
+#define HAP_PLAY_BUFFER=09=091
+#define HAP_PLAY_AUDIO=09=092
+#define HAP_PLAY_PWM=09=093
+
+#define HAP_PLAY_MAX=09=09HAP_PLAY_PWM
+
+// Auto resonance type
+#define HAP_AUTO_RES_NONE=090
+#define HAP_AUTO_RES_ZXD=091
+#define HAP_AUTO_RES_QWD=092
+#define HAP_AUTO_RES_MAX_QWD=093
+#define HAP_AUTO_RES_ZXD_EOP=094
+
+#endif /* _DT_BINDINGS_QCOM_PMIC_SPMI_HAPTICS_ */
--
2.34.1



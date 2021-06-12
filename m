Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBE03A50A3
	for <lists+linux-input@lfdr.de>; Sat, 12 Jun 2021 22:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhFLU4j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 12 Jun 2021 16:56:39 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:52157 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231435AbhFLU4j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 12 Jun 2021 16:56:39 -0400
Date:   Sat, 12 Jun 2021 20:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1623531274;
        bh=Jy44aNgD/OO4tVcKoheXKowG67wadKysL7hQKyUpMn4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=lfUMQSCSPbCLDEAQWNS2+XDQmylSeUTFMtDESadcGVAOmOOsslEzZam8zVj/givb7
         gY7P/Stfcp0/ietI3Hl7Fyj/jB/7mDtsslsrcWjlD8Tpa/i+Or//yAITG0l12HIewR
         Xi/+vFC9F+O2n3uO+nj6F+wJU+bLmAAss4KHplxo=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 1/4] dt-bindings: input: add Qualcomm QPNP haptics driver
Message-ID: <20210612205405.1233588-2-caleb@connolly.tech>
In-Reply-To: <20210612205405.1233588-1-caleb@connolly.tech>
References: <20210612205405.1233588-1-caleb@connolly.tech>
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

Add bindings for pmi8998 qpnp haptics driver.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../bindings/input/qcom,qpnp-haptics.yaml     | 123 ++++++++++++++++++
 include/dt-bindings/input/qcom,qpnp-haptics.h |  31 +++++
 2 files changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,qpnp-hapti=
cs.yaml
 create mode 100644 include/dt-bindings/input/qcom,qpnp-haptics.h

diff --git a/Documentation/devicetree/bindings/input/qcom,qpnp-haptics.yaml=
 b/Documentation/devicetree/bindings/input/qcom,qpnp-haptics.yaml
new file mode 100644
index 000000000000..81dd8d6321f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,qpnp-haptics.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2020 Unisoc Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,qpnp-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies Inc PMI8998 QPNP haptics
+
+maintainers:
+  - Caleb Connolly <caleb@connolly.tech>
+
+description: |
+  QPNP (Qualcomm Technologies, Inc. Plug N Play) Haptics is a peripheral o=
n some
+  QTI PMICs. It supports linear resonant actuators commonly found in mobil=
e devices.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qpnp-haptics
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    items:
+      - description: short circuit interrupt
+      - description: play interrupt
+
+  interrupt-names:
+    minItems: 2
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
+    #include <dt-bindings/spmi/spmi.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/qcom,qpnp-haptics.h>
+    pmi8998_lsid1: pmic@3 {
+      compatible =3D "qcom,pmi8998", "qcom,spmi-pmic";
+      reg =3D <0x3 SPMI_USID>;
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      qpnp_haptics: qcom,haptics@c000 {
+        compatible =3D "qcom,qpnp-haptics";
+        reg =3D <0xc000 0x100>;
+
+        interrupts =3D <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
+              <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;
+        interrupt-names =3D "short", "play";
+
+        qcom,actuator-type =3D <HAP_TYPE_LRA>;
+        qcom,wave-shape =3D <HAP_WAVE_SINE>;
+        qcom,play-mode =3D <HAP_PLAY_BUFFER>;
+        qcom,brake-pattern =3D <0x3 0x3 0x2 0x1>;
+
+        qcom,wave-play-rate-us =3D <4255>;
+      };
+    };
diff --git a/include/dt-bindings/input/qcom,qpnp-haptics.h b/include/dt-bin=
dings/input/qcom,qpnp-haptics.h
new file mode 100644
index 000000000000..bfbec041484c
--- /dev/null
+++ b/include/dt-bindings/input/qcom,qpnp-haptics.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header provides constants for pmi8998 qpnp haptics options.
+ */
+
+#ifndef _DT_BINDINGS_QCOM_PMIC_QPNP_HAPTICS_
+#define _DT_BINDINGS_QCOM_PMIC_QPNP_HAPTICS_
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
+#define HAP_AUTO_RES_NONE=090
+#define HAP_AUTO_RES_ZXD=091
+#define HAP_AUTO_RES_QWD=092
+#define HAP_AUTO_RES_MAX_QWD=093
+#define HAP_AUTO_RES_ZXD_EOP=094
+
+#endif /* _DT_BINDINGS_QCOM_PMIC_QPNP_HAPTICS_ */
--
2.31.1



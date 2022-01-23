Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2391A4973A2
	for <lists+linux-input@lfdr.de>; Sun, 23 Jan 2022 18:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239273AbiAWRhc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jan 2022 12:37:32 -0500
Received: from mail-4022.proton.ch ([185.70.40.22]:54117 "EHLO
        mail-4022.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239269AbiAWRhb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jan 2022 12:37:31 -0500
Date:   Sun, 23 Jan 2022 17:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1642959449;
        bh=RHM16+MmceCNT6uhKBo2gtAGjdHH8oLW9fjQXzk/4OU=;
        h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
         From:To:Cc;
        b=cxB4KY5DJAAwKNBDIAvSzd5kzvDGoWpJjFA3SM5JpQk3rnRzF3B68WXywt3E9Zwfk
         W2Vyhnq2L6lCW1DEQw/VnG0Xty5y50bwxkfACsZyFjGb3w0w8lXjLLE7l1r1gVtbRs
         wb63Fd1PB9MD+jEcirvUE60dGHFT181MPAF3zlYE=
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Caleb Connolly <caleb@connolly.tech>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Alexander Martinz <amartinz@shiftphones.com>
From:   Caleb Connolly <caleb@connolly.tech>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 1/6] dt-bindings: input: touchscreen: add bindings for focaltech,fts
Message-ID: <20220123173650.290349-2-caleb@connolly.tech>
In-Reply-To: <20220123173650.290349-1-caleb@connolly.tech>
References: <20220123173650.290349-1-caleb@connolly.tech>
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

Add devicetree bindings for the Focaltech FTS touchscreen drivers.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../input/touchscreen/focaltech,fts.yaml      | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/foc=
altech,fts.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/focaltech,=
fts.yaml b/Documentation/devicetree/bindings/input/touchscreen/focaltech,ft=
s.yaml
new file mode 100644
index 000000000000..bb25a4f8ad71
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yam=
l
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/focaltech,fts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Focaltech FTS I2C Touchscreen Controller
+
+maintainers:
+  - Caleb Connolly <caleb@connolly.tech>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - focaltech,fts5452
+      - focaltech,fts8719
+  reg:
+    const: 0x38
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  wakeup-source:
+    type: boolean
+    description: touchscreen can be used as a wakeup source.
+
+  focaltech,max-touch-number:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: max number of fingers supported
+    minimum: 2
+    maximum: 10
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - focaltech,max-touch-number
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    &i2c5 {
+      status=3D"okay";
+
+      touchscreen: focaltech@38 {
+        compatible =3D "focaltech,fts8719";
+        reg =3D <0x38>;
+        wakeup-source;
+        interrupt-parent =3D <&tlmm>;
+        interrupts =3D <125 0x2>;
+        vdd-supply =3D <&vreg_l28a_3p0>;
+        vcc-i2c-supply =3D <&vreg_l14a_1p88>;
+
+        pinctrl-names =3D "default", "suspend";
+        pinctrl-0 =3D <&ts_int_active &ts_reset_active>;
+        pinctrl-1 =3D <&ts_int_suspend &ts_reset_suspend>;
+
+        reset-gpio =3D <&tlmm 99 GPIO_ACTIVE_HIGH>;
+        irq-gpio =3D <&tlmm 125 GPIO_TRANSITORY>;
+        touchscreen-size-x =3D <1080>;
+        touchscreen-size-y =3D <2160>;
+        focaltech,max-touch-number =3D <5>;
+      };
+    };
--
2.34.1



Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C353FE072
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 18:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344823AbhIAQyw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 12:54:52 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:44388 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344739AbhIAQyt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 12:54:49 -0400
Date:   Wed, 01 Sep 2021 16:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630515191;
        bh=erTBhCQcWPYIoF10Mkjb8iJl9JUyLrz282d9n8j3Vyg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=eAWXuQCNpOUq1NC0dIQgK1opuXb/XUKExJ67XEPeeA6VSmXFTMI8bVH7+x4mthar+
         zMNjNplcK1D02sf9gtqgzPJaDDRYIMAq9bXarHSLB+WQhwkCaGnC/UqxuGdlQK/Hgv
         CePqm4h6NjcxitXLnMrO27PcyJLhbF9ErLmr95u8=
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh@kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v3 2/2] dt-bindings: input: Add binding for cypress-sf
Message-ID: <20210901165231.236728-3-y.oudjana@protonmail.com>
In-Reply-To: <20210901165231.236728-1-y.oudjana@protonmail.com>
References: <20210901165231.236728-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a device tree binding for Cypress StreetFighter.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1:
 - Changed version variables in probe to int to allow storing error codes.
 .../devicetree/bindings/input/cypress-sf.yaml | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cypress-sf.yaml

diff --git a/Documentation/devicetree/bindings/input/cypress-sf.yaml b/Docu=
mentation/devicetree/bindings/input/cypress-sf.yaml
new file mode 100644
index 000000000000..14689daf6567
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cypress-sf.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/cypress-sf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress StreetFighter touchkey controller
+
+maintainers:
+  - Yassine Oudjana <y.oudjana@protonmail.com>
+
+allOf:
+  - $ref: input.yaml#
+
+properties:
+  compatible:
+    const: cypress,sf3155
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  avdd-supply:
+    description: Regulator for AVDD analog voltage
+
+  vdd-supply:
+    description: Regulator for VDD digital voltage
+
+  linux,keycodes:
+    minItems: 1
+    maxItems: 8
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        touchkey@28 {
+                compatible =3D "cypress,sf3155";
+                reg =3D <0x28>;
+                interrupt-parent =3D <&msmgpio>;
+                interrupts =3D <77 IRQ_TYPE_EDGE_FALLING>;
+                avdd-supply =3D <&vreg_l6a_1p8>;
+                vdd-supply =3D <&vdd_3v2_tp>;
+                linux,keycodes =3D <KEY_BACK KEY_MENU>;
+        };
+    };
--=20
2.33.0



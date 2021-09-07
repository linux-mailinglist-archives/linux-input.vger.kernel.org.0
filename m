Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106BE402DE3
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 19:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344755AbhIGRpc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 13:45:32 -0400
Received: from mail-4319.protonmail.ch ([185.70.43.19]:22951 "EHLO
        mail-4319.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344965AbhIGRpa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 13:45:30 -0400
Date:   Tue, 07 Sep 2021 17:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631036662;
        bh=h8C0go9f31RLkdNZSTsBdEBZxHdJB8HZl4c+tiSJyx8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=HXhkoTczo+Sjo5/BwvqagvTIASuYM5fcQm8KngVq51U2vp65JgrrF3MXLjQRlc3AM
         3BQNoTAm5zp23kR7IXl1E5BT7Y1NLJ0xlSCjkaVfWGmfufi3FT8Uup8DNccUf6m2v5
         TpSMDJYeUHA7OHgtrW0sfrf4dug+6iO40khL1zEk=
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh@kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v4 2/2] dt-bindings: input: Add binding for cypress-sf
Message-ID: <20210907174341.422013-3-y.oudjana@protonmail.com>
In-Reply-To: <20210907174341.422013-1-y.oudjana@protonmail.com>
References: <20210907174341.422013-1-y.oudjana@protonmail.com>
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
Changes since v3:
 - Add MAINTAINERS entry.
 - Dual-license DT binding.
Changes since v1:
 - Fixed some issues in dt binding.

 .../devicetree/bindings/input/cypress-sf.yaml | 61 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cypress-sf.yaml

diff --git a/Documentation/devicetree/bindings/input/cypress-sf.yaml b/Docu=
mentation/devicetree/bindings/input/cypress-sf.yaml
new file mode 100644
index 000000000000..c0b051466272
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cypress-sf.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 0e6ce2b71829..8cab66ce8606 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5127,6 +5127,7 @@ CYPRESS STREETFIGHTER TOUCHKEYS DRIVER
 M:=09Yassine Oudjana <y.oudjana@protonmail.com>
 L:=09linux-input@vger.kernel.org
 S:=09Maintained
+F:=09Documentation/devicetree/bindings/input/cypress-sf.yaml
 F:=09drivers/input/keyboard/cypress-sf.c
=20
 CYTTSP TOUCHSCREEN DRIVER
--=20
2.33.0



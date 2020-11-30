Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F692C88B0
	for <lists+linux-input@lfdr.de>; Mon, 30 Nov 2020 16:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgK3P4a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Nov 2020 10:56:30 -0500
Received: from mail.v3.sk ([167.172.186.51]:47282 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727758AbgK3P43 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Nov 2020 10:56:29 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 72B90E0700;
        Mon, 30 Nov 2020 15:52:52 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id R8ZYbfgjDaqP; Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 928BDE06E2;
        Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id LHT_7Ub5_YDr; Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 5C8FFDF357;
        Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: input: Add Dell Wyse 3020 Power Button binding
Date:   Mon, 30 Nov 2020 16:55:36 +0100
Message-Id: <20201130155537.1665091-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130155537.1665091-1-lkundrak@v3.sk>
References: <20201130155537.1665091-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add binding document for the Dell Wyse 3020 a.k.a. "Ariel" Power Button.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes since v1:
- Collect Rob's R-b

 .../bindings/input/ariel-pwrbutton.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/ariel-pwrbutt=
on.yaml

diff --git a/Documentation/devicetree/bindings/input/ariel-pwrbutton.yaml=
 b/Documentation/devicetree/bindings/input/ariel-pwrbutton.yaml
new file mode 100644
index 0000000000000..e022d36c48d23
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ariel-pwrbutton.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ariel-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dell Wyse 3020 a.k.a. "Ariel" Power Button
+
+maintainers:
+  - Lubomir Rintel <lkundrak@v3.sk>
+
+description: |
+  The ENE Embedded Controller on the Ariel board has an interface to the
+  SPI bus that is capable of sending keyboard and mouse data. A single
+  power button is attached to it. This binding describes this
+  configuration.
+
+allOf:
+  - $ref: input.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: dell,wyse-ariel-ec-input
+      - const: ene,kb3930-input
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        power-button@0 {
+            compatible =3D "dell,wyse-ariel-ec-input", "ene,kb3930-input=
";
+            reg =3D <0>;
+            interrupt-parent =3D <&gpio>;
+            interrupts =3D <60 IRQ_TYPE_EDGE_RISING>;
+            spi-max-frequency =3D <33000000>;
+        };
+    };
--=20
2.28.0


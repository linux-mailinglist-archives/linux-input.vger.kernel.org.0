Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C01737278A
	for <lists+linux-input@lfdr.de>; Tue,  4 May 2021 10:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhEDIt2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 May 2021 04:49:28 -0400
Received: from mail-41103.protonmail.ch ([185.70.41.103]:24150 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhEDIt2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 May 2021 04:49:28 -0400
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4FZD5X56DFz4wy52
        for <linux-input@vger.kernel.org>; Tue,  4 May 2021 08:48:32 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Vuf1T/J5"
Date:   Tue, 04 May 2021 08:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1620118109;
        bh=hHNQmF2M5QL+db+MdIn83ZXnlBrsdZ0yLisoXSk5p4M=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Vuf1T/J56yZ0M1wLphGmqMmnxLZLvNb74Tta2dKb3sgpyXogp3kSkqdYKz/usBQWZ
         Mb7yo3VcZS+v+7DTPQAn8q3KmcOLA7DeQOjFcv1v4XHSQXar7SapKmOt54JpImRmZx
         eb++HtfvTp6c9F1PWVthXC9ryfRGLm0f3jvfdoNk=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>,
        "~postmarketos/upstreaming@lists.sr.ht" 
        <~postmarketos/upstreaming@lists.sr.ht>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 2/2] dt-bindings: input: Add binding for cypress-sf
Message-ID: <_T7bJripXfkFGJcfJVL7E_n7RsT5UQzhvxauebspa-aGiMZkX3jk1yHiWeoqHOYQkd8UZgX2TT964OFeEYqtCMh-ZlPiK5kpb3AJqhZFKSs=@protonmail.com>
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
---
 .../devicetree/bindings/input/cypress-sf.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cypress-sf.yaml

diff --git a/Documentation/devicetree/bindings/input/cypress-sf.yaml b/Docu=
mentation/devicetree/bindings/input/cypress-sf.yaml
new file mode 100644
index 000000000000..3de13490876f
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cypress-sf.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/cypress-sf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress StreetFighter touchkey controller
+
+allOf:
+  - $ref: input.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cypress,sf3155
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
--
2.31.1


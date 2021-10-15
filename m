Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3962942EA2F
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 09:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhJOHcP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 03:32:15 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:59401 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229693AbhJOHcP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 03:32:15 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id CE9455C01E0;
        Fri, 15 Oct 2021 03:30:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 15 Oct 2021 03:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=m0oIlEvFTVVx+KjWs66YsdbS/L
        YUR5qqOyiotE1+91c=; b=gP7F7n3q/IAL/arnwW2/o+alrEXnW+qDP12g7fKGoO
        69c34ZQWEK3vpWWYGWXqSTLKw/L2ajleK3ETd5QimAMjyfLgFxvSd2VW2A9ro7EC
        TPFSsTj92OxkXpUyk4LdWwvr8dpFtfQiTvc4kxsT4g3rv0Pp+05yqV/Do40bAxa3
        2eS9gCbyBqHZpKWt/z45kb+ATea+FexlcFat+KLzqjD40qUti1KsHHcK1xJBUc2d
        hFNtcOTmaglH8xmpCc6eFtMN9kKwQg1qqIrlr9XnO1VXN9SpHK5AENPGoJjGUAc2
        b2UyRhQ+adkU0zv55Sfa1I6AFzQUFh3Ki7koCsRjeucA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=m0oIlEvFTVVx+KjWs
        66YsdbS/LYUR5qqOyiotE1+91c=; b=L7H8jnhOYuhEgVjDthRILwWFyaknn2+n8
        V3GTsj1PWfJ9hZvkCcsZIS76eDUbliy/u9VLvKvYI54z2g3a1zyCj6DbCoRO22aX
        v3S/UbrMZ+8WpjjXVo809fgZEM+v/9QFEuBsJQTze/Zs94ViWdFlBxE0G5p7xAl/
        JwhNwNZh89Ce6kSOEm+Hsg6bhsOfnedt0TMysvLGY5S52pTAeLBRoPT5FIjz//E8
        bMYPm1bvQlCX2wU2tVqam6F9oJLY6r89Szag7ILIGCQWSD5YURY+S4TyJl8Yv4jg
        CW5BnItyN/f6/Pnl4StYhJ3RpHJcbh8dc8SD0TIDCJpGIRDqW84HA==
X-ME-Sender: <xms:AC5pYa365Pt59d7rWW9PTSX-tUJV-I5sjamB56DAQ0ZprtYKMPWFQg>
    <xme:AC5pYdFFKF8JBjaWCs7nz6GX5b3vZqs9GBxHZiYWIlV1yDNC2c6r1y_x5j-CiGMfo
    txBWDyIqlAkV0nS29Y>
X-ME-Received: <xmr:AC5pYS7Y60RXBC2PvD1WNshKiccKnpcOVH6wWmoyaP7vQxxdx7HHodVPvTJhIbhgwPyztbVP61xl3mSh4SukAZVcKisQ1P-KFiLKyff_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddufedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffo
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhephffhhfevtddthefg
    ieeigeffudehkefgtdeufedvtdduheduieekvddvfedvkeetnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AC5pYb3L76_AGWmS_Yekecutgw6JsTqXGNcOHxDLZW4664z9s35xdA>
    <xmx:AC5pYdFRpU4bkthMu2bLgOFn5a64tqRYIHdP73CJwdggUt1GjauvMA>
    <xmx:AC5pYU84eC-4QG_9oONFUILBR4vdF_mcrFOApk0G9D5wyELx1J2fyQ>
    <xmx:AC5pYRgw3AIPAOiRyziYzdw0wbl5BgPxHHGDX22E0wlQLqK03q6ZHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 03:30:08 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH v3] dt-bindings: input: Convert Silead GSL1680 binding to a schema
Date:   Fri, 15 Oct 2021 09:30:06 +0200
Message-Id: <20211015073006.8939-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Silead GSL1680 Touchscreen Controller is supported by Linux thanks
to its device tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v2:
  - Fixed firmware-name property name

Changes from v1:
  - Added maximum to the number of fingers
---
 .../input/touchscreen/silead,gsl1680.yaml     | 91 +++++++++++++++++++
 .../input/touchscreen/silead_gsl1680.txt      | 44 ---------
 2 files changed, 91 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
new file mode 100644
index 000000000000..eec6f7f6f0a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/silead,gsl1680.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silead GSL1680 Touchscreen Controller Device Tree Bindings
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - silead,gsl1680
+      - silead,gsl1688
+      - silead,gsl3670
+      - silead,gsl3675
+      - silead,gsl3692
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-gpios:
+    maxItems: 1
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: >
+      File basename for board specific firmware
+
+  silead,max-fingers:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 5
+    description: >
+      Maximum number of fingers the touchscreen can detect
+
+  silead,home-button:
+    type: boolean
+    description: >
+      Does the device have a capacitive home-button build into the
+      touchscreen?
+
+  avdd-supply:
+    description: >
+      Regulator phandle for controller AVDD
+
+  vddio-supply:
+    description: >
+      Regulator phandle for controller VDDIO
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-gpios
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@40 {
+            compatible = "silead,gsl1680";
+            reg = <0x40>;
+            interrupt-parent = <&pio>;
+            interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>;
+            power-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>;
+            touchscreen-size-x = <480>;
+            touchscreen-size-y = <800>;
+            touchscreen-inverted-x;
+            touchscreen-swapped-x-y;
+            silead,max-fingers = <5>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt b/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
deleted file mode 100644
index d67e558e5ab5..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-* GSL 1680 touchscreen controller
-
-Required properties:
-- compatible		  : Must be one of the following, depending on the model:
-			    "silead,gsl1680"
-			    "silead,gsl1688"
-			    "silead,gsl3670"
-			    "silead,gsl3675"
-			    "silead,gsl3692"
-- reg			  : I2C slave address of the chip (0x40)
-- interrupts		  : interrupt specification for the gsl1680 interrupt
-- power-gpios		  : Specification for the pin connected to the gsl1680's
-			    shutdown input. This needs to be driven high to take the
-			    gsl1680 out of its low power state
-- touchscreen-size-x	  : See touchscreen.txt
-- touchscreen-size-y	  : See touchscreen.txt
-
-Optional properties:
-- firmware-name		  : File basename (string) for board specific firmware
-- touchscreen-inverted-x  : See touchscreen.txt
-- touchscreen-inverted-y  : See touchscreen.txt
-- touchscreen-swapped-x-y : See touchscreen.txt
-- silead,max-fingers	  : maximum number of fingers the touchscreen can detect
-- silead,home-button	  : Boolean, set to true on devices which have a
-			    capacitive home-button build into the touchscreen
-- vddio-supply		  : regulator phandle for controller VDDIO
-- avdd-supply		  : regulator phandle for controller AVDD
-
-Example:
-
-i2c@00000000 {
-	gsl1680: touchscreen@40 {
-		compatible = "silead,gsl1680";
-		reg = <0x40>;
-		interrupt-parent = <&pio>;
-		interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>;
-		power-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>;
-		touchscreen-size-x = <480>;
-		touchscreen-size-y = <800>;
-		touchscreen-inverted-x;
-		touchscreen-swapped-x-y;
-		silead,max-fingers = <5>;
-	};
-};
-- 
2.31.1


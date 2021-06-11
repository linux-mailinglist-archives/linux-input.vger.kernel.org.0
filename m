Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91783A4368
	for <lists+linux-input@lfdr.de>; Fri, 11 Jun 2021 15:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhFKN4a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Jun 2021 09:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbhFKN4a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Jun 2021 09:56:30 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186FBC0617AF
        for <linux-input@vger.kernel.org>; Fri, 11 Jun 2021 06:54:31 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
        by baptiste.telenet-ops.be with bizsmtp
        id FpuV2500825eH3q01puVxq; Fri, 11 Jun 2021 15:54:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrhcC-00FhDG-Ns; Fri, 11 Jun 2021 15:54:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrhcC-00CsQD-2l; Fri, 11 Jun 2021 15:54:28 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joe Hung <joe_hung@ilitek.com>, Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: input: touchscreen: ilitek_ts_i2c: Absorb ili2xxx bindings
Date:   Fri, 11 Jun 2021 15:54:27 +0200
Message-Id: <c381ee2526074e02b6058c489f85cfdaee582713.1623419587.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While Linux uses a different driver, the Ilitek
ILI210x/ILI2117/ILI2120/ILI251x touchscreen controller Device Tree
binding documentation is very similar.

  - Drop the fixed reg value, as some controllers use a different
    address,
  - Make reset-gpios optional, as it is not always wired.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/input/ilitek,ili2xxx.txt         | 27 -------------------
 .../input/touchscreen/ilitek_ts_i2c.yaml      |  7 +++--
 2 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt

diff --git a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
deleted file mode 100644
index cdcaa3f52d253670..0000000000000000
--- a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Ilitek ILI210x/ILI2117/ILI2120/ILI251x touchscreen controller
-
-Required properties:
-- compatible:
-    ilitek,ili210x for ILI210x
-    ilitek,ili2117 for ILI2117
-    ilitek,ili2120 for ILI2120
-    ilitek,ili251x for ILI251x
-
-- reg: The I2C address of the device
-
-- interrupts: The sink for the touchscreen's IRQ output
-    See ../interrupt-controller/interrupts.txt
-
-Optional properties for main touchpad device:
-
-- reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
-
-Example:
-
-	touchscreen@41 {
-		compatible = "ilitek,ili251x";
-		reg = <0x41>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
index a190e7baac3162a3..9f732899975683a8 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
@@ -15,6 +15,9 @@ allOf:
 properties:
   compatible:
     enum:
+      - ilitek,ili210x
+      - ilitek,ili2117
+      - ilitek,ili2120
       - ilitek,ili2130
       - ilitek,ili2131
       - ilitek,ili2132
@@ -22,11 +25,12 @@ properties:
       - ilitek,ili2322
       - ilitek,ili2323
       - ilitek,ili2326
+      - ilitek,ili251x
       - ilitek,ili2520
       - ilitek,ili2521
 
   reg:
-    const: 0x41
+    maxItems: 1
 
   interrupts:
     maxItems: 1
@@ -50,7 +54,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - reset-gpios
 
 examples:
   - |
-- 
2.25.1


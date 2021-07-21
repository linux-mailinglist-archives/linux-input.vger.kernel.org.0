Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802503D1094
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 16:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238916AbhGUNY3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 09:24:29 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44593 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232419AbhGUNY2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 09:24:28 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D361B5C0222;
        Wed, 21 Jul 2021 10:05:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 21 Jul 2021 10:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=zGOKOFDw1JXV9
        /dgDgJu8E/Cd+ZKzd4O8tO2BOgbyUc=; b=c7HwiyAVOjipPrtUVcHz3j8f+hayn
        clh0khPsy+04MkMsKyBU6sh9f/I15S4xIE8/PrYxNE2IDnrPqtqiht+pYfm/Tq6R
        WHYNfQOl+Whj72OQ9XYnme4pTuuU36aOguhA5dx9iuFud6wVR0afTB8O8FBKw18h
        JlTblCQrByYUVFn7f0pn3UnweSPkzYiWY9GbElhpcxMa3+XGFsoir5oqJki9+ZJk
        ZfGr/Qy5EL0cVdsk2ttdF9WIr4zlMP1byR+ntgBYuwu7EuVqdbJDJqP76uPgNDJi
        5xumcdwNBPM7LdHZSBC35CkEOV3ICsrERQCkS0RTX2Gr6cbWHYfjJuRFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=zGOKOFDw1JXV9/dgDgJu8E/Cd+ZKzd4O8tO2BOgbyUc=; b=Zr0dSfbg
        /7UamZ1S2Nz2yY0g6jS6skhQLQJsNni8awnK5j9wZM1D3d3orMBgubnO9muzqspM
        J0/g/8Tyd2E03AQQu/6ioXji37OLbnRzLwoIEcehVICfLG1JOKtcz8EyvOxd4i85
        JWDtuhmZ+ndwU8BNVUx9SS8GjvuTw79FZmeQF9LnmKzw4mM+4JjzWLjaemX9sFWd
        umrwtb8NmBaZh6deRkXwSQvNAU3LfK9qjEqwsmrrI4r6fScNzJvLZT8orYdiE/6j
        4J5F3Hn+Kl7WW8amxk4FfJJPD6FzJIGS9DXAYixEVpJXimt16AxlDfL6rVolVCAI
        WSfgu0QTkkJZ8Q==
X-ME-Sender: <xms:kCn4YJ9Sx4oqKvmVP7ZNOF5k4OoeAbxah2yID9ZCqZb39LU3InQewg>
    <xme:kCn4YNsjo38kEHe3oMnMXzlnxvqbARBu2-oOKQwRZZ_9lGEXUfXEyxu7e1V-Z6wfF
    SV7Z-L4ryI5v-DCjJs>
X-ME-Received: <xmr:kCn4YHBe8dnlsGDTWaThjXBedJVLgI-B3_zUcjHmx1GWBgNVm4X01tOImPM2vgPJ8QXodJ88NYO54Uwhbyx5LtGtf0ldR54TjHEH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
    gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kCn4YNdBwRpLCSiQRgf_qv5HgyHUhD8OIqyxu9I4y_yjIV2L3HFqiw>
    <xmx:kCn4YOP252Wd9UtbNt__wp_VHUotpnM3zUSW4O2qsde-KKqivomZNA>
    <xmx:kCn4YPmsvr8LHyAR8nM4TVw_gEMsKtqaywHyw87oHgdRc93K98S4eA>
    <xmx:kCn4YPjCdDuNZphZjk-Cf-BzflD-QLlOZUp_T8rwUYxd4zeKTAMosA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:04 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 17/54] dt-bindings: input: Convert Pixcir Touchscreen binding to a schema
Date:   Wed, 21 Jul 2021 16:03:47 +0200
Message-Id: <20210721140424.725744-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Pixcir Touchscreen Controller is supported by Linux thanks to
its device tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../input/touchscreen/pixcir,pixcir_ts.yaml   | 68 +++++++++++++++++++
 .../input/touchscreen/pixcir_i2c_ts.txt       | 31 ---------
 2 files changed, 68 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/pixcir,pixcir_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/pixcir_i2c_ts.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/pixcir,pixcir_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/pixcir,pixcir_ts.yaml
new file mode 100644
index 000000000000..f9998edbff70
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/pixcir,pixcir_ts.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/pixcir,pixcir_ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pixcir Touchscreen Controller Device Tree Bindings
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
+      - pixcir,pixcir_ts
+      - pixcir,pixcir_tangoc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  attb-gpio:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  enable-gpios:
+    maxItems: 1
+
+  wake-gpios:
+    maxItems: 1
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - attb-gpio
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
+        touchscreen@5c {
+            compatible = "pixcir,pixcir_ts";
+            reg = <0x5c>;
+            interrupts = <2 0>;
+            attb-gpio = <&gpf 2 0 2>;
+            touchscreen-size-x = <800>;
+            touchscreen-size-y = <600>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/pixcir_i2c_ts.txt b/Documentation/devicetree/bindings/input/touchscreen/pixcir_i2c_ts.txt
deleted file mode 100644
index 697a3e7831e7..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/pixcir_i2c_ts.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* Pixcir I2C touchscreen controllers
-
-Required properties:
-- compatible: must be "pixcir,pixcir_ts" or "pixcir,pixcir_tangoc"
-- reg: I2C address of the chip
-- interrupts: interrupt to which the chip is connected
-- attb-gpio: GPIO connected to the ATTB line of the chip
-- touchscreen-size-x: horizontal resolution of touchscreen (in pixels)
-- touchscreen-size-y: vertical resolution of touchscreen (in pixels)
-
-Optional properties:
-- reset-gpios: GPIO connected to the RESET line of the chip
-- enable-gpios: GPIO connected to the ENABLE line of the chip
-- wake-gpios: GPIO connected to the WAKE line of the chip
-
-Example:
-
-	i2c@00000000 {
-		/* ... */
-
-		pixcir_ts@5c {
-			compatible = "pixcir,pixcir_ts";
-			reg = <0x5c>;
-			interrupts = <2 0>;
-			attb-gpio = <&gpf 2 0 2>;
-			touchscreen-size-x = <800>;
-			touchscreen-size-y = <600>;
-		};
-
-		/* ... */
-	};
-- 
2.31.1


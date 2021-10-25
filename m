Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99AF43950F
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 13:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbhJYLpI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 07:45:08 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:48621 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233216AbhJYLpD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 07:45:03 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2939C580502;
        Mon, 25 Oct 2021 07:42:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 25 Oct 2021 07:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
        gne5oT/hN/0Mn0cGEHutOCyZ5LH0dANo6RcAsHwYYiw=; b=WJiLCHR5y6ssqYAK
        vKfaG+dRo56ukzFjl9auO8CwwvQubxnpB6dPbjxtmkDjxTVGgGvZz/Q29mNBWWcF
        thWKz1rHhHXb8oaz/KT1P+46ymqBmhLYf/qHbUK42vplQ9k2jWM0pX6nUii/XQXp
        K50nN8qP+8N8cffJJHtvH5HymK1AtYRGl+7qh1wIp68Cwv3wIgkDsLygXcTa9v6J
        CePozvRbZI6AouQ+vfHJtK0dUcNbqfx5sS/unIUsfUvyik+WVKO6RvnRdxapET5p
        fwqjO4FfISPfuKFC05gklcC/7y+IKsWf4G3W2TYFtVkxTYqE8CfpI//hKUu7PSKR
        +8wnhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=gne5oT/hN/0Mn0cGEHutOCyZ5LH0dANo6RcAsHwYY
        iw=; b=h6JuTrdwCkb44hhAd1wPI7rQO9ohAo+I9rzsE94acesOiP1euUnOfoviG
        aZosJpnjgLmNYLs5BguoywTmvp5kqlxhAF7XS+/UnUUV8LVC1fD01W92e/EOcZLC
        v1x+TjMmLLmVw+dJ9ubJjaKu31ehglIOSqeZhJ90Xb3LaWlbigd8JR+BVi/8p6T8
        WKA7pz7SeSvNPXZ+MFJN0ffOADRBApe2Ld22IQIjXwNFeGmi/D6N50nu4ZaREAbt
        OygEyVHG7Qe0uX3jo7AczTAvwI9aa8IdBjqUAVLERn2LeKR9PHM88TVLw4QL+wuS
        uuMo+RV7k1+BUMDRN3wgAvtkYKgtg==
X-ME-Sender: <xms:MJh2YbE3IcU2F9jTCmxyj4232Wy8v6kdudeMQAxGcXKfNZ7NhXqdOw>
    <xme:MJh2YYXYT-S73ztpxRpIxkdJ3olb2AJJ1Vg5_TcwcXRV71O98Ve7rBu6O0eB8VROc
    HBSjbsAJsh9FA01O18>
X-ME-Received: <xmr:MJh2YdIGg9qhGYVLHUlXXkKdvOYUVWB9PoXzOJUvO0OgwCFmC5_JRouJ1bvItveoSBA_4wcy6f71>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhggtgfgsehtke
    ertdertdejnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishht
    rghirhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepfeduhefhve
    fgffelieffheduvdegtdeuueejieefhfejjedviedvudfgheefheejnecuffhomhgrihhn
    peguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:MJh2YZH_ZWwMOwLBtYVKc8PzhDL-T_Wk9_E5_luy_KY6unlOJwo0tQ>
    <xmx:MJh2YRXb-V5v5BxKq0lryVvl8ihK540VZZ8JIvVQ2R33-bM_0wiwaw>
    <xmx:MJh2YUPCeZmpuLKBJtVCKaRu6QEnJKoa8IgW6j97L3XkPYABQisvTQ>
    <xmx:MZh2YaNcEce5eJJp2idvzq29b5LVFRjygFHLFF84Q81FFgybzSA9Sw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 07:42:33 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andreas@kemnade.info, alistair23@gmail.com,
        dmitry.torokhov@gmail.com, linus.walleij@linaro.org,
        robh+dt@kernel.org, rydberg@bitmath.org,
        mylene.josserand@free-electrons.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 2/4] Documentation: DT: bindings: input: Add documentation for cyttsp5
Date:   Mon, 25 Oct 2021 21:42:12 +1000
Message-Id: <20211025114214.44617-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025114214.44617-1-alistair@alistair23.me>
References: <20211025114214.44617-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mylène Josserand <mylene.josserand@free-electrons.com>

Add the Cypress TrueTouch Generation 5 touchscreen device tree bindings
documentation. It can use I2C or SPI bus.
This touchscreen can handle some defined zone that are designed and
sent as button. To be able to customize the keycode sent, the
"linux,code" property in a "button" sub-node can be used.

Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
Message-Id: <20170529144538.29187-3-mylene.josserand@free-electrons.com>
Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../input/touchscreen/cypress,cyttsp5.yaml    | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cyttsp5.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,cyttsp5.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,cyttsp5.yaml
new file mode 100644
index 000000000000..0bddbd76a0c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,cyttsp5.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/cypress,cyttsp5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress cyttsp touchscreen controller, generation 5
+
+maintainers:
+  - Alistair Francis <alistair@alistair23.me>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: cypress,cyttsp5
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator for voltage.
+
+  reset-gpios:
+    maxItems: 1
+
+  linux,code:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: EV_ABS specific event code generated by the axis.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@24 {
+            compatible = "cypress,cyttsp5";
+            reg = <0x24>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&tp_reset_ds203>;
+            interrupt-parent = <&pio>;
+            interrupts = <1 5 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>;
+            vdd-supply = <&reg_touch>;
+
+            button@0 {
+                linux,code = <KEY_HOMEPAGE>;
+            };
+
+            button@1 {
+                linux,code = <KEY_MENU>;
+            };
+
+            button@2 {
+                linux,code = <KEY_BACK>;
+            };
+        };
+    };
+...
-- 
2.31.1


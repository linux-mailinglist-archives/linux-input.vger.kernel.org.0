Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FAF3D1092
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 16:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236464AbhGUNY1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 09:24:27 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:52805 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239096AbhGUNY0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 09:24:26 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2F8F15809C2;
        Wed, 21 Jul 2021 10:05:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 21 Jul 2021 10:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=H/Ku9ZZZr/IwN
        0hdjtD+Ti1V/t8SMod0pAnVUdJMV3w=; b=lkDLgpUrf93hB1gUm26tV+mm5HHmN
        WJB00Gv9Uzll1krfL8k4TNtOd+Aup6dLGB/cv0+lZlddneUvvY9ZhnAkom2150dh
        TUx1/Smo639fDrHAoUwgyruhQ1LeJl9cc7yfQsB3yOASW3xD8fJ1agS9ta/C1Uyh
        aUFyVunkiQ3Li7TJ6o44vzigsXhCqrk6oAeGKyuhJ2pDJZLszyn84oYBfiQ+hvPA
        n1pGuvJB3Szz9/qPu5MvI2ZibglrBfdnJ010O78QnAFlwrADA6+uHjcluNK4vOEo
        kxFAWHqVAnZ9n7mPZnPiNYb6EOa5YVb5P/Nk9UX5Hoo3sM6b+6ud0AwDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=H/Ku9ZZZr/IwN0hdjtD+Ti1V/t8SMod0pAnVUdJMV3w=; b=ZbFQFZrC
        eKwFyqBfDGMVca3m1CEF7FwALdt+rwKp0SE2M/VraoSx9+o1hJgIorZIyuRU9kqo
        3R3hXPH7lO2k5YfNNmYOS2W5xiIlBl4efFBxh9zqbQEFgmnC6IY4znxcRMWkSvtT
        nCjBJK3bWWsVesjQP444UUyhVpCaryF4po8098PqdABBAAFlqiIleqOJ0PQmGIFJ
        FM/VIAKH+q/GF4CV9pfzsslt9rGqIl2nVtQxvYVNNv9HS2EAVo+C+oQugW4UnZUx
        G9PbihFxbBkQL1aASpjaCG9jMDGMPgCGWzuPEAX+zQh5SukYevw+IPZDc2+L6HzY
        Zze7ycB8T/MmyQ==
X-ME-Sender: <xms:jin4YA6rOHA0moCTSyEh1SW_6jh8zAlr53ODyuTDCHQ21jwqLaYPMA>
    <xme:jin4YB6Frc7IL2IryqTeeFQHQc8ICKmRT5rGuWVdlGKtRJJnjVTMv0JznLvw4B_nv
    TQ-q6DoV52wMa0kSHI>
X-ME-Received: <xmr:jin4YPf5gphMi0p6fzElX62PbBovUhsB4UY95srSDPSt5NTWhPYJApoJKyjW_X_EtSdZzcDFJK4U-MN3LbFFDt5_cf8W1zijAyiT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
    gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jin4YFLE74I-vPMWWyv6cpIy30U_ZSpSsBeYjujDm4wcJbIYM9zr_w>
    <xmx:jin4YEIHVH44C2fW500cfpCPq5wdT2-1uGZ1tEdb-clmeAWP4kQLBg>
    <xmx:jin4YGz_CrY3tCIA8pA7ZZ3QW2af97nkihuUrOPzaZOPgqeecB3Drg>
    <xmx:jyn4YJWdpvBKa_we3qbqpOeEgVGcHehbqllkZBbt8OZrYMoHZJJjNQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:01 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 16/54] dt-bindings: input: Convert ChipOne ICN8318 binding to a schema
Date:   Wed, 21 Jul 2021 16:03:46 +0200
Message-Id: <20210721140424.725744-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ChipOne ICN8318 Touchscreen Controller is supported by Linux thanks
to its device tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../input/touchscreen/chipone,icn8318.yaml    | 62 +++++++++++++++++++
 .../input/touchscreen/chipone_icn8318.txt     | 44 -------------
 2 files changed, 62 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/chipone_icn8318.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml b/Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml
new file mode 100644
index 000000000000..9df685bdc5db
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/chipone,icn8318.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChipOne ICN8318 Touchscreen Controller Device Tree Bindings
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: chipone,icn8318
+
+  reg:
+    maxItems: 1
+
+  interrupts:
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
+  - wake-gpios
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
+            compatible = "chipone,icn8318";
+            reg = <0x40>;
+            interrupt-parent = <&pio>;
+            interrupts = <9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
+            pinctrl-names = "default";
+            pinctrl-0 = <&ts_wake_pin_p66>;
+            wake-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
+            touchscreen-size-x = <800>;
+            touchscreen-size-y = <480>;
+            touchscreen-inverted-x;
+            touchscreen-swapped-x-y;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/chipone_icn8318.txt b/Documentation/devicetree/bindings/input/touchscreen/chipone_icn8318.txt
deleted file mode 100644
index 38b0603f65f3..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/chipone_icn8318.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-* ChipOne icn8318 I2C touchscreen controller
-
-Required properties:
- - compatible		  : "chipone,icn8318"
- - reg			  : I2C slave address of the chip (0x40)
- - interrupts		  : interrupt specification for the icn8318 interrupt
- - wake-gpios		  : GPIO specification for the WAKE input
- - touchscreen-size-x	  : horizontal resolution of touchscreen (in pixels)
- - touchscreen-size-y	  : vertical resolution of touchscreen (in pixels)
-
-Optional properties:
- - pinctrl-names	  : should be "default"
- - pinctrl-0:		  : a phandle pointing to the pin settings for the
-			    control gpios
- - touchscreen-fuzz-x	  : horizontal noise value of the absolute input
-			    device (in pixels)
- - touchscreen-fuzz-y	  : vertical noise value of the absolute input
-			    device (in pixels)
- - touchscreen-inverted-x : X axis is inverted (boolean)
- - touchscreen-inverted-y : Y axis is inverted (boolean)
- - touchscreen-swapped-x-y	  : X and Y axis are swapped (boolean)
-			    Swapping is done after inverting the axis
-
-Example:
-
-i2c@00000000 {
-	/* ... */
-
-	chipone_icn8318@40 {
-		compatible = "chipone,icn8318";
-		reg = <0x40>;
-		interrupt-parent = <&pio>;
-		interrupts = <9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
-		pinctrl-names = "default";
-		pinctrl-0 = <&ts_wake_pin_p66>;
-		wake-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
-		touchscreen-size-x = <800>;
-		touchscreen-size-y = <480>;
-		touchscreen-inverted-x;
-		touchscreen-swapped-x-y;
-	};
-
-	/* ... */
-};
-- 
2.31.1


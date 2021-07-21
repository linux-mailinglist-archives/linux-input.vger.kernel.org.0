Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6203D1099
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 16:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238968AbhGUNYd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 09:24:33 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42729 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238938AbhGUNYd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 09:24:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 671025C0226;
        Wed, 21 Jul 2021 10:05:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 21 Jul 2021 10:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=mkYXHP7w11Wfk
        aMpfkn863/BzLw0pEh/++MJnqiga68=; b=3ilf+tmmicpc6U94vcKT3Hx+zOWfF
        aMxWRt/yolSVWdws4hiy+KfGq6QvDfM4aq0O6yIq5aQLbvovKXq8UIL5ftkz3JGw
        F5igBoUjYoi3XHuo9e/2QPRkXgeM64ejsfnxLGEg6dWzwCwccMyrXf3Q8dAsPTKs
        fAjD29RWVF6cvdzl56cUeOeg0p+fcFx5Sf2kNfEPBTS3VCrb219Ita7VY2kTQ+0Y
        efyVAhM7HZhHu03ubRVoSVQVyGwwY9uae7ULFRWW6wI2aYJazCaQREX+lYTeSTNa
        I876eYvnlbb+jF7afFvq8UmJ9o+l5xk4dFSCAQOvyP4Bi57RCCjK5svSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=mkYXHP7w11WfkaMpfkn863/BzLw0pEh/++MJnqiga68=; b=MrY/zmGg
        8Kmlm1YaJFvKFGBnNA9JgbyNC1OjUtToPS/OXw8GmYWLcyK23j2lHFRJRziwoQjF
        r82MVh/s0GNW+qmpwHHH4bLSoSivjxCMlC6seHnFLiU+pD8XVjKsPUFtMgVYV4MG
        BnbDcwwwZ2IK8+DyWqBcNEOvWZlQ4yEjedTuDDuN/x7rLQysUAO2Pun+3xXiWXAe
        4tjwnTplPj4g1f04zZjK6VXU00zBGFHJlrSSMv3ssREgyJgmt0J1LmhTQZcTP0v4
        2GG8cSlagzn4FnuWLE9b8f2WpE/7nm5F8R/At5PlQ06GxhYjI2aeueYb+pyucjR3
        PY89lPJSMV+ATA==
X-ME-Sender: <xms:lSn4YM8Jr0giG-xADQCp2T56w9mkF_OZwDWlr-LRZkMGvcuG0vtj8A>
    <xme:lSn4YEtDIQrUn_B_tnkbX1WYZ5QocY5k_pH49gWplPVoFb3O_vNCX47bTtLWXc4ES
    SimU_5oYZW2RE7WvS8>
X-ME-Received: <xmr:lSn4YCBhIz0T4XtiEOUEk98PKHVQeOndZdwN1WjFPhHBt5C0ez_xWGePe0Mjpx61Jqo0ZlSgMnyNBsK2kP7M4v350GmPx2ltVIgt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
    gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lSn4YMeGtl-xoGJAB83w0oVQJoB869caMCtdMHyFQDkGOMmnROcY4Q>
    <xmx:lSn4YBPxhcvJIq4NurL2U7bwfaEVIZ6s-r7p6cutl1e4f79d-VGy6g>
    <xmx:lSn4YGlTCTcT_iUzC5Z4noSdWlsgv1afXg-YmSUDEEbvDyZq7WVDqA>
    <xmx:lSn4YKjR7AYiuVv_H4LoKKO8g3FhNwh30sUyY2iBgYU4OkFHMINujw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:08 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 19/54] dt-bindings: input: Convert Silead GSL1680 binding to a schema
Date:   Wed, 21 Jul 2021 16:03:49 +0200
Message-Id: <20210721140424.725744-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
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
 .../input/touchscreen/silead,gsl1680.yaml     | 90 +++++++++++++++++++
 .../input/touchscreen/silead_gsl1680.txt      | 44 ---------
 2 files changed, 90 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
new file mode 100644
index 000000000000..84a462ffd14b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
@@ -0,0 +1,90 @@
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
+  firmware:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: >
+      File basename for board specific firmware
+
+  silead,max-fingers:
+    $ref: /schemas/types.yaml#/definitions/uint32
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


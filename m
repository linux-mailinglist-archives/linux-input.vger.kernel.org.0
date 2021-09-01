Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018993FD67F
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 11:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243530AbhIAJUg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 05:20:36 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:34075 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243528AbhIAJUg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Sep 2021 05:20:36 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 80FEA5C023B;
        Wed,  1 Sep 2021 05:19:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 01 Sep 2021 05:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=BUjrY7fZcWnH0
        QfgImI+J1eGNrYXnjBWC5uk/Rd/cM4=; b=skHD6cJAtQHWtMLQOtTdL5F1rUOef
        UlvwjxWAA8UrfUiWCh0cQ0d15OluFEUxC97MIqQ36L+yW92qnWP39b6uxcBvTbDq
        aN83X1X9Va5QUXXNmFUh6Iu/Ii/se+2UoEYxAWbbs7Z9rotlSvtyGcz4xAx+5mx/
        nIlaWQNGEsYqLpmZ/yhncygtd3ax6NiFxhiU4f8TbY1Gx/0YpqMwybdkXxmI3XZZ
        OR9KwuifNFvTYyZqDkqcPoJfG3NibHDi6EJTfYrC0DyLaL/U4cuPcH49o60qd8/e
        N68yHfb21x0ykzXL3lKhTMhd+8EJrxewNI6QV19jfkijOjWTe7a5aBsuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=BUjrY7fZcWnH0QfgImI+J1eGNrYXnjBWC5uk/Rd/cM4=; b=bp8KtRAB
        CcudDu6+BrcuY9QnmvIDTI+aI+6wW1SrP6pzciyFYMQ0jzO6XISFGsdda8xJINXG
        xvzBoVBOOripN2ot5jIf9vrDf2m5ntwsub/i2nkoaq5vEPi2tHgqKs6XjUbnTk9C
        Y4cTQR/c+q8OOqPPxuqcpc8za7XUW7KBLhUG2b/Gofxe4a7k01AiWX/Xn/4JmHsX
        D3pg1e5MSkajo4x6P58oQv7gLcCQ8eW3tnG+eKUk9mE9c+zvmjBKPedGaVAonWu9
        xFAMLBqBIr+aN8yScww65iZqgPvogv8lcxv+GilQjppHePnP5acXybUN5KCdME67
        ScgfwL2KARGktw==
X-ME-Sender: <xms:q0UvYTDQKIPAKkEVAn4tqAIvkfO0FcaZujixdwY-VH1L8mVav9biMA>
    <xme:q0UvYZjgoVeOdDdfN-QBsmgIA-Zhvm-FbCni-Wb1iybNG_u71QcbZySE6-y4LEUEz
    1qOlwoLz54sZEvi5H4>
X-ME-Received: <xmr:q0UvYemINZN5GXP4q8skZU3OU43terxP6U-p-YiigSX4TJPnariZuXLp2dzyQL36XvrdsMJ1Si5EXfFPQ-uRSSvvyvIE1zXWWzLT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
    fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
    igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
    fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
    gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:q0UvYVwNfFB3fC7Wg_xp4oiyMnf84_BtbdDnCoP9m7JMEKvysal3bA>
    <xmx:q0UvYYQc5g3uG4HGqdwFxuv-MwxD6zMReo6_Z9l8QboAu6bEzgV9vQ>
    <xmx:q0UvYYZYL-tqqE5J3vLpLJQNiHe9DrTrh23-uPY5GD31wAnFFQIvjg>
    <xmx:q0UvYbF97GyG5U86sIS-retU7dMIrzlUt8zZ-TPMHG0FHJh0CVbrJQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:39 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH v2 24/52] dt-bindings: input: Convert Silead GSL1680 binding to a schema
Date:   Wed,  1 Sep 2021 11:18:24 +0200
Message-Id: <20210901091852.479202-25-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
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
index 000000000000..cc064696ac28
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
+  firmware:
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


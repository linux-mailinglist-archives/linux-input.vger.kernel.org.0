Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445693DE8CC
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 10:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbhHCIt2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 04:49:28 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:59733 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234760AbhHCIt1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Aug 2021 04:49:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4B3835809FE;
        Tue,  3 Aug 2021 04:49:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 03 Aug 2021 04:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=aLmf5ZulQKo22
        UOhj7zT75v81v/GYAnQNepIf1NV6SU=; b=m2GEldxE6QvnE0QzJmgytM1p832Kw
        o/oedEaWzWW21rO3RYVYDdDGjaTRhGN7iHuauk67Nq0RFvQK3oW3Pl0i48x4Zifa
        rmj1wONTwEQZwlXptutEpMhE/mxiQd2YInbcuGHd8K8ZTugwLyUxhyTESab+ZYTj
        /hr/sUNwFBYbxHM0hhUkVO9Hk9uY8gNyJijeZuc4+wGF1MJNxez0QIkXUi3buVzK
        cDLpmIN6B+wfhEW4O88y5ganQ1SuogOCs/fUEUSqf6g+M7ZXwgRqoIYjaOl0vmDm
        XFF3TUfcZqVe8aRJFUFZS54udosvpdrsifMaUAlRZhRsU0sXE/IpjvI7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=aLmf5ZulQKo22UOhj7zT75v81v/GYAnQNepIf1NV6SU=; b=AZEfiVSS
        g7NONrWr8Oo3m4o6Lk7PADrzaKl7COqqLs9hMxZgpd+dYFXw5k1apKEvtweBCMRO
        YmSyyFQI0kUx/YN/6OySBPQFPv1sy0BpIgOSzyCERJuGckTbbZkqckA2kOAQuFaT
        poAy7UtXGGy7EeQMubAWHM6V4rzahQjLrHaq5XcJWKBy3zeh9mKlf4Mv9fcCiQzX
        Zfe45LusK1ZFw2KGXQfN3wRCWYxHi+Uw9btfLR1HnQprWI2CU6zwWXT5ma2VGcJ0
        8Z5seISW4eX/Y/W5xjUtfpc597aOqHvQdpaP/4dKbCqE9SkKuKit49WzPS/Wyhio
        0rfy4joEI5UshA==
X-ME-Sender: <xms:DAMJYYxzacS3uY6mqLETbk412cefTPU_IU6FfG1p8fgorJVSTSnv0Q>
    <xme:DAMJYcQWvJN8IuFabhpTn-tuX7pRNDpa7fenCeCBSsi4ECOt2sx_0nmlDI31uVD3F
    6uN27CwJvZgvkM70ww>
X-ME-Received: <xmr:DAMJYaUhms_ddQsfyGg3N_eqlLLGY9HnvEQoRODyqWkqb0djtPrLYSSwSvPZgh1J2uBLc_X3IBQScQzgbwV838X3EbJ1vZmZPMyfmvwso8tZ9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepffdthffggefgle
    fgkeejhfekiefgleelfefhtefhheefteelgeeggefgfeffvddtnecuffhomhgrihhnpegu
    vghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:DAMJYWj92T2lLh9bol0ZW6j4CiVXwe2kUus9364pKGQSp-BgKBZzdg>
    <xmx:DAMJYaAZoDdS1kg5C5ahDh1yUiZpGINpbRlNV_e2EnPT30YN1rJLVw>
    <xmx:DAMJYXJFl2ZurDX2yZcmKm0UmBjxhbscBGyjdvpzD8A2ZGLEDm9zFA>
    <xmx:DAMJYe5TwIw-OrvSOakcvt_7dn42lT5x2eVoZyZFsUVxpvzncaRtiA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 04:49:12 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v8 2/9] dt-bindings: touchscreen: Initial commit of wacom,i2c
Date:   Tue,  3 Aug 2021 18:48:55 +1000
Message-Id: <20210803084902.336-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803084902.336-1-alistair@alistair23.me>
References: <20210803084902.336-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../input/touchscreen/wacom,generic.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
new file mode 100644
index 000000000000..a8a7f362b0ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/wacom,generic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wacom I2C Controller
+
+maintainers:
+  - Alistair Francis <alistair@alistair23.me>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: wacom,i2c-30
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description: Power Supply
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/interrupt-controller/irq.h"
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        digitiser@9 {
+                compatible = "wacom,i2c-30";
+                reg = <0x9>;
+                interrupt-parent = <&gpio1>;
+                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+                vdd-supply = <&reg_touch>;
+        };
+    };
-- 
2.31.1


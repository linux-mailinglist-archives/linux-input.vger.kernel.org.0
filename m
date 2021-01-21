Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05F932FF608
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 21:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbhAUHuL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 02:50:11 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33149 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726488AbhAUG6D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 01:58:03 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id E563D5C00F4;
        Thu, 21 Jan 2021 01:56:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 21 Jan 2021 01:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=SJWixD92WzD5A
        KdY55B5gYlOoEKpKsI7RztlWKiuj1M=; b=jtEZnlyQ+uchiJntQ4O97J8kXQUca
        5BabrIOan80CNLoJnsAQBFHLtKxP9LAVjqxnX4VTZCFloEi9F/oz1PLp5bPKj5Xk
        Hl6CzPjvgyUoWBmI9EEEJ0j/z9kl2we1qe+RI6ItuEyCxsSPiQGtjZPyMUGLP+7r
        jOy7E331KQmut369oZSxUwKx2YKphKXkf9AjSmBPLqJjlgeM6S2rRmTPD6xG7WAs
        gfvEgJKx7Mhv8pNJ7o+DwqB3stulykp38qETuGi73f0TsRAYT36CTuVcV8CAvB6S
        2+ITPfdy0jxA3OQHoWTr2FAI4ApNapsFVSNwKtfzNeIV3rczhwl4JuU5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=SJWixD92WzD5AKdY55B5gYlOoEKpKsI7RztlWKiuj1M=; b=oMwtOu5F
        CEnaTB15tmGbzB+My0DWrh8IvqBDjGwxrc3wq4TbSP8LaZck23zWoLqQNpNNwBWk
        AjhKKbwaAVGqVn8j1VgI7v6hRObmy0Rzs+8wTPloMwip6GcqFZXt8YbM5srot3lm
        L852lY6gANUXGWGpRlHJxw8cx++Oz5tZTI35N34CcyXyjtUL34WdeL7J7CrkZbF2
        8QUanonR+8+QVd+MdXpkn0//q49wyeL8cOip6J6Ilb/20OZNb6M9rnJW6THJP29c
        uwdM14CKfg3Sw3PbVoTMrkoxrNg3qIk0VpVymgRlePvMHT3YCq1cY0jKuKQKcJDM
        JP7l9/BJBWzhoA==
X-ME-Sender: <xms:sCUJYD5pvbRislyCb4CFDVbaM-EmGVibp5saoL8CHg_JRYydHuUg4Q>
    <xme:sCUJYI6fUTKgF_wKtySSMyBxvrWq1dADXBjw1xW4a3yGyDIVwyL1MSKvnwIG3O_S3
    s0lY1wd02ZrLOr8bw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpefftdfhgfeggf
    elgfekjefhkeeigfelleefhfethfehfeetleeggeeggfefffdvtdenucffohhmrghinhep
    uggvvhhitggvthhrvggvrdhorhhgnecukfhppeejfedrleefrdekgedrvddtkeenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:sCUJYKfbYvTOUq_lQeh47jX_wbpO2NCdKqEGjIXzLPB7n5Rg-fmM3w>
    <xmx:sCUJYEL8RnSXe_Y8Ksf9CTfeUKlHdAiPGLS67xixscjjF9a8Q2Qhew>
    <xmx:sCUJYHJ4-E3jyVfTpc2te48KGm4w7n_JL27NM2ja59CdHjsRD9SoPg>
    <xmx:sCUJYP11t-DJsUcnfcikoKFQdeb5tPGktxSTTcq2L4GMeH9qk6shxQ>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id E97261080064;
        Thu, 21 Jan 2021 01:56:47 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 1/6] devicetree/bindings: Initial commit of wacom,wacom-i2c
Date:   Wed, 20 Jan 2021 22:56:38 -0800
Message-Id: <20210121065643.342-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121065643.342-1-alistair@alistair23.me>
References: <20210121065643.342-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../input/touchscreen/wacom,wacom-i2c.yaml    | 44 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
new file mode 100644
index 000000000000..b36d22cd20a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/wacom,wacom-i2c.yaml#
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
+    const: wacom,wacom-i2c
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
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/interrupt-controller/irq.h"
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        digitiser@9 {
+                compatible = "wacom,wacom-i2c";
+                reg = <0x9>;
+                interrupt-parent = <&gpio1>;
+                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 041ae90b0d8f..5bca22f035a3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1202,6 +1202,8 @@ patternProperties:
     description: Vision Optical Technology Co., Ltd.
   "^vxt,.*":
     description: VXT Ltd
+  "^wacom,.*":
+    description: Wacom Co., Ltd
   "^wand,.*":
     description: Wandbord (Technexion)
   "^waveshare,.*":
-- 
2.29.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DF84440C6
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 12:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhKCLv0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 07:51:26 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44293 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231948AbhKCLvZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Nov 2021 07:51:25 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id EA23258074A;
        Wed,  3 Nov 2021 07:48:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 03 Nov 2021 07:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
        fciS6BbICquCAT2nipLjc2JqMiyX+SOJZRtpLSc8RfA=; b=1omK5wMNIxqh7gZa
        VHTPPaYPWycM+L7+hnrDjFt2nBMZizs9tuR3GZxt/YU9l/kgU2XXJ6+odXRy3k6E
        YteA6yeXiH90yYPCTNm4pwe2WL//7qmCNJPOPK3sUOCzzD+SMGVt2G2Vs/64FiPd
        KXNot8oZQDPU/YSWnQDkrQknjFoNKCXLq0Er3iZV1LdFVtNa3cYV0HLyMJMB5ZwV
        KwU3dC5dwEgxQAkUQsywp3HjreZ5y7uPsmQFnslrdOuguUQsG+TAsa8a5xU+040h
        NGbJWp85++ud9/MG5SGyajnF1Fr7zfCfvJn2pWlNg2ZipoZcEPCAGU8qTQz28Oxn
        lmX6ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=fciS6BbICquCAT2nipLjc2JqMiyX+SOJZRtpLSc8R
        fA=; b=WEV+OWYp+8Edef0KUbSJcteFf3R3916W+3JjTPyOeIUctop28D3kwVY7c
        YXEBGDV3o4VJBJvgYq2eo9bGuL8QJZmsV2Il25oXLdFdisnO+T6J6CQ5vIHqLG0A
        jQkFP8bhG68efb2SxqvgFg1JKH8+AJuTtrEJxGTZmnG4VhvF+0BHJmddwgFUbrPH
        ozxk/itKOWLTyETouT46QsHIrdApQTwGr9skwMTI/v87N2vZVqgHw+BACD8iMDZW
        OdAGEeNpLDYPJFNY0qGRHpzR+cXi9hHBeYHNF4GigQA057ByoY2IJCxMFFccvne4
        jNoAEMTkOf8pQFrQl63VtGxLAcBAQ==
X-ME-Sender: <xms:IHeCYVheQ6uj-AMcw2cfx56PspUUQlnbSAkeDR3sG3LQmFnFWOa1-g>
    <xme:IHeCYaBXiAN9PGoRxR0UnLt4NX-EaW3NCDIc1PkkHTvUZoT0T1XvJ_pOyot5dP7-t
    NAPdrUAlean1opLU9w>
X-ME-Received: <xmr:IHeCYVFnp37587hy6yc5Xs8iXDV7RKcnMbwAD1geL9aJkGHlXUxbEIAc_60BURXrrSKpCABN1rQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekre
    dtredtjeenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeefudehhfevgf
    ffleeiffehuddvgedtueeujeeifefhjeejvdeivddugfehfeehjeenucffohhmrghinhep
    uggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:IHeCYaQvqRVv9J1aegslnk1doq7J8Un3HrPVkZnQ_sEAVdPeQDNL3w>
    <xmx:IHeCYSxlSpl2GNnWaPYQbRe-jeDbthPuGLi5GVhXCLnHQe8Bg59p6g>
    <xmx:IHeCYQ44CQkSn5H7gMaVuQCjI73EPafvCB_t1t7Uw2lIq5ihEfNg7w>
    <xmx:IHeCYXqaBGkjj-4JJ7eUj3OZsdbzO8wMttJtjd2cGBU4pdP_AGm5JQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 07:48:44 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     mylene.josserand@free-electrons.com, linus.walleij@linaro.org,
        andreas@kemnade.info, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        alistair23@gmail.com, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 2/4] Documentation: DT: bindings: input: Add documentation for cyttsp5
Date:   Wed,  3 Nov 2021 21:48:28 +1000
Message-Id: <20211103114830.62711-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103114830.62711-1-alistair@alistair23.me>
References: <20211103114830.62711-1-alistair@alistair23.me>
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
 .../input/touchscreen/cypress,tt21000.yaml    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.yaml
new file mode 100644
index 000000000000..ff7eca412440
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/cypress,cyttsp5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress TT2100 touchscreen controller
+
+description: The Cypress TT2100 series (also known as "CYTTSP5" after
+  the marketing name Cypress TrueTouch Standard Product series 5).
+
+maintainers:
+  - Alistair Francis <alistair@alistair23.me>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: cypress,tt21000
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
+patternProperties:
+  "^button-[0-9]+$":
+    type: object
+    properties:
+      linux,code:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Keycode to emit
+
+    required:
+      - linux,code
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/input/linux-event-codes.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@24 {
+            compatible = "cypress,tt2100";
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


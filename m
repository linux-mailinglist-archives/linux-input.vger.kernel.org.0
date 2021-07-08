Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68523BF98A
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhGHMB7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:01:59 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:49237 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231838AbhGHMB7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:01:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6B74A58057A;
        Thu,  8 Jul 2021 07:59:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Jul 2021 07:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=VSMZ0QroRzB6P
        CADkSPacl+6PN2Ml10WpvWIgK+mcKE=; b=NQZVuwq2SA/5Qoc2432suvdtuTIhU
        +1x7CHaDX7orWJQ4AP3Ff6SYEUMoDwWizUgqCeWxlbkoQPDIghVsiNR2OA2DEzYw
        vgG9x7HVuuyyv5MK7YaY69dOzaoRdDLj2rmjZhbotN/10qxC1P+mvo3nKDWGo/k6
        MQovss5VyHES9MiQTxnWsHf7L5eycxji/B/n5rQivf8yTZl1ysPNtgoZ8nPhgZht
        i1OicyZBvObJYy33TAJINPzq4zMiftvilGrKoFOG0hucK/oltNGhJ4afC7+gxSFG
        zS7YkAtDF0cfVpt0xfsL2V8tUznLaGIu5ft8JicQ2YfbB7Mk/oA60StJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=VSMZ0QroRzB6PCADkSPacl+6PN2Ml10WpvWIgK+mcKE=; b=EcWliMQr
        QUGxkdJBPaPX/sIvmUNXpu1TaxOLb6HEJpRB7N5dxJ53rLBItsAQUCkwWJsZq8TB
        V073fiUy9zFfrXAMvG7h8+p2K/e4ib03FC/r6MLoE+f5IwJcuvzXSu4P1YLa9emM
        U3SUiHmljqvcYJxepWhBb3gullgB1f5XtTqtQ+n3D70sFVg51duVxaRIOUyOTIJn
        0nBYIAAxIKdcnA+ZIn2WVocx7Z9lxASgQm6OdK9+uZLFTvSfCwI1YiWK+Kpbhzm6
        NmDh9jWinp5+7d6hoYLkCxGOn9IN1VTUBrs1yf7nANO6bE8BRnHs1hAKxAXTgndw
        sM76cf7FE7MIqQ==
X-ME-Sender: <xms:lejmYNpEqBQAKtxlDPqw7MqI3GXHyd008L2Ry7i5cbXn-5fdrXQmJw>
    <xme:lejmYPpIb8YdHZnyLYtfS12bI7r2es_GVFMJf15icF36sO3jV6CmcVqDIk6IgZRnF
    dWDEPU_gJObF8S3MXQ>
X-ME-Received: <xmr:lejmYKMGy4Io2nmRkdNqFi3UPcqTJ9yNG08ZQOBQPH6y6toozqGdGe-aqg25ScI33LMqAqyHjPk-cuzcByc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepffdthffggefgle
    fgkeejhfekiefgleelfefhtefhheefteelgeeggefgfeffvddtnecuffhomhgrihhnpegu
    vghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:lejmYI6xj9X8mUJu_hW3TvhIJs4dxr_lT5K0ifujDAbWjJ6bypZ2-A>
    <xmx:lejmYM7x3xbHVwOdS7yobqn6YSrJ0WGiel127umaqri9x9sxs5xjQw>
    <xmx:lejmYAilZ_9R6PmLRksQ_JRNZpU_Qg5AlKknDwiddTkG_glafrwcEg>
    <xmx:lejmYJyTfvB4iBvMpn7KKsnTuOMwpljGE1pa3O8PUeIaoixehCR_AA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:12 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 2/9] dt-bindings: touchscreen: Initial commit of wacom,i2c
Date:   Thu,  8 Jul 2021 21:58:46 +1000
Message-Id: <20210708115853.281-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708115853.281-1-alistair@alistair23.me>
References: <20210708115853.281-1-alistair@alistair23.me>
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
index 000000000000..48c611d63bd8
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
+additionalProperties: false
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


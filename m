Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BA13432DE
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhCUOLO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:14 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44141 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229901AbhCUOLG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:06 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 4EC135C00B1;
        Sun, 21 Mar 2021 10:11:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=QilBSQELC5Jps
        eLwMvLp8OTL2JP7KPgW34CJqSKOLUw=; b=rSWqdiX0lwxLSRT5se1fuKm/g7q8z
        5qdTB+0+3ESx9iKwdfq4mvAVLteD9L4DVDDbIbmoGtLnp6Ffx4tU9T2Sp19uISQG
        9cBPlRzQMqSi+xYyqVU20bL2UpF4Yyzob/cInpYDQqSBNOPJzhIeNKQVWZYltCZu
        5dNKZOTC0aS/O/3/yXemiGCv68h8p587qshqQ4vK8nNQLDMvBD9g7CW85nrQdSTC
        qiiA2fhIQPFAvC6lUrw6tEx9Z4Fg4DW16CL3ZZUz+5EUkNqbaru2CQyDYqG6f05z
        S70C0v0nvNjVmCiFQzxvU370xpy5XWVitgDOcDXLJwv0xgk+OFduUmjiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=QilBSQELC5JpseLwMvLp8OTL2JP7KPgW34CJqSKOLUw=; b=ibT9hFk4
        b3TmO13s8Al0mMAoRGhsskpGqA7+nU0idzycomOWiQDIxWmLsbjrr6TRbzC7yU0A
        nPGidDrTVaFBsiDElZvT7LEyrprR3Wi1n80X3rryouU2S3RLs2+o89Qo+8ykcTn8
        3CjTgZ72Nc0PWFQ84phG5DWBF0URpcOfyOBvMe9YZlPqGyUvmQg6iLPZFZCd4mPJ
        dB6kE+AX1M8HIQmlMBDQdONslSlt5Jwq2U0ol8OBSY0OERdQCQ4j2Q2BBBQWiwEB
        HOv+Z7oNRBcADasDHpBW2/Jm93p4QZnmAf0nqZTfGz5nghGK5seNVJzRXwOUvRIt
        rG6Cj7jOTJafKg==
X-ME-Sender: <xms:-lNXYL3gNDL-VYkepYkV4VfDkRbzFuhc2cH1-RAz_rFyxBs1ROJcLg>
    <xme:-lNXYKGanz6ov-2rfDWX6VPSDY0cMCFqBewiFJqcpsyEBhwfqknEAPGxWFBI32Qcu
    sizxKDjldX7JHluQ9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpefftdfhgfeggf
    elgfekjefhkeeigfelleefhfethfehfeetleeggeeggfefffdvtdenucffohhmrghinhep
    uggvvhhitggvthhrvggvrdhorhhgnecukfhppeduleefrddvjedrudefrddvfeehnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:-lNXYL7UrTBMGP9a07M8urMDkGqKIItxOUN0CXW6c9LM2CbPa1IAeQ>
    <xmx:-lNXYA21MQ-HQzEm_Ufp4jl0UU8BVJacYbao4mQr6v-LeoA4zwrwgw>
    <xmx:-lNXYOGIE4sdJ1kG_dpav2bI0seX2SXs3BahzchVr_Rn5QSMpINkxw>
    <xmx:-lNXYKD0y6uyTJvv030-OMGZgrx17HCY8MdWgnV9AjieXMB_NdNEHg>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6AF22240138;
        Sun, 21 Mar 2021 10:11:05 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 2/9] dt-bindings: touchscreen: Initial commit of wacom,generic
Date:   Sun, 21 Mar 2021 10:10:42 -0400
Message-Id: <20210321141049.148-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321141049.148-1-alistair@alistair23.me>
References: <20210321141049.148-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../input/touchscreen/wacom,generic.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
new file mode 100644
index 000000000000..19bbfc55ed76
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
+    const: wacom,generic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
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
+                compatible = "wacom,generic";
+                reg = <0x9>;
+                interrupt-parent = <&gpio1>;
+                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+                vdd-supply = <&reg_touch>;
+        };
+    };
-- 
2.30.1


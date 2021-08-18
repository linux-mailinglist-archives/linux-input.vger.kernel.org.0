Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D953F17F0
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238537AbhHSLVW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:21:22 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46653 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238546AbhHSLVU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:20 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 92808580C10;
        Thu, 19 Aug 2021 07:20:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 19 Aug 2021 07:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=DvmjdCZONqMiz
        RnpwfTpRqqlbDgDApz/FK5y2XJHk4w=; b=UjMXUXe0lzGsnQxJnlGicJCs/AHpO
        4I71RrxxgUnoMlEXlULLYhRUGI6Wy3OElkaSO0xngczbaTdiqgv14Zad7PXVxXgo
        kHd9drJxtK6nfaGJyGTuMiCCaVWojDZr+Pqc/5Fo8HfIDxN7d+01oUSQ2LbEVX3F
        lFhPjpG5OwNw7Xzbskaeq7XaxttmU9TIlsA0Z9wTLyDkTosi3SVru9iczU5BmfkT
        rWpY/cczFBGOQ4NxNcz30PoCSnP0n/UVELpn6ouSXUFtqq5NTB+slNbfa3ueZXej
        NnVCQSchLFunkDS7AL9wPsVznKR+P34qBVyDzlrml/tLXUDIByE7bzzYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=DvmjdCZONqMizRnpwfTpRqqlbDgDApz/FK5y2XJHk4w=; b=d6+sCZaa
        GjDloDXfol41/U/zJmUIsrpOiXuqbSksr4PE2MH6o+BEwYK7Kz9aTj4C0GCp0lgQ
        08P5FKmzfa4SdMxXUWHXaUU+mnVXAorXpcN7gMr15biAiAML5cimM4cO2ktXlLud
        kMqXPWz+8l6wj8Aw0WdSwpbORRdTdtyz2qXN5QwedpkDbifeGXieJvu+wVW+biOS
        z5hf+51NtrjWpL8RjA1Mrip9xHA9RWDjd8jqlE/TEY+75CCsXrMdBD2E62+yTWHi
        hq9EEY3GVaFqVozgu63ShiYh+0FMew7yhbq5czETGwT61Ahv7nI90PErZjrzMbtU
        gztQnbSlz6Ca/g==
X-ME-Sender: <xms:iz4eYSwAkQaphTJhQa2fxlY5f6_pUwSjsv-mVhtevyICRQDE-MMh-g>
    <xme:iz4eYeS2aqqjNQ87wz_CcBKckOiQmH5YEtUVg53ubfpshKIbE5ZVrvZtoDg2X6-qw
    9M4j84BvSLapVRMS0Q>
X-ME-Received: <xmr:iz4eYUUPUbmtYLmjWXQkn2z4Gsh-3fJjUHjciF0JzPvzbSVOipawo3vmgYM6NBMfux6zJ6X1GM_SDDBbfDNt7mmDu_UVHBME19HxXRhLfinloTVMUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehlihhsthgr
    ihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqe
    enucggtffrrghtthgvrhhnpefftdfhgfeggfelgfekjefhkeeigfelleefhfethfehfeet
    leeggeeggfefffdvtdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:iz4eYYjquumrQPqOtS8pWzzZpVuhq1aQmA9x5n_Ldkuw_XRXbY25EQ>
    <xmx:iz4eYUDQ79QOKHVz5uWVArROxGHYKuCaO03uyFDxOEGA1adliz2twg>
    <xmx:iz4eYZLHGxtE--KieY3JYOxu4iR0FyX5OsTS9bIcQ0Era77ij7pBBg>
    <xmx:iz4eYdLiWoYFSyZgfOCv4AuYkpjDFDqQuXbstzBW55n9ZCZmysnFVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:20:39 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 02/11] dt-bindings: touchscreen: Initial commit of wacom,i2c
Date:   Thu, 19 Aug 2021 01:49:26 +1000
Message-Id: <20210818154935.1154-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Rob Herring <robh@kernel.org>
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


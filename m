Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418463A7BE5
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhFOKcu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:32:50 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:34561 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231643AbhFOKcu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:32:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id A2152580729;
        Tue, 15 Jun 2021 06:30:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 15 Jun 2021 06:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=HIoTMriVA12LQ
        ElOMYva+gtL3TWoD/QflY0prR9RnFU=; b=SNvjkVLkArHryJRDcg02779xjeTDJ
        aZARMrkLEl1fnxU1seytk8xFZ/AC4FQVlkkOnXKWSh38i4nWj20D+XR+msRToSUL
        ngJjTkzq+0TGU7QUg2VAATcSRhXfJHxLKObLyVTMC0ybBqP7t6oL2nL2GLPK8nhd
        0+QgZeGvPRcj1R2GpVcO4FRRaZgVIFZwnJK7aaUtJnG8jDsLr2PBPYBR0ZM+hsKN
        omEd9jN9r/QpzJst0I3bZ9jc0XLhisIV1LmHbpLqIh0PARCv5k06eSt4WHhsN/iA
        MzXB2ifGTsG5paRYm4bDC+4KKSRzFNtq/RLPf84p9vA+X16foGhRTm57w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=HIoTMriVA12LQElOMYva+gtL3TWoD/QflY0prR9RnFU=; b=dJ7DxEca
        PZkF5q8Xc7/FcRqBnQ4srQHjZ3zBuxGS1vMUcMH9cGE3o0NBm08lYjh7epv0+sA0
        J54HrR6Y30Vv6VQlLs7pYhfJMhwA5qQQhcRmu5BbfC3TYwoFHmpT5QNRlNBWMHRq
        hD8uNn160vWEZ3VAidDUk5LwQH3Pun+GyjNIUv/3B3BYZtxY1URb6WifSGHh77Yx
        lVuq1graYWOSBDg7xCn4sbHKX8XP+MAoRHV3swK08v4YPC4WvLDpJ54Z1G9SXiQO
        8mmP6lQQM70yPHdLYSYqeeO5+u6YSMF0rpqoBAYhXDwibkDdDhaYg2hn2TBZRt2D
        il/nwYDc0KHq3g==
X-ME-Sender: <xms:VYHIYCNKMPvMPWnAk13ldaDG5OtBv1RsMwWlKJxbwUb_Lo-8qCVwjg>
    <xme:VYHIYA8fZVCXBVJ6YqxCn01286EvrsR457muuHOAUtQSJWlQ6C4HoiCYbJOEbkOA-
    DlYjFix8w9VDWNnRlQ>
X-ME-Received: <xmr:VYHIYJQLKrAzqwQ8Mz1189I8m6tpj2u-yYqxhdQrEh_1llQy934ZTecsZ1FdvZKS6eo1Z7f6diHvwwzr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpefftdfhgfeggf
    elgfekjefhkeeigfelleefhfethfehfeetleeggeeggfefffdvtdenucffohhmrghinhep
    uggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:VYHIYCtSoRGdaB7q3yTk5mAQ4PE82Fzy4_lbhCEQcrAmRntAQzdxCg>
    <xmx:VYHIYKdiareRJEbbxHP6W57KmEkBUjfQXR90mCIcAIGOrUKeP7f_CQ>
    <xmx:VYHIYG2nyPGrlhYiZT68Y_jnoMWcC632_M1WQVPDdxAKOxcHlm_-AQ>
    <xmx:VYHIYBwBgwXXwpd6aoNoaabLtny97OcYeypna3uqCbGybjhG8gB2Hg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:30:41 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 2/9] dt-bindings: touchscreen: Initial commit of wacom,generic
Date:   Tue, 15 Jun 2021 20:30:07 +1000
Message-Id: <20210615103014.798-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103014.798-1-alistair@alistair23.me>
References: <20210615103014.798-1-alistair@alistair23.me>
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
index 000000000000..68f3f5271b77
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
+                compatible = "wacom,generic";
+                reg = <0x9>;
+                interrupt-parent = <&gpio1>;
+                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+                vdd-supply = <&reg_touch>;
+        };
+    };
-- 
2.31.1


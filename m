Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12C2363DB4
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 10:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhDSIjv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 04:39:51 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45923 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231687AbhDSIjv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 04:39:51 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id CAD455C00D6;
        Mon, 19 Apr 2021 04:39:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 19 Apr 2021 04:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=xa3UKf0PeGo+y
        c9OQD4iBkuA6ndOakmgwVIDpufF6mw=; b=B6YZ3PMQL3Yh8/blfMLlP1SVxUHIr
        GWvbPyIwxf25oVg1QwWOBF97vviagXVZXKqqo/Pp2R1fffWf0CdXct66OWCvhszf
        PyAM1WvmOjLhxcPlY+X6iI+2vVtHzBR2FiM84k6wee3rMS52GxXypNvvOnxNiH23
        3TiXU4B4ZfEUoJ3dBDzT1ZZaMIAx7FoePG1ZlxYnlgKOTOgh6Z2vXd6OeVRAGRNz
        EIKn7DoemWIuWAfEhGYpg3A1qieLSvgw4d4t+C/BETETl9hXK+MkYyuJvEtZvELo
        zjitpPkqNysl1ynTNG1PtQaHhi0GYI1kGRtCQtV6l/8PmnkNrEr/dZjVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=xa3UKf0PeGo+yc9OQD4iBkuA6ndOakmgwVIDpufF6mw=; b=IcNZtujq
        JNP4oYpE/4zzaziqie0HW5dpc+vxqZCQ69fVosBRYP/8HtPlKIW/OYM1BE5CjJa6
        xoPZCp8X+TJqjlPdOJNGhPdWx401iFpFtWIXv7ELaa6OFZLL4mCF4Xasr3X9M1o1
        tR+YT+Q8bTJffuYilcLlQVD67tjgTlVfQ8aC7fx7mUVPCLviT27QpRunrLPP4L5H
        vMr/JfaFZZyaxVNFivfWwR6QqfDm385bcy9phybDp6MHxrdtvLPRtpxclMMbXq+v
        qs1eaWLXNVQ4NXnlqUjdQZ2RZkwxd9ShyRUcS8bgGJNO5pCNPplhTawFCeqiExlM
        bzZzW+lutO6fwA==
X-ME-Sender: <xms:uUF9YKtEXHorRKMotjDA810nyMoOq1L98slYLpiJMwesgbqzLwR3pQ>
    <xme:uUF9YPf6lN6PlafOxvxy8rHRqWO0qEadb7pHqf5nGe5BrWHVzWB6a1zQ0W62alr2Q
    7j7PR62DC7dD3scdPY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpefftdfhgfeggf
    elgfekjefhkeeigfelleefhfethfehfeetleeggeeggfefffdvtdenucffohhmrghinhep
    uggvvhhitggvthhrvggvrdhorhhgnecukfhppeekledrgeegrddutddruddvfeenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:uUF9YFwd_SNUxq9UhUiBWYAw9CGHNdtvwoAbQhgoJ-8SY5zfwGKOFA>
    <xmx:uUF9YFOU2dhoGjFD1Rzh2HxPZbnwP0lPWXlotJV73fpk0D-yUu7Y4w>
    <xmx:uUF9YK99rsLdZTyOMmB7XuDYmVjQpf_RsEtfCftslEkwh6EL4MQ6lA>
    <xmx:uUF9YBZF2YqrZhzqqWcaoybOm5GrwqbszgLOleKvbKKXEcheM2aa7A>
Received: from ThinkpadX1Yoga3.localdomain (unknown [89.44.10.123])
        by mail.messagingengine.com (Postfix) with ESMTPA id F26D0108005B;
        Mon, 19 Apr 2021 04:39:18 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v5 2/9] dt-bindings: touchscreen: Initial commit of wacom,generic
Date:   Mon, 19 Apr 2021 07:00:57 +1000
Message-Id: <20210418210104.2876-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210418210104.2876-1-alistair@alistair23.me>
References: <20210418210104.2876-1-alistair@alistair23.me>
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
2.31.1


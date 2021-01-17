Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0ED92F964C
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730710AbhAQXm6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:42:58 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:39179 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729141AbhAQXm5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:42:57 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id C41B95C0118;
        Sun, 17 Jan 2021 18:42:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 17 Jan 2021 18:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=IHDkxQ/wXzXYg5tlkjGvzwAi4s
        qGXHDpW2TWqnbUQC8=; b=N/2JKFvwfVrR1+zmOudMx71BteEbJm/f1SRyiV6uH4
        159cPhZHitzS5x9/XmeOTOF4lpgxFpQZU89aGGyg5TBU2izEnaixzcqZDAL6Tl7G
        6UfH+/f9mfwNP6GCnyO4WXwAVeFEt3GRthPB7DEsMsowKLF0NoKWip8DHiWJ5t4T
        khET+Iv8g8D0yhD3jLcO4Y8nP2TndNxBKi/Qv9aYDBc2/7ojDxcqrUyfdhYH5nUo
        cIB6po3qRZ+hjKyerxoXxqIW4EKyQRS3RKwv7Bfg30FvhW/Jm/cBhssYoQqWHatf
        33qOFlObmWh2tQuPVNG91pcp5avreRlMGnVZLDz+i84A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IHDkxQ/wXzXYg5tlk
        jGvzwAi4sqGXHDpW2TWqnbUQC8=; b=YyRu1U3SvhlX1c5jTC40AGl2zuJjKZYTH
        YBb6+ZZXLWXC3n33VQOPK1J3UrVPALHOMyDLYU+vPFQrYNZ+ZRXzIw5SSItk7gTY
        6hrCz0Vb97QlCpJSlCvewyO0en+h4XPe2IaBV1UqSLlC72jNcue8Ap3nNzh15B4p
        U5LRvICEjLMu+dqdWU3S7IF1XhRAejzHRNxXBfGxr4+y35hmAUcQ++c6G7KS+psh
        URfcI7XfdADrZmU7QIs7yAMmvQt5CnDnZulb9iESzw9SXjRrncPQEeBCZguL040U
        MZs5foTHvryU/+VSS6j5YjlcNu4+ehyWAo76qI8ALyWGt9E+FlPCA==
X-ME-Sender: <xms:UssEYIuhTBjCkyovuv97jg8FJSFdlDZYR7YQdzZWdubx1ADE1yY_PA>
    <xme:UssEYFfG3e-SJI2IAdulrCDip2W3jCxYcyXHGHujS0VWYXlTPoulJP5bJYkZo4czx
    xsdRxpe2j-j0CCyDFs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepveeiueduhfevheetle
    dvgfeuhfejgfffieejhedttdffudfhheegjeefjeffleehnecuffhomhgrihhnpeguvghv
    ihgtvghtrhgvvgdrohhrghenucfkphepjeefrdelfedrkeegrddvtdeknecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegr
    lhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:UssEYDz1M6Or3aeuwFL5XtPWnFCzUd0FGnyCRFzHiG_NWQNIWxBtOA>
    <xmx:UssEYLO-posUJNmJnTwUd3gWobFT775olMEFEyQSdMbwDTkPq8zFSg>
    <xmx:UssEYI_Im4iCi3UBORkvZf3wIKS9fGixu_5qpZSGS8936gKaav1iQA>
    <xmx:UssEYHYyBnyc-W7jE8mEs8TDSbpjhad7E4OZglH8jcB1hGPoa1KHSQ>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8A892240057;
        Sun, 17 Jan 2021 18:42:09 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 1/3] devicetree/bindings: Initial commit of wacom,wacom-i2c
Date:   Sat, 16 Jan 2021 20:24:26 -0800
Message-Id: <20210117042428.1497-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../input/touchscreen/wacom,wacom-i2c.yaml    | 55 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
new file mode 100644
index 000000000000..6b0e0034f836
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
@@ -0,0 +1,55 @@
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
+  flip-tilt-x:
+  flip-tilt-y:
+  flip-pos-x:
+  flip-pos-y:
+  flip-distance:
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
+                flip-tilt-x;
+                flip-tilt-y;
+                flip-pos-x;
+                flip-pos-y;
+                flip-distance;
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


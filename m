Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDB33FAA4B
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234944AbhH2JUs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:20:48 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:52793 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234922AbhH2JUr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:20:47 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id BFE61580B0B;
        Sun, 29 Aug 2021 05:19:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 29 Aug 2021 05:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=DvmjdCZONqMiz
        RnpwfTpRqqlbDgDApz/FK5y2XJHk4w=; b=zpw12bevIa+Q+8rgj9ddnfivb/GcA
        tkc6tON0xoLmdeTQk/VZK0jTCvOr6MZxFRc7Ee37203NLUFHS4MItfiqA4WFYJPh
        LoAnB3JG4K88SxQVof1YSNm65KBjFJNgPvMQXVOkFUILr87rJug11+bGsf6XIf/0
        ADnYcqtt8LyfKo8Bc8xz3yLyRkrK81Ai5OVKO54ZhmogHhe6OzMs86UxuXr5HJJ/
        5PnPYWCddCNIWSORsK9YvO1wkmUXi4SASk7+NPjkIHIXZ88IbIak8RzZ2Jw66PVT
        gei9SFqazw57EaEzp45CL27ALTqzVwiujyz3j7WGDwQb2IIINQlMjpcfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=DvmjdCZONqMizRnpwfTpRqqlbDgDApz/FK5y2XJHk4w=; b=BWqh+Xj5
        SVr0YAL/nqrw8pNqrAqKu6xWTnB+usN9VmZjAvc54CXHLxgD0zP4MyBtPQN2rRAu
        v8x/SP/sbW2BDmVU7ZWTDpTK3TAMKLclAfYv7XgJgE6xuWGtFq8s7yaIGuceAEn0
        2Nik8muWeiLO7l0b/B/yhJMTyihjIzCI1UIUptjp0bDo9elcJK/qohJit5oBgF/D
        /gVWJEEY9II4xbmQh4r918UoX/Gyeoq9Mdj2uVqt3lHW4JzfebZa8CJ8+nli05Nb
        aoI4+V0CnOZ7vfrdUOvP00qae/Bckhh/GFHwIeQjDa9vPpLrW23jUg2Cl3vGnPSR
        d6L7PFwplMAF6g==
X-ME-Sender: <xms:O1ErYZ-tdtHN1yW_QlRhhSGx5KV4IoZ7yrbEVrNdtxDOiexch41I0w>
    <xme:O1ErYdviDgiUR0mHILzyl88oPs1vy6lHiRFmIhhygVQX-RIhj9407tJimfwuJF8zL
    kypKX04w0gtiSNVU00>
X-ME-Received: <xmr:O1ErYXCxa9EnyZJvkar1FdOpW7qu189VsY6LH4za-9XxiRXRY-MjCN-xwitSH61Xk07gkvAlous2AmKTr1sjLSLULxmBBsJcnz5_JCK5f8VR8Abtow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetlhhishht
    rghirhcuhfhrrghntghishcuoegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
    eqnecuggftrfgrthhtvghrnhepffdthffggefglefgkeejhfekiefgleelfefhtefhheef
    teelgeeggefgfeffvddtnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishht
    rghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:O1ErYdeYaOQ_xmrnCNmL0qTpl0iznJZ0OzZkMptanwKEUb9HbDPHTg>
    <xmx:O1ErYeMBUs78jkULP4_8H5aBS9Iw4eIwXMI9QtpSeWa7vgv0afZmtg>
    <xmx:O1ErYflbx57vWWS7PpMoA2JI4y_-y9hbWn-UIRVaHimoZJNaMSjxVQ>
    <xmx:O1ErYampkm2GHfd5T-4VhwhIbUsfLrAy_FWArD54jEaS8it8QSD5dw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:19:51 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 02/12] dt-bindings: touchscreen: Initial commit of wacom,i2c
Date:   Sun, 29 Aug 2021 19:19:15 +1000
Message-Id: <20210829091925.190-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
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


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3158E504604
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 04:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbiDQCTN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Apr 2022 22:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbiDQCTM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Apr 2022 22:19:12 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13008366A3;
        Sat, 16 Apr 2022 19:16:37 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 8B0715C015A;
        Sat, 16 Apr 2022 22:16:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 16 Apr 2022 22:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1650161796; x=1650248196; bh=Hy
        b4BOTswigS93bRPQsHh0BqrAvE3cAo4PvHZ+aba4o=; b=JhFeC6hwLM8d3CGMib
        XJX4BI+o440efF/kZgkiNzoav2Hu6JqP0O8BKvE8NvnCoFDCfx8EY5Q48Ha+qXMN
        crABKbkw8wTat7AEwsmpixeH99L4qC7tKa1jBSPf4ZjDaU1PV0XU78oQnGnfktvP
        qtY7wFxeyte4x93CWBVGFipQumVU0zGKNmvyRiNAPoP0STGLSntCgi+G2G2Gj8uP
        l1HSSUi+CzKO5VC/0r9Uxn75C/joXejOyQvvBwq/o+STMMAHxL2hJu0D4ZPB6l6A
        pZYb9O+qdpwj+M8x/JOpBRDSZDNR70NC94L0JRJ7uU6Nd3crsmZ/8HZremmfdA9C
        P2ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1650161796; x=1650248196; bh=Hyb4BOTswigS93bRPQsHh0BqrAvE3cAo4Pv
        HZ+aba4o=; b=jlRKm7qdE2JqKshYBn+9uFavzuEzB/GLlupJ98OULNCLUN1ARux
        q/rQaDVYLRN5me8anbE5oPVaQ0P4Gi+zk8/iRPHCtajvBBsvb4tCD33+OJQthnUl
        XMPZkIshujD4tiFGb3NFUrBNJoW070kx/FetSYtwfRH8cGbQBfjQTc8SoPrWhOxY
        JPFZgFkw5Nxv43qnpVq87NMgHaXbygeppuQwNpD6UzLo22GOZtQF1O/2p8kHIFOG
        0edBQkgXT2tPTH1MbhAZnNW7Yv00NlDfZK7AJEnAP1bHC7ik0s9G4qVg0Jd8yt78
        nLAjQruk3ix5ZhZcoQWgb7vO9PAKU/juVxw==
X-ME-Sender: <xms:hHhbYj1b3p1Ikv8XgfBS7mvXiyGAxwia02yMLEb_iSGW-EFrtgZxFA>
    <xme:hHhbYiHD10f88LjcvBhENyCcVb7yPru0XJOqD4tJABAFj1Yj2qszH8RTmE88YObG3
    dPDhuP2hw1WKcL5_w>
X-ME-Received: <xmr:hHhbYj4T-ueQQDVpN2Lnxp9Yzkyt0xHkbCI3XJBIOHONzK7KV4Pz8H2vYU6Mxr3rGrpZQCek7GTVsnQ-_P3NWs4Yy53dGbLjFwzQmoztRKNuBMPnuvnqN1d9VVNHn546ys9oTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelkedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeelueelgeettdfggfeuffevkefhuddtteeigfevhfdtffdtjefgteeg
    leeggedvudenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhho
    lhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:hHhbYo1Rzzg0vssJPIWvgELSAsLKC6ll-2v38IjlC9RANRn3IMLFrg>
    <xmx:hHhbYmEryiMwv0Ch8ugvm5UYTuyZ5nNienhZ2TFJBV6xRNGnVixhWw>
    <xmx:hHhbYp86YHxc27OpAkJw8o46C9DIc0wPrBJ3f0RGYqOI2-YDwTfWqw>
    <xmx:hHhbYr4JPbX52-VbTroIzh894BbvcFcLre0sPggZxYfHNERkNwegSw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Apr 2022 22:16:35 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <x@xff.cz>,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 1/4] dt-bindings: input: Add the PinePhone keyboard binding
Date:   Sat, 16 Apr 2022 21:16:29 -0500
Message-Id: <20220417021633.56127-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220417021633.56127-1-samuel@sholland.org>
References: <20220417021633.56127-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add devicetree support for the PinePhone keyboard case, which provides a
matrix keyboard interface and a proxied I2C bus.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Drop keymap DT properties
 - Add vbat-supply property

 .../input/pine64,pinephone-keyboard.yaml      | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml b/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
new file mode 100644
index 000000000000..0732bd2dab9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/pine64,pinephone-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pine64 PinePhone keyboard device tree bindings
+
+maintainers:
+  - Samuel Holland <samuel@sholland.org>
+
+description:
+  A keyboard accessory is available for the Pine64 PinePhone and PinePhone Pro.
+  It connects via I2C, providing a raw scan matrix, a flashing interface, and a
+  subordinate I2C bus for communication with a battery charger IC.
+
+properties:
+  compatible:
+    const: pine64,pinephone-keyboard
+
+  reg:
+    const: 0x15
+
+  interrupts:
+    maxItems: 1
+
+  vbat-supply:
+    description: Supply for the keyboard MCU
+
+  wakeup-source: true
+
+  i2c-bus:
+    $ref: /schemas/i2c/i2c-controller.yaml#
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
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      keyboard@15 {
+        compatible = "pine64,pinephone-keyboard";
+        reg = <0x15>;
+        interrupt-parent = <&r_pio>;
+        interrupts = <0 12 IRQ_TYPE_EDGE_FALLING>; /* PL12 */
+
+        i2c-bus {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          charger@75 {
+            reg = <0x75>;
+          };
+        };
+      };
+    };
-- 
2.35.1


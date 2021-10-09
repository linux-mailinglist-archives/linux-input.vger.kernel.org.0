Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07671427923
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 12:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbhJIKwB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 06:52:01 -0400
Received: from ixit.cz ([94.230.151.217]:41708 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231718AbhJIKwA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 06:52:00 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 5643C236BE;
        Sat,  9 Oct 2021 12:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633776602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=pXtBP44GOWMz1wPbaqa7bXoz0JlEqPT/QbX93YFXbbY=;
        b=KzJszMlAqkc4HZOVO1hgfQp8ZCaGDWBAfsxHUsXpnb8NXIHqyN2H/LcZyUMZ2nQZE3JoZW
        vJHAZlbdlEqeXdU582qXtYi/5hjhwhs6TcPwzZhoCqNC+JPmiWpylmqRUQGAZBy9MDNTw6
        ggD9+hTiFrm/9OUXJhNOIw37tuKBgdM=
From:   David Heidelberg <david@ixit.cz>
To:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH] dt-bindings: input: mcs-touchkey: Convert txt bindings to yaml
Date:   Sat,  9 Oct 2021 12:48:37 +0200
Message-Id: <20211009104837.46626-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert MELFAS MCS-5000 touchscreen controller chip documentation to the YAML format.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/input/mcs-touchkey.txt           | 26 ---------
 .../bindings/input/mcs-touchkey.yaml          | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/mcs-touchkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/mcs-touchkey.yaml

diff --git a/Documentation/devicetree/bindings/input/mcs-touchkey.txt b/Documentation/devicetree/bindings/input/mcs-touchkey.txt
deleted file mode 100644
index 545454112a43..000000000000
--- a/Documentation/devicetree/bindings/input/mcs-touchkey.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* mcs_touchkey MELFAS MCS5000/5080 controller
-
-Required properties:
-- compatible: must be "mcs5000_touchkey" or "mcs5080_touchkey"
-- reg : I2C address of the chip
-- interrupts: interrupt to which the chop is connected
-- key_maxval: size of keycode table
-- interrupts: interrupt to which the chip is connected
-- code: key code for this device
-
-Example:
-
-	i2c_touch_key: i2c-gpio-0 {
-	       /* ... */
-
-	       touch_key@20 {
-		       compatible = "mcs5080_touchkey";
-		       reg = <0x20>;
-		       interrupt-patrent = <gpj0>;
-		       key_maxval = <2>;
-		       linux, code = <0x0000009e
-			              0x000000a9>;
-	       };
-
-	       /* ... */
-	};
diff --git a/Documentation/devicetree/bindings/input/mcs-touchkey.yaml b/Documentation/devicetree/bindings/input/mcs-touchkey.yaml
new file mode 100644
index 000000000000..b56de0361ff8
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mcs-touchkey.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/mcs-touchkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MELFAS MCS5000/5080 controller
+
+maintainers:
+  - Rob Herring <robh+dt@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - mcs5000_touchkey
+      - mcs5080_touchkey
+
+  reg: true
+  interrupts: true
+  key_maxval:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: size of keycode table
+
+  linux,code:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: key code for this device
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - linux,code
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/tegra-gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c_touch_key: i2c-gpio-0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      melfas-touchkey@20 {
+        compatible = "mcs5080_touchkey";
+        reg = <0x20>;
+        interrupt-parent = <&gpio>;
+        interrupts = <TEGRA_GPIO(Q, 4) IRQ_TYPE_EDGE_FALLING>;
+        key_maxval = <4>;
+        linux,code = <139 102 158 217>;
+      };
+    };
-- 
2.33.0


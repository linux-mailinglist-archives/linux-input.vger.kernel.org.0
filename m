Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349032B5884
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 04:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgKQDuL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Nov 2020 22:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKQDuL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Nov 2020 22:50:11 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6745BC0613CF;
        Mon, 16 Nov 2020 19:50:11 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id b3so9477338pls.11;
        Mon, 16 Nov 2020 19:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXJeoQa4s7g1MwyfhCZli50VoayCAnEhKM+qcbalg9Y=;
        b=vIFevC2XO06qkIlTI4jqdKDJMDA+zD5XAc8YosFdAXrIPbe5/Uy2spKHVWINk/cGWa
         BtnV3fP1UeedDTStrTJTKVfzcjeS8smbIqDD6qZQmx3haTjwq8xgAfRYuZ1J9Lrkouuf
         63KGKVo8Xo2lKNjHpN5zvxgs8R2tP0aLuCa/506KlvJPF7LL27Lo5NPNzLcy5ytn58gz
         h4sxPYq3q5xa5Qffh7MIstKjo0YleKw5TlVnnR3QvNnBEmGZFgxgn+tfOU0zOPhqkmbK
         4hSfiin0OURCgJsn3EVf2ihC+oKz1HEm5ouGYe0Vs/rcbB5A+zPhA7rUOEUzQ8kTb4sO
         nzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXJeoQa4s7g1MwyfhCZli50VoayCAnEhKM+qcbalg9Y=;
        b=C3aI8/BY2dFFgozE/xZX5VCLS6Po2DLdfUiAMACW8vV7F5bRFgAxe4McXVaow7nIOR
         MTxrC5fMx845Yr7WyvJC/xKcLLV3Sl1uq2h5lXo6Xyisf/a8KAOGNSuP04G2bWkMtZNE
         6kIz2cE6iYRqtwrBWI9RXKOKE0bojS8SnARvf/SXBBbTAGJuJOnqJS58Ju1hqp435I+s
         E1EV5wQ09rjqzLk8SKGHdNxdYcN0pj9XLgr0K+9+mqceIZZRnDv3dPSqxhFjVH7vuxTQ
         0ZDjrG5eLYSpunLT4VJ+lhSeh2bl7QRYMXzOrdC/GPIgvLs5+92lsu/vxTFZiYoZa9/1
         TWFw==
X-Gm-Message-State: AOAM532YuIPoANHv2a0F5DIUeo10s9OsDwlkRg23bbdU4YlaDUrAR3p0
        p43elqvpDFcMJ9XyTCDw2Qg=
X-Google-Smtp-Source: ABdhPJywn79/YJbJTwkzO5o4Cxm1e/CRrHtpplCWgXL4IRq4V8k6GGM6M359Ogoe/jr0IbyDDybRTQ==
X-Received: by 2002:a17:902:8685:b029:d7:bb:aa2 with SMTP id g5-20020a1709028685b02900d700bb0aa2mr15479119plo.13.1605585011006;
        Mon, 16 Nov 2020 19:50:11 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id u24sm19602329pfm.51.2020.11.16.19.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 19:50:10 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Nemo Han <nemo.han@unisoc.com>
Subject: [PATCH v2 2/3] dt-bindings: input: Convert sc27xx-vibra.txt to json-schema
Date:   Tue, 17 Nov 2020 11:49:48 +0800
Message-Id: <20201117034949.47877-3-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117034949.47877-1-zhang.lyra@gmail.com>
References: <20201117034949.47877-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

Convert the sprd sc27xx vibrator binding to DT schema using json-schema.

Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 .../bindings/input/sprd,sc27xx-vibra.txt      | 23 ----------
 .../bindings/input/sprd,sc27xx-vibrator.yaml  | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
 create mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml

diff --git a/Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt b/Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
deleted file mode 100644
index f2ec0d4f2dff..000000000000
--- a/Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Spreadtrum SC27xx PMIC Vibrator
-
-Required properties:
-- compatible: should be "sprd,sc2731-vibrator".
-- reg: address of vibrator control register.
-
-Example :
-
-	sc2731_pmic: pmic@0 {
-		compatible = "sprd,sc2731";
-		reg = <0>;
-		spi-max-frequency = <26000000>;
-		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vibrator@eb4 {
-			compatible = "sprd,sc2731-vibrator";
-			reg = <0xeb4>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml b/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
new file mode 100644
index 000000000000..b8a3f23ee3dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2020 Unisoc Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/sprd,sc27xx-vibrator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spreadtrum SC27xx PMIC Vibrator Device Tree Bindings
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - sprd,sc2731-vibrator
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    sc2731_pmic: pmic@0 {
+      compatible = "sprd,sc2731";
+      reg = <0 0>;
+      spi-max-frequency = <26000000>;
+      interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      vibrator@eb4 {
+        compatible = "sprd,sc2731-vibrator";
+        reg = <0xeb4>;
+      };
+    };
-- 
2.25.1


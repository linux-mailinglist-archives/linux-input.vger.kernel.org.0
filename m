Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99BD1AE6E3
	for <lists+linux-input@lfdr.de>; Fri, 17 Apr 2020 22:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgDQUnS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Apr 2020 16:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgDQUnR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Apr 2020 16:43:17 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C8CC061A0F
        for <linux-input@vger.kernel.org>; Fri, 17 Apr 2020 13:43:17 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q19so3400605ljp.9
        for <linux-input@vger.kernel.org>; Fri, 17 Apr 2020 13:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bx7G3DGSlFM78EsVg2jPdt/+5qpi6YpaV1U7u7qwwXg=;
        b=egNkywzutE2lTGuU4HwCFnMahSbqSs3ZzQDJAFiHr0wZ7hfbD1FCHr4+K6fKx74C+u
         7+p1UwTHiHfcnWVYDhg1Ah0O5DmP/MrmJC3xFhVG+A3M8FDx+dGGa8p2wRN7riBk9nBW
         XVkA/ErUb+b0vnJAWiKg1Vjw3rC0X5Fce+AIpKTo6Tid+t7zF9W9IoJZMa0dxgtZ0JNn
         GyIZBqYN7pvrAgc1GBe38W7adOUJiWcqT16856I3NJwdg1HMMB8EnLSZ/l+p8abK4VNU
         rEAPXOOPZ3iEuT8ZpGZqO5L8ZOvX85T3h2Zztqn3bgTFc8EbeqXIBIhMSxKAWPeXIA2Y
         yaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bx7G3DGSlFM78EsVg2jPdt/+5qpi6YpaV1U7u7qwwXg=;
        b=LtxqYFiinuT44cPHvK3uJSmYKtMQBxciX1A2W8FOejfZEyXX1W+0UGoEnXrgU0sx3t
         a3Zp+rP8RnaKRgioFphhW3SNUCVcUtzAcTGz4GnvaRuQqYAJqTDYpCV21Fy5aFnJ/d2E
         mPups5CsBsG1RuRzQRQx9EXwUG/5qgNsQL9PY+HQ3+VkmIFdMQ1zY4ZWAyrxiWfV875F
         pr0ANykta9W0khjtE03DuXDyHTZOuDmDgmrFxwTSLVvEOgjeHedALs2J3aPrK+RsY6ws
         PY/DNqvMnGHqlzHAnVFGPX4aYOVgS6W2iOuz6Q3Hgb1TrIkW+M7VjZEMkYOf0t+4Eglg
         5IAQ==
X-Gm-Message-State: AGi0PuZl9KQ16E1LBtCxh9VvoxCcfsv/VA37qwKqERf1/elxzLjR7T+E
        J8zCRtAycO3Ub8/Rt2/mSFTvmA==
X-Google-Smtp-Source: APiQypL6wF6JLZj/qU/1iAWJGDaLwwfBuRTAGBdBQlTC29MSAq6TGftzTrbj9yEnUbH+aBqshKnMZw==
X-Received: by 2002:a2e:8017:: with SMTP id j23mr2946812ljg.22.1587156195392;
        Fri, 17 Apr 2020 13:43:15 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id a8sm1435365ljb.64.2020.04.17.13.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 13:43:14 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2 v4] dt-bindings: touchscreen: Add CY8CTMA140 bindings
Date:   Fri, 17 Apr 2020 22:43:11 +0200
Message-Id: <20200417204312.13453-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds device tree bindings for the Cypress CY8CTMA140
touchscreen.

Cc: devicetree@vger.kernel.org
Cc: Henrik Rydberg <rydberg@bitmath.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v4:
- Drop the description of 'reg', it's surplus.
- Set the I2C frequency to the span 100k to 400k instead
  of hardcoding 400k.
- Collect Rob's review tag.
---
 .../input/touchscreen/cypress,cy8ctma140.yaml | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
new file mode 100644
index 000000000000..fda64243dc6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/cypress,cy8ctma140.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress CY8CTMA140 series touchscreen controller bindings
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: cypress,cy8ctma140
+
+  reg:
+    const: 0x20
+
+  clock-frequency:
+    description: I2C client clock frequency, defined for host
+    minimum: 100000
+    maximum: 400000
+
+  interrupts:
+    maxItems: 1
+
+  vcpin-supply:
+    description: Analog power supply regulator on VCPIN pin
+
+  vdd-supply:
+    description: Digital power supply regulator on VDD pin
+
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+  touchscreen-max-pressure: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - touchscreen-size-x
+  - touchscreen-size-y
+  - touchscreen-max-pressure
+
+examples:
+- |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c@00000000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@20 {
+        compatible = "cypress,cy8ctma140";
+        reg = <0x20>;
+        touchscreen-size-x = <480>;
+        touchscreen-size-y = <800>;
+        touchscreen-max-pressure = <255>;
+        interrupt-parent = <&gpio6>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        vdd-supply = <&ab8500_ldo_aux2_reg>;
+        vcpin-supply = <&ab8500_ldo_aux2_reg>;
+      };
+    };
+
+...
-- 
2.21.1


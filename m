Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FB334F1FE
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 22:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhC3UMy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 16:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232118AbhC3UMk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 16:12:40 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FA2C061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 13:12:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o126so25706446lfa.0
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+bQAyUbHZezo5Tam5Z33+uMQ576wTWKAVOntw8JLrNs=;
        b=VjSNyZ//FyUXZYEMNtcGFl810NcGi66Yfmv7C4GxC4KH+yc27VeS0cndAG7hJZ0bQO
         6K80L1P3efxJkyuCKG2mNO5ZSbWB9Hmnfnj1XrOSigpFGvxoBqlEqvlCWPRhp1DKWe5P
         /XfPF0BNfq7xU5JCbyNkYyfSJ4R7GIhTB/BvpOMgya1jFkdXvbqGEeNO7RI+AgjrA87j
         zYZROKrnUtjPNUA7ewwhBCl4wLrY1S+u+c6kkasPX6TkOC6QKWY1Jyi65FPCSmOnFdCG
         f0ahL/PmCBMUuyWDViUXB14yCrAIErTCG70iWU846r8O8/ipYsOeKb6dShLsped9jfkm
         VLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+bQAyUbHZezo5Tam5Z33+uMQ576wTWKAVOntw8JLrNs=;
        b=IGWBVNb/5AUPokn7h1InoRnozDM+C6LGRjpRv6CiLsWLQEuliq/iHJtV4UEkQ3H+wa
         JBSB0dCzRQBHsgb84nsmN9/c9+933TxzUNNKXak9alWFF0vsufsf/RPMd963KfRQrTPf
         7Uk8NUsvoN1iPVTCRJIf/DRSVeapFCqOqLLU4h6nZ7EewrSN5aIzDdh/b6LbD6Flcobn
         D2iuZ0OwQXpEJPbUGYRl0X1zfX1gtZql/I36a0fiItcQ7eCje9bdZSS4URG2pfUNqd/I
         2C2ml/4zqpx1VKOq1O667Y/8cU+riFIj1Bv9t2+HR+G69L7mZPnaxQ3mSrmd84RvtoXL
         Co5g==
X-Gm-Message-State: AOAM531KNp434ZZW9riwi2SrYw7sSrM8Mcww+7636QrMBQv720oWXHD3
        iutASXfLk+gjg8+M/b2ttBRpBZYaFMKW7yii
X-Google-Smtp-Source: ABdhPJzF3z0HGqwBQ+G1msE66b6K8cSXUhjWSAGNljfATwAF4ezDqKoVZq5eqNnSCoorlJDNNNlGlQ==
X-Received: by 2002:a05:6512:62:: with SMTP id i2mr20556428lfo.631.1617135157698;
        Tue, 30 Mar 2021 13:12:37 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id p2sm290316lfg.116.2021.03.30.13.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 13:12:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Simon Shields <simon@lineageos.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] Input: mms114 - Convert bindings to YAML and extend
Date:   Tue, 30 Mar 2021 22:12:33 +0200
Message-Id: <20210330201233.2360006-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This converts the Melfas MMS114 bindings and extend like this:

- Require nodename touchscreen@ (this seems to be the case for
  all in-tree DTS files)
- Add the mms134s and mms136 compatibles
- Add the avdd and vdd power supplies
- Define the I2C clock frequency property

Cc: devicetree@vger.kernel.org
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Simon Shields <simon@lineageos.org>
Cc: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../input/touchscreen/melfas,mms114.yaml      | 87 +++++++++++++++++++
 .../bindings/input/touchscreen/mms114.txt     | 42 ---------
 2 files changed, 87 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mms114.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/mms114.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mms114.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mms114.yaml
new file mode 100644
index 000000000000..62366886fb3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mms114.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/melfas,mms114.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Melfas MMS114 family touchscreen controller bindings
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  $nodename:
+    pattern: "^touchscreen(@.*)?$"
+
+  compatible:
+    items:
+      - enum:
+          - melfas,mms114
+          - melfas,mms134s
+          - melfas,mms136
+          - melfas,mms152
+          - melfas,mms345l
+
+  reg:
+    description: I2C address
+
+  clock-frequency:
+    description: I2C client clock frequency, defined for host
+    minimum: 100000
+    maximum: 400000
+
+  interrupts:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply regulator on AVDD pin
+
+  vdd-supply:
+    description: Digital power supply regulator on VDD pin
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-fuzz-x: true
+  touchscreen-fuzz-y: true
+  touchscreen-fuzz-pressure: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
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
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@48 {
+        compatible = "melfas,mms114";
+        reg = <0x48>;
+        interrupt-parent = <&gpio>;
+        interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
+        avdd-supply = <&ldo1_reg>;
+        vdd-supply = <&ldo2_reg>;
+        touchscreen-size-x = <720>;
+        touchscreen-size-y = <1280>;
+        touchscreen-fuzz-x = <10>;
+        touchscreen-fuzz-y = <10>;
+        touchscreen-fuzz-pressure = <10>;
+        touchscreen-inverted-x;
+        touchscreen-inverted-y;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt b/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
deleted file mode 100644
index 707234cfd7e6..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* MELFAS MMS114/MMS152/MMS345L touchscreen controller
-
-Required properties:
-- compatible: should be one of:
-	- "melfas,mms114"
-	- "melfas,mms152"
-	- "melfas,mms345l"
-- reg: I2C address of the chip
-- interrupts: interrupt to which the chip is connected
-- touchscreen-size-x: See [1]
-- touchscreen-size-y: See [1]
-
-Optional properties:
-- touchscreen-fuzz-x: See [1]
-- touchscreen-fuzz-y: See [1]
-- touchscreen-fuzz-pressure: See [1]
-- touchscreen-inverted-x: See [1]
-- touchscreen-inverted-y: See [1]
-- touchscreen-swapped-x-y: See [1]
-
-[1]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
-
-Example:
-
-	i2c@00000000 {
-		/* ... */
-
-		touchscreen@48 {
-			compatible = "melfas,mms114";
-			reg = <0x48>;
-			interrupts = <39 0>;
-			touchscreen-size-x = <720>;
-			touchscreen-size-y = <1280>;
-			touchscreen-fuzz-x = <10>;
-			touchscreen-fuzz-y = <10>;
-			touchscreen-fuzz-pressure = <10>;
-			touchscreen-inverted-x;
-			touchscreen-inverted-y;
-		};
-
-		/* ... */
-	};
-- 
2.29.2


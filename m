Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266ED631219
	for <lists+linux-input@lfdr.de>; Sun, 20 Nov 2022 02:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiKTBWA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Nov 2022 20:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiKTBV7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Nov 2022 20:21:59 -0500
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F03B6B20;
        Sat, 19 Nov 2022 17:21:57 -0800 (PST)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-13bd19c3b68so10162815fac.7;
        Sat, 19 Nov 2022 17:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HS+CfYox7ld6+b2/m9ST36+4P+3OQ4EfiKHVDdYhrA=;
        b=agx4J5BmC6z1crsZDXUGsUeaCSjPpReKTEdjAbryGghhU+2b07IEgol7fPcGM/6Wi+
         ZH2hY2bXaEHQ/ZiCRBCknKlHW52A/Fba4R7OHklPCJb0S+2OhAOFz/ugNNFYSvPmIAho
         IyoWlaTFitotzyD1CNBnqtgd5HQpCW7urxVKfCEiMoP9oCiRZ6YFcK8n2BHe/aPdIUq3
         bPs0t+hIsrAwlVNp2G8FUX2Gv+USj0G31NhC2/bM7cQ1GzAgSbTz/Tqt2+MOV0egaaIS
         6LuVRf3uIhVcNIM0dH4xYH8HxHGdGW7Ao8GXA4thjpOzVmJPZF4dXiJms5hjnk9KxoN8
         UAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HS+CfYox7ld6+b2/m9ST36+4P+3OQ4EfiKHVDdYhrA=;
        b=s/oaHm1HNeiyXyR5cow3rEB6rR7xMmoKCA3AwJAmK8n6yXpPLXt3bRU1WxXz0MNxMT
         ImBqasOiljlrqqS4fGFL3DVevLKNGsRXqQ900JglqFdLF/wPZR4r2pAwx8QZrFe05TcC
         pzYTx6Q5O1O4b5ZfO00n6Hv7+C36H6j9+1eboyJgvi6oAf/GDgNOoK/nH9kkRoI0SiEj
         J9W6l6lA1S3nKxMpQcmlZE1OcXQ/bZPOUl1MtsrRuO1Ic9c2TxnywGYQ97HUFDbxdLfK
         PDnRBl65PKFdhqV+IRD4zIMFZWklTYMABbfllCE9p+ynJXve7jqw23Gv0kaErxJhJY+o
         KiSA==
X-Gm-Message-State: ANoB5pmSA+RQUU20nMCk5TSUCnHr2+qwqVDAf9KKkGi2Nz1WErJwMlLl
        WWLica0kcShK2JWY/X9e5VA=
X-Google-Smtp-Source: AA0mqf4u5nVfhqn1A5b7kAP+RrtRWjUR+1pInZ/TDdDd0McqCSBXNw0Mc0a0SssJjWoyNquhHYhXHw==
X-Received: by 2002:a05:6870:d784:b0:13a:ec33:4ed with SMTP id bd4-20020a056870d78400b0013aec3304edmr1228418oab.56.1668907316977;
        Sat, 19 Nov 2022 17:21:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:2f06:7c46:ee05:7e79])
        by smtp.gmail.com with ESMTPSA id t21-20020a056870f21500b0010d7242b623sm4146472oao.21.2022.11.19.17.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 17:21:56 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: input: gpio-beeper: Convert to yaml schema
Date:   Sat, 19 Nov 2022 22:21:35 -0300
Message-Id: <20221120012135.2085631-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

Convert the bindings from plain text to yaml schema.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/input/gpio-beeper.txt | 13 --------
 .../bindings/input/gpio-beeper.yaml           | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-beeper.txt
 create mode 100644 Documentation/devicetree/bindings/input/gpio-beeper.yaml

diff --git a/Documentation/devicetree/bindings/input/gpio-beeper.txt b/Documentation/devicetree/bindings/input/gpio-beeper.txt
deleted file mode 100644
index a5086e37fce6..000000000000
--- a/Documentation/devicetree/bindings/input/gpio-beeper.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-* GPIO beeper device tree bindings
-
-Register a beeper connected to GPIO pin.
-
-Required properties:
-- compatible:	Should be "gpio-beeper".
-- gpios:	From common gpio binding; gpio connection to beeper enable pin.
-
-Example:
-	beeper: beeper {
-		compatible = "gpio-beeper";
-		gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/input/gpio-beeper.yaml b/Documentation/devicetree/bindings/input/gpio-beeper.yaml
new file mode 100644
index 000000000000..5fd57a8940df
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-beeper.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/gpio-beeper.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO controlled beeper
+
+maintainers:
+  - Fabio Estevam <festevam@denx.de>
+
+properties:
+  compatible:
+    const: gpio-beeper
+
+  gpios:
+    maxItems: 1
+    description:
+      GPIO that drives the beeper.
+
+required:
+  - compatible
+  - gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    beeper {
+        compatible = "gpio-beeper";
+        gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.25.1


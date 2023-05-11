Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403056FEFDD
	for <lists+linux-input@lfdr.de>; Thu, 11 May 2023 12:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237807AbjEKK0H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 May 2023 06:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjEKK0G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 May 2023 06:26:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8C1E5A
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 03:26:04 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bc3a2d333so12739539a12.0
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 03:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683800763; x=1686392763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ah9vrmwXkmgBXYxu0weg0/evB6b5zH+I5OTrqcCotE4=;
        b=rXxX/EZCr13k7OrOt467ssxzf2X9J/TlPGkcCk2Lmi0YzVGXnItA9qzHiPDqRgxckk
         E1BYRXPqAWPpFm1HwrGrxurvp+kh0C6JZW4HX2sq+x2TdsC6CFqxz69Cy8TSci0pCaQ3
         A5/R4DglPc6NLnrLlYl47Xk2akLwGXB1UXYCzUmewAicNFBn5vYjkIZlt1pJ+C8q98xc
         Mv19Of4l4dBD4jrMFTWIJF1CrnVFCU5xZ8zKHvMbhr0Yckl0LgofYNw+Qvq2jVC3luJf
         mdPRcUIHRV8zegspfQF8GwAhWcuX1eJFobzfVazRVG8GzRQsxLaRgjVTcbPEaEYQBczC
         sllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683800763; x=1686392763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ah9vrmwXkmgBXYxu0weg0/evB6b5zH+I5OTrqcCotE4=;
        b=g9hyFQPMBMz0v+EAjDTiUMfh7scwemm+ZA+bBCu3Uhd0XF02tZpfobptL6zbPDLn3c
         ++KO7rKYvUR4Im65vax/1PA6hYIvnk0UvkiIOuYjEcS02c+9hLc1fy/xG+wo1jrKA+xB
         PKCfRq1E1je+jqIy9fFufu3NX1N3q4b3KVm23WnrbAEGmW+DxUs91XtjXMxQWiYg/0Fo
         /+3QhgVT48rKmkgF19/H0obudpyHGGzLUYvkAjmJQSlWRQeP8IQ6R+DxTiW/En/QoynR
         mD8pIpZ1h4xey0n4/o0J2BgVAW6JFK4fQLuy9LqQUSrWnOw/EXcXyf0JIf1O0InD/WSR
         fY2A==
X-Gm-Message-State: AC+VfDwdpw5NqmE/BKNR4PZ1JuyB9hmolaNiWiNiOF1QI36XbXfbV5/Q
        WG26nbp/36/nUrNZac34xmWxnw==
X-Google-Smtp-Source: ACHHUZ6v0q0rkYOVzfy1x5Zv7HMvJ0TR86ZQeUQKPw/eThfnEv2XBPqTzZdzQPuVsKkt4nRhZYtWTA==
X-Received: by 2002:a05:6402:1056:b0:506:86aa:78ed with SMTP id e22-20020a056402105600b0050686aa78edmr17255596edu.20.1683800762902;
        Thu, 11 May 2023 03:26:02 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:41e7:1b68:d38e:1348])
        by smtp.gmail.com with ESMTPSA id d5-20020a50fe85000000b004fbf6b35a56sm2894642edt.76.2023.05.11.03.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 03:26:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH] dt-bindings: input: cypress,cyapa: convert to dtschema
Date:   Thu, 11 May 2023 12:25:59 +0200
Message-Id: <20230511102559.175088-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the Cypress All Points Addressable (APA) I2C Touchpad / Trackpad
bindings to DT schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/input/cypress,cyapa.txt          | 42 ----------------
 .../bindings/input/cypress,cyapa.yaml         | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cypress,cyapa.txt
 create mode 100644 Documentation/devicetree/bindings/input/cypress,cyapa.yaml

diff --git a/Documentation/devicetree/bindings/input/cypress,cyapa.txt b/Documentation/devicetree/bindings/input/cypress,cyapa.txt
deleted file mode 100644
index d3db65916a36..000000000000
--- a/Documentation/devicetree/bindings/input/cypress,cyapa.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Cypress I2C Touchpad
-
-Required properties:
-- compatible: must be "cypress,cyapa".
-- reg: I2C address of the chip.
-- interrupts: interrupt to which the chip is connected (see interrupt
-	binding[0]).
-
-Optional properties:
-- wakeup-source: touchpad can be used as a wakeup source.
-- pinctrl-names: should be "default" (see pinctrl binding [1]).
-- pinctrl-0: a phandle pointing to the pin settings for the device (see
-	pinctrl binding [1]).
-- vcc-supply: a phandle for the regulator supplying 3.3V power.
-
-[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-[1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-Example:
-	&i2c0 {
-		/* ... */
-
-		/* Cypress Gen3 touchpad */
-		touchpad@67 {
-			compatible = "cypress,cyapa";
-			reg = <0x67>;
-			interrupt-parent = <&gpio>;
-			interrupts = <2 IRQ_TYPE_EDGE_FALLING>;	/* GPIO 2 */
-			wakeup-source;
-		};
-
-		/* Cypress Gen5 and later touchpad */
-		touchpad@24 {
-			compatible = "cypress,cyapa";
-			reg = <0x24>;
-			interrupt-parent = <&gpio>;
-			interrupts = <2 IRQ_TYPE_EDGE_FALLING>;	/* GPIO 2 */
-			wakeup-source;
-		};
-
-		/* ... */
-	};
diff --git a/Documentation/devicetree/bindings/input/cypress,cyapa.yaml b/Documentation/devicetree/bindings/input/cypress,cyapa.yaml
new file mode 100644
index 000000000000..29515151abe9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cypress,cyapa.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/cypress,cyapa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress All Points Addressable (APA) I2C Touchpad / Trackpad
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+properties:
+  compatible:
+    const: cypress,cyapa
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  vcc-supply:
+    description: 3.3V power
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        trackpad@67 {
+            reg = <0x67>;
+            compatible = "cypress,cyapa";
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-parent = <&gpx1>;
+            wakeup-source;
+        };
+    };
-- 
2.34.1


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA0F7B18DD
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjI1LDR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjI1LDQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:16 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4AA195
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50308217223so20319996e87.3
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898991; x=1696503791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDJFiJgRqRQBXlrZBTgPGvpZ3gtef6On4wWBMux75So=;
        b=N/kLnzPuxGXDvHm3fDX+vAF6hkZMXxd8zrFKvQLHAOZWlJT2h1R6IOC9z02RSerBpw
         CmxNDW1Kt/n0ej1PAhm9HtuzRP4f5gHHOjkuKYGzxl7uNKgoMbKZwqwh0JhWecOj/lWR
         j/Mvn49IBvn4WNuuyLc/ER6W4fXAFWwpVVc/4HPJrHDo7VxSsJonbMMVb7HFxZjgWSvO
         0NSRSBj/8R5/CGLyWWVL3bhv64XXF55/6dVd7w3Lru1m7x3bL00ae6DYU/Pu5FMQvjju
         kXbCQNBqD7oytEphC1m7yn64YZtZ3URcfdxUZRvEA5J8mGaC+qu37XZQlFVz7wEhPNc/
         ytGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898991; x=1696503791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDJFiJgRqRQBXlrZBTgPGvpZ3gtef6On4wWBMux75So=;
        b=NY/Gis3n7b9WeHWUHYu49xscbO00VqDU6sP6C8756cJWX/xmCCTSpczlL0bOInLtNN
         x7vuJ8d00J5vx1w3EmVjCHxiUgsUlpN0ad3IjHSPDXY1xttI5FJIMD8VbxCL2eMYC+uH
         QccuEUX/iebLD5sm2l+OLLgv22RJUJt/rsNUaffyX5aiT/CNPtJGiA0F04zUYHYI7gqC
         VRRcwUR+TIub43yrMCykgnPCBtFG0vSJSnpELPQ9YU/TaUtGyaKeXRuxTdbynY8DFG2t
         XdkymGhLmyL/H4fbwp+ZZyrzOaTfVf8SyNPul//CCpHkhT5H1L3kF2zT87cakfQMtjW1
         0Eew==
X-Gm-Message-State: AOJu0YwOY3ZNfScCkq5qgOCmmdxVdYXJpalHmObTYEGeWMUFD/i4ocWH
        vHwaKvqVT6usDRBB1X1tQlWezg==
X-Google-Smtp-Source: AGHT+IEIQdx1X58alEuusgt13lF6u5O/nmqrhimcPF8MioqmrRyP8Ya+rQMIxfyYLlqYsh3YI7TsWw==
X-Received: by 2002:a19:670f:0:b0:503:653:5711 with SMTP id b15-20020a19670f000000b0050306535711mr783687lfc.9.1695898990866;
        Thu, 28 Sep 2023 04:03:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 01/36] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
Date:   Thu, 28 Sep 2023 14:02:34 +0300
Message-Id: <20230928110309.1212221-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the bindings for the keypad subdevices of Qualcomm PM8921 and
PM8058 PMICs from text to YAML format.

While doing the conversion also drop the linux,keypad-no-autorepeat
The property was never used by DT files. Both input and DT binding
maintainers consider that bindings should switch to assertive
(linux,autorepeat) instead of negating (no-autorepeat) property.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/input/qcom,pm8921-keypad.yaml    | 89 ++++++++++++++++++
 .../bindings/input/qcom,pm8xxx-keypad.txt     | 90 -------------------
 2 files changed, 89 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml b/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
new file mode 100644
index 000000000000..88764adcd696
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,pm8921-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM8921 PMIC KeyPad
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+allOf:
+  - $ref: input.yaml#
+  - $ref: matrix-keymap.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8058-keypad
+      - qcom,pm8921-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: key sense
+      - description: key stuck
+
+  wakeup-source:
+    type: boolean
+    description: use any event on keypad as wakeup event
+
+  linux,keypad-wakeup:
+    type: boolean
+    deprecated: true
+    description: legacy version of the wakeup-source property
+
+  debounce:
+    description:
+      Time in microseconds that key must be pressed or
+      released for state change interrupt to trigger.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  scan-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: time in microseconds to pause between successive scans of the
+      matrix array
+
+  row-hold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: time in nanoseconds to pause between scans of each row in the
+      matrix array.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - linux,keymap
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/input/input.h>
+   #include <dt-bindings/interrupt-controller/irq.h>
+   pmic {
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       keypad@148 {
+           compatible = "qcom,pm8921-keypad";
+           reg = <0x148>;
+           interrupt-parent = <&pmicintc>;
+           interrupts = <74 IRQ_TYPE_EDGE_RISING>, <75 IRQ_TYPE_EDGE_RISING>;
+           linux,keymap = <
+               MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+               MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
+               MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
+               MATRIX_KEY(0, 3, KEY_CAMERA)
+           >;
+           keypad,num-rows = <1>;
+           keypad,num-columns = <5>;
+           debounce = <15>;
+           scan-delay = <32>;
+           row-hold = <91500>;
+       };
+   };
+...
diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt b/Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
deleted file mode 100644
index 4a9dc6ba96b1..000000000000
--- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
+++ /dev/null
@@ -1,90 +0,0 @@
-Qualcomm PM8xxx PMIC Keypad
-
-PROPERTIES
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,pm8058-keypad"
-		    "qcom,pm8921-keypad"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: address of keypad control register
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: the first interrupt specifies the key sense interrupt
-		    and the second interrupt specifies the key stuck interrupt.
-		    The format of the specifier is defined by the binding
-		    document describing the node's interrupt parent.
-
-- linux,keymap:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: the linux keymap. More information can be found in
-		    input/matrix-keymap.txt.
-
-- linux,keypad-no-autorepeat:
-	Usage: optional
-	Value type: <bool>
-	Definition: don't enable autorepeat feature.
-
-- wakeup-source:
-	Usage: optional
-	Value type: <bool>
-	Definition: use any event on keypad as wakeup event.
-		    (Legacy property supported: "linux,keypad-wakeup")
-
-- keypad,num-rows:
-	Usage: required
-	Value type: <u32>
-	Definition: number of rows in the keymap. More information can be found
-		    in input/matrix-keymap.txt.
-
-- keypad,num-columns:
-	Usage: required
-	Value type: <u32>
-	Definition: number of columns in the keymap. More information can be
-		    found in input/matrix-keymap.txt.
-
-- debounce:
-	Usage: optional
-	Value type: <u32>
-	Definition: time in microseconds that key must be pressed or release
-		    for key sense interrupt to trigger.
-
-- scan-delay:
-	Usage: optional
-	Value type: <u32>
-	Definition: time in microseconds to pause between successive scans
-		    of the matrix array.
-
-- row-hold:
-	Usage: optional
-	Value type: <u32>
-	Definition: time in nanoseconds to pause between scans of each row in
-		    the matrix array.
-
-EXAMPLE
-
-	keypad@148 {
-		compatible = "qcom,pm8921-keypad";
-		reg = <0x148>;
-		interrupt-parent = <&pmicintc>;
-		interrupts = <74 1>, <75 1>;
-		linux,keymap = <
-			MATRIX_KEY(0, 0, KEY_VOLUMEUP)
-			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
-			MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
-			MATRIX_KEY(0, 3, KEY_CAMERA)
-			>;
-		keypad,num-rows = <1>;
-		keypad,num-columns = <5>;
-		debounce = <15>;
-		scan-delay = <32>;
-		row-hold = <91500>;
-	};
-- 
2.39.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225B45F3DC6
	for <lists+linux-input@lfdr.de>; Tue,  4 Oct 2022 10:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiJDIIq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Oct 2022 04:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiJDIIf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Oct 2022 04:08:35 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505934198E
        for <linux-input@vger.kernel.org>; Tue,  4 Oct 2022 01:08:32 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id e18so8376992wmq.3
        for <linux-input@vger.kernel.org>; Tue, 04 Oct 2022 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=v+45+IPNHsNkzRTc8cFGCMdRPbLJ5H2j3KZuExy5Qow=;
        b=snI92OKtGvPzjZHaxRFxt6Tp831O5BAhVabY9nqR372AUJpkSi4QZLvAAeBvdPw3Rc
         UyRa8M88BEAxZhdySyanXiuoDfAmRWR4pxjHqEAznDUnEq4CTKO+0dHwDM1duysApAjQ
         Duk4b3+DLrmecztLl8EYfqGikbSqCXqbo6o+zBfLqjg23/ixfAuW5bznI6QlwRR0rky5
         rYcLDHq/xnodYVkw5Z4U6wVAudICB9++GgyIgt0wrh4c9zelc+WNOFL/82czUj0Nlvz3
         5lSjBX2PgZDuUnmALnCCroxcSlo1FojcP7nlQ34YopwbjpnELgoZxOqLJZD+EEt03O1Y
         0cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=v+45+IPNHsNkzRTc8cFGCMdRPbLJ5H2j3KZuExy5Qow=;
        b=upTUuTEfsDrPYGj7533QrR+Tgtnj556CzbKfGcfy09GAD6cmVHp93PlV9b+qUF2J1D
         lDGVe2t/2ZWKwGu/YK20lrgVE7QbiUH2vIB7LwMR/XnLG1uRs4bu97kMVfddP6YUk6Hx
         LCkUbZ2Auh1zXJFYjJHKo1PMVH1snD3omrVvHT42PoYHS8WMtp9RWL+ZO5YSrPf4pMRw
         +k0eOTVCvRaBnqjbmZceHNxJCueMY9a7iAZE3fa9GG4tBT/weUAOAyPgsdgRAUDkNypR
         hgvHgxBDRdjQefrHdnpw76aF+s7k60nMNjASV0dLsXA/f/PDQjRzkb1QiskrXb0FfHRL
         8vmg==
X-Gm-Message-State: ACrzQf2DF3qEB1q5ReyuODuUL3hQ/Ykx+NRRd/xgMYRfEV0EsHRNq+P9
        cj+JJ9oyK/MjcPJ3JppMkOnM+Q==
X-Google-Smtp-Source: AMsMyM7oIXHI0TevgejTkB91pNnCgO/k+g3MPgU5ABvAyWNA2d2x0YuyO7gNira3RsZefMLujJnBlA==
X-Received: by 2002:a05:600c:21c4:b0:3b4:9668:d3d5 with SMTP id x4-20020a05600c21c400b003b49668d3d5mr9353217wmj.155.1664870910637;
        Tue, 04 Oct 2022 01:08:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id l2-20020a1c7902000000b003b33943ce5esm20228866wme.32.2022.10.04.01.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 01:08:30 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 04 Oct 2022 08:08:22 +0000
Subject: [PATCH v2 06/11] dt-bindings: input: qcom,pm8921-pwrkey: convert to dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v2-6-87fbeb4ae053@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org
X-Mailer: b4 0.10.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert input/qcom,pm8xxx-pwrkey.txt to YAML, and take in account that
the PM8921 pwrkey compatible is used as fallback for the PM8018 pwrkey.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml b/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
new file mode 100644
index 000000000000..ae38c4ef4932
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,pm8921-pwrkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM8921 PMIC Power Key
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <andersson@kernel.org>
+
+allOf:
+  - $ref: input.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,pm8921-pwrkey
+          - qcom,pm8058-pwrkey
+      - items:
+          - enum:
+              - qcom,pm8018-pwrkey
+          - const: qcom,pm8921-pwrkey
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 2
+    description: |
+          The first interrupt specifies the key release interrupt
+          and the second interrupt specifies the key press interrupt.
+
+  debounce:
+    description: |
+          Time in microseconds that key must be pressed or
+          released for state change interrupt to trigger.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pull-up:
+    description: |
+           Presence of this property indicates that the KPDPWR_N
+           pin should be configured for pull up.
+    $ref: /schemas/types.yaml#/definitions/flag
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
+   #include <dt-bindings/interrupt-controller/irq.h>
+   ssbi {
+   #address-cells = <1>;
+   #size-cells = <0>;
+
+     pmic@0 {
+       reg = <0x0>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       pwrkey@1c {
+          compatible = "qcom,pm8921-pwrkey";
+          reg = <0x1c>;
+          interrupt-parent = <&pmicint>;
+          interrupts = <50 1>, <51 1>;
+          debounce = <15625>;
+          pull-up;
+       };
+     };
+   };
+...
diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-pwrkey.txt b/Documentation/devicetree/bindings/input/qcom,pm8xxx-pwrkey.txt
deleted file mode 100644
index 588536cc96ed..000000000000
--- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-pwrkey.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Qualcomm PM8xxx PMIC Power Key
-
-PROPERTIES
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,pm8058-pwrkey"
-		    "qcom,pm8921-pwrkey"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: address of power key control register
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: the first interrupt specifies the key release interrupt
-		    and the second interrupt specifies the key press interrupt.
-		    The format of the specifier is defined by the binding
-		    document describing the node's interrupt parent.
-
-- debounce:
-	Usage: optional
-	Value type: <u32>
-	Definition: time in microseconds that key must be pressed or release
-		    for state change interrupt to trigger.
-
-- pull-up:
-	Usage: optional
-	Value type: <empty>
-	Definition: presence of this property indicates that the KPDPWR_N pin
-		    should be configured for pull up.
-
-EXAMPLE
-
-	pwrkey@1c {
-		compatible = "qcom,pm8921-pwrkey";
-		reg = <0x1c>;
-		interrupt-parent = <&pmicintc>;
-		interrupts = <50 1>, <51 1>;
-		debounce = <15625>;
-		pull-up;
-	};

-- 
b4 0.10.0

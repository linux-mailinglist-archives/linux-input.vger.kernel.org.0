Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D1F789E0E
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 15:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjH0N0K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 09:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjH0NZi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 09:25:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE8C198
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:30 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso3561615e87.2
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142729; x=1693747529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjW4ylzO3JtTT7kFnJy7UM1EVNTfgYpip/fK2M89nnA=;
        b=iXNOAYk+N1xkoMfASNZRzQbETJCKgU7tCHJL8sBRS1pYIzqaWEDgtyWs3wLsqYbccK
         Ue0cXg7SVSCV+nlg/i0jGPiN0HxWTXd+9MvhZK4qjOwmi6qkiKIjUsYpgVkRAbSuc/p2
         89IyNAZA43vOn+XtgZXm8rzIfUavCrFY+abnJZnciozxLBHaCX713pvE0Q55Kj4vLz9K
         AsEWQ+rMCzPXf7M4z0tOQ8+JKU9GgtD1Ev8sFgi5f3SXOBTqFjwEWkmHjK5mkxre5nju
         vAdG+aQVCKk1v9ItDmcw14geQihvHZLBRlJQfrtGrMU+IMZfcgk/RIR621dFHTg8lMXb
         wufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142729; x=1693747529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjW4ylzO3JtTT7kFnJy7UM1EVNTfgYpip/fK2M89nnA=;
        b=a8ZOo/zb3Dg4cPdy6StWeivr6UtraEO1IneoEhg0AxHYkHsu+6yYa1H5UK92lonYUY
         DHcogVStTPvRfFQobkun9B1qSiv141HJW/ywPrEOsWIeDOb+6F45BVDXj9MuFxG3SYN8
         8Vf1+coDJuiRcSZ+K2Dnh/KCReq6YyLh7R3VVHDgax07/A2RK55T/7ngRFijb5pa8JdX
         EsujNjMN+9ayr5t2aP/+U7raN8D15Uig92dk9KJbNYBkUnIfyCOjfjJin9GWS+B+yZA+
         LiB0JyMFwaKav0M7lxa/MLYzqalUWdexcPcugb+OAEND/ycCzWB+6i19+Uq+tYuocwHM
         BUAQ==
X-Gm-Message-State: AOJu0Yx7+HWp5E+Y6Ivxq9+qKiSIAM2gOZp7gqTYQjmcmumvwBTNxacr
        RJzplAMYvcQH7fTrlWVaPfnJrw==
X-Google-Smtp-Source: AGHT+IHwNZrByq/v0KY00/UZCbCb7nRTx5qNmKDHMlmZJIbBq+HIRyQH/9VlAVyD4s8mjWuh2WWfTg==
X-Received: by 2002:a05:6512:3241:b0:4f8:6dfd:faa0 with SMTP id c1-20020a056512324100b004f86dfdfaa0mr15175034lfr.2.1693142728775;
        Sun, 27 Aug 2023 06:25:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 02/37] dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
Date:   Sun, 27 Aug 2023 16:24:50 +0300
Message-Id: <20230827132525.951475-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add gpio, keypad, led, mpps, pwrkey, vibrator and xoadc as possible
child nodes of qcom,pm8xxx, referencing existint schema files.

Cc: Lee Jones <lee@kernel.org>
Cc: Satya Priya <quic_c_skakit@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml  | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
index 9c51c1b19067..7fe3875a5996 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
@@ -43,13 +43,37 @@ properties:
   interrupt-controller: true
 
 patternProperties:
+  "gpio@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
+
+  "keypad@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,pm8921-keypad.yaml#
+
   "led@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,pm8058-led.yaml#
 
+  "mpps@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/pinctrl/qcom,pmic-mpp.yaml#
+
+  "pwrkey@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,pm8921-pwrkey.yaml#
+
   "rtc@[0-9a-f]+$":
     type: object
-    $ref: ../rtc/qcom-pm8xxx-rtc.yaml
+    $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
+
+  "vibrator@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,pm8xxx-vib.yaml#
+
+  "xoadc@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/iio/adc/qcom,pm8018-adc.yaml#
 
 required:
   - compatible
-- 
2.39.2


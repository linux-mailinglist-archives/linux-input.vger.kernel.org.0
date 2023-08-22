Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50FA7836FE
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbjHVAPW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbjHVAN7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:13:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509C3184
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:55 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so6142800e87.1
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663233; x=1693268033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gLmuDteVfflRRaO74B8eb5+m9ZmGqFUyBbM9139n1w=;
        b=m0jEvxgOrTbiX4Q6waohk0ZmFbZl3nt7LpxsFfreEVSeHjVm+xJqtpHqs7br4jEP8X
         a+zDwI/Oe0lDIfhyLI8F4P6IeVugTHBWIDzkZL9FiGtVtm0bMrTyuW8nXMUXTXNxzEjy
         AVIMbJSZP9UWB0F20oTH6UCsfD2JwPtTulXTiWMQbxyxIA42OA2F+R3mt11a+c8N9mjV
         hR7pLRkSrXzYyd7t1YGtHTkLdAbEgProP9+e3SYKWYaO/zT9BNhhq7/dX3E8azFADU+b
         /kTzc+b6XrbB4dtsXYfuKJMMkThrGDY+2md7CW67QTPJIExvZ8/vTCCHvbxRLNwzhbV3
         QhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663233; x=1693268033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gLmuDteVfflRRaO74B8eb5+m9ZmGqFUyBbM9139n1w=;
        b=Tfkhgrp6hY8n4fDTuFbHdXzjJxeeY4YAb2jYord0IHJF+KLFfEvtuVo2+wv/EGz5fb
         68fqjiqnySiuetr83ttnuqkD984hlq6Vm6vtsBYxA98EKBNmN3QxxTLzH9hE2wlYFs3A
         DlVSSNtVt2ZA3f9gUwyl4HMPw7t9vZ1yhgZEC5VvyIhCMnJdUhrHRY1yqczoTngrQ7X+
         ZkwcCQnlVCj7mZbCeDerBq4JE2SDriey7Ejmx21L/MWITyFpXpVMh3yK6VHDEhui6MEv
         sEqcKwI7LE4mIAk7daFvvtllSjos8918gHGPjIaTVYcYk4Hy4Fpioi/+tLy5ambs6BGE
         Gxpw==
X-Gm-Message-State: AOJu0Yz7tG3wMFBbcZ54jZSw71IoLs4olxQdXJllHt+9l5GLg7Fa851v
        RO+CzgeLffdvbxgYkcsedKcmqQ==
X-Google-Smtp-Source: AGHT+IFBeCMMID8+k0vxg+34KSUBolFjB9cU8EWF/Q4xgcATW4hwIcQ3ZiJMe1SLZ3FdMLtEnB3pUA==
X-Received: by 2002:a05:6512:3b9a:b0:500:7fc7:852f with SMTP id g26-20020a0565123b9a00b005007fc7852fmr4352283lfv.39.1692663233450;
        Mon, 21 Aug 2023 17:13:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:13:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH v3 02/32] dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
Date:   Tue, 22 Aug 2023 03:13:19 +0300
Message-Id: <20230822001349.899298-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add gpio, keypad, led, mpps, pwrkey, vibrator and xoadc as possible
child nodes of qcom,pm8xxx, referencing existint schema files.

Cc: Lee Jones <lee@kernel.org>
Cc: Satya Priya <quic_c_skakit@quicinc.com>
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


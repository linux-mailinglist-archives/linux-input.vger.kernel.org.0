Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B052789A2C
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 03:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjH0BAG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Aug 2023 21:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjH0A7i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:38 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F54CD1
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 17:59:35 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-500b3f7f336so688570e87.1
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 17:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097974; x=1693702774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rane7N6FN2YRdaXIzHgZgt12GcT5Hjyz+pSJkMzIXcI=;
        b=KidjENGQuCgj4LGeOzKlICstel3frJLgEjLZYsl4zXATLODnGGox0IOgksechHqSDI
         gHxqHxGds83+08xODBO7vTmkeRMBarzL5ZLJ8sXFq0cyxP+LHnqP291MfE5X3rkst/VZ
         eqCmkDI8jL00C9Z4Ot1g4x/cP/635LQNJzrEh0Kf74+pP/aVU5MhfDCnq0IVV+/vxVUZ
         X9vIAy7Qytyy3LW8pWPNPDz/FouC2T31Zfq0FBLWkwJY6db9xzrOHgue7oC3Mm/k+U0h
         Ahw5VzlQ/RjhNZQ7O257i13c2iJgaZeI1+Fh6nqSicALqv0rsYF/X2RHd37NmWjqP5Df
         NfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097974; x=1693702774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rane7N6FN2YRdaXIzHgZgt12GcT5Hjyz+pSJkMzIXcI=;
        b=O37BiB/Hx2XBRazxkev7n4sIphCRutrIiyoFXBy7zGve/bA7m7Qm4B+JAkbCww0LeV
         7EoP4n9vrSZTngK49Ky3Fw4+7e+lZHXcG5ia5SjJoOSM6Ja3ODYX0vIKXmMTo/Awfh0j
         /maKS5V+8Lc0E6oDia+MlW7rBGdje8ZhbRI9e+StVaTzSOPqkMFSL0TwN6Kvpptv+4JA
         eT6sv6yLZh/Lk9+YHSEUP/vLRHOreRQoEh8Ek26yZBFiciqGOay50td9ur8zlz0sGgiL
         05+mj42HpzVn6h1WMra8aCkARNeqxkRyupMnG2RNzced0bveWItt8Pv/qni0LeRmj7HH
         jAZA==
X-Gm-Message-State: AOJu0YzDRuIXA1HyqhTJQ8nfvnCr/+m0AZGn2y03/tejeqpkkl/D68jL
        dpIYfzkChcUNQ3hB/rtq2OTrQA==
X-Google-Smtp-Source: AGHT+IER7b3k2vgswYaIqoxfNeOp0YBSjECJpP3OzCfRrQfMSRZNJAMJIESmQvrk9KDVLWunJAVkuA==
X-Received: by 2002:a05:6512:4026:b0:4fb:7559:aea3 with SMTP id br38-20020a056512402600b004fb7559aea3mr18071996lfb.39.1693097974153;
        Sat, 26 Aug 2023 17:59:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:33 -0700 (PDT)
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
        linux-leds@vger.kernel.org
Subject: [PATCH v4 13/38] ARM: dts: qcom: msm8960: fix PMIC node labels
Date:   Sun, 27 Aug 2023 03:58:55 +0300
Message-Id: <20230827005920.898719-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
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

Change PM8921 node labels to start with pm8921_ prefix, following other
Qualcomm PMIC device nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index a34fda93d6a4..ea2d961b266b 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -264,7 +264,7 @@ ssbi@500000 {
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic {
+			pm8921: pmic {
 				compatible = "qcom,pm8921";
 				interrupt-parent = <&msmgpio>;
 				interrupts = <104 IRQ_TYPE_LEVEL_LOW>;
@@ -276,7 +276,7 @@ pmicintc: pmic {
 				pwrkey@1c {
 					compatible = "qcom,pm8921-pwrkey";
 					reg = <0x1c>;
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
 						     <51 IRQ_TYPE_EDGE_RISING>;
 					debounce = <15625>;
@@ -286,7 +286,7 @@ pwrkey@1c {
 				pm8921_keypad: keypad@148 {
 					compatible = "qcom,pm8921-keypad";
 					reg = <0x148>;
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <74 IRQ_TYPE_EDGE_RISING>,
 						     <75 IRQ_TYPE_EDGE_RISING>;
 					debounce = <15>;
@@ -296,7 +296,7 @@ pm8921_keypad: keypad@148 {
 
 				rtc@11d {
 					compatible = "qcom,pm8921-rtc";
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
 					reg = <0x11d>;
 					allow-set-time;
-- 
2.39.2


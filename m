Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAA47B1948
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbjI1LD7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjI1LDz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:55 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954951B7
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:29 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-504427aae4fso12482956e87.1
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899008; x=1696503808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBqdCLgmI8uo0vU5eXIGi0ZDA2gUAaQ0wjWhyRHtIN4=;
        b=ZpGLojrxgJoARP1wL0MXBWc/dSHDr7wJ+Rxu3slc9VzuS21gTlUxc1T45KkBZ5F9FM
         joix2EXENE5XNegkfHcgzxOB+qPZY7ptCcFN9lS3MYDrFFPPnbAT4QRRSCZB0B8bHR7Z
         PWdH6ObOzIpFrg/KKm64Etvo2OzQ6PpnRbjUqi+aB5agQyCJjS5jS7dtgWkhCeN6at7g
         sXBGdGhhWHo/qWfpWOiMr98n/9FPx+OW7jz0HgRIOeV7ZKnE6q0OF9D4mFGmpf9yq8O2
         s+2TKz2izrcAki9u3BHPjTG9BeOV/U++F7ZUGm/+9BQw3byk7Xm9/9+NgsdY+eUygZ1t
         OZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899008; x=1696503808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBqdCLgmI8uo0vU5eXIGi0ZDA2gUAaQ0wjWhyRHtIN4=;
        b=mz32/yGvj5PyHZk+q/bj4kp5eqOxrE4h732U11KsB9FBCumzYavgPyRhOKjaxGeh+J
         8l7vTF2xY1WG8ui+1o7xcxhW+0prtz3nbxM+Ne5hjEF6o+QzdPCVtlEgqo8TQfcfyVq2
         /IHTkLdse8MtAsTBX4udm0qVVrkbZxWSuLT9MfMcXH2Thr1kaVll4QUOK/rInd1WzoJO
         IrvGmR6GP2NuzIkc5gcwv1chyH/iTanL86mhw/WzHsGhtYS11sCEV1ppN+P+uD1gjnFM
         IJkiS7B2EiWaaV8o4+2mTejLr+xlFeEK0AFITVd9/gSTur64sbXjtEDcxYH7GCCUR+AU
         6UVQ==
X-Gm-Message-State: AOJu0YyVre6TZs782p4nRuHrdMA1gUxXbTDS/tIE9JGFdT86tM3sY78m
        6aqkBNcp4QJbLmCcQiG7ZgDmSw==
X-Google-Smtp-Source: AGHT+IEeUvCVdokhMBXQ1+Ze3H+ZmMdcVvUfqluEGf1gPko4QVCY2ff9vN+B84yk3CMzmK/1bAZY0Q==
X-Received: by 2002:a05:6512:3187:b0:504:86ae:5851 with SMTP id i7-20020a056512318700b0050486ae5851mr657494lfe.23.1695899007898;
        Thu, 28 Sep 2023 04:03:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 20/36] ARM: dts: qcom: pm8058: reorder nodes
Date:   Thu, 28 Sep 2023 14:02:53 +0300
Message-Id: <20230928110309.1212221-21-dmitry.baryshkov@linaro.org>
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

Move pm8058 device nodes to follow the alphanumberic sorting order.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8058.dtsi | 90 +++++++++++++++---------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
index ad581c3bcbd2..913a511719fa 100644
--- a/arch/arm/boot/dts/qcom/pm8058.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
@@ -8,15 +8,24 @@ pm8058: pmic {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8058_gpio: gpio@150 {
-			compatible = "qcom,pm8058-gpio",
-				     "qcom,ssbi-gpio";
-			reg = <0x150>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-controller;
-			gpio-ranges = <&pm8058_gpio 0 0 44>;
-			#gpio-cells = <2>;
+		pwrkey@1c {
+			compatible = "qcom,pm8058-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8058>;
+			interrupts = <50 1>, <51 1>;
+			debounce = <15625>;
+			pull-up;
+		};
+
+		pm8058_led48: led@48 {
+			compatible = "qcom,pm8058-keypad-led";
+			reg = <0x48>;
+			status = "disabled";
+		};
+
+		vibrator@4a {
+			compatible = "qcom,pm8058-vib";
+			reg = <0x4a>;
 		};
 
 		pm8058_mpps: mpps@50 {
@@ -30,13 +39,22 @@ pm8058_mpps: mpps@50 {
 			#interrupt-cells = <2>;
 		};
 
-		pwrkey@1c {
-			compatible = "qcom,pm8058-pwrkey";
-			reg = <0x1c>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <50 1>, <51 1>;
-			debounce = <15625>;
-			pull-up;
+		pm8058_led131: led@131 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x131>;
+			status = "disabled";
+		};
+
+		pm8058_led132: led@132 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x132>;
+			status = "disabled";
+		};
+
+		pm8058_led133: led@133 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x133>;
+			status = "disabled";
 		};
 
 		pm8058_keypad: keypad@148 {
@@ -49,6 +67,17 @@ pm8058_keypad: keypad@148 {
 			row-hold = <91500>;
 		};
 
+		pm8058_gpio: gpio@150 {
+			compatible = "qcom,pm8058-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pm8058_gpio 0 0 44>;
+			#gpio-cells = <2>;
+		};
+
 		pm8058_xoadc: xoadc@197 {
 			compatible = "qcom,pm8058-adc";
 			reg = <0x197>;
@@ -109,35 +138,6 @@ rtc@1e8 {
 			interrupts = <39 1>;
 			allow-set-time;
 		};
-
-		vibrator@4a {
-			compatible = "qcom,pm8058-vib";
-			reg = <0x4a>;
-		};
-
-		pm8058_led48: led@48 {
-			compatible = "qcom,pm8058-keypad-led";
-			reg = <0x48>;
-			status = "disabled";
-		};
-
-		pm8058_led131: led@131 {
-			compatible = "qcom,pm8058-led";
-			reg = <0x131>;
-			status = "disabled";
-		};
-
-		pm8058_led132: led@132 {
-			compatible = "qcom,pm8058-led";
-			reg = <0x132>;
-			status = "disabled";
-		};
-
-		pm8058_led133: led@133 {
-			compatible = "qcom,pm8058-led";
-			reg = <0x133>;
-			status = "disabled";
-		};
 	};
 };
 
-- 
2.39.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA917B1918
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbjI1LD2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjI1LDV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:21 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D35119D
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:19 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50305abe5f0so20321365e87.2
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898997; x=1696503797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tXAJeuiQtGgKA8BCw8CS7aa8g2kLTD4bdEBZkP9I3s=;
        b=R7mmtF4UMJS7v+KbkfIY4WdoKH3k9OO+DE6iouT+SzVtjdYifYMoWaJmtNUXE7eNro
         68bAAYLPmKVt+t4qIFGLA4cb6vsGh5hbYXe+jXnKZgPL7+N29f9PmCE6eavulSuRfAbR
         d9gkvYv1uTq+LwPhoALg2sK453fjddznPTh538wvt3rMq/O4SCVcyvcHirKYcLnjchVj
         1p741yZMnq9hKtLqtT7cVZU6unROF9rpH876Zgr+tQPtHMfrfHE/D1myi4RZ+8fuH/qE
         PPQQBwvA86Q/iZFgMB/eP06hfQqiLQsbfo/hDJYBXzd30zJsOOwml/DlX+MIeIsFNFCd
         iIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898997; x=1696503797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tXAJeuiQtGgKA8BCw8CS7aa8g2kLTD4bdEBZkP9I3s=;
        b=XYVnarrD/a0kEiMFYJFdKTzbeccqadD0aoWB7HuXz3ipM4hKqKW45s9AElgQ3eqRXx
         Wmm66ERVYB933+ePEpRTcdgJ0Jh3PATg7Nr9J2XYo+J1m6jyvjWnA72MQ4DTd1JSrxSW
         822hVQh4A6IMbRA5Hh+7uHj3NEeLzbWT/Zouq4tB8BYsKNHKIXb16yzbS8i2/gBi6jTR
         iRKeYYENuCgNKnra8uWfgW/YliNhLUrejLLJEAWOTcNF61pweBmQyfoHlItc+oJzPmzJ
         fBJbh7GopRJLojvfpRXeOuulr38jDYLFkNFw/qIa3hEIN7FGjgimayC/eKLW7eQiOpvj
         unoQ==
X-Gm-Message-State: AOJu0YxRe29mqBt5qiD/fhLR/ArdM9u2KOxVdwe/EHPIivp+zqye1L0l
        LH7nUcaqx9Ufx1uK4kMC9AFLbFuip5TzNnwavv/EXA==
X-Google-Smtp-Source: AGHT+IGiq1WUxcoSCnqrApBVbCUH2LfNT+RsnrKdOgbWa7vuDQ/xGKh9jWeE5gbXaz/PX609vMdqeQ==
X-Received: by 2002:a05:6512:ba7:b0:4fe:db6:cb41 with SMTP id b39-20020a0565120ba700b004fe0db6cb41mr1086092lfv.39.1695898997287;
        Thu, 28 Sep 2023 04:03:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 08/36] ARM: dts: qcom: apq8064: fix PMIC node labels
Date:   Thu, 28 Sep 2023 14:02:41 +0300
Message-Id: <20230928110309.1212221-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
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

Change PM8921 node labels to start with pm8921_ prefix, following other
Qualcomm PMIC device nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 950adb63af70..6514d728b1ec 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -292,13 +292,13 @@ scm {
 	 */
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&xoadc 0x00 0x01>, /* Battery */
-			    <&xoadc 0x00 0x02>, /* DC in (charger) */
-			    <&xoadc 0x00 0x04>, /* VPH the main system voltage */
-			    <&xoadc 0x00 0x0b>, /* Die temperature */
-			    <&xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
-			    <&xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
-			    <&xoadc 0x00 0x0e>; /* Charger temperature */
+		io-channels = <&pm8921_xoadc 0x00 0x01>, /* Battery */
+			      <&pm8921_xoadc 0x00 0x02>, /* DC in (charger) */
+			      <&pm8921_xoadc 0x00 0x04>, /* VPH the main system voltage */
+			      <&pm8921_xoadc 0x00 0x0b>, /* Die temperature */
+			      <&pm8921_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
+			      <&pm8921_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
+			      <&pm8921_xoadc 0x00 0x0e>; /* Charger temperature */
 	};
 
 	soc: soc {
@@ -686,7 +686,7 @@ ssbi@500000 {
 			reg = <0x00500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic {
+			pm8921: pmic {
 				compatible = "qcom,pm8921";
 				interrupt-parent = <&tlmm_pinmux>;
 				interrupts = <74 8>;
@@ -721,7 +721,7 @@ pm8921_mpps: mpps@50 {
 
 				rtc@11d {
 					compatible = "qcom,pm8921-rtc";
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <39 1>;
 					reg = <0x11d>;
 					allow-set-time;
@@ -730,16 +730,16 @@ rtc@11d {
 				pwrkey@1c {
 					compatible = "qcom,pm8921-pwrkey";
 					reg = <0x1c>;
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <50 1>, <51 1>;
 					debounce = <15625>;
 					pull-up;
 				};
 
-				xoadc: xoadc@197 {
+				pm8921_xoadc: xoadc@197 {
 					compatible = "qcom,pm8921-adc";
 					reg = <0x197>;
-					interrupts-extended = <&pmicintc 78 IRQ_TYPE_EDGE_RISING>;
+					interrupts-extended = <&pm8921 78 IRQ_TYPE_EDGE_RISING>;
 					#address-cells = <2>;
 					#size-cells = <0>;
 					#io-channel-cells = <2>;
-- 
2.39.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E31C7B194E
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbjI1LEB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbjI1LDz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:55 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2441A4
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:30 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5045cb9c091so14387869e87.3
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899008; x=1696503808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVO+2iRIEEW1mZ3SKc/B2s6KoIhcuuodrBJKzq2EnPA=;
        b=S7O0cA8YobzWmb/Kh5x0A/PmvcEIz308lCyufvygLLD8j5PveDSM6uBRGpUOByg4Sp
         SYMcWq7fsHL0FAf6WyDxthhX0n3QbXnKD2PJ6agZSrzQ2KG/soOUWFoYPRhPzxP7/2ZR
         wnxWaOr8vS18VnAngO+LbdUXNzlgU4+Dq97kCY4C5ihT7EZqAE+og0kSQb4bUz2sqAxK
         dQvgj/jG4WIHd2dqpg6TwQCQwN76gCmY7+POYX11lNxXi/EHH67wQKXAC4M4aK9gAr0l
         oTvlEa/63a9eVo45MPNGJvTxCFqakpGe/TpXOqCNv8I4+YvE12adfEOBgCE8Va39feHy
         T2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899008; x=1696503808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVO+2iRIEEW1mZ3SKc/B2s6KoIhcuuodrBJKzq2EnPA=;
        b=K5nWDfNMD/jS+a0nDTr47Q5e72Pl6dGG+6eKGjK3MzahdDLoXazf1woKs8/lYgtoSK
         DHeC0WRltVNDhURKTHq7QBpStcqPTDv/70fSrL9NsPmvWCNlCUluoW5XV0XVrdTFNMhN
         1IgkftxafhttK6UOXorPKFFtwwcLsU8JsM+q9un6mCDR1Nt0+ls1NQAkAlDjLMDZpg/w
         ExYKZu1BThDm196KFYiqJbTPht0rhWS7bfOX932zQJLRc4ZAbKtQzrBxK6Lcap+LpV57
         ZniAnQmZMJyc3ONi22/brW0axVGfUKZ83cey/mSTVE1Ri56Act+xHAJ1x0X5X1P2V8Cl
         WrUg==
X-Gm-Message-State: AOJu0YzvY4FtnzHr2J87q0LF/VEUsgdqijlsaovDm1WBSIAhD+1pKdlq
        JXlngy4oXbzCZDuEtKjaNqkCBg==
X-Google-Smtp-Source: AGHT+IHf2lQnijNjOHSWAej9gzKXSuuiG6Jj757JJuz2qU9t4sz1UeZ+I4nzYoynPQdLW/RYqgi9Gg==
X-Received: by 2002:a05:6512:3e20:b0:503:28cb:c073 with SMTP id i32-20020a0565123e2000b0050328cbc073mr1172243lfv.58.1695899008687;
        Thu, 28 Sep 2023 04:03:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 21/36] ARM: dts: qcom: pm8921: reorder nodes
Date:   Thu, 28 Sep 2023 14:02:54 +0300
Message-Id: <20230928110309.1212221-22-dmitry.baryshkov@linaro.org>
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

Move pm8921 device nodes to follow the alphanumberic sorting order.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 48 +++++++++++++++---------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index ad41d99ab265..4697ca33666f 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -8,17 +8,14 @@ pm8921: pmic {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8921_gpio: gpio@150 {
-
-			compatible = "qcom,pm8921-gpio",
-				     "qcom,ssbi-gpio";
-			reg = <0x150>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-controller;
-			gpio-ranges = <&pm8921_gpio 0 0 44>;
-			#gpio-cells = <2>;
-
+		pwrkey@1c {
+			compatible = "qcom,pm8921-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8921>;
+			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+				     <51 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15625>;
+			pull-up;
 		};
 
 		pm8921_mpps: mpps@50 {
@@ -32,14 +29,12 @@ pm8921_mpps: mpps@50 {
 			#interrupt-cells = <2>;
 		};
 
-		pwrkey@1c {
-			compatible = "qcom,pm8921-pwrkey";
-			reg = <0x1c>;
+		rtc@11d {
+			compatible = "qcom,pm8921-rtc";
 			interrupt-parent = <&pm8921>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
-			debounce = <15625>;
-			pull-up;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			reg = <0x11d>;
+			allow-set-time;
 		};
 
 		pm8921_keypad: keypad@148 {
@@ -53,12 +48,17 @@ pm8921_keypad: keypad@148 {
 			row-hold = <91500>;
 		};
 
-		rtc@11d {
-			compatible = "qcom,pm8921-rtc";
-			interrupt-parent = <&pm8921>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
-			allow-set-time;
+		pm8921_gpio: gpio@150 {
+
+			compatible = "qcom,pm8921-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pm8921_gpio 0 0 44>;
+			#gpio-cells = <2>;
+
 		};
 
 		pm8921_xoadc: xoadc@197 {
-- 
2.39.2


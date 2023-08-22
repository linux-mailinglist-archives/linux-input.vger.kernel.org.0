Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566BC7836BE
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbjHVAOZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbjHVAOX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:23 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9CE1B6
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:08 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4ff91f2d7e2so5429553e87.0
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663246; x=1693268046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XekRfkcT6z5xG4nHPEwX9QKj0KBdkUaREwMz45PY2ck=;
        b=R9ImzGVH7nlWshl/0BReMCUmhf3AE1O6D4rR1ZI/m1arX7vjIAGMNJWwS52fcQIKWP
         jyq45Qy12eTKtc6CE/CmBaTyqV4dNfes2sGYFEBxQzHGnxxNCiapF3Flp2cnqXjMHppO
         STmpFTwrSaUg7GI+SIPoKNiEJRR9SMhrVRlfYYRbKZI1YLpOPCgTtA14xcU85eXvs+WO
         oJCqGreT5Iwa+XmDYWeGW9vq5rYhENoKluNKlSbXLKAbyGbqi3Uy/PQ12mAI0FYHjH7z
         l9EJBb83+H+Lv/1STNTberFAXfBVRPqeI7RxdnqozpIUOroB+kURGMNLGGTj4a0J8Rwp
         O2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663246; x=1693268046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XekRfkcT6z5xG4nHPEwX9QKj0KBdkUaREwMz45PY2ck=;
        b=dIIknFYLfePk0lqxqCWLjB+S4T/2dM6R5Wxss7gDKyTFxIH6hy2NOHncxRWazZLjoe
         r3qYp4bexOTaNajtRdBJQao1ggBkb1H7H70HeWtmLTWuTvIA5iPK0zooGbyeLgRtKc1E
         YktbJ+27MHz4v2BLptVLXkO4JrucCKdBBWB+dVrCTAT8lJxi0NgOj7XjvQ2jMVjM4DQi
         gvSW7px/yPX3LuZLx+7nLQe+GK0RJBUY4K9a+b42fCYpvgHlUkUSkIKIhoNAzUeTMzwR
         R71SLfKq7jdBCBTM4K73KtUreuhhJ6pLWNL4T/P++6PuSTsWRWgULfLo0Se7FvGfnENt
         9qbQ==
X-Gm-Message-State: AOJu0YzwM9wELPmbq1nlJBuN3FapsAXpEDYM83fEkOXxA5IsOoU2DQL5
        J49/g5HIlbbv+RkIm5OFr0MCwg==
X-Google-Smtp-Source: AGHT+IHH3nIJmjSVvTkoJ/4On2Ux4LdSL50fxo93sZdWiX1oAv3hN4UOEaaLbExu19UafLflVpXn5A==
X-Received: by 2002:a05:6512:200d:b0:4fe:cc2:247a with SMTP id a13-20020a056512200d00b004fe0cc2247amr4701251lfb.49.1692663246600;
        Mon, 21 Aug 2023 17:14:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 19/32] ARM: dts: qcom: pm8921: reorder nodes
Date:   Tue, 22 Aug 2023 03:13:36 +0300
Message-Id: <20230822001349.899298-20-dmitry.baryshkov@linaro.org>
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

Move pm8921 device nodes to follow the alphanumberic sorting order.

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


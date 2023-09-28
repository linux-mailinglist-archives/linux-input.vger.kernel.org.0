Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 434C97B1923
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbjI1LDc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231880AbjI1LDX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:23 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F30B194
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:21 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50444e756deso16706572e87.0
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898999; x=1696503799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rane7N6FN2YRdaXIzHgZgt12GcT5Hjyz+pSJkMzIXcI=;
        b=XUddk2Ulf693h+ZSucjj+F2+UVKGBm6+58jygEOZsjFo9M2I/7NwfaviAcfvxu9VGG
         65ojRiQBbzXOpocDuddMC0TYZA+qlxIq5TBzkLS4qBS/lYnW87j9JtK2xBgu0O5KOJ54
         LSoEIhVs4QmgU0H1mJKA4UMOCpt3nKAPMGDP/IOO8eS6ztgxHMXavwuJtjjStlQ2yGrt
         zl7mEeZ09U3N5xFHc5v9U4oy5HYcT4Pt7ssMeDr5lH58/GkLcK6d++89DwFcvov1M2in
         m1cZWcIakujL1uzaU/RB8sT704U8O4TzlyWcaoJdkFTbqzP0zaegWuYSG2E2Q7d3JdGt
         jetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898999; x=1696503799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rane7N6FN2YRdaXIzHgZgt12GcT5Hjyz+pSJkMzIXcI=;
        b=iovu7dbTdtc8QqCg53jRr0qZn/dun6NpCwHqcLs2SShCQ6mcgKFnI+T2nM2Yw+wL+H
         Wo71OPgs3tWQro1GcZzNbSha+KJ/THYM0a2LD4hEdXkV42h6rLFxQogRjpymknba0TLK
         ZQxGpCLXNMhoQnCOowT6zN/xidzXMex3B1BwbfNFzWFvz+oY6aV1a4STwZ+SZ45ikmhB
         2y+4H7Lg93QILvanWW1YkYcEHEEV98eE9s+7G9v1JdqLL6Zr58g2fwdYOXC8KiQZyVeY
         UkKE7Q4+zp9jNZT3LQVL1H6WQnJspNCXt7bHYDWBjQGexkfA5PPqWRhcYLQAOWmNVXjH
         Vgnw==
X-Gm-Message-State: AOJu0Ywp4JHyj/5fos1xttJGXGwwblT9QiswHmKkKeYSg6YIkUqcGg+c
        JqUD6ff8ITTX/8+n2o74k+6PaQsHP1LN5vLv0Vh4tA==
X-Google-Smtp-Source: AGHT+IFIK+U+5auiNlZpSXeBisAkHRE8/Dj7QjmM3phfIz7PX6zxMuQu7eSBN7HOwEcmAaXnkT4n3g==
X-Received: by 2002:a05:6512:a94:b0:500:b3e3:6fa6 with SMTP id m20-20020a0565120a9400b00500b3e36fa6mr1046076lfu.68.1695898999711;
        Thu, 28 Sep 2023 04:03:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 11/36] ARM: dts: qcom: msm8960: fix PMIC node labels
Date:   Thu, 28 Sep 2023 14:02:44 +0300
Message-Id: <20230928110309.1212221-12-dmitry.baryshkov@linaro.org>
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


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97E87B1956
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbjI1LEE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbjI1LD6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:58 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20AECE2
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5033918c09eso20496773e87.2
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899013; x=1696503813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm6eWdkXRtbkiE6yiEQEBoDe5iM/WM4eQNZl22nI37Q=;
        b=qa8oRA7DYVjUSsIJWvwcPgnnngXw8Wz/XC2HjNoErWQdClDrAUVHIDgRurQptxin3g
         cJZpbw1zAnXt20H5QT5kVITVSOmMQTL9E7Xu+4I4EZ71EKix9qhFGY0POWGLX5Ld83eR
         Vlkr/Scxz4vIWyDVSASIZ24FD0ST38TuM6Areg0K8XKuDEQSGCyrfvvOSj8+HGFKqKRl
         O3Y6l24D2Bq0H7pkz75uleVOHpADMr2AmvXDsoZYFOiokzoY8OLqrAlQLrq1kdAHd3s7
         x7TtvaYtonbOXxxnDTukuprOoFB3QGfJSiRcwb49cNuhcNnmGFer8BZAZfAnUskmT1UW
         5tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899013; x=1696503813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm6eWdkXRtbkiE6yiEQEBoDe5iM/WM4eQNZl22nI37Q=;
        b=ppby7AYDLt1j3h2Cwtds+URxwQ737PehC5swviXnrfLkwKukuuLZFCQ+F09JqECoKy
         jsOfkeiOyv24KqYL8Yy7iqxCJ2KHCcjtTEHLAUPeU22J3WKi5b8zo26boP9aTelKrIDG
         PjoixEo6mHxBoYOeuFojZ6OhwNxVQVWK4mVtT1k20P9W5ufmOnQg9pllpoevuX0jehCA
         zNiT0HKI6spJ03WVr+RI7YKLfO68An8AgrjmkMOmOK4/K1tlwm5RpIoeiFkvCnHnejHB
         XtWbH82OjMbyWSJ2g4caS+lKecKhTF//bmcPTH1mlE/2FB8gjOIWSf7Rx8jbbAHFNOCh
         DNOg==
X-Gm-Message-State: AOJu0YwmPPL/TuAnjyuYzwFJiavTb54lwrZWptOdXuI2+PYY9s7ldZzd
        yH6u9gApovDAaQIK6cXoCOsXHA==
X-Google-Smtp-Source: AGHT+IEnl1aVLFAz34yc6Y9Kbyr/iB1hncHxUTCaffKSciAtgUe7cB6jUvUXjWMTWVZJqsB9f5RIRQ==
X-Received: by 2002:a05:6512:39c4:b0:500:bffa:5b85 with SMTP id k4-20020a05651239c400b00500bffa5b85mr1081423lfu.32.1695899013018;
        Thu, 28 Sep 2023 04:03:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 26/36] ARM: dts: qcom: pm8018: switch to interrupts-extended
Date:   Thu, 28 Sep 2023 14:02:59 +0300
Message-Id: <20230928110309.1212221-27-dmitry.baryshkov@linaro.org>
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

Merge interrups and interrupt-parent properties into a single
interrupts-extended property.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
index 85ab36b6d006..22f3c7bac522 100644
--- a/arch/arm/boot/dts/qcom/pm8018.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -18,9 +18,8 @@ pwrkey@1c {
 			compatible = "qcom,pm8018-pwrkey",
 				     "qcom,pm8921-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8018>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8018 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8018 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -38,8 +37,7 @@ pm8018_mpps: mpps@50 {
 		rtc@11d {
 			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
 			reg = <0x11d>;
-			interrupt-parent = <&pm8018>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8018 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 
-- 
2.39.2


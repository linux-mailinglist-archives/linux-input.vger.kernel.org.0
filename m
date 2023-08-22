Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0349E7836C7
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbjHVAOc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbjHVAO2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:28 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0E2CE9
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:11 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe4762173bso5982882e87.3
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663249; x=1693268049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFX9JomlQAWrg2wVtXgvkj8bMtfCZmpZ79ww1DHQiqs=;
        b=ymnvu0QQkENKIxc8KWsWVt0xGK9GnN9JkD+0UHqhd678STdJK0IMRf/QxxcB9D5NKU
         4PG/+hycKFIjB8llLYSKXfZO1LOrdloPUQ1XZtToIz/lM1E7A5k7yri2s8Jrtb0vi0aV
         OG2Go8aJtzUPP41C6guowZE/Ng5XwdN0EGabPW1eZ0Coq7VEdJtw5e+v9VBRvuhoQgEF
         OwwC+0UNdwp2aRfzsoS2E99JbqU6q5sgvpQ9l0E6km+jI2bWtQmLzQ1M1qyekjv5PRgp
         LB3cDpuA7PGv9BNy3ZSRilT34Z5Al0gi+rpHGZis8nbDNRhEwA/zmEORJOmN3qzUZbJh
         8ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663249; x=1693268049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFX9JomlQAWrg2wVtXgvkj8bMtfCZmpZ79ww1DHQiqs=;
        b=LzLqNO0aAm0bpndQqFxmDgIvHiJDT2FTuWjOhnXMaqOdoQgYB0GrfWt7TPjecs1poX
         YdhNzqvRC4oYo0aQL0ee3HvvgWfGWFrXaO0FeayKdRqAEvm4IgJu0UnK0mGR1tlsHc8y
         0IkDuuvcj2Wfyh6nOp7ENk8i38fw/FFVzbDC/WZ36yC41Ek7uXfTKTQK4silRNyVuh/g
         sodVUl5aFXoDtxHLjNVB6pKkNej+HqlxHb4dAfepd6KpvvjJM+rFnRGHJYZKskcsi7Yf
         OVp5Pvqcng3PbwOeY2T2Pbv1TVmHSh9vF9jokKT7DP2AJuOg9DZgMfS/3V1tzeeis0Ns
         fM5Q==
X-Gm-Message-State: AOJu0YzPq9n4gtcfsopx7GT8RlATp90+pmCGSk4wJ7hsqiTODgii/Bma
        MGCiQ+sbXfXe9vvDCORku4Ln3Q==
X-Google-Smtp-Source: AGHT+IHlKYX11hBhYXXo1FiK5GB5bsd1JBqCiP73Omm/HcI7IwCiMvbYtZcm0GTsscz9LLfePHhTWg==
X-Received: by 2002:a05:6512:2304:b0:4fe:d0f:b4f7 with SMTP id o4-20020a056512230400b004fe0d0fb4f7mr5622326lfu.65.1692663249612;
        Mon, 21 Aug 2023 17:14:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 23/32] ARM: dts: qcom: pm8921: switch to interrupts-extended
Date:   Tue, 22 Aug 2023 03:13:40 +0300
Message-Id: <20230822001349.899298-24-dmitry.baryshkov@linaro.org>
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

Merge interrups and interrupt-parent properties into a single
interrupts-extended property.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Konrad DYbcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index fa00b57e28b9..360a179670c5 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -11,9 +11,8 @@ pm8921: pmic {
 		pwrkey@1c {
 			compatible = "qcom,pm8921-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8921 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -32,17 +31,15 @@ pm8921_mpps: mpps@50 {
 		rtc@11d {
 			compatible = "qcom,pm8921-rtc";
 			reg = <0x11d>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 
 		pm8921_keypad: keypad@148 {
 			compatible = "qcom,pm8921-keypad";
 			reg = <0x148>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
-				     <75 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 74 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8921 75 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
-- 
2.39.2


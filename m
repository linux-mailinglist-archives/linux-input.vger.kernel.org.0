Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2AB07836E0
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbjHVAPI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjHVAOa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:30 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50FECD4
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:12 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so56951341fa.0
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663251; x=1693268051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrAjsdbjqNoZfzO46ca2VQOrSbv12nquDzMHZ51VtI0=;
        b=DeRpgrNrnkp66ihDu5SBDsxsCRZFVsavjZsjnUqWdSrhGcsDGuHyuVAccydL+l+eOg
         wsRrsUWYCTcUj+AgMq8+K6mKdUU8Bq2r3dK4OehUTjOKGmVJW5s3HdRwZsKyUwgzFbEc
         VKd5f94oHXXGNadc6CxNkCbhNGIMdzMPgF5aXK8u7a3MOzSsvDwtkibRRBeglTxr8n23
         er3ym3iwq70Sm7V/GZ3qlN4cpIcJm8LGGfxf3EatE7j3tmXZWqxR4xihLQKJ16k9MuCz
         8WitedV+fTWFwcQPGueoA0Y3DJIP2v9zo7tS6qSYTI7EhbF3tUsMheKQJOA4UpmgEDp8
         Vh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663251; x=1693268051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrAjsdbjqNoZfzO46ca2VQOrSbv12nquDzMHZ51VtI0=;
        b=UkMunYmj2IrTWnbpmsqXHUnzOqHEHGT1Fo5YvCfq+POpBG3GDwTR7sfixnor68sUO/
         Z3MbIuInK+fcddYdE+tO6EdjyNXuSd59uGvgM/FcF3Qe5aJIQHBoS/3GDDRFZ3+WzSH9
         YHCTWwmPaXytu3aeTbhs1mLcu9KTO8Cw5rTNQ1XKWBg2vVDbEJFmE+OQ5nlqycdoLPUS
         mEQrbT6DdtzZzGfGkL5JQ4kcuG10+YUCwUxkKzWfdyqlGbF2eOo9/cgQbGg7iM0+5EWd
         o61uQI4ZEUHSd4oDtmahfZ0yBEuf8//ZU7gh2ZoYFq4PVt5ydzqVvNM56MGmJzlrGwVI
         ctjg==
X-Gm-Message-State: AOJu0Yz1tCNeYu5QlCJfmrf/akLh7GOCqn3fgQv0B4uLBH8KBMkvUOmf
        Rv3CTXDJ1uAKjzKJk459EPwGBdKKZ8/xpSX3j/U=
X-Google-Smtp-Source: AGHT+IHd7EmGp2zfhAKo6WVQVNP0hju/z8WnrE1laj2kAHZedznpq8+1ZwY1R8tjBPcYiWY3DZ1rBQ==
X-Received: by 2002:a05:6512:230d:b0:4fb:7f45:bcb6 with SMTP id o13-20020a056512230d00b004fb7f45bcb6mr2482716lfu.16.1692663250998;
        Mon, 21 Aug 2023 17:14:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 25/32] ARM: dts: qcom: pm8058: switch to interrupts-extended
Date:   Tue, 22 Aug 2023 03:13:42 +0300
Message-Id: <20230822001349.899298-26-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8058.dtsi | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
index 3683d7b60918..984b79777984 100644
--- a/arch/arm/boot/dts/qcom/pm8058.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
@@ -11,9 +11,8 @@ pm8058: pmic {
 		pwrkey@1c {
 			compatible = "qcom,pm8058-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8058 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8058 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -61,9 +60,8 @@ pm8058_led133: led@133 {
 		pm8058_keypad: keypad@148 {
 			compatible = "qcom,pm8058-keypad";
 			reg = <0x148>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
-				     <75 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8058 74 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8058 75 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
@@ -136,8 +134,7 @@ ref_muxoff: adc-channel@f {
 		rtc@1e8 {
 			compatible = "qcom,pm8058-rtc";
 			reg = <0x1e8>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8058 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 	};
-- 
2.39.2


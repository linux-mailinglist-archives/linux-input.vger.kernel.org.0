Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E137836C6
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjHVAOb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbjHVAO1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:27 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E726CD0
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:10 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4ff88239785so5851073e87.0
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663249; x=1693268049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDlULPpCaiOZl9KqGYW1vmjYvdhVYMx48DSYOBdmQVg=;
        b=VyePFHGKX8jm6zfzQhlfmU2AMSzUemu+K2L6a3PvhACnlRD24SrpapppMp0d4Fy7VX
         Lit6r9DAn7uRtkXOe/y6gsRJ9y9bBy57sAOgDR0aPt7wXecv3/wgZmzbZpRvyALlXrR9
         eJls4x/ebv0NWAp8wpR+7r18gaGkierDqZRBBxG2n5L6IJQdR92hVeDSao/fSA/bNIZs
         DN19SlS8II24rBbS7VCZ0N1bb2zKm5woVjzHUzkejLJVooW5rUO6getM5oWKJWi/eNaw
         6f6uFiKQnIaebwbZh9zuY1r54FlwEKWk6bowrqNaf8avrNbTI4P/6Cao2VMEYahJLf05
         xJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663249; x=1693268049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDlULPpCaiOZl9KqGYW1vmjYvdhVYMx48DSYOBdmQVg=;
        b=EGcEn3tjDLR1f538bEkAklDAnwNB62PniFrxfQZuYj+Ihf/xU5hb6Ndy9ByU2gBVDC
         HZGyG56/LJ8NSTshSqNDK3M5tizRTiWC1VTCXnQlx3TismUyQAwp7ylU5B+JW7p4XvTV
         Cjp1PYhaRY9dP5mfWmz630XXbhCCND+MKeIZbI6YUADlhmZMngi+2+hzdCaYfwQE1n40
         6M4T5y3Q8MCA0v+xVUDaspjmCyNx8Rrjag7pCJTtFLnCbPy3h5ZkloTY8tu9DoQYSyN7
         jVE/VeveFnkl+R8Rs0SQmve9wpjd4mCGdaG4FvS9jiVS2f6uFdBC81wLpR2YyILBHv77
         Usjw==
X-Gm-Message-State: AOJu0Yy0ZTz7+kAeryeH4RnPJNT9mE9s49feJfe4TUW3i0VHMoIEjHDh
        dgR+POrYtmZjzxWMUze1w70gzw==
X-Google-Smtp-Source: AGHT+IE2BWUsYliJCaISc/kXdzVsUKq358wk9GV2cf/Uw+1asLqisVoVWSujtjpMnkK0ZkrFr2DeyA==
X-Received: by 2002:ac2:4309:0:b0:500:86cf:1249 with SMTP id l9-20020ac24309000000b0050086cf1249mr1270880lfh.61.1692663248886;
        Mon, 21 Aug 2023 17:14:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 22/32] ARM: dts: qcom: pm8058: use defined IRQ flags
Date:   Tue, 22 Aug 2023 03:13:39 +0300
Message-Id: <20230822001349.899298-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use symbolic names for IRQ flags instead of using the numeric values.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8058.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
index 913a511719fa..3683d7b60918 100644
--- a/arch/arm/boot/dts/qcom/pm8058.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
@@ -12,7 +12,8 @@ pwrkey@1c {
 			compatible = "qcom,pm8058-pwrkey";
 			reg = <0x1c>;
 			interrupt-parent = <&pm8058>;
-			interrupts = <50 1>, <51 1>;
+			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+				     <51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -61,7 +62,8 @@ pm8058_keypad: keypad@148 {
 			compatible = "qcom,pm8058-keypad";
 			reg = <0x148>;
 			interrupt-parent = <&pm8058>;
-			interrupts = <74 1>, <75 1>;
+			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
+				     <75 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
@@ -135,7 +137,7 @@ rtc@1e8 {
 			compatible = "qcom,pm8058-rtc";
 			reg = <0x1e8>;
 			interrupt-parent = <&pm8058>;
-			interrupts = <39 1>;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 	};
-- 
2.39.2


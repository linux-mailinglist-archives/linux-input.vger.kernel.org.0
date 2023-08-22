Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 040F67836C3
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbjHVAO2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231865AbjHVAOZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:25 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F5BCC2
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:09 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50078e52537so3047112e87.1
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663247; x=1693268047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=etVMUpKZEkmyYDGi+eS4ho+3v8B0DCp5dirkbIWCGXqQtSImz8ScI/lbosCqeCuXzj
         8HtE+L78lKJ3uoEJml/41A/Fo88/itYs0XSQCmxZpHjs+CBceUcUQANhft0dmgTcZTDx
         bbgzNz/qdph565kLcF04zAY/Gf/t+4txu1bNJSrXQU9m9Y6f6KcAP6ZxprXt9UuuxfEE
         121FgicHRWuq2EwkqXvTHRKnKq2HAzleydR7kmkJX2NUTQ5tbbt+WplCkApjfcKbLgH3
         8PmU15lkRacmdh8Ee+98mn3v/d5WzhCqTerZBYduc41N6vbL55K2oWn9uW9FCRyPmFhY
         gtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663247; x=1693268047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=jrFJOhg9tIabG+pB31O3R+7THl8Ll5XwhiLlXHizDGcXG0j0jHxg0+NuorSUJTklmz
         ql5l2+NsXXMt8LyagLkkKfUj9Xk4ni9aoS2IeUpNn9g4tmSQbytlwFk7jS4y3sZVAIAC
         Fa9+7GMzoaLO9dHV6OGVA4rGLvNc468voaRWgOVt4+cjlgMh+/2g8DMNWlCq7K8UmcBF
         73wmqE2wJfWJxvCnTmk1hj/pC/iYi8VP/+pO0qjW0PXU5pYpGwWhugd3TxEugC4bbFTr
         FFbGqhsedZcd2p+93BHL2gjms+kCa0bplTmPJ77O7CAQ/M74vTU1gLBF/uSiXr09bmw6
         oE9A==
X-Gm-Message-State: AOJu0Yx9EolWbIBM8x2N6YnQF4XXczgUcYLwsWmfRL6TsmYtGqSmpXEf
        Vc4bQQvVlSofnv8wZ7TaCQFazg==
X-Google-Smtp-Source: AGHT+IG8KodIFQEaKNv8A1dawB2DVXnum+OmxFCPZMJgsdWebfCvaXviXDFAXozO2UgVGfsL3ctxSQ==
X-Received: by 2002:a05:6512:3e9:b0:4ff:7046:984a with SMTP id n9-20020a05651203e900b004ff7046984amr5307801lfq.7.1692663247385;
        Mon, 21 Aug 2023 17:14:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.06
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
Subject: [PATCH v3 20/32] ARM: dts: qcom: pm8018: move reg property
Date:   Tue, 22 Aug 2023 03:13:37 +0300
Message-Id: <20230822001349.899298-21-dmitry.baryshkov@linaro.org>
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

Move reg property to come after compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
index c602544900b2..85ab36b6d006 100644
--- a/arch/arm/boot/dts/qcom/pm8018.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -27,9 +27,9 @@ pwrkey@1c {
 
 		pm8018_mpps: mpps@50 {
 			compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
+			reg = <0x50>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg = <0x50>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8018_mpps 0 0 6>;
@@ -37,9 +37,9 @@ pm8018_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8018>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2


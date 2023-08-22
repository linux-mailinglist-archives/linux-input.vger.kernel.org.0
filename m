Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5F27836A0
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbjHVAOG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjHVAOD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:03 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8661A2
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:56 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso5816661e87.0
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663235; x=1693268035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OscKKgci2rp+6Tod4IFcOeliAS+Y/Y5On5e3QKehsM4=;
        b=mCshifbl8YR3z77Q9qR4bu3z24NHzJqxWuFVVsXbBwSEt5y7gr+DzX2qS0SkyoqtF+
         uS6UAKJ1rte959C1EiYo6r7o0PirojOTteM1aXsZagmIcDGFC6jq/FnG1t+Wx3MnTWwe
         cmHElgupZMHkEuyjE6opeusbaDTdfiuMVndMiE9duFoWNh/VIm5CkfsbMG9b3X3LLDzL
         ulCqFZdhMtv9f4khaWkxodc9pd2TVBwUzmHThMMvGNcjgVs7ubJbxsEa8DjFz0rc2Evq
         VOh3WK+w+bZvmOde2SkeJaCUyeCKJD3AA538VfWDyDBCRemDNECWgmULs3erYRFjFpGw
         HzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663235; x=1693268035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OscKKgci2rp+6Tod4IFcOeliAS+Y/Y5On5e3QKehsM4=;
        b=lBmY5lP8sGhQchq1Vdt2m5q7VY1CSlrkOgir6Ebm8Ias9pHWActHDg0dKSnxWd4SqG
         kS9I4b7dbKESE5Tpax3EAjcmuCidZFH9gIc1Z2lzo0l4cHwlhhcXN4rKxF4WqYFnXqjy
         1F0dmVVAUuknkLOLPnr0xE7xIbcqGcVb9baFLY8szgzXkzOePQK8z/5Yb4ogkkrVxeA7
         wRUoSkcXYt7Qd7W1zXBbG4jxFgHcWQoa1UuE2hnLvog5BmPNAPh/57CIZf3oZXUgJ2I/
         i6dpeQgqjgFG/1j+t2lXb4pAwX7ZuiCBsqf/0Ku6JgcLP3kGQ+TXp6Tu4lC66gE92LUy
         rkQg==
X-Gm-Message-State: AOJu0Yxnqti/Q5/1UbKP/TiccWMy6T3NDdYXtRFZebgdJf9zECm2i6zC
        TazUUsmEI2Sum+Td8wcWw6eSyw==
X-Google-Smtp-Source: AGHT+IFKn5OWGe8zGa0Wn6GgzYsqT1eReyaqis9Se/wW5s8QJDlAFUH8fG9MVTFRQD3mp9JxN4lRmg==
X-Received: by 2002:a05:6512:3085:b0:500:7fe6:793b with SMTP id z5-20020a056512308500b005007fe6793bmr3426980lfd.35.1692663234819;
        Mon, 21 Aug 2023 17:13:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:13:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 04/32] ARM: dts: qcom: apq8064: correct XOADC register address
Date:   Tue, 22 Aug 2023 03:13:21 +0300
Message-Id: <20230822001349.899298-5-dmitry.baryshkov@linaro.org>
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

The XOADC is present at the address 0x197 rather than just 197. It
doesn't change a lot (since the driver hardcodes all register
addresses), but the DT should present correct address anyway.

Fixes: c4b70883ee33 ("ARM: dts: add XOADC and IIO HWMON to APQ8064")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 516f0d2495e2..950adb63af70 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -738,7 +738,7 @@ pwrkey@1c {
 
 				xoadc: xoadc@197 {
 					compatible = "qcom,pm8921-adc";
-					reg = <197>;
+					reg = <0x197>;
 					interrupts-extended = <&pmicintc 78 IRQ_TYPE_EDGE_RISING>;
 					#address-cells = <2>;
 					#size-cells = <0>;
-- 
2.39.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B57E789AB4
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 03:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjH0BAp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Aug 2023 21:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjH0BAN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Aug 2023 21:00:13 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B60E4B
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 18:00:08 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so31772391fa.2
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 18:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693098006; x=1693702806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPGHh0Yc1od2zbTrwc+6JwXrsuE73ZiTR95u6Arvrgw=;
        b=I8MDGVMh+zj5dAmNy/aSDYaBTgcVRv6bA/klu1RGKSPjBAyS4+G0lqY9ELt+LYNsSd
         iGazQzjL2HyCSyO/S7rA9LBygcK5Zx4AR4SrPGG/eZoHGM57FKEpOaq4tX2Gum0eUpN8
         MacLDFi+qcAE2b9gR5SNc0WSxepDy3Je5gGcUSjd6RjZ+V78mlZpubfpTlgDTSiHivxu
         9ec4RrsMpgHDB4HUwvYwyotpsKBcKjKNOoaUVKhIdR8kpuMSrFitgthUDAyNHzN8tqsW
         yehh3WAG88bjqs3682OgAIBnsEO1aVtnDY1se6fcGR2MPJX+Fqz06LmGI1mObJbfyVdV
         JcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693098006; x=1693702806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPGHh0Yc1od2zbTrwc+6JwXrsuE73ZiTR95u6Arvrgw=;
        b=SfSlYx9TROVd1/hKWLVfTWyqf29cGSS+PopTlSoJkgAzkS6czpiXGAq5RgAAHVq3wH
         xHIBQZyZ+ykPvhgf5kvqwsOo+Cd48k1lB7V1eki2+AJlJ2WaUDSkUVHNJZRtHjh4sDoe
         Jv/ZSRHL6r+2dxfkfTR0TeIaacSBsBuL3ck6A7OvYtDVjrdaTEYoX/1LrdyJRt+q05v5
         Uzjq8NB3pB4EWZucJT5LrVpcGGspDvYdnmJ3AyqVVN1d0qvRTgN2XqmNjW70/+dTbStv
         vJS/YlmH0PvbTQBf8Ddfk+olRvkl12JH5/ZMfqYYDz7UpisXiV2mYJY9g1HzOxFejf3v
         2BsQ==
X-Gm-Message-State: AOJu0YwoZ0iJ+aQJehzu22zdM4r+g5nz+zagLW2TiGfdxiKb7AYJ0mND
        prCIzxIj6I0pWfdhpy8E8F1aHQ==
X-Google-Smtp-Source: AGHT+IHHy3dYU8bdVmLSeHBW4nkX2UZ3uasIMy53KRd+M3cg93eG8oeAEKfFfZ27unNObXvYBd+i8w==
X-Received: by 2002:a05:6512:b90:b0:500:7f91:fe2e with SMTP id b16-20020a0565120b9000b005007f91fe2emr18988379lfv.34.1693098006568;
        Sat, 26 Aug 2023 18:00:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.18.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 18:00:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 37/38] ARM: dts: qcom: ipq8064: drop qcom, prefix from SSBI node name
Date:   Sun, 27 Aug 2023 03:59:19 +0300
Message-Id: <20230827005920.898719-38-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 6198f42f6a9c..c3677440b786 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -366,7 +366,7 @@ rpmcc: clock-controller {
 			};
 		};
 
-		qcom,ssbi@500000 {
+		ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-- 
2.39.2


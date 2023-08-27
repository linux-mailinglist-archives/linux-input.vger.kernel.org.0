Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C17789EBC
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 15:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjH0N0k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 09:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjH0N0G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 09:26:06 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94521CC0
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:59 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-500913779f5so3709780e87.2
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142758; x=1693747558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgscUjE5yDYSGHC1956h5azSC53EgKvpe5p9UzSNGuk=;
        b=mXXXNgzGSReQ6jQUF/A8MlOxA9vGYi6rwjbMQRXQ/ehm+7xXMPk+BTFQiYeB18tw/4
         a33hehxZRRXNdl97bnvRJul+UVAAH5hLPLhzyLudZzjbFetLxpBQn0CyowvsWTmVxpSa
         gIoEWmc6IifWoy0AIj6rerCRscMN5A/aHTFBC5mk5NKcFH2XR1opS0AWIM0l/CcrMnx+
         Ink6A/PRZRPocNkBVwHfCmIZGea1dKpmUTfWxTkjkZRP2x5Y16kIIf4mWmTDiVcOWpsL
         k5VbXCg8JNcvJBiuSWbaGHbFTgPFYniy7n7kvZR+lVaICzjDSaqymOkzJo4sEa/JoxNg
         WuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142758; x=1693747558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgscUjE5yDYSGHC1956h5azSC53EgKvpe5p9UzSNGuk=;
        b=SZe2SIhY4FKNidOBJGC+hNgJ+VqIq2Z4SrfGnJhS0SXzZ6x5NIisxU2hHdsS47D6Dy
         m7aO+b9Zd1NDPWf9sI2K8E8Vl5fxJoKFJn5MN5Jep+ptFoZrKg3ikBZptRTkJuOqtMyM
         19fuFbYMlNMATl7ttc8TKOQlQf0IrAft1zCL2BMW7kJ6HjCHf7Gqb7U4Imyt9vz2mcwY
         ZGY66qglmAcKnXhak/jIXkVf9IkBq57sr0qQhypM+p/mSuvxZtXiYiSgmKhhYcFQ8YkR
         8vtg9TAqflF1i+5ggBCwq0q+m4x4HljwJbkzt0uY/GOmo9JcIlFD1e9A3hWYbZJytB5v
         G0Ag==
X-Gm-Message-State: AOJu0YzeHqfJluX8yeMK1WaRfkCVAhd5z0zkuuHhXNXrA/qi2UPEB+RA
        YC4qAS1rtWn5hhd9P/uFh4ZtDQ==
X-Google-Smtp-Source: AGHT+IGy2k7YsLBurwPoagaVteEGqHoEFuFN2j79QP6Ia/1b3mFH5soRZ/nt7IeVX9r68//2ahCa7g==
X-Received: by 2002:ac2:43c7:0:b0:500:8f64:52d4 with SMTP id u7-20020ac243c7000000b005008f6452d4mr10008489lfl.53.1693142757945;
        Sun, 27 Aug 2023 06:25:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:57 -0700 (PDT)
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
Subject: [PATCH v5 37/37] ARM: dts: qcom: mdm9615: drop qcom, prefix from SSBI node name
Date:   Sun, 27 Aug 2023 16:25:25 +0300
Message-Id: <20230827132525.951475-38-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index 07e712e890f6..b02336bd8370 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -258,7 +258,7 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
-		ssbi: qcom,ssbi@500000 {
+		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-- 
2.39.2


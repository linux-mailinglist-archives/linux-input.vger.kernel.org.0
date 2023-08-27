Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BF0789EB0
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 15:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjH0N0h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 09:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjH0N0C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 09:26:02 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72E319A
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:54 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso3596673e87.1
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142753; x=1693747553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPuoBnKtEFgCdxUoOIFl3Fx3Gw36qHVcIvB+5tSO88E=;
        b=DWaUa7Dhl82MsB9Ytr6nJl9QQwUpkgoe74Q2cqUqMy5cSY9SCCb2CgZ5PjI01YlLx7
         XjXgG6aYXICwbxDtMFke2a6OrC22yL5QVCPESIx/gaE9zELB/0Y+OPhFqYEifnLTj22x
         wciYG+GE7VtSnPgYr6MERt2qpEQm5ll7Ks8lt+ht1P83MLhlCWgy9mtzXFmPWQCyTbNM
         GoteD5BwNkA3YGvZyS56wkF/exPLoA+cXKcPi//xm8d1EfwhceHWMvOf3oM8YUUKsndX
         f4w8yw9jEW+Olp32WwW4wnisQOsmmxdL9OLOqgcF0fcauM2U8+OHWdg1oA6NGqdJC9TY
         yyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142753; x=1693747553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPuoBnKtEFgCdxUoOIFl3Fx3Gw36qHVcIvB+5tSO88E=;
        b=TJxHsLXYmYua5w1WkoTpqtUzo2bwHJgpolSTrDQH6qivIbO+AbP8SVV61Bq+xPd+t6
         +Rq6/jDajjTicz+XRo+qlb22fbXpL1AvPSOBpJF+ZwTkT8f4XIHU3oSTXJp0g70ZzRvl
         8p+/3GDgZvqJ67MAXN1zipCS5bPcRNcAbUd+7DxlalJ6YTc3OsaagtpC19Kc+JV3yRpt
         E6W/NhpaW+/j4IVzpXkpLEdPo8xcuRC9uImrV3wchA7bfDKpfkXcmoVz3XlaWwkHKiVG
         5FzDL5iqgRmq2rU1wril24Dc37bYoycSpFgt5THf6pZQNwdngOQMwMgLxh7hg0o9dNNb
         nW8A==
X-Gm-Message-State: AOJu0YwytmG7DUjX7prelYmGBz2H7TgITAkgAMH7qfJSI+pGFfpV6qNr
        iEkOuTHrp23awizHjpwPHLjWdw==
X-Google-Smtp-Source: AGHT+IEXejy0nOnu8nGlTyoCLijTGrLd0g228vfG7jt3GiUaGMr966aAb/QTBEkf7tDzv3ZMgo9DiQ==
X-Received: by 2002:a05:6512:12d6:b0:4fd:f7a8:a9f3 with SMTP id p22-20020a05651212d600b004fdf7a8a9f3mr22413591lfg.38.1693142753248;
        Sun, 27 Aug 2023 06:25:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:52 -0700 (PDT)
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
Subject: [PATCH v5 32/37] ARM: dts: qcom: msm8960: drop useless rpm regulators node
Date:   Sun, 27 Aug 2023 16:25:20 +0300
Message-Id: <20230827132525.951475-33-dmitry.baryshkov@linaro.org>
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

The set of regulators available over the RPM requests is not a property
of the SoC. The only msm8960 board file (qcom-msm8960-cdp) also defines
this node together with the compatible string. Drop the useless device
node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 774f507fa25a..f420740e068e 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -200,10 +200,6 @@ rpm: rpm@108000 {
 				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ack", "err", "wakeup";
-
-			regulators {
-				compatible = "qcom,rpm-pm8921-regulators";
-			};
 		};
 
 		acc0: clock-controller@2088000 {
-- 
2.39.2


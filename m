Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C95789A73
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 03:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjH0BAK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Aug 2023 21:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbjH0A7y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80651A6
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 17:59:51 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-500b3f7f336so688714e87.1
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 17:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097990; x=1693702790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k892yPv/128pmT+0c+CLRewxWCJSJdHIcCP1VlRPxE4=;
        b=mgTGNBOjX99quzGBh6ljsouX5WwJPGLN5MrRCtbPGui3T2G3sksoXrcw+4krzD52tI
         47a2DUT321g1BvEMpn+LmrKaP37pEYF5b7HWStUj/UOSzayI9ugKoDmyPYRVOrmjGqkG
         qMnfZA1NgTk1vRfOETy2rMk5OE7L/xcXrjcYF+5fVJ+9KaaTzdXofw2/r26e1qwNK5Xh
         BNuRs9iwU+xCO0fB6yHIo42zrzMHjne3qKlg81/Ges5kBU0jdf7ajaAFtg3akx2dtSXg
         Y1oplnmcskczCfS8I6ExuNDT0osA3NlKCHUw848ZRQAE+hsL2XItL+5AV4y2LpaveOxp
         j/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097990; x=1693702790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k892yPv/128pmT+0c+CLRewxWCJSJdHIcCP1VlRPxE4=;
        b=eHX7iSuzIMHE3ztIAPrIW0WfwoQRsNTdGTl7Ca3euPcd9lcnNWAXv80vtkGzmH/LAL
         S6BUMh1+9c6uG+mMGurlou0uwW0ca9s4JEkpUxN8+lNrpmUWEJxyegAP5elE/IL99op3
         6bVgzyUtW3Hw3AObNHnmpdWKUJlzwPcDYcbnQexpxF/QDLyZkkiWoiK/8KfV7xHxHITU
         vsg/gWtg1lU7FLHdkiUBf0UjxFgSipBfEERMy/SrEQhzYcAFwpLCuauBZ8hV8Gwti60o
         lTzPnEYF8iEd0F8I06eJ2B8eQtnp/Ue9R22ESFnGSuj8WOex+Sd9zWjnSDqUypAtTug+
         Ajgw==
X-Gm-Message-State: AOJu0YwXcyNQ4C5DAfRMy7hoM5geDcsibQYPxwHEsbmjpWSXsrHI6nPR
        7eZEEiWsy8Rtel71rvHh1A7nEQ==
X-Google-Smtp-Source: AGHT+IETsPZ1gPg4N+RQc17tYUYoWrxnLewLPI9ZK0OjvAY4erevjJVJu69JjMGcrWIVWxQfnPJJNw==
X-Received: by 2002:ac2:58f2:0:b0:500:a789:cff2 with SMTP id v18-20020ac258f2000000b00500a789cff2mr3141520lfo.19.1693097990090;
        Sat, 26 Aug 2023 17:59:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:49 -0700 (PDT)
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
Subject: [PATCH v4 25/38] ARM: dts: qcom: pm8921: move reg property
Date:   Sun, 27 Aug 2023 03:59:07 +0300
Message-Id: <20230827005920.898719-26-dmitry.baryshkov@linaro.org>
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

Move reg property to come after compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 4697ca33666f..fa00b57e28b9 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -31,9 +31,9 @@ pm8921_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8921>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2


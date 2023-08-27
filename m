Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD6A1789AB0
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 03:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbjH0BAo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Aug 2023 21:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjH0BAL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Aug 2023 21:00:11 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B18E67
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 18:00:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4ffa94a7a47so3218263e87.1
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693098005; x=1693702805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hx4XSe/NLtIIcU8XS/aqeNQhQByGw63IXr2PekRrcFA=;
        b=xvJ17m7V25/YwvKh4yxCkyx7J05xGQJLqOs9Q+Y4TkwThV5z5tggCSzxGK2sgtGPZ5
         F7bM47HaD4IWowEdGT6Oqpqm6S6G8qVdlbaEdRwm2QSWkt2uuhwRV0FUb9cJThYL94lj
         OoVuYxLEIfX9XzxIZ8yWIc9+30/W5YaU/2GX1lLxMea4zrnox9CH+0h8VzoWGLHT/XXD
         hm8jnVSYR40OQxqT3e3y3vni3ZguGTMTMlB8+dRNKtbbKjKfye67GQbroQiYw6iXJMkl
         tc5SLntLSrkuyTJBkP4w+fpDsWWD/SU6yArr92nu/26kdY9F3eJuEWql1qoN8VMuk88F
         spkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693098005; x=1693702805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hx4XSe/NLtIIcU8XS/aqeNQhQByGw63IXr2PekRrcFA=;
        b=NYAYortmVrAcfvXRLX2XOg3b3Rh2vQQrE3V2+DXtrsjcCOgTJ6NW7Y+qTsyh5lGLB7
         nc7MThT93mBmW8pg48+tJZNFb8G3q/YT/rM9z0AgJoXetd9HndR+08IXn5hXqf7xPhbC
         kTtxzRyfFOkPRjOZL1YCHFXLcG3CfbLC1pbICABGnjxhHHVJ5SkgWM+uzEdrbiUDMAaP
         bGsswu2JkGKOj4ID7IubAQCyWzXhL/RwfnGJnL95GkZg1zt1moABQNnbqguzdPEuX1D5
         /VHD/zckIyCKNtt7zmgW4HUOvN6QgTNBNeIdolCP9lkw9VEJOPt+GHDNtgJejAHCkLxz
         QrBw==
X-Gm-Message-State: AOJu0Yyp12nJMo7v55wzwjBxfGIkKVTJ5WtYbJ8n/KZCIx4PsZptEfR7
        qCvlWEIMl/a+Qg7I6v3snyHxIg==
X-Google-Smtp-Source: AGHT+IGwIJOW2n2P7FY/gY0MrKKkYf6g0hYYDtVz2inuriDR40FzZyZZgSx6KqmqiOAvt0Yaq8zknQ==
X-Received: by 2002:a05:6512:2347:b0:4f8:8be4:8a82 with SMTP id p7-20020a056512234700b004f88be48a82mr18651829lfu.22.1693098004764;
        Sat, 26 Aug 2023 18:00:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.18.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 18:00:04 -0700 (PDT)
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
Subject: [PATCH v4 35/38] ARM: dts: qcom: pm8921: Disable keypad by default
Date:   Sun, 27 Aug 2023 03:59:17 +0300
Message-Id: <20230827005920.898719-36-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since keypad is used only by some devices, disable it by default and enable explicitly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi          | 1 +
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 360a179670c5..058962af3005 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -43,6 +43,7 @@ pm8921_keypad: keypad@148 {
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
+			status = "disabled";
 		};
 
 		pm8921_gpio: gpio@150 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index a5ea4843db43..36f4c997b0b3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -102,6 +102,8 @@ MATRIX_KEY(0, 3, KEY_CAMERA)
 		>;
 	keypad,num-rows = <1>;
 	keypad,num-columns = <5>;
+
+	status = "okay";
 };
 
 &rpm {
-- 
2.39.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367A4789A4E
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 03:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjH0BAH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Aug 2023 21:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjH0A7m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:42 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE491BF
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 17:59:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50098cc8967so3399448e87.1
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 17:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097978; x=1693702778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri9rnBcw0W1qOwLlQ2m7qIoeFZgXWEcLeX6e6XSReOc=;
        b=D91HgEJpmpJbf6KZghzvrFUEX1xcAq9A5zm5uOsqeb3h76B3yt4Gzm0lbThGxmb2PA
         OukJsQkMozYr67kQDdDyk+UmIPM9+URtnLHM4hAiOhT6KFFaNDIJRQYDox/UCm7NMtSa
         AmfjZksHB1iqpwowIT6pUqi7X7Q58Z9Uy/zSXTweqLDztpqPKTY/EF1/Y+C9UcNRmCcs
         8Ka0LJJKyCGhaGqUA4wF2noZG4UddLJoExqbSeKWMIAMeW5uWF80ERpUkfxZS2q/iACt
         gDGYmjmePHCbygHMsa/SygGdhA64GcYdLU/pLhr/B7kNWFYo7pJcCdCDBbuUx2sXZllH
         Pk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097978; x=1693702778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ri9rnBcw0W1qOwLlQ2m7qIoeFZgXWEcLeX6e6XSReOc=;
        b=VEurmw4Z0BkCJ02hb1mdM1u+GU2rVB8esJxUCl5O775oj57ybrG+7S1ZEC3W6SDuEP
         9qNevsPSAKBKR144sj0yN+dECRNU6LETD+4ZreHeEh9JTOGre2uZVBASnO9urDOE+Uq7
         T+utpGSj4gon6oSDc3nUrEx6b1wanQJnti63jcz3mdHqGpxYSgqCglHcvnpImgLOBxH7
         df10mqGjAt+9y7Scj882ysiBfgnFPKBAwnymV3d9vVxHCKjWVKz2HzcwK6wBznEX2tdj
         4xBTu7e69lwuooheT9JHoVOd7dKEY9kA2sPe7+DhkJbr+mjpu9zotiJ0LcBrVxQU0pV7
         8esg==
X-Gm-Message-State: AOJu0Ywip1n0c0tnqMJi0CeRp4KrmEmdd5Y4c/aJrPVF/BgzoJA261CI
        QfT4Df0v4knFq90+/X9RZ33VWg==
X-Google-Smtp-Source: AGHT+IHSntN84JBZbgzjcxbpfmSbME7uIrEw2FKjaThmfLVUjk6nsd/CkQTtf4SClQXzsUKpzgO3kw==
X-Received: by 2002:ac2:4e06:0:b0:500:9d4a:89f8 with SMTP id e6-20020ac24e06000000b005009d4a89f8mr7140644lfr.28.1693097978011;
        Sat, 26 Aug 2023 17:59:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:37 -0700 (PDT)
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
Subject: [PATCH v4 17/38] ARM: dts: qcom: msm8960: move PMIC interrupts to the board files
Date:   Sun, 27 Aug 2023 03:58:59 +0300
Message-Id: <20230827005920.898719-18-dmitry.baryshkov@linaro.org>
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

The interrupt of SSBI PMICs is routed to the SoCs GPIO. As such, it is
not a property of the SoC, it is a property of the particular board
(even if it is standard and unified between all devices). Move these
interrupt specifications to the board files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts                | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi                   | 2 --
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 4641b4f2195d..43149c90c4fc 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -88,6 +88,10 @@ clk-pins {
 	};
 };
 
+&pm8921 {
+	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &pm8921_keypad {
 	linux,keymap = <
 		MATRIX_KEY(0, 0, KEY_VOLUMEUP)
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 13e85c287498..9e203164beb6 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -84,6 +84,10 @@ clk-pins {
 	};
 };
 
+&pm8921 {
+	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &rpm {
 	regulators {
 		compatible = "qcom,rpm-pm8921-regulators";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index ea2d961b266b..f1267c83d67a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -266,8 +266,6 @@ ssbi@500000 {
 
 			pm8921: pmic {
 				compatible = "qcom,pm8921";
-				interrupt-parent = <&msmgpio>;
-				interrupts = <104 IRQ_TYPE_LEVEL_LOW>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				#address-cells = <1>;
-- 
2.39.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20BE4789E4C
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 15:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbjH0N0Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 09:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjH0NZq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 09:25:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1BC1A6
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5007616b756so3755060e87.3
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142739; x=1693747539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHj6Imq7uBO+05o7KAPbPJTeLf8QZzIWxV/Jhqsh6bk=;
        b=dQNuwL5A3PhARqdZjZlV36sd6ZTHOzIvEBGJS7TAAWM4nmSNkSCs2qWmscg587xGnC
         bJF9fuVcbShSsKcuwFLgHc5YnIZppUWAJOXI/q5IqbDMmBXzFOX/kiyVb8Tr9f56Y/37
         kgVifq4uPE2zRNQ04CTnP6N49WqJtXVLLMCKatQC17hNc/X+QKELgp7auYFSW92FG+AD
         Jc5O+1yWLYpqriYJF8+svqf7RDVdwg9jRqdDPsHaEiWgrLm7+V3LRMmZiNde+/sNGokU
         fxz/+Mh60sy319BDaVIlPUKtLosnLETh76bETUhXchn4sQUE2lNfspUc8cuXzt/PGL82
         s2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142739; x=1693747539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHj6Imq7uBO+05o7KAPbPJTeLf8QZzIWxV/Jhqsh6bk=;
        b=IqCHcY9oJDcYArnW+iyeX99LZSdDb/moK5e9sEZJgHhNkNlXf/ARzwxWAM/qhYgw48
         pyB52pkPUBVib1QOpVE3lankADOZqIC3J71PNzrm9ZXorxfcE+CPQSKzW2DzGFlqz7Q1
         PpcmvBpMcZIgv3+GePNdgh9ue4Uwa5c0Ac1Y188KPiyvK/UZ5JEzRqu+8lKpsK3gw2ax
         EMCkeI3bpjK6tWgNbYA/fhqV9yPKH9xrkuW8xbhPNQ+BDs9+Yxj9V6uToU2KLfvNOjat
         OaNCod8DCs45pHQqCtLNpftRt9M7/BqSzwDTUa3+LIVctQRteiebVdjJm4yMzBdaTqJD
         hg3w==
X-Gm-Message-State: AOJu0YwOZs2NIgi3UR8OrSvREK5S6W/EUWaRUoy2m3J9So4a+mAFsRuh
        54bOvCtpoP6H9yRyU7rClsEAVQ==
X-Google-Smtp-Source: AGHT+IFzrHQMTfdynIuJR0OPaeA3u7D2PQ+x3YpNfGXGuIYAZf7ncjR5/Y5KirZC+JGmekN3h4WjHg==
X-Received: by 2002:a05:6512:3e19:b0:4fe:181f:2736 with SMTP id i25-20020a0565123e1900b004fe181f2736mr22168297lfv.33.1693142739148;
        Sun, 27 Aug 2023 06:25:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:38 -0700 (PDT)
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
Subject: [PATCH v5 15/37] ARM: dts: qcom: msm8660: move PMIC interrupts to the board files
Date:   Sun, 27 Aug 2023 16:25:03 +0300
Message-Id: <20230827132525.951475-16-dmitry.baryshkov@linaro.org>
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

The interrupt of SSBI PMICs is routed to the SoCs GPIO. As such, it is
not a property of the SoC, it is a property of the particular board
(even if it is standard and unified between all devices). Move these
interrupt specifications to the board files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts        | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi            | 2 --
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 48fd1a1feea3..e4261d729d35 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -273,6 +273,10 @@ kxsd9@18 {
 	};
 };
 
+&pm8058 {
+	interrupts-extended = <&tlmm 88 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &pm8058_gpio {
 	dragon_ethernet_gpios: ethernet-state {
 		pinconf {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
index 86fbb6dfdc2a..a5441aecd637 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
@@ -34,6 +34,10 @@ &gsbi12_serial {
 	status = "okay";
 };
 
+&pm8058 {
+	interrupts-extended = <&tlmm 88 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &pm8058_keypad {
 	linux,keymap = <
 		MATRIX_KEY(0, 0, KEY_FN_F1)
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 9217ced108c4..84b0366792d4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -341,8 +341,6 @@ ssbi@500000 {
 
 			pm8058: pmic {
 				compatible = "qcom,pm8058";
-				interrupt-parent = <&tlmm>;
-				interrupts = <88 8>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				#address-cells = <1>;
-- 
2.39.2


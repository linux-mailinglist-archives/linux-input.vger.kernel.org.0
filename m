Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913AD7B1928
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjI1LDd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbjI1LD1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:27 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4253191
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:24 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so21153631e87.2
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899003; x=1696503803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yhFXWgI+Nw/HVhizDlvwlBGCzre1lf/F+Jl5Rt5/EM=;
        b=tLFkyi235JlGPgaODrdiP4Ox5p3a1HUeUw6aW+M/OtgSXsUwJdq3CkE70HfUEICRFZ
         BmFtiOofRoioLqxYJsZ2vDa9fVSrFpOMKRtLB2D5I1cUFm+pPHqeuy6mcVLlAeEhrnRf
         5VQKnMR5jAiPkdazqlm1DH0Y+2vG52h6DYDuWC9K/pENCFmHkANVeWKPWJ48HDDqiMrK
         Po3bF64StNQXTRS6qBNkS9nxeUXaBUtN3kYxZnwWwMnlrDjmt8BvE/IsJ4JkO/SK4pGZ
         JmEJgaVxbdbc42+uVFdZSkCilunkRe8gwD8AV/TeXrKzM8vuO4J72kuszqpburGE5fop
         B/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899003; x=1696503803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yhFXWgI+Nw/HVhizDlvwlBGCzre1lf/F+Jl5Rt5/EM=;
        b=In1mNqE2z3wnMm7bvL713ICvpehn7nOq9tQfxWlTzovaUIOM/9B+CVgHpGSHKCVQsD
         l3ykD5e6rAEl5o9nS/KNOBsaR70nFRCFlG+XvgWsGC+Rxo0iihiN2dp096rsApEyuWnY
         fNttg+/BTylXfsLyB5qS2T1PPXajyEppJl7mxRCVJ8uwEsZ1XFXCAxhx4KXPZyCp/C8E
         bABA3MsrBq911BzKCQsjLqwb0eiujqi+YXuiZs/h52b3Te1IdKW4dlhFINLalOGJgNWC
         7Cwf2vQyOQlhBpiOLARblnCLeCEpyUEfnpqt0V4pt78MtqAWU8MQTqe/Ls6cJYq9gvu4
         wHBg==
X-Gm-Message-State: AOJu0YyY8HCdDzPe6Ci7mUFv0X7PZkTN4vt+8p6munXHpeAXN4/amk8l
        eSocjnmB6py3SzTj183wuHVrww==
X-Google-Smtp-Source: AGHT+IGJ3VQlIwDXgujPjHoTOnOyrlE25RMQMjsLqHuYdGkNYO0mipGztQzoq6UxJQ9OULFdnsPCAQ==
X-Received: by 2002:a05:6512:1053:b0:502:9c4e:d46a with SMTP id c19-20020a056512105300b005029c4ed46amr1105183lfb.32.1695899002865;
        Thu, 28 Sep 2023 04:03:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 15/36] ARM: dts: qcom: msm8960: move PMIC interrupts to the board files
Date:   Thu, 28 Sep 2023 14:02:48 +0300
Message-Id: <20230928110309.1212221-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The interrupt of SSBI PMICs is routed to the SoCs GPIO. As such, it is
not a property of the SoC, it is a property of the particular board
(even if it is standard and unified between all devices). Move these
interrupt specifications to the board files.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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


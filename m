Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8007836CF
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbjHVAOh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbjHVAOe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:34 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E003E195
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ff8a1746e0so5921806e87.0
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663254; x=1693268054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDbGrLh7zuvGvkqtKh6fYs5O8nfRm0MW3PtqxxRpdpU=;
        b=F2ZLh7/Qqd/CfbOwijm8uzss51o2x4x1NVp5K9G49FYm+iVDNeY9oAEq/a5GmWe1HU
         8Sbo/Am5HuuinMi4rN8qZJHcBErkJR3Wf6hVSmI89PwHHn1TQPvT4HzOD3pOHoYbKGLx
         PV9vWJ65ZM0I4ITeQtherjotTUIxGJ4aE6PA8Clru4417dJ/9ilsNuO9OU63ifUnrSWz
         XKYWEZha8BtjXijW0XqIxD0h/HSlbqgL9NzjMj81yJPmDqrdkPPtb9K6hMyrPKKLcvJF
         sb9hosG/s3qKfI8sWVHYDmOL2E6NdaR+s2pcZ24HjeYtf6aEJU2qMd72w7dr8rzNQgYk
         g6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663254; x=1693268054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDbGrLh7zuvGvkqtKh6fYs5O8nfRm0MW3PtqxxRpdpU=;
        b=PXzXgQUT9GP0+2x24ygySdOVQ4jEKmE0xdGtaz+fqIXYc9Lv4b6+GVJiVsk6LgLRo0
         Av3w+aoufxjvchpNZOC/Ug38M4B+tGW4rEBkNDWg5IzymU4vrq4a1dGoyHqlu5yl1rFm
         p7+RyGe2sYu+f6vRi0BqR34dTYJY7FJGY3vnvz+0OuCpZ4bhgZi1QoVdGOBhkUUWJaCs
         tg5J1qzs7MNszY4xZOgYdBHqRexhuAeZXvQ7ToIon2DTzJc4C627BO6dEzOZSevdd/5M
         j3iA8lb9NSUGuPZNtq7BZ3sKbE5gexQSpqM7QY0h4H/mie+eHKzQ+injitmV1tpPuRbM
         ESrQ==
X-Gm-Message-State: AOJu0Yzsp0aP4CE2RyOFKJQ7K44btgxWF5nk2/K5nt0HQjJuIQp9V00x
        qw1bIuwxkWFznA7MFFZ/V0qzV6wZZZXMMpwPMjA=
X-Google-Smtp-Source: AGHT+IGObbGNEVLkXk/hoJXb2gcDGkqlrrRD1GTOoHl5eafb9jYSdI6/O7pshkJkq7lEPhZyr/Wi8w==
X-Received: by 2002:a19:7715:0:b0:500:12c6:c91b with SMTP id s21-20020a197715000000b0050012c6c91bmr4527358lfc.40.1692663254298;
        Mon, 21 Aug 2023 17:14:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 29/32] ARM: dts: qcom: msm8960: drop useless rpm regulators node
Date:   Tue, 22 Aug 2023 03:13:46 +0300
Message-Id: <20230822001349.899298-30-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
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
index 4a6b22bed1e4..56f8ba07df54 100644
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


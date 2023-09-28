Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7940B7B1962
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbjI1LEI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbjI1LEA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:04:00 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F77CF6
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:39 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50435ad51bbso18577375e87.2
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899018; x=1696503818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPuoBnKtEFgCdxUoOIFl3Fx3Gw36qHVcIvB+5tSO88E=;
        b=zWXkJBg4JO6dMsh9Fjh0LCuQDFnGVGOThYr+cIQa9TSbrVdh8wF8rSrIo37D0WkKqB
         b5mVRu2CRVrsLskyDsXpjQkz/tguADtxsT3cs/jMMBZJinuO2bSws64BOnqtdYYLzfLe
         M5Kk/1t6p15r85q8xABcjLFyAuC+GD4pXxVhzSuzpt1avtNpUXnhtuS9DkJZU2KNkto5
         08w+5D9kIcz3FJpcIWQNlqS0jutKwWysEszvdW/aXlwJn+mA0/sBlumD/IbkdJZiPodW
         b1tbRDDubaxJf1+9UMcjrr9WsuzYF+B5nxHuv1e4wyblNQZLoijsHJ7Ca8oJTKo/EOQa
         kZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899018; x=1696503818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPuoBnKtEFgCdxUoOIFl3Fx3Gw36qHVcIvB+5tSO88E=;
        b=aq57NvBh0ON1tnviOi2TZjIZZSFOYfhx+sL87lRG4rjQhYDHnSjHLB0ycURTmuEAXu
         wdohutyDMuY1XFVnTQnJG5/yqUTiUB6CRYMoSKlIcLvqa3dZKM6MQXdAr9qW1DNBnWvP
         QRilk95ug6pHeLsxKjoI6oryRpVc09xB+jPnqexh3Lc5sx28KpTlAAx6mnAlhrA1B3Ko
         Fq3edEMA1wOj0hiWNfcyIXMLUw+3Q1+7YXaqE2dHBOo8NoMN30rPh34syt2+h3Z/jofX
         PpJjm+l8NbGeujCdQEFpdZ7F30oR3PY071l4p1aB4slEwoh3T1w9Dxezfh2wcMgmYN/G
         NtsQ==
X-Gm-Message-State: AOJu0Yw+eB2323PgT5bzMdwS8gPyhB7JOM97ItjKdflXN+2ge2KVYO5R
        5vOxIXFwMsHs2b4tsmOxXvGUAQ==
X-Google-Smtp-Source: AGHT+IF/M9Jyw3OeLTaqNePUWIKm53MEV/E7kAJpZOWwgw3jIhAUfBVCpdbH7cR5iqM0Tf/kY07Tiw==
X-Received: by 2002:a05:6512:1150:b0:4fe:8c1d:9e81 with SMTP id m16-20020a056512115000b004fe8c1d9e81mr1007934lfg.36.1695899017918;
        Thu, 28 Sep 2023 04:03:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 31/36] ARM: dts: qcom: msm8960: drop useless rpm regulators node
Date:   Thu, 28 Sep 2023 14:03:04 +0300
Message-Id: <20230928110309.1212221-32-dmitry.baryshkov@linaro.org>
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


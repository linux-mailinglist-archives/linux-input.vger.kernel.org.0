Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5979789EBA
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 15:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjH0N0j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 09:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjH0N0F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 09:26:05 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13B1186
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:58 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ff93a7f230so2808381e87.1
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142757; x=1693747557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPGHh0Yc1od2zbTrwc+6JwXrsuE73ZiTR95u6Arvrgw=;
        b=eOAsuNUW9CoxdUysaAluo2KVocIruFXrXdr7hpGCeLlTw76chEFeh2DgwYVT1ckB05
         GuG7fqPC/TB370m9mQc8n5K8j7ehs4MIUG0g13olI4WVr43ueEl0zMLIi+Sr+EWmibSr
         j9Sj3ZsSH/vpebUsWS3+Gw+kEWUaWSDSTfwQmVEC/leUSCu5jEMbP6XPt8j6dWvELojo
         BkeZ/BIebw9IYTn9NcNXmBsANfKIZl9VEsj6Ym9GtcgynSOxYrTCH/7foq/BjRYnTFsf
         1xjAluUx6y6bac5maqo8HVHDTbfs7w5e83BRj0vCcqGV/hvLBBQeDjFIZECBpeoMdU8M
         V7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142757; x=1693747557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPGHh0Yc1od2zbTrwc+6JwXrsuE73ZiTR95u6Arvrgw=;
        b=TcNF1oaHS8YEse3IS3KXdeNb4q/iFsxLn/xDjZrxRn1K9DpjDYOyQx+DD1CO8BcDwY
         PsvM7LMfdh/fBMtDgrPhlOo2wGzDAaMjaI6voOVOVspXFgN91sZ2cg02GZtoOPG/wWhm
         hMNzTtruqV0dF7FSEFc4RVxMEtsVvZzaO+xeRKol8wfvzmhaKIQ63Mam7S3yFecoO6bi
         iSecZa1UIeHx137ZAjvvcokwNvrCOLorCmq4IHI2MbnMMnnCELG9oJuhhVLuGS+oDbuQ
         jQ4GNmsKilP+tuLx4eY+GfVnMS4HdwltKKZIBLrXsO/0kYBdHlPGecHpSotqYxDIbbT6
         0I5Q==
X-Gm-Message-State: AOJu0YzYN00dkWMGomoOGYi74L7yCKBvHSY6H5+EVaaixUcsX6ReecPa
        dH936XRdeOJfzHOkvQ3sSMFqgA==
X-Google-Smtp-Source: AGHT+IGsoBznIes5Sf4cjvxqEmMGhk4C1uN3ullfV00StpyvFDxTHmlNFO45ZovI/NYW9zGiMOqvWw==
X-Received: by 2002:a05:6512:4026:b0:4ff:839b:5355 with SMTP id br38-20020a056512402600b004ff839b5355mr8211571lfb.18.1693142757126;
        Sun, 27 Aug 2023 06:25:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:56 -0700 (PDT)
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
Subject: [PATCH v5 36/37] ARM: dts: qcom: ipq8064: drop qcom, prefix from SSBI node name
Date:   Sun, 27 Aug 2023 16:25:24 +0300
Message-Id: <20230827132525.951475-37-dmitry.baryshkov@linaro.org>
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


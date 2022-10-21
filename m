Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402E9607373
	for <lists+linux-input@lfdr.de>; Fri, 21 Oct 2022 11:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbiJUJJN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Oct 2022 05:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbiJUJI5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Oct 2022 05:08:57 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485501A3E0F
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 02:08:54 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id n12so3771406wrp.10
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKPmuyWzuvi/ZRN3fqLVs1CIkyhJEvTnfd6fDEo2uxM=;
        b=iUmxD397xmDG1Eo1uMteRzyuqdf8LQdNEDCWpQ974QtzaBvQTlMv/JE9fg04xNV8K4
         Hz/+/FILe55oW02X7cTImwfyc6tE9uuiaYR15cmkOO+m0onc9uyHNPJMnzYfIu7d9FK7
         VWABlPmLHxVvGWZYS7ZC9NNawrK0NUMi5QgShN3wDGAYVUdIpuO0laO129b0iO0s7ZSj
         EvJDmDkqE+5dcKAgz9UehTa26B4eFKCjGqaU8bLU1S2BLRLLVLNjPjmmrrRAdZ2rIjGs
         W1u01KXsS0RWZ94GOsW2h6/6EdcaQNCZJ4EtpGjVLXwGGdITdEADNtiU9qachSYkAFSq
         6eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKPmuyWzuvi/ZRN3fqLVs1CIkyhJEvTnfd6fDEo2uxM=;
        b=fpu90tdTkT94POBCYjYRiIxwu/0BAexna35LOEtXyzHxTe2/JgLhYERyaUkIBaGHTX
         k3ceBE7m+qzkB5MrYC39Yy8xf659QhZV0oTVdTa8IrVesEZahmjG6mUrrZ9IZ1UcCaFc
         93E2r8VDrouuakHMy3YG5PRFNTsHsKc8jNyETHOZVoeXFNhs8Im3Lwb271g0efE0cyWz
         UGj55b0S1h/ywgwerGqwRmjiGlck3ERpqzb375moGVDT6SvNdzvx3CWlS279GVu7rIS6
         lio2XNQuKrfhZONkoUXYf3OGweFubRjK0sSIDecC+qHdLSQxBOOS02pPC2Px0rlEKSys
         upRQ==
X-Gm-Message-State: ACrzQf3FCfb0DWVyd1j9KHW+s9w5Y6tvttop5N2ChB8n9WeqD5ou7Dgy
        QsLPbVcBHe8RdXtHHc7iIiGOJA==
X-Google-Smtp-Source: AMsMyM6hvkR8ZNGe9uXbeUSSSOWi0dr8iirT5WKTZh7kAukcQglkFKbgy+kf+H+fXMxbl1ZmRpzQXA==
X-Received: by 2002:adf:f447:0:b0:236:5840:1c72 with SMTP id f7-20020adff447000000b0023658401c72mr82639wrp.686.1666343332348;
        Fri, 21 Oct 2022 02:08:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003c6f27d275dsm2230286wmn.33.2022.10.21.02.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:08:52 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 21 Oct 2022 11:06:40 +0200
Subject: [PATCH v4 04/11] arm: dts: qcom: mdm9615: remove invalid spi-max-frequency
 gsbi3_spi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v4-4-dac2dfaac703@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The spi-max-frequency property has nothing to do in the controller's node,
remove it and fix the 'spi-max-frequency' was unexpected dtbs check error.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index eaa3236f62db..366241dee522 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -170,7 +170,6 @@ gsbi3_spi: spi@16280000 {
 				#size-cells = <0>;
 				reg = <0x16280000 0x1000>;
 				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
-				spi-max-frequency = <24000000>;
 
 				clocks = <&gcc GSBI3_QUP_CLK>, <&gcc GSBI3_H_CLK>;
 				clock-names = "core", "iface";

-- 
b4 0.10.1

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C6F789E25
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 15:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjH0N0P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 09:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjH0NZk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 09:25:40 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872D51B5
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:33 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5007f3d3235so3661368e87.2
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142732; x=1693747532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=oNVssUenPteuOdO8hSdEhSPH6Bc/NBahMRDsrgS7lbIvWRAFkj+fJqW4cWfnRpNZaq
         NyIkloUJXtjTLrOUd2YV84KYw4J/8/ZQpCcfGXYMwN8Af2LqW5MwqUcVxJICnsHJrIjK
         pBsF7xDnitAQcfryBdGFUeGRmtNQc4RBWToVY4bD0ZpAh3MiXVhP50N3NK+/GPzVRr3d
         9aIG7CRloxs9Nb0JP46dBfcRMX1oDVJVv/sMYidvwPit4JGXJOCsf+PfZsPIz+vHsoMl
         SuRfxtjrOd/NQSbjsEYKFK6xhAz6ruX6L9bchH3bYJhHZEVCQkQ5wI3/4/wcyVASkf86
         qatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142732; x=1693747532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=dFT5TpoxhO/XXt52hZtn6MnngyPTL0uXAuRcn8H1zCqnuoj17yrgUc4x+XcczLL85Y
         4x0QFtFhvmjQDNU3aZu3cEMUvvEetRVRxJ20xxMQnX2C5y4N+SiqQAc+pfIU/U2ndiBm
         MwTwYfy1YRHGgvJ3LGfziT1g9PHXzvRAQHK0PdzYF3hTFGcaeSBZ6exPqQZhS7OzfgJh
         4feRhTDMzh7ZPIQ7Y81GlZ7hT2ENgwvr6I1HOXbsqyBkeJV331C6AkHT7UgmKCbFOEaP
         wJnqKwAFZKNlcprjXwYvCcyaPP6Z4sZw2RsC/NiP6lhWycbegq0snkvpY5UBY/GWogWw
         c7Bw==
X-Gm-Message-State: AOJu0YxAun9qPnaYoXZADYPCLGQoDVmgqpqLuy2AOo745Gr5jr6+eYn7
        P6W40n/3V1JL2QpU2od9zQHhUw==
X-Google-Smtp-Source: AGHT+IEfKs2j7Ass8saTcughKBc2xTel1Lg1qq8WpBS1AA55XE2e0M0o61yA/KgL8hOWOqVpdEf5SQ==
X-Received: by 2002:ac2:5e3b:0:b0:4fa:5e76:7ad4 with SMTP id o27-20020ac25e3b000000b004fa5e767ad4mr14087260lfg.10.1693142731760;
        Sun, 27 Aug 2023 06:25:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:31 -0700 (PDT)
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
Subject: [PATCH v5 06/37] ARM: dts: qcom: apq8064-nexus7: move sdcc1 node to proper place
Date:   Sun, 27 Aug 2023 16:24:54 +0300
Message-Id: <20230827132525.951475-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
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

Move sdcc1 device node to follow the alphanumberic sorting order.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index c57c27cd8a20..0e80a5a8e3c6 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -181,13 +181,6 @@ &mdp {
 	status = "okay";
 };
 
-/* eMMC */
-&sdcc1 {
-	vmmc-supply = <&pm8921_l5>;
-	vqmmc-supply = <&pm8921_s4>;
-	status = "okay";
-};
-
 &mdp_dsi1_out {
 	remote-endpoint = <&dsi0_in>;
 };
@@ -336,6 +329,13 @@ lvs7 {
 	};
 };
 
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
+
 &usb_hs1_phy {
 	v3p3-supply = <&pm8921_l3>;
 	v1p8-supply = <&pm8921_l4>;
-- 
2.39.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A07BD7836B5
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbjHVAOR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbjHVAOM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:12 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD60CDB
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso5816744e87.0
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663240; x=1693268040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wblF4wah6BmHW/8HH3+se0OjDANdbSlRJHajeFa81aM=;
        b=mpdZSgYFAqAulCxsPyZ6IY+RIfCbF8ofyvLWWgCnM3m0vjFatzPTwVNuNFO74rxMID
         yju+KCa/d0xQgWx1chFa7hGijt1ESlpXoR3nGaZHpQZScqoHcJPKLdLsouGq3deCcBFS
         K+LPk/a7Iq+zD/S6ftkL/+grQn+ksZm4lA2UH1WYxBTQjC/cGe1vc7dFktRMdgL2KQsC
         JZXDxzszSffJ2i15aQj5PEEkdXC0GCqCCclCXIPV72ExTUNwsH0aN+yWpnYM7F7YUOdh
         sG2eAh3bvvfousJzol4PTQsfe07vfXQD+Z7rzD6R2I1ZN2yzDdLXhOR+2ZZQ/0dmXSUc
         Nr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663240; x=1693268040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wblF4wah6BmHW/8HH3+se0OjDANdbSlRJHajeFa81aM=;
        b=bSDxMkBwO2mETgpzRxQHmezAYtwqUIYRFrq5JVTwWTcjwIduomqf6n3uVKi/57RHXR
         ugnmZICJg0uduyasX/2PhjOq+NisXj59a0uYUeEpzd0DzO+VLD18UQC9Mw6DmTU52cdU
         tRyDirhiCuXI8h0CQ0r+BX4IGKDP4Aw3rQLjvmtbmMV6JmVUD7oJIuadEmwtcondNjC0
         S9hLR9ClB81UPWe5iaUZ3WbiEQrD66qT72F3VFmBqIVG5tBbn4MPLSnDh3iBsske3qUE
         x62C4AnopiVYhs+ajgiTy1KO6D1J45yCU06Pn8VdVARlZhHLr/CyGqattI36oERM3u+w
         EbGQ==
X-Gm-Message-State: AOJu0YxdQhTI76IhFJPKbKo0oDxMtLWUj8g7YYimUK2GAQARq/u6NBuQ
        pQUTlkG/IefR/cYIYLNdip1DiQ==
X-Google-Smtp-Source: AGHT+IHOnjQ/qAV0mbst1+opYz/aW8F9xWViiguO0PN+DJzSCgrdjBwsQ2N/e9lbNUnLWnV4OH0QPw==
X-Received: by 2002:a05:6512:10d6:b0:4fd:c715:5667 with SMTP id k22-20020a05651210d600b004fdc7155667mr6017126lfg.20.1692663240819;
        Mon, 21 Aug 2023 17:14:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 12/32] ARM: dts: qcom: msm8660: fix PMIC node labels
Date:   Tue, 22 Aug 2023 03:13:29 +0300
Message-Id: <20230822001349.899298-13-dmitry.baryshkov@linaro.org>
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

Change PM8058 node labels to start with pm8058_ prefix, following other
Qualcomm PMIC device nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8060-dragonboard.dts   |  4 ++--
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi         | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index db4c791b2e2f..48fd1a1feea3 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -72,7 +72,7 @@ cm3605 {
 		/* Trig on both edges - getting close or far away */
 		interrupts-extended = <&pm8058_gpio 34 IRQ_TYPE_EDGE_BOTH>;
 		/* MPP05 analog input to the XOADC */
-		io-channels = <&xoadc 0x00 0x05>;
+		io-channels = <&pm8058_xoadc 0x00 0x05>;
 		io-channel-names = "aout";
 		pinctrl-names = "default";
 		pinctrl-0 = <&dragon_cm3605_gpios>, <&dragon_cm3605_mpps>;
@@ -945,7 +945,7 @@ irq-pins {
 	};
 };
 
-&xoadc {
+&pm8058_xoadc {
 	/* Reference voltage 2.2 V */
 	xoadc-ref-supply = <&pm8058_l18>;
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 78023ed2fdf7..9217ced108c4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -80,13 +80,13 @@ sleep-clk {
 	 */
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&xoadc 0x00 0x01>, /* Battery */
-			    <&xoadc 0x00 0x02>, /* DC in (charger) */
-			    <&xoadc 0x00 0x04>, /* VPH the main system voltage */
-			    <&xoadc 0x00 0x0b>, /* Die temperature */
-			    <&xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
-			    <&xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
-			    <&xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
+		io-channels = <&pm8058_xoadc 0x00 0x01>, /* Battery */
+			      <&pm8058_xoadc 0x00 0x02>, /* DC in (charger) */
+			      <&pm8058_xoadc 0x00 0x04>, /* VPH the main system voltage */
+			      <&pm8058_xoadc 0x00 0x0b>, /* Die temperature */
+			      <&pm8058_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
+			      <&pm8058_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
+			      <&pm8058_xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
 	};
 
 	soc: soc {
@@ -390,7 +390,7 @@ pm8058_keypad: keypad@148 {
 					row-hold = <91500>;
 				};
 
-				xoadc: xoadc@197 {
+				pm8058_xoadc: xoadc@197 {
 					compatible = "qcom,pm8058-adc";
 					reg = <0x197>;
 					interrupts-extended = <&pm8058 76 IRQ_TYPE_EDGE_RISING>;
-- 
2.39.2


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C037836DC
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbjHVAOn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjHVAOg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:36 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B181619A
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ffa94a7a47so4606332e87.1
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663255; x=1693268055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/srTtQ3Lz+Fleu1LKcLJRlV5earLskJb/E1HQJfyU90=;
        b=tc/nSet0yCmeXT4vemwPG6qU5biHJ98n6A0Ibtx5pA5X5mRGv7ZlRpjLwFmZHXZwg/
         tSObixAHu0pLTCsuVGimTvwvH4LgbkyHQeU6ouoD+XwNHRMA0hJZy6Vppco9niesLFjw
         LL6dQ8CqX45V2B/04mFVGJdSC/wExL1MnC8eaj270xOaNOkT/GPAu7VmXjLP785JzpcU
         W5cjUv/X7RyKyCUOftkNhAZ/HsEA302jOwATmI41dHsIdzsMsUgCeuMwvLzekH53avoJ
         rQfxPtJHe043VC4ydclcveI/Wcy6R73b/8jXaQM3SfkAruya1hx5Mp16VnLqsKXcSacY
         gDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663255; x=1693268055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/srTtQ3Lz+Fleu1LKcLJRlV5earLskJb/E1HQJfyU90=;
        b=DJ4X6kWs/+lWApC3GyAJJCd0wTmKnGo4Nijj9oc6Bxo00vypD/InQSXZe8JhXp8HKT
         WrdMr1j7Gli9AXNZApO9uiCEMmIt1S/E30QWsoTBJuV+HY3iQIc1eDYvfV8NsLBrcUlI
         hXI5NIbtMOrpJp7IH1e3zrosLy7Wlr2yO8O1ljt0Q3ZCDowt09NpjFYmJ/zgrEXPtGBq
         4GkfuVbpD2TtM90Tts704ZPfEvGOq7U5w3FROO+lxINcjZvtXYHJ7LWlqMDgNENUz9+i
         KX/ZYQEtMWYHb3Lg7fqxZ9lsFKhM6LfyX4QqN3wZbMk8kS12s28KyNwfcehQyu3umuPq
         UOwg==
X-Gm-Message-State: AOJu0YxZ4PMxmApN4XVcSLW785sIahpKDsjk8nA3XLaoDEbAI3kauzQI
        SpVSzepTGgFP2dosbQ0wEolkPg==
X-Google-Smtp-Source: AGHT+IEMFKUZVZcETKW0kfrPpRmzGTxnI7Ous2sZ2JfyeA5h2jD/z3CQ0ORXvc/6k3vYdkxe8VToTw==
X-Received: by 2002:a05:6512:39c1:b0:4ff:8b28:7b22 with SMTP id k1-20020a05651239c100b004ff8b287b22mr5295508lfu.68.1692663255202;
        Mon, 21 Aug 2023 17:14:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 30/32] ARM: dts: qcom: msm8974: move regulators to board files
Date:   Tue, 22 Aug 2023 03:13:47 +0300
Message-Id: <20230822001349.899298-31-dmitry.baryshkov@linaro.org>
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

The vph-pwr and boost regulators (even if they are unified by design)
are not a property of SoC, so move them to board files.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../dts/qcom/qcom-apq8074-dragonboard.dts     | 27 +++++++++++++++++++
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 27 +++++++++++++++++++
 .../qcom/qcom-msm8974-sony-xperia-rhine.dtsi  | 27 +++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi      | 27 -------------------
 .../qcom/qcom-msm8974pro-fairphone-fp2.dts    | 27 +++++++++++++++++++
 .../qcom/qcom-msm8974pro-oneplus-bacon.dts    | 27 +++++++++++++++++++
 .../dts/qcom/qcom-msm8974pro-samsung-klte.dts | 10 ++++++-
 ...-msm8974pro-sony-xperia-shinano-castor.dts | 27 +++++++++++++++++++
 8 files changed, 171 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index 950fa652f985..d7fb3e0e8886 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -49,6 +49,33 @@ mpss_region: mpss@ac00000 {
 			no-map;
 		};
 	};
+
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_uart2 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index da99f770d4f5..ca402b4a68bd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -60,6 +60,33 @@ vibrator {
 		enable-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;
 	};
 
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
+
 	vreg_wlan: wlan-regulator {
 		compatible = "regulator-fixed";
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index 23ae474698aa..a43341ae4495 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -65,6 +65,33 @@ ramoops@3e8e0000 {
 			pmsg-size = <0x80000>;
 		};
 	};
+
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_i2c2 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 706fef53767e..d54be72fe3b2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -2376,31 +2376,4 @@ timer {
 			     <GIC_PPI 1 0xf08>;
 		clock-frequency = <19200000>;
 	};
-
-	vreg_boost: vreg-boost {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vreg-boost";
-		regulator-min-microvolt = <3150000>;
-		regulator-max-microvolt = <3150000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-
-		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&boost_bypass_n_pin>;
-	};
-
-	vreg_vph_pwr: vreg-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "vph-pwr";
-
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		regulator-always-on;
-	};
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
index 6c4153689b39..66c422004dcd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
@@ -57,6 +57,33 @@ vibrator {
 		enable-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
 		vcc-supply = <&pm8941_l18>;
 	};
+
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_i2c2 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index c0ca264d8140..6d1412aec45a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -51,6 +51,33 @@ event-hall-sensor {
 			debounce-interval = <150>;
 		};
 	};
+
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_i2c1 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
index 325feb89b343..ca3aa16b4b10 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
@@ -155,7 +155,15 @@ vreg_panel: panel-regulator {
 		enable-active-high;
 	};
 
-	/delete-node/ vreg-boost;
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_i2c2 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 0798cce3dbea..818ff5835031 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -84,6 +84,33 @@ vreg_vsp: lcd-dcdc-regulator {
 		pinctrl-0 = <&lcd_dcdc_en_pin_a>;
 	};
 
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
+
 	vreg_wlan: wlan-regulator {
 		compatible = "regulator-fixed";
 
-- 
2.39.2


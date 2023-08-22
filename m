Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 750847836F2
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjHVAPQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbjHVAOV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D997183
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:06 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe8c16c1b4so5910986e87.2
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663245; x=1693268045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGqUl+V6ajHw+vi4bRAr9wvwArFyTatD3jkjVgGFbtI=;
        b=lLr1+pTLkoUcaW66SaKddwVSep74XxI2E7cMaD4InUT7dhphlcmgkZoPB3fEEW6Et5
         PlfhA7QFHnNA0zHj6cbKNXbNETfQQn6oIRrDeyc9F2aEdyNSNCyCE3bW984wytlUAaXk
         MZQoSVQqROAI7Gz61mH/Ur8JKBqoVDqEuPlh1t0JhAx7mLL7KXg7sYUBasG2awvICeAE
         pfxDmKWinzpiCnerBhTV3YHxW0kmAuwjfCI1KuVmY3/7HA7okkGRmnDfjSMTs+D6wMG6
         0NMAFlWTGDKLOjuwEGgDnPZHLXNBBrHWlxq6kb4R0PFQn5mtPOCJDQwFA4vVl/6Vi2Gs
         Omhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663245; x=1693268045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGqUl+V6ajHw+vi4bRAr9wvwArFyTatD3jkjVgGFbtI=;
        b=eK/pNiIj8mOiqRP+yLnYrTZm53N+xylYpr6SyrYIWIOcHGcakTIgDtLHjxVzsxvA/Q
         IBaYpWnFrQl10/LbybMFmfAGv2lfdyPrL5DmpxCatDs73uMQRNibxi2vvbi4AyhHycVx
         ZdGIZU44WbBZUH7MS+ngQs97unLRcE4JbPB0l6JwJA5VyhmMIb+TfeMZGBOvoclu3XuN
         K0WQK5kX8eVGHmDdnBCXm61KbWpm8w5RZjsF7bzj4gyap44b7MUT8Lpx8qPmvxYlubsP
         LqpiWu5KKlCuFj9USvFJsHUdB49CfYc4Wdgb8MyZ44osjEc34gUQrdDnLQbjv35YY9Ym
         1h4w==
X-Gm-Message-State: AOJu0Yy0lFpchIA1TNhP9APq73jmh0wShyxTgzNSnWXPqKZjw8as2UHe
        YAsi5LcT83I2IYhvZu3IBmIcPQ==
X-Google-Smtp-Source: AGHT+IFw4mdDcqtl6tpYQ417Jqu27MtkYRUovMt8m0kj/5vqQmO/CD2RxpxmiOVRg+Auff0/rNo1NQ==
X-Received: by 2002:a05:6512:689:b0:4fb:9631:4bb with SMTP id t9-20020a056512068900b004fb963104bbmr7021271lfe.11.1692663244871;
        Mon, 21 Aug 2023 17:14:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 17/32] ARM: dts: qcom: msm8660: split PMIC to separate dtsi files
Date:   Tue, 22 Aug 2023 03:13:34 +0300
Message-Id: <20230822001349.899298-18-dmitry.baryshkov@linaro.org>
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

The PMIC is not a part of the SoC, so move PMIC to a separate file and
include it from the board files.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8058.dtsi            | 160 ++++++++++++++++++
 .../dts/qcom/qcom-apq8060-dragonboard.dts     |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts  |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi      | 148 +---------------
 4 files changed, 164 insertions(+), 146 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8058.dtsi

diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
new file mode 100644
index 000000000000..ad581c3bcbd2
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+
+&ssbi {
+	pm8058: pmic {
+		compatible = "qcom,pm8058";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8058_gpio: gpio@150 {
+			compatible = "qcom,pm8058-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pm8058_gpio 0 0 44>;
+			#gpio-cells = <2>;
+		};
+
+		pm8058_mpps: mpps@50 {
+			compatible = "qcom,pm8058-mpp",
+				     "qcom,ssbi-mpp";
+			reg = <0x50>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8058_mpps 0 0 12>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pwrkey@1c {
+			compatible = "qcom,pm8058-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8058>;
+			interrupts = <50 1>, <51 1>;
+			debounce = <15625>;
+			pull-up;
+		};
+
+		pm8058_keypad: keypad@148 {
+			compatible = "qcom,pm8058-keypad";
+			reg = <0x148>;
+			interrupt-parent = <&pm8058>;
+			interrupts = <74 1>, <75 1>;
+			debounce = <15>;
+			scan-delay = <32>;
+			row-hold = <91500>;
+		};
+
+		pm8058_xoadc: xoadc@197 {
+			compatible = "qcom,pm8058-adc";
+			reg = <0x197>;
+			interrupts-extended = <&pm8058 76 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#io-channel-cells = <2>;
+
+			vcoin: adc-channel@0 {
+				reg = <0x00 0x00>;
+			};
+
+			vbat: adc-channel@1 {
+				reg = <0x00 0x01>;
+			};
+
+			dcin: adc-channel@2 {
+				reg = <0x00 0x02>;
+			};
+
+			ichg: adc-channel@3 {
+				reg = <0x00 0x03>;
+			};
+
+			vph_pwr: adc-channel@4 {
+				reg = <0x00 0x04>;
+			};
+
+			usb_vbus: adc-channel@a {
+				reg = <0x00 0x0a>;
+			};
+
+			die_temp: adc-channel@b {
+				reg = <0x00 0x0b>;
+			};
+
+			ref_625mv: adc-channel@c {
+				reg = <0x00 0x0c>;
+			};
+
+			ref_1250mv: adc-channel@d {
+				reg = <0x00 0x0d>;
+			};
+
+			ref_325mv: adc-channel@e {
+				reg = <0x00 0x0e>;
+			};
+
+			ref_muxoff: adc-channel@f {
+				reg = <0x00 0x0f>;
+			};
+		};
+
+		rtc@1e8 {
+			compatible = "qcom,pm8058-rtc";
+			reg = <0x1e8>;
+			interrupt-parent = <&pm8058>;
+			interrupts = <39 1>;
+			allow-set-time;
+		};
+
+		vibrator@4a {
+			compatible = "qcom,pm8058-vib";
+			reg = <0x4a>;
+		};
+
+		pm8058_led48: led@48 {
+			compatible = "qcom,pm8058-keypad-led";
+			reg = <0x48>;
+			status = "disabled";
+		};
+
+		pm8058_led131: led@131 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x131>;
+			status = "disabled";
+		};
+
+		pm8058_led132: led@132 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x132>;
+			status = "disabled";
+		};
+
+		pm8058_led133: led@133 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x133>;
+			status = "disabled";
+		};
+	};
+};
+
+/ {
+	/*
+	 * These channels from the ADC are simply hardware monitors.
+	 * That is why the ADC is referred to as "HKADC" - HouseKeeping
+	 * ADC.
+	 */
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&pm8058_xoadc 0x00 0x01>, /* Battery */
+			      <&pm8058_xoadc 0x00 0x02>, /* DC in (charger) */
+			      <&pm8058_xoadc 0x00 0x04>, /* VPH the main system voltage */
+			      <&pm8058_xoadc 0x00 0x0b>, /* Die temperature */
+			      <&pm8058_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
+			      <&pm8058_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
+			      <&pm8058_xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
+	};
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 48fd1a1feea3..20de516a8deb 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -5,6 +5,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
 #include "qcom-msm8660.dtsi"
+#include "pm8058.dtsi"
 
 / {
 	model = "Qualcomm APQ8060 Dragonboard";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
index 86fbb6dfdc2a..04dca0c93971 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
@@ -2,6 +2,7 @@
 #include <dt-bindings/input/input.h>
 
 #include "qcom-msm8660.dtsi"
+#include "pm8058.dtsi"
 
 / {
 	model = "Qualcomm MSM8660 SURF";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 9217ced108c4..b8094b7c09fc 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -73,22 +73,6 @@ sleep-clk {
 		};
 	};
 
-	/*
-	 * These channels from the ADC are simply hardware monitors.
-	 * That is why the ADC is referred to as "HKADC" - HouseKeeping
-	 * ADC.
-	 */
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&pm8058_xoadc 0x00 0x01>, /* Battery */
-			      <&pm8058_xoadc 0x00 0x02>, /* DC in (charger) */
-			      <&pm8058_xoadc 0x00 0x04>, /* VPH the main system voltage */
-			      <&pm8058_xoadc 0x00 0x0b>, /* Die temperature */
-			      <&pm8058_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
-			      <&pm8058_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
-			      <&pm8058_xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
-	};
-
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -334,142 +318,14 @@ ebi2: external-bus@1a100000 {
 			status = "disabled";
 		};
 
-		ssbi@500000 {
+		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pm8058: pmic {
-				compatible = "qcom,pm8058";
+			pmic {
 				interrupt-parent = <&tlmm>;
 				interrupts = <88 8>;
-				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pm8058_gpio: gpio@150 {
-					compatible = "qcom,pm8058-gpio",
-						     "qcom,ssbi-gpio";
-					reg = <0x150>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					gpio-controller;
-					gpio-ranges = <&pm8058_gpio 0 0 44>;
-					#gpio-cells = <2>;
-
-				};
-
-				pm8058_mpps: mpps@50 {
-					compatible = "qcom,pm8058-mpp",
-						     "qcom,ssbi-mpp";
-					reg = <0x50>;
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&pm8058_mpps 0 0 12>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-				};
-
-				pwrkey@1c {
-					compatible = "qcom,pm8058-pwrkey";
-					reg = <0x1c>;
-					interrupt-parent = <&pm8058>;
-					interrupts = <50 1>, <51 1>;
-					debounce = <15625>;
-					pull-up;
-				};
-
-				pm8058_keypad: keypad@148 {
-					compatible = "qcom,pm8058-keypad";
-					reg = <0x148>;
-					interrupt-parent = <&pm8058>;
-					interrupts = <74 1>, <75 1>;
-					debounce = <15>;
-					scan-delay = <32>;
-					row-hold = <91500>;
-				};
-
-				pm8058_xoadc: xoadc@197 {
-					compatible = "qcom,pm8058-adc";
-					reg = <0x197>;
-					interrupts-extended = <&pm8058 76 IRQ_TYPE_EDGE_RISING>;
-					#address-cells = <2>;
-					#size-cells = <0>;
-					#io-channel-cells = <2>;
-
-					vcoin: adc-channel@0 {
-						reg = <0x00 0x00>;
-					};
-					vbat: adc-channel@1 {
-						reg = <0x00 0x01>;
-					};
-					dcin: adc-channel@2 {
-						reg = <0x00 0x02>;
-					};
-					ichg: adc-channel@3 {
-						reg = <0x00 0x03>;
-					};
-					vph_pwr: adc-channel@4 {
-						reg = <0x00 0x04>;
-					};
-					usb_vbus: adc-channel@a {
-						reg = <0x00 0x0a>;
-					};
-					die_temp: adc-channel@b {
-						reg = <0x00 0x0b>;
-					};
-					ref_625mv: adc-channel@c {
-						reg = <0x00 0x0c>;
-					};
-					ref_1250mv: adc-channel@d {
-						reg = <0x00 0x0d>;
-					};
-					ref_325mv: adc-channel@e {
-						reg = <0x00 0x0e>;
-					};
-					ref_muxoff: adc-channel@f {
-						reg = <0x00 0x0f>;
-					};
-				};
-
-				rtc@1e8 {
-					compatible = "qcom,pm8058-rtc";
-					reg = <0x1e8>;
-					interrupt-parent = <&pm8058>;
-					interrupts = <39 1>;
-					allow-set-time;
-				};
-
-				vibrator@4a {
-					compatible = "qcom,pm8058-vib";
-					reg = <0x4a>;
-				};
-
-				pm8058_led48: led@48 {
-					compatible = "qcom,pm8058-keypad-led";
-					reg = <0x48>;
-					status = "disabled";
-				};
-
-				pm8058_led131: led@131 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x131>;
-					status = "disabled";
-				};
-
-				pm8058_led132: led@132 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x132>;
-					status = "disabled";
-				};
-
-				pm8058_led133: led@133 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x133>;
-					status = "disabled";
-				};
-
 			};
 		};
 
-- 
2.39.2


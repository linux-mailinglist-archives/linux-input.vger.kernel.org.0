Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707637B1945
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjI1LD5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231919AbjI1LDy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A55719D
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so20106409e87.1
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899004; x=1696503804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f71IcvptqSg5g7AuIhvK++aaEOWi79M2v+yqgEz0APA=;
        b=zqOwWU2LnXkUs0DWTUaZF7wfh3GJBxTSn8vBPWQ7K8Jc8M1EnyEMknNTiqZHrtmJ68
         NVf+BO1pgJkn1jkiYVCgAU3ikY0OCesMwvr43t46rHZkIZlWlNplHHEbEtIMtQNdYeY6
         jcN1BZvIz7b3TBjJhZy1LsPLgdvZdaKDFKUwsPrA1+RKytYvO9Cc4I4n3So27pLCEPJ1
         GDwEYFqoLF7ARMdochYwHtRiQMS1CHki7bl4L0lW1P41lSzzdr0mZO2p7YmNKCJPOnue
         89kAYAQkdsTB2DOClEixYOqOhVWqV8AAK+LcXzTr0cAQgRz9wEi1Xk3G33Gghkr26g5R
         wQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899004; x=1696503804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f71IcvptqSg5g7AuIhvK++aaEOWi79M2v+yqgEz0APA=;
        b=GjXa5ciVHS3eH2JtYyHb0cxkdI5LV/UEjyy7W+no7u5DnmWVT/LQLVEodeExle5CVz
         z2NVlt52tyOjsv0WoGjCIKzPh7KsGrM3KD1P/YkuKOYYND6IbrdfwMLmsMyOvf0q2lPR
         zy4+fGyaf2yLyEHFVjh5GtxsRAD4AqIgn/ARZ0sP3wCw7OT4BSWoQeY1rAphkhq8qSaR
         fzKEeTIFRumrTtrXj1LrGDAFTjeSYjBxiGOHvRmbJ6nMh4vE/Mng7QI7/knSbCjFGXxZ
         KrWxGtg9cda9LLZDDKUuIr4P3D/hFA14yjFuMRJJ32fCI//yEM8v/v4iNYgGO+NhwHpB
         Txlw==
X-Gm-Message-State: AOJu0YxO6WHNiJbmsbS/b43AtwN/roURQg8H91459+Npg+xRVf5HInia
        IraowD92chYHVPL/Pn/VnwOb/Q==
X-Google-Smtp-Source: AGHT+IHe1y2qaYHB/4NGFdGO0vuCfG5xgVi5R+wS/bEz9MKfhOSTv3lENBDnsscaScQPxmKEZRCxYA==
X-Received: by 2002:ac2:518c:0:b0:503:261d:eab8 with SMTP id u12-20020ac2518c000000b00503261deab8mr786075lfi.28.1695899004637;
        Thu, 28 Sep 2023 04:03:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 17/36] ARM: dts: qcom: apq8064: split PMICs to separate dtsi files
Date:   Thu, 28 Sep 2023 14:02:50 +0300
Message-Id: <20230928110309.1212221-18-dmitry.baryshkov@linaro.org>
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

The PMICs are not a part of the SoC, so move PMICs to separate files and
include them from the board files.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8821.dtsi            |  22 +++
 arch/arm/boot/dts/qcom/pm8921.dtsi            |  99 +++++++++++++
 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   6 +-
 .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |   5 +-
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |   5 +-
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |   5 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      | 134 +-----------------
 7 files changed, 140 insertions(+), 136 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8821.dtsi

diff --git a/arch/arm/boot/dts/qcom/pm8821.dtsi b/arch/arm/boot/dts/qcom/pm8821.dtsi
new file mode 100644
index 000000000000..064e3ba54e18
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/pm8821.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* This PMIC is used on a secondary SSBI bus */
+&ssbi2 {
+	pm8821: pmic {
+		compatible = "qcom,pm8821";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8821_mpps: mpps@50 {
+			compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
+			reg = <0x50>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8821_mpps 0 0 4>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 414941f7a42f..ad41d99ab265 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -8,6 +8,30 @@ pm8921: pmic {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8921_gpio: gpio@150 {
+
+			compatible = "qcom,pm8921-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pm8921_gpio 0 0 44>;
+			#gpio-cells = <2>;
+
+		};
+
+		pm8921_mpps: mpps@50 {
+			compatible = "qcom,pm8921-mpp",
+				     "qcom,ssbi-mpp";
+			reg = <0x50>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8921_mpps 0 0 12>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		pwrkey@1c {
 			compatible = "qcom,pm8921-pwrkey";
 			reg = <0x1c>;
@@ -36,5 +60,80 @@ rtc@11d {
 			reg = <0x11d>;
 			allow-set-time;
 		};
+
+		pm8921_xoadc: xoadc@197 {
+			compatible = "qcom,pm8921-adc";
+			reg = <0x197>;
+			interrupts-extended = <&pm8921 78 IRQ_TYPE_EDGE_RISING>;
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
+			vph_pwr: adc-channel@4 {
+				reg = <0x00 0x04>;
+			};
+
+			batt_therm: adc-channel@8 {
+				reg = <0x00 0x08>;
+			};
+
+			batt_id: adc-channel@9 {
+				reg = <0x00 0x09>;
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
+			chg_temp: adc-channel@e {
+				reg = <0x00 0x0e>;
+			};
+
+			ref_muxoff: adc-channel@f {
+				reg = <0x00 0x0f>;
+			};
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
+		io-channels = <&pm8921_xoadc 0x00 0x01>, /* Battery */
+			      <&pm8921_xoadc 0x00 0x02>, /* DC in (charger) */
+			      <&pm8921_xoadc 0x00 0x04>, /* VPH the main system voltage */
+			      <&pm8921_xoadc 0x00 0x0b>, /* Die temperature */
+			      <&pm8921_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
+			      <&pm8921_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
+			      <&pm8921_xoadc 0x00 0x0e>; /* Charger temperature */
 	};
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index b820f3255c16..d709d6e840ec 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -1,8 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
 / {
 	model = "Asus Nexus7(flo)";
 	compatible = "asus,nexus7-flo", "qcom,apq8064";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
index c01254b1a3a7..d4db84e9fcf3 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
 / {
 	model = "CompuLab CM-QS600";
 	compatible = "qcom,apq8064-cm-qs600", "qcom,apq8064";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index f1bd29333c9b..5fd84319254e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
 / {
 	model = "Qualcomm APQ8064/IFC6410";
 	compatible = "qcom,apq8064-ifc6410", "qcom,apq8064";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
index 7917f1657025..ba18a02b1c57 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
@@ -1,10 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
 / {
 	model = "Sony Xperia Z";
 	compatible = "sony,xperia-yuga", "qcom,apq8064";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 76796002bda6..5704d0598b96 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -284,23 +284,6 @@ scm {
 		};
 	};
 
-
-	/*
-	 * These channels from the ADC are simply hardware monitors.
-	 * That is why the ADC is referred to as "HKADC" - HouseKeeping
-	 * ADC.
-	 */
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&pm8921_xoadc 0x00 0x01>, /* Battery */
-			      <&pm8921_xoadc 0x00 0x02>, /* DC in (charger) */
-			      <&pm8921_xoadc 0x00 0x04>, /* VPH the main system voltage */
-			      <&pm8921_xoadc 0x00 0x0b>, /* Die temperature */
-			      <&pm8921_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
-			      <&pm8921_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
-			      <&pm8921_xoadc 0x00 0x0e>; /* Charger temperature */
-	};
-
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -655,129 +638,16 @@ rng@1a500000 {
 			clock-names = "core";
 		};
 
-		ssbi@c00000 {
+		ssbi2: ssbi@c00000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00c00000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-
-			pm8821: pmic {
-				compatible = "qcom,pm8821";
-				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pm8821_mpps: mpps@50 {
-					compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
-					reg = <0x50>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&pm8821_mpps 0 0 4>;
-				};
-			};
 		};
 
-		ssbi@500000 {
+		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-
-			pm8921: pmic {
-				compatible = "qcom,pm8921";
-				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pm8921_gpio: gpio@150 {
-
-					compatible = "qcom,pm8921-gpio",
-						     "qcom,ssbi-gpio";
-					reg = <0x150>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					gpio-controller;
-					gpio-ranges = <&pm8921_gpio 0 0 44>;
-					#gpio-cells = <2>;
-
-				};
-
-				pm8921_mpps: mpps@50 {
-					compatible = "qcom,pm8921-mpp",
-						     "qcom,ssbi-mpp";
-					reg = <0x50>;
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&pm8921_mpps 0 0 12>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-				};
-
-				rtc@11d {
-					compatible = "qcom,pm8921-rtc";
-					interrupt-parent = <&pm8921>;
-					interrupts = <39 1>;
-					reg = <0x11d>;
-					allow-set-time;
-				};
-
-				pwrkey@1c {
-					compatible = "qcom,pm8921-pwrkey";
-					reg = <0x1c>;
-					interrupt-parent = <&pm8921>;
-					interrupts = <50 1>, <51 1>;
-					debounce = <15625>;
-					pull-up;
-				};
-
-				pm8921_xoadc: xoadc@197 {
-					compatible = "qcom,pm8921-adc";
-					reg = <0x197>;
-					interrupts-extended = <&pm8921 78 IRQ_TYPE_EDGE_RISING>;
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
-					vph_pwr: adc-channel@4 {
-						reg = <0x00 0x04>;
-					};
-					batt_therm: adc-channel@8 {
-						reg = <0x00 0x08>;
-					};
-					batt_id: adc-channel@9 {
-						reg = <0x00 0x09>;
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
-					chg_temp: adc-channel@e {
-						reg = <0x00 0x0e>;
-					};
-					ref_muxoff: adc-channel@f {
-						reg = <0x00 0x0f>;
-					};
-				};
-			};
 		};
 
 		qfprom: qfprom@700000 {
-- 
2.39.2


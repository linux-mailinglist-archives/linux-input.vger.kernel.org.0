Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724507B1947
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbjI1LD6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjI1LDy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCE21A5
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50444e756deso16706706e87.0
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899006; x=1696503806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDHR/qTLZAAlEyQL6qHwxIGFzk6+uGKbaVZYZcIFL9s=;
        b=sBl1lUHml4PkoMgetGP7LlsGj1JvoxaNf7MAnttgEh4seWUjjgH9oZ+4uoTejde4pW
         eWI55QuHFZDbT1vpmugQw40H+YTcCQFNKaq/MS2JU4C+ZTlaXYTwD4zgtWWd4C6yksKP
         C+rk0UaXZrUPAR1/hV9iaGsQpl45ND0RgGrSBRbZhoEoFsmD5xzqK/3l0cyRzrqWpEnw
         5eAkY3c3XuXyzclFY4cFcILSzfThdloaP51yD6NKiyg7GRse8SkhP0/uvDFirA7W/jbq
         0c1tqxjK2HRmziyJYFM6JioepkvQ568WmFeZWIhmWNGt64+AUuYPB/oLzSXlYcz0Yj4K
         djYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899006; x=1696503806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDHR/qTLZAAlEyQL6qHwxIGFzk6+uGKbaVZYZcIFL9s=;
        b=nbeITstMh8A2fazNCsZWvKaW+gbjpDzN92l+pUM7Zq8TZSLPP2f9mNTfSjOhaQRSOA
         7njo+yp1UpYsQjRZHkee1sIDJ3tDh+n3E9NgK5RBq4J3tI3uq5eXC0vOxTmpzquXZuCF
         6AC4UC4nZC18mh0WpcSY/xa67VzIfqFRom9XeczO3n7AS8kjjigW+APYV5+7WOaTbILW
         1uJc3Qh59KoKUKzEa3xK+qsKwAyBEds9lmMDKvnTZ5Ngza7alsJ/vSbUeF/y1fXqUIUk
         J2zqb10At2PF7hfOyqKmyJr73vXvkFv6IZ3EgwSf0+COS9gY7uidd7rRj8pBg8napLHW
         sZFg==
X-Gm-Message-State: AOJu0Yymm/aURKqruGOWJ2mLNxlBgWRaLv+qsHLh1D4G8pS3nYxg0JMQ
        6yjtEHzhFBjB9HfFAvG9dlLRMA==
X-Google-Smtp-Source: AGHT+IHeCKmIg/iLYUJ6P+R0Ovv3QuET3rrA3UKayDrMIK5OdN2r9c0vCPk41JfqFT1fxfq0FRG1sQ==
X-Received: by 2002:a05:6512:1383:b0:503:59d:fbff with SMTP id fc3-20020a056512138300b00503059dfbffmr1143498lfb.2.1695899005733;
        Thu, 28 Sep 2023 04:03:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 18/36] ARM: dts: qcom: mdm9615: split PMIC to separate dtsi files
Date:   Thu, 28 Sep 2023 14:02:51 +0300
Message-Id: <20230928110309.1212221-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
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

The PMIC is not a part of the SoC, so move PMIC to a separate file and
include it from the board files.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi            | 57 +++++++++++++++++++
 .../boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    |  1 +
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi      | 48 +---------------
 3 files changed, 59 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8018.dtsi

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
new file mode 100644
index 000000000000..c602544900b2
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Device Tree Source for Qualcomm PM8018
+ *
+ * Copyright (C) 2016 BayLibre, SAS.
+ * Author : Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+&ssbi {
+	pm8018: pmic {
+		compatible = "qcom,pm8018", "qcom,pm8921";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pwrkey@1c {
+			compatible = "qcom,pm8018-pwrkey",
+				     "qcom,pm8921-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8018>;
+			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+				     <51 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15625>;
+			pull-up;
+		};
+
+		pm8018_mpps: mpps@50 {
+			compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			reg = <0x50>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8018_mpps 0 0 6>;
+		};
+
+		rtc@11d {
+			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
+			interrupt-parent = <&pm8018>;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			reg = <0x11d>;
+			allow-set-time;
+		};
+
+		pm8018_gpio: gpio@150 {
+			compatible = "qcom,pm8058-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pm8018_gpio 0 0 6>;
+			#gpio-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index b782ff0d16cd..27c3d92d9452 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include "qcom-mdm9615.dtsi"
+#include "pm8018.dtsi"
 
 / {
 	model = "Sierra Wireless WP8548 Module";
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index 373d9425b8bd..e23ca6c42683 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -258,56 +258,10 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
-		qcom,ssbi@500000 {
+		ssbi: qcom,ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-
-			pm8018: pmic {
-				compatible = "qcom,pm8018", "qcom,pm8921";
-				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pwrkey@1c {
-					compatible = "qcom,pm8018-pwrkey", "qcom,pm8921-pwrkey";
-					reg = <0x1c>;
-					interrupt-parent = <&pm8018>;
-					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-						     <51 IRQ_TYPE_EDGE_RISING>;
-					debounce = <15625>;
-					pull-up;
-				};
-
-				pm8018_mpps: mpps@50 {
-					compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					reg = <0x50>;
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&pm8018_mpps 0 0 6>;
-				};
-
-				rtc@11d {
-					compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
-					interrupt-parent = <&pm8018>;
-					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-					reg = <0x11d>;
-					allow-set-time;
-				};
-
-				pm8018_gpio: gpio@150 {
-					compatible = "qcom,pm8018-gpio", "qcom,ssbi-gpio";
-					reg = <0x150>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					gpio-controller;
-					gpio-ranges = <&pm8018_gpio 0 0 6>;
-					#gpio-cells = <2>;
-				};
-			};
 		};
 
 		sdcc1bam: dma-controller@12182000 {
-- 
2.39.2


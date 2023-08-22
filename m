Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462857836CE
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbjHVAOg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbjHVAOe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:34 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411DECD8
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50043cf2e29so3449922e87.2
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663253; x=1693268053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJM6CyTYSM08II7zRgc1m+LUZJTk+XfRpZI/zESTTZw=;
        b=z2NSBFYf7xcmb/iKrIxkEUW6VqV/meG0W/yzNToIOrBPWb3E+ji8VhdQvSgURqs560
         WCZyHkoyQ366yC7P3KM63Wr2cCG5ikGYJBH7wGyOL3zwi8hLi4vx8a+KYb8SpQJcUxU9
         aVTi9v3bU94lF65bw1Ot1dWB/J3Pu1OyuPO6GyckxdgTJpbhNYfG6RKAO8rmLw1d+v2B
         9K6bFpX95+ZE0IFnzFoP5sDH7ieO9t9kqihaQgISHxWPpQbO0bcPp5idZgGcz1iCcKX0
         6/nmQNtGrQhseZZbitEr+8gWJ1Rg0TEUcT3mZ1u2T1vFAoPSo76HWF02iiuWHYS46BEW
         Q/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663253; x=1693268053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJM6CyTYSM08II7zRgc1m+LUZJTk+XfRpZI/zESTTZw=;
        b=ZyuiJE7X3FyEE6Y+oQZksGsWiWNDybzUx8Hc1q7w+N2TXAI1ewFCH2a9BktrVVT6XB
         sUgKIOP9pmuQz36QHzZ2iSvoJzIToLRfFgQkuNgMAywFsogWn+UMLh5ZB/hkaknaEnzG
         AV8UsnVEaFZdfX8SZAqKbj0Chj0MdtEt6rxBce+CJ8CPbolcQHjeWgzqcT97R+QSDlyT
         wMxhxKhLgo/GC+ogQfWj+h0eDfbAO8sFZ5qMV0uDuLr7EuMTpADFAajKePeq+O6AHlqy
         XX5ok5gSTO0MTjEiUwyIlt7ve0EeofrfLfqVkWEuEkSha73xcn6fErNncdt5essd/zqT
         7qaQ==
X-Gm-Message-State: AOJu0YwUWzNNKAU7ZNTwLtFVk9pSuVyNZWuIuQJU5XJWgm9CkeofOuXh
        ZJ8dUla8dEEG46uIK3c7Ajg14Q==
X-Google-Smtp-Source: AGHT+IEm7f840ecXcadAi4eooBoZVzkSuWuo4gyGXD+OpGeHiyaW2aoZgul5LEozEaWswf9W+0CSaA==
X-Received: by 2002:a19:770f:0:b0:500:8ecb:509 with SMTP id s15-20020a19770f000000b005008ecb0509mr30793lfc.15.1692663253410;
        Mon, 21 Aug 2023 17:14:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 28/32] ARM: dts: qcom: msm8660: move RPM regulators to board files
Date:   Tue, 22 Aug 2023 03:13:45 +0300
Message-Id: <20230822001349.899298-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The set of regulators available over the RPM requests is not a property
of the SoC. Move them to board files.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../dts/qcom/qcom-apq8060-dragonboard.dts     | 141 ++++++++++++------
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts  |  10 ++
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi      |  66 --------
 3 files changed, 102 insertions(+), 115 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 20de516a8deb..8a511f69d800 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -449,6 +449,8 @@ &rpm {
 	 * that means
 	 */
 	regulators-0 {
+		compatible = "qcom,rpm-pm8901-regulators";
+
 		vdd_l0-supply = <&pm8901_s4>;
 		vdd_l1-supply = <&vph>;
 		vdd_l2-supply = <&vph>;
@@ -466,57 +468,63 @@ regulators-0 {
 		lvs3_in-supply = <&pm8058_s2>;
 		mvs_in-supply = <&pm8058_s3>;
 
-		l0 {
+		pm8901_l0: l0 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 		};
-		l1 {
+
+		pm8901_l1: l1 {
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			bias-pull-down;
 		};
-		l2 {
+
+		pm8901_l2: l2 {
 			/* TMA340 requires strictly 3.3V */
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			bias-pull-down;
 		};
-		l3 {
+
+		pm8901_l3: l3 {
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			bias-pull-down;
 		};
-		l4 {
+
+		pm8901_l4: l4 {
 			regulator-min-microvolt = <2600000>;
 			regulator-max-microvolt = <2600000>;
 			bias-pull-down;
 		};
-		l5 {
+
+		pm8901_l5: l5 {
 			regulator-min-microvolt = <2850000>;
 			regulator-max-microvolt = <2850000>;
 			bias-pull-down;
 		};
-		l6 {
+
+		pm8901_l6: l6 {
 			regulator-min-microvolt = <2200000>;
 			regulator-max-microvolt = <2200000>;
 			bias-pull-down;
 		};
 
 		/* s0 and s1 are SAW regulators controlled over SPM */
-		s2 {
+		pm8901_s2: s2 {
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1300000>;
 			qcom,switch-mode-frequency = <1600000>;
 			bias-pull-down;
 		};
-		s3 {
+		pm8901_s3: s3 {
 			regulator-min-microvolt = <1100000>;
 			regulator-max-microvolt = <1100000>;
 			qcom,switch-mode-frequency = <1600000>;
 			bias-pull-down;
 		};
-		s4 {
+		pm8901_s4: s4 {
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
 			qcom,switch-mode-frequency = <1600000>;
@@ -524,17 +532,22 @@ s4 {
 		};
 
 		/* LVS0 thru 3 and mvs are just switches */
-		lvs0 {
+		pm8901_lvs0: lvs0 {
 			regulator-always-on;
 		};
-		lvs1 { };
-		lvs2 { };
-		lvs3 { };
-		mvs { };
 
+		pm8901_lvs1: lvs1 { };
+
+		pm8901_lvs2: lvs2 { };
+
+		pm8901_lvs3: lvs3 { };
+
+		pm8901_mvs: mvs { };
 	};
 
 	regulators-1 {
+		compatible = "qcom,rpm-pm8058-regulators";
+
 		vdd_l0_l1_lvs-supply = <&pm8058_s3>;
 		vdd_l2_l11_l12-supply = <&vph>;
 		vdd_l3_l4_l5-supply = <&vph>;
@@ -556,144 +569,169 @@ regulators-1 {
 		vdd_s4-supply = <&vph>;
 		vdd_ncp-supply = <&vph>;
 
-		l0 {
+		pm8058_l0: l0 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 		};
-		l1 {
+
+		pm8058_l1: l1 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 		};
-		l2 {
+
+		pm8058_l2: l2 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2600000>;
 			bias-pull-down;
 		};
-		l3 {
+
+		pm8058_l3: l3 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
-		l4 {
+
+		pm8058_l4: l4 {
 			regulator-min-microvolt = <2850000>;
 			regulator-max-microvolt = <2850000>;
 			bias-pull-down;
 		};
-		l5 {
+
+		pm8058_l5: l5 {
 			regulator-min-microvolt = <2850000>;
 			regulator-max-microvolt = <2850000>;
 			bias-pull-down;
 		};
-		l6 {
+
+		pm8058_l6: l6 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3600000>;
 			bias-pull-down;
 		};
-		l7 {
+
+		pm8058_l7: l7 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
-		l8 {
+
+		pm8058_l8: l8 {
 			regulator-min-microvolt = <2900000>;
 			regulator-max-microvolt = <3050000>;
 			bias-pull-down;
 		};
-		l9 {
+
+		pm8058_l9: l9 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
-		l10 {
+
+		pm8058_l10: l10 {
 			regulator-min-microvolt = <2600000>;
 			regulator-max-microvolt = <2600000>;
 			bias-pull-down;
 		};
-		l11 {
+
+		pm8058_l11: l11 {
 			regulator-min-microvolt = <1500000>;
 			regulator-max-microvolt = <1500000>;
 			bias-pull-down;
 		};
-		l12 {
+
+		pm8058_l12: l12 {
 			regulator-min-microvolt = <2900000>;
 			regulator-max-microvolt = <2900000>;
 			bias-pull-down;
 		};
-		l13 {
+
+		pm8058_l13: l13 {
 			regulator-min-microvolt = <2050000>;
 			regulator-max-microvolt = <2050000>;
 			bias-pull-down;
 		};
-		l14 {
+
+		pm8058_l14: l14 {
 			regulator-min-microvolt = <2850000>;
 			regulator-max-microvolt = <2850000>;
 		};
-		l15 {
+
+		pm8058_l15: l15 {
 			regulator-min-microvolt = <2850000>;
 			regulator-max-microvolt = <2850000>;
 			bias-pull-down;
 		};
-		l16 {
+
+		pm8058_l16: l16 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 			regulator-always-on;
 		};
-		l17 {
+
+		pm8058_l17: l17 {
 			// 1.5V according to schematic
 			regulator-min-microvolt = <2600000>;
 			regulator-max-microvolt = <2600000>;
 			bias-pull-down;
 		};
-		l18 {
+
+		pm8058_l18: l18 {
 			regulator-min-microvolt = <2200000>;
 			regulator-max-microvolt = <2200000>;
 			bias-pull-down;
 		};
-		l19 {
+
+		pm8058_l19: l19 {
 			regulator-min-microvolt = <2500000>;
 			regulator-max-microvolt = <2500000>;
 			bias-pull-down;
 		};
-		l20 {
+
+		pm8058_l20: l20 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
-		l21 {
+
+		pm8058_l21: l21 {
 			// 1.1 V according to schematic
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 			regulator-always-on;
 		};
-		l22 {
+
+		pm8058_l22: l22 {
 			// 1.2 V according to schematic
 			regulator-min-microvolt = <1150000>;
 			regulator-max-microvolt = <1150000>;
 			bias-pull-down;
 		};
-		l23 {
+
+		pm8058_l23: l23 {
 			// Unused
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 		};
-		l24 {
+
+		pm8058_l24: l24 {
 			// Unused
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 		};
-		l25 {
+
+		pm8058_l25: l25 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 		};
 
-		s0 {
+		pm8058_s0: s0 {
 			// regulator-min-microvolt = <500000>;
 			// regulator-max-microvolt = <1325000>;
 			regulator-min-microvolt = <1100000>;
@@ -701,7 +739,8 @@ s0 {
 			qcom,switch-mode-frequency = <1600000>;
 			bias-pull-down;
 		};
-		s1 {
+
+		pm8058_s1: s1 {
 			// regulator-min-microvolt = <500000>;
 			// regulator-max-microvolt = <1250000>;
 			regulator-min-microvolt = <1100000>;
@@ -709,21 +748,24 @@ s1 {
 			qcom,switch-mode-frequency = <1600000>;
 			bias-pull-down;
 		};
-		s2 {
+
+		pm8058_s2: s2 {
 			// 1.3 V according to schematic
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1400000>;
 			qcom,switch-mode-frequency = <1600000>;
 			bias-pull-down;
 		};
-		s3 {
+
+		pm8058_s3: s3 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			qcom,switch-mode-frequency = <1600000>;
 			regulator-always-on;
 			bias-pull-down;
 		};
-		s4 {
+
+		pm8058_s4: s4 {
 			regulator-min-microvolt = <2200000>;
 			regulator-max-microvolt = <2200000>;
 			qcom,switch-mode-frequency = <1600000>;
@@ -732,14 +774,15 @@ s4 {
 		};
 
 		/* LVS0 and LVS1 are just switches */
-		lvs0 {
+		pm8058_lvs0: lvs0 {
 			bias-pull-down;
 		};
-		lvs1 {
+
+		pm8058_lvs1: lvs1 {
 			bias-pull-down;
 		};
 
-		ncp {
+		pm8058_ncp: ncp {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			qcom,switch-mode-frequency = <1600000>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
index 04dca0c93971..43e646ded7bd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
@@ -61,6 +61,16 @@ MATRIX_KEY(5, 4, KEY_MENU)
 	keypad,num-columns = <5>;
 };
 
+&rpm {
+	regulators-0 {
+		compatible = "qcom,rpm-pm8901-regulators";
+	};
+
+	regulators-1 {
+		compatible = "qcom,rpm-pm8058-regulators";
+	};
+};
+
 /* eMMC */
 &sdcc1 {
 	vmmc-supply = <&vsdcc_fixed>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index b8094b7c09fc..c2cb3abd5177 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -352,72 +352,6 @@ rpmcc: clock-controller {
 				clocks = <&pxo_board>;
 				clock-names = "pxo";
 			};
-
-			regulators-0 {
-				compatible = "qcom,rpm-pm8901-regulators";
-
-				pm8901_l0: l0 {};
-				pm8901_l1: l1 {};
-				pm8901_l2: l2 {};
-				pm8901_l3: l3 {};
-				pm8901_l4: l4 {};
-				pm8901_l5: l5 {};
-				pm8901_l6: l6 {};
-
-				/* S0 and S1 Handled as SAW regulators by SPM */
-				pm8901_s2: s2 {};
-				pm8901_s3: s3 {};
-				pm8901_s4: s4 {};
-
-				pm8901_lvs0: lvs0 {};
-				pm8901_lvs1: lvs1 {};
-				pm8901_lvs2: lvs2 {};
-				pm8901_lvs3: lvs3 {};
-
-				pm8901_mvs: mvs {};
-			};
-
-			regulators-1 {
-				compatible = "qcom,rpm-pm8058-regulators";
-
-				pm8058_l0: l0 {};
-				pm8058_l1: l1 {};
-				pm8058_l2: l2 {};
-				pm8058_l3: l3 {};
-				pm8058_l4: l4 {};
-				pm8058_l5: l5 {};
-				pm8058_l6: l6 {};
-				pm8058_l7: l7 {};
-				pm8058_l8: l8 {};
-				pm8058_l9: l9 {};
-				pm8058_l10: l10 {};
-				pm8058_l11: l11 {};
-				pm8058_l12: l12 {};
-				pm8058_l13: l13 {};
-				pm8058_l14: l14 {};
-				pm8058_l15: l15 {};
-				pm8058_l16: l16 {};
-				pm8058_l17: l17 {};
-				pm8058_l18: l18 {};
-				pm8058_l19: l19 {};
-				pm8058_l20: l20 {};
-				pm8058_l21: l21 {};
-				pm8058_l22: l22 {};
-				pm8058_l23: l23 {};
-				pm8058_l24: l24 {};
-				pm8058_l25: l25 {};
-
-				pm8058_s0: s0 {};
-				pm8058_s1: s1 {};
-				pm8058_s2: s2 {};
-				pm8058_s3: s3 {};
-				pm8058_s4: s4 {};
-
-				pm8058_lvs0: lvs0 {};
-				pm8058_lvs1: lvs1 {};
-
-				pm8058_ncp: ncp {};
-			};
 		};
 
 		amba {
-- 
2.39.2


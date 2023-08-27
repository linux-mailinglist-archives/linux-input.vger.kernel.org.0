Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95174789E99
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 15:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjH0N0f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 09:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjH0N0A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 09:26:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FABE18F
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso3624174e87.0
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 06:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142751; x=1693747551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq3BxAnxew6Dft2P4UeUZDsOAM3fd799SyMWmIu1TH8=;
        b=tcf4/N+U7OfMIqQsXoAB94+ahYsqsnBb4AHSeHtkAAymO74IXCoZC/pd9sTltDqeN1
         kTmArmUjFbVUk9rYVpLtRFiLC/TT2TYzE3waz1l6vX1uSmdGDYPSs23p7oMm5qdqHx1Q
         1IKJEdZIJKnbbs4Ljp4pUKjEIVb3vMsZgKgXnxWEA6qxv9lXbqUW0nw7oBG4W1jreBpf
         GJjEdurlbrPRyIq6n9Ce8p5L9gTADTZ1g3Wp1sLvMO68kcCBGE4W0lzdl9wogWJm0Msq
         FOlR5WanPCA9gxBowSnOdW9boy82TYTjsXvIGnIEdyrYQ6Ms0AI3QRaZPPD68wNc16AX
         UMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142751; x=1693747551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq3BxAnxew6Dft2P4UeUZDsOAM3fd799SyMWmIu1TH8=;
        b=W4tGWFVhl/bvLgX2mfemCCKEaRhtBgRTuOHI6im2qP2EzgXnoLqJXygJpAznwls5fp
         O1mYzSUS7MN/wF+7yzu/R2wnbF+im7p2vV7yvPXmeH5K+l1s5vyZnufJOJPFP/ar+y4e
         OUUJVKDZ9YxS1FNmIUGTrygnRoJT7g6iaI5d/nM8YO3F7qTOTiNZTgBxLqtq2SWYqGtn
         YJF/gp+aboqBD4JCSInKIITIYVh4kGTtsGj3Qh7oDX0HEzSx2FsGW1WuB1YP67ZDsslf
         Kah2gb9JSRh31R2OAQqWpcp3+R8KL7U7qMfYibKbTwy7Cok0Z53heJXBmFcS6f5JV1Pb
         CmMA==
X-Gm-Message-State: AOJu0YzkqFjAqqH/NSfCnWJtdkogQ0jY5Ww9GHG8bMuiSdt780hyjHtu
        Of8c668pn08z3Z8ACozWg7vujA==
X-Google-Smtp-Source: AGHT+IE9y3UytJ/mudrDtl6dRfsXiuo6S4/Dz0F4nFElhCHrBvnyCnUR6Tg/ndq+I/sfGEG4+9Y7nA==
X-Received: by 2002:a05:6512:4026:b0:4ff:80d4:e132 with SMTP id br38-20020a056512402600b004ff80d4e132mr19689019lfb.29.1693142751647;
        Sun, 27 Aug 2023 06:25:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:51 -0700 (PDT)
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
Subject: [PATCH v5 30/37] ARM: dts: qcom: mdm9615: move RPM regulators to board files
Date:   Sun, 27 Aug 2023 16:25:18 +0300
Message-Id: <20230827132525.951475-31-dmitry.baryshkov@linaro.org>
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

The set of regulators available over the RPM requests is not a property
of the SoC. Move them to board files.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    | 136 ++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi      | 134 -----------------
 2 files changed, 136 insertions(+), 134 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index 27c3d92d9452..0dd52cac0e2e 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -134,6 +134,142 @@ &gsbi5_serial {
 	pinctrl-names = "default";
 };
 
+&rpm {
+	regulators {
+		compatible = "qcom,rpm-pm8018-regulators";
+
+		vin_lvs1-supply = <&pm8018_s3>;
+
+		vdd_l7-supply = <&pm8018_s4>;
+		vdd_l8-supply = <&pm8018_s3>;
+		vdd_l9_l10_l11_l12-supply = <&pm8018_s5>;
+
+		/* Buck SMPS */
+		pm8018_s1: s1 {
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1150000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		pm8018_s2: s2 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		pm8018_s3: s3 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		pm8018_s4: s4 {
+			regulator-min-microvolt = <2100000>;
+			regulator-max-microvolt = <2200000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		pm8018_s5: s5 {
+			regulator-always-on;
+			regulator-min-microvolt = <1350000>;
+			regulator-max-microvolt = <1350000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		/* PMOS LDO */
+		pm8018_l2: l2 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		pm8018_l3: l3 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		pm8018_l4: l4 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			bias-pull-down;
+		};
+
+		pm8018_l5: l5 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+
+		pm8018_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+
+		pm8018_l7: l7 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1900000>;
+			bias-pull-down;
+		};
+
+		pm8018_l8: l8 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+
+		pm8018_l9: l9 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1150000>;
+			bias-pull-down;
+		};
+
+		pm8018_l10: l10 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			bias-pull-down;
+		};
+
+		pm8018_l11: l11 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			bias-pull-down;
+		};
+
+		pm8018_l12: l12 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			bias-pull-down;
+		};
+
+		pm8018_l13: l13 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		pm8018_l14: l14 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+
+		/* Low Voltage Switch */
+		pm8018_lvs1: lvs1 {
+			bias-pull-down;
+		};
+	};
+};
+
 &sdcc1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index e23ca6c42683..07e712e890f6 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -338,140 +338,6 @@ rpm: rpm@108000 {
 				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ack", "err", "wakeup";
-
-			regulators {
-				compatible = "qcom,rpm-pm8018-regulators";
-
-				vin_lvs1-supply = <&pm8018_s3>;
-
-				vdd_l7-supply = <&pm8018_s4>;
-				vdd_l8-supply = <&pm8018_s3>;
-				vdd_l9_l10_l11_l12-supply = <&pm8018_s5>;
-
-				/* Buck SMPS */
-				pm8018_s1: s1 {
-					regulator-min-microvolt = <500000>;
-					regulator-max-microvolt = <1150000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-
-				pm8018_s2: s2 {
-					regulator-min-microvolt = <1225000>;
-					regulator-max-microvolt = <1300000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-
-				pm8018_s3: s3 {
-					regulator-always-on;
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-
-				pm8018_s4: s4 {
-					regulator-min-microvolt = <2100000>;
-					regulator-max-microvolt = <2200000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-
-				pm8018_s5: s5 {
-					regulator-always-on;
-					regulator-min-microvolt = <1350000>;
-					regulator-max-microvolt = <1350000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-
-				/* PMOS LDO */
-				pm8018_l2: l2 {
-					regulator-always-on;
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-
-				pm8018_l3: l3 {
-					regulator-always-on;
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-
-				pm8018_l4: l4 {
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-					bias-pull-down;
-				};
-
-				pm8018_l5: l5 {
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-					bias-pull-down;
-				};
-
-				pm8018_l6: l6 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <2850000>;
-					bias-pull-down;
-				};
-
-				pm8018_l7: l7 {
-					regulator-min-microvolt = <1850000>;
-					regulator-max-microvolt = <1900000>;
-					bias-pull-down;
-				};
-
-				pm8018_l8: l8 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-
-				pm8018_l9: l9 {
-					regulator-min-microvolt = <750000>;
-					regulator-max-microvolt = <1150000>;
-					bias-pull-down;
-				};
-
-				pm8018_l10: l10 {
-					regulator-min-microvolt = <1050000>;
-					regulator-max-microvolt = <1050000>;
-					bias-pull-down;
-				};
-
-				pm8018_l11: l11 {
-					regulator-min-microvolt = <1050000>;
-					regulator-max-microvolt = <1050000>;
-					bias-pull-down;
-				};
-
-				pm8018_l12: l12 {
-					regulator-min-microvolt = <1050000>;
-					regulator-max-microvolt = <1050000>;
-					bias-pull-down;
-				};
-
-				pm8018_l13: l13 {
-					regulator-min-microvolt = <1850000>;
-					regulator-max-microvolt = <2950000>;
-					bias-pull-down;
-				};
-
-				pm8018_l14: l14 {
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-					bias-pull-down;
-				};
-
-				/* Low Voltage Switch */
-				pm8018_lvs1: lvs1 {
-					bias-pull-down;
-				};
-			};
 		};
 	};
 };
-- 
2.39.2


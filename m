Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8507B1912
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjI1LD2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbjI1LDY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:24 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1AB1A3
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:22 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50307acd445so20353558e87.0
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899000; x=1696503800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOrWUiYOcXCyoqm0CVvNGXKNYMS6loIPhDCU3q6avBA=;
        b=vz5N7stNicRwlY+5ObjrwJbJOuewu8BPIR5VJAtVSD/gwC3pixFA9PY7LxKkIlUJod
         /0NKrtDW8FibQ5XeOoSujl1wO1zDq5rOr7CJfoiUcS/F95ZCkgJYCWLGzCUOrjs+4t3Q
         vGbCJ4t7Jsap7I/Q7EnhHnlrZUNoa9/CtJvJEdl2jJWl20xOJ2PfYPMfUyOTfDNb2waX
         PBrSe5e3CgibeaO/M21RV+Scxy2xPyrfoiFicWlF7OQN4hpnnBdXS0ENv3I2cS0O5JtU
         65gatUwvaHCGuJiaOIycHu+jmUZ8ITGv5kfZNHKN8pAkmIeSKOY8eoIOVY7kOE+CHZ9Q
         B9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899000; x=1696503800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOrWUiYOcXCyoqm0CVvNGXKNYMS6loIPhDCU3q6avBA=;
        b=JxmpFV2zoANxlKMovCaefFQZQJ04vq+nGk9y3Ui1a3+gaY6m4FQqklt5cVIgGdctX2
         upW+eVyFIbPmBLRUN/MnzL3JCxdEDc+oeGyt2jvHh42BEt9RqaGZ3UaFBdopQZmvMgt6
         DUNffUpwygahQ3w12VCQhl7ufMjgXCfhDspDzBKTEsdks4eCWaOL8kAQ9ZdFHkDe8cWv
         veooN/DJ9ixGkFjywxNKbpGW32c2JCWMyNVsLUnM9xs1eCV4k7U3VECLQ+ovTakZSrgG
         XAV5JEwiQ/n2MCocjjrdBnHxWDE/om0JdyejfJqxRSbeH4Ei+BbUCKqdD9W3d8ApF22w
         8n+A==
X-Gm-Message-State: AOJu0YyFE1pWouq0aLgIlnQH4q1HdakHuno3DZ0JiiQXe8cFXpqtCFd1
        nYK8Aq1l0a+wcTik+pf67c5ApA==
X-Google-Smtp-Source: AGHT+IFm6Ng1Z6O/arM2t1g9uy9MH7ekEiS4EP5Qzd0lJlf3iujZ6mvxQBUiCIMWT/yhjjTO0MOfdA==
X-Received: by 2002:a05:6512:1396:b0:4fa:5e76:7ad4 with SMTP id fc22-20020a056512139600b004fa5e767ad4mr1052591lfb.10.1695899000402;
        Thu, 28 Sep 2023 04:03:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 12/36] ARM: dts: qcom: apq8064: move PMIC interrupts to the board files
Date:   Thu, 28 Sep 2023 14:02:45 +0300
Message-Id: <20230928110309.1212221-13-dmitry.baryshkov@linaro.org>
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

The interrupt of SSBI PMICs is routed to the SoCs GPIO. As such, it is
not a property of the SoC, it is a property of the particular board
(even if it is standard and unified between all devices). Move these
interrupt specifications to the board files.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts   | 8 ++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts          | 8 ++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts           | 8 ++++++++
 .../boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts | 8 ++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi                  | 4 ----
 5 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index 0e80a5a8e3c6..b820f3255c16 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -185,6 +185,14 @@ &mdp_dsi1_out {
 	remote-endpoint = <&dsi0_in>;
 };
 
+&pm8821 {
+	interrupts-extended = <&tlmm_pinmux 76 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&pm8921 {
+	interrupts-extended = <&tlmm_pinmux 74 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &rpm {
 	regulators {
 		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
index d6ecfd8addb7..c01254b1a3a7 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
@@ -69,6 +69,14 @@ &pcie {
 	status = "okay";
 };
 
+&pm8821 {
+	interrupts-extended = <&tlmm_pinmux 76 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&pm8921 {
+	interrupts-extended = <&tlmm_pinmux 74 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &pm8921_gpio {
 	wlan_default_gpios: wlan-gpios-state {
 		pinconf {
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index 96307550523a..f1bd29333c9b 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -171,6 +171,14 @@ &pcie {
 	perst-gpios = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
 };
 
+&pm8821 {
+	interrupts-extended = <&tlmm_pinmux 76 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&pm8921 {
+	interrupts-extended = <&tlmm_pinmux 74 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &pm8921_gpio {
 	wlan_default_gpios: wlan-gpios-state {
 		pinconf {
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
index 9244512b74d1..7917f1657025 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
@@ -65,6 +65,14 @@ &gsbi5_serial {
 	status = "okay";
 };
 
+&pm8821 {
+	interrupts-extended = <&tlmm_pinmux 76 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&pm8921 {
+	interrupts-extended = <&tlmm_pinmux 74 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &pm8921_gpio {
 	gpio_keys_pin_a: gpio-keys-active-state {
 		pins = "gpio3", "gpio4", "gpio29", "gpio35";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 6514d728b1ec..76796002bda6 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -662,8 +662,6 @@ ssbi@c00000 {
 
 			pm8821: pmic {
 				compatible = "qcom,pm8821";
-				interrupt-parent = <&tlmm_pinmux>;
-				interrupts = <76 IRQ_TYPE_LEVEL_LOW>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				#address-cells = <1>;
@@ -688,8 +686,6 @@ ssbi@500000 {
 
 			pm8921: pmic {
 				compatible = "qcom,pm8921";
-				interrupt-parent = <&tlmm_pinmux>;
-				interrupts = <74 8>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				#address-cells = <1>;
-- 
2.39.2


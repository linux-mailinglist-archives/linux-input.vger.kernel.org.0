Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A91D544967
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbfFMRRF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:17:05 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34777 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFLV1x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:27:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id p10so3770067pgn.1;
        Wed, 12 Jun 2019 14:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ddKPMdbcolx+MlezVseDqA/SJOts207w3vr68vxtfvw=;
        b=MZkvl5waJG3PaMBTPQS/ZPTaBA5nQl+G2QYeqLEJjyV57PKwTcsp2+9od739f0Zugx
         Q76GgE9ZnltkYientaIWlh0IKq40ST0A3/QWkaqv0zw9TErHeWkXNoYEKAS6etZoEktN
         HBl7xkD0RZv8w22dQnrZ9MJ8GZg+/8tjGBBpR0CPiH8UCJ8EufXqMK0if7PEQtyeicVH
         BnZA1pq7/pDTiT4zSoum7j/it4DiP4bM7tx5oi+BmlPJPgXUhmmUCuaYSaWPCVCyEtz1
         yyxrrjfuSYw7RSj8x3vFXRBsT5XIWdAYzqj0fwaheNvXbjTivyIqlK/r+S5h/EqtrEfR
         TT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ddKPMdbcolx+MlezVseDqA/SJOts207w3vr68vxtfvw=;
        b=f4xtzHVoP8CwibXhvH3u1s9QQAwVOhWJ4jmq+jWTEHMqP2WqRlzC4p8qtvxNVI85C0
         yhM99U7NRP0CE54kInA+vpsfSrnCsfBJwd4YFtysZxngQ1G+JPv/nRbbD29z5tJIvIHe
         6rcFl0BHldeUDJTSgE27tFA2UxYQYI3w0eEfL8Sif2nDVpURc4qu3und21LIY1MDAASQ
         UtIvRTDuvOvZJXOXx2/lzW7JqPcwY1Imrum9tp03kjm6lznwXsv/GNZZrzH304V4a5Px
         KaxvEkFGzBgOzxOuwF/pzfrFfYFhu3M7PL0ynAoZ95hLn8aWQ/nYjKijXJqggLjG1QtI
         2EhA==
X-Gm-Message-State: APjAAAX+uzKc1pqOPY02h5m71EXwPaEBn/gP+1sGGdPVL+I9eBMnwQPV
        HvU5xPERNEcX37DnJHhmbC0=
X-Google-Smtp-Source: APXvYqzUUlw8MM/sLe9l9pJwuZtq7WntBHUYXtXe4JGZWJIoKUVJxhSFJxfeya+VD1N9g2KQYxSo8w==
X-Received: by 2002:a63:e24c:: with SMTP id y12mr26850606pgj.276.1560374872741;
        Wed, 12 Jun 2019 14:27:52 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id w197sm553011pfd.41.2019.06.12.14.27.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 14:27:52 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, lee.jones@linaro.org,
        xnox@ubuntu.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v6 3/5] arm64: dts: qcom: Add Lenovo Miix 630
Date:   Wed, 12 Jun 2019 14:27:48 -0700
Message-Id: <20190612212748.32246-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
functionality includes USB (host), microSD-card, keyboard, and trackpad.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8998-clamshell.dtsi      | 240 ++++++++++++++++++
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 +++
 3 files changed, 271 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 21d548f02d39..c3e4307bcbd4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
new file mode 100644
index 000000000000..9682d4dd7496
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2019, Jeffrey Hugo. All rights reserved. */
+
+/*
+ * Common include for MSM8998 clamshell devices, ie the Lenovo Miix 630,
+ * Asus NovaGo TP370QL, and HP Envy x2.  All three devices are basically the
+ * same, with differences in peripherals.
+ */
+
+#include "msm8998.dtsi"
+#include "pm8998.dtsi"
+#include "pm8005.dtsi"
+
+/ {
+	chosen {
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&qusb2phy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+};
+
+&rpm_requests {
+	pm8998-regulators {
+		compatible = "qcom,rpm-pm8998-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_s8-supply = <&vph_pwr>;
+		vdd_s9-supply = <&vph_pwr>;
+		vdd_s10-supply = <&vph_pwr>;
+		vdd_s11-supply = <&vph_pwr>;
+		vdd_s12-supply = <&vph_pwr>;
+		vdd_s13-supply = <&vph_pwr>;
+		vdd_l1_l27-supply = <&vreg_s7a_1p025>;
+		vdd_l2_l8_l17-supply = <&vreg_s3a_1p35>;
+		vdd_l3_l11-supply = <&vreg_s7a_1p025>;
+		vdd_l4_l5-supply = <&vreg_s7a_1p025>;
+		vdd_l6-supply = <&vreg_s5a_2p04>;
+		vdd_l7_l12_l14_l15-supply = <&vreg_s5a_2p04>;
+		vdd_l9-supply = <&vph_pwr>;
+		vdd_l10_l23_l25-supply = <&vph_pwr>;
+		vdd_l13_l19_l21-supply = <&vph_pwr>;
+		vdd_l16_l28-supply = <&vph_pwr>;
+		vdd_l18_l22-supply = <&vph_pwr>;
+		vdd_l20_l24-supply = <&vph_pwr>;
+		vdd_l26-supply = <&vreg_s3a_1p35>;
+		vdd_lvs1_lvs2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s3a_1p35: s3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+		vreg_s4a_1p8: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+		};
+		vreg_s5a_2p04: s5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+		vreg_s7a_1p025: s7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+		vreg_l1a_0p875: l1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-allow-set-load;
+		};
+		vreg_l2a_1p2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-allow-set-load;
+		};
+		vreg_l3a_1p0: l3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+		vreg_l5a_0p8: l5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+		};
+		vreg_l6a_1p8: l6 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <1808000>;
+		};
+		vreg_l7a_1p8: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l8a_1p2: l8 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		vreg_l9a_1p8: l9 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+		vreg_l10a_1p8: l10 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+		vreg_l11a_1p0: l11 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+		vreg_l12a_1p8: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l13a_2p95: l13 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+		vreg_l14a_1p88: l14 {
+			regulator-min-microvolt = <1880000>;
+			regulator-max-microvolt = <1880000>;
+		};
+		vreg_15a_1p8: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l16a_2p7: l16 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+		};
+		vreg_l17a_1p3: l17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+		vreg_l18a_2p7: l18 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+		};
+		vreg_l19a_3p0: l19 {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+		};
+		vreg_l20a_2p95: l20 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+		};
+		vreg_l21a_2p95: l21 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+			regulator-system-load = <800000>;
+		};
+		vreg_l22a_2p85: l22 {
+			regulator-min-microvolt = <2864000>;
+			regulator-max-microvolt = <2864000>;
+		};
+		vreg_l23a_3p3: l23 {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3312000>;
+		};
+		vreg_l24a_3p075: l24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+		};
+		vreg_l25a_3p3: l25 {
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3312000>;
+		};
+		vreg_l26a_1p2: l26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		vreg_l28_3p0: l28 {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+		};
+
+		vreg_lvs1a_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+
+	touchpad: touchpad {
+		config {
+			pins = "gpio123";
+			bias-pull-up;           /* pull up */
+		};
+	};
+};
+
+&sdhc2 {
+	status = "okay";
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on  &sdc2_cmd_on  &sdc2_data_on  &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "host"; /* Force to host until we have Type-C hooked up */
+};
+
+&usb3phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l2a_1p2>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
new file mode 100644
index 000000000000..407c6a32911c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2019, Jeffrey Hugo. All rights reserved. */
+
+/dts-v1/;
+
+#include "msm8998-clamshell.dtsi"
+
+/ {
+	model = "Lenovo Miix 630";
+	compatible = "lenovo,miix-630", "qcom,msm8998";
+};
+
+&blsp1_i2c6 {
+	status = "okay";
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		interrupt-parent = <&tlmm>;
+		interrupts = <0x79 IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x3a>;
+		hid-descr-addr = <0x0001>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchpad>;
+	};
+};
+
+&sdhc2 {
+	cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
+};
-- 
2.17.1


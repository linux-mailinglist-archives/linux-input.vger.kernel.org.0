Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8319470D5D
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2019 01:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730812AbfGVXdY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 19:33:24 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32979 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730786AbfGVXdX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 19:33:23 -0400
Received: by mail-pl1-f193.google.com with SMTP id c14so19758198plo.0
        for <linux-input@vger.kernel.org>; Mon, 22 Jul 2019 16:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TzlfJdYgrQoIt9U3A/d4qiVQDQEbWHWLcVCY5/nV3Ik=;
        b=jzNyCvqdXI+gPekP2kX06K2bwc10ADvouwz8paxumGw+fYLrYsu8TkHyWZxl7MWbAg
         33NcN3gdS6eJFgPb7/ljujmHYQmSc5NJ78mTYoqT5YEXUmn5mT956yR8VhPKrM1LbAx2
         kTpZW0LA/se3jCZd6sZU0+UKJyWHbvBLFRKA9NvUFCG1n735WHXriy9Yme350DH8xXeh
         nHn/X0rsSrcjqWdoo0Tcku880AXerzX4I37QmRnSgfp2AxHQrp99YlJY7x4AvSJ1xA9r
         j3Wp0eID4u5oz/HuyafSOH1Chq7qdpbxlyLi5mXB8jt4e68lYC4ZsCI4j5Uw9L/Twqjb
         WayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TzlfJdYgrQoIt9U3A/d4qiVQDQEbWHWLcVCY5/nV3Ik=;
        b=B+7/1C6bvZl3hQnvdS9tWf5QyZ8PLfL+HTwHPvwqXWNjajccLYKfqZ6tsS4A4d49np
         Y6pRFu73Y2wplO4eqwOfGYSVttdjyw4VFn61dx6YZRjFctozJEVD1j+qhmYZP/oTdt+x
         4ulZ3jLIk8z7qV8bh2BShEA4JYWkLtRs0Z+1iQDVsX1v59zlvl5aimBFU5nC0gxQJucR
         4UW/Kixs1KyHl4OTigNIiGmIVo9TtcTh9fqgE17ZgPqL2UytIHu60F/SkAyJCIUniTtM
         H9WUuCNuXVgh/Hx/x5jmQUyP+IfLgb9P2QAskt7cmuXJf5N5qGgC49SGQVRf8nHFQUKR
         EDfQ==
X-Gm-Message-State: APjAAAVZLXBgqtn6A9dcelNl+Qo/A0efSKkh4dhj7ugf4UToc9Feoj6E
        NGxkEFFYx68A75bJDXRm57fWwg==
X-Google-Smtp-Source: APXvYqync7PdiwzGEaE/N0XkQSXFteGf4DXRBZAS/FIRbPwBg8yeV9IuRcToWRndIhs3H91Dvh+7tw==
X-Received: by 2002:a17:902:5ac4:: with SMTP id g4mr79482054plm.80.1563838402751;
        Mon, 22 Jul 2019 16:33:22 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o14sm33507506pjp.19.2019.07.22.16.33.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 16:33:22 -0700 (PDT)
Date:   Mon, 22 Jul 2019 16:34:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, jikos@kernel.org, hdegoede@redhat.com,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: Add Lenovo Miix 630
Message-ID: <20190722233444.GA7352@tuxbook-pro>
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
 <20190621145450.38741-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621145450.38741-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri 21 Jun 07:54 PDT 2019, Jeffrey Hugo wrote:

> This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> functionality includes USB (host), microSD-card, keyboard, and trackpad.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Applied patch 3-5

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 240 ++++++++++++++++++
>  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 +++
>  3 files changed, 271 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 21d548f02d39..c3e4307bcbd4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> new file mode 100644
> index 000000000000..9682d4dd7496
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2019, Jeffrey Hugo. All rights reserved. */
> +
> +/*
> + * Common include for MSM8998 clamshell devices, ie the Lenovo Miix 630,
> + * Asus NovaGo TP370QL, and HP Envy x2.  All three devices are basically the
> + * same, with differences in peripherals.
> + */
> +
> +#include "msm8998.dtsi"
> +#include "pm8998.dtsi"
> +#include "pm8005.dtsi"
> +
> +/ {
> +	chosen {
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&qusb2phy {
> +	status = "okay";
> +
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> +};
> +
> +&rpm_requests {
> +	pm8998-regulators {
> +		compatible = "qcom,rpm-pm8998-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_s2-supply = <&vph_pwr>;
> +		vdd_s3-supply = <&vph_pwr>;
> +		vdd_s4-supply = <&vph_pwr>;
> +		vdd_s5-supply = <&vph_pwr>;
> +		vdd_s6-supply = <&vph_pwr>;
> +		vdd_s7-supply = <&vph_pwr>;
> +		vdd_s8-supply = <&vph_pwr>;
> +		vdd_s9-supply = <&vph_pwr>;
> +		vdd_s10-supply = <&vph_pwr>;
> +		vdd_s11-supply = <&vph_pwr>;
> +		vdd_s12-supply = <&vph_pwr>;
> +		vdd_s13-supply = <&vph_pwr>;
> +		vdd_l1_l27-supply = <&vreg_s7a_1p025>;
> +		vdd_l2_l8_l17-supply = <&vreg_s3a_1p35>;
> +		vdd_l3_l11-supply = <&vreg_s7a_1p025>;
> +		vdd_l4_l5-supply = <&vreg_s7a_1p025>;
> +		vdd_l6-supply = <&vreg_s5a_2p04>;
> +		vdd_l7_l12_l14_l15-supply = <&vreg_s5a_2p04>;
> +		vdd_l9-supply = <&vph_pwr>;
> +		vdd_l10_l23_l25-supply = <&vph_pwr>;
> +		vdd_l13_l19_l21-supply = <&vph_pwr>;
> +		vdd_l16_l28-supply = <&vph_pwr>;
> +		vdd_l18_l22-supply = <&vph_pwr>;
> +		vdd_l20_l24-supply = <&vph_pwr>;
> +		vdd_l26-supply = <&vreg_s3a_1p35>;
> +		vdd_lvs1_lvs2-supply = <&vreg_s4a_1p8>;
> +
> +		vreg_s3a_1p35: s3 {
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +		};
> +		vreg_s4a_1p8: s4 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-allow-set-load;
> +		};
> +		vreg_s5a_2p04: s5 {
> +			regulator-min-microvolt = <1904000>;
> +			regulator-max-microvolt = <2040000>;
> +		};
> +		vreg_s7a_1p025: s7 {
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <1028000>;
> +		};
> +		vreg_l1a_0p875: l1 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-allow-set-load;
> +		};
> +		vreg_l2a_1p2: l2 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-allow-set-load;
> +		};
> +		vreg_l3a_1p0: l3 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +		vreg_l5a_0p8: l5 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +		};
> +		vreg_l6a_1p8: l6 {
> +			regulator-min-microvolt = <1808000>;
> +			regulator-max-microvolt = <1808000>;
> +		};
> +		vreg_l7a_1p8: l7 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +		vreg_l8a_1p2: l8 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +		vreg_l9a_1p8: l9 {
> +			regulator-min-microvolt = <1808000>;
> +			regulator-max-microvolt = <2960000>;
> +		};
> +		vreg_l10a_1p8: l10 {
> +			regulator-min-microvolt = <1808000>;
> +			regulator-max-microvolt = <2960000>;
> +		};
> +		vreg_l11a_1p0: l11 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +		vreg_l12a_1p8: l12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +		vreg_l13a_2p95: l13 {
> +			regulator-min-microvolt = <1808000>;
> +			regulator-max-microvolt = <2960000>;
> +		};
> +		vreg_l14a_1p88: l14 {
> +			regulator-min-microvolt = <1880000>;
> +			regulator-max-microvolt = <1880000>;
> +		};
> +		vreg_15a_1p8: l15 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +		vreg_l16a_2p7: l16 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2704000>;
> +		};
> +		vreg_l17a_1p3: l17 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1304000>;
> +		};
> +		vreg_l18a_2p7: l18 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2704000>;
> +		};
> +		vreg_l19a_3p0: l19 {
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
> +		};
> +		vreg_l20a_2p95: l20 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-allow-set-load;
> +		};
> +		vreg_l21a_2p95: l21 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-allow-set-load;
> +			regulator-system-load = <800000>;
> +		};
> +		vreg_l22a_2p85: l22 {
> +			regulator-min-microvolt = <2864000>;
> +			regulator-max-microvolt = <2864000>;
> +		};
> +		vreg_l23a_3p3: l23 {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3312000>;
> +		};
> +		vreg_l24a_3p075: l24 {
> +			regulator-min-microvolt = <3088000>;
> +			regulator-max-microvolt = <3088000>;
> +		};
> +		vreg_l25a_3p3: l25 {
> +			regulator-min-microvolt = <3104000>;
> +			regulator-max-microvolt = <3312000>;
> +		};
> +		vreg_l26a_1p2: l26 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +		vreg_l28_3p0: l28 {
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
> +		};
> +
> +		vreg_lvs1a_1p8: lvs1 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		vreg_lvs2a_1p8: lvs2 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +	};
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;
> +
> +	touchpad: touchpad {
> +		config {
> +			pins = "gpio123";
> +			bias-pull-up;           /* pull up */
> +		};
> +	};
> +};
> +
> +&sdhc2 {
> +	status = "okay";
> +
> +	vmmc-supply = <&vreg_l21a_2p95>;
> +	vqmmc-supply = <&vreg_l13a_2p95>;
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_clk_on  &sdc2_cmd_on  &sdc2_data_on  &sdc2_cd_on>;
> +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
> +};
> +
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode = "host"; /* Force to host until we have Type-C hooked up */
> +};
> +
> +&usb3phy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l2a_1p2>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> new file mode 100644
> index 000000000000..407c6a32911c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2019, Jeffrey Hugo. All rights reserved. */
> +
> +/dts-v1/;
> +
> +#include "msm8998-clamshell.dtsi"
> +
> +/ {
> +	model = "Lenovo Miix 630";
> +	compatible = "lenovo,miix-630", "qcom,msm8998";
> +};
> +
> +&blsp1_i2c6 {
> +	status = "okay";
> +
> +	keyboard@3a {
> +		compatible = "hid-over-i2c";
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <0x79 IRQ_TYPE_LEVEL_LOW>;
> +		reg = <0x3a>;
> +		hid-descr-addr = <0x0001>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touchpad>;
> +	};
> +};
> +
> +&sdhc2 {
> +	cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
> +};
> -- 
> 2.17.1
> 

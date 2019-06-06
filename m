Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3362736BDE
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 07:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbfFFFuk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 01:50:40 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42803 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfFFFuk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 01:50:40 -0400
Received: by mail-wr1-f67.google.com with SMTP id x17so976989wrl.9
        for <linux-input@vger.kernel.org>; Wed, 05 Jun 2019 22:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SFwgRrUX5NbIwGMJJbQos1+XcNe9OUMpKOxNNI4/5J0=;
        b=pMnRmFeFFIopuOEfrE10MPiMZ8aHUEtrCOHgU8lTHnS7yDq3AZxpQg5fitXwHvP3zn
         AsNRb5RLDd6oUjQ3hh8UDlQTyDgPC4zXGAKFUAbcHpO+x44v25TMA8aAqOlb41kCGPDk
         C08br0sjksuGmqIdkG4AL/ZYJyjaVbpRgw+wbnZ8FwLK4eoOp3GyE5sKJDDsYbn8pBqq
         UbEO4uF78bQzGA8kwjmpH5yWahLZPJhoxHq6uSu1GBRZ1yCud86HKLrNsTOGZplUB2t7
         NU+aQBo1aQun7moVR1MVoyt9cdRpH2Y4cX2OF1NQe72jLUlBGTYIW24ICRTUHUiBwySP
         wI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SFwgRrUX5NbIwGMJJbQos1+XcNe9OUMpKOxNNI4/5J0=;
        b=CIfRQolyIdnJ1Y4qMOI0e6o+RWFuPPWNHEOIWaKhf3rgPLtpswIPVXu4oJBXe4meoa
         FG8Fof4G6ScTIFC/0YWXChuczYDy3Ih/xBE5QqLQYa+T9jOTU0+5MVPCmpp/h8g6pb9p
         pap671qO6wJSwT2abklNhWtuqhwktSd4Y0fONhdisQ/Eese0i5hzhmigU1yd7aHjxBu+
         N4P6ALC+lR2QjIFqlbgHAyoVXpQXWR0HXNocmgrNymhQLTtHO4a7mzGfj7INuhMrkKGs
         GylOQ5k9CqHNErnLTYxlBwYfVejPUEWn/2b2so+zgadHiHyJgL839xqv2xSmlrE9vJD7
         GVuQ==
X-Gm-Message-State: APjAAAVjRrT8l6Di+hDzxwg3y/sWn5Oc81FqkBM7lKNMeyLX57f6AWhM
        ax7X+dEQIzUnpB7okmnYgdQmZw==
X-Google-Smtp-Source: APXvYqwNF17eo3yv5ofakq7tLcRsxVwPVUUdGQAlGsl2W3AaoRBN74ym9DI/0/GcntCv3KU74osEWQ==
X-Received: by 2002:adf:e30d:: with SMTP id b13mr10144964wrj.246.1559800237721;
        Wed, 05 Jun 2019 22:50:37 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id l7sm637729wmh.20.2019.06.05.22.50.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 22:50:36 -0700 (PDT)
Date:   Thu, 6 Jun 2019 06:50:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org, david.brown@linaro.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Lenovo Miix 630
Message-ID: <20190606055034.GA4797@dell>
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160616.10017-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190423160616.10017-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 23 Apr 2019, Jeffrey Hugo wrote:

> This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> functionality includes USB (host), microSD-card, keyboard, and trackpad.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 278 ++++++++++++++++++
>  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 ++

What's happening with this patch?

It's been on the list a while now.  I'm waiting for it to be accepted,
since there are patches I wish to submit which are based on it.

Who is responsible for merging these?

>  3 files changed, 309 insertions(+)
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
> index 000000000000..1a341d4b1597
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> @@ -0,0 +1,278 @@
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
> +	thermal-zones {
> +		battery-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens0 0>;
> +
> +			trips {
> +				battery_crit: trip0 {
> +					temperature = <60000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		skin-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens1 5>;
> +
> +			trips {
> +				skin_alert: trip0 {
> +					temperature = <44000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				skip_crit: trip1 {
> +					temperature = <70000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
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

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

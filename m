Return-Path: <linux-input+bounces-8311-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A72ED9DBE6E
	for <lists+linux-input@lfdr.de>; Fri, 29 Nov 2024 02:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16ED6B20934
	for <lists+linux-input@lfdr.de>; Fri, 29 Nov 2024 01:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F0D1C2BD;
	Fri, 29 Nov 2024 01:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcwTFCEn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75328EC;
	Fri, 29 Nov 2024 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732844965; cv=none; b=BhYnEq8iGlE56TNrvUhsWmyJFCMZ+p49vsyP7kfnJbR02keAYJ8OFeX/Y4MYuPpUKvPjclr36Nt/X5MTCVGtoLJ/qZtMDHxY7mqWhMh4gygCofmgGI3+LxviZjrSf9iJGYRcVrF5xxqlxQR6Cs22FrtnMYCpQIChuzovOP4fMZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732844965; c=relaxed/simple;
	bh=sVCgEPfM3wgBZXhlAFVEjgiN1nv50L0Ltv2qTNzUFEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxS5REqiJfY+Kpad8HB7oJ5mYF6gfJp0EJU1zAOLReFQMk0oX04bQLrdi/U8v6AIbHFTfh27xgIc/ZTrrsN9l3HHR1Qy4agUh4lOxWOh/VlOAyOwgmUT/BrwWMcbZe63Wiw3VAGUuhEGgieqZ1uQGEw4I5NUmTVavU6J3OL8h04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcwTFCEn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21527bb7eb0so7704115ad.3;
        Thu, 28 Nov 2024 17:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732844963; x=1733449763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/u24g02F6G5dTmIgwmZ5N8zkALsWjGyEgUS5fL1byY=;
        b=jcwTFCEnEiy1t2cN3NzUJtmBwmIOWI+2MVr7QN5uJa+eGf7oZW0MN0mEtbgcLUyvp7
         vfy/m9Q45RGqdib0vXEMP68rIcOh4qnykSD6tE9MQxmCF8h06FsHLfrNcs1ID4/KW8fg
         9GMDYZ1Lu9DFKdoy6oCJ3v8YEGr3TckSOTDL85KZcalXqyy/lINF0gPjOzGKVuxmDBPR
         kbiHDFFmavNTyH6L0j+jQNXml8WrcCALz0LvLokK7kCqy9hfs+hXzocUNOmILQVdFMKR
         Lmuc7bgK4+F4WExfy9SQzVyy40kZCujizSJc1rYfkd/HxQbP1Rlthw/6E7EXdn/bgHO4
         SISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732844963; x=1733449763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/u24g02F6G5dTmIgwmZ5N8zkALsWjGyEgUS5fL1byY=;
        b=KX4J8HrKkTEBH243x4F0zGnQ5xNvJUlqQCMlRJMSmkCBZzKpEzIPM97mUIn2Zpx38z
         tHsZJx+WG84SA5T7XQdBS8+0tAV0xHcAFc91XQlelNDMFOskicnAKacOPnb9nERdXznS
         RP3MSM2dj6E3LYwNhrLf5v57mAjo3crkgQTuYzpaAGq1QqqR6qESJ4xlxpEtfIuXN3X5
         LI3FEWR9JUrLwFNBT6oIf8ZKFgUHzMnBMryvT8XCmA1LcO/5xSwQXyDxLTh10/kscmMj
         F+aW3KX/YsHUCMaIBwG6f/nn6Bf4bKf3lnkjnz/xyp6rkp28Y1XMnWw3amF49GTiKhOt
         ArLg==
X-Forwarded-Encrypted: i=1; AJvYcCU1DyvFV8vY1Y7wbrl6sZOgk2d+wkje75MJWDRKPucw2nO892vbhFScTPwwgBRWt2p11Kw3Rdm+N2t2Rdg=@vger.kernel.org, AJvYcCWyO0OKuB/HnIh2i4+jniqzcctwbMIxC3xoxuc3FCr1cOShgEf7aenSSv8+2ey5x44gsY8zIg4pZwkS@vger.kernel.org, AJvYcCX3xgvIRVyLCkyK7CeoxpTTQUQfPzua/bwC7WUWZsKlL4U2MrvxrOwQcNjLbYztXmBWQKwQr10+V+aLpuQw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxel9bdguVPg2QCpmBmI2LWgr6wll1flBKZiFOkyLvvxyJdhDnx
	hVQ5dOXCoFR8l/SosKRAPOuY+p3SPDsS+ysH/DP/DEry4RurXgtr
X-Gm-Gg: ASbGncuoY4vXJh0opB9cgY3Kd1HG9FHhE6W4bhj3TJVRcQiNQc8upCErE0Q1cQW+3sv
	KEqcNqpLtngGBKX+lQWL2o5DfvP9hcWA2HtOm6DBp487ToAtTQZP9mJ+/ZP56kO8sMZ3iEEaZkE
	Fj3AZrE65S3kv4ID2kHt45CIwFRmJfOgH8rNrTMv6lErAvyarpy4T8IjqYIQVLgZbq6duP/hmpF
	FX6HLH4Q3F7o+Rfj2Aqp2lDDtW//zll9mf/s+QlFW/JGgQLljNNUk8iUrGoIvw0o7LmkmDkR7vu
	+idkIw==
X-Google-Smtp-Source: AGHT+IFQufo5tXhmuP+UR71oQD+2OKaTxHqCGIGskq9pBU0kiHfjclL2HjYuWZdWPQ/dhvl4j1PGMw==
X-Received: by 2002:a17:902:ccca:b0:211:eb2d:e4a1 with SMTP id d9443c01a7336-2150128c1cbmr109485425ad.13.1732844962592;
        Thu, 28 Nov 2024 17:49:22 -0800 (PST)
Received: from [10.89.69.211] (wf122-211.ust.hk. [175.159.122.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fba8esm2279190b3a.97.2024.11.28.17.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 17:49:22 -0800 (PST)
Message-ID: <0cfedbf1-76c8-477a-9523-1462cf30989c@gmail.com>
Date: Fri, 29 Nov 2024 09:49:15 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: apple: Add touchbar digitizer nodes
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-3-76cc59bbf117@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241128-z2-v2-3-76cc59bbf117@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Sasha Finkelstein via B4 Relay 於 2024/11/29 早上6:29 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar digitizer
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 26 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 14 ++++++++++++++
>  4 files changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index 56b0c67bfcda321b60c621de092643017693ff91..c31eb3f6f54268cafc9197a9244a5954fbb42802 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -17,6 +17,14 @@ / {
>  	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
>  	model = "Apple MacBook Pro (13-inch, M1, 2020)";
>  
> +	/*
> +	 * All of those are used by the bootloader to pass calibration
> +	 * blobs and other device-specific properties
> +	 */
> +	aliases {
> +		touchbar0 = &touchbar0;
> +	};
> +
>  	led-controller {
>  		compatible = "pwm-leds";
>  		led-0 {
> @@ -49,3 +57,21 @@ &i2c4 {
>  &fpwm1 {
>  	status = "okay";
>  };
> +
> +&spi0 {
> +	status = "okay";
> +
> +	touchbar0: touchbar@0 {
> +		compatible = "apple,j293-touchbar";
> +		reg = <0>;
> +		spi-max-frequency = <11500000>;
> +		spi-cs-setup-delay-ns = <2000>;
> +		spi-cs-hold-delay-ns = <2000>;
> +		reset-gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
> +		interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
> +		firmware-name = "apple/dfrmtfw-j293.bin";
> +		touchscreen-size-x = <23045>;
> +		touchscreen-size-y = <640>;
> +		touchscreen-inverted-y;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b83341a799d9a37578e5461e6b184f81ee7435c 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -326,6 +326,13 @@ clkref: clock-ref {
>  		clock-output-names = "clkref";
>  	};
>  
> +	clk_200m: clock-200m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "clk_200m";
> +	};
> +
>  	/*
>  	 * This is a fabulated representation of the input clock
>  	 * to NCO since we don't know the true clock tree.
> @@ -441,6 +448,19 @@ fpwm1: pwm@235044000 {
>  			status = "disabled";
>  		};
>  
> +		spi0: spi@235100000 {
> +			compatible = "apple,t8103-spi", "apple,spi";
> +			reg = <0x2 0x35100000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
> +			cs-gpios = <&pinctrl_ap 109 GPIO_ACTIVE_LOW>;
> +			clocks = <&clk_200m>;
> +			power-domains = <&ps_spi0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled"; /* only used in J293 */
> +		};
> +
>  		serial0: serial@235200000 {
>  			compatible = "apple,s5l-uart";
>  			reg = <0x2 0x35200000 0x0 0x1000>;
> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
> index 0ad908349f55406783942735a2e9dad54cda00ec..3332cc87cdf1a418c4c2247639baf5d2a42ed3c2 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -17,8 +17,13 @@ / {
>  	compatible = "apple,j493", "apple,t8112", "apple,arm-platform";
>  	model = "Apple MacBook Pro (13-inch, M2, 2022)";
>  
> +	/*
> +	 * All of those are used by the bootloader to pass calibration
> +	 * blobs and other device-specific properties
> +	 */
>  	aliases {
>  		bluetooth0 = &bluetooth0;
> +		touchbar0 = &touchbar0;
>  		wifi0 = &wifi0;
>  	};
>  
> @@ -67,3 +72,22 @@ &i2c4 {
>  &fpwm1 {
>  	status = "okay";
>  };
> +
> +&spi3 {
> +	status = "okay";
> +
> +	touchbar0: touchbar@0 {
> +		compatible = "apple,j493-touchbar";
> +		reg = <0>;
> +		spi-max-frequency = <8000000>;
> +		spi-cs-setup-delay-ns = <2000>;
> +		spi-cs-hold-delay-ns = <2000>;
> +

Remove the empty line
> +		reset-gpios = <&pinctrl_ap 170 GPIO_ACTIVE_LOW>;
> +		interrupts-extended = <&pinctrl_ap 174 IRQ_TYPE_EDGE_FALLING>;
> +		firmware-name = "apple/dfrmtfw-j493.bin";
> +		touchscreen-size-x = <23045>;
> +		touchscreen-size-y = <640>;
> +		touchscreen-inverted-y;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..977c1ca5e8c1b566bb3876b6619ea8812b98e072 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -467,6 +467,20 @@ fpwm1: pwm@235044000 {
>  			status = "disabled";
>  		};
>  
> +		spi3: spi@23510c000 {
> +			compatible = "apple,t8112-spi", "apple,spi";
> +			reg = <0x2 0x3510c000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clkref>;
> +			pinctrl-0 = <&spi3_pins>;
> +			pinctrl-names = "default";
> +			power-domains = <&ps_spi3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";

/* only used in J493 */ ?
> +		};
> +
>  		serial0: serial@235200000 {
>  			compatible = "apple,s5l-uart";
>  			reg = <0x2 0x35200000 0x0 0x1000>;
> 

Nick Chan


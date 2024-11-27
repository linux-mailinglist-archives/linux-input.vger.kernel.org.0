Return-Path: <linux-input+bounces-8267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A68209DA438
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 09:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D3EA281259
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 08:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE00218CBFE;
	Wed, 27 Nov 2024 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1FsZvHl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA6154BEA;
	Wed, 27 Nov 2024 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732697716; cv=none; b=nEVUUN/w0W7oRDQE1AbFHsk11Ptg+y1YEGNbBzORF+Hg8sv46jalp+llpSekjGq3S9RRMaWXoCktUvhUZljfUgwIVbEdOLg/2UBQ9ETq/9urb3RV/1d9Fi+6xfXvyqW4tNW/Z0/cwmpmlQqMIoGV8lFOhDLCXxepLzpn9vQcyxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732697716; c=relaxed/simple;
	bh=i4AuCjrpC7ozTSV7MK46pbslSmhdwEW8noa2ezdxNbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQ2b1igq5yFt68Ec6nij5mQDL+t5Kg29qGOgt3iO6jAl12u0bKP1ndE0M8kFtD6BwgLBW2jUWh6cBTbcE/bi17HLjCut+gV2U21DOARCg9VVLvN3SsbX93bcp9IREurX5Q2sZWPoXc4xPVQISB0npfSfGQkc2KprZq/d7KgZaPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1FsZvHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59667C4CECC;
	Wed, 27 Nov 2024 08:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732697716;
	bh=i4AuCjrpC7ozTSV7MK46pbslSmhdwEW8noa2ezdxNbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1FsZvHlJvF7fecVkjU4Co2fa/e9SN7YgwQSOzPRyQyQS5X0ICEJVFL1XtgIM/v9i
	 6ndIZLyEmQeVPrJA3Se/v8bQqeIqdnszAoma67KFER2wOj0X5PBbPw5r3/cmoK8ZvG
	 76bL5DwNfpTrVxdX5pTPVF6f8e9vtDvBb7gt8fuDR6YMdiUcChVp3ERHbiKC82ES1s
	 SoYBB69wSUUagsgXHiJV3FK+/45poJo5N/9QwMzoxoFcMfume0x8g2FUWqRxvhB2rI
	 mTSFrj6qZNjNcPLCa7Z0+xQV7p0ujcFW5Cxh9b2hchcWQ7R7HhJwK2tmqEPUWYoYNP
	 95E+ouwSXfoMQ==
Date: Wed, 27 Nov 2024 09:55:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Message-ID: <y5xdrrb6ome4vggfadmnbtegigxlvwrxpqmwh7qhl2c7faesti@57odqxajdiwv>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-3-c43c4cc6200d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-3-c43c4cc6200d@gmail.com>

On Tue, Nov 26, 2024 at 09:48:01PM +0100, Sasha Finkelstein wrote:
> Adds device tree entries for the touchbar digitizer
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 14 ++++++++++++++
>  4 files changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index 56b0c67bfcda321b60c621de092643017693ff91..a1c4e5731f2147121a9845bc9f34d224025fb145 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -28,6 +28,10 @@ led-0 {
>  			default-state = "keep";
>  		};
>  	};
> +
> +	aliases {

Do not add nodes to the end, but in appropriate place. Either ordered by
name, as DTS coding style asks, or in logical place matching existing
convention (convention: aliases are always the first node).

> +		touchbar0 = &touchbar0;

Not used, drop.

> +	};
>  };
>  
>  &bluetooth0 {
> @@ -38,6 +42,26 @@ &wifi0 {
>  	brcm,board-type = "apple,honshu";
>  };
>  
> +&spi0 {

Also unusual placement - between 'w' and 'i'... unless you keep here
the second style of sorting (matching DTSI)?

> +	status = "okay";
> +
> +	touchbar0: touchbar@0 {
> +		compatible = "apple,j293-touchbar",
> +			"apple,z2-touchbar", "apple,z2-multitouch";
> +		reg = <0>;
> +		spi-max-frequency = <11500000>;
> +		spi-cs-setup-delay-ns = <2000>;
> +		spi-cs-hold-delay-ns = <2000>;
> +		reset-gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
> +		cs-gpios = <&pinctrl_ap 109 0>;

Use proper GPIO flag define.

> +		interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
> +		firmware-name = "apple/dfrmtfw-j293.bin";
> +		touchscreen-size-x = <23045>;
> +		touchscreen-size-y = <640>;
> +		label = "MacBookPro17,1 Touch Bar";
> +	};
> +};
> +
>  &i2c2 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..dc72aae3844bf33579f623f0b01abc7de4033af4 100644
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
> @@ -441,6 +448,18 @@ fpwm1: pwm@235044000 {
>  			status = "disabled";
>  		};
>  
> +		spi0: spi@235100000 {
> +			compatible = "apple,t8103-spi", "apple,spi";
> +			reg = <0x2 0x35100000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
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
> index 0ad908349f55406783942735a2e9dad54cda00ec..03fb711b3a1fa767ba70807a6d3404e4d52eb783 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -20,6 +20,7 @@ / {
>  	aliases {
>  		bluetooth0 = &bluetooth0;
>  		wifi0 = &wifi0;
> +		touchbar0 = &touchbar0;

Do not add to the end of lists/properties/nodes etc, but keep order,
usually alphabetical.  This avoids conflicts or allows conflicting
series to be still merged.  That's a general rule for most of
development (Makefiles, DTS, Kconfigs, lists in DT bindings).

Best regards,
Krzysztof



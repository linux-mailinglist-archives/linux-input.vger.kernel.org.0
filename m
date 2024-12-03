Return-Path: <linux-input+bounces-8362-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944679E1541
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 09:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB6C284C3D
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 08:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5151D7989;
	Tue,  3 Dec 2024 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="fuhSYsQO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nTMLuboH"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009081CDFCB;
	Tue,  3 Dec 2024 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213072; cv=none; b=JU/TDRp95OArvOyfpVDXcCIQ/RZOacqis5zhDAu19u7UzQBWf6gioemw/blDJUT0JNtuMc7XEVrX8adnmx24/UMNxIZeehvfHTlopLME+vurRMgR0MXlSWs8YoKxVjw8ZmFD8ZF1WeKdhGbeqqCgDt9tV+Bf2LNjzyswJ9I21vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213072; c=relaxed/simple;
	bh=yDYD+yl0+WDeQPBYxaJGQ1tkSEz3OvhJNj3f9jq0pz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4FWzxO8EyA2JdsDLyfOURMgfXApdw+1T776sPTLUPRcVWB80MxzT1phclUWXdREaW4O9aF3mhS5nddR4tJCrrB3o79JTi8OR4dt9gdBrm6mc9wXLUTk+8rfsPqoAizg3HkXRCS9DnLKOdo16JmR0p3lgxczX3oOurQdP5yaZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=fuhSYsQO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nTMLuboH; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id D4537114008E;
	Tue,  3 Dec 2024 03:04:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 03 Dec 2024 03:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1733213069; x=1733299469; bh=ZWVU5IWmat
	tSZ28Z0DFPKDl8mHNr4ydvW+wphgIGkSg=; b=fuhSYsQOU0mGUHobNWEfacorSV
	G+ONaLSX9pvznk3aaLBMAOEMGLgEORy1NYCvK9/nCxv7KEKokENGK7BIzaiEbX+/
	KOowx6GpiA1m+RfK6wbmyKo0kvpHgguq2TiQRBAg5CKYSjdAzu6wXf2aQ7+SnssD
	4bYwZFZ80xZzEwEo6JEYsNrnIg7lWZoem+qxdsGv3xVuhkna7IPtlVFlLP5xTYyq
	bJEs0p/2ScFE24mZB1tcXvDof2AM5LniywB41bHMWDPseDNj5s85pSfmJA3qVbIN
	w80m7RUHzCFXrFwg6x2BYeesHWcq7T1vxptgmFNT4Vy6tz0Ve2jPFOdVw5SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733213069; x=1733299469; bh=ZWVU5IWmattSZ28Z0DFPKDl8mHNr4ydvW+w
	phgIGkSg=; b=nTMLuboHE0haQpl0c89usXC90jBGyKAZToeaQY99fJyjKxkNT38
	17YINjtMpCbYcn1WEL6m17Gb3j+A74HsSDh0TeFQOE45Y9OVDSCzQwNHtLh8Es69
	VyAr5Xxe7HO4PH7r/f39VAHkhtxY3LWIKGYe/Fgf1OKbPzMbVyeHnbJ7K0W3vDET
	9Caw17vpD8DSCbmCBfIfWXZ3WFv36+XMsSYz4V5JyZMCZ0Bxawe8xfaNgmSt5zxr
	7E82Gdy3itb6SKzHitpZzvpCwho63lkYZboX1AzR2f8zMHiwU5Ilc1FQepQR7QkB
	ptDscAYIpHeMo97WKQ37SDI0E8sL2ZNLzWA==
X-ME-Sender: <xms:jLtOZxvGiMYUrXGYlEpbo7PVspkZrcE3ZoVjuG6VBfm6J2t1kgtPyA>
    <xme:jLtOZ6e3Er0LA_aaA73eYGDijO_NuzSiaOl9U5jJTax-OtU8bT9Hs8qpgkzETHFQz
    7FZqjMQG3R35z1RnW4>
X-ME-Received: <xmr:jLtOZ0yUTGltTN7L69IgFv_22vS9bMAN4ivKFvSRV-icuDtj1yuhEbSrV56YiiFPneh365ltFBMQCxfzYp9u4XkWUgyRV7DSou4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddriedugdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecu
    hfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecugg
    ftrfgrthhtvghrnhepgfduueffleefkeegueektdehkeejtedtffdtudejhfdvheetgfei
    gfeltdeufeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdp
    nhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfnh
    hklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtrghnsehm
    rghrtggrnhdrshhtpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpd
    hrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtohep
    ughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehroh
    gshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehrhigusggvrhhgsegsihhtmhgrthhhrdhorhhg
X-ME-Proxy: <xmx:jLtOZ4PYyoXOF_WHCXiBQY16ljwNzyFGD6Gylb8DVA-7JiG8_LSO4A>
    <xmx:jLtOZx-m66TPqIuiljjMhnYojaLzyukjVGitZ2wbpazkCH8Wi4Lszg>
    <xmx:jLtOZ4UxEHcli7CfPxNpk0Khduvh2ghK8UyZrZCjflZyFpDMkEQQIA>
    <xmx:jLtOZyclnK1uoHFpkR23E_aK23U9sTQd6qbioIpqn_yvqu35loywfg>
    <xmx:jbtOZ1U3FWeeR2Fy_ac13jXc-ROY-APNVl7rAMkBH82sWiTWbhfwc-3K>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Dec 2024 03:04:27 -0500 (EST)
Date: Tue, 3 Dec 2024 09:04:25 +0100
From: Janne Grunau <j@jannau.net>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Message-ID: <20241203080425.GA1282717@robin.jannau.net>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-3-76cc59bbf117@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128-z2-v2-3-76cc59bbf117@gmail.com>

On Thu, Nov 28, 2024 at 11:29:18PM +0100, Sasha Finkelstein via B4 Relay wrote:
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

Since this appears to be a regular GPIO pin I think it should go into
the spi0 override in t8103-j293.dts. Kind of academic since that's the
only device using spi0. It will however allow to easily rebase this on
top of "Add Apple SPI controller and spi-nor dt nodes:
https://lore.kernel.org/asahi/20241203-asahi-spi-dt-v2-0-cd68bfaf0c84@jannau.net/T/#u

Janne


Return-Path: <linux-input+bounces-4625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA43917732
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 06:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CF6C1F234E5
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 04:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9ED45978;
	Wed, 26 Jun 2024 04:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7gTc0Sd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAE528E8;
	Wed, 26 Jun 2024 04:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719375399; cv=none; b=JAgmIEExA4k56WiAvFKTfIvxZMN8GMEKsyIt/ma06j01OIqSzC6YM83UaQbSkh8xMtFald64McKJApIVOQOmSo5ffk/ldeUNWaKQ5qqzdON90dL5629/Vr4PSkCs1ocbJ45zk2lCqBZ/hGivL2lFeHiJQFgu5ZWFjxGD+zZq2p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719375399; c=relaxed/simple;
	bh=0hebWygg9tsCmkyf+fkAl70fxWVWa3kYkNFZjge3O1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4SLpDAbE1j76q5/nlvmRnrdPo/QX343zcJJ1OWWQ3SR4DTn3lLNgfncwOlbPahZ1bjwOSUWqYv0iNn0s8xG+fY79j5naerPu0YrOx6vap1CvOixnVeZv1iRFUfDpteepfbPe8LBrkgTT2o61QlGWu/k3cwtATNVQTNagCT/Qqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7gTc0Sd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A17C2BD10;
	Wed, 26 Jun 2024 04:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719375397;
	bh=0hebWygg9tsCmkyf+fkAl70fxWVWa3kYkNFZjge3O1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7gTc0SdkE4I6ZaW3/woROuS0mElIB7t99B9lGypdWhxVdNz/0DArnwJT0FSsYmvF
	 Mn91xBTmm26oXMBVVtdtulsgncZUb/B7QtBIn2X2LO/UKIT2m2EYi+bafJA5Z4ioIG
	 G7d+tKkVRqoLQE4FvVSCUbj+jySUa/93sJ9ikqWmmysjzgNNW5d85+DLjiiwRNWHuy
	 AQAfL9juhI674AVaDEYEtxW+Aw33TJYnb1+Wo7VceqqYzXd6ow+MotbWwNkM6m1M7T
	 As0Z8JnYyEpDyZYcjhY9rEK6J5Dlwe73R02VFGkkkYjdDS3uVaxo51r5OSStTdzJ0V
	 qLsoALVJMrc0w==
Date: Tue, 25 Jun 2024 23:16:34 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Frieder Hannenheim <frieder.hannenheim@proton.me>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: add OnePlus 8T (kebab)
Message-ID: <ckl554gpw74ot7x7ruce3ik2judbwg3ift2aiqr2wycgu6zhbh@jk5wp2so6pm7>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-7-388eecf2dff7@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-7-388eecf2dff7@postmarketos.org>

On Mon, Jun 24, 2024 at 03:30:31AM GMT, Caleb Connolly wrote:
> Initial support for USB, UFS, touchscreen, panel, wifi, and bluetooth.
> 

Nice.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
[..]
> +	vph_pwr: vph-pwr-regulator {

Please keep nodes sorted by address, then node name, then label (as
applicable). Perhaps making the -regulator suffix a regulator- prefix
instead (to keep them grouped).

> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +		regulator-always-on;
> +	};
> +
> +	vreg_s4a_1p8: vreg-s4a-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
[..]
> +&adsp {
> +	status = "okay";

Per Documentation/devicetree/bindings/dts-coding-style.rst please keep
"status" as last property in your nodes.

> +	firmware-name = "qcom/sm8250/OnePlus/adsp.mbn";
> +};
> +
[..]
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l9a_1p2>;
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +		vddio-supply = <&vreg_l14a_1p8>;
> +		vdd-supply = <&vreg_l11c_3p3>;
> +		avdd-supply = <&panel_avdd_5p5>;

How do you know that the panel will have these properties, when you
don't give it a compatible here? Not a strong objection, but perhaps
this should be pushed out?

> +		/* FIXME: There is a bug somewhere in the display stack and it isn't
> +		 * possible to get the panel to a working state after toggling reset.
> +		 * At best it just shows one or more vertical red lines. So for now
> +		 * let's skip the reset GPIO.
> +		 */
> +		// reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&panel_reset_pins &panel_vsync_pins &panel_vout_pins>;
> +		pinctrl-names = "default";
> +
> +		status = "disabled";
> +
> +		port {
> +			panel_in_0: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +
> +};
[..]
> +&pm8150_gpios {
> +	gpio-reserved-ranges = <2 1>, <4 1>, <8 1>;

How come?

> +};
> +
[..]
> +&tlmm {
> +	gpio-reserved-ranges = <28 4>, <40 4>;
> +
> +	bt_en_state: bt-default-state {
> +		pins = "gpio21";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-low;
> +		bias-pull-up;
> +	};
> +
> +	wlan_en_state: wlan-default-state {
> +		wlan-en-pins {

Perhaps flatten this?

> +			pins = "gpio20";
> +			function = "gpio";
> +
> +			drive-strength = <16>;
> +			output-low;
> +			bias-pull-up;
> +		};
> +	};
> +
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
[..]
> +&i2c13 {
[..]
> +};
> +
> +&display_panel {

'd' < 'i'

Regards,
Bjorn

> +	compatible = "samsung,amb655x";
> +	status = "okay";
> +};
> 
> -- 
> 2.45.0
> 


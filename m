Return-Path: <linux-input+bounces-16430-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE55C983E5
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 17:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B14024E01A6
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 16:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CA933468A;
	Mon,  1 Dec 2025 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="QNZJ9f0N"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2901288D2;
	Mon,  1 Dec 2025 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606602; cv=none; b=oPMyd3m1QGtFo7ERX1vG1IFbDObePDvNERlO8dSNGWbABIdFzAfJ9562Q1nZEiJRxOhkHE7Q7Vn4fACqZsVDFtWszHXtFJeAjIW2LMw8topcVvpJdGtUWCuHwm/6bvOSRwa9Ykw/ZYIm1VihHQcqDBl0Vd9fyuKXBbQO3auv4Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606602; c=relaxed/simple;
	bh=tkyO5p8LYYbNGz/+zu6mllYxkhDq9GTEjlu9HhYiUDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRTZ8ZQvXlE9CcFot5Vkr46Xt3E96IVZ/4Fz44dLpTrVBFik2P9iaBOVm8m19Tc4xNImPZ34vFfyh/sQ/f0jdL5T093JiPDBQEtW4jeEeTUugZ1fTQALI90SE7AYE/8AzrxuMhEv141CQPt8dV7iUJZeLgjH3VNV/OPrpALWdPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=QNZJ9f0N; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 2A8061C00AB; Mon,  1 Dec 2025 17:29:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764606591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ys4fM5oxuac5BA8yXwPfUxu5XSYHVpba6xxZaqliwMw=;
	b=QNZJ9f0NVkMN90sS7G6UbXXOErLvhTIW9qzPwO8ba1XpK64RGNMdA4zIDxxP7GCydNAumH
	FKEj2dlLZhZJ2ewUXnP/wNGs7cXtycpaTYJi2781Ib4aYVsd6Vs1IqFEKV6AyxJ0sXRhIs
	DDJTsV7FSPh7vM/rXrhueYudwFV8Dks=
Date: Mon, 1 Dec 2025 17:29:50 +0100
From: Pavel Machek <pavel@ucw.cz>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
	Gergo Koteles <soyer@irl.hu>, Casey Connolly <casey@connolly.tech>
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: sdm845-oneplus: Add alert-slider
Message-ID: <aS3Cfmx3gVyl/wTr@duo.ucw.cz>
References: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
 <20251113-op6-tri-state-v8-2-54073f3874bc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FtYVekWiQ6/kXxDO"
Content-Disposition: inline
In-Reply-To: <20251113-op6-tri-state-v8-2-54073f3874bc@ixit.cz>


--FtYVekWiQ6/kXxDO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Gergo Koteles <soyer@irl.hu>
>=20
> The alert-slider is a tri-state sound profile switch found on the
> OnePlus 6, Android maps the states to "silent", "vibrate" and "ring".
> Expose them as ABS_SND_PROFILE events.
> The previous GPIO numbers were wrong. Update them to the correct ones.
>=20
> Co-developed-by: Casey Connolly <casey@connolly.tech>
> Signed-off-by: Casey Connolly <casey@connolly.tech>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Tested-by: Guido G=FCnther <agx@sigxcpu.org> # oneplus,fajita & oneplus,e=
nchilada
> Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

Best regards,
     							Pavel=09

> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -25,6 +25,41 @@ / {
>  	chassis-type =3D "handset";
>  	qcom,msm-id =3D <QCOM_ID_SDM845 0x20001>;
> =20
> +	alert-slider {
> +		compatible =3D "gpio-keys";
> +		label =3D "Alert slider";
> +
> +		pinctrl-0 =3D <&alert_slider_default>;
> +		pinctrl-names =3D "default";
> +
> +		switch-top {
> +			label =3D "Silent";
> +			linux,input-type =3D <EV_ABS>;
> +			linux,code =3D <ABS_SND_PROFILE>;
> +			linux,input-value =3D <SND_PROFILE_SILENT>;
> +			gpios =3D <&tlmm 126 GPIO_ACTIVE_LOW>;
> +			linux,can-disable;
> +		};
> +
> +		switch-middle {
> +			label =3D "Vibrate";
> +			linux,input-type =3D <EV_ABS>;
> +			linux,code =3D <ABS_SND_PROFILE>;
> +			linux,input-value =3D <SND_PROFILE_VIBRATE>;
> +			gpios =3D <&tlmm 52 GPIO_ACTIVE_LOW>;
> +			linux,can-disable;
> +		};
> +
> +		switch-bottom {
> +			label =3D "Ring";
> +			linux,input-type =3D <EV_ABS>;
> +			linux,code =3D <ABS_SND_PROFILE>;
> +			linux,input-value =3D <SND_PROFILE_RING>;
> +			gpios =3D <&tlmm 24 GPIO_ACTIVE_LOW>;
> +			linux,can-disable;
> +		};
> +	};
> +
>  	aliases {
>  		serial0 =3D &uart9;
>  		serial1 =3D &uart6;
>=20

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--FtYVekWiQ6/kXxDO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaS3CfgAKCRAw5/Bqldv6
8np0AJ4g37/E7yC1TFrIYjmX1lFqPyanagCfavl9NgqGe6YnRqOeqERMZWE2skE=
=M3u4
-----END PGP SIGNATURE-----

--FtYVekWiQ6/kXxDO--


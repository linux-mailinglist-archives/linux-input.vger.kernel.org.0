Return-Path: <linux-input+bounces-12072-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3074AA1089
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 17:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B625A198F
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 15:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBC521ADC4;
	Tue, 29 Apr 2025 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAeJQYpT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA5E21A43D;
	Tue, 29 Apr 2025 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940716; cv=none; b=i9O/9bxQxeD722yAdnljfs0x5h/Ymu0b1P0O6RKbuALFrRaqcBJdYfKjlsRxbKzW52pRwAK47MyHcEezVqq6AVFZqwJYiZW0DpPw12bORxtpvbzA0q16BHilDa4TlI0y+U1rtD+W8s/ZyUWDw0fRvJZHcwhLc3xmcUKu8k5f2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940716; c=relaxed/simple;
	bh=IJceQHsA6xTRZyfgNBSrAnK9DQ/MkTpj3aI3tErDl3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHvTPvKVR9vyUXuWnBYWl+H1ei1d/yzcTLbGK++WFCJ6AeBG9U0wJYu7oB09AQPKtRf1S3ikwkGYFkti2X6VQyOYZsKmJZE9k3XyV9fox8MJyjywLhKEzxUSsq4qaHcxNVfF3fVEP3Rt4rgstXZRXurvE4kiAaM81YxMv+S12Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAeJQYpT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43314C4CEE3;
	Tue, 29 Apr 2025 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745940715;
	bh=IJceQHsA6xTRZyfgNBSrAnK9DQ/MkTpj3aI3tErDl3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAeJQYpTndZDSSAWc68j3NqsTTOeQ525PCypz4BlaTnCmK0DFoMVvLZhsOtv3GPMB
	 RPYjX661wJ8Y1qujurGR2guRfOMNvw42PV+Mwr6BPclTtgRzWHhlUbh75i1JY/8RH0
	 Y+/KW4oceS6pVigAaYJJLHWc247Nn5emOJSpsNitfibdZ3GKqWNTvo5TggJBBo1c5j
	 y6h4lORns4KWKK89g35+ONumBj5raGlkwCyHeGTCr3BllqQRWjb46sQpbE9vgtCoF+
	 bgAcGPJ5z1GY3emoEIrVSWJCSxG2HWTekje4rGgsy+7AliTNke9/IvUONdW/Ya08Fu
	 MqplVqUD1S5rQ==
Date: Tue, 29 Apr 2025 16:31:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Esben Haabendal <esben@geanix.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
Message-ID: <20250429-effects-subscript-58eb41737816@spud>
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
 <20250429-goodix-no-reset-pull-up-v2-1-0687a4ad5a04@geanix.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WTOJJw+4zWH0HCQ2"
Content-Disposition: inline
In-Reply-To: <20250429-goodix-no-reset-pull-up-v2-1-0687a4ad5a04@geanix.com>


--WTOJJw+4zWH0HCQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:56:11AM +0200, Esben Haabendal wrote:
> This should be added for boards where there is no pull-up on the reset pi=
n,
> as the driver will otherwise switch the reset signal to high-impedance to
> save power, which obviously not safe without pull-up.
>=20
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.y=
aml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..21ac13046b6e021eeb403d854=
aabc945801dd29f 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> @@ -45,6 +45,10 @@ properties:
>    reset-gpios:
>      maxItems: 1
> =20
> +  goodix,no-reset-pull-up:
> +    type: boolean
> +    description: There is no pull-up on reset pin

I have to wonder, why are these system using the reset property if the
reset is not usable? Shouldn't the property be omitted?

> +
>    AVDD28-supply:
>      description: Analog power supply regulator on AVDD28 pin
> =20
>=20
> --=20
> 2.49.0
>=20

--WTOJJw+4zWH0HCQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBDw5wAKCRB4tDGHoIJi
0jfOAP9rWyHCAKzOu8+HRHfQl2Fd3V+shjm+zH/CfafuVGc37gD+Ia+k5GKQ2r4e
a6a/vzPb3KoWOhwjAyJjbE9AGP6wmAI=
=hL4J
-----END PGP SIGNATURE-----

--WTOJJw+4zWH0HCQ2--


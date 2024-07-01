Return-Path: <linux-input+bounces-4771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE1791E478
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 17:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79A0E1F24F75
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 15:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EF016D321;
	Mon,  1 Jul 2024 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmLu8rVB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A816CD1A;
	Mon,  1 Jul 2024 15:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848778; cv=none; b=pPND1HRfFbTWZARzVYV4mKeHkWtTMc1kLwMMSF2mpSE/jv/0CbKZzikRqjjcz/IDCYjKNOTR5mBA7t4b6fkuzmtvDbc/+Z2cyk9nPY3r4bVABlayRPiz6H1gyKpJm3fI+23K9gSg8E0P1FHNnWdnNBqZdPD7eKECgG0FQIz1yzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848778; c=relaxed/simple;
	bh=Fg94f39jtc9hqKc36WSaKQnsZgFXSp7xy5OBlT2V7M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF9Xz1Bu3NpWOA4U4NcvHIEfQQ60qFv4yYkN55BZJf1ZJTa6LQemUXaQ+D1uyt1jnQXrYoEgvL7zj8U4eOzd0mH3gCMtDvlPmx2J7TnrYWONNTNEvsA82fCIBAYrIbsw+gG6MocHws3p/yrBWqsA8STao8bCTl8l29w8SZN+Qjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmLu8rVB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E95C116B1;
	Mon,  1 Jul 2024 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719848777;
	bh=Fg94f39jtc9hqKc36WSaKQnsZgFXSp7xy5OBlT2V7M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmLu8rVB/3esvcxOeQajnTJatwXOApM4Ul0yEYTmx4KKEuxYhSOfNPkkD+tV0A7O0
	 SSZewKH3oGn12+d4PbhaLVMPkbhSA95LMnLUab8Krd3yo2rUC+C+L4cXDIH/Zvu055
	 AFGbc+OuVBl2Orz4atYdHu9Xtl2fkK/PbSevqV3MT4SPMyy8VSRKge+JK/jJvedaKe
	 54jyL4HqOgoX4jENIAQ+5+PEGua9oOlprHjfFqdpZrtO/zJKEJCSJuxq9Q/8fMAZP5
	 CgEwwoEl4hnQDek7XbmjSi5lrNdwRry7nJvb5HZAoMoyfZ3bRAyLKbUs2ty4anAH5t
	 mE00hsdfaJmIg==
Date: Mon, 1 Jul 2024 16:46:12 +0100
From: Conor Dooley <conor@kernel.org>
To: utsav.agarwal@analog.com
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Oliver Gaskell <oliver.gaskell@analog.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for adp5588
Message-ID: <20240701-battalion-tacky-c52566b37a97@spud>
References: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
 <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oDOttPmur9969YgW"
Content-Disposition: inline
In-Reply-To: <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>


--oDOttPmur9969YgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 04:04:51PM +0100, Utsav Agarwal via B4 Relay wrote:
> From: Utsav Agarwal <utsav.agarwal@analog.com>
>=20
> Updating dt bindings for adp5588. Following properties are now made
> optional:
> 	- interrupts
> 	- keypad,num-rows
> 	- keypad,num-columns
> 	- linux,keymap
> The proposed new property "gpio-only" has been added as an optional
> property with an additional example.

I can see that as it is clear in the diff, but this doesn't explain why,
which is what you need to do in your commit message.

>=20
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
>  .../devicetree/bindings/input/adi,adp5588.yaml     | 28 ++++++++++++++++=
++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/D=
ocumentation/devicetree/bindings/input/adi,adp5588.yaml
> index 26ea66834ae2..158fbf02cc16 100644
> --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> @@ -46,6 +46,11 @@ properties:
>    '#gpio-cells':
>      const: 2
> =20
> +  gpio-only:
> +    description:
> +      This property applies if keypad,num-rows, keypad,num-columns and
> +      linux,keypad are not specified. All keys will be marked as gpio.

Why is a property required for this? Is the absence of the 3 keypad
properties not sufficient to determine that you're in this mode?


>    interrupt-controller:
>      description:
>        This property applies if either keypad,num-rows lower than 8 or
> @@ -68,10 +73,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts

I don't understand why interrupts is no longer required.

> -  - keypad,num-rows
> -  - keypad,num-columns
> -  - linux,keymap

I think you should configure "dependencies:" such that if one of these
properties is added, then all 3 of them must be to preserve the current
requirements while the device is being used in keypad mode.

Thanks,
Conor.

> =20
>  unevaluatedProperties: false
> =20
> @@ -108,4 +109,23 @@ examples:
>              >;
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +        gpio@34 {
> +            compatible =3D "adi,adp5588";
> +            reg =3D <0x34>;
> +
> +            #gpio-cells =3D <2>;
> +            gpio-controller;
> +            gpio-only;
> +            };
> +        };
> +
>  ...
>=20
> --=20
> 2.34.1
>=20
>=20

--oDOttPmur9969YgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoLPRAAKCRB4tDGHoIJi
0nBeAQCMd4I0xkAJEwaZsZmkD1PB6aeBhxjeoczPoq86VRRHEwEAp4QdAfVNSYoc
D/M+TPzlJGpZ1KDMJrOYRdK/NJkOygI=
=RHUe
-----END PGP SIGNATURE-----

--oDOttPmur9969YgW--


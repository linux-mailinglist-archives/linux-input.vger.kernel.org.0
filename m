Return-Path: <linux-input+bounces-4819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0029264BA
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 17:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05EE0B24C76
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 15:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EBA17DA3F;
	Wed,  3 Jul 2024 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qb3wrzoZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A951DFD1;
	Wed,  3 Jul 2024 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720020026; cv=none; b=iGKoZB3wTD5B6BmfoQHesmJalFQkurKUzAmW0VK8YoQ0327BWYrVNsWYJ62Ex5DE1ZWemVlJyScBwr30DHi17X0d0QuqJx3iBp+JNHBLFT/4e6If9L90EGY6MhBDVRmlAdr8sE/5Ad0ReDPzdf8ob3vtZlf1gv7ljq2tD5cgAWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720020026; c=relaxed/simple;
	bh=rRgZmzWkq1RNfqzPXVEsRA4y3AQD9TvNW/JDpsjuBvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcQcTjlvDY56PCeaHnZRi2Y6txuZLzIbd3cibFg7Qdf6m2oXbO071Vs587u6jj1aaIimG0RFwm0ruHX/WwkgcdDwK28uWjrUcWTGsqcJOViB29gl7Ljge3113h3ek4ZZwSdkBuSowZPMyUijnSRn8b+cUwGtjm0GS4RISjiW7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qb3wrzoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3887CC2BD10;
	Wed,  3 Jul 2024 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720020025;
	bh=rRgZmzWkq1RNfqzPXVEsRA4y3AQD9TvNW/JDpsjuBvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qb3wrzoZ684EOWe4U72NdJKqewE7FfZIPbGzwqTgVY0uE9PJqtmB4FAPAWEwfoS+B
	 S7pdvYDJujZFb79nVPifQVYifpGU4qlSgykhhEAimfHP8fUp2Wp/Kx6uBoo82ITB/j
	 gSrsS9+kKoXjP4DrG5wfWkNjm6DPFyVPYjKJTBB1eq8sGFTtQ+knbHjL4iF0w8X53q
	 ZlO5CZA4UPETFDUaQ9by21HOA3IcupbAR/8TstTAFfEWxhC+7quXTROq6MGJFNFzVO
	 B1sQ9wPDIIetiX40oSC70SeLJlrTMD4iugM0CoetpTmVPgW2hpR15clArhBfp6FlgH
	 CFlT/qsgHlaAw==
Date: Wed, 3 Jul 2024 16:20:21 +0100
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
Subject: Re: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for adp5588
Message-ID: <20240703-safehouse-flame-0b751b853623@spud>
References: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
 <20240703-adp5588_gpio_support-v5-3-49fcead0d390@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I265JjUt3ALiy5BD"
Content-Disposition: inline
In-Reply-To: <20240703-adp5588_gpio_support-v5-3-49fcead0d390@analog.com>


--I265JjUt3ALiy5BD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 11:58:16AM +0100, Utsav Agarwal via B4 Relay wrote:
> From: Utsav Agarwal <utsav.agarwal@analog.com>
>=20
> Updating dt bindings for adp5588. Since the device can now function in a
> purely gpio mode, the following keypad specific properties are now made
> optional:
> 	- interrupts
> 	- keypad,num-rows
> 	- keypad,num-columns
> 	- linux,keymap
>=20
> However since the above properties are required to be specified when
> configuring the device as a keypad, dependencies have been added
> such that specifying either one would require the remaining as well.
>=20
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
>  .../devicetree/bindings/input/adi,adp5588.yaml     | 33 ++++++++++++++++=
++----
>  1 file changed, 28 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/D=
ocumentation/devicetree/bindings/input/adi,adp5588.yaml
> index 26ea66834ae2..6c06464f822b 100644
> --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> @@ -49,7 +49,10 @@ properties:
>    interrupt-controller:
>      description:
>        This property applies if either keypad,num-rows lower than 8 or
> -      keypad,num-columns lower than 10.
> +      keypad,num-columns lower than 10. This property does not apply if
> +      keypad,num-rows or keypad,num-columns are not specified since the
> +      device then acts as gpio only, during which interrupts are not
> +      utilized.
> =20
>    '#interrupt-cells':
>      const: 2
> @@ -65,13 +68,15 @@ properties:
>      minItems: 1
>      maxItems: 2
> =20
> +dependencies:
> +  keypad,num-rows: ["keypad,num-columns"]
> +  keypad,num-cols: ["keypad,num-rows"]
> +  linux,keymap: ["keypad,num-rows"]

Is what you've got here sufficient? Adding "keypad,num-rows" won't
mandate "linux,keymap" which I think is wrong. I think all 3 entries
here need to contain both of the other two.

> +  interrupts: ["linux,keymap"]

I still don't understand why interrupts are only allowed when the keymap
is present. I'd cover the interrupts with something like

if:
  required:
    - linux,keymap
  then:
    required:
      - interrupts

so that interrupts can be used while not in keypad mode. Unless of
course there's something (unmentioned in this patch) that prevents that.

Thanks,
Conor.

> +
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - keypad,num-rows
> -  - keypad,num-columns
> -  - linux,keymap
> =20
>  unevaluatedProperties: false
> =20
> @@ -108,4 +113,22 @@ examples:
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
> +            };
> +        };
> +
>  ...
>=20
> --=20
> 2.34.1
>=20
>=20

--I265JjUt3ALiy5BD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoVsNQAKCRB4tDGHoIJi
0qIjAP9FGMpejmxLN4Q2htHtCSRLXqXsNGQOcfGQBKOdfwL57QEAonj/PljB6JDy
SZFCvkBKNqPyyxLazAzjnuzX+3V2lAk=
=Eqf2
-----END PGP SIGNATURE-----

--I265JjUt3ALiy5BD--


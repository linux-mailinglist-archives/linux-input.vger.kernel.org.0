Return-Path: <linux-input+bounces-14303-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63365B347CA
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 18:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACF7C7A330F
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 16:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92DA2FE059;
	Mon, 25 Aug 2025 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hem30tuE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B971919CD1D;
	Mon, 25 Aug 2025 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756140163; cv=none; b=SNrdlzQkqj2ofFB+g+geMIDid9Ff73Kvr/MXHq1+nL8fNX+rT+bA2PeF5idqo2XoI29JHpk9og8qDpOXy2iqXv+o11To+GyesGPDFjljE+m6G5MaxuBxJYjIa5qFX9an+Hy9cpc8gNU+07TlrTARuIA1Gq5Fzyr5RXcvfTVzIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756140163; c=relaxed/simple;
	bh=N2ZnO7W7G9QhXx/DhubOgNvoaGF8b3udwNVd/Zxpvlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGPyfT07Smk8aW3QrpP/32x2CdpuuFW3z+jFhkRLfqm5NqmSf2BQYfz/B6pMzzHVaKJsk7qE0b8GW8bl0+q4p2CAtyLIs7HuKn5i0vUYtXzZfe1pqZpU/eCzsyjH0Z6hVZqMOCEqOAwsT/YLqH0TJoUToM9pEexUWp9Rzn/r6bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hem30tuE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE813C4CEED;
	Mon, 25 Aug 2025 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756140163;
	bh=N2ZnO7W7G9QhXx/DhubOgNvoaGF8b3udwNVd/Zxpvlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hem30tuEhWRaHDCAFbQUezNE5toFIcFbrzfmzjCPwDUpnCwiEog7kO7uNLgdQl00Y
	 SwqCyO1m3ifVUDpiGAK2YwD1qMMyfu8hwhoIUB9bDe26tfaenqEANhQsO78SVC5zXe
	 BBhQhOkF09bJ2TZyZ0bm6TdeOsE+wyjmxx+J7S5+B3oamM5+X9/QRKZ8ZXUuOmOqgM
	 5AeFRIu5xtIgvEu9WQ2IvURxwRdlmt51wHAzzc6EPAcFapJa8/mQe30Qko5HDp6mX8
	 i1QHctEjjvOZPeBMDNzylNmZRo1okgFD25zemsn4Dub0uFuX2j0kG3D329zX8iY518
	 TFGMgvdkEEZjQ==
Date: Mon, 25 Aug 2025 17:42:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Karel Balej <balejk@matfyz.cz>,
	David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: imagis: add missing
 minItems
Message-ID: <20250825-capillary-viral-b7448ca6a57e@spud>
References: <20250824-imagis-minitems-v1-1-cea9db55e87f@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IJgTNhmqLfGNWVsY"
Content-Disposition: inline
In-Reply-To: <20250824-imagis-minitems-v1-1-cea9db55e87f@dujemihanovic.xyz>


--IJgTNhmqLfGNWVsY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 06:12:05PM +0200, Duje Mihanovi=C4=87 wrote:
> The binding currently expects exactly 5 keycodes, which matches the
> chip's theoretical maximum but probably not the number of touch keys on
> any phone using the IST3032C. Add a minItems value of 2 to prevent
> dt-validate complaints.

Does this mean that there are devicetrees in the wild that use < 5
keycodes?

>=20
> Also add another example to make sure the linux,keycodes property is
> checked.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
>  .../bindings/input/touchscreen/imagis,ist3038c.yaml    | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,i=
st3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,i=
st3038c.yaml
> index bd8ede3a4ad8939cef97e9b177548a8fc8386df7..0ef79343bf9a223501aff8b6a=
525b873e777ea20 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c=
=2Eyaml
> @@ -35,6 +35,7 @@ properties:
> =20
>    linux,keycodes:
>      description: Keycodes for the touch keys
> +    minItems: 2
>      maxItems: 5
> =20
>    touchscreen-size-x: true
> @@ -87,5 +88,22 @@ examples:
>          touchscreen-inverted-y;
>        };
>      };
> +  - |
> +    #include <dt-bindings/input/linux-event-codes.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      touchscreen@50 {
> +        compatible =3D "imagis,ist3032c";
> +        reg =3D <0x50>;
> +        interrupt-parent =3D <&gpio>;
> +        interrupts =3D <72 IRQ_TYPE_EDGE_FALLING>;
> +        vdd-supply =3D <&ldo2>;
> +        touchscreen-size-x =3D <480>;
> +        touchscreen-size-y =3D <800>;
> +        linux,keycodes =3D <KEY_APPSELECT>, <KEY_BACK>;

Does this really need a dedicated example? Why can't the property go
into the existing one?

> +      };
> +    };
> =20
>  ...
>=20
> ---
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> change-id: 20250824-imagis-minitems-4a71387ce61b
>=20
> Best regards,
> --=20
> Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>=20

--IJgTNhmqLfGNWVsY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKySfgAKCRB4tDGHoIJi
0gydAQCBz38M4c2Vf+nH5JB8FdRO+7Ynl+8+SwebDQX759ckpwD+NmsSZwcN3Fcp
kG1srGZ01t5lblM1D7zWHOoaV0Y+eQo=
=q6tE
-----END PGP SIGNATURE-----

--IJgTNhmqLfGNWVsY--


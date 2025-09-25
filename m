Return-Path: <linux-input+bounces-15110-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F3BA1250
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 21:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C0F0162D09
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 19:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4B731B822;
	Thu, 25 Sep 2025 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bq1kVWL9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2AB13635E;
	Thu, 25 Sep 2025 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828007; cv=none; b=oOAWV2R3lECkQXizYC86GcFiJZazHXb4e2NDMtZ1MsrxVXLp9K+nCFoEOJR2eKWk5N6EoNaHuKUlAlfwJlX3zn2N2/oyJn3twwikj+Lp6qX6EhoPO5VVAEG/L96iwfUGqOfTkFNPT1dRBOyUyFJdWfxxC9q1x8x3xn0bPXMpSUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828007; c=relaxed/simple;
	bh=oXFywUUkgH8AChne9M1JETfHccSCydGfLpgO9ndlksQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJlwAulICyqyXubpQ0YEblzlb2N0aBCJAkeMkBwm444H35liqePG5lPxmVRVe8j7oV/QMeQ6pm+D91S8h0Lvyj5juEDOr2hMRcHvsrSNF9zm1aH7CvmQBUGRvIcvU6ErjMhBS6wr6zm5M948nK3K6LQ6w6rf039hFnegJH4MnoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bq1kVWL9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45294C4CEF0;
	Thu, 25 Sep 2025 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758828007;
	bh=oXFywUUkgH8AChne9M1JETfHccSCydGfLpgO9ndlksQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bq1kVWL9hbWdgjZGZ5Mus6XNwyyOYsBNq+n3lo1gwGFoDsnQPJN8dW+DedftJM5Rv
	 ldkq0opweIZp/+RPVqsWAr8tomaZmy2ikpI1a4Cit9sl4OuxkQEXNWNdwuRv/b3ZE/
	 /EQ9AhxHvpa2HvH7eYQg3QJg9DY8OWUBOaDBwDjE0euD5IPY9G9zlcwMnrZAScnlGF
	 eS4pwTDXwCH84HSm7r5Y9/ghyTrHEA9qHpKUhkQ4dLeshJGQkVGYYYazqZdkZErdql
	 74UUFasGf8n++iaHGzXiuEVopL5HOQvCPLC4CblzcTL2GB0wGZu76BIISm3dg6UAhT
	 r7c7Sl+clS+Xg==
Date: Thu, 25 Sep 2025 20:20:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: touchscreen: move ar1021.txt to
 maxim,max11801.yaml
Message-ID: <20250925-boundless-announcer-007f08404112@spud>
References: <20250925185653.298246-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Tz25XhdHN4bT8F8"
Content-Disposition: inline
In-Reply-To: <20250925185653.298246-1-Frank.Li@nxp.com>


--3Tz25XhdHN4bT8F8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 02:56:47PM -0400, Frank Li wrote:
> ar1021 have only reg and interrupts property beside touch common
> properties. So move context of ar1021.txt into maxim,max11801.yaml.

Are these devices even remotely related, other than both being touch
devices?

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/input/touchscreen/ar1021.txt         | 15 ---------------
>  .../input/touchscreen/maxim,max11801.yaml         |  4 +++-
>  2 files changed, 3 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/a=
r1021.txt
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ar1021.t=
xt b/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
> deleted file mode 100644
> index 82019bd6094ee..0000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -* Microchip AR1020 and AR1021 touchscreen interface (I2C)
> -
> -Required properties:
> -- compatible		: "microchip,ar1021-i2c"
> -- reg			: I2C slave address
> -- interrupts		: touch controller interrupt
> -
> -Example:
> -
> -	touchscreen@4d {
> -		compatible =3D "microchip,ar1021-i2c";
> -		reg =3D <0x4d>;
> -		interrupt-parent =3D <&gpio3>;
> -		interrupts =3D <11 IRQ_TYPE_LEVEL_HIGH>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/maxim,ma=
x11801.yaml b/Documentation/devicetree/bindings/input/touchscreen/maxim,max=
11801.yaml
> index 4f528d2201992..288c7e6e1b3b7 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.=
yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.=
yaml
> @@ -11,7 +11,9 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: maxim,max11801
> +    enum:
> +      - maxim,max11801
> +      - microchip,ar1021-i2c
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--3Tz25XhdHN4bT8F8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNWV4gAKCRB4tDGHoIJi
0v9+AP4+SeGB5bYI1zCI06eAxO9wh1uemfGAuFgtfYMXkFosDQEA+0IvYQ/31C8M
pDHYBfqh67VBMbZ9Qiq32iZ/+IzxVws=
=s8Jj
-----END PGP SIGNATURE-----

--3Tz25XhdHN4bT8F8--


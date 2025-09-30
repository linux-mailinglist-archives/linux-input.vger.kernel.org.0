Return-Path: <linux-input+bounces-15175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EA4BAE658
	for <lists+linux-input@lfdr.de>; Tue, 30 Sep 2025 21:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D32121638A5
	for <lists+linux-input@lfdr.de>; Tue, 30 Sep 2025 19:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C23285077;
	Tue, 30 Sep 2025 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2eUU7cU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B22848A7;
	Tue, 30 Sep 2025 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259160; cv=none; b=pnFvFPa3gXGmpG7n0k2Q2ievcdH5FtZdk8cYlAcVAPePR/q0lMLW1rACqJc2GqNUyioJ7u/O2bDVu5SQiPdYEuLKkRv7BNjIAx+MJlidB866e85nbX0Gvfnw6luwjkvBXWzl462D1WHV9rjnsv8InMIWSLFMNmmdZgkmgaK1Ma4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259160; c=relaxed/simple;
	bh=WmddhDMLhlRHiSGuLiIAMMbrgljd/6gY8s8Pt0q4Wk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKXPV/fG7Dn9RHWAMy8Ul5WRkuyEQO+NndpG9Kn2T3ETvIJm7LPVabYr3GBPthsL4Erj9+qs2M4Mdn3NZRDh3T/qjkNoaLXJhNUyU1ntQ57q+fEZvJQScin/QUZiYWmGkB5KfxuMqkzRcNEVugmZmUzIayKv7ysPqcKTPaKzv6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2eUU7cU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4198DC4CEF0;
	Tue, 30 Sep 2025 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759259160;
	bh=WmddhDMLhlRHiSGuLiIAMMbrgljd/6gY8s8Pt0q4Wk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2eUU7cUXRGj+mGEOq7ooTEnMGDxfrReh3aFSELB262VQV8th2Q+CVDdoVh3JQkYw
	 hntbAnMVU/LuRNuV7Jaozslqr4UcXHDHjtsb3UqTIji1aR0XLFTd9WHHDmouW6hhsn
	 2LWWE89/dtvq1rK9uw1zo4HBzmSAoBk+PrHaNWPlmOwEw44Ij3Sz6SehTjol/0lZK1
	 JOQKK28lqqqgkUc3wMPl97Nfyni3cmY74uQiogPNMJhgGLYMgtg9k/zW0FsaGMJpzb
	 GXYFGHu2T49jOT2NkSGkmLLdOmcUToXe4hPx/FESuSErR0nO3Djmp9bMflesY/USio
	 E/bUFOoeOAXZg==
Date: Tue, 30 Sep 2025 20:05:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dt-bindings: touchscreen: move ar1021.txt to
 trivial-touch.yaml
Message-ID: <20250930-venomous-tracing-669be2e1163b@spud>
References: <20250926184720.391335-1-Frank.Li@nxp.com>
 <20250926184720.391335-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfQSaJ5LsA5jl7n8"
Content-Disposition: inline
In-Reply-To: <20250926184720.391335-2-Frank.Li@nxp.com>


--nfQSaJ5LsA5jl7n8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 02:47:12PM -0400, Frank Li wrote:
> ar1021 have only reg and interrupts property beside touch common
> properties. So move context of ar1021.txt into trivial-touch.yaml.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
>  move to trivial-touch.yaml
>=20
> previous discussion
>     https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@=
spud/T/#t

You mentioned there were a load of other devices using just these 3
properties. Do you intend moving those too?

> ---
>  .../bindings/input/touchscreen/ar1021.txt         | 15 ---------------
>  .../bindings/input/touchscreen/trivial-touch.yaml |  2 ++
>  2 files changed, 2 insertions(+), 15 deletions(-)
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
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-=
touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-to=
uch.yaml
> index c393cce273c5b..d6aed3afd4acb 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.y=
aml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.y=
aml
> @@ -14,6 +14,8 @@ properties:
>      enum:
>        # MAXI MAX11801 Resistive touch screen controller with i2c interfa=
ce
>        - maxim,max11801
> +      # Microchip AR1020 and AR1021 touchscreen interface (I2C)
> +      - microchip,ar1021-i2c
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--nfQSaJ5LsA5jl7n8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwqFAAKCRB4tDGHoIJi
0tWLAQC1n2yPqxzpGGLumm0bVK/6IxAfADZgCmHqAKwU+J4k3gD/XjOYFP6oF2YV
soUksHK6tuNWn4eoX9th5iV5eKtlGQk=
=7hjP
-----END PGP SIGNATURE-----

--nfQSaJ5LsA5jl7n8--


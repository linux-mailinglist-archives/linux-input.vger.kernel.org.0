Return-Path: <linux-input+bounces-5675-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570C9570B4
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 18:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483AF1C20D15
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 16:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BBB1741FD;
	Mon, 19 Aug 2024 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzTrBhW1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FF04965B;
	Mon, 19 Aug 2024 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086091; cv=none; b=rcbPKi827/w/8+aPx6O9G24od305fWogHqTVvCFaB6bxulEsFcRbBWi2BOTveTGzmgWA39yuVE46jF3rHazieu/epxn8SEHoZ1xxYMtXrF3MSMOmfuPoE/hiUYBWOSHDU5WlEh37bajmuh9KDEsKj1DFe8qWjcyjnVvKj/Bez5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086091; c=relaxed/simple;
	bh=ZxHbad6RitBAjGXVtdlyclNzqb3Q+8yJ+JbTUUPlqxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbdcH1GJuJZZdaplJxs+7JAc308KZEo+oI7nD38oFFCzwVrKdrfMYKL1VYr5G3lnSsmsTpqYzX8vOxF7MgDqWd8FJupcNBO/VdjESAzccUe0/M2Ibmucynp5pY8QNm+zGCEBNAM+LAdWJjYed2NZAhtrDrgLX6kX11WRxtMv/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzTrBhW1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9173C32782;
	Mon, 19 Aug 2024 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724086091;
	bh=ZxHbad6RitBAjGXVtdlyclNzqb3Q+8yJ+JbTUUPlqxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzTrBhW1Tw3lH7/JwU6UYsvxcLhIq2pRiwjKbLb2xWwdyLyrtlrkJFSXO3XWMeBlm
	 huM2ILpKsUF+v8Sp7hX/RConnhUo3uylrgworTA4x1hmCFct1pY6dcZmX+smfZd7WB
	 okB4SvfGmvV94TY7OSlIpja1WhNH13halZPieYDrj3EuFBEsK3s5JIzCnua9d9/x3N
	 NMkrXnblZVhbOn1yN9Ma7jKCk5fppm0lIyVJocfi1W1zO6aslQhUZFLb87hrzbA9/c
	 +99ZyJnnrNjXn6UadOEwfV77fXE2jGKGd21LI1gHrr4c8Pv8Z98sphBnx0zIu7IFWc
	 UlkoOtA3GDccw==
Date: Mon, 19 Aug 2024 17:48:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 09/14] dt-bindings: input: samsung,s3c6410-keypad:
 introduce compact binding
Message-ID: <20240819-backstab-fanatic-54788c691f9c@spud>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-10-dmitry.torokhov@gmail.com>
 <dbs44pwxfhsnmdzsd32mp7rlhq6w5fanu5bakuisxmyz2ehbtd@cdfr26oicjll>
 <ZsNpdhKlLYegkosN@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/IykXYf3e9Pofwc3"
Content-Disposition: inline
In-Reply-To: <ZsNpdhKlLYegkosN@google.com>


--/IykXYf3e9Pofwc3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 08:49:10AM -0700, Dmitry Torokhov wrote:
> On Mon, Aug 19, 2024 at 03:02:07PM +0200, Krzysztof Kozlowski wrote:
> > On Sun, Aug 18, 2024 at 09:58:06PM -0700, Dmitry Torokhov wrote:

> >=20
> > > +      - keypad,num-columns
> > > +      - keypad,num-rows
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > >    - interrupts
> > > -  - samsung,keypad-num-columns
> > > -  - samsung,keypad-num-rows
> > > +
> > > +if:
> >=20
> > put allOf: here and this within allOf, so you the "if" could grow in the
> > future.
>=20
> Hmm, there is already "allOf" at the beginning of the file, so adding
> another one results in complaints about duplicate "allOf". I can move it
> all to the top, like this:
>=20
> allOf:
>   - $ref: input.yaml#
>   - $ref: matrix-keymap.yaml#
>   - if:
>       required:
>         - linux,keymap
>     then:
>       properties:
>         samsung,keypad-num-columns: false
>         samsung,keypad-num-rows: false
>       patternProperties:
>         '^key-[0-9a-z]+$': false
>     else:
>       properties:
>         keypad,num-columns: false
>         keypad,num-rows: false
>       required:
>         - samsung,keypad-num-columns
>         - samsung,keypad-num-rows
>=20
> Is this OK? I don't quite like that "tweaks" are listed before main
> body of properties.

The normal thing to do is to put the allOf at the end, not the start, in
cases like this, for the reason you mention.

--/IykXYf3e9Pofwc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN3RgAKCRB4tDGHoIJi
0kZYAP4raAnB9vYkB1nibRW+mvk8v9yS0OpBDt7tSNpTgrznKAD/WDUUMuO/AhZe
vKzxIMJHkd3e3CZCvVaqQsd7xlAibQM=
=dVMh
-----END PGP SIGNATURE-----

--/IykXYf3e9Pofwc3--


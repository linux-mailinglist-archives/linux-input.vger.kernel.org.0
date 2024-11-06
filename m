Return-Path: <linux-input+bounces-7898-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E69BF326
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 17:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84427B245FA
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 16:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B795B2038C5;
	Wed,  6 Nov 2024 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onHYz3TI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F8202F6C;
	Wed,  6 Nov 2024 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730910271; cv=none; b=n6Obp4O0ywpwqcaCwtSeRmYjaMeDFJPaIJsvl2F/RfyEHVTfkIIiY+TkXzaGO5Th7q/28SE/BeyBH2fjwfQCZQ0NMkOrCO9WZ6z7+AV1s5OOtnBnRwJd5LxZQHmTmdVbrUnT+YtAIzwVV9otbRRDDNehpE9Vp5j+7a+77GeHdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730910271; c=relaxed/simple;
	bh=Sj2iMPVC4t8UWXhnZpLZQxauCOr7yy27q4FUElk2RYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdt6uQLnhQomL2zhsR3E2v98IUq/g25qrtFZiYp0iI/VWGgc0F1DoXBuyCk7UaJPm91CZScdl85uL7ZCgrqLey5CpNR+3ygM4SdPjcORfMBreCMusdn3OpZIjx/mY6v3zjwiCep0Ja4uh9wPAeJmN+Wcadxf1nXBr4pitaQ8mX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onHYz3TI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F781C4CEC6;
	Wed,  6 Nov 2024 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730910271;
	bh=Sj2iMPVC4t8UWXhnZpLZQxauCOr7yy27q4FUElk2RYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onHYz3TIcQpi871TKla1sO2Q6ZAMq8LYGhMIbTQRlTbt8SGu8fpqzQ3UTZI4L/E6g
	 mkSRDMJWDnx1iCoX7kzsBATcYb+EnXOgaGckevSGT/sawyhooKYVfUYowb9ppaK/Pc
	 +yJGEmHpcHO/ImYGS6KQRWRdw35E6WbyIXVW3tNC2oVgVNbp4GRPyFIQn6aLDizeKo
	 c9qwrtvBhZk2O5i1CIsHneXSbuBJ21Rc67eZCGvYlA0rSE0sFSxmP3EXHThqT+nIUm
	 xzXKIG41q+DjnY5e7/1CZpyBOpWAYKXykCY7evCLxrcjeVNbeC/Ax1YlXyEmZMwlGK
	 YWsROwdnNpjFw==
Date: Wed, 6 Nov 2024 16:24:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <20241106-mobility-exorcist-34d53a6303a3@spud>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
 <20241105130322.213623-5-markus.burri@mt.com>
 <20241105-earpiece-swizzle-a3e36d50b9c6@spud>
 <ZypumDqlw2tdllG5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UD1TWMaQ/sueAZ84"
Content-Disposition: inline
In-Reply-To: <ZypumDqlw2tdllG5@google.com>


--UD1TWMaQ/sueAZ84
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 11:14:32AM -0800, Dmitry Torokhov wrote:
> Hi Conor,
>=20
> On Tue, Nov 05, 2024 at 06:22:36PM +0000, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 02:03:19PM +0100, Markus Burri wrote:
> > > Add missing property 'gpio-activelow' to DT schema.
> >=20
> > What do you mean "missing property"? Why isn't it sufficient to mark the
> > GPIOs as GPIO_ACTIVE_LOW in the various -gpios properties?
>=20
> Unfortunately we do have "gpio-activelow" property already used in the
> driver since 2012 when DT support was added to the driver. This patch
> merely acknowledges that it is there.
>=20
> If DT maintainers wish to adjust known DTSes and switch to proper
> polarity annotation through gpio property I am all for it.

If that's the rationale, it should be in the commit message. It's not my
job to figure out people's intentions :)

> > > Signed-off-by: Markus Burri <markus.burri@mt.com>
> > > ---
> > >  .../devicetree/bindings/input/gpio-matrix-keypad.yaml        | 5 +++=
++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keyp=
ad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > index 745652b..9ea66b3 100644
> > > --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > @@ -51,6 +51,11 @@ properties:
> > >        (Legacy property supported: "linux,wakeup")
> > >      default: false
> > > =20
> > > +  gpio-activelow:
> > > +    type: boolean
> > > +    description: The GPIOs are low active.
> > > +    default: false
> >=20
> > What you want is a flag, not a boolean here btw. Flags you can check for
> > the presence of, booleans you cannot.
>=20
> The behavior is fixed.

What do you mean by "fixed"? Corrected, unchangeable or something else?

> If the flag is true GPIO is assumed to be active
> low, otherwise (and in the absence of the flag) GPIO is assumed to be
> active high.

Flags cannot be false only true or absent, what you have described here
is a boolean.

>=20
> >=20
> > > +
> > >    debounce-delay-ms:
> > >      description: Debounce interval in milliseconds.
> > >      default: 0
> > > --=20
> > > 2.39.5
> > >=20
>=20
> Thanks.
>=20
> --=20
> Dmitry

--UD1TWMaQ/sueAZ84
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyuYOwAKCRB4tDGHoIJi
0qeUAPsF2DNow0eSoZP9W//jfvG6mplUYUf9qe14TyGebWKkwAD/aAd4BecuHr3n
rEp+xCY2x/ikKJ/Pmmdgd1fa6u3s8gE=
=bjik
-----END PGP SIGNATURE-----

--UD1TWMaQ/sueAZ84--


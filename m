Return-Path: <linux-input+bounces-4821-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 928E992655C
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 17:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A011282710
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 15:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8260818131D;
	Wed,  3 Jul 2024 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhwRz5tk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F0379E1;
	Wed,  3 Jul 2024 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720022282; cv=none; b=LLSe+mCWpwZNMpii/6UN7Y6BnUu1hQz7zQlFbD4jzvI+G6/8M4mHm//VeOBfqKDGwPFEPARQrmYSoS4JzmJCovwKPs+KD2mwAa2Fin88/C48dDcBHRwsZqtPpBOwAJkUArj/IDSaGNuC0YpjYy2HiQRY6NlXXlJuZTYltwWd1F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720022282; c=relaxed/simple;
	bh=vaoHRBhxVzMrqcPHfIlXaZpl2H6yjNa8PFuuXHUPE60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZvvWF/kUxpCkMkXVa9ui1tciuztOtuM5/1XD/gu3mcV3TG8kHm/2Swd4RXKjorGJVdmwj2e4Ohky+H88e4FO+y4Sv3fW9sLGDyFwFzfJhj5rL3LvYi6y6kwLm1a1hWCKR4lgIMNcGcva8tKUxsp6nDvyxViw4p7qzwgCXhdjAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhwRz5tk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3761DC3277B;
	Wed,  3 Jul 2024 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720022281;
	bh=vaoHRBhxVzMrqcPHfIlXaZpl2H6yjNa8PFuuXHUPE60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhwRz5tkzZMPgR7+lR/po+T8mPQBk7UyMasMN0Wem8hnzG5bK1QrMTODr3054rif6
	 yZgDNnUEHNkdBjquFdvimSUDbFG7IHnT0AUdspdsBsuGpE7LBJQ2wixgIvLwnzOyOh
	 HxqNGgfv6uQ9dqLFBBMvMq6fVsewnQgluNHsqVJD0D0EsR6DB4n3KsWAwuBy5OtwaX
	 VJx044o6EDT/Qn1WxH4pQkj10r20ZrEqcLRjUURAtsPruCmAcsT2Vw4HX9ckkPDYll
	 /dhAy/ZLZEXpX0WdJ0H8YblfPtjFSJF0k2hH7FoBhx1F5GJd0xIz57iDTZWv1jHq8p
	 hU2B7CIUF98oA==
Date: Wed, 3 Jul 2024 16:57:57 +0100
From: Conor Dooley <conor@kernel.org>
To: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
Cc: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
	"Bimpikas, Vasileios" <Vasileios.Bimpikas@analog.com>,
	"Gaskell, Oliver" <Oliver.Gaskell@analog.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for adp5588
Message-ID: <20240703-mandate-hardy-281ddd048b40@spud>
References: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
 <20240703-adp5588_gpio_support-v5-3-49fcead0d390@analog.com>
 <20240703-safehouse-flame-0b751b853623@spud>
 <SJ0PR03MB63432316EE8382033A4396369BDD2@SJ0PR03MB6343.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XwjIM0gNUPc/PA4a"
Content-Disposition: inline
In-Reply-To: <SJ0PR03MB63432316EE8382033A4396369BDD2@SJ0PR03MB6343.namprd03.prod.outlook.com>


--XwjIM0gNUPc/PA4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 03:55:11PM +0000, Agarwal, Utsav wrote:
> Hi Conor,
>=20
> Thank you for your feedback.
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Wednesday, July 3, 2024 4:20 PM
> > To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> > Cc: Hennerich, Michael <Michael.Hennerich@analog.com>; Dmitry Torokhov
> > <dmitry.torokhov@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sa,
> > Nuno <Nuno.Sa@analog.com>; linux-input@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Artamonovs,
> > Arturs <Arturs.Artamonovs@analog.com>; Bimpikas, Vasileios
> > <Vasileios.Bimpikas@analog.com>; Gaskell, Oliver
> > <Oliver.Gaskell@analog.com>
> > Subject: Re: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for ad=
p5588
> >=20
> > On Wed, Jul 03, 2024 at 11:58:16AM +0100, Utsav Agarwal via B4 Relay
> > wrote:
> > > From: Utsav Agarwal <utsav.agarwal@analog.com>
> > >
> > > Updating dt bindings for adp5588. Since the device can now function i=
n a
> > > purely gpio mode, the following keypad specific properties are now ma=
de
> > > optional:
> > > 	- interrupts
> > > 	- keypad,num-rows
> > > 	- keypad,num-columns
> > > 	- linux,keymap
> > >
> > > However since the above properties are required to be specified when
> > > configuring the device as a keypad, dependencies have been added
> > > such that specifying either one would require the remaining as well.
> > >
> > > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > > ---
> > >  .../devicetree/bindings/input/adi,adp5588.yaml     | 33
> > ++++++++++++++++++----
> > >  1 file changed, 28 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > index 26ea66834ae2..6c06464f822b 100644
> > > --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > @@ -49,7 +49,10 @@ properties:
> > >    interrupt-controller:
> > >      description:
> > >        This property applies if either keypad,num-rows lower than 8 or
> > > -      keypad,num-columns lower than 10.
> > > +      keypad,num-columns lower than 10. This property does not apply=
 if
> > > +      keypad,num-rows or keypad,num-columns are not specified since =
the
> > > +      device then acts as gpio only, during which interrupts are not
> > > +      utilized.
> > >
> > >    '#interrupt-cells':
> > >      const: 2
> > > @@ -65,13 +68,15 @@ properties:
> > >      minItems: 1
> > >      maxItems: 2
> > >
> > > +dependencies:
> > > +  keypad,num-rows: ["keypad,num-columns"]
> > > +  keypad,num-cols: ["keypad,num-rows"]
> > > +  linux,keymap: ["keypad,num-rows"]
> >=20
> > Is what you've got here sufficient? Adding "keypad,num-rows" won't
> > mandate "linux,keymap" which I think is wrong. I think all 3 entries
> > here need to contain both of the other two.
> >=20
>=20
> Ah, I can see the issue, thank you for pointing it out - I will be correc=
ting that.
>=20
> > > +  interrupts: ["linux,keymap"]
> >=20
> > I still don't understand why interrupts are only allowed when the keymap
> > is present. I'd cover the interrupts with something like
> >=20
> > if:
> >   required:
> >     - linux,keymap
> >   then:
> >     required:
> >       - interrupts
> >=20
> > so that interrupts can be used while not in keypad mode. Unless of
> > course there's something (unmentioned in this patch) that prevents that.
>=20
> In case when the device is not in keypad mode, i.e, is purely using gpio =
- it doesn't trigger the interrupt.
> Due to this, I had restricted the same to keypad mode only(as a requireme=
nt). This was mentioned=20
> here:
> https://lore.kernel.org/all/d4661ddc1d253678fd62be4c7e19eb0cff4174f6.came=
l@gmail.com/

This says "not required", not "not functional". How come generating
interrupts becomes impossible when not in keypad mode? That's what needs
to be explained.

Thanks,
Conor.

--XwjIM0gNUPc/PA4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoV1BAAKCRB4tDGHoIJi
0gZ/AQCocR5s2n2LQQcgVf0GR8TGB1H/GaQqjtTuC5GHSHUgLwD9EeOgp3dr75O7
9GLGurj7mSCsdm7wiy6ZJrtPAX9AsQo=
=2XxC
-----END PGP SIGNATURE-----

--XwjIM0gNUPc/PA4a--


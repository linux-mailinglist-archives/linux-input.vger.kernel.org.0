Return-Path: <linux-input+bounces-4804-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B758B92429C
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 17:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B96286721
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 15:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081161BC076;
	Tue,  2 Jul 2024 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcHIAOHQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15AF14D42C;
	Tue,  2 Jul 2024 15:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719934931; cv=none; b=O1g2soxJNp7+cUv2tDQQZuUsmy7raTN5F9T98ATWIf9Dsn5Nq1zsVrIZTDVr1+nP+l2I4/BI3dCzIuaTn8UwEybsdxaT/uxB2PtV+v2y5CEoYfhgd9YQsqxBG+3o6q8dEGwI26iW02bVoTaETUJolDVmZoUSyj6pgHryuKL8OzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719934931; c=relaxed/simple;
	bh=D+AzAWjxfUjC9KFtkLpFRJsjafrnXXkauvIj9N7Pm6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JazidG2WXYA8c/wJJQUxQ+k9dtFEtiFsCBGGIie0jQfYf1v7Dfs8EEN2I2lKclNXG0z/N4taH4JtPzfkHzLHzdayuLRw14RD5MBzWi/bDRMsK8eVJwl5gaSHpV0jeJn4o3gdlPtfLuD5XZxueqdZF+iPcOyy6ZAl45M/nnoWyNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcHIAOHQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF85FC116B1;
	Tue,  2 Jul 2024 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719934931;
	bh=D+AzAWjxfUjC9KFtkLpFRJsjafrnXXkauvIj9N7Pm6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcHIAOHQ5t9qxQbVe1cefKCNU5kkD/MlJCKI214oiLJVdrvit0ZDsYFOZY0kRZfF9
	 yHYzhKBMdIR38unM5YHk+lF5OgMD/bESyrB6knNPcFt3o02bf3HBKkawK+1I88MBFQ
	 kHY4HbCBJWLEoAkUmsDtMuthBp82AGexJAZP2iF0E7XTSAgxtDmzg560TS8RpcsLTi
	 6huyXugXgbAr/zmF0SWNBitC/z0gw4XANjVCdiP18KofnL7Qpdwf2wWnEsyvC11k6r
	 nqooI2Pwi9Ivw6gV+KG6xUIUGksTEyw5gX3fMZ2sVzInDwM1J0WgZ9fY+xEseQFZ90
	 FTIVi45QDBHqA==
Date: Tue, 2 Jul 2024 16:42:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: utsav.agarwal@analog.com,
	Michael Hennerich <michael.hennerich@analog.com>,
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
Message-ID: <20240702-comic-tannery-792d461e0ab7@spud>
References: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
 <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>
 <20240701-battalion-tacky-c52566b37a97@spud>
 <ZoLrYTp2IUKFBvzq@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DW1LKY6BicGgV+zw"
Content-Disposition: inline
In-Reply-To: <ZoLrYTp2IUKFBvzq@google.com>


--DW1LKY6BicGgV+zw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 10:46:09AM -0700, Dmitry Torokhov wrote:
> On Mon, Jul 01, 2024 at 04:46:12PM +0100, Conor Dooley wrote:
> > On Mon, Jul 01, 2024 at 04:04:51PM +0100, Utsav Agarwal via B4 Relay wr=
ote:
> > > From: Utsav Agarwal <utsav.agarwal@analog.com>
> > >=20
> > > Updating dt bindings for adp5588. Following properties are now made
> > > optional:
> > > 	- interrupts
> > > 	- keypad,num-rows
> > > 	- keypad,num-columns
> > > 	- linux,keymap
> > > The proposed new property "gpio-only" has been added as an optional
> > > property with an additional example.
> >=20
> > I can see that as it is clear in the diff, but this doesn't explain why,
> > which is what you need to do in your commit message.
> >=20
> > >=20
> > > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > > ---
> > >  .../devicetree/bindings/input/adi,adp5588.yaml     | 28 ++++++++++++=
++++++----
> > >  1 file changed, 24 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml=
 b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > index 26ea66834ae2..158fbf02cc16 100644
> > > --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > @@ -46,6 +46,11 @@ properties:
> > >    '#gpio-cells':
> > >      const: 2
> > > =20
> > > +  gpio-only:
> > > +    description:
> > > +      This property applies if keypad,num-rows, keypad,num-columns a=
nd
> > > +      linux,keypad are not specified. All keys will be marked as gpi=
o.
> >=20
> > Why is a property required for this? Is the absence of the 3 keypad
> > properties not sufficient to determine that you're in this mode?
>=20
> Yes, I think it should be enough.
>=20
> >=20
> >=20
> > >    interrupt-controller:
> > >      description:
> > >        This property applies if either keypad,num-rows lower than 8 or
> > > @@ -68,10 +73,6 @@ properties:
> > >  required:
> > >    - compatible
> > >    - reg
> > > -  - interrupts
> >=20
> > I don't understand why interrupts is no longer required.
>=20
> I think it should be possible to use this chip as a GPIO controller but
> not an interrupt controller, in which case one does not have to wire up
> the interrupt line from it. However this requires much more elaborate
> binding description (i.e. no keys and no "interrupt-controller"
> property).

Aye. I can totally understand why you might want to make the interrupt
portion optional - but it seems unrelated to the rest of the changes in
the patch (use as a keypad without interrupts could be possible, right?)
and is unexplained.

Cheers,
Conor.

--DW1LKY6BicGgV+zw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQfzgAKCRB4tDGHoIJi
0lquAP9bna7cBICOAimP3OFaEcfDauwaXWxk5OuMVv35e9Ab4wD+MHVU1fOj/6D+
hn0FQ1J1b8m2EWgcYtxuU8GbRsJQQg8=
=1pa+
-----END PGP SIGNATURE-----

--DW1LKY6BicGgV+zw--


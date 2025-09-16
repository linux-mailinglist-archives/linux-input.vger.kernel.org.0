Return-Path: <linux-input+bounces-14773-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF3DB5A091
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 20:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CEAF48421D
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 18:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF6429BDA3;
	Tue, 16 Sep 2025 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEj+1PqE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3952F143756;
	Tue, 16 Sep 2025 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758047703; cv=none; b=lfKbkFNZXNwKKdB69ehBqA8E11vkDyXPgR0c7vOntHhx8FQ85RtfgiJj0bE5UtVTVaAsHZgWp9BYnG+zrf3HsI/rB53PedfRr61ZdbWbWtmsMBUAA9g2/RWaTP8IZcA3AsQcp+OhbPzb59+VJmQSZCdcKB6ZJvYz6tMaES+ilbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758047703; c=relaxed/simple;
	bh=0Y8Vr3AraQV82DBR8zHGaa4Zevj4KNfd9r6qP5JbGp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKntRlda2X+oqWHeyrJYGB62oYn8ccPAs+LRz3gq5g75TU3UcrPQkXkkoa6IKBeinL1ViG3ZlP5sRM0fEKkOQLlhcZLENLQ5ya9sVnt8XeGDEmMmbjf+phGdj3XYfe/GrtQvDuwL8mZ9DY/R4zEB8gCiqa2MIvvsORqUeZw45pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEj+1PqE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97714C4CEEB;
	Tue, 16 Sep 2025 18:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758047702;
	bh=0Y8Vr3AraQV82DBR8zHGaa4Zevj4KNfd9r6qP5JbGp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QEj+1PqE2kTzK5pEFOvkzZz7HK+lpwKmVkFwbSQbw/+kwTOdxIDt+mCZHZDnbh4P9
	 ZeRE8o7LaTsZpPef8AUn96IdwpABMmvWisAMZlElSgvGaQR6d5CCy+z9XM2lPW4VRM
	 mmCp+iyckzTuspuVGzh1ENLePdlF4+XpLB3llxUGgFFxX2XHQTd5P1DyPnnFlsa5+C
	 4o/Hua5mcMg9v0gVsuz36e5Q275RvfFOlCeqJnzGza7NVPstP7b5kCACcNhRuGfmNQ
	 teQ0aLihmp5AhuAyrZcDklOGFXEqLM2JwQAcmJc/0Qa2qXNzDVpeGDrBzFer9TweOB
	 wdZ+XQT2WMaOQ==
Date: Tue, 16 Sep 2025 19:34:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <20250916-bonus-wildness-608ec9a83546@spud>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
 <20250914171608.1050401-5-dario.binacchi@amarulasolutions.com>
 <aMgjAjfydIbYexkE@lizhi-Precision-Tower-5810>
 <20250915-tinker-music-03cff49a41a7@spud>
 <aMmKNYjxolrCb1yC@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rYWN0tYwjxMqonNZ"
Content-Disposition: inline
In-Reply-To: <aMmKNYjxolrCb1yC@lizhi-Precision-Tower-5810>


--rYWN0tYwjxMqonNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 12:03:01PM -0400, Frank Li wrote:
> On Mon, Sep 15, 2025 at 06:42:13PM +0100, Conor Dooley wrote:
> > On Mon, Sep 15, 2025 at 10:30:26AM -0400, Frank Li wrote:
> > > On Sun, Sep 14, 2025 at 07:16:01PM +0200, Dario Binacchi wrote:
> > > > Support the touchscreen-glitch-threshold-ns property. Unlike the
> > > > generic description in touchscreen.yaml, this controller maps the
> > > > provided value to one of four discrete thresholds internally.
> > > >
> > > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > > ---
> > > >
> > > > (no changes since v1)
> > > >
> > > >  .../input/touchscreen/fsl,imx6ul-tsc.yaml         | 15 +++++++++++=
++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fs=
l,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl=
,imx6ul-tsc.yaml
> > > > index 678756ad0f92..310af56a0be6 100644
> > > > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6u=
l-tsc.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6u=
l-tsc.yaml
> > > > @@ -62,6 +62,21 @@ properties:
> > > >      description: Number of data samples which are averaged for eac=
h read.
> > > >      enum: [ 1, 4, 8, 16, 32 ]
> > > >
> > > > +  touchscreen-glitch-threshold-ns:
> > > > +    description: |
> > > > +      Unlike the generic property defined in touchscreen.yaml, this
> > > > +      controller does not allow arbitrary values. Internally the v=
alue is
> > > > +      converted to IPG clock cycles and mapped to one of four disc=
rete
> > > > +      thresholds exposed by the TSC_DEBUG_MODE2 register:
> > > > +
> > > > +        0: 8191 IPG cycles
> > > > +        1: 4095 IPG cycles
> > > > +        2: 2047 IPG cycles
> > > > +        3: 1023 IPG cycles
> > >
> > > you should use ns
> > >    enum:
> > >       - 1023
> > >       - 2047
> > >       - 4095
> > >       - 8191
> > >
> > > you can limit only 4 values, but unit have to ns. your driver map it =
to
> > > register value.
> >
> > Looking at the driver change, I think Dario is already doing that. The
> > text here is just talking about how the controller doesn't support
> > anything other than these 4 glitch threshold and mapping must be done in
> > some way.
>=20
> Thanks, but descripton is confused.
> "Unlike the generic property defined in touchscreen.yaml", which let me
> think value is 0..3, instead of ns.
>=20
> Suggest Remove
>=20
> "Unlike the generic property defined in touchscreen.yaml, this
> controller does not allow arbitrary values"

Yeah, I agree this should be removed. It's unlikely that /any/
touchscreen will support completely arbitrary values, so stating it is
redundant.

--rYWN0tYwjxMqonNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMmtwwAKCRB4tDGHoIJi
0vWEAP9UHTO+GfZtI6OXbDcxvcOVWmp8z5NqbCA7ni7xXVlEUwD8CF4puz+dHm6q
a65TXq2kfo1U+B29pPxvngMosikvjA4=
=Sldc
-----END PGP SIGNATURE-----

--rYWN0tYwjxMqonNZ--


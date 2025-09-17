Return-Path: <linux-input+bounces-14818-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2318AB819C7
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 21:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F2B188DC37
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 19:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362662C11CA;
	Wed, 17 Sep 2025 19:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMhwH362"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6534BA28;
	Wed, 17 Sep 2025 19:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758137215; cv=none; b=o49IDmIViPNzYABy1Zbph8uTJ8q3k+spyfM5ASPZ2YWD6NqBXkHqNgtg8nhC9sV4oCN7x4dm/yKrqlbGGkBiG6mgRmSdLthSdr9qFaEEfJoWZ5nw8CrH96vtlPuBUR3Zv94wtwCSUuBFH3d2cfYOgLzTkRy5rYgoC012x1qGLE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758137215; c=relaxed/simple;
	bh=rxQ5P0gTfpf4dmZ7B42QPAmEImAeP2nFA/KifuYjACM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Io19eJUgJvi7XDhBLVtm+XBUSWafCv7pH1waaJSfUGUZQ0dyG1HFhlPPQBGWbBAiGvJ4NgDQOCCi7OyFC1pSM8aQPZqgLIzFPAPVFcZqTVda/nSm/Ozdv0IUBCIyxConi2KQtR3bQcI6rfmVUzQn6IHHN3GBC8C0je4t190zeQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMhwH362; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9256C4CEE7;
	Wed, 17 Sep 2025 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137214;
	bh=rxQ5P0gTfpf4dmZ7B42QPAmEImAeP2nFA/KifuYjACM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMhwH362ygjjwtnqhXiVywzh3oiDjnrB5XKf0gfMFk/qbDnOy0tJhMrLeVNSz0XX1
	 nF/X6JJvntikX0l4b7OuOv8ibCjAfJCW1P/mzjf03kgBw5yyB1Xe9LqCX4tJIrrQhP
	 CCnjdAC0Lwj4DN+Zhc95Puuo6k9iXc/Z5ppMcbB5miUh4+tesHDmssV1vs6JMMjtC1
	 lNhyo4jJGo/wCqrT3pOeG/zRkLc9PKFy8x/WxX+5l8RJMh4wcwDkah8aMz8m2yHyGN
	 9KAIkeZfXV2rUFurIu/vgS94QSZkilL6fF1cVfI7nqawQUtFWDX/rzQSwcDSUSD78B
	 FcmkowUHZpt1g==
Date: Wed, 17 Sep 2025 20:26:49 +0100
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
Subject: Re: [PATCH v4 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <20250917-unhidden-foothill-7c103245be1f@spud>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-5-dario.binacchi@amarulasolutions.com>
 <aMrc0GhVbpI38t3L@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1WzqRwur55oUj4Vo"
Content-Disposition: inline
In-Reply-To: <aMrc0GhVbpI38t3L@lizhi-Precision-Tower-5810>


--1WzqRwur55oUj4Vo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 12:07:44PM -0400, Frank Li wrote:
> On Wed, Sep 17, 2025 at 10:05:09AM +0200, Dario Binacchi wrote:
> > Support the touchscreen-glitch-threshold-ns property.
> >
> > Drivers must convert this value to IPG clock cycles and map it to one of
>=20
> binding descript hardware, not drivers. So below sentence should be bette=
r.
>=20
> "TSC only supports the four discrete thresholds, counted by IPG clock cyc=
les.
> See SC_DEBUG_MODE2 register."
>=20
> > the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:
> >
> >   0: 8191 IPG cycles
> >   1: 4095 IPG cycles
> >   2: 2047 IPG cycles
> >   3: 1023 IPG cycles
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v4:
> > - Adjust property description following the suggestions of
> >   Conor Dooley and Frank Li.
> > - Update the commit description.
> >
> > Changes in v3:
> > - Remove the final part of the description that refers to
> >   implementation details.
> >
> >  .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,im=
x6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx=
6ul-tsc.yaml
> > index 678756ad0f92..1975f741cf3d 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > @@ -62,6 +62,20 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  touchscreen-glitch-threshold-ns:
> > +    description: |
> > +      Minimum duration in nanoseconds a signal must remain stable
> > +      to be considered valid.
> > +
> > +      Drivers must convert this value to IPG clock cycles and map
> > +      it to one of the four discrete thresholds exposed by the
> > +      TSC_DEBUG_MODE2 register:
>=20
> same as commit messsage, talk about hardware.

This is fine. It's a generic comment about what must be done with the
property by software that helps people understand how to populate it.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


> > +        0: 8191 IPG cycles
> > +        1: 4095 IPG cycles
> > +        2: 2047 IPG cycles
> > +        3: 1023 IPG cycles
> > +
>=20
> This case genenerally need enum 4 values, but it relates IPG frequency.
> I have not idea how to restrict it base on clk frequency. May DT mainatai=
ner
> have idea.

I don't see how you really can restrict it based on the frequency of a
clock that can probably be varied at runtime.

--1WzqRwur55oUj4Vo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsLeQAKCRB4tDGHoIJi
0lL5AQCLnyauVzJQEzihjVDX0KlDXBi1HSOzSRs+/oAZJqNsBAEA8sAFqz68gVZ5
J9dWazzA8+lZXRKWTAXkUnsZSD9G7Ac=
=6CrS
-----END PGP SIGNATURE-----

--1WzqRwur55oUj4Vo--


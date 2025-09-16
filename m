Return-Path: <linux-input+bounces-14774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E6B5A167
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 21:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB31C46067F
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 19:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FA2313D78;
	Tue, 16 Sep 2025 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FatPAe+N"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0F313D67;
	Tue, 16 Sep 2025 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050759; cv=none; b=Kxh7+vZHMi7EJ9QBX1OpEjWOAkfcWzv45Mrs8GEVDj3XU/c0HGvzE8c5p+yXHc9swu83UJOgwBmGC9ZPp6Noebfo3oWPLn8huw2taiqy9+NbtD4v30D6yOVPwsWzTeONWqG2d4hIA9c86TYE/CEj8oDgGXSP5PS7YVyyIaAmkj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050759; c=relaxed/simple;
	bh=WbKVRAs3Wh+XR5dWt3YMr64WBRPzSYnPFa4jHASnGBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgsUbUXdBINaTMqiItkHpX1YQSh5g+d1LQfkMzgg+jEUUmWWJrocMhIjvOCBaylbGMpwJRREPINnMWYNvqB9lOMtj5Krx8AOTwvqNRUOBDsgyVZMgToxoAhBc2HBOpVE01oWLQISmkiy9BimLHevCKaTxz7Mz3owOIrIeqTnPSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FatPAe+N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E148DC4CEEB;
	Tue, 16 Sep 2025 19:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758050759;
	bh=WbKVRAs3Wh+XR5dWt3YMr64WBRPzSYnPFa4jHASnGBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FatPAe+Nj2ETnFOEPGAs4h+A7TEzxfSsUORrtPQperTVyE+gb/CrFO/kzFh3Licr0
	 UPrXS/5YENcxjnnAicEivE5CnZ1ejKoeaaIJvNcNcLnieQkfYhlK+opI0pzLeQP1Ix
	 49qrP4lRMxbXXlFgZwB9WZmpsTS0dSzt6LB0wrTIjpG1cUrZKlH2ohdW711ASfHlzB
	 OABD75atGxGM6lHrs0AdJOVhuvwp0hymPtzETeR9KsAtjD9kP6K/o70fSihY4etXQ2
	 Bp3bH3HjbDy8GiORtNPUnjlWanFfhBlG0WRqCcgRGx7Dzj2hMMW2EaPbXV6IdWKFKI
	 Du9nV0OkVR2kQ==
Date: Tue, 16 Sep 2025 20:25:53 +0100
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
Subject: Re: [PATCH v3 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <20250916-auction-angelfish-0239691a54e5@spud>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
 <20250915195335.1710780-5-dario.binacchi@amarulasolutions.com>
 <aMmIZTMqr0rtiP6z@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xdjz9h8Dzy3Z31w2"
Content-Disposition: inline
In-Reply-To: <aMmIZTMqr0rtiP6z@lizhi-Precision-Tower-5810>


--Xdjz9h8Dzy3Z31w2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 11:55:17AM -0400, Frank Li wrote:
> On Mon, Sep 15, 2025 at 09:53:06PM +0200, Dario Binacchi wrote:
> > Support the touchscreen-glitch-threshold-ns property. Unlike the
> > generic description in touchscreen.yaml, this controller maps the
> > provided value to one of four discrete thresholds internally.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v3:
> > - Remove the final part of the description that refers to
> >   implementation details.
> >
> >  .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml   | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,im=
x6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx=
6ul-tsc.yaml
> > index 678756ad0f92..6214d8be5a99 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > @@ -62,6 +62,18 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  touchscreen-glitch-threshold-ns:
> > +    description: |
> > +      Unlike the generic property defined in touchscreen.yaml, this
> > +      controller does not allow arbitrary values. Internally the value=
 is
> > +      converted to IPG clock cycles and mapped to one of four discrete
> > +      thresholds exposed by the TSC_DEBUG_MODE2 register:
> > +
> > +        0: 8191 IPG cycles
> > +        1: 4095 IPG cycles
> > +        2: 2047 IPG cycles
> > +        3: 1023 IPG cycles
> > +
>=20
> You have to use ns here. You can caculate in driver to match to closed on=
e.

That is what he is saying it is doing - "internally the value is
converted to IPG clock cycles" and so on. Your repeated misunderstanding
of this though points out that maybe the description is still lacking?

Dario, how about:
| The gitch threshold in nanoseconds. Drivers must convert this value to
| IPG clock cycles and map it to one of the four discrete thresholds
| exposed by the TSC_DEBUG_MODE2 register:
|=20
|         0: 8191 IPG cycles
|         1: 4095 IPG cycles
|         2: 2047 IPG cycles
|         3: 1023 IPG cycles
?=20
I dropped the bit about arbitrary values, due to my comment on the other
version a few mins ago.

--Xdjz9h8Dzy3Z31w2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMm5wQAKCRB4tDGHoIJi
0vFUAP4yvJ7JPgJWizlkXSyY13Kiampa5okOCrVuX+Hzqtd9jwD/W4hIs5K7jaew
LxQ8Wc6U2dgRHKf+Px6HcnrGYoPcdwU=
=7jYx
-----END PGP SIGNATURE-----

--Xdjz9h8Dzy3Z31w2--


Return-Path: <linux-input+bounces-14739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F012B583D9
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 19:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A9487A9613
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 17:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86002BDC2A;
	Mon, 15 Sep 2025 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdNs3eU9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815C528C864;
	Mon, 15 Sep 2025 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757958139; cv=none; b=Vzq4TAqizpuFR+RYHlz+GJWYJ/+AHFqaFwNlPqXdnNNC1ZtMQi0lBCt475AYhk10c/0bta8QWTs6xqAH+lefmnCSYgH2oNCGAEPmzLBr8sBsWykC8uzYph51cmW8lwvBbvd17PQzulXCYP+4LzdVjuuKMDMSyn08rD9MCX2UP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757958139; c=relaxed/simple;
	bh=aw645FYpcIgv1xv5JOjhC68jGTuVCheL0PeqBkGn8T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TF/kyXgoiSMyxD3ita6JlIiQCXG0h01G+M1nUESm2QmtBkqU/2P2bntQ1WPfcxKuvhUCbqVDxQx9N2PanoLWuku4E5QCxD7Fn4lBWGcNFeOCSnAsFOIj1B/ijvWVLS5zmDWQuTh7kPVTedXFm71YPzNAeWhQFs2IPOKBAZ3LGpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdNs3eU9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31C5C4CEF1;
	Mon, 15 Sep 2025 17:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958139;
	bh=aw645FYpcIgv1xv5JOjhC68jGTuVCheL0PeqBkGn8T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdNs3eU9Ibb3rqEjn99slfNLCuysWu0j4QlxnPYvRBQcH/UkYXfs+6+RzXxtrRpj2
	 9A2npp8ujANUcqJc7BXtIXWonIbijujgPpV3IcHI9EnMxZHq558mx9oVWKdNZRz2i1
	 cH37vrkBjcB8H/JFv/FTW7kaPAAm0wfyUgPzXDB2UVTlK/3uQLzWtTPkQxY2X17EcP
	 4B2YEo3fygLfh9J9Py5lbw/NSkwveincEz8e0d9Kql0z8V2MmlViB+MA87SrRd1SgN
	 iCbNk8we58zU1/73l94HtjlMKDtTZ2gn1ECYhTO5U1Lnnl73xGLxa+0DeJBJ8s1ilG
	 zdbe3NljiT6lA==
Date: Mon, 15 Sep 2025 18:42:13 +0100
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
Message-ID: <20250915-tinker-music-03cff49a41a7@spud>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
 <20250914171608.1050401-5-dario.binacchi@amarulasolutions.com>
 <aMgjAjfydIbYexkE@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5WVm9q/T8EFhrjz+"
Content-Disposition: inline
In-Reply-To: <aMgjAjfydIbYexkE@lizhi-Precision-Tower-5810>


--5WVm9q/T8EFhrjz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 10:30:26AM -0400, Frank Li wrote:
> On Sun, Sep 14, 2025 at 07:16:01PM +0200, Dario Binacchi wrote:
> > Support the touchscreen-glitch-threshold-ns property. Unlike the
> > generic description in touchscreen.yaml, this controller maps the
> > provided value to one of four discrete thresholds internally.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> > (no changes since v1)
> >
> >  .../input/touchscreen/fsl,imx6ul-tsc.yaml         | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,im=
x6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx=
6ul-tsc.yaml
> > index 678756ad0f92..310af56a0be6 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > @@ -62,6 +62,21 @@ properties:
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
>=20
> you should use ns
>    enum:
>       - 1023
>       - 2047
>       - 4095
>       - 8191
>=20
> you can limit only 4 values, but unit have to ns. your driver map it to
> register value.

Looking at the driver change, I think Dario is already doing that. The
text here is just talking about how the controller doesn't support
anything other than these 4 glitch threshold and mapping must be done in
some way.

> > +
> > +      Any value provided in device tree is converted to cycles and rou=
nded
> > +      up to the next supported threshold, or to 8191 if above 4095.

This seems to be the implementation details of one particular driver,
and does not belong in a binding.

> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.43.0
> >

--5WVm9q/T8EFhrjz+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhP9QAKCRB4tDGHoIJi
0jn8AQD4ElZB882NLhy+6XIYaVM87iHwDmWdzF0PSDinfdbr6wEA2V/HYhULBlLi
X6+Ft7GtGeYClYENgBEey6E3f1BaFww=
=9tCB
-----END PGP SIGNATURE-----

--5WVm9q/T8EFhrjz+--


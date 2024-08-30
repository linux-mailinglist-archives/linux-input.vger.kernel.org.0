Return-Path: <linux-input+bounces-6026-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B281966423
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 16:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E8E2853DB
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 14:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADE91B250E;
	Fri, 30 Aug 2024 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO27gycv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE31A287C;
	Fri, 30 Aug 2024 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027987; cv=none; b=Iv6QGkn7GvS4yDuMAbBvClia2mFkjpjDnT0f4EhZZSTDGaRVxQnEcIqj7Wl6IJOviAV7NiGF2FST+GRoGwh3QmHjnVQnukxsjnxifrohSUlGVZNfv05oGEg6J614K+EZrV63AW051BJLf4djsBNKBAuN0oI2HkSxDRy27IWJHF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027987; c=relaxed/simple;
	bh=pmYzM5MpkijOaA7CMYN4bxqSPHajG3ChAOSYGsOiQes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tp0uONQX4DlG7rS76zq+QpUPiNawzRZWP8Mr3tSyFP5CuxX2CFPUfYO2WNMUN8ivNvmoP5xTy76RzjU/qYQRsuFXJA992uMHvKxll8NaStsJsdho06/GKPz1i/f4C3jcxRJKuFHwLO10PieRUI128W6y7FiJJAPdUsATyHfawhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO27gycv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83023C4CEC2;
	Fri, 30 Aug 2024 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725027987;
	bh=pmYzM5MpkijOaA7CMYN4bxqSPHajG3ChAOSYGsOiQes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SO27gycvv+aDYmKxVhjyBiJTnPuCee7lg/BcgPfW2Q0iMJcKcGKqIci/op8gB80Jv
	 Zh/JKKmFEyKS01eMkht6Ykm4jGoG064O2DhiATVXgoh2r/EuhwKOvTUaHgMX3M3O3F
	 gAlAjlLknPf2eP5u2wx8hVFVvMZKR4SykLzcB1Kh6K8w6AmyLmd3iYdNBXq3S+4XPD
	 8aPNdcdcUngfaVG2IWv89pOp95ZFM34i0595GDXiKRD2vBzcaXLYnXx0w9KOLk0m3F
	 0+s0Ge5JFuWHlZqPPm8R40LAj4YlGIXhyxCfWANFaBQVHX2Ws/sLSv/7hyZaco79j5
	 kUIaqDr1bWSpw==
Date: Fri, 30 Aug 2024 15:26:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: touchscreen: ad7877: add bindings
Message-ID: <20240830-most-amiss-dc8bf471ce9a@spud>
References: <20240829092007.25850-1-antoniu.miclaus@analog.com>
 <20240829092007.25850-2-antoniu.miclaus@analog.com>
 <20240829-mossy-dispense-bab38650455f@spud>
 <ZtC48cOrWPG5SdiS@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A0uBSx1XFuQdwCNx"
Content-Disposition: inline
In-Reply-To: <ZtC48cOrWPG5SdiS@google.com>


--A0uBSx1XFuQdwCNx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 11:07:45AM -0700, Dmitry Torokhov wrote:
> On Thu, Aug 29, 2024 at 05:16:30PM +0100, Conor Dooley wrote:
> > On Thu, Aug 29, 2024 at 12:19:36PM +0300, Antoniu Miclaus wrote:
> > > Add device tree bindings for the ad7877 driver.
> > >=20
> > > Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> > > ---
> > >  .../input/touchscreen/adi,ad7877.yaml         | 58 +++++++++++++++++=
++
> > >  1 file changed, 58 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/touchscre=
en/adi,ad7877.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/adi,=
ad7877.yaml b/Documentation/devicetree/bindings/input/touchscreen/adi,ad787=
7.yaml
> > > new file mode 100644
> > > index 000000000000..5fc5124c5999
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.=
yaml
> > > @@ -0,0 +1,58 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/input/touchscreen/adi,ad7877.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Analog Devices AD7877 Touch Screen Controller
> > > +
> > > +maintainers:
> > > +  - Antoniu Miclaus <antoniu.miclaus@analog.com>
> > > +
> > > +description: |
> > > +  Analog Devices Touch Screen Controller
> > > +  https://www.analog.com/media/en/technical-documentation/data-sheet=
s/AD7877.pdf
> > > +
> > > +allOf:
> > > +  - $ref: touchscreen.yaml#
> > > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >=20
> > > +
> > > +unevaluatedProperties: false
> >=20
> > So, all of the properties in those two files are valid for this
> > touchscreen controller?
>=20
> No, the driver does not support transformations (swapping axes,
> inverting, etc) but that is driver limitation, not property of the
> hardware, which DT supposed to be, right?

Yeah, I'm only interested in whether or not the properties are actually
applicable to the hardware. In particular, if there are properties in
spi-peripheral-props required for functionality (eg active high cs) I
would like to see them required.

>=20
> Still I think we need to extend the driver to do that before adding DT
> match tables and adding DT bindings (or maybe together with it).
>=20
> The driver also need to have proper GPIO controller support instead of
> having ad-hoc sysfs attributes, and converting in now before there are
> mainline users would be a good time.

Do you mean that this device is a provider of GPIOs? If so, then
absolutely I would want to see gpio controller properties in the binding
here before adding support.


--A0uBSx1XFuQdwCNx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtHWjwAKCRB4tDGHoIJi
0isBAP48uEmWI6U5r9oDXiomBQN6AGXRF+1FWjY3XS1LkHRrpgD7BG62flIYjrG5
cOYNpDlHBJ+hoMM3pCF9yc+0ts3HrgI=
=7DMl
-----END PGP SIGNATURE-----

--A0uBSx1XFuQdwCNx--


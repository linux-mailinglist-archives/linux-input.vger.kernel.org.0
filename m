Return-Path: <linux-input+bounces-643-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D980B3D1
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 11:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CD7128102E
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 10:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5206913AD3;
	Sat,  9 Dec 2023 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUnmF7CD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C35671;
	Sat,  9 Dec 2023 10:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6E5C433C8;
	Sat,  9 Dec 2023 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702119426;
	bh=LfIhP/af5BHnpvQo4uP7i1HD6/yJmre7AxHGR/IvG54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUnmF7CDb4lBM7QWDc8vErl87dZFgiju4DLw8Ih0qLnT+w4aVy9wIgenKuUyH/v2X
	 D5jSkv59gp0NSY/GJSlpq+e+eLxXAn7vEpz/TvH+2I10F0pu6DWDfibGZEgrpKQ2Wl
	 Q3Uoj7/cYn3Pcq8FWY2nU7XR+nYRwn0m9wgZuMS7gWFzfcglm6ufaPsF7YdZAI5vEC
	 cCgh34qJJnPXw97CYrqSuaBYUoZCWe8I8z2q+jp6Fc4SUJ1dGpfiIYaBhRTmn1c+mh
	 hTC5LF7SvezZydDEUnCsv2gCGNwUJ1LiDDf23lCaHQvnUXUoFqVav5Uu/RnnOKEHki
	 dnSOXEc026jLg==
Date: Sat, 9 Dec 2023 10:57:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Stefan Eichenberger <eichest@gmail.com>, nick@shmanahar.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: input: atmel,maxtouch: add
 poweroff-in-suspend property
Message-ID: <20231209-sizzle-monthly-6e4f3c966b0f@spud>
References: <20231207111300.80581-1-eichest@gmail.com>
 <20231207111300.80581-2-eichest@gmail.com>
 <CACRpkdbSs-vebvchxx-Tg+O5CUF5M3vZf-iytuW=ZECnHb2anA@mail.gmail.com>
 <ZXOoy8mFdhUQsZAu@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C72rfSVWvZsQ7rnL"
Content-Disposition: inline
In-Reply-To: <ZXOoy8mFdhUQsZAu@google.com>


--C72rfSVWvZsQ7rnL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 11:37:47PM +0000, Dmitry Torokhov wrote:
> Hi Linus, Krzysztof,
>=20
> On Fri, Dec 08, 2023 at 01:54:21PM +0100, Linus Walleij wrote:
> > On Thu, Dec 7, 2023 at 12:13=E2=80=AFPM Stefan Eichenberger <eichest@gm=
ail.com> wrote:
> >=20
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > >
> > > Add a new property to indicate that the device should be powered off =
in
> > > suspend mode.
> > >
> > > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > (...)
> > > +  atmel,poweroff-in-suspend:
> > > +    description: |
> > > +      When this property is set, all supplies are turned off when th=
e system is
> > > +      going to suspend.
> > > +    type: boolean
> >    wakeup-source:
> >      type: boolean
> >=20
> > As Krzysztof says it seems you are describing an operating system featu=
re.
>=20
> It appears to be an OS feature, but I would argue that it is also a
> property of a board. It is tempting to say that if DTS defines supplies
> for the controller we should use them to power off the controller in
> suspend, otherwise we should use the deep sleep functionality of the
> controller. But a mere presence of regulators does not indicate if they
> can actually be powered off in suspend (i.e. if controllers shares power
> rails with another device that can be a wakeup source), so we need to
> have additional hints on how OS should behave on a given device.
>=20
> On top of that we have regulator framework supplying dummy regulators...

Simply rephrasing the property might be sufficient? The current one
sounds making policy decisions with the "should be". Reframing the
commit message and property description etc in terms of what aspect of
the hardware the ability to turn off all supplies in suspend comes from
would make it more acceptable. Pretty much answering the question "why
can't we try and turn off all supplies on all systems with this device"
should get things rolling.

Cheers,
Conor.

--C72rfSVWvZsQ7rnL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXRH/QAKCRB4tDGHoIJi
0gwwAP0f6ZUlt2hLfY6VvqK/jBmyh55L7p9l4zE7YNlHzIYoAgD/QhPbNUmbRBTQ
ryYrjWFFE9seO+T3W6rJ5AXJgOQskw8=
=9hx8
-----END PGP SIGNATURE-----

--C72rfSVWvZsQ7rnL--


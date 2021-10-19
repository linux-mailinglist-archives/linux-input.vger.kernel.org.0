Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33DA433235
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 11:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234840AbhJSJ3z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 05:29:55 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:51378 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbhJSJ3y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 05:29:54 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 5AB12F40C30; Tue, 19 Oct 2021 11:27:38 +0200 (CEST)
Date:   Tue, 19 Oct 2021 11:27:37 +0200
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: Re: [PATCH v3 0/4] HID: wiiu-drc: Add a driver for the Wii U gamepad
Message-ID: <20211019092737.kudgdeulghx2ig3m@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210519085924.1636-1-linkmauve@linkmauve.fr>
 <20210921150837.ingexwsauvxgluca@luna>
 <nycvar.YFH.7.76.2110191112490.12554@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ri2nmna5hervehrh"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2110191112490.12554@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ri2nmna5hervehrh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 11:14:02AM +0200, Jiri Kosina wrote:
> On Tue, 21 Sep 2021, Emmanuel Gil Peyrot wrote:
>=20
> > > This driver is for the DRC (wireless gamepad) when plugged to the DRH=
 of
> > > the Wii=C2=A0U, a chip exposing it as a USB device.
> >=20
> > Hi, I=E2=80=99d like to request a review on this series.  I=E2=80=99ve =
been using it
> > with success for quite some months, and from a self-review after not
> > having touched it for as long it still looks correct. :)
> >=20
> > Thanks!
>=20
> [ CCing Daniel ]
>=20
> Thanks for the patch, and sorry for the delay in the review.

No worries. :)

>=20
> The code looks good to me, the only question/request I'd have is -- would=
=20
> it be possible to adhere to the driver naming standards, and actually=20
> incorporate the support to existing hid-nintendo driver? Or is there any=
=20
> substantial reason which I don't see why this wouldn't be a good idea?

I don=E2=80=99t see any existing driver named that way in mainline, would i=
t be
acceptable to simply rename the current patches to hid-nintendo?  What
should be done about the existing hid-wiimote driver then, should it
also be merged alongside?

Another driver I=E2=80=99d like to submit eventually is the GameCube Contro=
ller
Adapter for Wii=C2=A0U, which does exactly what its name says, but being an
external USB adapter it also works on any USB computer; would it make
sense to develop it alongside the current driver, just because it is
sold by the same company?

>=20
> Thanks,
>=20
> --=20
> Jiri Kosina
> SUSE Labs

Thanks,

--=20
Emmanuel Gil Peyrot

--ri2nmna5hervehrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmFuj4YACgkQOWgfYkb2
LpC3TwgAvRF0cMVbUFk32X/VNq7koN42sx9xKJUcfDw3gjmqQzV/kL/CtjN7KmAC
aUyrCFxyUUyzCNPhHOan+I1N+DEToVyL7wzD9Y5TocyAEpPLauOLZREt0FQoiyZU
LMEHLxiSyA+4VE/KsPcVkOJFSx8vIwLsatOUHx9oKbru3tqQ7rxk2I1N0on2Jhbm
cpbiCfveIxQEU99Q14qK7+AzRa8AHTYMgT1FfE3pCuZUc3fCY70117CoQ6w7atfP
Di060N9BDInC05LBSCA4wrAk3LRVc3MLoRQBi3rwuS3e5bjXaYPXp/87lXFLxVWf
Epvn98wTEO/IMmlvglm+D8GzOgP70Q==
=izqI
-----END PGP SIGNATURE-----

--ri2nmna5hervehrh--

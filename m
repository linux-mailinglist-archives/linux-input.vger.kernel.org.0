Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C66433261
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 11:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235082AbhJSJih (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 05:38:37 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:51476 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbhJSJig (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 05:38:36 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id CD1C2F40C30; Tue, 19 Oct 2021 11:36:20 +0200 (CEST)
Date:   Tue, 19 Oct 2021 11:36:20 +0200
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
Message-ID: <20211019093620.msk3k6cvxe3rtros@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210519085924.1636-1-linkmauve@linkmauve.fr>
 <20210921150837.ingexwsauvxgluca@luna>
 <nycvar.YFH.7.76.2110191112490.12554@cbobk.fhfr.pm>
 <20211019092737.kudgdeulghx2ig3m@luna>
 <nycvar.YFH.7.76.2110191128540.12554@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bplwbx7pdann6mqt"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2110191128540.12554@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--bplwbx7pdann6mqt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 11:30:06AM +0200, Jiri Kosina wrote:
> On Tue, 19 Oct 2021, Emmanuel Gil Peyrot wrote:
>=20
> > > The code looks good to me, the only question/request I'd have is -- w=
ould=20
> > > it be possible to adhere to the driver naming standards, and actually=
=20
> > > incorporate the support to existing hid-nintendo driver? Or is there =
any=20
> > > substantial reason which I don't see why this wouldn't be a good idea?
> >=20
> > I don=E2=80=99t see any existing driver named that way in mainline, wou=
ld it be
> > acceptable to simply rename the current patches to hid-nintendo?  What
> > should be done about the existing hid-wiimote driver then, should it
> > also be merged alongside?
>=20
> hid-nintendo has just recently been staged for 5.16 in=20
> hid.git#for-5.16/nintendo git branch. Could you please check that?

Got it, thanks!

>=20
> > Another driver I=E2=80=99d like to submit eventually is the GameCube Co=
ntroller=20
> > Adapter for Wii U, which does exactly what its name says, but being an=
=20
> > external USB adapter it also works on any USB computer; would it make=
=20
> > sense to develop it alongside the current driver, just because it is=20
> > sold by the same company?
>=20
> We generally group the support for HID devices in drivers based on the=20
> producing company, with a few exceptions where it doesn't make sense.

Would it make sense to decouple this driver from the joycon driver?  To
have some kind of sub-driver (possibly with Kconfig entries) for joycon,
wiimote, drc, gc-adapter, maybe more in the future?  I don=E2=80=99t see th=
e drc
code go well into that one C file.  I can handle the split of the joycon
into its own file if that=E2=80=99s a good way forward.

>=20
> Thanks,
>=20
> --=20
> Jiri Kosina
> SUSE Labs

--=20
Emmanuel Gil Peyrot

--bplwbx7pdann6mqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmFukZQACgkQOWgfYkb2
LpAknwgAq7GjT6h4XAqJNiGgwt/589FvRV9OyZRGhAcZu0/BrEkla1EBy2zuJxBC
C6otHBjb+iCZ2IolnU104rS32h6PQEPi1oLSWgEXkL/or7rd60DDuVf6ok6VMuz/
kmQ20z85WWlEF52WXFJd6vOYHskX4NFbV8yI/lxrtpLbkNBnBIVQcHl6JPgAevzP
vA3jLoMvF4fpt7bH5T6N3Po9zuaZgxpj2dAlV9tDEZ6Evxf+jNnT/VAfo0KDxZVM
5zf7i0mq7nKxm5pTDAxVDuNd5fa6i/P7KCUo5ZBqqSOx4f+PByJTAV/MIivwNkOB
mW6GZ29H9fUW7h3RL5X5Tv2cjloHgA==
=PiJ3
-----END PGP SIGNATURE-----

--bplwbx7pdann6mqt--

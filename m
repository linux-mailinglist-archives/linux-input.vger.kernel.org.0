Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B6743451D
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 08:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhJTG1G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Oct 2021 02:27:06 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:34486 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhJTG1F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Oct 2021 02:27:05 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 72C07F40C2A; Wed, 20 Oct 2021 08:24:48 +0200 (CEST)
Date:   Wed, 20 Oct 2021 08:24:47 +0200
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: Re: [PATCH v3 0/4] HID: wiiu-drc: Add a driver for the Wii U gamepad
Message-ID: <20211020062447.mlvuji73crwdp2af@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210519085924.1636-1-linkmauve@linkmauve.fr>
 <20210921150837.ingexwsauvxgluca@luna>
 <nycvar.YFH.7.76.2110191112490.12554@cbobk.fhfr.pm>
 <20211019092737.kudgdeulghx2ig3m@luna>
 <YW9b7wMu8c4Y/lQ1@reblochon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zc2nrfvt26bkgy2u"
Content-Disposition: inline
In-Reply-To: <YW9b7wMu8c4Y/lQ1@reblochon>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--zc2nrfvt26bkgy2u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2021 at 01:59:43AM +0200, Fran=C3=A7ois-Xavier Carton wrote:
> Hi,
>=20
> On Tue, Oct 19, 2021 at 11:27:37AM +0200, Emmanuel Gil Peyrot wrote:
> > I don=E2=80=99t see any existing driver named that way in mainline, wou=
ld it be
> > acceptable to simply rename the current patches to hid-nintendo?  What
> > should be done about the existing hid-wiimote driver then, should it
> > also be merged alongside?
> >=20
> > Another driver I=E2=80=99d like to submit eventually is the GameCube Co=
ntroller
> > Adapter for Wii=C2=A0U, which does exactly what its name says, but bein=
g an
> > external USB adapter it also works on any USB computer; would it make
> > sense to develop it alongside the current driver, just because it is
> > sold by the same company?
> >=20
>=20
> FYI, I've submitted a GC adapter driver previously [1]. I've been using
> it since then; the patch still applies to recent kernels. I'd be happy
> to work towards having this driver mainlined, if there is interest for
> it.

I am definitely interested!  I have been using a user-space driver for
the time being, but that=E2=80=99s not a good solution.

>=20
> [1] https://patchwork.kernel.org/project/linux-input/list/?series=3D28285=
9&state=3D*
>=20
> Best,
> Fran=C3=A7ois-Xavier

--=20
Emmanuel Gil Peyrot

--zc2nrfvt26bkgy2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmFvti0ACgkQOWgfYkb2
LpCcswf/b8zfimgNDRXoh5QQNkaEK06rBcEINiYZIokG0T7UnaOxlTRmzroXsH0y
IB+MQ7WpmFiAetEbmLWrvnr+GQ9i3ajovLX3eyneK2PVXWfz0AIvua1ybSomJWMv
Ma1raha+Z6GR4f16ZwkFabKtAwKN34uZavNmvJcYT39hX67zfV5zJtVMc5/XxtKd
402IopRUKoeG27Do48NPqidAhqPcf3S/K6WWfkJOxrofcC2r4lOOr5W7Qqd1KwqV
nP5VckE7sb/ysZqhIB20FXRcdaTGcLMm41tiZ6Re/HglPK+BBi5DkJzakxhvDZwa
GdxOaH8Bn49pIZo1XpG2UxPO85afhg==
=1LxZ
-----END PGP SIGNATURE-----

--zc2nrfvt26bkgy2u--

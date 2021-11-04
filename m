Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD9D44521B
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 12:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhKDLYT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 07:24:19 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:50410 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhKDLYS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 07:24:18 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 60CE3F40CA3; Thu,  4 Nov 2021 12:21:38 +0100 (CET)
Date:   Thu, 4 Nov 2021 12:21:37 +0100
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
Message-ID: <20211104112137.n3q7vy23z3dztmn5@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210519085924.1636-1-linkmauve@linkmauve.fr>
 <20210921150837.ingexwsauvxgluca@luna>
 <nycvar.YFH.7.76.2110191112490.12554@cbobk.fhfr.pm>
 <20211019092737.kudgdeulghx2ig3m@luna>
 <nycvar.YFH.7.76.2110191128540.12554@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ggtwn6b6r77ez4fl"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2110191128540.12554@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ggtwn6b6r77ez4fl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 11:30:06AM +0200, Jiri Kosina wrote:
> On Tue, 19 Oct 2021, Emmanuel Gil Peyrot wrote:
[=E2=80=A6]
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

Speaking of which, would you want me to also merge hid-wiimote into
hid-nintendo?  Or is there a reason it is separate besides legacy?

--=20
Emmanuel Gil Peyrot

--ggtwn6b6r77ez4fl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmGDwj4ACgkQOWgfYkb2
LpCvqAgAp/nTe/jKWh1+xqBYTTgOrljnbXK+cwAHAPjrdMR5MmYP00vDUl8qsXIh
76uKw1UMCFeyCBNbcjMClDO0EBKsAiOvksz30FISXeNVD7Zt4YuUFjSEuTDrMefc
4dpbbOYMJFyMHf80RZyaYoLjXrXuBIfwUOyzLgwF0Cn8pklxjqbiAQYtlLbBNzUb
TVjAGNQww9XDUnNXc1QMMoQsEe+bZtTXRE155DlhLyy0eUEcM01gMBGGOtMQcPxL
uAPjyckurNPuijvJgmSKaFGKjHRxT+pFNODesqqS+hXVBL9szE8xi5JWgpAc3XTb
/SvthtiaCE7Z/PKOw95gLvPf8XqYxQ==
=Z1Ag
-----END PGP SIGNATURE-----

--ggtwn6b6r77ez4fl--

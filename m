Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E10BD43922E
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 11:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhJYJV4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 05:21:56 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54268 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbhJYJVz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 05:21:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0C7111C0B76; Mon, 25 Oct 2021 11:19:30 +0200 (CEST)
Date:   Mon, 25 Oct 2021 11:19:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
Message-ID: <20211025091929.GA5878@amd>
References: <20210908165539.3102929-3-roderick.colenbrander@sony.com>
 <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm>
 <20210927141109.GB5809@duo.ucw.cz>
 <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
 <20211013074849.GA10172@amd>
 <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2110220840340.12554@cbobk.fhfr.pm>
 <20211022072115.GA25215@amd>
 <nycvar.YFH.7.76.2110220924340.12554@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2110220931190.12554@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2110220931190.12554@cbobk.fhfr.pm>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > Pavel, another week has passed. I am considering just including the=
=20
> > > > trivial LED #define additions and take them through hid.git unless =
I hear=20
> > > > from you today.
> > >=20
> > > I'd prefer not to deal with rejects / common immutable branches / etc.
> >=20
> > I am not proposing common immutable branch; and if there are going to b=
e=20
> > trivial cotext conflicts because of that, those will be sorted out by=
=20
> > Linus without you even noticing.
> >=20
> > > You don't _need_ the defines at all
> >=20
> > As I've already pointed to you in several threads, we have quite a lot =
of=20
> > code queued that does depend on the defines.
> >=20
> > > and you don't need them in the common place.
> >=20
> > I compltely fail to see the point of having them teporarily local befor=
e=20
> > you manage to finally do something about the trivial addition to proper=
=20
> > shared header.
> >=20
> > > Just merge the patch without the defines. I'll merge the defines. Tha=
t=20
> > > seems like least complex solution to me.
> >=20
> > That would cause my tree not to build.
>=20
> In other words: could you please elaborate what exact issue are you tryin=
g=20
> to avoid by not providing your Acked-by: and letting it go through hid.gi=
t=20
> with all the rest of the code depending on it?

I'm trying to avoid merge conflict.

I believe open-coding string for a while is acceptable price to pay
for that, and I'd prefer that solution.

If you can promise that no conflicts or other problems will happen for
either me or Linus... go ahead and merge the patch.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmF2dqEACgkQMOfwapXb+vJF4wCgprbSIF2qGZRLsRaU8l8b2vol
sDEAoKKcgZjzcCkS3wfQun7XxgnFHkNn
=y5a0
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--

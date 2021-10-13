Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50BE442B979
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 09:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238595AbhJMHu5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Oct 2021 03:50:57 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39312 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238591AbhJMHu4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Oct 2021 03:50:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4299C1C0B80; Wed, 13 Oct 2021 09:48:50 +0200 (CEST)
Date:   Wed, 13 Oct 2021 09:48:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
Message-ID: <20211013074849.GA10172@amd>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
 <20210908165539.3102929-3-roderick.colenbrander@sony.com>
 <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm>
 <20210927141109.GB5809@duo.ucw.cz>
 <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > Player LEDs are commonly found on game controllers from Nintendo an=
d Sony
> > > > to indicate a player ID across a number of LEDs. For example, "Play=
er 2"
> > > > might be indicated as "-x--" on a device with 4 LEDs where "x" mean=
s on.
> > > >
> > > > This patch introduces LED_FUNCTION_PLAYER1-5 defines to properly in=
dicate
> > > > player LEDs from the kernel. Until now there was no good standard, =
which
> > > > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimot=
e and
> > > > other drivers. Moving forward new drivers should use LED_FUNCTION_P=
LAYERx.
> > > >
> > > > Note: management of Player IDs is left to user space, though a kern=
el
> > > > driver may pick a default value.
> > > >
> > > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.co=
m>
> > > > ---
> > > >  Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
> > > >  include/dt-bindings/leds/common.h      |  7 +++++++
> > > >  2 files changed, 21 insertions(+)
> > >
> > > Pavel, could you please eventually Ack this, so that I can take it
> > > together with the rest?
> >
> > I'm willing to take Documentation/leds/well-known-leds.txt part
> > through LED tree.
> >
> > I don't like the common.h change; either avoid the define or put it
> > into your local header.
>=20
> If the LED_FUNCTION_PLAYER* defines don't belong in common with the
> other LED_FUNCTION* ones, where should it go? The hid-nintendo driver
> intends to use the same defines, so defining it local to each driver
> isn't right. Not sure if there is a great place in the input system
> either (you would then have to move scrolllock and all those other LED
> definitions too.)

Ok, so let's put it in the common place. I'll take this patch through
LED tree if you resubmit it. You still may want to use local defines
so you can apply the other patches without waiting.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmFmj2AACgkQMOfwapXb+vIcKgCfUv2brRAUoAlLcPZ9dIOeK9C+
9DYAoK5HG3al5OUAkU7XD32dwuZqTRP4
=w/it
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

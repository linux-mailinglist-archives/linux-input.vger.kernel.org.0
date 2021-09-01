Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC423FD2D3
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 07:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241972AbhIAFUi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 01:20:38 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42114 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbhIAFUg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 01:20:36 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1D7AC1C0B76; Wed,  1 Sep 2021 07:19:39 +0200 (CEST)
Date:   Wed, 1 Sep 2021 07:19:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Daniel Ogorchock <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Roderick Colenbrander <thunderbird2k@gmail.com>
Subject: Re: [PATCH 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
Message-ID: <20210901051938.GA6870@amd>
References: <20210602061253.5747-1-roderick@gaikai.com>
 <20210602061253.5747-3-roderick@gaikai.com>
 <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm>
 <20210803221055.GA32527@amd>
 <CAEc3jaAoDfJD92q9q_HoFq3nsjkDqfZHu-VO+Ei8xSP8QrE8rg@mail.gmail.com>
 <CAEVj2tkfLjWKOaecY7t-idGaqjZ45wXhmjbUR87AoC2Dkm45vQ@mail.gmail.com>
 <nycvar.YFH.7.76.2108312109340.15313@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2108312109340.15313@cbobk.fhfr.pm>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Do you have any recommendations on what would be an appropriate
> > function string for player indicator LEDs? Would some variant such as:
> >   "status-x"
> >   "player-status-x"
> >   "indicator-x"
> >   "player-indicator-x"
> > be more suitable? It looks like the string "status" has been used for
> > other existing LED names.

I guess "player-x" would be suitable.

> > I think we are pretty happy to use whatever naming scheme fits the
> > standards of the led subsystem's userspace api for the Nintendo/Sony
> > HID drivers, and any future game controller drivers featuring player
> > LEDs could conform to that going forward.
>=20
> Pavel, could you please take a look here, so that we can proceed with the=
=20
> patchset?

So... leds tree has just been merged:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
tags/leds-5.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a998a62be9cdb509491731ffe81575aa09943a32

It includes Documentation/leds/well-known-leds.txt file. Could a
section describing proposed naming be added there (both device and
function), with explanations what the LEDs do?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEvDWoACgkQMOfwapXb+vJCJwCgtftWVFxB6XA3HFSKDV8GL9eF
YnEAni4lhulmeFBaX7M7hp0TlQvA94Dg
=xdp8
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--

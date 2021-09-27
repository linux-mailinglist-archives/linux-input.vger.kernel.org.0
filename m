Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95829419603
	for <lists+linux-input@lfdr.de>; Mon, 27 Sep 2021 16:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbhI0OMt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Sep 2021 10:12:49 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51988 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234692AbhI0OMs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Sep 2021 10:12:48 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B9A9B1C0B7A; Mon, 27 Sep 2021 16:11:09 +0200 (CEST)
Date:   Mon, 27 Sep 2021 16:11:09 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
Message-ID: <20210927141109.GB5809@duo.ucw.cz>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
 <20210908165539.3102929-3-roderick.colenbrander@sony.com>
 <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Player LEDs are commonly found on game controllers from Nintendo and So=
ny
> > to indicate a player ID across a number of LEDs. For example, "Player 2"
> > might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> >=20
> > This patch introduces LED_FUNCTION_PLAYER1-5 defines to properly indica=
te
> > player LEDs from the kernel. Until now there was no good standard, which
> > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> > other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYE=
Rx.
> >=20
> > Note: management of Player IDs is left to user space, though a kernel
> > driver may pick a default value.
> >=20
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > ---
> >  Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
> >  include/dt-bindings/leds/common.h      |  7 +++++++
> >  2 files changed, 21 insertions(+)
>=20
> Pavel, could you please eventually Ack this, so that I can take it=20
> together with the rest?

I'm willing to take Documentation/leds/well-known-leds.txt part
through LED tree.

I don't like the common.h change; either avoid the define or put it
into your local header.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYVHQ/QAKCRAw5/Bqldv6
8jfdAKC+6OrHTwIbJHNMN9/JgYQJTqIT1wCgnX38uxoSiC1uoe4cN3xwmIhNqkg=
=w3/a
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--

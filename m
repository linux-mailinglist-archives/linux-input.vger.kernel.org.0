Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1E73DF747
	for <lists+linux-input@lfdr.de>; Wed,  4 Aug 2021 00:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbhHCWLN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 18:11:13 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42978 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhHCWLN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Aug 2021 18:11:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4F7B41C0B7A; Wed,  4 Aug 2021 00:10:57 +0200 (CEST)
Date:   Wed, 4 Aug 2021 00:10:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
Message-ID: <20210803221055.GA32527@amd>
References: <20210602061253.5747-1-roderick@gaikai.com>
 <20210602061253.5747-3-roderick@gaikai.com>
 <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >=20
> > Player LEDs are commonly found on game controllers from Nintendo and So=
ny
> > to indicate a player ID across a number of LEDs. For example, "Player 2"
> > might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> >=20
> > This patch introduces a new LED_FUNCTION_PLAYER to properly indicate
> > player LEDs from the kernel. Until now there was no good standard, which
> > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> > other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYE=
R.
> >=20
> > Note: management of Player IDs is left to user space, though a kernel
> > driver may pick a default value.
> >=20
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > ---
> >  include/dt-bindings/leds/common.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/le=
ds/common.h
> > index 52b619d44ba2..94999c250e4d 100644
> > --- a/include/dt-bindings/leds/common.h
> > +++ b/include/dt-bindings/leds/common.h
> > @@ -60,6 +60,9 @@
> >  #define LED_FUNCTION_MICMUTE "micmute"
> >  #define LED_FUNCTION_MUTE "mute"
> > =20
> > +/* Used for player LEDs as found on game controllers from e.g. Nintend=
o, Sony. */
> > +#define LED_FUNCTION_PLAYER "player"
> > +
> >  /* Miscelleaus functions. Use functions above if you can. */
> >  #define LED_FUNCTION_ACTIVITY "activity"
> >  #define LED_FUNCTION_ALARM "alarm"
>=20
> Pavel, can I please get your Ack on this one, so that I can take it with=
=20
> the rest of the series?

I'm sorry for delays.

But no, player is not suitable function. Function would be "player1"
AFAICT, right?

I'm not sure "function" is suitable here, and we may want to create
documentation like this... where it would be explained which functions
apply to which devices and what they actually mean.

Best regards,
								Pavel

-*- org -*-

It is somehow important to provide consistent interface to the
userland. LED devices have one problem there, and that is naming of
directories in /sys/class/leds. It would be nice if userland would
just know right "name" for given LED function, but situation got more
complex.

Anyway, if backwards compatibility is not an issue, new code should
use one of the "good" names from this list, and you should extend the
list where applicable.

Bad names are listed, too; in case you are writing application that
wants to use particular feature, you should probe for good name, first,
but then try the bad ones, too.

* Keyboards
 =20
Good: "input*:*:capslock"
Good: "input*:*:scrolllock"
Good: "input*:*:numlock"
Bad: "shift-key-light" (Motorola Droid 4, capslock)

Set of common keyboard LEDs, going back to PC AT or so.

Good: "platform::kbd_backlight"
Bad: "tpacpi::thinklight" (IBM/Lenovo Thinkpads)
Bad: "lp5523:kb{1,2,3,4,5,6}" (Nokia N900)

Frontlight/backlight of main keyboard.

Bad: "button-backlight" (Motorola Droid 4)

Some phones have touch buttons below screen; it is different from main
keyboard. And this is their backlight.

* Sound subsystem

Good: "platform:*:mute"
Good: "platform:*:micmute"

LEDs on notebook body, indicating that sound input / output is muted.

* System notification

Good: "status-led:{red,green,blue}" (Motorola Droid 4)
Bad: "lp5523:{r,g,b}" (Nokia N900)

Phones usually have multi-color status LED.

* Power management

Good: "platform:*:charging" (allwinner sun50i)

* Screen

Good: ":backlight" (Motorola Droid 4)


--=20
http://www.livejournal.com/~pavelmachek

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAmEJvu8ACgkQMOfwapXb+vL22ACghuoc9kA4Mx0GK2M17f6m5oex
ryUAmI/uMfZGh5UG/wI5mY9UrJgOW3A=
=2/MG
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

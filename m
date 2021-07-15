Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159803CAF69
	for <lists+linux-input@lfdr.de>; Fri, 16 Jul 2021 00:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhGOWwB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 18:52:01 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54670 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhGOWwB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 18:52:01 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0C4C81C0B82; Fri, 16 Jul 2021 00:49:06 +0200 (CEST)
Date:   Fri, 16 Jul 2021 00:49:05 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        linux-leds@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for
 headsets
Message-ID: <20210715224905.GA18180@duo.ucw.cz>
References: <20210703220202.5637-1-maxtram95@gmail.com>
 <20210703220202.5637-2-maxtram95@gmail.com>
 <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com>
 <nycvar.YFH.7.76.2107152057230.8253@cbobk.fhfr.pm>
 <YPCc/k89XNTmeKVo@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <YPCc/k89XNTmeKVo@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-07-15 13:39:26, Dmitry Torokhov wrote:
> On Thu, Jul 15, 2021 at 08:57:44PM +0200, Jiri Kosina wrote:
> > On Tue, 6 Jul 2021, Benjamin Tissoires wrote:
> >=20
> > > > A lot of USBHID headsets available on the market have LEDs that ind=
icate
> > > > ringing and off-hook states when used with VoIP applications. This
> > > > commit exposes these LEDs via the standard sysfs interface.

> > > > diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> > > > index 0b11990ade46..bc6e25b9af25 100644
> > > > --- a/drivers/input/input-leds.c
> > > > +++ b/drivers/input/input-leds.c
> > > > @@ -33,6 +33,8 @@ static const struct {
> > > >         [LED_MISC]      =3D { "misc" },
> > > >         [LED_MAIL]      =3D { "mail" },
> > > >         [LED_CHARGING]  =3D { "charging" },
> > > > +       [LED_OFFHOOK]   =3D { "offhook" },
> > >=20
> > > I am pretty sure this also needs to be reviewed by the led folks.
> > > Adding them in Cc.
> >=20
> > Can we please get Ack from the LED maintainers? Thanks.
>=20
> I do not think we should be adding more LED bits to the input
> subsystem/events; this functionality should be routed purely though LED
> subsystem. input-leds is a bridge for legacy input functionality
> reflecting it onto the newer LED subsystem.

If we do it purely through the LED subsystem, will it get trickier to
associate the devices?

Anyway, it is a headset. What does headset have to do with input
subsystem? Sounds like sound device to me... And we already have a
"micmute" LED which sounds quite similar to the "offhook" LED... no?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYPC7YQAKCRAw5/Bqldv6
8gcPAJoDbpsTmTdVpXp1Ml88kfL3fP+EawCeOSmtI7COjr20zwk8v32ccx3+yWw=
=9Htt
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

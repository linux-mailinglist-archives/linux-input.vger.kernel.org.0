Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D3937522D
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 12:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhEFKVM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 06:21:12 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:49634 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233791AbhEFKVM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 06:21:12 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id D3472F4059A; Thu,  6 May 2021 12:20:12 +0200 (CEST)
Date:   Thu, 6 May 2021 12:20:12 +0200
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] HID: wiiu-drc: Implement touch reports
Message-ID: <20210506102012.xj2kmgiiskyig6d3@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210502232836.26134-3-linkmauve@linkmauve.fr>
 <YJMfq9MbY2guEhpv@latitude>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cmnlxxyxr3u4vfon"
Content-Disposition: inline
In-Reply-To: <YJMfq9MbY2guEhpv@latitude>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--cmnlxxyxr3u4vfon
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 10:43:55PM +0000, Jonathan Neusch=C3=A4fer wrote:
> Hi,
>=20
> some more comments below. Enjoy :)
>=20
> On Mon, May 03, 2021 at 01:28:33AM +0200, Emmanuel Gil Peyrot wrote:
> > There is a 100=C3=97200 inaccessible border on each side, and the Y axi=
s is
> > inverted, these are the two main quirks of this touch panel.
>=20
> Does that mean 100 px borders left and right, and 200 px borders top and
> bottom?

Correct, I=E2=80=99ll reformulate in v2. :)

>=20
> 100=C3=97200 evokes the image of a rectangle of that size, which I found
> confusing for a moment.
>=20
> >=20
> > I=E2=80=99ve been testing with weston-simple-touch mostly, but it also =
with the
> > rest of Weston.
> >=20
> > Signed-off-by: Ash Logan <ash@heyquark.com>
> > Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> > ---
> >  drivers/hid/hid-wiiu-drc.c | 83 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 78 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/hid/hid-wiiu-drc.c b/drivers/hid/hid-wiiu-drc.c
> > index 018cbdb53a2c..77e70827c37d 100644
> > --- a/drivers/hid/hid-wiiu-drc.c
> > +++ b/drivers/hid/hid-wiiu-drc.c
> > @@ -49,13 +49,27 @@
> > =20
> >  #define BUTTON_POWER	BIT(25)
> > =20
> > +/* Touch constants */
> > +/* Resolution in pixels */
> > +#define RES_X		854
> > +#define RES_Y		480
> > +/* Display/touch size in mm */
> > +#define WIDTH		138
> > +#define HEIGHT		79
> > +#define NUM_TOUCH_POINTS 10
> > +#define MAX_TOUCH_RES	(1 << 12)
> > +#define TOUCH_BORDER_X	100
> > +#define TOUCH_BORDER_Y	200
>=20
> [...]
> > +	/* touch */
> > +	/* Average touch points for improved accuracy. */
> > +	x =3D y =3D 0;
> > +	for (i =3D 0; i < NUM_TOUCH_POINTS; i++) {
> > +		base =3D 36 + 4 * i;
> > +
> > +		x +=3D ((data[base + 1] & 0xF) << 8) | data[base];
> > +		y +=3D ((data[base + 3] & 0xF) << 8) | data[base + 2];
> > +	}
> > +	x /=3D NUM_TOUCH_POINTS;
> > +	y /=3D NUM_TOUCH_POINTS;
>=20
> Given that there are 10 possible touch points: Does the gamepad actually
> support multitouch (usefully)?
>=20
> If so, I think it would be better to report all touch points
> individually to userspace, to allow for multitouch gestures;
> userspace can still implement averaging if desired.

Sadly no, in my testing all ten reports are always within a few units
=66rom each other, even if I press two (or more) different points on the
touchscreen at the same time.

My guess would be, the firmware and report format got written before
Nintendo decided whether to go for a capacitive or resistive touch
panel, and they didn=E2=80=99t get changed once the final decision was made=
 to
go for a non-multitouch-aware resistive panel.

I=E2=80=99ll add some factual comment about this in v2.

>=20
>=20
>=20
> Thanks,
> Jonathan

Thanks!

--=20
Emmanuel Gil Peyrot

--cmnlxxyxr3u4vfon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmCTwtkACgkQOWgfYkb2
LpBkRQf/QbOY3Qhj75fRd4GHclxmA3pI/VKMJH/DeW8dQd4Veq7jagFfHXMkvOeX
CfmF2DHtUiAzzabNhBKWuHwI3uW0VntR1BpbQXMPBtmjcgqU5CyEugjQRqs37qzO
moEPS+gEXohhAM9Y8AUAizQ0O2kvx7IoUaD0E4+0N3WGT75Gn5UjnyMXU8KISp6e
tecclqfaShos32SzAw9UwB8R1yRBd5MYQfaJDw8hsklcyWpVFoZdbw+3qqnIEEMe
u+xTgsj7t6N89EQXzin2CTpz4aDO3AvrY5pCrjDt8DtrN5qz+J/i7ZCyL3cNmqZ6
tm3tYRMuZ55YenBDT31yo8uiVOyRvA==
=MwQI
-----END PGP SIGNATURE-----

--cmnlxxyxr3u4vfon--

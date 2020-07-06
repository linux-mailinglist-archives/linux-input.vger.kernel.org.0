Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FA82157F0
	for <lists+linux-input@lfdr.de>; Mon,  6 Jul 2020 15:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgGFNDq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 09:03:46 -0400
Received: from orion.archlinux.org ([88.198.91.70]:48224 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728973AbgGFNDq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 09:03:46 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id DB3691D358CC76;
        Mon,  6 Jul 2020 13:03:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.4
X-Spam-BL-Results: 
Received: from genesis (unknown [IPv6:2001:8a0:f254:2300:dad6:8c60:8394:88da])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Mon,  6 Jul 2020 13:03:42 +0000 (UTC)
Message-ID: <d462f3dc038548b09ced1a42973d767390e29635.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-hidpp: avoid repeated "multiplier = "
 log messages
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Harry Cutts <hcutts@chromium.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <6202799b-f887-a867-94b3-915607956ceb@maciej.szmigiero.name>
References: <7d2c980f071487cecfd1534adb7561b33d922af3.1593970340.git.mail@maciej.szmigiero.name>
         <2f76f069f2078b3d51533f772f1094dcc03685a3.camel@gmail.com>
         <6202799b-f887-a867-94b3-915607956ceb@maciej.szmigiero.name>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-UvB+gZ0CCUHXKiykjcZ8"
Date:   Mon, 06 Jul 2020 14:03:31 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.36.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-UvB+gZ0CCUHXKiykjcZ8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-07-06 at 14:41 +0200, Maciej S. Szmigiero wrote:
> On 06.07.2020 14:38, Filipe La=C3=ADns wrote:
> > On Sun, 2020-07-05 at 19:34 +0200, Maciej S. Szmigiero wrote:
> > > These messages appear each time the mouse wakes from sleep, in my
> > > case
> > > (Logitech M705), every minute or so.
> > > Let's downgrade them to the "debug" level so they don't fill the
> > > kernel log
> > > by default.
> > >=20
> > > While we are at it, let's make clear that this is a wheel multiplier
> > > (and
> > > not, for example, XY movement multiplier).
> > >=20
> > > Fixes: 4435ff2f09a2 ("HID: logitech: Enable high-resolution scrolling
> > > on Logitech mice")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> > > ---
> > > Sending again since the previous message bounced for most recipients.
> > >=20
> > >  drivers/hid/hid-logitech-hidpp.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> > > logitech-hidpp.c
> > > index 1e1cf8eae649..b8b53dc95e86 100644
> > > --- a/drivers/hid/hid-logitech-hidpp.c
> > > +++ b/drivers/hid/hid-logitech-hidpp.c
> > > @@ -3146,7 +3146,7 @@ static int hi_res_scroll_enable(struct
> > > hidpp_device *hidpp)
> > >  		multiplier =3D 1;
> > > =20
> > >  	hidpp->vertical_wheel_counter.wheel_multiplier =3D multiplier;
> > > -	hid_info(hidpp->hid_dev, "multiplier =3D %d\n", multiplier);
> > > +	hid_dbg(hidpp->hid_dev, "wheel multiplier =3D %d\n", multiplier);
> > >  	return 0;
> > >  }
> > > =20
> >=20
> > I have seen this being useful in some cases, however I do not have a
> > strong opinion on it. Peter would know better.
>=20
> Well, the message is not being removed, only hidden by default, so
> it doesn't fill the kernel log.
>=20
> One can still enable it at runtime if wanted.

Of course, but instructing users to do that can be annoying, especially
when you're handling a considerable volume of reports.

Anyway, I am fine with this patch, I just thought it was pertinent to
raise this point and maybe get Peter's input on this, as he will likely
be one most affected by it :)

Filipe La=C3=ADns

--=-UvB+gZ0CCUHXKiykjcZ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl8DIR0ACgkQ+JPGdIFq
qV2UKxAAg8jwkNipXO2c7sfGp894+4Rzavgx98SVkf9l+zDXVaom+geZeh8ZX7Wg
L5s1aWP1EnVJui7f/FxPQ3S5ETJwdgbxS6ZuR11ke/eMgcjY1nHJ1vgURAfDaEGR
wdBp5rSwiGSWlNlkYvLaEjEV1ZD4s0LD9MxKKoLMIBp07/N/MxlQnPBJiOpy2nQE
LtgXpApmChvFWfORNEvOLB+7PZxH84KWn+fAzdJhMpyRb9PBDeYEpI9rYDVlFQxh
tz1T/mrVZKvWPhuicw250LNCsVP5lWPvGz4m8mEgsDNA0gDJ+L/VTpjDhdXd8b+/
zfdtQHjP/7GXQL+JbfbpHf7oCTtmnykHQMP5NW7FNTviJMBKXGZrn36+YOTTKu9B
+uuM1oEZJut4geeotq3DIoqQ8xDOCL0LDtwS6EzysHWKoY9FPjYG1VfeWxnRhKuB
I43n7L/O/UeF9F4NJHiuiUFXsdUiTriyToE3v5Z6mXtnf9dVoDY2DBH31JndBD0g
drzOVtadIhnWSOxgMwniKLbU4MxS92a/O7OgOc+A/sj4o1tHII5EhhL9B6KylUSu
Bu4MEoDpzY/OCId+yOwRJyKbWyaL6WKRpP53MypldPx4oW8wNjLmlk5Vf4FpL29l
b8ZTmpGdTGlqWpZPVF+2U2uQkaw/SZ+iwj8zI3/R62D9LR7qQsY=
=r1xm
-----END PGP SIGNATURE-----

--=-UvB+gZ0CCUHXKiykjcZ8--

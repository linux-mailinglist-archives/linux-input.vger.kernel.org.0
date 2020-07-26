Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E282C22E2D8
	for <lists+linux-input@lfdr.de>; Sun, 26 Jul 2020 23:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgGZV5d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jul 2020 17:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGZV5c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jul 2020 17:57:32 -0400
Received: from gnutoo.cyberdimension.org (cyberdimension.org [IPv6:2001:910:1314:ffff::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE49C0619D2
        for <linux-input@vger.kernel.org>; Sun, 26 Jul 2020 14:57:32 -0700 (PDT)
Received: from gnutoo.cyberdimension.org (localhost [127.0.0.1])
        by cyberdimension.org (OpenSMTPD) with ESMTP id 31e918f4;
        Sun, 26 Jul 2020 21:46:50 +0000 (UTC)
Received: from primarylaptop.localdomain (localhost.localdomain [::1])
        by gnutoo.cyberdimension.org (OpenSMTPD) with ESMTP id 495b607e;
        Sun, 26 Jul 2020 21:46:50 +0000 (UTC)
Date:   Sun, 26 Jul 2020 23:42:29 +0200
From:   Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andi Shyti <andi@etezian.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org, Javi Ferrer <javi.f.o@gmail.com>
Subject: Re: [PATCH] Input: mms114: don't report 0 pressure while still
 tracking contact(s)
Message-ID: <20200726234229.4edf73b4@primarylaptop.localdomain>
In-Reply-To: <20200626000439.GA108136@koala>
References: <20200606035017.7271-1-GNUtoo@cyberdimension.org>
 <20200606181806.GR89269@dtor-ws>
 <20200612194619.0ac97cf2@primarylaptop.localdomain>
 <20200614235735.GA11069@koala>
 <20200623182540.0ed5de81@primarylaptop.localdomain>
 <20200626000439.GA108136@koala>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u0Q5Tr6rYq.bmm9sWIf+Owq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/u0Q5Tr6rYq.bmm9sWIf+Owq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jun 2020 10:04:39 +1000
Peter Hutterer <peter.hutterer@who-t.net> wrote:

> thanks for the log. Basically - the problem is that
> ABS_MT_TOUCH_MAJOR and ABS_PRESSURE are completely unrelated on the
> device and the latter has apparently random values. 1585880999.248531
> is an event where you go from almost max pressure to 0 without
> changing touch major.
I also tried not to touch the screen too hard, so it's normal to have
some pressure variation as well.

> Since pressure is more common, you'll have to expect that userspace
> may ignore major/minor and handle pressure instead where available.
> Doubly so since historically the major/minor value range has been
> completely random while pressure was at least somewhat predictable.
> In this sequence, your touch major ranges from 4-14 despite the axis
> range being 0-255.
>=20
> Historically, pressure has also been used as equivalent to touch
> size, so decoupling touch size and pressure is tricky anyway.
> Speaking from libinput's POV I would disable ABS_(MT_)PRESSURE in
> this device since it's not reliable to detect a touch. But then we'd
> still need a quirk in place to tell us what the possible touch major
> range could be to make sense of that number.
I didn't understood if I needed to do something about that patch or
not.

Here I'm mostly interested in fixing that issue for future kernels
and/or userspace input stack releases.

Am I supposed to fix the issue in userspace? Or is the advise on
libinput a way to deal with older kernel versions? Is the quirk
meant to be in Linux or in libinput?

I'm currently testing with GNU/Linux as it's faster, but eventually I'm
also interested in running Android with a Linux kernel that is as much
upstream as possible, so I also need to understand the API here: Is it
up to userspace to interpret if the values are somewhat valid, or is it
up to the kernel to return valid values?

Denis.

--Sig_/u0Q5Tr6rYq.bmm9sWIf+Owq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeC+d2+Nrp/PU3kkGX138wUF34mMFAl8d+MUACgkQX138wUF3
4mOobhAAmmEf4yFI6XsEqYdOKH4rfDgfNxRx0oJEIdjgPnO+aVl+2TMj5HUvvuvY
Rc0ZPP9209TFugwe/khIsCfvUTdcDBnzbGJZKDxQZ0Nv+bUSMvaBUlQggMl+jcxQ
BzxSMpRWECdTCdM5heIrTFrjWELstePGSn/X8P1i/rQitxBZ5Lq7Ksg1w2CGzV1t
ntZiyg8w4kFb4pkeZjHGl24Au34f6gMK5vLdQfO8fELtZMEnrC/gt+YNUE7YOlOC
62N/fYhpHRxY2zReR3u93kIIU2KoIwu9gPBuU/vzSz5eCA50fAdku1+Q+Z7iKUqV
wlKCsXlrkVgihh0BGGWRUoCNRaIl6zoxT7+//CCKoOMn6+LEvK3h5zYtVJY5+XCY
X+o32QVCJoN//QTBi7klfn0n5LNHuLA9HB8CrhLlP8hzb+6L+vcPP/yyoJ/OcbQF
J7AsLW3AbXExsL2C/xM9BWl2sxZ5mR1nHCi6Wa9ygw7Hki7l6oNXojuOrCAgRmVT
QvwitcSCrZ9mS0V8tnl1GuzL1t1gO+EY7rMk0SOvhXXtpBkzsyukIe9W3aswwP8n
DOY2IwMSG/Q314D+Yb3qTDM6bsW1/wCJIJh+Bs5+mEsASZWyWatz0kGgf7aqmo1c
Pyqr2Dyifrr2i1ZY8hr+x/7DUvR3bQBJo5h00ZDatgohaXqI6JY=
=oCwu
-----END PGP SIGNATURE-----

--Sig_/u0Q5Tr6rYq.bmm9sWIf+Owq--

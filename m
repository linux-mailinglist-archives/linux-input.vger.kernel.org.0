Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4EA3820C6
	for <lists+linux-input@lfdr.de>; Sun, 16 May 2021 22:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbhEPUHY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 May 2021 16:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbhEPUHX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 May 2021 16:07:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1736FC061573
        for <linux-input@vger.kernel.org>; Sun, 16 May 2021 13:06:08 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1liN1S-0006oR-Bw; Sun, 16 May 2021 22:05:58 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1liN1R-0008Q8-9G; Sun, 16 May 2021 22:05:57 +0200
Date:   Sun, 16 May 2021 22:05:57 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        David Herrmann <dh.herrmann@googlemail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: hid-core: Don't fail to remove a device on a signal
Message-ID: <20210516200557.oi6db5rezmobggpq@pengutronix.de>
References: <20210505205319.201563-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vgq2sfbzby6rll5p"
Content-Disposition: inline
In-Reply-To: <20210505205319.201563-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--vgq2sfbzby6rll5p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, May 05, 2021 at 10:53:19PM +0200, Uwe Kleine-K=F6nig wrote:
> The driver core ignores the return code of a remove function and
> considers a device unbound unconditionally after .remove() returns. So
> don't sleep interruptible while waiting on the mutex, as there is no
> sane way to handle an interrupt. Just returning -EINTR as was done up to
> now results in leaking resources because the hid driver's remove
> callback (or hid_hw_stop()) isn't called.
>=20
> Fixes: 4ea5454203d9 ("HID: Fix race condition between driver core and ll-=
driver")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/hid/hid-core.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 0ae9f6df59d1..4095a4db623d 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2303,12 +2303,9 @@ static int hid_device_remove(struct device *dev)
>  {
>  	struct hid_device *hdev =3D to_hid_device(dev);
>  	struct hid_driver *hdrv;
> -	int ret =3D 0;
> =20
> -	if (down_interruptible(&hdev->driver_input_lock)) {
> -		ret =3D -EINTR;
> -		goto end;
> -	}
> +	down(&hdev->driver_input_lock);
> +
>  	hdev->io_started =3D false;
> =20
>  	hdrv =3D hdev->driver;
> @@ -2323,8 +2320,8 @@ static int hid_device_remove(struct device *dev)
> =20
>  	if (!hdev->io_started)
>  		up(&hdev->driver_input_lock);
> -end:
> -	return ret;
> +
> +	return 0;
>  }
> =20
>  static ssize_t modalias_show(struct device *dev, struct device_attribute=
 *a,

apart from a whitespace difference and a different commti log this patch
is the same as Dmitry's patch that became commit f2145f8dc566 ("HID: do
not use down_interruptible() when unbinding devices").

So my patch can be disregarded.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vgq2sfbzby6rll5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCheyEACgkQwfwUeK3K
7AksGwf9GLlW7NOri+z6Q0EMBBaT8/AF9okpafHEpBvelDdZMNfUHdCnTRCYpJYt
1/LEJyPqqJ0jMs5UEdu6TDYyZK/p4N0AscjifPzBN+sgUR9ANgdN6wjR1dlAxgUv
JNdJd+fY9JL1o/gx4rUacfdn41+OIEHZyVHyTNYMK1enS8t7f+yjWYyN1VvKeVjl
6HuzMIKCp3acZI6KsAD+dLzBv/3daibwvLhiEh1MyD1SOUDWssXs6vQgplfzO75h
RBQR9LB/+kUwz5RLFzyS0fQ1eZqAY3YT23aBwtv+wTFZdSzwP/02CRCinOvnXXWl
W/51giqCUaReuMRGhVR1w6+jQN316Q==
=1/WZ
-----END PGP SIGNATURE-----

--vgq2sfbzby6rll5p--

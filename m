Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DC82CF558
	for <lists+linux-input@lfdr.de>; Fri,  4 Dec 2020 21:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730819AbgLDUKQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 15:10:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729147AbgLDUKQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Dec 2020 15:10:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7ACFC061A51
        for <linux-input@vger.kernel.org>; Fri,  4 Dec 2020 12:09:35 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1klHOU-00044M-E8; Fri, 04 Dec 2020 21:09:30 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1klHOS-00028b-4u; Fri, 04 Dec 2020 21:09:28 +0100
Date:   Fri, 4 Dec 2020 21:09:27 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alan Stern <stern@rowland.harvard.edu>, kernel@pengutronix.de,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: sa11111: make sa1111 bus's remove callback return
 void
Message-ID: <20201204200927.p354eli7uqr776sp@pengutronix.de>
References: <20201126114724.2028511-1-u.kleine-koenig@pengutronix.de>
 <X8pOiU2a6BjfFuov@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ylbalxyvhyuipbv3"
Content-Disposition: inline
In-Reply-To: <X8pOiU2a6BjfFuov@kroah.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ylbalxyvhyuipbv3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Greg,

On Fri, Dec 04, 2020 at 03:58:17PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Nov 26, 2020 at 12:47:24PM +0100, Uwe Kleine-K=F6nig wrote:
> > The driver core ignores the return value of struct device_driver::remove
> > because there is only little that can be done. To simplify the quest to
> > make this function return void, let struct sa1111_driver::remove return
> > void, too. All users already unconditionally return 0, this commit makes
> > it obvious that returning an error code is a bad idea and ensures future
> > users behave accordingly.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks, can I interpret this also as an Ack to take the change affecting
drivers/usb via Russell's tree?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ylbalxyvhyuipbv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/Kl3QACgkQwfwUeK3K
7AlmhAf9F7NmYPLA9RAjwasWctkMau78khxkjBLaMDlVTgkU2ks5nm72b6Baizsn
HKBguMwdF4uWzLd4LfifNzAsUtf3SWkcWxVpW20nH8NqFeLUuoz6u0i/JgqfaTdO
mgeqyp3pZ2SrfQz6fq2Rp83YM7VAFvVCxFaNun248simpRrW+hPsKSybO2FIgDWU
guqc8F23dbEStinvA7B5aUkvzHWvE4C4pDCBVzRWt4V8iSY8B6MbHCazRS0SKLhr
sDA4sM9DCfiDTlDz5jrhkPkMIHiYa8oq8nAQ5Fd3B4i7OUIXOo+gp4PDTuxyW8kB
7BBjNp17gStSdxi8As6ZKCP+OFvoKQ==
=8a5x
-----END PGP SIGNATURE-----

--ylbalxyvhyuipbv3--

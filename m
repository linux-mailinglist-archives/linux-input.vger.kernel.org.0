Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2347F42B960
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 09:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbhJMHnX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Oct 2021 03:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238597AbhJMHnS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Oct 2021 03:43:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEAB2C061714
        for <linux-input@vger.kernel.org>; Wed, 13 Oct 2021 00:41:15 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maYsz-0006ZE-MI; Wed, 13 Oct 2021 09:41:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maYsy-0005Go-GW; Wed, 13 Oct 2021 09:41:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maYsy-0006oG-FA; Wed, 13 Oct 2021 09:41:12 +0200
Date:   Wed, 13 Oct 2021 09:41:09 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adxl34x - fix sparse warning
Message-ID: <20211013074109.6xmsxttihev77zkg@pengutronix.de>
References: <YWZIjb91d6aAwgss@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dxyw7xunh74cjzi3"
Content-Disposition: inline
In-Reply-To: <YWZIjb91d6aAwgss@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--dxyw7xunh74cjzi3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 07:46:37PM -0700, Dmitry Torokhov wrote:
> This fixes the following warning from sparse:
>=20
>   CC [M]  drivers/input/misc/adxl34x.o
>   CHECK   drivers/input/misc/adxl34x.c
> drivers/input/misc/adxl34x.c:245:29: warning: cast to restricted __le16
> drivers/input/misc/adxl34x.c:248:29: warning: cast to restricted __le16
> drivers/input/misc/adxl34x.c:251:29: warning: cast to restricted __le16

This was introduced (I think) in commit

	e27c729219ad ("Input: add driver for ADXL345/346 Digital Accelerometers")

=2E Is this worth a Fixes: line, or mentioning in the commit log?

Other than that:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dxyw7xunh74cjzi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFmjZIACgkQwfwUeK3K
7AmCiAgAnZR6n0KE8uvnfDToSeyBPzOJ2Sz0cOG9gubTYDphEPON9ijzHmzUMjZC
+zeFOu7y+ACjNmy7ROTmlWVqc1a1XDcGUS3GqYXPYCU9yT9zXGGeiESmSSUDg4qL
xjdbSeTUdiGZD0QdHr6+rUoV3sixxKIFiEflgnw9Gnj7AbTKI+TROZKs4pnOzct3
48nj4LanWWZemcreq8upGob8KklMBsS8C1sDPE+Nv+z0B9ADsSuPIUEHejqEBiZ9
Od30WX86IE5SRm4xw2d+gP9QXNXdpqvvLxRmuK6TU4a0oF9EKbFlaiJcycSnT/ob
GX4rqsoL3Eid/Sks6g35h0m1cs+Xew==
=j53m
-----END PGP SIGNATURE-----

--dxyw7xunh74cjzi3--

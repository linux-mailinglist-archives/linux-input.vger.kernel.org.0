Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD6232828F
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 16:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237021AbhCAPdp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 10:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237297AbhCAPdn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Mar 2021 10:33:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F72AC061756
        for <linux-input@vger.kernel.org>; Mon,  1 Mar 2021 07:32:59 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lGkXX-0006po-0c; Mon, 01 Mar 2021 16:32:55 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lGkXW-0003az-CQ; Mon, 01 Mar 2021 16:32:54 +0100
Date:   Mon, 1 Mar 2021 16:32:54 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: semaphore driver_input_lock and device removal
Message-ID: <20210301153254.jygfskaqyc7cvwss@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3yy4ftg2iy5cgwvx"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--3yy4ftg2iy5cgwvx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jiri, hello Benjamin,

I'm working on making struct bus_type::remove return void (instead of
int), see for example commit 0d519e0d52ee7c532d4018b90cd0b042d374c06d
for the idea and motivation.

Looking at the function hid_device_remove() there is an error path that
makes the function return -EINTR if taking the semaphore
&hdev->driver_input_lock is interrupted.

If this exit path is taken the hid remove callback isn't called but the
driver core considers the device unbound and frees resources which might
then run into problems because the driver might continue to use these
resources.

I tried to understand how this semaphore is to be used, but I'm unsure
if if missed something. Can this semaphore just be converted to a mutex?
Or is using down() here instead the right thing to do even though down()
is deprecated according to the comment before its implementation?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3yy4ftg2iy5cgwvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmA9CSMACgkQwfwUeK3K
7AkTswf+NJ+fj5cry8TivXfuFVI651I9+K6ZkPWLMRdmhWvfRsdjk7nipwrQ0vyn
UjzHZwFXngii956CkyCG7W1gtQoXNu7mCsAN08OIiZFg3Jgz2wNRLkp3g0UWxg+m
PPfnFkY9hnLwY4ibmAyzUp/8sWnKOZNgLn9b2HyeMhMkJZ1+wHOZ1OtEXz88fh6M
0ExS0cDbdS/mI06KoEQQmRNexocGbHHWQj4fnx7MMvqIx4ID6r4FVAqf8cZwecY6
dAmq6avHFmiuFzbtwgeIUwF03BwOc/9QpxsIN8Os9/PccdNDLa+m1J9feDYaoPJz
kBU2H1zajdTEtB/QuKxeaZ8czGburA==
=zFOG
-----END PGP SIGNATURE-----

--3yy4ftg2iy5cgwvx--

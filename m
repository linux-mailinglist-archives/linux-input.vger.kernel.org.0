Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D4332C5F3
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 02:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbhCDA1F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 19:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1580080AbhCCSdK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Mar 2021 13:33:10 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F380C061760
        for <linux-input@vger.kernel.org>; Wed,  3 Mar 2021 10:32:30 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lHWIO-0000jV-5g; Wed, 03 Mar 2021 19:32:28 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lHWIK-0005YI-1p; Wed, 03 Mar 2021 19:32:24 +0100
Date:   Wed, 3 Mar 2021 19:32:23 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     jingle <jingle.wu@emc.com.tw>
Cc:     'Dmitry Torokhov' <dmitry.torokhov@gmail.com>,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: elan_i2c: failed to read report data: -71
Message-ID: <20210303183223.rtqi63hdl3a7hahv@pengutronix.de>
References: <20210302210934.iro3a6chigx72r4n@pengutronix.de>
 <016d01d70fdb$2aa48b00$7feda100$@emc.com.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rk6za3wipip7ik5e"
Content-Disposition: inline
In-Reply-To: <016d01d70fdb$2aa48b00$7feda100$@emc.com.tw>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--rk6za3wipip7ik5e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Mar 03, 2021 at 11:13:21AM +0800, jingle wrote:
> HI uwe:
>=20
> Please updates this patchs.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=
=3Dnext&id=3D056115daede8d01f71732bc7d778fb85acee8eb6
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=
=3Dnext&id=3De4c9062717feda88900b566463228d1c4910af6d

The first was one of the two patches I already tried, but the latter
indeed fixes my problem \o/.

@Dmitry: If you don't consider your tree stable, feel free to add a

	Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

to e4c9062717feda88900b566463228d1c4910af6d.

Best regards and thanks for your support,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rk6za3wipip7ik5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmA/1jQACgkQwfwUeK3K
7AnJEgf/c9P8fWuz+wcqH2E5yPhB0aMvV6iBNleYD/VW2T7oAphH68xClhykLYko
tqDuTFPt296mWEGmlqz2pmhe8fN7k0Pld9DLzNFOlFmjrtZxZYNsNQe8/OU2+1HT
xcDY0qjzcypDl7ezqRUuRiQV6LGfCxRpYyAACbEGPt+0G2/e1VlQrkExX9Ue1eeg
pwOitCxeg8ftyHLbtU5x8zXtaLxYvqoQ4c3y4SM8d9em35Zd4fxC4EdXSOnzfR3B
iMDCob46pJXiyKJ840jENBbp/FAkD1bFDbrcwj84NWMB3qkVICZ/yGOe3xra8WYC
AZatlg87qejrrWsg/X9ePODQgBZ0Rw==
=IDMw
-----END PGP SIGNATURE-----

--rk6za3wipip7ik5e--

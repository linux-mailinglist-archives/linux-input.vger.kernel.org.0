Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B7251B979
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 09:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241934AbiEEHxq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 03:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345926AbiEEHxq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 03:53:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A300447AE2
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 00:50:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nmWFM-0005HF-WA; Thu, 05 May 2022 09:50:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nmWFL-000Sy4-BP; Thu, 05 May 2022 09:49:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nmWFI-007h3U-Vd; Thu, 05 May 2022 09:49:56 +0200
Date:   Thu, 5 May 2022 09:49:56 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     "Hennerich, Michael" <Michael.Hennerich@analog.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>, Arnd Bergmann <arnd@arndb.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
Message-ID: <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
 <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wdxt4bzfauardadd"
Content-Disposition: inline
In-Reply-To: <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--wdxt4bzfauardadd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Michael,

On Thu, May 05, 2022 at 06:20:22AM +0000, Hennerich, Michael wrote:
> > -----Original Message-----
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > Sent: Mittwoch, 4. Mai 2022 10:46
> > To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Hennerich, Michael
> > <Michael.Hennerich@analog.com>
> > Cc: linux-input@vger.kernel.org; kernel@pengutronix.de; Arnd Bergmann
> > <arnd@arndb.de>
> > Subject: [PATCH] Input: adp5588-keys: Remove unused driver
> >=20
> > The last user is gone since 2018 (commit 4ba66a976072 ("arch: remove
> > blackfin port")). This is an i2c driver, so it could be used on a non-b=
lackfin
> > machine, but this driver requires platform data, so it cannot be bound =
using
> > device tree.
>=20
> Hi Uwe,
>=20
> If we start removing drivers which obviously don't have a mainline in-tre=
e user,
> we would upset up many users of these drivers.
> I agree on updating this driver to make platform data optional.
> We could provide a patch in a few days.

Just to add some background why I stumbled over this driver: On of my
current quests is to make i2c remove callbacks return void. As a
preparation for that I work on updating all i2c drivers to return 0 in
=2Eremove() to make the change to void have no side effects.

One of the offenders is drivers/gpio/gpio-adp5588.c, which in the
presence of a pdata->teardown callback might return a non-zero value
=66rom .remove(). While looking at the pdata of possible devices I only
found drivers/input/keyboard/adp5588-keys.c.

So the options for my quest are in increasing impact order:

 a) just warn if struct adp5588_gpio_platform_data::teardown fails and
    still return 0 from .remove()
 b) make struct adp5588_gpio_platform_data::teardown return void
 c) drop teardown support from adp5588_gpio_platform_data
 d) drop platform support from gpio-adp5588
 e) drop gpio-adp5588

Currently I'd go for at least d).

Having said that I think e) has a net benefit. If there is no user left
it reduces maintainance burden. If there is a user left, they hopefully
will tell us, we can restore the driver from git history and then at
least know a tester for future cleanups and changes.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wdxt4bzfauardadd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJzgaEACgkQwfwUeK3K
7AlnFwf8CWyH15PfoEmNppNjYq7Bd3OEk/TNGx00UC+c9v4NyCaZWO6y35vzl3V4
wFM474tbut/Z77gbiR7RGtdxPBVZDveS3xWh2CfPAKh2eGB8mhxAahiFLDS3OcFC
DQvytf+1RCT4vh70VfjmX0SjmUV3Iod6zlfsSUg6Ro548N0ldi4iGwcnXXoUrvAn
WqC4mcP/2sMrlm1oMs+w26v4YVznVQxRbxV1FwK2FXTE3XjJySCsvDvPL7fDrCCr
CxuaFBmrgaRQJM0K7W36apm2yJKKKfxogdgi3rk+hg+JAuNVwDq/nMYqB/nBSX2C
KHyvMP/l08ZE9DfmqkTGZIjWjxr/5Q==
=bq9v
-----END PGP SIGNATURE-----

--wdxt4bzfauardadd--

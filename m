Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817FC535A88
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 09:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbiE0Hf0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 03:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347482AbiE0HfY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 03:35:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D245F74B8
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 00:35:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuUVB-0001kG-7E; Fri, 27 May 2022 09:35:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuUV7-004pKg-RL; Fri, 27 May 2022 09:35:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuUV5-00CQ7g-Ty; Fri, 27 May 2022 09:35:11 +0200
Date:   Fri, 27 May 2022 09:35:08 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     "Hennerich, Michael" <Michael.Hennerich@analog.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
Message-ID: <20220527073508.x6ryljkozvvfvro2@pengutronix.de>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
 <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
 <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="khwdypnhucmgqq64"
Content-Disposition: inline
In-Reply-To: <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
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


--khwdypnhucmgqq64
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, May 06, 2022 at 11:57:57AM +0000, Hennerich, Michael wrote:
> > On Thu, May 05, 2022 at 06:20:22AM +0000, Hennerich, Michael wrote:
> > > If we start removing drivers which obviously don't have a mainline
> > > in-tree user, we would upset up many users of these drivers.
> > > I agree on updating this driver to make platform data optional.
> > > We could provide a patch in a few days.
> >=20
> > Just to add some background why I stumbled over this driver: On of my c=
urrent
> > quests is to make i2c remove callbacks return void. As a preparation fo=
r that I
> > work on updating all i2c drivers to return 0 in
> > .remove() to make the change to void have no side effects.
> >=20
> > One of the offenders is drivers/gpio/gpio-adp5588.c, which in the prese=
nce of a
> > pdata->teardown callback might return a non-zero value from .remove(). =
While
> > looking at the pdata of possible devices I only found
> > drivers/input/keyboard/adp5588-keys.c.
> >=20
> > So the options for my quest are in increasing impact order:
> >=20
> >  a) just warn if struct adp5588_gpio_platform_data::teardown fails and
> >     still return 0 from .remove()
> >  b) make struct adp5588_gpio_platform_data::teardown return void
> >  c) drop teardown support from adp5588_gpio_platform_data
> >  d) drop platform support from gpio-adp5588
> >  e) drop gpio-adp5588
> >=20
> > Currently I'd go for at least d).
> >=20
> > Having said that I think e) has a net benefit. If there is no user left=
 it reduces
> > maintainance burden. If there is a user left, they hopefully will tell =
us, we can
> > restore the driver from git history and then at least know a tester for=
 future
> > cleanups and changes.
>=20
> Hi Uwe,
>=20
> Thanks for the explanation.
>=20
> I know that there are users of this driver. But I admit, we should have e=
arlier
> made platform_data support optional and also add proper dt bindings.
> We're in progress doing so. And in the meanwhile, I would prefer a less
> disruptive intermediate change. For example c) with the promise we're wor=
king on d).

FTR: a part of c) hit the mailing list a few days ago. This is good
enough for my purpose, but to complete platform teardown (and setup)
support, it must be ripped from adp5588-keys.c, too. I won't do that as
it isn't in the way for my quest.

See
https://lore.kernel.org/linux-gpio/20220523083947.840708-1-u.kleine-koenig@=
pengutronix.de
for your opportunity to ack the patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--khwdypnhucmgqq64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKQfykACgkQwfwUeK3K
7AlKwgf/SF0G3zs9JrGkDPxgzbgw7NhmxEpPGfQEKeo/ecbiVkTMMvJkKx2o9Pca
LYLO6pYpdQoZUOEX52X7hgKLEFprmg4KXNh0mQav0lKkmBaa66hR12p7OWzFBedU
paGjtT/9lYA/+nlbF0lFF+LeCfe35BUFKW0QUHDO799XsPB2v1+1g1s4oqULI7nT
lI34GG2DgU3eEpQYtIQ6nePPDaePk6R2j0uImyUVXjMC6HcQDwYseCtKkU+dwbkA
xgIUu/cs3+m6lIsHtt69VUg81JOqOg+FeDVJ2q3wo79NqLOXYMSiGDoDb7/8z34C
WLg/d8tC9vBVbxCrLT+4d2az+Qp3UA==
=2Oru
-----END PGP SIGNATURE-----

--khwdypnhucmgqq64--

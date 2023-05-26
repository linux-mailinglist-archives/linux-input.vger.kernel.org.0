Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280E0712A0B
	for <lists+linux-input@lfdr.de>; Fri, 26 May 2023 17:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243506AbjEZP4w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 May 2023 11:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237519AbjEZP4v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 May 2023 11:56:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EBB10A
        for <linux-input@vger.kernel.org>; Fri, 26 May 2023 08:56:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Zo8-0006tZ-R2; Fri, 26 May 2023 17:56:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Zo7-002zHL-Uq; Fri, 26 May 2023 17:56:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Zo7-008Chq-B9; Fri, 26 May 2023 17:56:47 +0200
Date:   Fri, 26 May 2023 17:56:47 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: Switch i2c drivers back to use .probe()
Message-ID: <20230526155647.vanaz65gkmo3ffgy@pengutronix.de>
References: <20230517164645.162294-1-u.kleine-koenig@pengutronix.de>
 <ZGUImQNUL9uNNHmO@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ct6hr5itey4j6a3g"
Content-Disposition: inline
In-Reply-To: <ZGUImQNUL9uNNHmO@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ct6hr5itey4j6a3g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Wed, May 17, 2023 at 10:02:17AM -0700, Dmitry Torokhov wrote:
> On Wed, May 17, 2023 at 06:46:45PM +0200, Uwe Kleine-K=F6nig wrote:
> > After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> > call-back type"), all drivers being converted to .probe_new() and then
> > 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") conve=
rt
> > back to (the new) .probe() to be able to eventually drop .probe_new() f=
rom
> > struct i2c_driver.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >=20
> > this patch was generated using coccinelle, but I aligned the result to
> > the per-file indention. Other than that it's just s/probe_new/probe/.
> >=20
> > I used v6.4-rc1 as base for it, there are a few patches in next that
> > conflict slightly with it, but for me git can sort it all out.
> > Feel free to just drop all conflicting hunks if it doesn't go so smooth
> > for you, I'll care about the fallout later.
>=20
> I think I saw only 1 clash in cyttsp5 driver, and I resolved it.
> Hopefully I did not miss anything else.
>=20
> This is now applied for the next merge window.

FTR: Looking at commit d8bde56dfd86 ("Input: Switch i2c drivers back to
use .probe()") which is in next-20230525, everything seems to be right.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ct6hr5itey4j6a3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRw1r4ACgkQj4D7WH0S
/k5gzAf9GpBSHBounN78OuLHDYc7dUbbUxo+F/SbDjohwiDTOAqI5pJ9tmH5fKFq
mXVHfuSzXvslBwNHrMDlsJVt4tY1DQ3TyhS2MSmphp0rLfEMZYDshk3PwagGxjLG
KA3YnoGzaJeMY9a7KLef5Lenx3xhxq4kmR1JMw41sDEvgAh97NJ1k5HokTHN+Z/2
vzveOM/0pDf5GuK2y+oxsQWuycBFzg43y09dK7FkrEug4SGAqgvjCiS/EQB+N9si
JAjRwOyi2Q4FY2B9VpZVWGHtE1bNeGT4DqvI5/hK14a38qoWyxtBsbWUawyGgYd+
hImSvL2U0hBDuDa8O0Zckjv2pMdxKQ==
=VLOY
-----END PGP SIGNATURE-----

--ct6hr5itey4j6a3g--

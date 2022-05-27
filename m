Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5AA535AAE
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 09:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348046AbiE0Hst (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 03:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348092AbiE0Hsr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 03:48:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D06FC4D5
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 00:48:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuUi9-0003Kk-Lf; Fri, 27 May 2022 09:48:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuUi9-004pLj-Nj; Fri, 27 May 2022 09:48:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuUi7-00CQA7-HJ; Fri, 27 May 2022 09:48:39 +0200
Date:   Fri, 27 May 2022 09:48:35 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     "Hennerich, Michael" <Michael.Hennerich@analog.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
Message-ID: <20220527074835.qnbncnc3h2iaa4ik@pengutronix.de>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
 <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
 <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220527073508.x6ryljkozvvfvro2@pengutronix.de>
 <DM8PR03MB6246C0D8B4412C710D5962338ED89@DM8PR03MB6246.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y3k6tn3rmes4hgw4"
Content-Disposition: inline
In-Reply-To: <DM8PR03MB6246C0D8B4412C710D5962338ED89@DM8PR03MB6246.namprd03.prod.outlook.com>
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


--y3k6tn3rmes4hgw4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Michael,

On Fri, May 27, 2022 at 07:41:59AM +0000, Hennerich, Michael wrote:
> Thanks for the reminder!
> The driver cleanup is still in the works. We'll likely remove the
> platform data support completely form the driver.

Still I'd like to get my patch in, as a patch I have in the queue
depends on it[1]. I don't know if you implied that my patch shouldn't go
in, but if you did, please reconsider.

Best regards
Uwe

[1] Current short diffstat is:  617 files changed, 642 insertions(+), 1724 =
deletions(-)
    all over the tree. I'm happy about every preparing patch that is in
    mainline to keep the need for synchronisation small.

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--y3k6tn3rmes4hgw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKQglEACgkQwfwUeK3K
7Antigf/bcK6lXkpQCZn/WICgUaWQGFBAl8obnOaiP2iCKRa2XZMlqbt3+Wxf1/r
fCBIqA8OeXzZ+LaUoApark6fH/0EYzxbUaAzcBhrXuJOoGDGJEwFxOrhX0ej/ZZg
xQ39lYL12iur4nNN2MLOeT7rjUr53KUPejwhWJ9OY5Xo6i6+ZUlp+wwqBptTBtco
GwetVjVXHipEG+xzuv2jt5SC2gJHV6wH0rLo/wUDsfGnZjeI7QvmPlF70thwBHj6
Mj0Ki9jpdajmOrFZITSSI1mmBv5+sdAUjP9EYJ+dmiOrLxKZ8dIscZwBYLBmj/eb
SmetSSKo+IdsoUJTLObSiTy9TOmHpg==
=YvFL
-----END PGP SIGNATURE-----

--y3k6tn3rmes4hgw4--

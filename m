Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23837A82E7
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 15:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbjITNHH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 09:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236596AbjITNGk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 09:06:40 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B06A1A5
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 06:06:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwuS-00012d-By; Wed, 20 Sep 2023 15:06:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwuQ-007h4u-K0; Wed, 20 Sep 2023 15:06:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwuQ-003IHW-Ah; Wed, 20 Sep 2023 15:06:26 +0200
Date:   Wed, 20 Sep 2023 15:06:26 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Liang He <windhl@126.com>,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH 34/52] drivers/input/serio/i8042-sparcio.h :: Convert to
 platform remove callback returning void
Message-ID: <20230920130626.42zj6pjsfnj7vhbv@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-35-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lq6j5vloikqp6hbk"
Content-Disposition: inline
In-Reply-To: <20230920125829.1478827-35-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--lq6j5vloikqp6hbk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

for this patch's Subject my git filter-branch cmdline failed. I guess it
should be something like

	input: i8042-sparcio - Convert to platform remove callback returning void

instead. I'll wait until the dust settles. In the meantime feel free to
skip this patch or adapt the Subject yourself. In the former case I'll
come back to this patch later.

Thanks and sorry for the annoyance,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lq6j5vloikqp6hbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUK7lEACgkQj4D7WH0S
/k51PAf/T79dQGPXJbN+GxdYThk+gcpi0VzwmJKpMq/gCr9n8yCKVeAlG/crvqzS
RMPbUGu64M2BnartknZFn2ot0sygIighsCFwlJmUQUAYhopoL4W83XudG+S1K2Ge
KArBctHtdMPLqcdbzOY6aiVz2TpYFn+0IZjgos43HIB25VsWDVRh6EmcJR5Q8JHP
eRt5ZzJHWrMAHs1a4OtHmew1faM+q0u4cIL5zbWHh5ALtW0D1wvlbpDo6GmJKWEy
IjnmuZ4w9stPSJ3j8yxKfOAmjvbRZU1DuuuaHWKlqqPlkdqNCIrXWCbhIlbr1qyH
0j0C3XZ7Xj/UkGe4ZG+nZaXGY05bwg==
=uBnd
-----END PGP SIGNATURE-----

--lq6j5vloikqp6hbk--

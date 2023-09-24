Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8652E7ACA9C
	for <lists+linux-input@lfdr.de>; Sun, 24 Sep 2023 17:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjIXPwG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Sep 2023 11:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjIXPwG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Sep 2023 11:52:06 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E89F1
        for <linux-input@vger.kernel.org>; Sun, 24 Sep 2023 08:51:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qkRO5-0002j6-Pr; Sun, 24 Sep 2023 17:51:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qkRNp-008fPX-Q2; Sun, 24 Sep 2023 17:50:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qkRNp-004RHy-E4; Sun, 24 Sep 2023 17:50:57 +0200
Date:   Sun, 24 Sep 2023 17:50:57 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>,
        Guenter Roeck <groeck@chromium.org>, Liang He <windhl@126.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        chrome-platform@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
        Samuel Holland <samuel@sholland.org>,
        Andrey Moiseev <o2g.org.ru@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Yangtao Li <frank.li@vivo.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
        Miloslav Trmac <mitr@volny.cz>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh@kernel.org>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Kalle Valo <kvalo@kernel.org>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Siarhei Volkau <lis8215@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benson Leung <bleung@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Paolo Abeni <pabeni@redhat.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Chen Jun <chenjun102@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel@pengutronix.de, patches@opensource.cirrus.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 00/52] input: Convert to platform remove callback
 returning void
Message-ID: <20230924155057.e4k4ruv5iggbt6q6@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <ZQ+jddG+UbuSD7pP@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w2nepdqjggoh4sie"
Content-Disposition: inline
In-Reply-To: <ZQ+jddG+UbuSD7pP@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--w2nepdqjggoh4sie
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Sat, Sep 23, 2023 at 07:48:21PM -0700, Dmitry Torokhov wrote:
> On Wed, Sep 20, 2023 at 02:57:37PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > this series converts all platform drivers below drivers/input to use
> > remove_new. The motivation is to get rid of an integer return code
> > that is (mostly) ignored by the platform driver core and error prone on
> > the driver side.
> >=20
> > See commit 5c5a7680e67b ("platform: Provide a remove callback that
> > returns no value") for an extended explanation and the eventual goal.
> >=20
> > There are no interdependencies between the patches. As there are still
> > quite a few drivers to convert, I'm happy about every patch that makes
> > it in. So even if there is a merge conflict with one patch until you
> > apply or a subject prefix is suboptimal, please apply the remainder of
> > this series anyhow.
>=20
> Applied the lot (fixing the i8042-sparcio patch subject), thank you!

Thanks. In the meantime I found out why my process failed here: I only
fixed *.c, but this driver struct is defined in a header file
i8042-sparcio.h.

This file is only included by drivers/input/serio/i8042.h which in turn
is only included by drivers/input/serio/i8042.c. So there is only one
instance created, but I'd call that unusual anyhow.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--w2nepdqjggoh4sie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUQWuAACgkQj4D7WH0S
/k4z2wf/fRpeO2RuT0KNoThVdJCLb7VTgbHa+9l0qDPdA3JAbYzxbQ6K12SP/CIT
/y1woqUQa2ATctxXvuRS1TmBlYCbX5IQB/D24pgnGlz+UOGxAoNPNd1HsFSWGnRo
Retc138nrb3r+4HCwC6nBZ9VHaYy8kZMDs121e3M/t/bwVJQROuWowsT+b9gzqD+
XSwiABX3Ij7bgUS+iwf1FN68HK10/dd/jhSPepCDr4Q+4JMDp7gus6xC5ImGlDHx
hRvacVKc88L7gt/mlcj8JDmugGjcMWAlNGxQRqrhdWC0ANnGgN5L32jbH+HGk85t
hmCwwQWgjsTehkTnb/axaDJK83wyhw==
=h4JX
-----END PGP SIGNATURE-----

--w2nepdqjggoh4sie--

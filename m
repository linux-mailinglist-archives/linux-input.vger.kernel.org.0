Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD296CB691
	for <lists+linux-input@lfdr.de>; Tue, 28 Mar 2023 08:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjC1GIg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Mar 2023 02:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC1GIg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Mar 2023 02:08:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E7830C2
        for <linux-input@vger.kernel.org>; Mon, 27 Mar 2023 23:08:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ph2VT-0005ir-PD; Tue, 28 Mar 2023 08:08:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ph2VS-007EoN-OA; Tue, 28 Mar 2023 08:08:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ph2VR-008c6e-Md; Tue, 28 Mar 2023 08:08:29 +0200
Date:   Tue, 28 Mar 2023 08:08:29 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs62x-keys - Suppress duplicated error message
 in .remove()
Message-ID: <20230328060829.tqu367vf3ewgiz6j@pengutronix.de>
References: <20230318225110.261439-1-u.kleine-koenig@pengutronix.de>
 <ZCImXFuXgh+rsRl5@nixie71>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3ylomidmgf5rj2mq"
Content-Disposition: inline
In-Reply-To: <ZCImXFuXgh+rsRl5@nixie71>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--3ylomidmgf5rj2mq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jeff,

On Mon, Mar 27, 2023 at 06:27:24PM -0500, Jeff LaBundy wrote:
> On Sat, Mar 18, 2023 at 11:51:10PM +0100, Uwe Kleine-K=F6nig wrote:
> > If a platform driver's remove callback returns non-zero the driver core
> > emits an error message. In such a case however iqs62x_keys_remove()
> > already issued a (better) message. So return zero to suppress the
> > generic message.
> >=20
> > This patch has no other side effects as platform_remove() ignores the
> > return value of .remove() after the warning.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I was traveling all last week, and therefore unable to voice my opposition
> in time. However, I figured I would still provide my feedback in case this
> change may be proposed for other cases.

It is.

> > ---
> >  drivers/input/keyboard/iqs62x-keys.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keybo=
ard/iqs62x-keys.c
> > index db793a550c25..02ceebad7bda 100644
> > --- a/drivers/input/keyboard/iqs62x-keys.c
> > +++ b/drivers/input/keyboard/iqs62x-keys.c
> > @@ -320,7 +320,7 @@ static int iqs62x_keys_remove(struct platform_devic=
e *pdev)
> >  	if (ret)
> >  		dev_err(&pdev->dev, "Failed to unregister notifier: %d\n", ret);
> > =20
> > -	return ret;
> > +	return 0;
>=20
> In my opinion, we should never silence a function's return value, especia=
lly
> in service of what is ultimately innocuous and cosmetic in nature. While =
this
> specific example is harmless today, the caller can change and hence shoul=
d be
> the only instance who decides whether the return value is important.

The caller will change. Today the caller (i.e. platform_remove()) looks
as follows:

	... if (drv->remove) {
                int ret =3D drv->remove(dev);

                if (ret)
                        dev_warn(_dev, "remove callback returned a non-zero=
 value. This will be ignored.\n");
	}

(so ret isn't used later any more). And I eventually will do

 struct platform_driver {
 ...
-	int (*remove)(struct platform_device *);
+	void (*remove)(struct platform_device *);
 ...
 }

and change platform_remove() to just:

	if (drv->remove)
		drv->remove(dev);

The change in question is a preparation for that.

The reason I tackle that is that .remove() returning an int seduces
driver authors to exit early in .remove() in the expectation that there
is error handling in the core (which there isn't).

See

	https://lore.kernel.org/linux-spi/20230317084232.142257-3-u.kleine-koenig@=
pengutronix.de

for such an issue.

> If having both fine and subsequently coarse print statements is unaccepta=
ble,
> I would have preferred to drop this driver's print statement and continue=
 to
> return ret. Or at the very least, include a comment as to why we delibera=
tely
> ignore the return value.

I have a patch series in the queue that will convert all drivers in
drivers/input to .remove_new(). (See
https://lore.kernel.org/linux-media/20230326143224.572654-9-u.kleine-koenig=
@pengutronix.de
for an example of such a conversion.) If we add such a comment now, I
will probably miss to adapt it then.

So I'm still convinced the patch I did is the right thing to do.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3ylomidmgf5rj2mq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQihFwACgkQj4D7WH0S
/k75sAf/YUSq94hrV7sTRYXQjwtjO5YQ4eTS0n2aUcFVHGUP+E2pg8dpcMxiL6a7
PGoz5SvY986djSWES94DBGhhVvza5q+YM2e7sHk3TlBQe3zjscbGHujhL8Tatx/6
Fv+Yjw64Y5whUETEK8HlJJld8OZgQMyzOkGkDGvdna1CFc8xuoUzcRYqe2lW7JBl
NvD6N1kTMHuxmx0yMtFe4mgFDbsdHTpJkeAhmVvmU9L4GCgnZpNV5pvJnaPeXvV1
DzFOgsQJa+is+t83+9W3Xb4I5Lpaw3/w6LjCDcBJ9TQSRkGkmtunYHIZvcjPopcs
AlBQL8uI5iQViTNsV4sqrD8RB6K1+A==
=M9HX
-----END PGP SIGNATURE-----

--3ylomidmgf5rj2mq--

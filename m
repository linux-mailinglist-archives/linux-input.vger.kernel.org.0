Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683E926519A
	for <lists+linux-input@lfdr.de>; Thu, 10 Sep 2020 22:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgIJU6e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Sep 2020 16:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbgIJU6L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Sep 2020 16:58:11 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E6AC061756;
        Thu, 10 Sep 2020 13:58:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id D5E5029BB25
Received: by earth.universe (Postfix, from userid 1000)
        id 35C1A3C0C84; Thu, 10 Sep 2020 22:58:06 +0200 (CEST)
Date:   Thu, 10 Sep 2020 22:58:05 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?utf-8?Q?Myl=C3=A8ne?= Josserand 
        <mylene.josserand@collabora.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
Subject: Re: [PATCHv2 3/4] Input: rotary-encoder - Use dev_err_probe
Message-ID: <20200910205805.dxtg2ugq25cr5bhx@earth.universe>
References: <20200907204045.95530-1-sebastian.reichel@collabora.com>
 <20200907204045.95530-4-sebastian.reichel@collabora.com>
 <CAL_JsqJ8E4Y-kaksCXBC=_sEf4Nz8bZr-4=_g5_PjWtQJm8jsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nx2r6g6udosrjx7z"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ8E4Y-kaksCXBC=_sEf4Nz8bZr-4=_g5_PjWtQJm8jsA@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--nx2r6g6udosrjx7z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Sep 09, 2020 at 01:48:49PM -0600, Rob Herring wrote:
> On Mon, Sep 7, 2020 at 2:40 PM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > Simplify driver a bit by making use of dev_err_probe.
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  drivers/input/misc/rotary_encoder.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/r=
otary_encoder.c
> > index e9a5dbb10513..16ad86fad7cb 100644
> > --- a/drivers/input/misc/rotary_encoder.c
> > +++ b/drivers/input/misc/rotary_encoder.c
> > @@ -241,12 +241,8 @@ static int rotary_encoder_probe(struct platform_de=
vice *pdev)
> >                 device_property_read_bool(dev, "rotary-encoder,relative=
-axis");
> >
> >         encoder->gpios =3D devm_gpiod_get_array(dev, NULL, GPIOD_IN);
> > -       if (IS_ERR(encoder->gpios)) {
> > -               err =3D PTR_ERR(encoder->gpios);
> > -               if (err !=3D -EPROBE_DEFER)
> > -                       dev_err(dev, "unable to get gpios: %d\n", err);
> > -               return err;
> > -       }
> > +       if (IS_ERR(encoder->gpios))
> > +               return dev_err_probe(dev, PTR_ERR(encoder->gpios), "una=
ble to get gpios\n");
>=20
> I hadn't seen dev_err_probe...

It got added in 5.8.

> Just FYI, I'm working on a different fix here which is to print errors
> in the subsystems instead. We already do this for IRQs, so why not
> everything else? The original reason was no resource is sometimes not
> an error, but now we have *_optional calls to handle this case for
> most all subsystems. It's a coccinelle script (hacked up from
> platform_get_irq.cocci) to convert all the drivers.

Makes sense. I suppose dev_err_probe could be used within the
framework(s) and is still useful for those resource frameworks not
having _optional variants.

FYI: There is a bunch of dev_err_probe for all kind of drivers
being send out at the moment. I already received quite a few
for the power-supply subsystem. Be prepared for conflicts.

If this is about this specific instance: No hard feelings, I
only cleaned up the driver a bit while adding new features
and being able to easily test the cleanups on real HW. With
some luck patch 4/4 applies without this one.

-- Sebastian

--nx2r6g6udosrjx7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl9ak1cACgkQ2O7X88g7
+pp3QQ/9F5JQmMwmQUV7a6kriYUD4bNkjhdlp4k+y5+pPYKbFlN+UA6kF5aeKOZW
YiYDTqPbtNfTxeYdwkky/Hq7fCigzwBpq+bunhTaMkEKHEqWTafozJS6sVP5lHTw
ZW9asjTUqHYb8FHJF9Az6k5hMpdNO1sFGBQqLIYJS38ogryLowNkodqyQB08B+Sr
wIWJ5YbqgmwAZR3ALkkwpmnIKGaPrNWXU9EEOmiQD/gfA7+/q1xFdCTyp55TJDzl
boX9ilTkXmMsAiwjEimMLqCwJWoHwBrQ7pEKS2VldVvzX1Rw967d9xO61UNa+1W/
g6XKghVfVxdzKs40AL9YoHHjwHyOQucFYy0zaGx3zTSzgAeXLO3mw69OTtxkTaya
Ed0Sd/qUT0wBizM+pub/0RT4PHvaUnSnugBq/kSRu34GEFOnKB7ekeEeW4O8P7Pl
TDKca0CNFEkW3/zSIflI5Gi1FO2hKR4ExK+sdZg9qzPHT5KHapjPpnTZHtX2BnyK
PqJ0CvPZwNzQZwrFNB7a6E+ATesCko+58Vf5SSKwgYHxCRqpvL9xV3yz6/L/4Nlh
C46/EqWha26v9QAWv6ppyokBOpSRPM1BJHaGv4iY9T775iYAHNKcVCmmNup032OX
LpUUQNly2CD0cKg5nDHkxJn5C6I0tRadu1Pu2+2zzt3VME9iUXI=
=2zx5
-----END PGP SIGNATURE-----

--nx2r6g6udosrjx7z--

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFD568616
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 11:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729496AbfGOJNo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 05:13:44 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:57195 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfGOJNo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 05:13:44 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45nHrj0mVxz1rbyD;
        Mon, 15 Jul 2019 11:13:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45nHrh6wcCz1qqkc;
        Mon, 15 Jul 2019 11:13:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id FJ6RBjVTpNF3; Mon, 15 Jul 2019 11:13:39 +0200 (CEST)
X-Auth-Info: FwZsUrqVv8+7bIWHSpdIvI/SSDmGqrvHvUfoA/HylYA=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 15 Jul 2019 11:13:39 +0200 (CEST)
Date:   Mon, 15 Jul 2019 11:13:38 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/3] input: touchscreen mc13xxx: Add mc34708 support
Message-ID: <20190715111338.3a985a4c@jawa>
In-Reply-To: <20190715070702.GA153485@dtor-ws>
References: <20190711222346.5245-1-lukma@denx.de>
        <20190711222346.5245-4-lukma@denx.de>
        <20190715070702.GA153485@dtor-ws>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vvJ=aezb1tTRL8se99FcUFZ"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/vvJ=aezb1tTRL8se99FcUFZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

> Hi Lukasz,
> =20
> On Fri, Jul 12, 2019 at 12:23:46AM +0200, Lukasz Majewski wrote:
> > From: Sascha Hauer <s.hauer@pengutronix.de>
> >=20
> > The mc34708 has a different bit to enable pen detection. This
> > adds the driver data and devtype necessary to probe the device
> > and to distinguish between the mc13783 and the mc34708.
> >=20
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >=20
> > ---
> > Changes for v2:
> > - Change nested if statements to a single one (with cr0 > ...)
> > - Replace hardcoded max resistance value (4080) with a generic
> > driver data value.
> > - Introduce new include/linux/mfd/mc34708.h header file for mc34708
> > specific defines
> > - Define as driver data mask and value for accessing mc13xxx
> > registers
> >=20
> > Changes from the original patch:
> > - Simplify the mcXXXXX_set_pen_detection functions
> > - Fix checkpatch warnings
> > ---
> >  drivers/input/touchscreen/mc13783_ts.c | 59
> > +++++++++++++++++++++++++++++++--- 1 file changed, 55
> > insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/input/touchscreen/mc13783_ts.c
> > b/drivers/input/touchscreen/mc13783_ts.c index
> > edd49e44e0c9..8fd3d0e47f57 100644 ---
> > a/drivers/input/touchscreen/mc13783_ts.c +++
> > b/drivers/input/touchscreen/mc13783_ts.c @@ -10,6 +10,7 @@
> >   */
> >  #include <linux/platform_device.h>
> >  #include <linux/mfd/mc13783.h>
> > +#include <linux/mfd/mc34708.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/input.h>
> > @@ -30,6 +31,8 @@ MODULE_PARM_DESC(sample_tolerance,
> >  		"is supposed to be wrong and is discarded.  Set to
> > 0 to " "disable this check.");
> > =20
> > +struct mc13xxx_driver_data; =20
>=20
> Why don't you define the structure here instead of sing forward
> declaration?=20

I will define the structure here.

> The structure is also commonly called as xxx_chip, so
> struct mc13xxx_chip {
> 	...
> };

Ok.

>=20
> > +
> >  struct mc13783_ts_priv {
> >  	struct input_dev *idev;
> >  	struct mc13xxx *mc13xxx;
> > @@ -37,6 +40,33 @@ struct mc13783_ts_priv {
> >  	unsigned int sample[4];
> >  	u8 ato;
> >  	bool atox;
> > +	struct mc13xxx_driver_data *drvdata; =20
>=20
> const struct mc13xxx_chip *chip;

Ok. I will adjust the name.

>=20
> > +};
> > +
> > +enum mc13xxx_type {
> > +	MC13XXX_TYPE_MC13783,
> > +	MC13XXX_TYPE_MC34708,
> > +};
> > +
> > +struct mc13xxx_driver_data {
> > +	enum mc13xxx_type type;
> > +	int max_resistance;
> > +	u32 reg_mask;
> > +	u32 reg_value;
> > +};
> > +
> > +static struct mc13xxx_driver_data mc13783_driver_data =3D {
> > +	.type =3D MC13XXX_TYPE_MC13783,
> > 	.max_resistance =3D 4096,
> > +	.reg_mask =3D MC13XXX_ADC0_TSMOD_MASK,
> > +	.reg_value =3D MC13XXX_ADC0_TSMOD0,
> > +};
> > +
> > +static struct mc13xxx_driver_data mc34708_driver_data =3D {
> > +	.type =3D MC13XXX_TYPE_MC34708,
> > +	.max_resistance =3D 4080,
> > +	.reg_mask =3D MC34708_ADC0_TSMASK,
> > +	.reg_value =3D MC34708_ADC0_TSPENDETEN,
> >  }; =20
>=20
> Have these 2 closer to the ID table.

I will move those two instances of struct mc13xxx_chip closer to the ID
table.

>=20
> > =20
> >  static irqreturn_t mc13783_ts_handler(int irq, void *data)
> > @@ -93,6 +123,10 @@ static void mc13783_ts_report_sample(struct
> > mc13783_ts_priv *priv)=20
> >  	cr0 =3D (cr0 + cr1) / 2;
> > =20
> > +	if (priv->drvdata->type =3D=3D MC13XXX_TYPE_MC34708 &&
> > +	    cr0 > priv->drvdata->max_resistance)
> > +		cr0 =3D 0; =20
>=20
> I would like to avoid the type comparisons. Given that both cr0 and
> cr1 can't be more than 4095 (because we limit them when parsing
> sampling data) I think we can simply say
>=20
> 	if (cr0 > priv->chip->max_resistance)
> 		cr0 =3D 0;

Ok.

>=20
> Thanks.
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/vvJ=aezb1tTRL8se99FcUFZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0sQ8IACgkQAR8vZIA0
zr1q6ggAgm0O7bad/curlZ5xARSCyhsO6t+yNwKyqX71v5jJsjfVTeN55P35kJ29
zI0GbTI9Nbk95h4UjT5l+8pP9DV286AJXYKegnjs35OTPSa3LPyzmfdAcHnDo+S5
ZuB0GCMG4V70P8NJ5/wrIMDvy0HyceuAiofYVVWEOwimM1YrP5IvuuqfdWr+6I0Y
oTF8CzyjO7XvXEbj4ad4N/Lp96JNf7BCSA3Kw1x52BcMTORoRsUayLC38Ch0G/wb
TFQYCKt9qZbQ42fqjYvQgtnZ9ZV55V0eBhsYUK12yINyRGLxe/qBa92A9+u8KtUW
o2uNf3t3wTUV4BULrqh39y1smYLRRA==
=iPcn
-----END PGP SIGNATURE-----

--Sig_/vvJ=aezb1tTRL8se99FcUFZ--

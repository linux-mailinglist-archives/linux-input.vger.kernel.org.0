Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2303C753BE
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 18:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388174AbfGYQUc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 12:20:32 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:46624 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387564AbfGYQUc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 12:20:32 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45vcrX3Qf0z1rC0W;
        Thu, 25 Jul 2019 18:20:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45vcrX2hWZz1qqkH;
        Thu, 25 Jul 2019 18:20:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id HEUFb3dOTyW7; Thu, 25 Jul 2019 18:20:26 +0200 (CEST)
X-Auth-Info: guacg1qZZv5IL0kMu20zrLv3McRfSpJVVlDWMBmdmbI=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 25 Jul 2019 18:20:26 +0200 (CEST)
Date:   Thu, 25 Jul 2019 18:20:20 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mfd: mc13xxx: Add mc34708 adc support
Message-ID: <20190725182020.3948c8d9@jawa>
In-Reply-To: <20190725123641.GJ23883@dell>
References: <20190717222602.2912-1-lukma@denx.de>
        <20190717222602.2912-2-lukma@denx.de>
        <20190725123641.GJ23883@dell>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tZkyfYhowXpRWsh0jAiSQ9/"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/tZkyfYhowXpRWsh0jAiSQ9/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

> On Thu, 18 Jul 2019, Lukasz Majewski wrote:
>=20
> > From: Sascha Hauer <s.hauer@pengutronix.de>
> >=20
> > The mc34708 has an improved adc. The older variants will always
> > convert a fixed order of channels. The mc34708 can do up to eight
> > conversions in arbitrary channel order. Currently this extended
> > feature is not supported. We only support touchscreen conversions
> > now, which will be sampled in a data format compatible to the older
> > chips in order to keep the API between the mfd and the touchscreen
> > driver.
> >=20
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >=20
> > ---
> > Changes for v4:
> > - None
> >=20
> > Changes for v3:
> > - None
> >=20
> > Changes for v2:
> > - Change the return code patch when the mc13xxx ADC is performing
> > conversion
> > - Introduce new include/linux/mfd/mc34708.h header file for mc34708
> > specific defines
> >=20
> > Changes from the original patches:
> > - ADC conversion functions prototypes added to fix build error
> > - Adjustments to make checkpatch clean (-ENOSYS, line over 80 char)
> >=20
> > This patch applies on top of v5.2 - SHA1:
> > 0ecfebd2b52404ae0c54a878c872bb93363ada36 ---
> >  drivers/mfd/mc13xxx-core.c  | 102
> > +++++++++++++++++++++++++++++++++++++++++++-
> > drivers/mfd/mc13xxx.h       |   3 ++ include/linux/mfd/mc34708.h |
> > 37 ++++++++++++++++ 3 files changed, 141 insertions(+), 1
> > deletion(-) create mode 100644 include/linux/mfd/mc34708.h
> >=20
> > diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
> > index 1abe7432aad8..01473d6fda21 100644
> > --- a/drivers/mfd/mc13xxx-core.c
> > +++ b/drivers/mfd/mc13xxx-core.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/mfd/core.h>
> > +#include <linux/mfd/mc34708.h>
> > =20
> >  #include "mc13xxx.h"
> > =20
> > @@ -45,6 +46,8 @@
> > =20
> >  #define MC13XXX_ADC2		45
> > =20
> > +#define MC13XXX_ADC_WORKING		(1 << 0) =20
>=20
> BIT(0) ?

The same convention - i.e. (1 << 0) is used in the rest of the file.

>=20
> >  void mc13xxx_lock(struct mc13xxx *mc13xxx)
> >  {
> >  	if (!mutex_trylock(&mc13xxx->lock)) {
> > @@ -198,22 +201,30 @@ static void mc34708_print_revision(struct
> > mc13xxx *mc13xxx, u32 revision) maskval(revision,
> > MC34708_REVISION_FAB)); }
> > =20
> > +static int mc13xxx_adc_conversion(struct mc13xxx *, unsigned int,
> > +				  unsigned int, u8, bool, unsigned
> > int *); +static int mc34708_adc_conversion(struct mc13xxx *,
> > unsigned int,
> > +				  unsigned int, u8, bool, unsigned
> > int *); +
> >  /* These are only exported for mc13xxx-i2c and mc13xxx-spi */
> >  struct mc13xxx_variant mc13xxx_variant_mc13783 =3D {
> >  	.name =3D "mc13783",
> >  	.print_revision =3D mc13xxx_print_revision,
> > +	.adc_do_conversion =3D mc13xxx_adc_conversion,
> >  };
> >  EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13783); =20
>=20
> I'd prefer to keep the call-back functions as close to zero as
> possible.

If I may ask - what is wrong with having per device callback(s) ?

>=20
> It would be better to turn mc13xxx_adc_conversion() in to the catch
> function

Could you share any example?=20

> choose an execution route based on some platform matching.
>=20

Could you help me with giving a hint of how shall I do the "platform
matching" in this particular driver ?=20

The mc13xxx driver seems rather complex with SPI and I2C support and in
which the subdevices are added (e.g. rtc, adc, etc).

This particular patch just follows current driver design and fixes its
usability for mc13708 drvice.

> If you could do the same for print_revision too, that would be even
> better.
>=20

I would prefer to fix the driver (for mc13708) without the need to
change the working code.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/tZkyfYhowXpRWsh0jAiSQ9/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl051sQACgkQAR8vZIA0
zr37bQf/fihCUC7Q46ePMNU9EdKDchQOsRruvSq9D/fYgYY4ot4m+4tow5dIRu2q
OoZFxYr5vv2PA+lk6Wy40PxI+9J8l0IUAlTe9pz00GMGIyO16yqqEsqVusrBfP6c
tyqcF/cgnGwme66U+Zj5aQASfRX9HRn/SK7cy86YQL/i65wqmxkGKAPKdjWuaN9e
QHYbgcPFogs0DdO8sdmo2iXCiZmwIpRiGtW2nFTEpl7t+WDzn5w94CLo4VGOWnb5
CJGX5U4OCq7sRyjP+Sj9dkJTN7k4TAiYDlHH1pr+Y38RQv9ECGSA0y6J1T6FxwnK
Qp/+1yTRLQsw4T3yLCHQAxPqcTOqng==
=vXD0
-----END PGP SIGNATURE-----

--Sig_/tZkyfYhowXpRWsh0jAiSQ9/--

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7055C7F854
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2019 15:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393186AbfHBNTZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Aug 2019 09:19:25 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:44450 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393174AbfHBNTZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Aug 2019 09:19:25 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 460SRs2qrkz1rQFs;
        Fri,  2 Aug 2019 15:19:21 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 460SRs23C3z1qqkh;
        Fri,  2 Aug 2019 15:19:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id oVhibnfya8qd; Fri,  2 Aug 2019 15:19:19 +0200 (CEST)
X-Auth-Info: 9tvX0qGeQu8hDBS5PC39M2yz/zTWBr8qSiq/Qhrt6bg=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri,  2 Aug 2019 15:19:19 +0200 (CEST)
Date:   Fri, 2 Aug 2019 15:19:12 +0200
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
Message-ID: <20190802151912.26dbb296@jawa>
In-Reply-To: <20190725182020.3948c8d9@jawa>
References: <20190717222602.2912-1-lukma@denx.de>
        <20190717222602.2912-2-lukma@denx.de>
        <20190725123641.GJ23883@dell>
        <20190725182020.3948c8d9@jawa>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zmE80JuW0829EruyaBP_t4j"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/zmE80JuW0829EruyaBP_t4j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

> Hi Lee,
>=20
> > On Thu, 18 Jul 2019, Lukasz Majewski wrote:
> >  =20
> > > From: Sascha Hauer <s.hauer@pengutronix.de>
> > >=20
> > > The mc34708 has an improved adc. The older variants will always
> > > convert a fixed order of channels. The mc34708 can do up to eight
> > > conversions in arbitrary channel order. Currently this extended
> > > feature is not supported. We only support touchscreen conversions
> > > now, which will be sampled in a data format compatible to the
> > > older chips in order to keep the API between the mfd and the
> > > touchscreen driver.
> > >=20
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > >=20
> > > ---
> > > Changes for v4:
> > > - None
> > >=20
> > > Changes for v3:
> > > - None
> > >=20
> > > Changes for v2:
> > > - Change the return code patch when the mc13xxx ADC is performing
> > > conversion
> > > - Introduce new include/linux/mfd/mc34708.h header file for
> > > mc34708 specific defines
> > >=20
> > > Changes from the original patches:
> > > - ADC conversion functions prototypes added to fix build error
> > > - Adjustments to make checkpatch clean (-ENOSYS, line over 80
> > > char)
> > >=20
> > > This patch applies on top of v5.2 - SHA1:
> > > 0ecfebd2b52404ae0c54a878c872bb93363ada36 ---
> > >  drivers/mfd/mc13xxx-core.c  | 102
> > > +++++++++++++++++++++++++++++++++++++++++++-
> > > drivers/mfd/mc13xxx.h       |   3 ++ include/linux/mfd/mc34708.h |
> > > 37 ++++++++++++++++ 3 files changed, 141 insertions(+), 1
> > > deletion(-) create mode 100644 include/linux/mfd/mc34708.h
> > >=20
> > > diff --git a/drivers/mfd/mc13xxx-core.c
> > > b/drivers/mfd/mc13xxx-core.c index 1abe7432aad8..01473d6fda21
> > > 100644 --- a/drivers/mfd/mc13xxx-core.c
> > > +++ b/drivers/mfd/mc13xxx-core.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/of_device.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/mfd/core.h>
> > > +#include <linux/mfd/mc34708.h>
> > > =20
> > >  #include "mc13xxx.h"
> > > =20
> > > @@ -45,6 +46,8 @@
> > > =20
> > >  #define MC13XXX_ADC2		45
> > > =20
> > > +#define MC13XXX_ADC_WORKING		(1 << 0)   =20
> >=20
> > BIT(0) ? =20
>=20
> The same convention - i.e. (1 << 0) is used in the rest of the file.
>=20
> >  =20
> > >  void mc13xxx_lock(struct mc13xxx *mc13xxx)
> > >  {
> > >  	if (!mutex_trylock(&mc13xxx->lock)) {
> > > @@ -198,22 +201,30 @@ static void mc34708_print_revision(struct
> > > mc13xxx *mc13xxx, u32 revision) maskval(revision,
> > > MC34708_REVISION_FAB)); }
> > > =20
> > > +static int mc13xxx_adc_conversion(struct mc13xxx *, unsigned int,
> > > +				  unsigned int, u8, bool,
> > > unsigned int *); +static int mc34708_adc_conversion(struct
> > > mc13xxx *, unsigned int,
> > > +				  unsigned int, u8, bool,
> > > unsigned int *); +
> > >  /* These are only exported for mc13xxx-i2c and mc13xxx-spi */
> > >  struct mc13xxx_variant mc13xxx_variant_mc13783 =3D {
> > >  	.name =3D "mc13783",
> > >  	.print_revision =3D mc13xxx_print_revision,
> > > +	.adc_do_conversion =3D mc13xxx_adc_conversion,
> > >  };
> > >  EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13783);   =20
> >=20
> > I'd prefer to keep the call-back functions as close to zero as
> > possible. =20
>=20
> If I may ask - what is wrong with having per device callback(s) ?
>=20
> >=20
> > It would be better to turn mc13xxx_adc_conversion() in to the catch
> > function =20
>=20
> Could you share any example?=20
>=20
> > choose an execution route based on some platform matching.
> >  =20
>=20
> Could you help me with giving a hint of how shall I do the "platform
> matching" in this particular driver ?=20
>=20
> The mc13xxx driver seems rather complex with SPI and I2C support and
> in which the subdevices are added (e.g. rtc, adc, etc).
>=20
> This particular patch just follows current driver design and fixes its
> usability for mc13708 drvice.
>=20
> > If you could do the same for print_revision too, that would be even
> > better.
> >  =20
>=20
> I would prefer to fix the driver (for mc13708) without the need to
> change the working code.
>=20

Lee, would you find time to reply to this message?

>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/zmE80JuW0829EruyaBP_t4j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl1EOFAACgkQAR8vZIA0
zr1RrQgAkaqi4QhRPJw3YqkMBVlkgZlaG1nv8cETXkocLSj3pu9xyAObrunMOFDU
p0wTmW0BiTF80P2LX4a3UIu3cINVzGIdYv1tIXj1rJLEpSirVvUa/OvbuU8GDOAB
IV2AB9ojEBeDdgSjSdncqnFH8ZuWXB52uk5cQFATARw3uMUvi0gsNUjg+48T1Bgs
JLh0JGEa9KZ52OOIOrFSmHGo4UOBjAUDtf3Q1yTIQ5jQKUm/dwuKdxCYLtl7dOxc
siC5DsgauGtx+U3dPXCYahauQnjUO557c0a/uuctu+QRBkUv42kNNkud4f8GKyfP
EZB8f6jJA5yLxXqtrNl+4AAQFkjhUQ==
=TB5+
-----END PGP SIGNATURE-----

--Sig_/zmE80JuW0829EruyaBP_t4j--

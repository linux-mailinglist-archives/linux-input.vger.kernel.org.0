Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7C66B8DD
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 11:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfGQJHT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 05:07:19 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:45351 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQJHT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 05:07:19 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45pWcN21Jdz1rTYF;
        Wed, 17 Jul 2019 11:07:16 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45pWcN17bSz1qqkk;
        Wed, 17 Jul 2019 11:07:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id bUafEv2oczDA; Wed, 17 Jul 2019 11:07:14 +0200 (CEST)
X-Auth-Info: l2cC+iloM8OXQmKRxGRUhZ6HveFajU/YblcV1LyHQzY=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 17 Jul 2019 11:07:14 +0200 (CEST)
Date:   Wed, 17 Jul 2019 11:07:09 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 3/3] input: touchscreen mc13xxx: Add mc34708 support
Message-ID: <20190717110709.7ae3c9f3@jawa>
In-Reply-To: <20190717085338.GA581@penguin>
References: <20190716221929.3782-1-lukma@denx.de>
        <20190716221929.3782-4-lukma@denx.de>
        <20190717033655.GC621@penguin>
        <20190717101704.2ff4d877@jawa>
        <20190717085338.GA581@penguin>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/J3YSRAFC6/++9p0DylGe61+"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/J3YSRAFC6/++9p0DylGe61+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

> Hi Lukasz,
>=20
> On Wed, Jul 17, 2019 at 10:17:04AM +0200, Lukasz Majewski wrote:
> > Hi Dmitry,
> >  =20
> > > On Wed, Jul 17, 2019 at 12:19:29AM +0200, Lukasz Majewski wrote: =20
> > > > From: Sascha Hauer <s.hauer@pengutronix.de>
> > > >=20
> > > > The mc34708 has a different bit to enable pen detection. This
> > > > adds the driver data and devtype necessary to probe the device
> > > > and to distinguish between the mc13783 and the mc34708.
> > > >=20
> > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > >=20
> > > > ---
> > > > Changes for v3:
> > > > - Replace forward declaration of mc13xxx_driver_data with
> > > >   structure definition
> > > > - Rename mc13xxx_driver_data with mc13xxx_chip
> > > > - Move static struct mc13xxx_chip mc13783_chip and mc34708_chip
> > > >   closer to ID table
> > > > - Do not check mc13xxx device type   =20
> > >=20
> > > You do not even need to define or store the type. Once it is
> > > dropped please feel free to add =20
> >=20
> > Ok. I will remove the type definition.
> >  =20
> > >=20
> > > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > >=20
> > > and merge with the other 2 patches.
> > >  =20
> >=20
> > Ok. I will squash those three patches into a single one, add your
> > Acked-by and wait for Lee to pull this single patch to his MFD
> > tree. =20
>=20
> Sorry, it looks like there is misunderstanding. I did not ask to
> squash together the 3 patches, I meant that they can all go together
> through the same tree (MFD). That is what I meant by them being
> merged together.
>=20

Thanks for the explanation.

> Sorry for being unclear.

No problem - big thanks for very prompt review.

>=20
> Thanks.
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/J3YSRAFC6/++9p0DylGe61+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0u5T0ACgkQAR8vZIA0
zr0FkAf/byAxKc6UDdbwve8hkqfG9u3wRAtzDy75Lu+JDBEJbDSFcq5hzKd2dyqD
1eAvwzGUidwNktfvq5mA/a66/PCssfjmkIDiigdYsuACclmw/1jo1+Em25YRes/n
NfF72JfaMO4K/m71rZGWSPnQQsl00VY96rsY0dkV2M3dgy+VoB3UVRfQz8lNN8bS
6j+T/CEVzcGmbLIrLDs3r0FwHvGq5MN2fHMCd6ja3OWJfJ+0MsQuVX/tT14l5Quj
sJp6WdgaIpdRBwPCIoi69lyPz4EuBNK11XfjybN+I0Np/V6HDA8nNzxMMBpWsq2s
UxCG35VrFVyjk/p0z4MUNp+xHZd33Q==
=ldUl
-----END PGP SIGNATURE-----

--Sig_/J3YSRAFC6/++9p0DylGe61+--

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4986A28F
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 09:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfGPHDH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 03:03:07 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:38081 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbfGPHDH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 03:03:07 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45nrvX0nKYz1rKJP;
        Tue, 16 Jul 2019 09:03:04 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45nrvW6ghWz1qqkG;
        Tue, 16 Jul 2019 09:03:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 5NfD1BC2sEKW; Tue, 16 Jul 2019 09:03:02 +0200 (CEST)
X-Auth-Info: zWYz8qElVinGwJNlt81FYFozmG5qMOZDZFwkxOM8kAU=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 16 Jul 2019 09:03:02 +0200 (CEST)
Date:   Tue, 16 Jul 2019 09:02:56 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/3] input: touchscreen mc13xxx: Make platform data
 optional
Message-ID: <20190716090256.45a8ef72@jawa>
In-Reply-To: <20190715182757.GA136092@dtor-ws>
References: <20190711222346.5245-1-lukma@denx.de>
        <20190711222346.5245-3-lukma@denx.de>
        <20190715071048.GB153485@dtor-ws>
        <20190715104344.3f17b660@jawa>
        <20190715182757.GA136092@dtor-ws>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/S/G4zS2240TH5M1dL3+/d+n"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/S/G4zS2240TH5M1dL3+/d+n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

> On Mon, Jul 15, 2019 at 10:43:44AM +0200, Lukasz Majewski wrote:
> > Hi Dmitry,
> >=20
> > Thank you for your reply.
> >  =20
> > > On Fri, Jul 12, 2019 at 12:23:45AM +0200, Lukasz Majewski wrote: =20
> > > > From: Sascha Hauer <s.hauer@pengutronix.de>
> > > >=20
> > > > The platform data once was optional, make it optional again.
> > > > This is a first step towards device tree support for the mc13xxx
> > > > touchscreen driver.   =20
> > >=20
> > > I would prefer seeing it together with patches introducing device
> > > tree support. =20
> >=20
> > Ok, I will merge this patch to patch 3/3. =20
>=20
> Uh, I must be missing something, but I do not see anything dedicated
> to device tree handling in 3/3...

Yes, you are right - the 3/3 adds only IDs for mc34708 device.

The device tree conversion/handling is not planned for now.

Patches, which I've sent in this series, allow the mc34708 device to be
usable with contemporary kernel (e.g. 5.2).

>=20
> Thanks.
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/S/G4zS2240TH5M1dL3+/d+n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0tdqAACgkQAR8vZIA0
zr30pQgAgDagYgbZwHeoyVrm0adqmFFFGxmcQA+0mEyy9n5i6XMNC9lLTIvPg6+Y
I6C0QBXGGFxJQKbGHYD8sAG21Z4IUAcBmiJ7LyepYc9w2PJnHDWLqPBgWXqlB/L5
3X+lj5qYQNp7BxEuY0tJHdnFS9gzE6yK6pW85RLz5zKP8JTaqr2UE7FrIQtLM8i+
+H065ekVlplyJ8g+YLKLT0IOxnz01uqSEkAHELyGuxyMZYYOh/RxwP0URNXygFnE
VNrnGZoe4oSkf4OUoZUthZmztYj/Kr1yxjUNRR1My1CXxSctoLMUsW+xQnTYZQHR
H4lqi/mYCDM+v2YoKpXW6v7uOqUJNA==
=TSRN
-----END PGP SIGNATURE-----

--Sig_/S/G4zS2240TH5M1dL3+/d+n--

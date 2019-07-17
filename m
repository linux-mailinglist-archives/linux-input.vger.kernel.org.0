Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC266B7F1
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 10:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfGQIOx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 04:14:53 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:56252 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfGQIOx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 04:14:53 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45pVRt2k85z1rGS0;
        Wed, 17 Jul 2019 10:14:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45pVRt1kBzz1qqkk;
        Wed, 17 Jul 2019 10:14:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id cfRaDSPSiOvS; Wed, 17 Jul 2019 10:14:49 +0200 (CEST)
X-Auth-Info: lP8M1pVH1EEMoEyWbfzPY7ufAStRmZpSaEBHcUjyzIs=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 17 Jul 2019 10:14:49 +0200 (CEST)
Date:   Wed, 17 Jul 2019 10:14:43 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/3] input: touchscreen mc13xxx: Make platform data
 optional
Message-ID: <20190717101443.332d0156@jawa>
In-Reply-To: <20190717033559.GB621@penguin>
References: <20190716221929.3782-1-lukma@denx.de>
        <20190716221929.3782-3-lukma@denx.de>
        <20190717033559.GB621@penguin>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZX0WSg5BJI1.eQaW17WNKKw"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/ZX0WSg5BJI1.eQaW17WNKKw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

> On Wed, Jul 17, 2019 at 12:19:28AM +0200, Lukasz Majewski wrote:
> > From: Sascha Hauer <s.hauer@pengutronix.de>
> >=20
> > The platform data once was optional, make it optional again. This
> > is a first step towards device tree support for the mc13xxx
> > touchscreen driver.
> >=20
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > Signed-off-by: Lukasz Majewski <lukma@denx.de> =20
>=20
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20
> I suppose it will go together with the 1st patch through Lee's MFD
> tree?

I suppose that this would be the easiest way to proceed.

>=20
> Thanks.
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/ZX0WSg5BJI1.eQaW17WNKKw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0u2PMACgkQAR8vZIA0
zr1ASwgA5Y7nw/6M0mO9CcIRGZqginnHm61SLf6SErvyx5n/+F6DtcQ6z78K1swd
8y67xNJaQTy5Xv1rTe+dKhy+HoBSic4vruFXuqcqmogooJGsmL6pBc8TsJGH0QnK
b7ZbE+RBaZfM+fSytN/ECel1qNeEenqC1Q7/t1MMh3Aw0+wd04NPc1OwyvS2kYnl
HJb935RqIMfcZlL0Oj7/ST/QJeCNTwOpqKBuMKMZDZNr8Oc3Pska6z8UNzmpvcAT
JPgkg0cNPXCe6729SLjSN62c0gRCCKleuiWWy0W+P/gyW837WaI5sXE0G8Aja6/T
Dl2LKzV1Tpfbc7bC7qUNBfp80tSi9Q==
=SAyq
-----END PGP SIGNATURE-----

--Sig_/ZX0WSg5BJI1.eQaW17WNKKw--

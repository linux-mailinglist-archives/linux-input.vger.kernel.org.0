Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32EBE685A9
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 10:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729404AbfGOInz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 04:43:55 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:44569 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbfGOInz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 04:43:55 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45nHBJ2jVCz1rqRY;
        Mon, 15 Jul 2019 10:43:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45nHBJ1rXXz1qqkb;
        Mon, 15 Jul 2019 10:43:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 0WUjwxo_UzIK; Mon, 15 Jul 2019 10:43:51 +0200 (CEST)
X-Auth-Info: aufoaGurxsnTU56i78vk5pU0iO0pOtGcmmxQBqK5I0g=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 15 Jul 2019 10:43:50 +0200 (CEST)
Date:   Mon, 15 Jul 2019 10:43:44 +0200
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
Message-ID: <20190715104344.3f17b660@jawa>
In-Reply-To: <20190715071048.GB153485@dtor-ws>
References: <20190711222346.5245-1-lukma@denx.de>
        <20190711222346.5245-3-lukma@denx.de>
        <20190715071048.GB153485@dtor-ws>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wI5fB2=GD+px5yqNSN=ssGE"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/wI5fB2=GD+px5yqNSN=ssGE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thank you for your reply.

> On Fri, Jul 12, 2019 at 12:23:45AM +0200, Lukasz Majewski wrote:
> > From: Sascha Hauer <s.hauer@pengutronix.de>
> >=20
> > The platform data once was optional, make it optional again. This
> > is a first step towards device tree support for the mc13xxx
> > touchscreen driver. =20
>=20
> I would prefer seeing it together with patches introducing device tree
> support.

Ok, I will merge this patch to patch 3/3.

>=20
> Thanks.
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/wI5fB2=GD+px5yqNSN=ssGE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0sPMAACgkQAR8vZIA0
zr0wPAf/ROYmcmtX42lnrcD6g5DX74eTlwFhs9G7ptA2kZpJlmPGO1rodMjar2Fx
UYwbBT5JTrcM4MoeAVTbydxTISQPJBzXOemHfUEe5F5nRbZNwTcc+W/EuRY/+Jtk
jwMlqPiOCygNvrALj1Ekd+Tiew8S/Wo+QA/GZHU2V/B7VQs9eFA4ZgsZujBkCMaS
ovGqRSb93fP0v7SbuskxPSkBCsd3BYCmitQQIS+z7VyS0FQOLEwV9c3GTUiJaJyd
5zK2s56g/BUBLfvy3Wv80eORiOfbqKXQNBqUOBnIbmsZx7zzdit/ZTSaw32k7auC
hLP3ZEI9JOMAoGWeS2IuqbA29JBxpg==
=96sO
-----END PGP SIGNATURE-----

--Sig_/wI5fB2=GD+px5yqNSN=ssGE--

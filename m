Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B44C2EBC
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 10:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbfJAITY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 04:19:24 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:41756 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfJAITX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Oct 2019 04:19:23 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46jBxz1sRqz1rfPS;
        Tue,  1 Oct 2019 10:19:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46jBxz0tzKz1qqkJ;
        Tue,  1 Oct 2019 10:19:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 5UqoMroY0bH0; Tue,  1 Oct 2019 10:19:16 +0200 (CEST)
X-Auth-Info: 8uGd2zSasi4BZOt5q3xd6by93nPKyS29VRpdS81cGcs=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue,  1 Oct 2019 10:19:16 +0200 (CEST)
Date:   Tue, 1 Oct 2019 10:19:09 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/3] mfd: mc13xxx: Fixes and enhancements for NXP's
 mc34708
Message-ID: <20191001101909.79aacda0@jawa>
In-Reply-To: <20191001064130.GA11769@dell>
References: <20190909214440.30674-1-lukma@denx.de>
        <20190930095159.64e1001a@jawa>
        <20191001064130.GA11769@dell>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/OwH/Dd552kMbiK8hNyDRMNo"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/OwH/Dd552kMbiK8hNyDRMNo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

> On Mon, 30 Sep 2019, Lukasz Majewski wrote:
>=20
> > Dear Lee,
> >  =20
> > > This patch set provides several enhancements to mc13xxx MFD family
> > > of devices by introducing mc34708 as a separate device.
> > >=20
> > > This IC has dedicated pen detection feature, which allows better
> > > touchscreen experience.
> > >=20
> > > This is the fifth version of this code (v5).
> > > Discussion regarding previous versions can be found here:
> > > https://lkml.org/lkml/2018/4/12/351
> > > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1661934.=
html
> > > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1664296.=
html
> > > https://lkml.org/lkml/2019/7/17/705 =20
> >=20
> > Gentle ping on this patch series. It is now 3 weeks without any
> > reply... =20
>=20
> Please take note and follow the kernel release cycle.
>=20
> These patches were sent after the release of -rc7 i.e. very late
> in the release cycle and a point where most kernel maintainers stop
> reviewing/applying patches

Maybe something has changed recently, but I thought that the review is
an ongoing process (that the discussion about patches takes place all
the time to refine the code).

(and nobody expects maintainers pulling new patches after merge window).

> and start to prepare for the impending
> merge-window.
>=20
> Also, there is no such thing as a gentle ping.

I'm a bit puzzled now.=20
I do know that maintainers are overworked - and I do understand that.

However, NO reply for such a long time is at best confusing for
somebody who is willing to fix the kernel.

(Maybe this has changed too - but I do remember that there was a "rule
of thumb" to express any comment about the patch in 2 weeks time).

>  If you genuinely think
> your patches have unlikely("slipped though the gaps"), then post a
> [RESEND] complete with a note alluding your reasons doing such.
>=20

Please forgive me, but are patches from this series eligible for pulling
(to v5.4 or even next release)?

> > > Sascha Hauer (3):
> > >   mfd: mc13xxx: Add mc34708 adc support
> > >   input: touchscreen mc13xxx: Make platform data optional
> > >   input: touchscreen mc13xxx: Add mc34708 support
> > >=20
> > >  drivers/input/touchscreen/mc13783_ts.c | 63 ++++++++++++++---
> > >  drivers/mfd/mc13xxx-core.c             | 98
> > > +++++++++++++++++++++++++- include/linux/mfd/mc34708.h
> > > | 37 ++++++++++ 3 files changed, 185 insertions(+), 13
> > > deletions(-) create mode 100644 include/linux/mfd/mc34708.h =20
>=20


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/OwH/Dd552kMbiK8hNyDRMNo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2TC/0ACgkQAR8vZIA0
zr3T1AgAx+/w2FpkD+h4YUVVh0IhJqiHC2Ho3rX9Hc4qCOZ2TUt+giDv0QvwAzaZ
hMcuTZr6JwcoBtvMa2acDQgCcQr8TkywMhfOitev2ZA8jSpC3NZaXnH4aK4G2wp7
r1oA0Fnt22XVtVlpXmoktiaqVttkxImcOlI1H5UOKMr2wxZOc4/oBOG5qH2cRFvr
B4gWWaU5AGl6AkoG1/r9p/80N1w3tOnHapVJzptmKowKCoEdtFYG0pOUleFXZgAI
f55x2H62J62S8LlkWgTtSyAHmOps/Bd2SlurRWUSICR1gmVCzdz6EhMvf7KKxBOL
XUx4yTg8iv4BrW+kZ+I1yPdr0X/tFg==
=T0tY
-----END PGP SIGNATURE-----

--Sig_/OwH/Dd552kMbiK8hNyDRMNo--

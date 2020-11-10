Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813B62AD142
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 09:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgKJI02 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 03:26:28 -0500
Received: from mout.gmx.net ([212.227.15.18]:41999 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbgKJI02 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 03:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604996762;
        bh=FjV2OP4hOu5FT18Fb/hwa2a/MuQBfQcgLTm4JM1TPGQ=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=HHvk1DN/aLiv07HLQknhCoEKWqN0SxitBZlbpGItSiZnTQ6caulUt3kS48TgXzGKl
         qrtJm55hHZVyuEh6JJF1EHgD9qTgkuCWe4sU7cgPUepFlnpLKyP2ztfAKzRltQ/uj1
         dkosrLKW1fXPyELliJhNJFY4r24Wi5Qx5gG4oOSk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1kN50c0yzY-00xYEx; Tue, 10
 Nov 2020 09:26:02 +0100
Date:   Tue, 10 Nov 2020 09:25:55 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: imx50-kobo-aura: Enable eKTF2132
 touchscreen
Message-ID: <20201110082555.GA456020@latitude>
References: <20201106112412.390724-1-j.neuschaefer@gmx.net>
 <20201106112412.390724-4-j.neuschaefer@gmx.net>
 <20201110031251.GZ31601@dragon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
In-Reply-To: <20201110031251.GZ31601@dragon>
X-Provags-ID: V03:K1:vvMECXXuS0RV66PWf+a0sQDL4bAgQdO6/kZD3lnMRzbHwPfU52k
 VU9anxrS4X8/ypkrsFI9xQoBc9Gvso3BaUxk6us8ewoYjhzCUc63vKDmXR1IYKLc4XFbPUW
 lhC2c4vosP3f0Yc41Ckvi3an4UzjE5Jtl9NFpU5rQ0KzpF0Z5UCiAyEQno78oEf0gT4fMac
 vSLT9W4BD/f69YtXmFj9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HBsSQQ+0F7Y=:mySCN6DN/xrLe1EjmoG1X9
 5U8Mxf8A/mx9ZIhq3+ayvXmEqwYI7+jRjM6YLnoVjWOTRI4Rk/J6G9q+2gHTAn0bv2kSmmVow
 DkGNy7tVI27oKZrIHQoND7b8hM5IqbRpH/p8kXKdS0VlUR9bhbF4qwziJOx6KepUHdZ9KD6tv
 uNdeVRuauCibbSDiSVXxzBdBKuWx86wB/6oDJXPkv7bkiuWC+X+rysuNcZ8Y+IvaY2VqJOP8k
 tkqi1ZB2PzUxZGwuQTc5aqabXk6EwZUnzhw0fxDd9PLJCX11Jar/YeCYA+2tT96o43Mzk0N+a
 fppDYqtPhqzgg5QB/fiHyYJpLudx2LF10HIMR4gG+e8BgA1mydU0H65myzausVFykOZL2xLmb
 JkpVwNwYHPKDkg9w4VIJty5XbQ6kCUzI5RKtKHd1Lann92WeW3CrV41bgKCNwqpcRnKf/ucZI
 gPPouu7//fp5q0OEPJrcVZ5RBu8A5rnO3LI8NGW1L43qzDr08NI8ECjIOROEPpqsMM7upXMzc
 /3kzXB1LB7UJbCvQTySLTuXlH4vi/0dR2cA3tq7lNDMPb2N7ISIwcfVc/z7JTbi7PuyUEz4Zo
 JnnPvWGUAdaoaZBPtNL77E4xR4XiUGzjtiP+ShL3iy373jLg4KJIJht78vR3UPr/ptCIV4oXG
 nyWwj21kwWzqna9PZm4CsXl5uyZCcuW1DS+mDAG7LpjWrcYbF73ccOsRwi4HfQDBQuZGfpuHL
 /2xaz8AI5ZquJnYVSmcajeZ/OTvgbhyiE/opPCpx0PN5pbZuU48sLFxibrXpshDKa09wfP9Ii
 mZ4oaTC9gJaq3BcfrE5CFF+rvWh6sbLSB300MjnCz9dh4tddPqtJVZje0Rw9pKZpN5AnuYSaR
 AzlbocVt33OweJWmK+XIJXGvRnI+xbLOxKQKSCwew=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 11:12:52AM +0800, Shawn Guo wrote:
> On Fri, Nov 06, 2020 at 12:24:12PM +0100, Jonathan Neusch=C3=A4fer wrote:
=2E..
> > -	/* TODO: ektf2132 touch controller at 0x15 */
> > +	touchscreen@15 {
> > +		reg =3D <0x15>;
> > +		compatible =3D "elan,ektf2132";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_ts>;
> > +		power-gpios =3D <&gpio4 9 GPIO_ACTIVE_HIGH>;
> > +		interrupts-extended =3D <&gpio5 13 IRQ_TYPE_EDGE_FALLING>;
>=20
> It needs include of <dt-bindings/interrupt-controller/irq.h>.
>=20
>   DTC     arch/arm/boot/dts/imx50-kobo-aura.dtb
> Error: ../arch/arm/boot/dts/imx50-kobo-aura.dts:128.36-37 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:326: recipe for target 'arch/arm/boot/dts/imx50-kobo=
-aura.dtb' failed
> make[2]: *** [arch/arm/boot/dts/imx50-kobo-aura.dtb] Error 1

Ooops, indeed.

> Patch dropped.

I'll send a version 2.


Thanks,
Jonathan Neusch=C3=A4fer

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl+qTnIACgkQCDBEmo7z
X9uqmA/9E8kXt2qhUQ0hfHnqWfu14Z41HVh2ojHteWnzKoLp00hgwISY8nn5OwuR
pzEABT3YXFm2bZF7vQNhLn27/F3tcnLZhi7OLWZT5uv445+PFyeHj9YWMOjJ8tsH
LGaHZ9wOk2JFKjInsU5cX+yWgz7FOHVYsMMDEPaEOHvsCeRnEESY/AHGSpjlyBbi
66ssY0bMdaatB6U9VekvREjoJwAbrbnlXFuPr8oUzg4RowKgmPEHCpVfye87nK7z
kT1EHVzV378NPicJSC4sKT622w/c0havR36SS30ep/7vahzSdzB+k78ttCREknXg
mu6nxKBQPsG5K6FlJu4e/ZD0cKigTx+yRTwhiik5wfCQvxAj16YRPYvuJAJ0EPeS
1gGO/jlE/gHBh86K5xboGutQrr9mYGAgTNVUUqtqpFeIU0CG4ldP0q3wzst3RxLX
M87s6fF9J5N5jh/iy0cJzzo9SpyZMTL/a63GaAFi4DW1SWauLUMBBv3e8wPG5auX
IFu0n0RMkIOft/BWMmVWuSKneGksOPvvIVxfd7SU0cxhzsqtG2pOtYK8F30nLgXe
gyBA2hhl3ui6Si9dJzFs2KEcCru8CMvBOQDVT6wgm21cgSyM/iFL3TkrYR7Kvb0G
1a4KHy6gkh5KTj2XJ7aKVEVsTTYW30AkfBOoqr5Kigwi7pB5H4s=
=w7Th
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

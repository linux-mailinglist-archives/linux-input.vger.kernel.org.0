Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8791423136
	for <lists+linux-input@lfdr.de>; Tue,  5 Oct 2021 22:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbhJEUCF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Oct 2021 16:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbhJEUCE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Oct 2021 16:02:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FFFC061749
        for <linux-input@vger.kernel.org>; Tue,  5 Oct 2021 13:00:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mXqbf-0004eo-EP; Tue, 05 Oct 2021 22:00:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mXqbe-0003GD-51; Tue, 05 Oct 2021 22:00:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mXqbe-0007TC-3h; Tue, 05 Oct 2021 22:00:06 +0200
Date:   Tue, 5 Oct 2021 22:00:05 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: snvs_pwrkey - Add clk handling
Message-ID: <20211005200005.bau4trn26wu23bpw@pengutronix.de>
References: <20210922094300.354227-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6uanuh73c3ydjdqe"
Content-Disposition: inline
In-Reply-To: <20210922094300.354227-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--6uanuh73c3ydjdqe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Sep 22, 2021 at 11:43:00AM +0200, Uwe Kleine-K=F6nig wrote:
> On i.MX7S and i.MX8M* (but not i.MX6*) the pwrkey device has an
> associated clock. Accessing the registers requires that this clock is
> enabled. Binding the driver on at least i.MX7S and i.MX8MP while not
> having the clock enabled results in a complete hang of the machine.
> (This usually only happens if snvs_pwrkey is built as a module and the
> rtc-snvs driver isn't already bound because at bootup the required clk
> is on and only gets disabled when the clk framework disables unused clks
> late during boot.)
>=20
> This completes the fix in commit 135be16d3505 ("ARM: dts: imx7s: add
> snvs clock to pwrkey").
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

This patch fixes a hard machine hang that occurs on an i.MX8MP based
machine in ~10% of the boot ups. In my eyes it's suitable to be applied
before v5.14 even.

Any feedback on it?

Best regards
Uwe

> ---
>  drivers/input/keyboard/snvs_pwrkey.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboar=
d/snvs_pwrkey.c
> index 2f5e3ab5ed63..b79a559b8329 100644
> --- a/drivers/input/keyboard/snvs_pwrkey.c
> +++ b/drivers/input/keyboard/snvs_pwrkey.c
> @@ -3,6 +3,7 @@
>  // Driver for the IMX SNVS ON/OFF Power Key
>  // Copyright (C) 2015 Freescale Semiconductor, Inc. All Rights Reserved.
> =20
> +#include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -99,6 +100,11 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq,=
 void *dev_id)
>  	return IRQ_HANDLED;
>  }
> =20
> +static void imx_snvs_pwrkey_disable_clk(void *data)
> +{
> +	clk_disable_unprepare(data);
> +}
> +
>  static void imx_snvs_pwrkey_act(void *pdata)
>  {
>  	struct pwrkey_drv_data *pd =3D pdata;
> @@ -111,6 +117,7 @@ static int imx_snvs_pwrkey_probe(struct platform_devi=
ce *pdev)
>  	struct pwrkey_drv_data *pdata;
>  	struct input_dev *input;
>  	struct device_node *np;
> +	struct clk *clk;
>  	int error;
>  	u32 vid;
> =20
> @@ -134,6 +141,19 @@ static int imx_snvs_pwrkey_probe(struct platform_dev=
ice *pdev)
>  		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
>  	}
> =20
> +	clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Failed to get clock\n"=
);
> +
> +	error =3D clk_prepare_enable(clk);
> +	if (error)
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Failed to enable clock=
\n");
> +
> +	error =3D devm_add_action_or_reset(&pdev->dev, imx_snvs_pwrkey_disable_=
clk, clk);
> +	if (error)
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
> +				     "Failed to register clock cleanup handler\n");
> +
>  	pdata->wakeup =3D of_property_read_bool(np, "wakeup-source");
> =20
>  	pdata->irq =3D platform_get_irq(pdev, 0);
>=20
> base-commit: 7d2a07b769330c34b4deabeed939325c77a7ec2f
> --=20
> 2.30.2
>=20
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6uanuh73c3ydjdqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFcrsAACgkQwfwUeK3K
7AliLgf9HcZXyyKiiuzqmyUuLVvHCnFR5ouh1FaEDMOCiH+LOS9Mik/fbj+DzzBS
w2KB/vvj2VhQN+e/l13zLck79QU/0AAz2Q4cPq+Cz4xh53yY3DKjT8nhX/ztXhkd
kxjzOA+wuksNJRR371/xmx8q6em8nPJM8Yu4w37fsuPiYT5G9LPaLIQaQKl2L+nF
N3sD3iIPxCR5ELKxKKf34DJmkdVs1rgu4gB0rBbRzRBEgc2AE2cECbt8bjP2KGSq
SkymeIKdsIPFh/Z5V3RwTyD6Gi/iLx7IuNaAxBPr0mRquCiVUaAtytySWxcs/ehQ
6eWhjuUyXB7zneddYNzDMh+LrYrZ2A==
=BVLK
-----END PGP SIGNATURE-----

--6uanuh73c3ydjdqe--

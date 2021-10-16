Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0550043038F
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 18:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237808AbhJPQFf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 12:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236852AbhJPQFf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 12:05:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3E2C061570;
        Sat, 16 Oct 2021 09:03:26 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id E61251F4406A
Received: by earth.universe (Postfix, from userid 1000)
        id 4E7773C0CA8; Sat, 16 Oct 2021 18:03:22 +0200 (CEST)
Date:   Sat, 16 Oct 2021 18:03:22 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cpcap-pwrbutton - do not set input parent
 explicitly
Message-ID: <20211016160322.4mtmueo2psn7ptrs@earth.universe>
References: <YWpiZqrfC9+GQsM4@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7qspehphhsxdaadr"
Content-Disposition: inline
In-Reply-To: <YWpiZqrfC9+GQsM4@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--7qspehphhsxdaadr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 15, 2021 at 10:25:58PM -0700, Dmitry Torokhov wrote:
> We are using devm_input_allocate_device() that already sets parent
> of the input device, there is no need to do that again.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/input/misc/cpcap-pwrbutton.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/input/misc/cpcap-pwrbutton.c b/drivers/input/misc/cp=
cap-pwrbutton.c
> index 372cb44d0635..879790bbf9fe 100644
> --- a/drivers/input/misc/cpcap-pwrbutton.c
> +++ b/drivers/input/misc/cpcap-pwrbutton.c
> @@ -77,7 +77,6 @@ static int cpcap_power_button_probe(struct platform_dev=
ice *pdev)
> =20
>  	button->idev->name =3D "cpcap-pwrbutton";
>  	button->idev->phys =3D "cpcap-pwrbutton/input0";
> -	button->idev->dev.parent =3D button->dev;
>  	input_set_capability(button->idev, EV_KEY, KEY_POWER);
> =20
>  	err =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> --=20
> 2.33.0.1079.g6e70778dc9-goog
>=20
>=20
> --=20
> Dmitry

--7qspehphhsxdaadr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmFq98cACgkQ2O7X88g7
+pplaA/9G3bUP7xgLpJwy3Cr768boWbydqcNIVNorlI9alp77T2KT9wQgZTGm+oQ
0gtWqQ+078wm+IfwUvDSeDIbD4N44L2yRv4zOVgQWos/aF4Lv4f/JBv2zt7jP78q
T9EljeLZCTRVbsLZObSOspihv+5IwlrnRfkrPAmO8RIE6CzqtwAsZ2lAOLMswDfV
v/qBXFLKeKDpH/qpXZjnkBDNWj9LbUsYcMPvkkrNbHaVr/j78z6bTQ0kdYy6Lkqc
GK9NSFyZTmfF2KCrRI+13ocHdkZaX0Dk10ICnV6yCGlSek8K9wN2I2KiOdJRUoFm
ECZbqU2D6ICi3yUlT76o8IQXyYoo6WqrPSwXFFb+flGJa8WknUPfzi2PmHpZ/IzG
M3FGwVAJ3bTWC8XaqnNagzY3lKcyFJo4incRTN4nvTH44WCGeUYwYxnQVS/Vziu+
wq9Pu6JzyER23Zq9E57K+ZKF6B0NKah/+b4ppOg3HidsQhSbHjw6YgLrB95ecgrm
AfP+Fpw3SZk2f3nMdCeno+c4DeU16hGUhVnUA11Yn6a9jOfI07IO9m4lpTctPLz8
8CtR2/GapA1zvIX5h0ry2T2ajG6XtY7z7JWpr3VUzAnDnULUK1hRQ6aI4+eqXjjQ
ZwCXLJxx+vIL5gY1cX5Xgb/bYMyO9mUiC/n54sF/fCF7BZ/Fz7k=
=EbW4
-----END PGP SIGNATURE-----

--7qspehphhsxdaadr--

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA24F9E3A
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 00:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfKLXe0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 18:34:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:41982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726910AbfKLXe0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 18:34:26 -0500
Received: from earth.universe (unknown [185.216.33.116])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D7A421783;
        Tue, 12 Nov 2019 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573601665;
        bh=avE5ryt0LyUf1wbwCO+LKq0mIuRLC8Qq65aG1tM/7ek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sRlyFDfSfw1CnA1sHjNB/4oYlWPh/vWv41/IAzMqWTJt7LrYicdpJQXvee0Tykm9I
         oyR7c3Uqg3VzyC2JBJnkek0dalC12wvkmdHgAckbuc6bpDtliEevIWzT8s7VGeY1k5
         p1vr72EJZgT9TBVYQU0dqpQCuWodTc+dask0Qit8=
Received: by earth.universe (Postfix, from userid 1000)
        id 3276E3C0C78; Wed, 13 Nov 2019 00:34:21 +0100 (CET)
Date:   Wed, 13 Nov 2019 00:34:21 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1 1/3] Input: ili210x - do not retrieve/print chip
 firmware version
Message-ID: <20191112233421.eh44mv6ji2tk6ki2@earth.universe>
References: <20191112164429.11225-1-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tynyp4nbd7ljgtf3"
Content-Disposition: inline
In-Reply-To: <20191112164429.11225-1-TheSven73@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--tynyp4nbd7ljgtf3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 12, 2019 at 11:44:27AM -0500, Sven Van Asbroeck wrote:
> The driver's method to retrieve the firmware version on ili2117/
> ili2118 chip flavours is incorrect. The firmware version register
> address and layout are wrong.
>=20
> The firmware version is not actually used anywhere inside or
> outside this driver. There is a dev_dbg() print, but that is
> only visible when the developer explicitly compiles in debug
> support.
>=20
> Don't make the code more complicated to preserve a feature that
> no-one is using. Remove all code associated with chip firmware
> version.
>=20
> Link: https://lore.kernel.org/lkml/20191111181657.GA57214@dtor-ws/
> Cc: Marek Vasut <marex@denx.de>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: <linux-kernel@vger.kernel.org>
> Cc: linux-input@vger.kernel.org
> Tree: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/=
?h=3Dnext
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---

The firmware version check does one relevant thing: It tests
the I2C communication, which tends to be useful for board
bringup and development boards (which often allow to disconnect
(touch-)screens).

-- Sebastian

>  drivers/input/touchscreen/ili210x.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
>=20
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscr=
een/ili210x.c
> index 0ed6014af6d7..a6feae5ce887 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -21,15 +21,8 @@
>  /* Touchscreen commands */
>  #define REG_TOUCHDATA		0x10
>  #define REG_PANEL_INFO		0x20
> -#define REG_FIRMWARE_VERSION	0x40
>  #define REG_CALIBRATE		0xcc
> =20
> -struct firmware_version {
> -	u8 id;
> -	u8 major;
> -	u8 minor;
> -} __packed;
> -
>  struct ili2xxx_chip {
>  	int (*read_reg)(struct i2c_client *client, u8 reg,
>  			void *buf, size_t len);
> @@ -342,7 +335,6 @@ static int ili210x_i2c_probe(struct i2c_client *clien=
t,
>  	struct ili210x *priv;
>  	struct gpio_desc *reset_gpio;
>  	struct input_dev *input;
> -	struct firmware_version firmware;
>  	int error;
> =20
>  	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
> @@ -389,15 +381,6 @@ static int ili210x_i2c_probe(struct i2c_client *clie=
nt,
>  	priv->chip =3D chip;
>  	i2c_set_clientdata(client, priv);
> =20
> -	/* Get firmware version */
> -	error =3D chip->read_reg(client, REG_FIRMWARE_VERSION,
> -			       &firmware, sizeof(firmware));
> -	if (error) {
> -		dev_err(dev, "Failed to get firmware version, err: %d\n",
> -			error);
> -		return error;
> -	}
> -
>  	/* Setup input device */
>  	input->name =3D "ILI210x Touchscreen";
>  	input->id.bustype =3D BUS_I2C;
> @@ -439,10 +422,6 @@ static int ili210x_i2c_probe(struct i2c_client *clie=
nt,
>  		return error;
>  	}
> =20
> -	dev_dbg(dev,
> -		"ILI210x initialized (IRQ: %d), firmware version %d.%d.%d",
> -		client->irq, firmware.id, firmware.major, firmware.minor);
> -
>  	return 0;
>  }
> =20
> --=20
> 2.17.1
>=20

--tynyp4nbd7ljgtf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3LQXkACgkQ2O7X88g7
+poBmQ//VE9RLaWgxqVEsAsPFyMI3C7gIlrbz8SWYVC+TegFkXdGvuNaoOema632
O+hp247bYjdIHbUWFiJCaDZ0t7mcjPwfMyu1CYKxDQCaQldBTG6IED/TSufqoPwB
KdGq1GGRPLpuzkDq4n4uP3wtWYhiphlCXOO0hymPP8iZ3Ul/LLOZ9dys8W3gUw1v
XyTBMm02g17yqI2S6EwFNmf4DkfuL66/Rs42fscXjTkly0rkk4JFb6JsXHtUDOrA
j2OQBg1gEzrIWkkor1DK4HXZBpb+o7U56WoQA2VTi61CkqoGJ8snN/+AzONClCTL
Lfswv+a4RQBsQUu5oS6ePXcemdfsPYqBSp8/8mDnzOcF7/plNxawqIdWBdzq3awx
JdbQo5AWxe8iW+DeEs9rz7aHKetnXomU+uH18vPpmrZtPibcQaVaa7eNB6XUdXzG
ET/OUNVsZIVIMAoDnwOz74pvjmrCTeWVIusOk2kE5240TWuAom19tNPtvNfwhGJ5
uZoVs11lBU0bAvD4+bVZPFX7zde8dXpoh66k0VTdIiy8fM07L2EIodvmo1QTo2yJ
g+VF9GBiKl7ayydNQ7tz77R/aFKOBzQAyL8+XlBBM+3BxhPj71kJg9eOzSDLM2ty
N04jGiDauA5eeciRQTaiplnTwm7aLfTO12Tinzg1OBuqSTFNJn0=
=k1bX
-----END PGP SIGNATURE-----

--tynyp4nbd7ljgtf3--

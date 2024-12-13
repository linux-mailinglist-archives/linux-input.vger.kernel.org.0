Return-Path: <linux-input+bounces-8540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4F9F1990
	for <lists+linux-input@lfdr.de>; Sat, 14 Dec 2024 00:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AC18188617D
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 23:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B42174EF0;
	Fri, 13 Dec 2024 23:03:12 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from algol.kleine-koenig.org (algol.kleine-koenig.org [162.55.41.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98535194A45;
	Fri, 13 Dec 2024 23:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.41.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734130992; cv=none; b=X+Zx2FN1bDLo1iBWi4OzGcZZX79fLk/zUBPuD/bZTZA3q/LFeTdzWbmfrdrjUYLvbsYfYHfYKvPFqjGrw7rLeON9pa+xkZn8G05055qquxXeQKhHEJtczkBVadqiASi8ursTzQDTRu1uUADZfs89Nt98LEVF7NHgJEcT5VzBWB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734130992; c=relaxed/simple;
	bh=lk5mvp92/iXRKUxEWi9l+yTi81VmxX/RH0JhJ1goZ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUC3PMjSFvehnUZ3ZT40VChVX6LpeA0MNJaUsTxtwZzLa0QQHnOucwsMbuxlbmK+Kzgh6VPCNw1lZwkdzZS/2xNTtweF9EXEYi2ygVC5KqvYs75+8PeYnuTVxQ1ORz3XdK3USKlSNE0syLa4wMqT1DPptJIHxaoh3bMK7MGE048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=kleine-koenig.org; arc=none smtp.client-ip=162.55.41.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kleine-koenig.org
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
	id 88C0BF5334F; Sat, 14 Dec 2024 00:03:01 +0100 (CET)
Date: Sat, 14 Dec 2024 00:02:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Luwei Zhou <b45643@freescale.com>, Vipul Kumar <vipul_kumar@mentor.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] input: mma8450: Add chip ID check in probe
Message-ID: <bzzzezoon5u5pufpbkn3fnm2dtbrzatx4w4tbdstcdmowvfzzn@cplbmxtgmu6z>
References: <20241213222310.189443-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="va2ulxp2mo3losn2"
Content-Disposition: inline
In-Reply-To: <20241213222310.189443-1-Frank.Li@nxp.com>


--va2ulxp2mo3losn2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] input: mma8450: Add chip ID check in probe
MIME-Version: 1.0

Hello Frank,

On Fri, Dec 13, 2024 at 05:23:09PM -0500, Frank Li wrote:
> From: Luwei Zhou <b45643@freescale.com>
>=20
> Prevent continuous polling error logs by adding a chip ID check in the
> probe  function. This ensures the driver only proceeds when the mma8450 is
> present, avoiding issues in scenarios like missing add-on cards.
>=20
> Signed-off-by: Luwei Zhou <b45643@freescale.com>
> Signed-off-by: Fugang Duan <B38611@freescale.com>
> Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/input/misc/mma8450.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
> index 08412239b8e69..da941748ed29b 100644
> --- a/drivers/input/misc/mma8450.c
> +++ b/drivers/input/misc/mma8450.c
> @@ -38,6 +38,8 @@
> =20
>  #define MMA8450_CTRL_REG1	0x38
>  #define MMA8450_CTRL_REG2	0x39
> +#define MMA8450_ID		0xc6
> +#define MMA8450_WHO_AM_I	0x0f
> =20
>  static int mma8450_read(struct i2c_client *c, unsigned int off)
>  {
> @@ -148,8 +150,20 @@ static void mma8450_close(struct input_dev *input)
>   */
>  static int mma8450_probe(struct i2c_client *c)
>  {
> +	struct i2c_adapter *adapter =3D to_i2c_adapter(c->dev.parent);

+	struct i2c_adapter *adapter =3D c->adapter;

>  	struct input_dev *input;
> -	int err;
> +	int err, client_id;
> +
> +	err =3D i2c_check_functionality(adapter,
> +				      I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA);
> +	if (!err)
> +		return err;

How unusual. I would have expected no ! here.

> +	client_id =3D i2c_smbus_read_byte_data(c, MMA8450_WHO_AM_I);
> +	if (client_id !=3D MMA8450_ID)
> +		return dev_err_probe(&c->dev, -EINVAL,
> +				     "read chip ID 0x%x is not equal to 0x%x!\n",
> +				     client_id, MMA8450_ID);

Given that here you emit an error message, maybe add an error message
above, too?

>  	input =3D devm_input_allocate_device(&c->dev);
>  	if (!input)

Best regards
Uwe

--va2ulxp2mo3losn2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdcvR4ACgkQj4D7WH0S
/k6cUgf/aQBHQhC9Xx3XVkFm/ev+d9abFz4SzCLCfVluKVBBBQhon/7Y4CeXhHid
Swy3CWr6QSk85MTCxkrWrijEXZRiJVqS7x8knSKqzO3eB6Wo6MlhUnfJbx9u5I+I
5mNT6og+PuvPi5UId9KxxOUIWH8AZ8IvBJ/CL52QZ11KR0/kIPL+eDLv187y+b6h
cNnpptaYBvLXpbdDVjZ42P+l9+2LO/uo2LpAkeFcApKJ6dCphcG+lUf6pV4wPOyD
Mn8v8OYc4Kecn9HJ5KhBPdAQUsjYqvABoGyIZLPPHbujVc9XcbevU2/QInnwG3bS
TYXWhGxt3bvh4EMu/ucG2jSTQ3xDWA==
=gL+O
-----END PGP SIGNATURE-----

--va2ulxp2mo3losn2--


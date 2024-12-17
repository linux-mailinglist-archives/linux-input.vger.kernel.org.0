Return-Path: <linux-input+bounces-8623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F999F46BC
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 10:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A02A188A30B
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 09:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF371DACAF;
	Tue, 17 Dec 2024 09:01:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from algol.kleine-koenig.org (algol.kleine-koenig.org [162.55.41.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154522E628;
	Tue, 17 Dec 2024 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.41.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426062; cv=none; b=HCPPJFqqWjzzJkFUnf6NeINXysa1VGqBqUrn/sZqFtQA3L32JcZV2bH69tsMlrQZSw6997s+bmXbR5CIJ9sDe/2kaHvTmw5lW3fYwdjeH7wWSML1lL3/vW1WcSU8UDrm5LfsW3epyON8+bnaKw03R6tWjle0ehV45MCY8c99stE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426062; c=relaxed/simple;
	bh=J0PuM5p7pchmqN6ZVoVG6UcjdI5WhziO8E2NKvLEjtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVwmTuhNwyfn6LF/H4Ws/E+YmwaOYf1eGkj9LVa3a3TLNURVRiBvmhMUb7i+UvcN4Qv0Hw7RBmbLL4vw0qR/8VmLHzxAp+qPieMG6fFN5mXiK1d/u45Xy/tm7Z9CHWs0uGGezFH2HdbmqwdNpTuwaGNVwaCNmZlcP0xAKiRtIbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=kleine-koenig.org; arc=none smtp.client-ip=162.55.41.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kleine-koenig.org
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
	id EB1E3F56CAA; Tue, 17 Dec 2024 10:00:49 +0100 (CET)
Date: Tue, 17 Dec 2024 10:00:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fugang Duan <B38611@freescale.com>, 
	Luwei Zhou <b45643@freescale.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] input: mma8450: Add chip ID check in probe
Message-ID: <jyt32ymjqq6iqvzkx7wvoxlhozgkvv74peh47cfl2jyqcl7qko@azc4m2hbi4bp>
References: <20241216173205.211058-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rq65fs33me5rg2wl"
Content-Disposition: inline
In-Reply-To: <20241216173205.211058-1-Frank.Li@nxp.com>


--rq65fs33me5rg2wl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/1] input: mma8450: Add chip ID check in probe
MIME-Version: 1.0

Hello,

On Mon, Dec 16, 2024 at 12:32:04PM -0500, Frank Li wrote:
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
> change from v1 to v2
> - Use  *adapter =3D c->adapter
> - Use if (!i2c_check_functionality())
> ---
>  drivers/input/misc/mma8450.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
> index 08412239b8e69..a1adb49fb5f33 100644
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
> @@ -148,8 +150,17 @@ static void mma8450_close(struct input_dev *input)
>   */
>  static int mma8450_probe(struct i2c_client *c)
>  {
> +	struct i2c_adapter *adapter =3D c->adapter;
>  	struct input_dev *input;
> -	int err;
> +	int err, client_id;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SM=
BUS_BYTE_DATA))
> +		return dev_err_probe(&c->dev, -EINVAL, "I2C adapter can't support SMBU=
S BYTE");
> +
> +	client_id =3D i2c_smbus_read_byte_data(c, MMA8450_WHO_AM_I);
> +	if (client_id !=3D MMA8450_ID)
> +		return dev_err_probe(&c->dev, -EINVAL, "read chip ID 0x%x is not equal=
 to 0x%x!\n",
> +				     client_id, MMA8450_ID);

i2c_smbus_read_byte_data() might return a negative errno. So the right
handling is:

	client_id =3D i2c_smbus_read_byte_data(c, MMA8450_WHO_AM_I);
	if (client_id < 0)
		return dev_err_probe(&c->dev, client_id, "Failed to read chip ID\n");
	if (client_id !=3D MMA8450_ID)
		return dev_err_probe(&c->dev, -EINVAL, "read chip ID 0x%x is not equal to=
 0x%x!\n",
				     client_id, MMA8450_ID);

Best regards
Uwe

--rq65fs33me5rg2wl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdhPb8ACgkQj4D7WH0S
/k6guAf/W7eLowyHl8XUXTbDZrNY0GFPGWaeIHeYkjCt/qOKupP5TOTG6oxaHwxG
Pd9FOE9En8J+RR9ttTM5km5sfbXlnF77n+VkIrV460jjHuOXYSf7iyWZB3lobWlM
9pmPA2wHPLaCf9heaV4CzNFti+eGWAyyTIileebT3A+Av14qJhJeJS8RPbvXRQfd
/mblY8TOqZIfWGMvsDiFhLITl/W/uM+5YdMiN6UTBOw6uL9sjG1ajJ7odaRxbDSu
xQDOufjEQisantRDvhMeTgkIjnkHzGrBrN6n042lzG5MG5oyhq1XO+8IVaSrd26P
ok18n0EmufcVvZenhdeK0s/Qt72Z2w==
=4AOS
-----END PGP SIGNATURE-----

--rq65fs33me5rg2wl--


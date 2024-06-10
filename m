Return-Path: <linux-input+bounces-4289-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444A901DFF
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 11:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D83E1280F29
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 09:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299526BFA5;
	Mon, 10 Jun 2024 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvBB4krZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547EE18C31;
	Mon, 10 Jun 2024 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011287; cv=none; b=I7Yl/NeV0FGa2QYioqlugLI6X63xras2DoM63e/3QUjMcQoBQz0xT2qcft5MZ18b5m4Kv9AApxQWKGmzdfqmRDb56VXQ089bR1XCYHcXs/xnT1Mkn++KoW/q5G7RKzR/WMYVS51GskOC/x++cKfciI/0ZO2L+ZE2+YLXMDrsRwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011287; c=relaxed/simple;
	bh=Dmh0tSiP095R+09+1sKqhy9lsjwJ6Iz75sTr8vLeyNk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fFiyRs1JlA3UGCU0aH+SQ+xm47pCk+nFHbxfKeTp5tB9b3DYWgfyO2gnZ4g5Zog1eff4UnjQLyNQeUsrbn32K951YG9xuk7uBblXQJ+PG03x2f5/+03l+OOcci2PnV3gCTpqGAZuO0yxqCvFLGpJPwUhylv//8JFVovUbF5ZfEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvBB4krZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6cb130027aso181572066b.2;
        Mon, 10 Jun 2024 02:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718011283; x=1718616083; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dhBQ0MbZtPYKqz7VrZSy3TeA8kj9i5egrYX/qx7VZrw=;
        b=cvBB4krZolE3JnhYxOkO50AU2V+v6lFkd/yV8U0NJ1tqr2AiGE/napiL22ClgNTazV
         bj3r6KeHRks4dnJDKUbAQpRZE1LJ1dXghOGpkT2L8mmbxlrDssrILnfjT4Ka63f3gB4A
         gmoTtzSmuPXr23pDZXoo5jnOA/xGu3Mf2wC+dI8ZhaYGUGkJVHrW7dCIx1uTgBV8w2Uj
         LTc1yad/HlNZl3EjSqznNkP0oLy4LAQvRKntkwaPsaNlnMGOAct2NYV+JUeNvW6kP9SD
         XyyP2vUqVmlp/ca2I0AOjtOi84m9Hq1IaBurXFryUiupqH4hA/7U0KzSheecKeAVHqWe
         zKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011283; x=1718616083;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhBQ0MbZtPYKqz7VrZSy3TeA8kj9i5egrYX/qx7VZrw=;
        b=booK4RE6hZV+kT7s5PblwxE6XzdTY0Ru9vDYprNl1ZznhczGWMPyc9KZW7bbx6CAvn
         prYCwA3xmM51AqkA43x0L7pHVmpk6m/ka6Sd+3Ym5RCqqfXHgcqISKodLnc3PQkIUp2m
         phfIjglPPl7oiE1X5pmKiSEaxuqx24Ig/ZBAa3Nv3y4PWHGI+c39M/0F44iG/eR+AWP8
         ena/mLJ3RlRF+kGpy23sA8BK8n1CcT//8WLUUxdi3CIF9jIXvHHSEGyrbjml+ZSg19uM
         xU4sTBtmdSiC/WKkhq5C1of0PZQcLaPLZW6H2wV7PR6NuWW1tR6rrmj68yo588Cf0Zu6
         9j7A==
X-Forwarded-Encrypted: i=1; AJvYcCVjk64+n0Dc+Ds9o+1BDMl930kWOTG0/5MILxdBMFTpQgqv475t9MqwNTDq7Pip+9LP+S23RyhtBPA4HLlUOIJ7Q8lYlhU7t/Br0/jrs8UKi8Pb1PQizmjsL/vD9Xnqz8jrkdiKSU0IXyg=
X-Gm-Message-State: AOJu0YxZDfkjCzWYxcyMYCh9PWvEG9Q9yqxLzZXmH7OOnnNwRdeoeo5n
	+/vdzDJhZhhPP0bP0LD0zJNNFWj0zF+awmNMpMjAodbUfv/0hmIyF5V8cj2/8r4=
X-Google-Smtp-Source: AGHT+IHrIRR9EgSL5eJYKwdAw5JpBl2QEZy9Nc4QdF5/rQ552F0wAeqUqTJT6Wgw+BfB6M0aDIlX+g==
X-Received: by 2002:a50:999d:0:b0:57c:7826:1dc with SMTP id 4fb4d7f45d1cf-57c78260292mr2310117a12.8.1718011283240;
        Mon, 10 Jun 2024 02:21:23 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c741b0581sm3121062a12.57.2024.06.10.02.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:21:22 -0700 (PDT)
Message-ID: <78fdc86f1957da67963740711054265abc878998.camel@gmail.com>
Subject: Re: [PATCH 2/3] Input: adxl34x - switch to using managed resources
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Jun 2024 11:25:11 +0200
In-Reply-To: <20240609234122.603796-2-dmitry.torokhov@gmail.com>
References: <20240609234122.603796-1-dmitry.torokhov@gmail.com>
	 <20240609234122.603796-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-06-09 at 16:41 -0700, Dmitry Torokhov wrote:
> Switch the driver to use managed resources to simplify error handling.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> =C2=A0drivers/input/misc/adxl34x-i2c.c |=C2=A0 8 ---
> =C2=A0drivers/input/misc/adxl34x-spi.c |=C2=A0 8 ---
> =C2=A0drivers/input/misc/adxl34x.c=C2=A0=C2=A0=C2=A0=C2=A0 | 85 +++++++++=
++---------------------
> =C2=A0drivers/input/misc/adxl34x.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A04 files changed, 30 insertions(+), 72 deletions(-)
>=20
> diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34=
x-
> i2c.c
> index 7531c7b2d657..c05d898898e8 100644
> --- a/drivers/input/misc/adxl34x-i2c.c
> +++ b/drivers/input/misc/adxl34x-i2c.c
> @@ -98,13 +98,6 @@ static int adxl34x_i2c_probe(struct i2c_client *client=
)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static void adxl34x_i2c_remove(struct i2c_client *client)
> -{
> -	struct adxl34x *ac =3D i2c_get_clientdata(client);
> -
> -	adxl34x_remove(ac);
> -}
> -
> =C2=A0static const struct i2c_device_id adxl34x_id[] =3D {
> =C2=A0	{ "adxl34x" },
> =C2=A0	{ }
> @@ -137,7 +130,6 @@ static struct i2c_driver adxl34x_driver =3D {
> =C2=A0		.of_match_table =3D adxl34x_of_id,
> =C2=A0	},
> =C2=A0	.probe=C2=A0=C2=A0=C2=A0 =3D adxl34x_i2c_probe,
> -	.remove=C2=A0=C2=A0 =3D adxl34x_i2c_remove,
> =C2=A0	.id_table =3D adxl34x_id,
> =C2=A0};
> =C2=A0
> diff --git a/drivers/input/misc/adxl34x-spi.c b/drivers/input/misc/adxl34=
x-
> spi.c
> index 2befcc4df0be..fd716d861832 100644
> --- a/drivers/input/misc/adxl34x-spi.c
> +++ b/drivers/input/misc/adxl34x-spi.c
> @@ -87,13 +87,6 @@ static int adxl34x_spi_probe(struct spi_device *spi)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static void adxl34x_spi_remove(struct spi_device *spi)
> -{
> -	struct adxl34x *ac =3D spi_get_drvdata(spi);
> -
> -	adxl34x_remove(ac);
> -}
> -
> =C2=A0static struct spi_driver adxl34x_driver =3D {
> =C2=A0	.driver =3D {
> =C2=A0		.name =3D "adxl34x",
> @@ -101,7 +94,6 @@ static struct spi_driver adxl34x_driver =3D {
> =C2=A0		.pm =3D pm_sleep_ptr(&adxl34x_pm),
> =C2=A0	},
> =C2=A0	.probe=C2=A0=C2=A0 =3D adxl34x_spi_probe,
> -	.remove=C2=A0 =3D adxl34x_spi_remove,
> =C2=A0};
> =C2=A0
> =C2=A0module_spi_driver(adxl34x_driver);
> diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
> index fbe5a56c19d1..c6c34005f5d2 100644
> --- a/drivers/input/misc/adxl34x.c
> +++ b/drivers/input/misc/adxl34x.c
> @@ -707,21 +707,21 @@ struct adxl34x *adxl34x_probe(struct device *dev, i=
nt
> irq,
> =C2=A0	struct adxl34x *ac;
> =C2=A0	struct input_dev *input_dev;
> =C2=A0	const struct adxl34x_platform_data *pdata;
> -	int err, range, i;
> +	int error, range, i;
> =C2=A0	int revid;
> =C2=A0
> =C2=A0	if (!irq) {
> =C2=A0		dev_err(dev, "no IRQ?\n");
> -		err =3D -ENODEV;
> -		goto err_out;
> +		return ERR_PTR(-ENODEV);
> =C2=A0	}
> =C2=A0
> -	ac =3D kzalloc(sizeof(*ac), GFP_KERNEL);
> -	input_dev =3D input_allocate_device();
> -	if (!ac || !input_dev) {
> -		err =3D -ENOMEM;
> -		goto err_free_mem;
> -	}
> +	ac =3D devm_kzalloc(dev, sizeof(*ac), GFP_KERNEL);
> +	if (!ac)
> +		return ERR_PTR(-ENOMEM);
> +
> +	input_dev =3D devm_input_allocate_device(dev);
> +	if (!input_dev)
> +		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	ac->fifo_delay =3D fifo_delay_default;
> =C2=A0
> @@ -754,14 +754,12 @@ struct adxl34x *adxl34x_probe(struct device *dev, i=
nt
> irq,
> =C2=A0		break;
> =C2=A0	default:
> =C2=A0		dev_err(dev, "Failed to probe %s\n", input_dev->name);
> -		err =3D -ENODEV;
> -		goto err_free_mem;
> +		return ERR_PTR(-ENODEV);
> =C2=A0	}
> =C2=A0
> =C2=A0	snprintf(ac->phys, sizeof(ac->phys), "%s/input0", dev_name(dev));
> =C2=A0
> =C2=A0	input_dev->phys =3D ac->phys;
> -	input_dev->dev.parent =3D dev;
> =C2=A0	input_dev->id.product =3D ac->model;
> =C2=A0	input_dev->id.bustype =3D bops->bustype;
> =C2=A0	input_dev->open =3D adxl34x_input_open;
> @@ -769,18 +767,12 @@ struct adxl34x *adxl34x_probe(struct device *dev, i=
nt
> irq,
> =C2=A0
> =C2=A0	input_set_drvdata(input_dev, ac);
> =C2=A0
> -	__set_bit(ac->pdata.ev_type, input_dev->evbit);
> -
> =C2=A0	if (ac->pdata.ev_type =3D=3D EV_REL) {
> -		__set_bit(REL_X, input_dev->relbit);
> -		__set_bit(REL_Y, input_dev->relbit);
> -		__set_bit(REL_Z, input_dev->relbit);
> +		input_set_capability(input_dev, EV_REL, REL_X);
> +		input_set_capability(input_dev, EV_REL, REL_Y);
> +		input_set_capability(input_dev, EV_REL, REL_Z);
> =C2=A0	} else {
> =C2=A0		/* EV_ABS */
> -		__set_bit(ABS_X, input_dev->absbit);
> -		__set_bit(ABS_Y, input_dev->absbit);
> -		__set_bit(ABS_Z, input_dev->absbit);

Are these somehow default or already set? I guess in input_set_abs_params()=
...
Anyways, the move from "raw" __set_bits() to input APIs should maybe be don=
e in
a separate patch? They are unrelated with the current one.

- Nuno S=C3=A1=20




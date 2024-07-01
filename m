Return-Path: <linux-input+bounces-4786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B591E991
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 22:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89EBA1F227D1
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 20:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3C117108E;
	Mon,  1 Jul 2024 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NCkr9AYV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761FF16F265
	for <linux-input@vger.kernel.org>; Mon,  1 Jul 2024 20:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865697; cv=none; b=calujbVq35P9KvK849+VAQFRjiLaFKkNXukUko38Bsqy0u0smCXoJB67jPVztLKdjs1R42MSGjuuadegDhRTqgw3ZhDDioFGk9AGDcqJglXN0cmyWwpPHNJe5ka3vRLyXgFu0UJxEoRv7Y3uKSS73qNGcvym1A3sz08cNavLJls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865697; c=relaxed/simple;
	bh=XVbvWKGogxlGYpVfv6YP+C8+tpFUfuA2cwy7mKr2p70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBaDWz69KWF9i2srOz781X3NO6k6xREnRNLMRuZohQWGzHGjca+Q3lhb0V1t8C6gMMr19zK0LGqji3qxlAKDUGRLnBvDn9ChSPrnmYgo6Hx9mqqPTt80yalA0X4hpa+ti+gm7S/Ccuqi1nzFc96lW/6rc0d3gzzrCjvT9lWaP/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NCkr9AYV; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso55855901fa.1
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2024 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719865691; x=1720470491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDE2EQRBZZMybree9S/XXr7neF0aG33QWKHnsBlTFqY=;
        b=NCkr9AYVfMYdiQcdog35Ov7SPj64cxzoIULcvweVG45iKf5Ro2zyQfnMVzXy1LO5bS
         huy17vqr62YYgsbEOZsvqKWXbGcpUK6RtkdZfNcq2WSuYj2pMlgm9s3jDm4znYJrk2O1
         zzAAFD13JvGRf9VQdpnH4Ex0LRK43hYSOPfydv8bnsoK55NHiJjtwJzwna73p45v73pR
         wmXhK7E1VlqF50f0TJ3pF0/mbF4H33Uv2Vh2EhFMvb3A/2JU19xvU7podjgSea3pwR9X
         vzMdYrwU5D364phfvjUaioBW+EOiuneAaE2AYgUbJCnZSKAINiVlMPSyKFQ72pGwF4OB
         LI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719865691; x=1720470491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDE2EQRBZZMybree9S/XXr7neF0aG33QWKHnsBlTFqY=;
        b=AMUxhCYR4HLkccHtgcMOKzYCHCxMv7m8zg2ac4ymZJHYLIV/ysasDnI50M1wy4rnic
         OJSIkXn5qVpZuHRl+KZwVqvCKO+llGKKGVfHvMmtses1O/tSB3iqzxVCgVQYl7CwCeMi
         08IZLfQnOjNS+o8utrIQnn7MR0Ms1dzJzF4Vys+HRnIbphMOdHisZ9qAdnxadWzicA8w
         ejXCU1mGRxnTRy33eRzOybGMe0bUS23KLfm5OOzbufhZ7oNzS6Fr8kAIobOo97aA+B6j
         4hzlwOOipHTkuynytJT/cAaho9mXk6UX+8N1KxcIMrINLRq2oQzK4y5JqiSXF3VYS9Sy
         GJnA==
X-Forwarded-Encrypted: i=1; AJvYcCUFSyKWFPpgaMmbOFw9z5U6yMeBGiGS7TXT+ZxsZ+BUsFvEGadXmfS5NDHu3WOgafh29k1r7f2ejw2mufxWUVYaS/AbaFxrz2OC3y4=
X-Gm-Message-State: AOJu0YxeMmdYkk9EpwAg+I5h3RsKt2ED/NW9N2wrLLOp2TBBFnWar96K
	u986VmhZaGaOzBCCZXQ0O0zuZm99AkGOu9GOv3+J9K+W0MwNU4h06xWc89gPdYM=
X-Google-Smtp-Source: AGHT+IEdID+80R1oZQc1jVWSBR5Uo4TxJgod7+qR7ZGRHVf+8A99pL0gjT79RQCpgHHXjmZJFIuhwA==
X-Received: by 2002:a2e:bea9:0:b0:2ee:5ed4:7930 with SMTP id 38308e7fff4ca-2ee5ed47f93mr63501711fa.37.1719865691347;
        Mon, 01 Jul 2024 13:28:11 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0651a8sm357877766b.128.2024.07.01.13.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:28:10 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:28:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Utsav Agarwal <utsav.agarwal@analog.com>, Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iInput: adp5588-keys - use guard notation when acquiring
 mutexes
Message-ID: <pdnij2qolnmbcwtvlsdvkvtua7s7yjw4ms4bc7zyk3tpdr5pou@sga4mhcztfiz>
References: <ZoLt_qBCQS-tG8Ar@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ztmdawmpkaetyq7a"
Content-Disposition: inline
In-Reply-To: <ZoLt_qBCQS-tG8Ar@google.com>


--ztmdawmpkaetyq7a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

$Subject ~=3D s/iI/I/

On Mon, Jul 01, 2024 at 10:57:18AM -0700, Dmitry Torokhov wrote:
> This makes the code more compact and error handling more robust.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>=20
> Sending this out because Utsav is working on the driver so he can rebase
> the work on top of this.
>=20
>  drivers/input/keyboard/adp5588-keys.c | 49 ++++++++++-----------------
>  1 file changed, 17 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboa=
rd/adp5588-keys.c
> index 1b0279393df4..09bcfc6b9408 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -221,15 +221,13 @@ static int adp5588_gpio_get_value(struct gpio_chip =
*chip, unsigned int off)
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
>  	int val;
> =20
> -	mutex_lock(&kpad->gpio_lock);
> +	guard(mutex)(&kpad->gpio_lock);
> =20
>  	if (kpad->dir[bank] & bit)
>  		val =3D kpad->dat_out[bank];
>  	else
>  		val =3D adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank);
> =20
> -	mutex_unlock(&kpad->gpio_lock);
> -
>  	return !!(val & bit);
>  }
> =20
> @@ -240,7 +238,7 @@ static void adp5588_gpio_set_value(struct gpio_chip *=
chip,
>  	unsigned int bank =3D ADP5588_BANK(kpad->gpiomap[off]);
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
> =20
> -	mutex_lock(&kpad->gpio_lock);
> +	guard(mutex)(&kpad->gpio_lock);
> =20
>  	if (val)
>  		kpad->dat_out[bank] |=3D bit;
> @@ -248,8 +246,6 @@ static void adp5588_gpio_set_value(struct gpio_chip *=
chip,
>  		kpad->dat_out[bank] &=3D ~bit;
> =20
>  	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
> -
> -	mutex_unlock(&kpad->gpio_lock);
>  }
> =20
>  static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int=
 off,
> @@ -259,7 +255,6 @@ static int adp5588_gpio_set_config(struct gpio_chip *=
chip,  unsigned int off,
>  	unsigned int bank =3D ADP5588_BANK(kpad->gpiomap[off]);
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
>  	bool pull_disable;
> -	int ret;
> =20
>  	switch (pinconf_to_config_param(config)) {
>  	case PIN_CONFIG_BIAS_PULL_UP:
> @@ -272,19 +267,15 @@ static int adp5588_gpio_set_config(struct gpio_chip=
 *chip,  unsigned int off,
>  		return -ENOTSUPP;
>  	}
> =20
> -	mutex_lock(&kpad->gpio_lock);
> +	guard(mutex)(&kpad->gpio_lock);
> =20
>  	if (pull_disable)
>  		kpad->pull_dis[bank] |=3D bit;
>  	else
>  		kpad->pull_dis[bank] &=3D bit;
> =20
> -	ret =3D adp5588_write(kpad->client, GPIO_PULL1 + bank,
> -			    kpad->pull_dis[bank]);
> -
> -	mutex_unlock(&kpad->gpio_lock);
> -
> -	return ret;
> +	return adp5588_write(kpad->client, GPIO_PULL1 + bank,
> +			     kpad->pull_dis[bank]);
>  }
> =20
>  static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned=
 int off)
> @@ -292,16 +283,11 @@ static int adp5588_gpio_direction_input(struct gpio=
_chip *chip, unsigned int off
>  	struct adp5588_kpad *kpad =3D gpiochip_get_data(chip);
>  	unsigned int bank =3D ADP5588_BANK(kpad->gpiomap[off]);
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
> -	int ret;
> =20
> -	mutex_lock(&kpad->gpio_lock);
> +	guard(mutex)(&kpad->gpio_lock);
> =20
>  	kpad->dir[bank] &=3D ~bit;
> -	ret =3D adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
> -
> -	mutex_unlock(&kpad->gpio_lock);
> -
> -	return ret;
> +	return adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
>  }
> =20
>  static int adp5588_gpio_direction_output(struct gpio_chip *chip,
> @@ -310,9 +296,9 @@ static int adp5588_gpio_direction_output(struct gpio_=
chip *chip,
>  	struct adp5588_kpad *kpad =3D gpiochip_get_data(chip);
>  	unsigned int bank =3D ADP5588_BANK(kpad->gpiomap[off]);
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
> -	int ret;
> +	int error;

If you keep ret it's consistent with the other functions in this driver
(at least the one you touched above).

Otherwise looks fine to me,
Uwe

--ztmdawmpkaetyq7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaDEVcACgkQj4D7WH0S
/k77UwgAhkrJW9Rp/Fkp+vZnypItzs3b1ZmpIWeKvWTbfJFCo9d8zSZcXkMPIMmf
V9HIN15wHqUuK5F81vIfAQu5Ry8/ijBY2h9ccrxvWuKXLdx7Hq5PkTeb4DgdEIs7
yAgQzWWXsnYS3T/JVpZ7LowXk1bsty1wlpDQA3AI/YVLWPKVry0BgyV+QjN0SQ9K
3JW56yHpRjcRMBHn4qU+KsN9kd+JZT4UR8/BehHRzjDOz+dGTsgfqT/sMNh1Bd9N
+6YtPFOTM2o9Et374WvU57UGvRstFl7h5nBWy7aA6s7JfKe5v1XPMS2E4csARWmh
xVM9HAbRB0Ke4pn/V24PCP8vIOvG7A==
=jJaH
-----END PGP SIGNATURE-----

--ztmdawmpkaetyq7a--


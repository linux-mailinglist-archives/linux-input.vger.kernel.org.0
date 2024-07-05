Return-Path: <linux-input+bounces-4878-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4477928F63
	for <lists+linux-input@lfdr.de>; Sat,  6 Jul 2024 00:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E3081C21A18
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 22:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D421474D7;
	Fri,  5 Jul 2024 22:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S0Qjqjnw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E371B25
	for <linux-input@vger.kernel.org>; Fri,  5 Jul 2024 22:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720219736; cv=none; b=mj1UZ/VMBscOu1XmkTeCGnjxXjbQJpGrFh2jzIM6s7DXpVi8UM5630i61KPsJgaqk7rY8eCl1lgldXS6QddDsA0Ypfe/oAf7E2c3/oQkbFLPSsQrkhZsqLJ5KLHjQP5h1B8Hy6rvj8bcVU2Afa4hlTpR/DLVXsJ/QKB6oxTCsRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720219736; c=relaxed/simple;
	bh=40fim1v5ajB0EWEeShPJTTuP9vv/eTRePe4Dy9duJh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPmUgnTfOylLCDsEPQTQRq5ALyNot0QDOfxNRO0rjxIHzQaB/Pr4jIaJOyuixoczSkqqsM+HNGFkT8mS4Fo6if168IgLILO0xLZC3QcFBrWvMRsUFN0OcAam3wTQECUZzk8nRE32iQlNWCLLuMP7CfL1yjlDOF2hgOcj7FZElZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S0Qjqjnw; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab63so3272715a12.3
        for <linux-input@vger.kernel.org>; Fri, 05 Jul 2024 15:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720219731; x=1720824531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E5pF0Ef7WMMa4lOz8mxyXD3GneBeoClSehGi66bM130=;
        b=S0Qjqjnww4D8sudqFOylm8p7ddoIY9NS2s9ChlO5+vI4tBsW0YchOCvu/l2RWH4M6U
         Myz2lXvO60jF4W8wYQkAPE5Ow7m5bJX0dHAp9EK+wyJekdl5Xop9PfT4MNLoZ5sWiTEE
         hQb1AxlT6pgewd2TnJQmdJ8qA4nkQdrLwr1gnyTyqx8XpMV9E9qDVPqPdX0U7rSZr61g
         KkJFJ+zubIgnkqaPmg3t8zknXYnvK/LWK8Wcf+CQxWEE7b6ziSZtb2KQ4XI++3Sr7Gec
         hgdJrOybQyJ1q8cauh/E2aWHwbt0N7zs6zVcih2IZOUoD/t90URlABpleIK6ngv9605h
         ZxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720219731; x=1720824531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5pF0Ef7WMMa4lOz8mxyXD3GneBeoClSehGi66bM130=;
        b=j95SaJK/mepuFmNzigalHqPEgeFi2Y6bXanpm5F2aMH3N/1r2xcZBcYZfZqFOCzPPN
         yTtv+qNz7O4qPsqh0fWHfgjvr4S1yzb4ZeXHV5rmo3IdedoL/vWbn11a5jntoWZWH8VY
         wkLgTWFfI42sMGpv8EvGkVbhjq8k7Q0mZLASHh9eWWr5qBXm0Y4h6EXJRY0GmY+RDd4h
         M+nH83F4cjY8emw3kNOCUvs/yq64K0eTgEbydXR1+uw5O3f7vZRjdqehKM2rlCR8yapN
         dx3FNZOWV7Gyf1w85Qg9S/UxhZkH3V7LRWRLDWwrsu+AdQxfUGAdzyT5jiSMHYGoUh3s
         to9A==
X-Forwarded-Encrypted: i=1; AJvYcCXx3wHnkSIpixvrOOW9N8+HGt8qQkNU0zCZrMjeWxOGyGmFp47DnJXdGzxk740aYeQzreNyYXLUf5Sd4vMl6Y8/+++ngtt+1nzHqTg=
X-Gm-Message-State: AOJu0YxL5LxB20SghqkTiksYS/0U82u1omfJsBxYZTWUqCNa7eDkjvJ6
	DKgtof0dzhJvjLXHg1s1mcFYXw/7svNREaH0biqN5PQ5YzLRsR40Ye47369KPgU=
X-Google-Smtp-Source: AGHT+IERi2Ye2QmrvRDXzlts/Gxk8iJON7puvXr1O4BNvzlYYxkYOGzuxjmL8eiQZoHA789a6HXkoQ==
X-Received: by 2002:a05:6402:2106:b0:57c:6188:875a with SMTP id 4fb4d7f45d1cf-58e5c73066emr4417332a12.26.1720219731385;
        Fri, 05 Jul 2024 15:48:51 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5898:1844:403c:d2d6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58eeabbf108sm1956125a12.93.2024.07.05.15.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 15:48:50 -0700 (PDT)
Date: Sat, 6 Jul 2024 00:48:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: dmitry.torokhov@gmail.com, Jonathan.Cameron@huawei.com, 
	broonie@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org
Subject: Re: [PATCH] Input: pxspad - add check for spi_setup
Message-ID: <5uzgfsbupxt3p4hlvi6atdzdamcuci2u3k7zl2zic5qrphl6yn@duygfftdrnh6>
References: <20240705082057.3006342-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tdaa4krfgm4lletw"
Content-Disposition: inline
In-Reply-To: <20240705082057.3006342-1-nichen@iscas.ac.cn>


--tdaa4krfgm4lletw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Cc +=3D linux-spi]

On Fri, Jul 05, 2024 at 04:20:57PM +0800, Chen Ni wrote:
> Add check for the return value of spi_setup() and return the error
> if it fails in order to catch the error.

Does this fix a real-world problem, or did you notice this using a
linter or by just reading through the driver?

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/input/joystick/psxpad-spi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/joystick/psxpad-spi.c b/drivers/input/joystick=
/psxpad-spi.c
> index c47fc5f34bd0..5b53d43c797a 100644
> --- a/drivers/input/joystick/psxpad-spi.c
> +++ b/drivers/input/joystick/psxpad-spi.c
> @@ -344,7 +344,11 @@ static int psxpad_spi_probe(struct spi_device *spi)
>  	/* (PlayStation 1/2 joypad might be possible works 250kHz/500kHz) */
>  	spi->controller->min_speed_hz =3D 125000;
>  	spi->controller->max_speed_hz =3D 125000;
> -	spi_setup(spi);
> +	err =3D spi_setup(spi);
> +	if (err < 0) {
> +		dev_err(&spi->dev, "failed to set up spi: %d\n", err);
> +		return err;

Please consider using dev_err_probe() in such cases. It allows for a
more compact error path and emits the error code in a human readable
way.

Apart from that: spi_setup() is inconsistent as it emits error messages
for some error paths but not for all. Probably the better change is to
make spi_setup() consistent here. I suggest to add error messages to the
error paths that currently don't have a message and drop this patch.

Best regards
Uwe

--tdaa4krfgm4lletw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaIeE4ACgkQj4D7WH0S
/k4vugf9HAZcsvtG4nBfFgPQc4vN4LUOZADh7N+fRQOCIO6kaNJzhly2KkpfE3Y/
p8exypdWK23N2c2N60E4+BhJx/re/KWmrDewwHzMoSWFEDbrFuVxU2BkGrumZ6sp
Z4BigMQZd8kVtaFGWWbNFipf6aswnYn3JdivWY39nmeuko8zDpI6fwsIz0A2shNE
2V47+1FAG7frbpWBe0EEURdc0f+k5tNgBE3rb/Nxazl3Y8/Mq7SZIxKwKsTzYtFx
4rgKg9JAS3CstyQENaq1t/Q8SqpfkdW6rm1vnNVniNQ5xR++kNgm3a7Mxb2BTr/L
huvWYSgtPHR0GUlHVkhweqI3010ZJQ==
=OvXB
-----END PGP SIGNATURE-----

--tdaa4krfgm4lletw--


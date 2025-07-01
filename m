Return-Path: <linux-input+bounces-13270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7EAAEEDF2
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 07:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B4EA188C887
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 05:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11021E522;
	Tue,  1 Jul 2025 05:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cMMV0hO3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4981494A8
	for <linux-input@vger.kernel.org>; Tue,  1 Jul 2025 05:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348971; cv=none; b=p70T1WYqyi6q0WhvD/AsscYllBceDv0MTCv5vM+AQeqdVfnHxaWAk4yNsEtqUEaCvuLvSiwXD2Pd+o5x66eWeweISibzRRh3MXShjoQJkznrYHAWyaxNsa7M3yAKd/ChhQGLkMut65WZz/EN1RfcqfSG+AXBr+eTYtbfiDCc2HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348971; c=relaxed/simple;
	bh=vxM/QcB3IZclon/gK8SeVlQ40u27NfsiopRZUt/JOI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lct/Fizz/0UrmS4VVIizmTBi0EYneRVLSAA6kS0Ka4EGVnFIAYdTDLdrbRBq1SZa9qMcYCpnf8ANJzn9TDrCKTIpjMin1ONlp9vBeQKKDiIvtbT7P7REN4F1dykcIFYIbh9Ehq6/kF3cR9Mbbzj8CZBMvlDFaQmJqla8uVWdEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cMMV0hO3; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so11541722a12.2
        for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 22:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751348965; x=1751953765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPK2mDOmEv5JfpYBiR28xtrw3L+ifodRxM3SpZfwQUI=;
        b=cMMV0hO3nkA9N4fS8D8F4CoXD2PdAxTQ7disOxHG5VKsbuWFsoAdcydQ3vmOgd1gpe
         rrGeWGs5u8a+vBkqSEwRtYyJanfZzvD+EnVOupvKentUiVIWoxYbSAPU7LcT6sB1g7Ck
         Pc+uNN8XaAMzP+ABDtYazVGb+nQU2ZgZddrxdPVwWPtpfUXhrETTComMVoLT0yd39H8I
         WFldg1J6Q4ZgetO3yaktEgYtEJ9WkndIVzEooE9/Y83k81RjUVnERQDdF1hjWjbXMaCI
         nGHESvwI0TdfOWN+sKzr6Em/hHTkc0nwRvvEz2UJhjQJL1EgM6kRvqdHf4/4w/Qu508W
         LXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348965; x=1751953765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPK2mDOmEv5JfpYBiR28xtrw3L+ifodRxM3SpZfwQUI=;
        b=ac36JnShn6P7agezUmmahJ3FMhhP6pTEIhE/z2YaSTP4q8xb7FI03Y14JaZU0Rt5xV
         mNboXL+ysQWx5FRqzs1EvgjBoeU0Q+Fm2b6tUc25ckWpaUAvxeA9pRGlznQRSae9ieC/
         8S5ZD4vRN90Sm+GPwx1XKpF6exvIGw08O12X6eoUGkL5YyvWF/ISw6F0EhgZMPIoYBkv
         fIUH2BELVop8HAcW5K69pbWf7+bNXgd2KXXEHyBYLXTQMj0txsQH3VfW3RuOWF6XvG+v
         Pw16te2U6zF2oviOD47Xz+XCbmJiQywpnJ7NL9iiumgRMmqB9T10tcvqHv/8vyTVGEYr
         uInA==
X-Forwarded-Encrypted: i=1; AJvYcCUCW7OB3//OV9krg1KFYU2TaDKPhyl99oOtALupUnmGgbqCOUdGZ5uxrATtAl5KrDpBj77cu2qQlm8+EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLAimnwABPhrR+MWAvp7GzkxYJ963+HOCVhegSPPLQekStuaK4
	qEEW9b4nuGFUnwNFgPh+Yhsjlb9KYtfmgb2dZa/S3DOOS00VO6b9M0U/3mEz9aWYeh8=
X-Gm-Gg: ASbGncvmeRJnroMxNWEey6nNIPVpHexSeIBef2VfKBI1670FYmZjlOcJb1c5DRRkyMP
	lX9/nG3wlbVGDQFkuEFjT26+qTMqDA140sfLfc7Uw3bLVQLb4I6uCBqrNE0j1pi6CftW8rTs7Ox
	i2ED8YmT9iJZY/YEwDZqvzL9oUbQkXQ8UtuqmSf6fbaZ++wjC+wotnW/P/0kla4FcOQbcNOqg2d
	z6j/VDFLKPFplDSJH85iw2dlqMXBcQwoYx5pKhCfM7HliBB7GcwYMWzrfZrghe/nQIceONAk6Nh
	xCkegED1uLLRiYm+Qy2hp5xhDm5Rt56vZdeILEKYvD7JSs8DtS1SjHOV+QWRov8QqNk=
X-Google-Smtp-Source: AGHT+IF/zVGKzrg7pkzRTLImShN4RF7dcYq1U5DPjFBEN+r606xfWedr9MRCupK7tU4pUjHIW+c0iA==
X-Received: by 2002:a05:6402:84e:b0:60c:79de:1c59 with SMTP id 4fb4d7f45d1cf-60c88b3e392mr13904180a12.7.1751348965299;
        Mon, 30 Jun 2025 22:49:25 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60c828bbea9sm6900605a12.1.2025.06.30.22.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:49:24 -0700 (PDT)
Date: Tue, 1 Jul 2025 07:49:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] Input: max77693 - Convert to atomic pwm operation
Message-ID: <23ddfd32qebfzb4qftxih3mwpymghlezdv5u63qhxhqthpbxpz@u7f4tbihsfop>
References: <20250630103851.2069952-2-u.kleine-koenig@baylibre.com>
 <w3tkxxkqr2kmri3bz5m34dzw3hfvkqou3zbww7kwjdg72o7kla@ty777ynf26qr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vzv6drp5rahmxtfx"
Content-Disposition: inline
In-Reply-To: <w3tkxxkqr2kmri3bz5m34dzw3hfvkqou3zbww7kwjdg72o7kla@ty777ynf26qr>


--vzv6drp5rahmxtfx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Input: max77693 - Convert to atomic pwm operation
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 12:23:43PM -0700, Dmitry Torokhov wrote:
> Hi Uwe,
>=20
> On Mon, Jun 30, 2025 at 12:38:50PM +0200, Uwe Kleine-K=F6nig wrote:
> > @@ -167,17 +150,22 @@ static int max77693_haptic_lowsys(struct max77693=
_haptic *haptic, bool enable)
> >  static void max77693_haptic_enable(struct max77693_haptic *haptic)
> >  {
> >  	int error;
> > +	struct pwm_state state;
> > =20
> > -	if (haptic->enabled)
> > -		return;
> > +	pwm_init_state(haptic->pwm_dev, &state);
> > +	state.duty_cycle =3D (state.period + haptic->pwm_duty) / 2;
> > +	state.enabled =3D true;
> > =20
> > -	error =3D pwm_enable(haptic->pwm_dev);
> > +	error =3D pwm_apply_might_sleep(haptic->pwm_dev, &state);
> >  	if (error) {
> >  		dev_err(haptic->dev,
> >  			"failed to enable haptic pwm device: %d\n", error);
> >  		return;
> >  	}
> > =20
> > +	if (haptic->enabled)
> > +		return;
> > +
> >  	error =3D max77693_haptic_lowsys(haptic, true);
> >  	if (error)
> >  		goto err_enable_lowsys;
>=20
> I do not quite like that max77693_haptic_enable() now has split brain:
> there is part of it that does update unconditionally and part that is
> protected by the "enabled" flag. How about we keep max77693_haptic_set_du=
ty_cycle() but make max77693_haptic_play_work()=20
> a bit smarter, like in the version below:
>=20
>=20
> Input: max77693 - convert to atomic pwm operation
>=20
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> The driver called pwm_config() and pwm_enable() separately. Today both
> are wrappers for pwm_apply_might_sleep() and it's more effective to call
> this function directly and only once. Also don't configure the
> duty_cycle and period if the next operation is to disable the PWM so
> configure the PWM in max77693_haptic_enable().
>=20
> With the direct use of pwm_apply_might_sleep() the need to call
> pwm_apply_args() in .probe() is now gone, too, so drop this one.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Link: https://lore.kernel.org/r/20250630103851.2069952-2-u.kleine-koenig@=
baylibre.com
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/max77693-haptic.c |   41 +++++++++++++++-------------=
------
>  1 file changed, 18 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/ma=
x77693-haptic.c
> index 1dfd7b95a4ce..5d45680d74a4 100644
> --- a/drivers/input/misc/max77693-haptic.c
> +++ b/drivers/input/misc/max77693-haptic.c
> @@ -68,15 +68,16 @@ struct max77693_haptic {
> =20
>  static int max77693_haptic_set_duty_cycle(struct max77693_haptic *haptic)
>  {
> -	struct pwm_args pargs;
> -	int delta;
> +	struct pwm_state state;
>  	int error;
> =20
> -	pwm_get_args(haptic->pwm_dev, &pargs);
> -	delta =3D (pargs.period + haptic->pwm_duty) / 2;
> -	error =3D pwm_config(haptic->pwm_dev, delta, pargs.period);
> +	pwm_init_state(haptic->pwm_dev, &state);
> +	state.duty_cycle =3D (state.period + haptic->pwm_duty) / 2;
> +
> +	error =3D pwm_apply_might_sleep(haptic->pwm_dev, &state);
>  	if (error) {
> -		dev_err(haptic->dev, "failed to configure pwm: %d\n", error);
> +		dev_err(haptic->dev,
> +			"failed to set pwm duty cycle: %d\n", error);
>  		return error;
>  	}
> =20
> @@ -166,12 +167,17 @@ static int max77693_haptic_lowsys(struct max77693_h=
aptic *haptic, bool enable)
> =20
>  static void max77693_haptic_enable(struct max77693_haptic *haptic)
>  {
> +	struct pwm_state state;
>  	int error;
> =20
>  	if (haptic->enabled)
>  		return;
> =20
> -	error =3D pwm_enable(haptic->pwm_dev);
> +	pwm_init_state(haptic->pwm_dev, &state);
> +	state.duty_cycle =3D (state.period + haptic->pwm_duty) / 2;
> +	state.enabled =3D true;
> +
> +	error =3D pwm_apply_might_sleep(haptic->pwm_dev, &state);
>  	if (error) {
>  		dev_err(haptic->dev,
>  			"failed to enable haptic pwm device: %d\n", error);
> @@ -224,18 +230,13 @@ static void max77693_haptic_play_work(struct work_s=
truct *work)
>  {
>  	struct max77693_haptic *haptic =3D
>  			container_of(work, struct max77693_haptic, work);
> -	int error;
> -
> -	error =3D max77693_haptic_set_duty_cycle(haptic);
> -	if (error) {
> -		dev_err(haptic->dev, "failed to set duty cycle: %d\n", error);
> -		return;
> -	}
> =20
> -	if (haptic->magnitude)
> -		max77693_haptic_enable(haptic);
> -	else
> +	if (!haptic->magnitude)
>  		max77693_haptic_disable(haptic);
> +	else if (haptic->enabled)
> +		max77693_haptic_set_duty_cycle(haptic);
> +	else
> +		max77693_haptic_enable(haptic);
>  }
> =20
>  static int max77693_haptic_play_effect(struct input_dev *dev, void *data,

I had something like that at first, but didn't like it. With that
approach you have two places that have to know how to set the PWM's
duty_cycle. Also I think the control flow is more complicated.

I considered renaming max77693_haptic_enable() to something that better
matches what it does in my variant, but max77693_haptic_configure() was
already taken.

But that might all be subjective? If you like your version better,
that's fine, it still gets rid of pwm_config(), pwm_enable() and
pwm_apply_args() which is my main objective.

Best regards
Uwe

--vzv6drp5rahmxtfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhjdt8ACgkQj4D7WH0S
/k7gTAf+NcIvn1EBep7eVRw19GRsm/IbRNCSvyVCRuXCbSx71klLLDqnkICLEUlQ
4wf6DlpJmrpyQ8FP+wfTTSnjIOx+bKrnWMM0+ncw4YZ8CDPTnMpQWs/x4/3qvz6Q
t7m7Pni8xiq7ddncI8yNOGgruj6fRREzg5HWICfqETJEJni1iZfZdU/lrSRpE7cg
SRUTqBs1efj6QPMIzt6GPRbSL+z1Cq8ugC7WugK8DdwZcYs5yg4PnLTCYBBas26k
RaEjU4fF+FZLElHrbIAs7CSVN/LwfGOMCqnTqB52Fk09wIBOmHdTaXkDqAJhaCDm
4kU6rWH23lXoT04G4Lg+/BZPH1eKMQ==
=ZH+d
-----END PGP SIGNATURE-----

--vzv6drp5rahmxtfx--


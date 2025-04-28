Return-Path: <linux-input+bounces-12054-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C519A9F9D8
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 21:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 796151A863A0
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 19:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6FA27A119;
	Mon, 28 Apr 2025 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eFj7DDQ+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621542973D9
	for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 19:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869509; cv=none; b=EeMbedRsC99ZmBkQx/OdtT0N4A1y3Z8irPcut+TN5lwJfn9imhdIFQzeK8b4qnddx/UKIsUKTJl9vseanmVGb6CKcPb+Quh1LfgWfQCXPR6EZVjb+AKtz7Nt5edy91oUl+Ab8UkSpbam8ByqGeweRjCqmvs8AA/C8OIgOKnbNDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869509; c=relaxed/simple;
	bh=Ske+BDAj21huhvtbIRDfyBrEs+/jQGWomwPZgUuFL2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSemBY8QGYtvLB4zoZCBu7MYDpDt5U84JeBYAuit1PtgxTZL0dK0TyZ6usFSkPSXNtSKEoDGTZjJmqnVkdhknMDB34EYNhzWZuxo2sVx5kjAHuGjlpK34OTUpggb48I+boLj13dbwIOvIpIKHkbfBWfeRBuZhc/gAJ8b3P6NIqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eFj7DDQ+; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af51596da56so4444083a12.0
        for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 12:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869508; x=1746474308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=;
        b=eFj7DDQ+3JW1iavBKbsxGboGIg7RsxfyyCr7BzNV3XXywElUMvaXuONSQciAAaOHfr
         8hg1tfFvmiiAWQPc796s/T3X215Hg0VkC8koFytNFXsllglOu7cO9qMEdQxbKLm6aCvH
         dzZuuBXqqPYSj1vXnCdlvIicoWZZFpf31xDhwoi6Ts+uKI0047MjBNrBvRLV0iDJ1LbY
         p6DAL8c3t7LDdEx/O3Y3571jLy1spHx4X3PGge2uAmmIP63wlWILroUzzMxBJniXjXax
         YhroESF38NFYuBA6pfCJ/VlYHsGQv7FrJCnI9+4mmL7yZ79qD2sEiTq6id4ECJnVZKoy
         n+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869508; x=1746474308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=;
        b=QdY5IeXQPJZTPvko+ZtaptSPBbFdGW0ijPpeGWl/YGO5bx1zqdZVnZcYatRgZf4//1
         zNWldDZrWrhVFzuxa9cEUyXRThIIJFB+AC72tP48tOzMKiSRPT818tx9lo1ZsquWamd0
         xhVsMOJkRyevNXHbJJ/Snv6P/qeG4JjLzj6I/fhhq2VTRogCklTLgq4qJ+D8DyYoaFeB
         cpK12m7YsG+O3YsKaPoJtHEvekiYXC3cxaXgD0XqzToDypiId42QItVTrrkOMPWNG5S7
         TXi9RVR4fDe36vGxOTX991orNc9pcq6xvGKDP3+tE5dRiYACwjHSoykVZXFld+vHFrkk
         Hxcw==
X-Forwarded-Encrypted: i=1; AJvYcCX/SD5sVpgqkBqUub0rP3cY2QHHH6NHZRX8M/HSRJDfzqTJihSZelslyjSiheKjisj+kxnZnyBb3pczDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Nbu6CANWIPwPEVpCN++eJw7W55SGl6aVvZIIa/i6kvrrsaTa
	7L18sPhawlEglDU1wXDnn9mBLtvXwpMIkOXuB+Z3ms2r6HI1HDElHjr9yH8k0Q==
X-Gm-Gg: ASbGncvbSeOEusd8MSUL6VeLX3Gj+Sj5X+Xcq/zBFvLMGsHv6XVyXoMbFqh8ec2SFbI
	sYQb8DBCSCo6U5qxESZTLhRz0sv9bNPzew02GGCs6TyAOoIAialXCRRgU32A0w8qCdybD1uUsQP
	sLTVlqNqq2oRxVic3OSg47djRUD2cXX0dQ+wu6A8cX2ZVfu5F5NSishSq50l8hV7yppjgOwx9u4
	ULTltwrozRlNSHrBb3eLdKqEpJj3eR205f50ouT/RedL6Q7YFqnAr7yanFDCdQQyDiLx3Ma7L5Q
	+2/v3jHvgUdYe41m6uSv8OzNEtfLDK6rY/5kQFDith1IbzKIBVMKTvbFT7AgARYi+TL6A9sJTA=
	=
X-Google-Smtp-Source: AGHT+IG6R82DFa9jAy922lzUHN2EAVQRNR18xiowU6WDSy9TAXdGrX8+WhcNG0tMNBGpq3fQ1R7ExQ==
X-Received: by 2002:a05:6a20:43a1:b0:1f5:75a9:526c with SMTP id adf61e73a8af0-2093c7e3860mr1003669637.13.1745869507413;
        Mon, 28 Apr 2025 12:45:07 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9abf2sm8338322b3a.122.2025.04.28.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:45:06 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:45:01 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support
 touchscreen probing on Squirtle
Message-ID: <aA_avWpDUMAvbRBu@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3yxgRYuYXTrM4tBx"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-9-wenst@chromium.org>


--3yxgRYuYXTrM4tBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:46PM +0800, Chen-Yu Tsai wrote:
> The MT8186 Squirtle Chromebook is built with one of two possible
> touchscreens. Let the prober probe for them.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index 10dbaede0541..f3cd612e5584 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device =
*dev, const void *_data)
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
> =20
> +DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
>  DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
> =20
>  static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trac=
kpad =3D {
> @@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i=
2c_probe_hana_trackpad =3D {
>  	},
>  };
> =20
> +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_=
touchscreen =3D {
> +	.cfg =3D &chromeos_i2c_probe_simple_touchscreen_cfg,
> +	.opts =3D &(const struct i2c_of_probe_simple_opts) {
> +		.res_node_compatible =3D "elan,ekth6a12nay",
> +		.supply_name =3D "vcc33",
> +		.gpio_name =3D "reset",
> +		.post_power_on_delay_ms =3D 10,
> +		.post_gpio_config_delay_ms =3D 300,
> +	},
> +};
> +
>  static const struct hw_prober_entry hw_prober_platforms[] =3D {
>  	{
>  		.compatible =3D "google,hana",
> @@ -93,6 +105,10 @@ static const struct hw_prober_entry hw_prober_platfor=
ms[] =3D {
>  		.compatible =3D "google,squirtle",
>  		.prober =3D chromeos_i2c_component_prober,
>  		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,squirtle",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_squirtle_touchscreen,
>  	}, {
>  		.compatible =3D "google,steelix",
>  		.prober =3D chromeos_i2c_component_prober,
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--3yxgRYuYXTrM4tBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/avQAKCRBzbaomhzOw
wuHsAP9k0n2/zZ8JMwMbW9PvC1L4S+rXwkDzn4vNgVA9gpUADgEAqqQGBGFcOCTo
ivudInVAQKMFJJvenfbspzj/SwoyHA8=
=MQA+
-----END PGP SIGNATURE-----

--3yxgRYuYXTrM4tBx--


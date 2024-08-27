Return-Path: <linux-input+bounces-5904-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 366AF960D7D
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 16:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26AF2845DD
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 14:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C721C4EC0;
	Tue, 27 Aug 2024 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsKI4Oyq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CFD1CABF;
	Tue, 27 Aug 2024 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724768635; cv=none; b=KxD29m2/buTGWoBdIxAnvdyvfuJCKALmMg8uFdrY8a/6Atp9eafj+4Gz57ZKIiCOwSV7ZlfGkny5mWHoT0/3gRxobHvG5ldPtNlvix6NUjlY4lJQhwLTyo/prPmClQcUTtYfPnPi8+Bt0dhjDWI7d+HpION/3ZtBvJzUQhn1foM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724768635; c=relaxed/simple;
	bh=SW8bHj9Uo0ro5yHk0McUtlSLJIiRvkzQx4qLuCv/48o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMGLEErsEuGg4tctPmWZXnziluMOCdEdRzGwuDv0Nz5sQ+DX6oOfnS8dPYE0QVPxJ4ag4UyDABmv6wadI+5vCTuyy2dkCfGwOwcEiDzE+crAT8zXF+B8NZfQTuzJvU/+HotD9WRrRGBUDVoWc0VconNLGI/Vn8bVvWYyl6gVZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsKI4Oyq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42809d6e719so48983185e9.3;
        Tue, 27 Aug 2024 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724768632; x=1725373432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3WfFEbNY201vx/ED8/DD9qj8f725brCyGAzTnC8PfQ=;
        b=VsKI4OyqqTBJQCJrXXrA0Aj3Ii3/dF9MxCC6Hy1ojxfU9WUc6jCXbWMprKDDKp518i
         RsruOpGfKvGE0cpg0K5uilP42uefD+S2CgLZsvBxAHGwFdgxnrblT4vaKp3p5fFFXtVO
         9EBo2NIBU8jKUKsJH6QeA+OiABIPZjsCF8rIEWKAFMLZvYsvuNBewjPy/KknDS3I4Jp+
         mxg6avO606keY3Hw7/rAuG/uaQyyBM6HLtM6ZevdQVQ5LxLhc/vj59Rw6ElVDSzkKzh+
         52M4MNebTykmcrEJ1pOlAqxR2FBHbMGvIX/nOo0X39LRp77pBxcUDI28440Qhdxu/cKZ
         6R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724768632; x=1725373432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3WfFEbNY201vx/ED8/DD9qj8f725brCyGAzTnC8PfQ=;
        b=L0MhKo+3/+s4LrVHiqhz/DiotN6k8mPOmjAcQAZ8+NReW1RdLINhI7vpcl2Imcs34b
         88YI4dGdjaihnuvgVwKOhJlDeNyGr+5LszoAadjiCG6dylDvdlqMVG+y0RFbCe0x0V/N
         c0OgI3QYAmVp8Stl+YaU9Z/LEt8u0McchkLk8dk2Snh6T7jeqTnDbPTeiojRXwooNHBE
         c+rkOh0MbJeFmfIQ909U28n0FXT/A9nGk1cbovFEB30q4JYLV1ZuI6MxbcyoKPrFL7P2
         8HIO00SEqMS1klqddSW1oSV5YWqW+ISeSavKdODDXcEl0w3iprhKqkfbWEh+2m+FDqoJ
         r7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpJ+saR067BscigseD7lxrIvyaglofJf6pjjkl6EpO76uwChneqUnS/YKnJ1XbHCL+muMeCT5C8icp8xU=@vger.kernel.org, AJvYcCWMjqFN2zgVvk3ILBY0QkM17LoTFeOEMvmc2jNzysj0fDdUSXLcIFgbMls6Q9GZmZWLMCw/VfxiDsL7PwTI@vger.kernel.org, AJvYcCXL9DfFlAR8IkdCZboLDTEBimGkUr1lU0gWBLKoMYR+TNxiSUjXXEXiXhi8pbUPQ5fM3lAR1rrVtrp0Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiz8lGoPMDDifRNOtPIOr5Te39NRuGaMl+iDnmw2R5B/aTuItg
	gmTohKi4XjJ0nLr/VIHRQxdFcQ3pS+VkIhzWVDNYTh4UOxLnLA1koIxQJOCH
X-Google-Smtp-Source: AGHT+IF9UnxlOJuQNrBlQHqlvu3HG05KXPOD7OMQtkiX8CJCitn9cP+f6f7zRSGdApo5zRXa75oHzg==
X-Received: by 2002:a05:600c:1f83:b0:426:629f:154e with SMTP id 5b1f17b1804b1-42acc8ff933mr82713635e9.30.1724768630677;
        Tue, 27 Aug 2024 07:23:50 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee86d5esm219643205e9.15.2024.08.27.07.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:23:49 -0700 (PDT)
Date: Tue, 27 Aug 2024 16:23:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: tegra: Use of_property_read_variable_u32_array()
 and of_property_present()
Message-ID: <zyzygwdfncus7nhnu6sgbc2wzjpih3dntgdogorg3it4vc7r6v@aufrf6kwqun3>
References: <20240731201407.1838385-6-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ls6njxuxikia5hmn"
Content-Disposition: inline
In-Reply-To: <20240731201407.1838385-6-robh@kernel.org>


--ls6njxuxikia5hmn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 02:14:01PM GMT, Rob Herring (Arm) wrote:
> There's no need to get the length of an DT array property before
> parsing the array. of_property_read_variable_u32_array() takes a
> minimum and maximum length and returns the actual length (or error
> code).
>=20
> This is part of a larger effort to remove callers of of_get_property()
> and similar functions. of_get_property() leaks the DT property data
> pointer which is a problem for dynamically allocated nodes which may
> be freed.
> ---
>  drivers/input/keyboard/tegra-kbc.c | 72 +++++++++++-------------------
>  1 file changed, 27 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/=
tegra-kbc.c
> index a1765ed8c825..53f39fc155ea 100644
> --- a/drivers/input/keyboard/tegra-kbc.c
> +++ b/drivers/input/keyboard/tegra-kbc.c
> @@ -491,12 +491,10 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
>  	struct device_node *np =3D kbc->dev->of_node;
>  	u32 prop;
>  	int i;
> -	u32 num_rows =3D 0;
> -	u32 num_cols =3D 0;
> +	int num_rows;
> +	int num_cols;
>  	u32 cols_cfg[KBC_MAX_GPIO];
>  	u32 rows_cfg[KBC_MAX_GPIO];
> -	int proplen;
> -	int ret;
> =20
>  	if (!of_property_read_u32(np, "nvidia,debounce-delay-ms", &prop))
>  		kbc->debounce_cnt =3D prop;
> @@ -510,56 +508,23 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
>  	    of_property_read_bool(np, "nvidia,wakeup-source")) /* legacy */
>  		kbc->wakeup =3D true;
> =20
> -	if (!of_get_property(np, "nvidia,kbc-row-pins", &proplen)) {
> -		dev_err(kbc->dev, "property nvidia,kbc-row-pins not found\n");
> -		return -ENOENT;
> -	}
> -	num_rows =3D proplen / sizeof(u32);
> -
> -	if (!of_get_property(np, "nvidia,kbc-col-pins", &proplen)) {
> -		dev_err(kbc->dev, "property nvidia,kbc-col-pins not found\n");
> -		return -ENOENT;
> -	}
> -	num_cols =3D proplen / sizeof(u32);
> -
> -	if (num_rows > kbc->hw_support->max_rows) {
> -		dev_err(kbc->dev,
> -			"Number of rows is more than supported by hardware\n");
> -		return -EINVAL;
> -	}
> -
> -	if (num_cols > kbc->hw_support->max_columns) {
> -		dev_err(kbc->dev,
> -			"Number of cols is more than supported by hardware\n");
> -		return -EINVAL;
> -	}
> -
> -	if (!of_get_property(np, "linux,keymap", &proplen)) {
> +	if (!of_property_present(np, "linux,keymap")) {
>  		dev_err(kbc->dev, "property linux,keymap not found\n");
>  		return -ENOENT;
>  	}
> =20
> -	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO)) {
> -		dev_err(kbc->dev,
> -			"keypad rows/columns not properly specified\n");
> -		return -EINVAL;
> -	}
> -
>  	/* Set all pins as non-configured */
>  	for (i =3D 0; i < kbc->num_rows_and_columns; i++)
>  		kbc->pin_cfg[i].type =3D PIN_CFG_IGNORE;
> =20
> -	ret =3D of_property_read_u32_array(np, "nvidia,kbc-row-pins",
> -				rows_cfg, num_rows);
> -	if (ret < 0) {
> +	num_rows =3D of_property_read_variable_u32_array(np, "nvidia,kbc-row-pi=
ns",
> +				rows_cfg, 1, KBC_MAX_GPIO);
> +	if (num_rows < 0) {
>  		dev_err(kbc->dev, "Rows configurations are not proper\n");
> -		return -EINVAL;
> -	}
> -
> -	ret =3D of_property_read_u32_array(np, "nvidia,kbc-col-pins",
> -				cols_cfg, num_cols);
> -	if (ret < 0) {
> -		dev_err(kbc->dev, "Cols configurations are not proper\n");
> +		return num_rows;
> +	} else if (num_rows > kbc->hw_support->max_rows) {
> +		dev_err(kbc->dev,
> +			"Number of rows is more than supported by hardware\n");
>  		return -EINVAL;
>  	}
> =20
> @@ -568,11 +533,28 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
>  		kbc->pin_cfg[rows_cfg[i]].num =3D i;
>  	}
> =20
> +	num_cols =3D of_property_read_variable_u32_array(np, "nvidia,kbc-col-pi=
ns",
> +				cols_cfg, 1, KBC_MAX_GPIO);
> +	if (num_cols < 0) {
> +		dev_err(kbc->dev, "Cols configurations are not proper\n");
> +		return num_cols;
> +	} else if (num_cols > kbc->hw_support->max_columns) {
> +		dev_err(kbc->dev,
> +			"Number of cols is more than supported by hardware\n");
> +		return -EINVAL;
> +	}
> +
>  	for (i =3D 0; i < num_cols; i++) {
>  		kbc->pin_cfg[cols_cfg[i]].type =3D PIN_CFG_COL;
>  		kbc->pin_cfg[cols_cfg[i]].num =3D i;
>  	}
> =20
> +	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO)) {
> +		dev_err(kbc->dev,
> +			"keypad rows/columns not properly specified\n");
> +		return -EINVAL;
> +	}

Previously we wouldn't try to initialize the columns when the
rows/columns were invalid, so this block could move before the last for
loop above.

But it doesn't really matter given that these are exceptions and really
shouldn't happen, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--ls6njxuxikia5hmn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbN4XAACgkQ3SOs138+
s6Fhhg//YNQM9DAFPrJ0NZNR1q0bkfReBPV5AxA0d7vnZWz1dCKh1gdH/oqrY+iy
wel89umYronWEvbVAulm+F+tmH5oCh8D4A5Oe07KnLN/OmDLFwa73lxIaKg+eOBN
d8p/h+VI4/cI7vI3YORbd1uWeMzdkJYcK6N/f1Y70NMQfVhKcA6y40xJuO5Jfasa
y6qTLyWYQh4xX/mucGBowx/lSJW4EkkoZ9/83C6WM0kZQVJl0beeYt37ITIV6PeN
OYnsDYHpe9gLLNHA9b9X05rprm5vie9aEhZDbK/c+CM0mZkNE6UOqfu/nB3X9yd5
gJjww+ntOUFqMqqbdXhE7sgD2KY+wrSy7AlIWbM7JFj2IeupH6x+Qo4pnquMSr5j
ZgjLQSXZzaaAR9FwHkw9vQ3Fh/suvIAS1e6wVqBzb9Gxs9huEaoq0vbky2V//n9H
bbsriE4nGMgJj2rEOO1OvXo+nUju/JX9jLuojLX7nooWiQHVDvMGMMw9J3PVWsNX
/NlkN3C4DMRoLsND6oBvNecrTEBpz8vv8NnsAu6qE09zvXORmGs4YP/uO8ER2TBc
Zb4Z9s4yutkaXZqQceqF/1tJjQVxRlBRThiuX/wTF7s96mrAzG1kk3p/FiDsa0xR
3lkX219OjNJZBqiHXC2CjK8pfXsIgF6QBO5yPuCTDoTfP651wN0=
=pp6c
-----END PGP SIGNATURE-----

--ls6njxuxikia5hmn--


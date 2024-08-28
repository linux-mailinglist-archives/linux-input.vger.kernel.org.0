Return-Path: <linux-input+bounces-5932-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DFA962B1D
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 17:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C60A01F25D96
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435E418A93C;
	Wed, 28 Aug 2024 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkaMqtnW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BD718A6BF;
	Wed, 28 Aug 2024 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857531; cv=none; b=tXuG3A2LRsQr4Ru5HRMGvb/k7QEP5ywf7uD7mXTVL9SwfEsfiZ3LDX0kk6Fh9+zKGwVxvL2MRO0tx7PDYwx/dKHDDPQn2a2QRrHn/9dgzfadVOQ4cZkPddO+NvL8SWFXhTTlwg4XTp/qrgk9ox7lDwIsnnDK5v2cjQjKgtTPvcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857531; c=relaxed/simple;
	bh=rBWjztV8PP9csww4505tfO9i5qE1OCP+OiWKXXvvoOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYsJoW9UZY21GBLj2S5O9xkd9JDLZsKLOcFl0h+mvgPuNAbXQPVIArS3E1YoiBIoew43J7YMD1DBf+U2zvzQJPlJCEilSctgT4BH6Ntv9qg1eR4G7eNyjKn7fhi/wAKs8F67YEoUp9KMT79QgetvcMqVXitzcBmEHOZ+Y4rKidE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkaMqtnW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42819654737so58796155e9.1;
        Wed, 28 Aug 2024 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724857528; x=1725462328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yedboNbvH10+nnxgh+WE+y6e1g/QufcL4t3757uSSu0=;
        b=EkaMqtnWGnofdryQSVJVdED/sMgqCgobN7FVaTvoGPG/CDDfh/5Emwa9L6cmv4+iA8
         mZp+GRqJL5mbLUa7Wi9SOPwNIMYsZ0jVeGg6u/cfNyTIUkPM+li7iDoerlRJLx1DD6Gj
         aswAoA0t29GX10ZLdjd7Pbg/1bU8pWPM6Ul9PY1ZwSg7HZjKITe2G7gey2CeUs/bnThT
         73miNFCuzHUi41gxUr+QLToJoEy4lOSfCC5A9M5/uDDlISx/gtkxcCxFUPVMD9wxyxj/
         /aA9/0oroCJQ+Cvv1CTzjA2dLZfF/MUZCb9v3m/xbpoUWEjV/gr/Ap1BlWZf28VfbsRz
         3P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724857528; x=1725462328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yedboNbvH10+nnxgh+WE+y6e1g/QufcL4t3757uSSu0=;
        b=k0C+eH9dS+jOMOT271QGIDdFn2jvS/GaGct960uANEafmsowfv4kf3XA01oBKSYH9M
         ZGl+oD34g+9IrfqGzS7gdSWNYiWjSPnUvSaa5lsVteESFKaVa1ahkS/qLdVRcPVNZXnK
         nGJxWWL5TKWm8jSk6FN+RNi5zHrEZPqsiRsgJYgn0JZQrT32BxKoSCOsmMSlAWFYgixp
         yVPQZklklkloIobb5xAHDkf2zL247BiBQlzEam+Yb1/sUZYRC9Cnn6/7BuvXxy9tzH91
         ypMas/4UDNzxsBbhHuoNRz6352pjLfdFl8sN4OEvw0jEAgw+dzFVRvuxkwW928Vy7iIQ
         6MJA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4/rv5lTmS5CM8NviaxumPOi+MthnGhYl29S4hiUo3RT6JX68wGmeRYTZOr+T7U2F1l6BpqpmgLhMUIzD@vger.kernel.org, AJvYcCXQoe+eevKIErbn3ZFlt/H9tR5B6pz7wjFDC0bLjFdBSwOtwynY96Pj9oqUn6gE1W9TSTGy6DxcE/43ew==@vger.kernel.org, AJvYcCXWijKPTIdrsb95XcqiKtdVaNYxUHbIoXRaJNAnEEK0aCD5g/nByMFRIYIW9UOe/orvplunrPxvGB7x3h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHtUd4896ngpp4NPwnrLZArElIuUeBxhPQIw0gkFBMV0KVZFf1
	vGL6kmR0dF0esZC4+nyz79DDe0D2DULr7x5U3/XEGbjIx5Pi+jws/MksJpNV
X-Google-Smtp-Source: AGHT+IF4fvCFMps4F++OGQe0T1hdx538HBCPuPEwhTe7O/lhnlrkfk+32g6ZnSQbyPFJh6sCFdYIYA==
X-Received: by 2002:a05:600c:3155:b0:426:62c5:4741 with SMTP id 5b1f17b1804b1-42bb01aa13amr360845e9.2.1724857526345;
        Wed, 28 Aug 2024 08:05:26 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba641dad0sm23979585e9.30.2024.08.28.08.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 08:05:25 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:05:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: tegra: Use of_property_read_variable_u32_array()
 and of_property_present()
Message-ID: <dzy72vldawenpz3al6i633yiskf64yxfpqknp63jxlmn4nhz3o@kp3j5hf4y75w>
References: <20240731201407.1838385-6-robh@kernel.org>
 <zyzygwdfncus7nhnu6sgbc2wzjpih3dntgdogorg3it4vc7r6v@aufrf6kwqun3>
 <Zs3yfc1pJDkAwhzc@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6gebfjyyi6zlqde4"
Content-Disposition: inline
In-Reply-To: <Zs3yfc1pJDkAwhzc@google.com>


--6gebfjyyi6zlqde4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 08:36:29AM GMT, Dmitry Torokhov wrote:
> On Tue, Aug 27, 2024 at 04:23:48PM +0200, Thierry Reding wrote:
> > On Wed, Jul 31, 2024 at 02:14:01PM GMT, Rob Herring (Arm) wrote:
> > > There's no need to get the length of an DT array property before
> > > parsing the array. of_property_read_variable_u32_array() takes a
> > > minimum and maximum length and returns the actual length (or error
> > > code).
> > >=20
> > > This is part of a larger effort to remove callers of of_get_property()
> > > and similar functions. of_get_property() leaks the DT property data
> > > pointer which is a problem for dynamically allocated nodes which may
> > > be freed.
> > > ---
> > >  drivers/input/keyboard/tegra-kbc.c | 72 +++++++++++-----------------=
--
> > >  1 file changed, 27 insertions(+), 45 deletions(-)
> > >=20
> > > diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keybo=
ard/tegra-kbc.c
> > > index a1765ed8c825..53f39fc155ea 100644
> > > --- a/drivers/input/keyboard/tegra-kbc.c
> > > +++ b/drivers/input/keyboard/tegra-kbc.c
> > > @@ -491,12 +491,10 @@ static int tegra_kbc_parse_dt(struct tegra_kbc =
*kbc)
> > >  	struct device_node *np =3D kbc->dev->of_node;
> > >  	u32 prop;
> > >  	int i;
> > > -	u32 num_rows =3D 0;
> > > -	u32 num_cols =3D 0;
> > > +	int num_rows;
> > > +	int num_cols;
> > >  	u32 cols_cfg[KBC_MAX_GPIO];
> > >  	u32 rows_cfg[KBC_MAX_GPIO];
> > > -	int proplen;
> > > -	int ret;
> > > =20
> > >  	if (!of_property_read_u32(np, "nvidia,debounce-delay-ms", &prop))
> > >  		kbc->debounce_cnt =3D prop;
> > > @@ -510,56 +508,23 @@ static int tegra_kbc_parse_dt(struct tegra_kbc =
*kbc)
> > >  	    of_property_read_bool(np, "nvidia,wakeup-source")) /* legacy */
> > >  		kbc->wakeup =3D true;
> > > =20
> > > -	if (!of_get_property(np, "nvidia,kbc-row-pins", &proplen)) {
> > > -		dev_err(kbc->dev, "property nvidia,kbc-row-pins not found\n");
> > > -		return -ENOENT;
> > > -	}
> > > -	num_rows =3D proplen / sizeof(u32);
> > > -
> > > -	if (!of_get_property(np, "nvidia,kbc-col-pins", &proplen)) {
> > > -		dev_err(kbc->dev, "property nvidia,kbc-col-pins not found\n");
> > > -		return -ENOENT;
> > > -	}
> > > -	num_cols =3D proplen / sizeof(u32);
> > > -
> > > -	if (num_rows > kbc->hw_support->max_rows) {
> > > -		dev_err(kbc->dev,
> > > -			"Number of rows is more than supported by hardware\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	if (num_cols > kbc->hw_support->max_columns) {
> > > -		dev_err(kbc->dev,
> > > -			"Number of cols is more than supported by hardware\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	if (!of_get_property(np, "linux,keymap", &proplen)) {
> > > +	if (!of_property_present(np, "linux,keymap")) {
> > >  		dev_err(kbc->dev, "property linux,keymap not found\n");
> > >  		return -ENOENT;
> > >  	}
> > > =20
> > > -	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO=
)) {
> > > -		dev_err(kbc->dev,
> > > -			"keypad rows/columns not properly specified\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > >  	/* Set all pins as non-configured */
> > >  	for (i =3D 0; i < kbc->num_rows_and_columns; i++)
> > >  		kbc->pin_cfg[i].type =3D PIN_CFG_IGNORE;
> > > =20
> > > -	ret =3D of_property_read_u32_array(np, "nvidia,kbc-row-pins",
> > > -				rows_cfg, num_rows);
> > > -	if (ret < 0) {
> > > +	num_rows =3D of_property_read_variable_u32_array(np, "nvidia,kbc-ro=
w-pins",
> > > +				rows_cfg, 1, KBC_MAX_GPIO);
> > > +	if (num_rows < 0) {
> > >  		dev_err(kbc->dev, "Rows configurations are not proper\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	ret =3D of_property_read_u32_array(np, "nvidia,kbc-col-pins",
> > > -				cols_cfg, num_cols);
> > > -	if (ret < 0) {
> > > -		dev_err(kbc->dev, "Cols configurations are not proper\n");
> > > +		return num_rows;
> > > +	} else if (num_rows > kbc->hw_support->max_rows) {
> > > +		dev_err(kbc->dev,
> > > +			"Number of rows is more than supported by hardware\n");
> > >  		return -EINVAL;
> > >  	}
> > > =20
> > > @@ -568,11 +533,28 @@ static int tegra_kbc_parse_dt(struct tegra_kbc =
*kbc)
> > >  		kbc->pin_cfg[rows_cfg[i]].num =3D i;
> > >  	}
> > > =20
> > > +	num_cols =3D of_property_read_variable_u32_array(np, "nvidia,kbc-co=
l-pins",
> > > +				cols_cfg, 1, KBC_MAX_GPIO);
> > > +	if (num_cols < 0) {
> > > +		dev_err(kbc->dev, "Cols configurations are not proper\n");
> > > +		return num_cols;
> > > +	} else if (num_cols > kbc->hw_support->max_columns) {
> > > +		dev_err(kbc->dev,
> > > +			"Number of cols is more than supported by hardware\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > >  	for (i =3D 0; i < num_cols; i++) {
> > >  		kbc->pin_cfg[cols_cfg[i]].type =3D PIN_CFG_COL;
> > >  		kbc->pin_cfg[cols_cfg[i]].num =3D i;
> > >  	}
> > > =20
> > > +	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO=
)) {
> > > +		dev_err(kbc->dev,
> > > +			"keypad rows/columns not properly specified\n");
> > > +		return -EINVAL;
> > > +	}
> >=20
> > Previously we wouldn't try to initialize the columns when the
> > rows/columns were invalid, so this block could move before the last for
> > loop above.
> >=20
> > But it doesn't really matter given that these are exceptions and really
> > shouldn't happen, so:
> >=20
> > Acked-by: Thierry Reding <treding@nvidia.com>
>=20
> I don't quite like of_property_read_variable_u32_array() because it is
> OF-specific. device_property_count_u32() will return the number of
> elements in an array. But I guess this driver will only be used on an OF
> system...=20

Yeah, this hardware only exists on fairly old Tegra devices and I know
of no plans to support anything other that DT on those.

Thierry

--6gebfjyyi6zlqde4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbPPLEACgkQ3SOs138+
s6HRyQ//Z5zUc0b2yHPKBUhOkNiceSBCp89B7W9vnR83xsR79jCAcCeivCc3zWrZ
bE9QOoTSpeWYjqIPnrdJM1aoJBMvQ06hT7ILz6nEv9m2+LFhRdaeM+EE1dqesnry
W3eNJbeflsBIUT9mBMJfN5bphW5mxjUZ9HmqsvVGGjmXYgmkVdMYpZS9VS4EKxBp
VvuWEgssH2MLrJVbllzM9tOdlMr00zgFnzQt1DYVDq7+vDftesuMfqi/WVCnkVGy
3qyUAwQouEtiULzMVJNiDr2yL4gKYZrxleOqmT9aPgphJfmbyvAN1HJOo+XLljGu
HxlLtgclQeSBvwkJtE3lld68+qwpbA3W+jTpWraTCCBEEoAM2/4TBz1GbtF4k1GN
DDGQ+x6hKtd+DkHNdQxVAuU6c8rm/yfO11+Z/AkGVsLs8ngu4ax6Pjm/LZaY94Vp
sWbpK+HR7YU6tmUJXADPtPzAQMtEEEDZK1BdpsUc8epCOI1rF8a+ImRBGd5x36RC
a9nhQjvfJyz+PFpQcxztqHNmrA1C1i14dMGRm23eYVyMalL0R+9cFHJSOSnYuAlH
FQICEeSAVB+cTkenZ59iXnE/bl6iN21mCPlcr1QlWnXaqveTOtSCMOGYNWvOY9/f
/DsAZ0PDU2Qx2I7L8rOBUR5FTO7An9QM20qnWVJ8VqDqB2VOorA=
=aTMs
-----END PGP SIGNATURE-----

--6gebfjyyi6zlqde4--


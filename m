Return-Path: <linux-input+bounces-10350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E28A444EC
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 16:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C5E342053C
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 15:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273CE1624DD;
	Tue, 25 Feb 2025 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kPyHM3yg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA61547CA
	for <linux-input@vger.kernel.org>; Tue, 25 Feb 2025 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740498442; cv=none; b=Hjc/68Erlij66BUv0K3GSp8JuYHrjzQiRHoVfFN39tPNSN1+xlWnsOVhm1a3qMc60tu2dnzTSWNDH4Lf9X0CyAckOD5zsPSGAlM7cqCv7/g7dbyblOXGDj7wJ9NdoZuEJMUG4MsT1idozalNyLUmzEFlRlqi6sw0STMD09PEsFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740498442; c=relaxed/simple;
	bh=zk6bicPnPeHDRfcDyxulStrgL6rN1JQbN5GdNzuumig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZHMxqolQbfTungWBN/xrw35wsEV0+Kh43WlHwpu9E+FDY5JOJVwlaNcZlIp2jOmfI/0nZMo1d95XdK8EH9E9NsQmgeg64LSyRMw8WhWpbjX0HQcWryS1LMKb3nLWqug2YhhowXfeEB5qPQ9fD1RXEyeV859guILGBHHMdkewEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kPyHM3yg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso35775815e9.0
        for <linux-input@vger.kernel.org>; Tue, 25 Feb 2025 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740498436; x=1741103236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RL7ikpdpwTIHUvgLFfPq1GGLDdUjM4D8YM1CAoVeQq0=;
        b=kPyHM3ygLymE9N6fyWY1U6Dm1xuSwucDzN+tWH2v2smPJeQtqOsySHFwouBppo2Dpk
         KGpnzWHjnGapk3tCMN/g2x8IqJGxeR1R0zeIpnVXTzEb3+4jjHzjbpM5+Mk8TZCcRW8q
         xcLgdAETUHsk1rTPfPnXgYsx6XA++MupBKQCN4g1WpPtKv6tvj3c3RuyGWTSxODP6xNp
         84ZGtb/Qx6SOdmFW3Lhi8Sr2UG1wmSrXFxlxXAzVg5z76lGKJW47NU7ODfVg8pe3uR8C
         L4dsHNUGTBc2T+ZePkDe5P/thc9Uw7FnRbMX5+7oQRUIs8iFF7lB3MaZ/DiDgb0m16hN
         epwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740498436; x=1741103236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL7ikpdpwTIHUvgLFfPq1GGLDdUjM4D8YM1CAoVeQq0=;
        b=Et0WWXh/T7/V2iZjuLKXF/Fga/tmsB9bCxn6oz0PVv111YLaa+EhMBL0uiEWsbuIbv
         pMrBp0yb8B0qspAqtG+aT3Vmv/24VHfzSTElG92RTnfsazSuFsNUGluNneyJG2gwi3E4
         +eA3Nj1tAsEU/WtpILqNm2GOjfsDScxvRJ8NKPAV0uUxqZNuIb0w9gyAGjaxbuYuAk3B
         g1aFX99FppN4HvEkHYWvTQ0VSLj5sWB0PqPCIOfWBkMkWmzWV3oKJb4NaAZgEfqoknr6
         dTDDkqDAY21NfmgI/9G7UhS5e56n4lIltazPc2CJTbSWbo2KWofXKhAsiEPYKfozTame
         H0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXaMuuDsFtTxgGR71NGKmhj7tOO+19VkX3qks+w605Dv8todRaDeFG2jPlLxS4YCeo1Y85Oxe9lGDZ3PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1otXYEv3t9CejEXfz0A2+Vv4fvgUhlwABj+L0cLR5dVD5cD51
	qudwGATRL88wahj8YV3dwa9Xg3oIKkieMyRk5+c0l+GgmT5/kWq3SD1Suk0iUwk=
X-Gm-Gg: ASbGncsVWeaoV59aSlaAwMMf3ELhS/v0jCL15Jmo83PhPFTZb/bLuoWO+ohfTyuGrbu
	Zq7SmSIclGLJmUNqNHngXbadTY+mqVcyIQ/bC6CY6PBhHlcmf+wU1ZQEiFEuf1+/3yf4u9lw93O
	KNGx94XTKdOTjAnestXC6yzDfeU+Yzy1GD+3gWs6S0mxtsSu43ry2Isme63169GIMsQpyqtMkKj
	lhmkctNa5ew2AFrfbrL+bKuFqeGNAPIQ9h8I0YyfwXCE/OLpP5KX3MJPiW+THFJxyhyvu0bOE7Q
	aVDxje0ez5sSajSNmeIPg0+PfedBQoeF+IFN2z7vK6ayxvPyKY8f3DVaKJ0BAwxsdHPy
X-Google-Smtp-Source: AGHT+IHtPuDfuhLmrc1DEpJvBrIbtOvABx17RUyOzeb8wjvJkw062EMza3VLmzP2KVFZ1hOuW1Hblw==
X-Received: by 2002:a05:600c:4753:b0:439:a1ef:c238 with SMTP id 5b1f17b1804b1-43ab0f3cc86mr32918495e9.13.1740498436294;
        Tue, 25 Feb 2025 07:47:16 -0800 (PST)
Received: from localhost (p200300f65f083b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f08:3b04::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f23c2sm147993495e9.17.2025.02.25.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 07:47:15 -0800 (PST)
Date: Tue, 25 Feb 2025 16:47:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Jiaoliang <yujiaoliang@vivo.com>, Oliver Graute <oliver.graute@kococonnector.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
Message-ID: <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
References: <20250225145332.1116557-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bmiwcubc5vrvxiy6"
Content-Disposition: inline
In-Reply-To: <20250225145332.1116557-1-arnd@kernel.org>


--bmiwcubc5vrvxiy6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
MIME-Version: 1.0

On Tue, Feb 25, 2025 at 03:53:26PM +0100, Arnd Bergmann wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> When compile tested with W=3D1 on x86_64 with driver as built-in:
>=20
>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunu=
sed-const-variable]
>=20
> Ideally this would be referenced from the platform_driver, but since
> the compatible string is already matched by the mfd driver for its
> parent device, that would break probing.
>=20
> In this case, the of_device_id table just serves as a module alias
> for loading the driver, while the device itself is probed using
> the platform device name.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/lkml/20240403080702.3509288-8-arnd@kernel.o=
rg/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/input/touchscreen/stmpe-ts.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchsc=
reen/stmpe-ts.c
> index a94a1997f96b..3900aa2e3a90 100644
> --- a/drivers/input/touchscreen/stmpe-ts.c
> +++ b/drivers/input/touchscreen/stmpe-ts.c
> @@ -366,7 +366,7 @@ static struct platform_driver stmpe_ts_driver =3D {
>  };
>  module_platform_driver(stmpe_ts_driver);
> =20
> -static const struct of_device_id stmpe_ts_ids[] =3D {
> +static const struct of_device_id stmpe_ts_ids[] __maybe_unused =3D {
>  	{ .compatible =3D "st,stmpe-ts", },
>  	{ },
>  };

Following this we have

	MODULE_DEVICE_TABLE(of, stmpe_ts_ids);

=2E

With=20

diff --git a/include/linux/module.h b/include/linux/module.h
index 30e5b19bafa9..014f033ef1ba 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -250,7 +250,8 @@ extern void cleanup_module(void);
 extern typeof(name) __mod_device_table__##type##__##name		\
   __attribute__ ((unused, alias(__stringify(name))))
 #else  /* !MODULE */
-#define MODULE_DEVICE_TABLE(type, name)
+#define MODULE_DEVICE_TABLE(type, name)					\
+static const typeof(name) *__mod_device_table__##type##__##name##_ptr __at=
tribute__((unused)) =3D &(name)
 #endif
=20
 /* Version of form [<epoch>:]<version>[-<extra-version>].

the warning goes away and stmpe_ts_ids isn't included in the .o file
without having to add __maybe_unused to the driver.

I would consider that a superior approach.

Best regards
Uwe

--bmiwcubc5vrvxiy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAme95gAACgkQj4D7WH0S
/k41fAgAsiG8eMcqxYHNh+Ky669sked7nMyC/TQEQFV0SUv+wg92u8/vFDlkldP7
H6WjVz3r08uWIyg04k+7e2ybBjuwwbRgCfHMDsht96y2I0dFuviQ+krb4laT1lty
TJm0S+x18lKbJ+/wChNRi2JJ5NImAyjHS++f7KzDKWCo1pkNYk4R+mEUkdPeT1T7
EEY7bC3rgUELAmTkj2+wJCkXgXpLH98JXtQK8d5jjhouR1XpfsGFYf2dk+jKRG80
lZOE50QtJYOXkT9u0RLFU4R2dAMwsSEWB8lWbbBPiOY9dGdYvSb0+h6/4haQflbG
0i7od2UQ4QTAXLquHYDOUHpV3+yyuw==
=/Pv1
-----END PGP SIGNATURE-----

--bmiwcubc5vrvxiy6--


Return-Path: <linux-input+bounces-10359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC53A44D67
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 21:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3499D3B51A9
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 20:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAF3211294;
	Tue, 25 Feb 2025 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="f3CidMqV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0AD210185
	for <linux-input@vger.kernel.org>; Tue, 25 Feb 2025 20:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740514664; cv=none; b=MMsZhuvV5AtstDJiu6OGyYUJGj8Rm4qilWoP0XygFm204GDNiNOsAb/PBERSe1B43E5Yvkh8dEA8gt73fA+TfFJk6H1O/BgGNrmnPlC3BT8t4IVHiGBVdgQDssx3Owi6YF3PMXklngACukkMz4UoSWCk9wngKUStT5eREiIoucU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740514664; c=relaxed/simple;
	bh=xQ/VDIFwNq5DynkE8GpRx2Gee70xfWT81k0I6H00OsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwVIPwINIfkcKMA3L9ZzFV+gjUsi//EZ1s/rTBTSosXH+1aPa+K/nvbIDOj4LCOA1wpOIiRAXvGaQPCzQriYTd00I2cuxOLd6wMBx2dday9odD8s3tpOMrXeJnRjF5bAMERmPBOkNJrq1KxT8e2nmtpPnvoZyMmzipJpUGPX4/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=f3CidMqV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so9514148a12.0
        for <linux-input@vger.kernel.org>; Tue, 25 Feb 2025 12:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740514660; x=1741119460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9oqKP1MS3Cu+ZpN/VBDxQixq+TL+46JCnPqhnNV9a8M=;
        b=f3CidMqVNuM3w81MLJlSTkC69XZyGnzL4M4NWO9jgynSUgSOuCoxxlmbOUFYupm1ys
         n4/yF1yvwsskYeXXsHIguGUcT+U0d1U3N97qJT6rI1UVLuH3E+a9k2N8VqBvpU2wZoQC
         au6A71yYAJ1iwjDdFdxCAR+KQzmJwl2XA5x/jyhoQ0HbyFehdamG/Cimp8rTDv5/m0HD
         aaxuDM4GQMuTVaJJp9FnWobNcUovqab+URN88Wom3/zWW6GQU8otjMqVaP276+idw0qT
         LhNPxgaX9FwjFzHQKw0RjZuaiNW9Cf5B2qDdEwy/UsqFaUOXtZ0xFIxey8sVdiEiD13A
         dj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514660; x=1741119460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oqKP1MS3Cu+ZpN/VBDxQixq+TL+46JCnPqhnNV9a8M=;
        b=GoMSudU0IC/Wkpc0dPE7Lr9Y5DVOWp7vLvP808Dtq0Ad/0MF/vBYmUEj+KTvLfJJLm
         sDvgQ9GDXU9nYL0/ADYFS1pxmybdjKiXtB/NA7JJg5QKeBHS0QL9mZ8PHh7I7SEKA1QJ
         xqpRmZhES8Q4G5mK3P0GtzeeCnjvj3GdbDPBRhIvvube8opwgF7mWBRpZ8xHwW//kXrl
         /3E4lYEXca5rnFri3DNYiIkFTDpNP+Fwxx3eU9JYdMK8DJeKb5SMjicrYAAT8FOsoxGM
         Dv8H4qPTFKdfQ4EXtOo6k2zVJSJrN92xHAosbuPTd3rIUqG0JQOwr9YSs9UDbPjkotOt
         FzDA==
X-Forwarded-Encrypted: i=1; AJvYcCVIgVmW1ALEOrbNZPd5aHftaFemWEMkqcFLmQLQbW9NMlWrcruqHQKHs5t4djPEZnnDe9w3anuwmM9kAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGc+PrQoUwFFqWe98dVAYzP4sAjGI4fqc3zIwIZJKgAmmUNB0Y
	wpqBmpVlsItcT7ErGE26mTukzoN2v/5NKE4yejnRm1OpzXLSawyu4vSTjPXIvXY=
X-Gm-Gg: ASbGncuFWSrnCIXSGcH+5liUr2oAeQcHk5OystiYt3jcNzKea/gl/JUQ8Ysh6s3wtsN
	R5IqbtAiZt+/zzoZ/RQBvllcm/6sb3OA6jXvF5tDlUgX+1SkkY7mMoe2nv0fZwTGE3Rkr+1jsAh
	ltJQziWzMlgN3OlZbiBhFM8fwjClDBOxFsGcE9vFjsddIzyOnMBIjf+/5rQ2ZF8YL5KjqHfCiYh
	hxvU5W4VMPo8eYLcw4lxmxEazjIXq8yKTcumEUSiqNs49pKAfVuOv51prkdhAhI8nXqm28DfGlP
	X2FISvZbP+DtwAV3pc6giDEIz6snaRg=
X-Google-Smtp-Source: AGHT+IEP4H83eueMuTFXJWlrHU2PDik7Lal5HqZTmunkxw5tmpnhf4TdWmcw3iZXzovmtEQLvNVBdA==
X-Received: by 2002:a05:6402:50c8:b0:5d9:a62:32b with SMTP id 4fb4d7f45d1cf-5e44448118fmr4326163a12.7.1740514659840;
        Tue, 25 Feb 2025 12:17:39 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4518460dcsm1697685a12.0.2025.02.25.12.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:17:38 -0800 (PST)
Date: Tue, 25 Feb 2025 21:17:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Yu Jiaoliang <yujiaoliang@vivo.com>, Oliver Graute <oliver.graute@kococonnector.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
Message-ID: <ccjng5mrvqngfg6eujq6mtl6dj2sz5vsqvjoqz6gm5ntcibduz@wqoc6zhchrvv>
References: <20250225145332.1116557-1-arnd@kernel.org>
 <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
 <a6d10d80-79d3-426f-9dc8-0ddab77e89d9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f55raej2e5xwtv3g"
Content-Disposition: inline
In-Reply-To: <a6d10d80-79d3-426f-9dc8-0ddab77e89d9@app.fastmail.com>


--f55raej2e5xwtv3g
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
MIME-Version: 1.0

Hello Arnd,

On Tue, Feb 25, 2025 at 05:25:05PM +0100, Arnd Bergmann wrote:
> On Tue, Feb 25, 2025, at 16:47, Uwe Kleine-K=F6nig wrote:
> > On Tue, Feb 25, 2025 at 03:53:26PM +0100, Arnd Bergmann wrote:
> >> diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touc=
hscreen/
> >
> > With=20
> >
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 30e5b19bafa9..014f033ef1ba 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -250,7 +250,8 @@ extern void cleanup_module(void);
> >  extern typeof(name) __mod_device_table__##type##__##name		\
> >    __attribute__ ((unused, alias(__stringify(name))))
> >  #else  /* !MODULE */
> > -#define MODULE_DEVICE_TABLE(type, name)
> > +#define MODULE_DEVICE_TABLE(type, name)					\
> > +static const typeof(name) *__mod_device_table__##type##__##name##_ptr=
=20
> > __attribute__((unused)) =3D &(name)
> >  #endif
> >=20
> >  /* Version of form [<epoch>:]<version>[-<extra-version>].

Hu?

> > the warning goes away and stmpe_ts_ids isn't included in the .o file
> > without having to add __maybe_unused to the driver.
> >
> > I would consider that a superior approach.
>=20
> Not sure, I can see how this avoids some warnings, but this is
> currently the only remaining instance of this problem (I fixed
> another two recently), and in most cases a MODULE_DEVICE_TABLE()
> entry that is completely unused ends up pointing to a real bug,
> where there is a table but it's not also part of the
> device_driver definition.

It might be the only instance without __maybe_unused and so triggering a
warning. But there is also:

$ git grep -E 'of_device_id.*__maybe_unused' | wc -l
231

$ git grep -E 'mdio_device_id.*__maybe_unused' | wc -l
58

Best regards
Uwe

--f55raej2e5xwtv3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAme+JVwACgkQj4D7WH0S
/k74zAf/dGlacxqVy9vAqpyEEhNrerDYdon6jOL4XYedysGHXBDPOFK38QCnWC6d
19Lu/uVu0sftbAmTRLbUOjCAQ5sLlJLOYIsoeXm03OQ1u4DjDS12Xz43uphpMlBX
jl5NMQs6PApcy7z+KPjuc0mcHnhFse71fpWfNyCxN7l2KAIRkCRXqLWgZ8eJfeLV
pLvIN4/VkcCzIXXP7qLJrz4ZezjGkjvgxBaMVH2DVmkxHymmo0RycjP2QooDJAk7
S6iir9ZFD+UfFeujJBsx70rkrsJ3dXSGNn97DNiulacw7UwLU+aUxjs89g/DIsPA
9+qrSzSEFDXZZSOh2ocNUbgfzl9mPQ==
=d8EH
-----END PGP SIGNATURE-----

--f55raej2e5xwtv3g--


Return-Path: <linux-input+bounces-4800-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C58A9923B45
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 12:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75AD51F2268A
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 10:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DF8157E93;
	Tue,  2 Jul 2024 10:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y9Swqb4w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2336E157493
	for <linux-input@vger.kernel.org>; Tue,  2 Jul 2024 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719915591; cv=none; b=Hxka4/jNB5mRGMCibxSxknDMN9Ml12reX8Aw0U3jrYPRjDBqfuiN7RZqfBEZQeSTNQPppvHp+uKwoI+rN2LgEybmFSMjAqyDAEDQQgsErepUGkrOzqVzu8al1RGzVkPdE/N312pu/wNV2GEmfuwE9nKE2b4sBuMjXZcdBqVH7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719915591; c=relaxed/simple;
	bh=iASb4mFaCA1mGyLnSaInhkogh0SiH7h3O5iw/JGXY60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTCkPg5nYq5K+iPFMXXWHEGk9L1+kamMN1z6ssbL72cFTUzVl3NVmqzK14YFHMoT3Uiiq6xaBtTwjYxQeg6rgpoNz4mnzRXOBKWy8C6N8YcWHajLE8H5O3nDJPeCG/Wj5oLHM6JuD5qbHXe9pv5y1H9mw/+aAFcOmjiO4v8Reos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y9Swqb4w; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36279cf6414so2284907f8f.3
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2024 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719915586; x=1720520386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv2h52jg3CDkKh/SsS1wJTZb3EYxXC7TlxMAi17OeX4=;
        b=y9Swqb4w3yrGxCR/ExHVUFHpLf1T9bUVERrMJIbpGUibjlvT0cn1HYBmR/toJlYr1L
         gv67DgYWqY8mzRrglYzZQ/77yeM4E+2KbtUMqBnaBQ+UDdqpsm4cC1qO/kNGzT7JXhu6
         AKuUT7VwnmGe58bcX+B4y/T889fBP+1pGWFXRFJqjb56RYEEu5L7JDmnoA+SFn5Mu04x
         13f6HuZnVDJ4Mtgpe3vLAwbGKYCzO+5SBr6/WmXmwq1L04AFtPHOL4ubD9Pd8ouNAD37
         AFto1RzajxttL12Wu1CXJhA1bNq5rfbC9BcEWdBZXDyOzy3SOb8vtoXcDIqvWjbZLnKv
         3BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719915586; x=1720520386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv2h52jg3CDkKh/SsS1wJTZb3EYxXC7TlxMAi17OeX4=;
        b=tnxqSOEulJBYA7+/nW+tyG9aL5BncT8+s2EjbvUMpYcNk+TuUibXlL5h5UiCzA0Wru
         aQ24DCjzj/VdcLDb+OlaRxcjeBkVrpg54gZDm1chuLX8m+YBwto0Mr94u5TGFSZIFPZY
         gqj7RoFtMkXmu4U++NwrfNeYIfg5Q+HjZ/xrQnxgZj0LTM5JF/LtQNv261Ni8HSHSthE
         CcEZq7C2UpJrkRCGCPpN/lovpXSx0p/XpJ8DmuL+SEwxY8qrOmPJZ3H0eEV8wAkofJU7
         0W8gFzyn7UVO1mVBstfBbBiKWP7jyUH/hvRlTBXJ6PZlDEsn1nlfXpDvc5Cq6UhBeD85
         k0qA==
X-Gm-Message-State: AOJu0Yz/rMT7k9Tfl7mVS/VcApAjEbvYrNv4NkAcx72GvjHtJ5p9hd60
	stNTfylv3RfLNGYSxfbuhM5sLW77HV47XSG9OXjfttfMvZuQ9L3jJnocGVd5r7QTH5tu5ABJpvC
	S
X-Google-Smtp-Source: AGHT+IEekbbio7airbsJZYsCDUx7+/iVeE8bQb6Waz6tKXb0dZMeHnPJDYjoYXjlVLTT4BmeOx+BwQ==
X-Received: by 2002:a5d:5983:0:b0:366:f7d7:ca51 with SMTP id ffacd0b85a97d-367757247dbmr6414060f8f.55.1719915586231;
        Tue, 02 Jul 2024 03:19:46 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678e06eba4sm355400f8f.90.2024.07.02.03.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 03:19:45 -0700 (PDT)
Date: Tue, 2 Jul 2024 12:19:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] Input - Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <gi5gmbufzymwhiplhum7tkfdy6zwycrkgos4tp2lyddycniayq@g3zt7xq7n77g>
References: <20240509174158.2211071-2-u.kleine-koenig@pengutronix.de>
 <ZkKZ50fQGdr8Opv0@google.com>
 <ZoM0Ttysx91ZemKS@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wvb656jwvi6kkfxd"
Content-Disposition: inline
In-Reply-To: <ZoM0Ttysx91ZemKS@google.com>


--wvb656jwvi6kkfxd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Mon, Jul 01, 2024 at 03:57:18PM -0700, Dmitry Torokhov wrote:
> On Mon, May 13, 2024 at 03:53:27PM -0700, Dmitry Torokhov wrote:
> > On Thu, May 09, 2024 at 07:41:59PM +0200, Uwe Kleine-K=F6nig wrote:
> > > These drivers don't use the driver_data member of struct i2c_device_i=
d,
> > > so don't explicitly initialize this member.
> > >=20
> > > This prepares putting driver_data in an anonymous union which requires
> > > either no initialization or named designators. But it's also a nice
> > > cleanup on its own.
> > >=20
> > > While add it, also remove commas after the sentinel entries.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > Applied, thank you.
>=20
> Uwe, could you share the end goal here? It looks like there are couple
> of efforts to deal with driver matching data, for example I had this
> proposal (which I did not pursue further so far):
>=20
> https://lore.kernel.org/all/20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmai=
l.com/
>=20
> I think it would be good for all of use to be on the same page.

My idea is described in
https://lore.kernel.org/linux-i2c/pja67neo74zw6rqpv5n7ekivlhejbmpuge6umtuat=
whgjbmcwr@7u7f7vhpnwtt,
maybe with different names for the two union members. My current
favorite is

	void *driver_data_ptr;
	kernel_ulong_t driver_data;

If you have concerns/ideas, I suggest to share them in this thread such
that we have the complete discussion in a single place.

Best regards
Uwe

--wvb656jwvi6kkfxd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaD1D4ACgkQj4D7WH0S
/k6oXAgAsOkEzInj58ytF37heZ2FkwmIeJL82EAnRT7V9XWYffZkfKEeSwZ5CPaY
kNceloASfh9vt2OquY5neOZa4xgxKlUI3zp2RRJlOiUcvNcMppVXwNe2uASc99rA
M9iljulOqqApBb9s4u+8DMGRzQUYgWSuiCZeyIeialJxEFeL27NaJWFXSO8Lf5fE
UuQ9BwQGj0IGWkHY1zMsRdOH9Nn3vEUgnAp50Nz12eAUq2YADeRMxKGGiAAB7qC8
bPoKkclSARtMw4eYUdOB8eTIi2eD7SLv4ro5dmpxYtHHZmRPUDNTo4ltpC54Vuyw
EWj2HQ9HPOb5N6qLRhpvArJKNzms3w==
=8aBS
-----END PGP SIGNATURE-----

--wvb656jwvi6kkfxd--


Return-Path: <linux-input+bounces-13184-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F0AED476
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 08:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AE2E3B0FAD
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 06:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54EE19CC28;
	Mon, 30 Jun 2025 06:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zoStU2kX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F08125D6
	for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 06:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751264690; cv=none; b=cQGBgQquwOkzOu7h7hjN8EkZgjpp2bYtzPT6JEvXgVYIjtjV8Slj/mhYnvGsQfFsGWE1FfNCgXcWst+9+fpth7GvkGZ5qRAMQOmDR5hGLS4ET7cJ8dJKJSdYodbqDUduN7nJHPtpp1DZz7pBf+LjKPvUWoE8ZMWHd+aD3lI5i1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751264690; c=relaxed/simple;
	bh=3kUthHXNKY1BNSUQeAR/zCUKgmhZyHKwGzUp0tbz6AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaIDd6/irlnyQ+UTKEKI+moURND3+9VxndNdPwQYNYbxuFCpySHayRIYvFrfDbOJh0Pmqr7GYzS91AFpUst0j+6saJ4vPztv1ETCO0DAac/2W+0d3dzTLCTVO024Q6IWlWUJ01FD4KbKO804HcEI99CVDQU26OPbnh07RhSwlZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zoStU2kX; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso8312930a12.1
        for <linux-input@vger.kernel.org>; Sun, 29 Jun 2025 23:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751264686; x=1751869486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3kUthHXNKY1BNSUQeAR/zCUKgmhZyHKwGzUp0tbz6AM=;
        b=zoStU2kXdcpPW28OcHQCNLVln0kqSUwlI3XN6H4LBrny8I/tdh5I0kA/MRSqEvP7Hc
         jkBHvMmZFNr7WNqPStrYUcS2iD7C0329Glq3lII519gbncmAIl4DaUMqcFmVtcxSCobd
         GKA8bbockUM6S1BQB3MNIF+0AOWVu7uuWJtvujsqOr1Ey1h/eZeBeskFxWLgoITHolm5
         65+gRxImN1pFeXpSaKPrf64wICVIKt3sVGPyIG95x49LZ1XloE72YNDsSMY5BX7vtB72
         9gQhOEBdl67whaEp2IJRysp0grsE1IDT6WV0ibFiG7OR5vq6kiAuVdo4b+YsjLgVrEuc
         gsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751264686; x=1751869486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kUthHXNKY1BNSUQeAR/zCUKgmhZyHKwGzUp0tbz6AM=;
        b=COyzZex8cFlI38y2RWCYzQKUnHoMI1Js50OCHYuIWLBsj0Thq1QE1Ki4cKszuaNK//
         vIInP9HyK/o6DLIXMFlgHDJN7wizurtNf77WoBzCQPtRNlYRhxRcxXg0QXLqXV0VfN2k
         gwdDBTa936wXnfOJLQiwyC2hCt20PFN0mhQHinC07To79uHzbqtWgAo++oR64cb9nrlK
         XCsgNGal9IjydnuuW8JP3BkiBUF51lQd6fOpmUmBftnMbnoiKvola4RT688ZpMP6CFY+
         Kbjr77prUJVC3p2X42t8YXkSRwhrh3jT+ocUsg+e1MLP45T1+vLmvxsPtxrFe/d5OmZQ
         r1wA==
X-Forwarded-Encrypted: i=1; AJvYcCWAbNxdedSPAJ/iw/rsLm6LJpFwUvuQKYdY9qTFuigMYVplgWTYcbeBt7AhjUSv6ndtK0ZXhMxHVfYhDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylCHfAWNtfwpQeXxSWC0sQ3BoJfGNds9sxlX1HWayBNpWYeTUc
	htGRz0NTAoEni3vwsyvjkYy8Wu8gTyWy/gjb/9pNuwS8yQQU2pUyn8zFwtq9yamWJkg=
X-Gm-Gg: ASbGnctfoGkCwJaUtrWJ6nltkkQcff/O8GtDoPVb/qDyYcIJ7yBEqhe4T4V7sABYBIN
	znyQbwB/9pE61CBVjhSrMpG0C8VVXQT2c2pTGfZHHIdy+EFEEqEzxVxyiu1B1Td4+P+E6bDGfVM
	xwyGaSwpDD6OsMBJs4a5RLdzS2SAYyn/jQY4TZur6fx9ZCUdM/8IWrUarvzWJERDZfpUSifJ4Ws
	Ojjlbwlu34vg8omqbtvKhKzrvOb0DCgLvSw2anT2zm6MCQP/heSZ1Xgd5c8Smu4HEDhpVRcOfbO
	xtidAC0pCOkT1pNXFQsFBxsNSY+jqWgslBN++b6gWGR9LiX85hAqR+uw7QhiW4aPT5fmP1opVFW
	xX0VP6oqdO/F9a+nKZJPzW/Ms7y6Q
X-Google-Smtp-Source: AGHT+IFSGdbZTiu0xOVzvkK7zHYfC3CC7lX9MQQi+PIjD95NI+Aa9pooPpCIeYut8zBvkO7WKWcX9A==
X-Received: by 2002:a17:907:3c8f:b0:ad5:55db:e413 with SMTP id a640c23a62f3a-ae34fdded62mr1081052566b.26.1751264685875;
        Sun, 29 Jun 2025 23:24:45 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae353ca371csm615679366b.179.2025.06.29.23.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:24:45 -0700 (PDT)
Date: Mon, 30 Jun 2025 08:24:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: max77693 - Simplify suspend/resume handling
Message-ID: <6gysdq7wnhraeqqefjj2pumnn3wtral5w5cafhejfhul26ziud@tpiqjzaidbmz>
References: <20250623110016.1370622-2-u.kleine-koenig@baylibre.com>
 <ijmemuk6lhdzy3wlm67jr54gvza3zft4473ofgfoeuxknegc4o@ysm62a64dvxy>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f4gavijkbhhv5s5x"
Content-Disposition: inline
In-Reply-To: <ijmemuk6lhdzy3wlm67jr54gvza3zft4473ofgfoeuxknegc4o@ysm62a64dvxy>


--f4gavijkbhhv5s5x
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Input: max77693 - Simplify suspend/resume handling
MIME-Version: 1.0

On Sun, Jun 29, 2025 at 10:41:36PM -0700, Dmitry Torokhov wrote:
> Hi Uwe,
>=20
> On Mon, Jun 23, 2025 at 01:00:16PM +0200, Uwe Kleine-K=F6nig wrote:
> > max77693_haptic_disable() is a noop if !haptic->enabled, so it can be
> > called unconditionally in max77693_haptic_suspend().
> >=20
> > haptic->suspend_state can only be true in max77693_haptic_resume() if
> > haptic->enabled is also true. In this case max77693_haptic_enable() is
> > a noop and the call can be dropped.
> >=20
> > After these simplifications haptic->suspend_state is essentially a
> > write-only variable and so can be dropped, too.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >=20
> > found that simplification while trying to understand the driver enough
> > to improve the PWM handling. Not sure that the result is what is
> > intended, but if you think the new behaviour is bogus then so is the
> > status quo, just better hidden.
>=20
> No, after your changes after suspend/resume the device is disabled
> unconditionally, whereas the original code would enable the device if it
> was enabled (because of effect playback) or keep it disabled.

Ah, I see where my reasoning is broken. I didn't take into account that
max77693_haptic_disable() sets enabled =3D false.

> It also does not compile...

Ah dang. Usually my failure in such a case is that I failed to fixup the
patch after I found the build problem myself. But that doesn't apply
here.

Sorry
Uwe

--f4gavijkbhhv5s5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhiLaAACgkQj4D7WH0S
/k5+Kwf/TUhZcPdWeP7JXtKXxj14TjRwM+LDinfIju6PrJMhWcHDt6G8lLIvjT5w
nasjjwqyNHFnhQ13hRU4TB4Mx7K+MfBLAQffiMQ0froxoNBiRtprquL/AixB7Hs6
nbkzyiEBbEKvGEBElcUgE53gLoGTTcf8B272Zw8u1RDOOI50aosfj2rvni5h6DHU
XS/w8FiSLabBFwSTMLq3YOppBTxCpudNxYK2HmYJQNQMFGGqxKNZs+SJ+T+SWYVX
O+FmAEVU1sZOWp7Uzy3zysVmu/q13AeTeFe+Sax0t6dCJCHAKyiZXvghubmIfO+y
xI0ESD6mLp1VOwDGD444G3yRnVS3EQ==
=kbUg
-----END PGP SIGNATURE-----

--f4gavijkbhhv5s5x--


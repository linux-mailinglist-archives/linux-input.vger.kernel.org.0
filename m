Return-Path: <linux-input+bounces-13186-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FEBAED6A7
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 10:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 803B73B0DE2
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 08:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627AB21B191;
	Mon, 30 Jun 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cE4qjfu7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FECE4A23
	for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270740; cv=none; b=s9BOngpDnVcneEW7a2z6DtAaOTMw4c6h25RicPwsR/Uct/3HKBPU4VNbujWJNzIfXAQ/P4JNQTRAc4fkoRi7ltae1R81slbkKixZ1lHGyiL2ya5cvxPkTH9Uq2UHGMX3pfwced6DZffLEVUJXNSTOP4oa4BEAPVDhk+jQYGT4NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270740; c=relaxed/simple;
	bh=ZmwJqeAo2BLZZhW2DbJGK5Xvo4oxQ9K4lFzIdnopl6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdG2OUfWo01bIOu9DNjgNkv0Cy6LmLTmhr6ILohzfRup3ITI+dUnvAbfJQsaQ024wPcuNCrYtmA4nCwCRumd1J2/KQ4r2C82LqTAWYLptieYWC7ZdC0MKqtTeZ0FL28PIZA1WQ6vBECWUTCXdBStlYx0CuWbdFsFnFr6JID7dco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cE4qjfu7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so3909271a12.1
        for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751270735; x=1751875535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmwJqeAo2BLZZhW2DbJGK5Xvo4oxQ9K4lFzIdnopl6c=;
        b=cE4qjfu7y6RG8agCcKyJYD2yQRFjFY1nCZCL+BQGxBM3Blbs2AhJVMpq1HAGsKDhOD
         wnYMUd/5mFE7hIb/609ZWJO0zdp9BAmF8YF97HQon14pykWxrgjd3NvzHxGnuC1KP2or
         1URFhjf2Cuuf+98c4Uksd54hjm/Kh494h/+3tbeXo7w35uP8x89ZlcxZHiMGpRUua6Gg
         9rH+VjSpTz8Z41Plp1Y9jkcVv2VNAZzsV9hujooVGT8gQXfqB2jL0BC52SiLZx9az912
         /p3xMh4Zz3d1koFvYmThibSGdAkXgzUsD9U8WmFfSDkA+3xRDk6Y9YVZa86R2dlIbatt
         dhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270735; x=1751875535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmwJqeAo2BLZZhW2DbJGK5Xvo4oxQ9K4lFzIdnopl6c=;
        b=SKR6+cgQMZCAqdbWMpyLy+AFrS5+ZJKQoMKyiegzFSXSoiJGv20ZkbSWPhkF7q7dWe
         Y33GSHIDAoZMB7dmhA765nIh2Rh0Y4oUOf9bLTkfXd4U3VOnt/pt4LAJZgpbAQRpEq/Q
         AyEl4zEzw7cFqWOvfsFKzu/Tm/Ce0IueYJt/wpcMXBYFGgZGfRnVh28wquuqneFOS8ef
         FM1dh1XXpANTHo8eBLmzuBMv0/iF4Dkx1HXxH/tuKFUsXcASqcpkxaDbJR27lfzU/93h
         k4QJcgz5f4ZO9lCXvufk59EznUzU9dzlPDlyZZoWwBxw6cTZaP9m8Qn/4B4CyEikbqxs
         f1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXIlpAkQ0V0r5tjbU4cmFCTWReR4bsUASKB17xbYqIJLllFHJMSJCeRV8hhgWzwDuG2RtYtFpQYzt1xtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuj23+8PGyCmUtSUIh7kHSDN7FNp0OyyNADb7ONUQmeU2VPQQZ
	+vUHAJPzVnX6rOl8Hk7mvKGbq1/oZlfo8aLm1oJItVqDg/Xd7HxwY+1NkeNNKJ5kyr4=
X-Gm-Gg: ASbGnctd6TQ6vTReZbF99haPeDnWknpksrRs8cMwZeF6MCTH+ZyZk1FzmTAL4toDIa1
	vhlLr9qZd4JJgjs/NH/l28yTtjI15OqIoplVjjBNQ81/xge/YPoYC6JgczE+U7KduLLagXiK7rQ
	0ueNvbNeAPh8BHwbT4GcvqBGNJxIRSccaurWM1QwD8AgWdgVJdnuMgJoxgE2bKZgWodjpUwlCBQ
	D+Bm1WhPdYqdM1S2qtAyni6BRXc+ey/UKBRYTWQco4oTNyyG3+VzQbpv+l2wmqUUO2/XN6rcbz+
	K7dC7YyKe3/DesJ+62KMs9mOADcM6+m5dE/836Yc65MyLMZcbTqbHptIWPdXhzut43SRsT+8O+j
	wPY+rON6IJM+v1U3N8m8lQxV/kAXm
X-Google-Smtp-Source: AGHT+IHfs4/52Rhwkg8PSSUPtbN9dHqyJYyCRFi94Rqzc77viEKUe7J9vpJsQTgF6FC2JcXWDFRi+A==
X-Received: by 2002:a05:6402:26d4:b0:607:f431:33fb with SMTP id 4fb4d7f45d1cf-60c88b26b30mr12024514a12.3.1751270734555;
        Mon, 30 Jun 2025 01:05:34 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60c828e492bsm5423350a12.20.2025.06.30.01.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:05:33 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:05:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] Input: max8997_haptic - Optimize PWM configuration
Message-ID: <zj7luad4nn66h2mo4c6ekdtnz5olbvhzg5byicv3pnntoae7ex@i3xyptos5ywx>
References: <20250623112742.1372312-2-u.kleine-koenig@baylibre.com>
 <aaq3c6aljqt63ilx3v5555ususxcrg4kgnezicsesdbmio6zqh@2xrok7qlbjrp>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vawjdtko4sfevjtd"
Content-Disposition: inline
In-Reply-To: <aaq3c6aljqt63ilx3v5555ususxcrg4kgnezicsesdbmio6zqh@2xrok7qlbjrp>


--vawjdtko4sfevjtd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Input: max8997_haptic - Optimize PWM configuration
MIME-Version: 1.0

On Sun, Jun 29, 2025 at 10:30:47PM -0700, Dmitry Torokhov wrote:
> Hi Uwe,
>=20
> On Mon, Jun 23, 2025 at 01:27:42PM +0200, Uwe Kleine-K=F6nig wrote:
> > Both pwm_config() and pwm_enable() are wrappers around
> > pwm_apply_might_sleep(). Instead of calling this function twice only
> > call it once without an intermediate step.
> >=20
> > max8997_haptic_enable() is the only user of
> > max8997_haptic_set_duty_cycle(), so it's known in the latter that the
> > PWM should be enabled.
>=20
> Right, but the question is: is it OK for the PWM to be enabled before we
> enable the regulator/power up the motor?
>=20
> I'm afraid we need to use 2 distinct steps...

In that case the status quo is wrong (at least in general), too, because
the behaviour of a PWM that isn't enabled isn't known/defined. Some
have their output active, some have it inactive, some have it high-z.
And even continuing to toggle would be a valid implementation if there
is no chance to save some power. So if the device relies on e.g. a
constant inactive output, it must enable it (with .duty_cycle =3D 0).

Anyhow, I will try a more conservative approach to get rid of
pwm_config(). Expect a v2 soon.

Best regards
Uwe

--vawjdtko4sfevjtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhiRUkACgkQj4D7WH0S
/k6vVAgAneAVepN9rJNCloPBI21USUyhfO/nREIppQ8TjVl5yx0ILe23fH2Jc6Bv
n4n29M43RdAXKGJi1JWqWL+rQCub2y66fS1SJDnmrcTDUjy4WHQhOlvvyzxokTQd
+7oAGTxnu3KicAF0DKRWsgoQIV1jkng3Ai3FkQ5ZtINtmxf2VIDb7ewyDLb1Aoh8
2rnFZKQd4rBYz8t2jU82bFYSclpgr3ZCxoSEH/Pl0JgC/8NuiBOvja47+KSdQ+Tt
75HNvhfS2+KKfh/QVih51h3S1ik/XrMo3R+ea/5Ek64kceOe5/XGqMbN3I1uCtq3
gxm3vkdN4w7QGRjCOVfR/75/SAH1Jg==
=7oS7
-----END PGP SIGNATURE-----

--vawjdtko4sfevjtd--


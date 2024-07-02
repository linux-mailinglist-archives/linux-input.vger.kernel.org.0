Return-Path: <linux-input+bounces-4795-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778CD91F033
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 09:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35091280F86
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 07:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729EB12D1E8;
	Tue,  2 Jul 2024 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1FzI3YL7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4381A4779E
	for <linux-input@vger.kernel.org>; Tue,  2 Jul 2024 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719905520; cv=none; b=EIzaicRuVYkWbX+XGEXBJjrz91qd0gDosi7IK+zpNkBy5wZgcmg2l6GIs4/nEJfPJCq5z9FEZrOt/pYnaT+Ub77IdKKtgYhbSNR/+tPh5eKcan48v8f/t5ZUAh3djlEsJgRK33U0CkuSgfZCJjpM5G4WzAYc3HAk5FN4CB4qMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719905520; c=relaxed/simple;
	bh=NXAnMPTEbuIPxQuu8cYp/c4BOKS9M+IRqWBgg53V2Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2mZWo5dsC58dHusk2rxcu6krTLKZtStmDL59ojFfgkPEa4TgfmUCLz8oVpklE9Wp5PxfrLVWDBlOAkpt8y62VtQ0ziRrAI7M6dYtGQXpAQ5+hZuhoT0m4LAqTD3i4UtUzY++3rufTgvdDoUb7bT2n64V48ejW4J1XlCrAdB6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1FzI3YL7; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a725041ad74so152504566b.3
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2024 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719905515; x=1720510315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RcC+ytvW0KdL4DLY1J6l7/sZe973kvj/8Bf08OBmvrQ=;
        b=1FzI3YL7sbWpNAIXSROV11Ohs9+kabWm4wX8w/TJkJ1ftGuBO6SYc6cjMsvuzjH2mq
         6LZX626n0gQ0CdA01CJq/EcX+Tpr0VAWGwPwzhEyvZa8sL5gdMkjCnlR+aOj1Jm6TXTJ
         eZfQqD7TaMUYAM92U6RN3v4wnZTYO1/sPZ+w6/PsDBjTfF3/qtVcjYZ6b/0aLPSuZpI9
         wg4dij+y+rMIkMCKpBSM4IzhXF1ERkOGDfq7/yvCZE/r/seU/imVPezuzwUlCr67BXSi
         4pLU8LAQJu/L6KpqnlFx+dmqMArD4vTuVXvzqrRESLtzfgOv359Bc/bsvOPx4bx6H9/6
         Ql1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719905515; x=1720510315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcC+ytvW0KdL4DLY1J6l7/sZe973kvj/8Bf08OBmvrQ=;
        b=NK3n4evUyg3xQ5729iA4zZecAfSyQClP0FBBwlDZRycd3wYNqkspc3IPb1uvJcA+qo
         /Ebr7wXSCZxs0Tvk6fTpRpMmWIjGDwjELrvBIshLBP9uXzmkWTXRy8NXQ4C8hp+NsDhZ
         OtsmWsNGaVnU3Q6vvjLfegdyxCEJcaT7T+/M2mb1IFR6mWUztW4sDJ2uHqpldZKC2lvF
         ggNNDGQLhjgnJhZBlddUNMAmUsyi4ykcARHzc8BpLtYKD8mfd2Pu+Wgph2+Mu0kKcGMe
         0tNHZcIHWeSXpZTiF8U+/Or0A8PWuG40y+S3bISyBXpBc7jc9ro8pncD1KB9gmvDCtg1
         KOow==
X-Forwarded-Encrypted: i=1; AJvYcCWcebdOujwPjdEEW3qiy5GWqoH7nUNCi4EERFrc3DajU+1zP15jo1Q1dqEQOTi5lgJ/ZhlUgY4lof9l6xTLkvpyQ9Ws3DpPVbHmRiE=
X-Gm-Message-State: AOJu0YyxD6+EjvaaRQVmp6mIBwhRflmCEAgFPlPzZcWOWqIJaOtDZgzb
	vRVFcRkbwnLh4JJhTTfuLaUSQp8io7rIiEjN/f9Zcf7+Toi/ABrokOCMbMSNynI=
X-Google-Smtp-Source: AGHT+IHYJc15BmvLKe8dF7xwJxNsy9wlKFCQgGFS4o1KImOlkj7CBYMXxW5IUbl0G+ap4HzbVuRp5Q==
X-Received: by 2002:a05:6402:348a:b0:56e:3293:3777 with SMTP id 4fb4d7f45d1cf-5879f3ad3bcmr7314285a12.17.1719905515347;
        Tue, 02 Jul 2024 00:31:55 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-586132502ecsm5322680a12.40.2024.07.02.00.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 00:31:54 -0700 (PDT)
Date: Tue, 2 Jul 2024 09:31:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Utsav Agarwal <utsav.agarwal@analog.com>, Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iInput: adp5588-keys - use guard notation when acquiring
 mutexes
Message-ID: <axu72rveax4ipfzdmm6mcl5g4wt2u3ptcmho25jgqafgmfg7fa@sqlzffrgmxhk>
References: <ZoLt_qBCQS-tG8Ar@google.com>
 <pdnij2qolnmbcwtvlsdvkvtua7s7yjw4ms4bc7zyk3tpdr5pou@sga4mhcztfiz>
 <ZoMy_8lcdS-NN76w@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gansq45ikznxlx66"
Content-Disposition: inline
In-Reply-To: <ZoMy_8lcdS-NN76w@google.com>


--gansq45ikznxlx66
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Mon, Jul 01, 2024 at 03:51:43PM -0700, Dmitry Torokhov wrote:
> On Mon, Jul 01, 2024 at 10:28:09PM +0200, Uwe Kleine-K=F6nig wrote:
> > If you keep ret it's consistent with the other functions in this driver
> > (at least the one you touched above).
>=20
> This is part of my quest to have variables that hold error codes (i.e.
> when we do not return them in case of success) to be called "error".
> "ret" or "retval" is to be used when it is returned in both error and
> success cases; before the guard notation we needed to use the same
> variable in both success and failure.

That seems to be a bit artificial to me, given that you changed the
variable "ret" in adp5588_gpio_direction_output() to "error" and the
resulting code can be further simplified using

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard=
/adp5588-keys.c
index 09bcfc6b9408..5c8f07bbc452 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -313,10 +313,8 @@ static int adp5588_gpio_direction_output(struct gpio_c=
hip *chip,
 		return error;
=20
 	error =3D adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
-	if (error)
-		return error;
=20
-	return 0;
+	return error;
 }
=20
 static int adp5588_build_gpiomap(struct adp5588_kpad *kpad)

There are further inconsistencies in this driver, e.g. ret in
adp5588_fw_parse() isn't returned in the success path. adp5588_probe()
has both, error and ret, neither is used in the success path and a
single variable would be enough.

Given that, I'd suggest to make two commits: Let the driver use guards
without unmentioned and incomplete cleanups in the variable naming and
then in an additional changeset unify the error variable naming in the
complete driver.

Best regards
Uwe

--gansq45ikznxlx66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaDrOcACgkQj4D7WH0S
/k6iQQgAhiIsd0D9RE6cx72PvtHSh8kcgPXDPtrugBMTIpFBD/eh3BvfhDA4nsM6
/4DkCJ6fA0bX1rv2Gr+w4igdrm9TKZjtyigLsNloH7G6QoMNoRJvURRqfOXnnPo0
mQAI5P846JP4yyzBFI3z/i786h3eG7+T4sWBcVowMs6/mNrJ1/vKvgRU4P7Hx7NB
xMKi6EPUubdWquwZSiC8Em6xyfLduPJxJ4e0bykvUEl2/pUmK4fj1lUksXmyd6K+
fQ44Dt4axvApk7qLIXuwFUxTdeRBSF3DbzpPZw1TbJ7v8VLoynyC0L0yvBUA/iwJ
yKKKD/zL0V+/xcHhTf8xFyfVOjznWQ==
=uMQf
-----END PGP SIGNATURE-----

--gansq45ikznxlx66--


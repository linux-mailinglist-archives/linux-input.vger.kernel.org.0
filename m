Return-Path: <linux-input+bounces-13854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6AAB1D297
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 08:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED21C7B0BD1
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 06:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795C121ADAE;
	Thu,  7 Aug 2025 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZPXalRcW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D78F212FAA
	for <linux-input@vger.kernel.org>; Thu,  7 Aug 2025 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548970; cv=none; b=pOxnKvv1bsU1WLAlKrufeBV3/MXZOtlTP5BqNcUXhSLUvS+wuFU9f8CUKTyDZsorEYm9sb93j23Ma0rurFeF9dvZjSMkbklRLic4ZKX1bTMxuhj3TAr5lWSVAPXLTP63z3sO8swHndWmUufG9Ud4Hv1748Yp5wPS/JVQjuhHNQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548970; c=relaxed/simple;
	bh=uP9ivKG0gwdO+sDzB9YFDIqePy8klb0Nt1Aexa1ZWQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uvm6aHndx5jF6heoWFrctjr6NL2I5vRoscQbs/KNdgO1r6UIqrvBrX06GSbOaJARws+a+FX5yGIsUFL3X/oyqtEMl2NDIiWXNSYjVvQHPLh/BlCZyRuE0hLgEVAhBbREak2JX2E6uvz+D0ujqmNvDZ2soLZwbVWi7knWBDexbpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZPXalRcW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-458baf449cbso6150355e9.0
        for <linux-input@vger.kernel.org>; Wed, 06 Aug 2025 23:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754548966; x=1755153766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uP9ivKG0gwdO+sDzB9YFDIqePy8klb0Nt1Aexa1ZWQk=;
        b=ZPXalRcWiSAIlEQi9/MpfZUGwcGuhq371F8w/vqi2wbsgm+Cb/99CppaJBluUgdpTM
         IG6dH+TFl38C8FhrpoExCuc2Z+/2cWOQrvxpkgb2hp+Cze3oqoLVQ6JDx5opLCKjMZpI
         zyJVc+zOnuZUbGpY/MmNt14gwKexcEfC3Vjq0frhlMdQ7JZYY33Cnr9PvFcId/uztmd1
         K581uehAqxrIYN5GQ0trYHZ+0eM8UsDeU7+3EtBRRXxhNRNs38UXhON04L9w3vMUcdad
         YWAtqQfuk728TiTNaNMss6I1QBkaveDhL+vd7USp3C6gcSdrRwibgUj3AFRBj753jDCc
         CKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754548966; x=1755153766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uP9ivKG0gwdO+sDzB9YFDIqePy8klb0Nt1Aexa1ZWQk=;
        b=E8PAOE/2KuJQtpMczoG7Rq0M3zi/oywgz991ity0Ez5qf/3G5x+Qvdxsh/JyXBAk/j
         hEA8uEEVAiOa1squ/4Zg+K/XvDxp9LatZsbwUYO4Cm2uOzvU5QQcrXy09opaDZqD/jNU
         TJ43H5khLR59tP2YgCP7LNOB4ALQH3ZMINfyv23DJHzpb69UwYPFsflPdxrLN8o3Es7I
         Sj3ZiMjL3adwye3vm97o9D8/B4jK7lzvkxO5evvDwrd4yb2WARMsy6YDZ7NTmFz7uTEw
         HZRLjHhNhoJlWzqIkTQH/tQMGXFKRDyRZEoJxZGtnt7mEjQp9v+xC8XaWdYdqZI2QQRO
         y/ug==
X-Forwarded-Encrypted: i=1; AJvYcCVU15xIbQzrNgdHaqn7ta2LqgtCdD3r/iWQ4lDiYcibkkhxwQamifxeuoj+wuCwf7fcpNVjSf1P8eU2fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqL1TpqSFZ2810WwvOGznvpPJ62lGLSs6fYzovoxdXyJ4l++qv
	LS55gyiL9HEBV22hn434h6P2rPypqBEJ5AEYhoneGhzZHzS510+t6zSZrXXTDgWmYn8=
X-Gm-Gg: ASbGnctorfMAU1uxnTfLdjovhXxc4KV6oVuhQwkbEOLAKldYT5vSMTEz71UxdX6FRxB
	ZXgttjgWuwg4IKO/yvPqU8zpvUTnFok9V8s7UtTHNOLUPAdDzRZeJaHMYQYSEr4YvnJN79fH2wT
	IangNMUebsIBg32xWeS8KMdgWy2bWDBohy7dCqOFjKhXWVmG65CeeKqh+xWDdldkqIgNn5ADiR4
	iSTmWrqCkq8DieHKVc1i9F0hP5HSUAzHlPn6gT7mBumpduMpE8dBXXwgkUEnGu9MCc2DXsXKZ/0
	WGlFESjeL8m6f1LJQ4eNwQyGjuIqVnQqF6S0H7lSA8O5DrObhproVQ6IDvlBdeCldw05qKh3SDE
	lkZmWHJ4DyBqseqwZBh3FGmMNDQIycCe57C2c/I5J811y4zUQdxyblKW+WpjcUnyDkVIGdLTqqN
	A=
X-Google-Smtp-Source: AGHT+IHzXz2Uk/7pTy25fPfXEKO7AloRT0dUDzCMj/HHgy0kvtiGAsIj+6CtnEoJSRW9ZAes50RTwQ==
X-Received: by 2002:a05:600c:4751:b0:459:df48:3b19 with SMTP id 5b1f17b1804b1-459e70d8e4bmr53512055e9.18.1754548966464;
        Wed, 06 Aug 2025 23:42:46 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458b866392csm125512955e9.2.2025.08.06.23.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 23:42:45 -0700 (PDT)
Date: Thu, 7 Aug 2025 08:42:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] Input: max77693 - Convert to atomic pwm operation
Message-ID: <njphx3mgvidjjxusatcc65mwd3zpdehz7rxes2hu6eb22lrtfr@734q26m5oyjo>
References: <20250630103851.2069952-2-u.kleine-koenig@baylibre.com>
 <w3tkxxkqr2kmri3bz5m34dzw3hfvkqou3zbww7kwjdg72o7kla@ty777ynf26qr>
 <23ddfd32qebfzb4qftxih3mwpymghlezdv5u63qhxhqthpbxpz@u7f4tbihsfop>
 <yafw6oi62ckqgz7ur4idua2r2sjyxnfomc7h2v5w6tthqwu334@5i6tdfumtj5b>
 <sl3jqe36dfxfzblposdtkvlgalc4ydixpqkfmn7gc6hcjfwmqn@7bex3mxwjqyy>
 <zxeva5asxre7oc6vakfoyiehegt5c4i7qwaeue5woxk4xir3di@thcg7lyadvn3>
 <wfdklejfruh4m54kmekyu2xssd6uss7es2nyvhqhki5zgbziwk@6bounno2zauu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3cuilknb6gxn3qm5"
Content-Disposition: inline
In-Reply-To: <wfdklejfruh4m54kmekyu2xssd6uss7es2nyvhqhki5zgbziwk@6bounno2zauu>


--3cuilknb6gxn3qm5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] Input: max77693 - Convert to atomic pwm operation
MIME-Version: 1.0

Hello Dmitry,

On Wed, Aug 06, 2025 at 09:33:25PM -0700, Dmitry Torokhov wrote:
> The patch is in the pull request I just sent to Linus, hope this
> unblocks you.

I'm not under great pressure, but if I know it's not stalled that's
great.

Thanks
Uwe

--3cuilknb6gxn3qm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiUStgACgkQj4D7WH0S
/k5oUwf7BRLEAsseXAb/TFll0UBQF++jsIHmvZopKC0nAsw4U8oepBq6d9K6l4vK
4dvulSGbfBXfx9z27Y1Vn4Eh5uVAtR/OY1y2UeG7Z8sl7p1VXI1d5Bv5x8BGdQUW
6UTOSoLojMCsnjGGNb//YIl38ml46pN8pkN+YZuegmpMAZ93w/ugmH0SyfCNsqoB
ZkWThDs+uQ0ZRvXqDog6UwrYlQwhHkhDHQjiCzCviFNBCYsYtB2aQQS/c7WXN+6U
nkZW7D7xrDlho84O8fpt40L83dgHd1+mYDQmzsygfwyzVeNInYwBjMXq3LMmxxuS
oChOdWzkzS9l02N9Z5yNOXNJFD8UqQ==
=PpjV
-----END PGP SIGNATURE-----

--3cuilknb6gxn3qm5--


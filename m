Return-Path: <linux-input+bounces-5897-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC92960521
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 11:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30642B21C71
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 09:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C33198E92;
	Tue, 27 Aug 2024 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRzyjkTq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3713E41D;
	Tue, 27 Aug 2024 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724749694; cv=none; b=Pvq0DS7SVjEd0LARC0IyAihkgDIp2GMnUUZgAny6TrkcOiw4c0wRU7dzdha3U6B/eyVw+tZfKelmSYPG38n03crKa29QjTexQq9cZEdUT2JftfEgAHKPiwlEL0BVmnpt096OOl6U6muZ8BdPQZK6u3F86tkkCSRMpSkHLFSlG3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724749694; c=relaxed/simple;
	bh=Igzhsr6xLKn34LLaq/367aBaun9102nWNVaY1z4JR44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsMknwh/9z4evWz72Ul0JisWEU/ffgQF5D/90eFkciB8cUQk5mQkGp7IkRC3B2GmmbXLG08h7POQMjlhJTFPzKtSRmoUOX7mx4lOqO04/JDLiuOIYOBvabVXfWelf8V6k0LRMNTcWGNPfdO6Vxh9oxQa+y5KgXRVZtFg/xtYeLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRzyjkTq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-371b015572cso3823158f8f.1;
        Tue, 27 Aug 2024 02:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724749691; x=1725354491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x46mMvsDoL/gz4AXX+6m6jvlKSmgpq2B+loqNQXPG3M=;
        b=RRzyjkTqYqgqlFa0TC43/dhFtgsWp4Ufr7ft1pMCrgD2uD0FSqVTVRrifvVjLQQXhC
         ony22dfno0woxKIJctD3fNoiUXy9GgL3/SpnWUfjU8EyrR74GNm2K3izbcgp+bHDNdGA
         z45ramOvuVMs69FMVXvEJdtIaLd7ZfZI4yGYX7JK3Tp1cDR+ZSJhJCEN4jzl1hE48vue
         +5eNRQLytFtvCKoJ5zTrHQYbM8kqgM6H1zeyvvaHpz6TMjjQ5Imkhsjzans725cDAB5p
         vSCxlqcvlf+X6zBi9d60FcJIiqUGx+Wh+Mq9GVJq+RXbfPuf1Sxjle+ngW0MB36kHoLk
         B2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749691; x=1725354491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x46mMvsDoL/gz4AXX+6m6jvlKSmgpq2B+loqNQXPG3M=;
        b=uQnHB/oPlm4LBZW22WRV/5wI+mkP4MgPnE2Ur2dDpWvOl/EscJ+KBbTO5kG+tFRC6l
         RJSRjy95s2UTMLDkWEWF+9CNGc0G7okFWL3gQ83nHDWddhR+D93Zbjsh/nxFGfTGvVEP
         Bjrxocz38AHvWVqprC490mg9FtFc8tsO5lj7DjfYzvoZRj4zoHndnoU6KsWTULhHpuvS
         jI1KeY+mAz0NjEaTCrrwOqfC/cFcd8rIxpiOKWpb9CDNX9kKKpmbiMEpkBKgT9j47uA4
         8i6nrBjYpNG0Y4NFKYDnaR1aGyfFRyMZblk53iuK9oq7lwS1AzvGaQLBbdgJM4e/Ej8W
         tuQw==
X-Forwarded-Encrypted: i=1; AJvYcCV3SICGC0/5t9W55a5D5NzYTuqrr4PXGV1AjefpHqk2fTtIBV33bUGbOJ+jWgC5FAY56yzM2F+O1CltJSk=@vger.kernel.org, AJvYcCWQjvIOo5fmSFdb2S8N340wJBAAA0PdbObAj2fdOoFfCqHhjzvf87nNe1zRmDSYTYchj/7lqVpp+P2ncVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJXucUuGYwX4H8N8XN4QFnuH22knemd1U/e1sBTTmIJO0gXs+
	zmNcKNcg6Y7/V3puBbY9JzAIXgkSMVMqd4w/o26MDBkijSJ7UgCj
X-Google-Smtp-Source: AGHT+IFQLCNAPykfuZm35J5ShDF+paRGaZLn8ZiQyvmSeiQXC8xkPQFOp7wT6LPmO7u85DICVqVpfQ==
X-Received: by 2002:adf:f841:0:b0:371:7d3c:51bd with SMTP id ffacd0b85a97d-37311855c11mr9692614f8f.14.1724749690260;
        Tue, 27 Aug 2024 02:08:10 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff63esm12541788f8f.87.2024.08.27.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:08:09 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:08:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, 
	Michael Hennerich <michael.hennerich@analog.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Hans de Goede <hdegoede@redhat.com>, 
	Tony Lindgren <tony@atomide.com>, Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 17/17] Input: tegra-kbc - use guard notation when
 acquiring mutex and spinlock
Message-ID: <m6mttlalfyekhmfmwtw7gk2j5hw7y27xowxjyn5cicdslkw4dh@4jmjzkr5cytd>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
 <20240825051627.2848495-18-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ab5cxs7alq7a5ikj"
Content-Disposition: inline
In-Reply-To: <20240825051627.2848495-18-dmitry.torokhov@gmail.com>


--ab5cxs7alq7a5ikj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 10:16:21PM GMT, Dmitry Torokhov wrote:
> This makes the code more compact and error handling more robust
> by ensuring that locks are released in all code paths when control
> leaves critical section.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/tegra-kbc.c | 45 +++++++++++++-----------------
>  1 file changed, 19 insertions(+), 26 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ab5cxs7alq7a5ikj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbNl3cACgkQ3SOs138+
s6GX8RAAvqQ3qxdxgNEhzuoYU64kJDEhIbp45yyHPFYXnYAHVaCqfba9MDJxBrj1
PZjvM+kVrv7tGKfpffDPUOj3CGZP3fUwjtzD7igPP1HGSfhFYJZZms9SktzpomaR
A7O7v7uyrG2ViHe9NtGZFy5HcrwUhvrIShGqo2E4LJknvYrRzSjZRHWETX6batXa
ndo3ajfjFi1YjBCkB+ivqgBZcE6o9S1HkPOTXpAUKwssUk9H3rLQ9Lmaxn2YsDhl
gWhW2dW8UTjbB4AQJk8rC/HMtZdgJYJ7QKi2BgCFf+vjisF/tIi1kxco8rByx4No
HxPzqwKB813BInvUkUObGYIRujQR3nvmJQWrAhAezwsmiV5I02DuNA1EpoAip+FR
mhmVBSuvoSIZot03tyXA8Rqx89LZKKMwBat9+tkd3J+PsYLD9BPjzF1Gpjz6bz6f
nDqAZSQSBtQzYC/dYS+66sB4sDQdLsGZvUcWfWTiDU9qH41yoBb4QzhAd6+gNNeY
4C4Fr92yFJ+Ebd+81fdsFARzScGzszaRhuNzqyh8tDJ6welm1tREUnLWDDGP/F2p
ZAni38hyI51vkD0/WfoaZ4ZuZiI4F095fOE2rhOqEtX95VH7gxydbWVYbn9SnBOm
V24G2i/lfKeADWY2fFpUCvD3PP3HCQ6z4r90TSr1oBQCteLYhMA=
=g+bv
-----END PGP SIGNATURE-----

--ab5cxs7alq7a5ikj--


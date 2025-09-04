Return-Path: <linux-input+bounces-14490-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF830B44372
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 18:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D41047B07E2
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 16:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6050F308F36;
	Thu,  4 Sep 2025 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ANcnECMl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB743074A9
	for <linux-input@vger.kernel.org>; Thu,  4 Sep 2025 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004320; cv=none; b=B78cqwEfIN9RD1zFuKA+4Tp7cP6HfLXZFkvYkdUFe2GHGj94oblR0pgSL2z0Fy/bHy0bfYuUmZQezxhJjFkOQXx7zeAlIfPm8pY6NKr+BZvlOk0Q3NQENn6TsjcgsEWSgsk/PfeQQujiCwICSk/KAQFwTA1dnOU1umRl6eqXe7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004320; c=relaxed/simple;
	bh=s59DBpnh/Bni9KPUdtjHKw9HmnP1CEzQJd7Re0FgJ/U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbIHN7GMP4S6QIdkIxZQmdUizs6Y919Gy1O9uPXZepn++cvopRpz8YXUhEkGyijA1tDzZJrIkNjrwX1cW2BelVkAGpgk4dnVdOrBZmPwOpkYvRhd81EErGJa97dju9+pK9S/w4PqJyqlJrzFXuz6tTMNV6yD9UmTIaJkcnSKIzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ANcnECMl; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336e16f4729so9126271fa.1
        for <linux-input@vger.kernel.org>; Thu, 04 Sep 2025 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757004316; x=1757609116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s59DBpnh/Bni9KPUdtjHKw9HmnP1CEzQJd7Re0FgJ/U=;
        b=ANcnECMlnGABmCNbBMpYN+bOWJTZP88/pim0Kte42qce7gdI3mFpIaJbegZNnossSR
         4ao9kU8Ms9w5mzcH3gxzrCpj06JTCI/HQzcWpL4s+6of7XCsuci+g8jzQA4L4vZu2RxK
         VSyOBT2y3wVD7XUqSoZYBAUSrNQ3HfLt/ZN6qyVxmEPrmqb40gM40ufETh9X+ZC5n7Zk
         6M5QeqlwnZyU6v0h9sHJhoITuGlB1OPVtPiDxcPX6yWVB+jzUUTwKkxDsjguUXyEQ03C
         f749+6jivuHP1Kbp8Cnp+Ysg9Dx3sZ9k+1Ry+PD2bCISVqVwE98o9q4nesOXGFc5gbhP
         GSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004316; x=1757609116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s59DBpnh/Bni9KPUdtjHKw9HmnP1CEzQJd7Re0FgJ/U=;
        b=IF/G20rQHs1XLsY2E/en266ijONf9xQnEri6I4fznfGF01/fMVQmqme0gq8ViFTzaI
         /NUHyRdzn09BATZ3k6rLjFNBazjRuNDK5iIch7bhTVI9gH9CpRtpN8ZfMpjirK7LLnKT
         8JO3b+yNCQl+/CD7R8iAZUxVZxnVd/RZC3H0XV3NVoxgGJv7615p7K2lrO+/7Lp+SJBG
         VCytoxcrx6VCyR+Tp/AqyJja0YrJf9mLg7r2zCaHMdK+eKKG6T4g24QB4wa/ke4WSmOM
         72xhqSCyeSrJpwdF0O0zOCOgASQG8FdCYOZ3fNgKKwBwhq5xHfoda5cMsVe69C854qDE
         Rxrg==
X-Forwarded-Encrypted: i=1; AJvYcCWj0yJ/qlEewpauiLZhMnfMgO56m8MAjizhboH/uXZlddeRiH5W9f/b/nrrhEVpjNQtD3EImmdmgxP/oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPUW+D5NfNcIdRgoKPCv4QRCSdsOD/SkQOY3D4NsVa/TpNq8DJ
	I4FVItT/KJg2tlNctPslU3CkE+xToCJu4FLNsBLfTejgE/JaeB7hZhF3MFM7IxAT5plKcJJstZ5
	nZ+lnlN6AtN5GPURduUDSMYTKWc1qQokWw9p60mRKk6iX0aU+aI0BKlc=
X-Gm-Gg: ASbGncszwI0XN1mvYW5/ZrG8KH2cle7s6GC5q+Ez2twQ4jw1upRBvz20vKEDujO4skm
	EH4R2d6SaIHoORzzdWcnTZzu3o/fa++8qgbThiV6OMVV0T/MagzU3D30NVrSaTvRa7ciPWAIMS7
	Y7p9ZNKsI9XbsU50ZL4UYFGBLc91NkLv3d8LF0KU+Ui2dbjDhmGRtcvuuZcIzGbMgmuhlCTtrX7
	g4Pg+nlSKMm94/sd1yblhH+vWU3+dtxIMfauQ==
X-Google-Smtp-Source: AGHT+IHODX9nL+jalzSRHRkJwxaYzf9a7w+AWw5w5Ry9jDLJs9T5DohamwIN94OX93CogB6gTeiJGbjrzMXKX0KJ93k=
X-Received: by 2002:a05:651c:2343:20b0:336:b47b:d145 with SMTP id
 38308e7fff4ca-336ca9f4367mr47380591fa.2.1757004315902; Thu, 04 Sep 2025
 09:45:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 12:45:15 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 12:45:15 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250904-hid-cp2112-fix-set-value-v1-1-17d2e26dc8c9@armadeus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904-hid-cp2112-fix-set-value-v1-1-17d2e26dc8c9@armadeus.com>
Date: Thu, 4 Sep 2025 12:45:15 -0400
X-Gm-Features: Ac12FXzndUbHuaQzJ_4VZEEORe4fBHBc3Z2g8YpNt0l-Cdtkqn6cNAIAkwgPB28
Message-ID: <CAMRc=Mc8RZBi_OF5rDY8ky5pNW3xCBaR+21Anefs=B=enStPrw@mail.gmail.com>
Subject: Re: [PATCH] HID: cp2112: fix setter callbacks return value
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Sep 2025 18:42:07 +0200, "S=C3=A9bastien Szymanski"
<sebastien.szymanski@armadeus.com> said:
> Since commit 6485543488a6 ("HID: cp2112: use new line value setter
> callbacks"), setting a GPIO value always fails with error -EBADE.
>
> That's because the returned value by the setter callbacks is the
> returned value by the hid_hw_raw_request() function which is the number o=
f
> bytes sent on success or a negative value on error. The function
> gpiochip_set() returns -EBADE if the setter callbacks return a value >
> 0.
>
> Fix this by making the setter callbacks return 0 on success or a negative
> value on error.
>
> While at it, use the returned value by cp2112_gpio_set_unlocked() in the
> direction_output callback.
>
> Fixes: 6485543488a6 ("HID: cp2112: use new line value setter callbacks")
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com=
>
> ---

Eek! With the number of conversions it was bound to happen to some drivers
since I can't really functionally test most of them. :(

Thanks for spotting it and fixing it!

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


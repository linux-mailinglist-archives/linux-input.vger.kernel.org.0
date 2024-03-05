Return-Path: <linux-input+bounces-2244-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF277872512
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 18:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A3E28E4CE
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 17:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AA6DDAD;
	Tue,  5 Mar 2024 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3PFWUZd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E7F13FF9
	for <linux-input@vger.kernel.org>; Tue,  5 Mar 2024 17:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709658102; cv=none; b=B8Z8XK337mZ0MjQZaa6kbo+McRlDh/idI/BHXvysxENDM4KDjObsgESq9ASKv7eX7wnQjIbTF6GvA7wU1jhRuaAwgfC58PeBPE7SxDldSY0CX0mriAs6Q08IyFyYbQw57i+RFL8lSXQi0QFzyd9vB8Z4aGmBkpkQJJekxZah1uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709658102; c=relaxed/simple;
	bh=yMG+CD4vfDVlWPCULhaVi6TPoGDMGnIK4zcuB98eric=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCwJ1JVUrdj1Cdl08Qk7fXdRmIwexaJEoVFzvN650hmpJXMdhbrQDX1F8jTzrEkY4E31KiYIPPLx/0Qj9TdBmRd30Q5N7EwIXhhqBB6P3tE2hOaM6KUww9tFRgfiIeOOf76IKjdY8VP7J+75P7ErHqOUzdWL1+WNK4bc6918zDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3PFWUZd; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-564fd9eea75so1246821a12.3
        for <linux-input@vger.kernel.org>; Tue, 05 Mar 2024 09:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709658099; x=1710262899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMG+CD4vfDVlWPCULhaVi6TPoGDMGnIK4zcuB98eric=;
        b=N3PFWUZdWYQFGGlelHgz4FGi6t2tp0YK5DyEgHP/KaXb0IuATkJwq8Ln05GA0YucoH
         zbMX+6y2lXSRXHMRQbj2SNLFQt/UwL4bh25guYXVxWu0CMYtpG4PGnfTlNDdVMMvJhtI
         zWLs9/NdPkE48TABy4n8sGIjhoiP9Ru66u6QXuLSu/nifqhFtlf8NE1STFQ+dEBRfyk2
         MJk/8Dyd1p34IDlxHMm7uR8PTuhIL0nYmeh0e1Mg3lLfExHoYFraB2+/8ypogFIvUFAR
         aEeEuLYo8bnpUlRcpb6ecAKGsYiMAcieT/S63nh7iXsfd7MVmJCt59DNhi7DSvymBzb5
         pdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709658099; x=1710262899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMG+CD4vfDVlWPCULhaVi6TPoGDMGnIK4zcuB98eric=;
        b=K0UZVQhYBHaOyZUHgiCco4l8Z5gsEONtouAOCPgxn9346GFbCUNGSodHQ2s1ZFhQeD
         a2O2dDMAm03S3onE1rNgo+Lg4Yo480tEt1anzX93t0XKEKGmbZx90ICjm6eqXZVZ4J8K
         l4TAauapi84lvt6VFozvwHxvK1vwuEPd/EBx+aSvAHmHRDLVkJSX6NK0GQAI9yirsNY3
         mshEwQ3PYhkcHnZCQm0So837Evdvth6IhLrkrO3DsyjAwD/MnKKg5z2HuR3Vvoqgoufo
         Xowu5DxG7D3lHO0ztQ4DIaOeQ7yzYCXKliTzoQ0uBs7KQEDpWlfI7kBghQNWAng+kWbg
         sj8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKcX2iRPnP04eogq0PC5SL30OURgRnuz3fAGOjtSsOY8GHmkFi7Okk1We3S1i9q7B5ktQF4Uf5CbuRJkQgaDhVZLoCPVMZSWaPCsI=
X-Gm-Message-State: AOJu0YzjCoBLIleVi6VNqijSN624/UI2B9zLk16Ix/Yt/NG8iaU34ShI
	vRQFbQ6TN/dX1RLsxgm9PJyiLV5yfpAfQNuiV0qA+yj9Z/HD74lhR6SB6NEbn3Lh6yuF6bkB1WI
	X7wx785i2in7HCxkCe6TH8IxUesc=
X-Google-Smtp-Source: AGHT+IH8pSZywbsjFX28/4uEBsDASwYHkuDNnNtu+MKPm0yZB+t7CM9SfYfvRe+RLFbGiVzwj8JrH2eivCvxvzidl6c=
X-Received: by 2002:a17:906:1114:b0:a44:46a:e904 with SMTP id
 h20-20020a170906111400b00a44046ae904mr9076363eja.50.1709658099132; Tue, 05
 Mar 2024 09:01:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305101042.10953-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240305101042.10953-2-u.kleine-koenig@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Mar 2024 19:01:02 +0200
Message-ID: <CAHp75Vc2CePCjwvgwNNkccS6fYV1dZam25Rq__6wW1BUr5CFSQ@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio_keys_polled - Suppress deferred probe error
 for gpio
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-input@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 12:10=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

...

> there are a few other exit paths that could use dev_err_probe(), but IIRC
> Dmitry isn't a fan of using dev_err_probe() where the return value cannot=
 be
> EPROBE_DEFER, so I'm only changing this one error path.

It's not true anymore. He is fine with that API, and please use it.

--=20
With Best Regards,
Andy Shevchenko


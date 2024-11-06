Return-Path: <linux-input+bounces-7891-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD95F9BEF5A
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 14:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F44E1F24DDF
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 13:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB65A1FA271;
	Wed,  6 Nov 2024 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f3CcdIPo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512611FA254
	for <linux-input@vger.kernel.org>; Wed,  6 Nov 2024 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900627; cv=none; b=EUB1uW07iU5c/DqkFhdhzj7lPUMAA2cAUD++BZcnaplUbbA9UVIboi8PcXP0MfM6/Rh700g86bvlL7rXKprW9+Mc+jPU5VizxU86Ze7NaT8YmDRSYRTplsMxncewBX4WLOLLPZKvUBgs0IuCxm3jvel4IaQinipRB7V7Tyfn49A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900627; c=relaxed/simple;
	bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwvG5Xl3DHneuDjMWwQaNS9TYepJgwWgEl7+KO3EMIyJW/kFfw1i808sK5zLNsM/mgb4/RvvNviS7q4B+BlUf3Bx4FcDE764ahu3jsWZyEMjrkUPbHJ9RtzIpBIdeTB2DpkYgDQORwlQH07V3OzIo1UNOi/TrV49iLxa3t0uNSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f3CcdIPo; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so9055261fa.0
        for <linux-input@vger.kernel.org>; Wed, 06 Nov 2024 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730900624; x=1731505424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
        b=f3CcdIPoULNOErGfe7BXfAsURIm4et373ySgVx6cdoUgNhp4INO93h6R/F2yDiDfLu
         ldr/kxxfMhsdCTBO4RcOT3i+xlleOh6EIAVyvupoIGUXjOEbPAMoNDXWYyAQ8hjSTPPx
         /FGUHI5TnpwImxyp5vlsMgDzQVhWKduYrGOtSRP5e4vGzQ8P6j7kkfO4CRCvfs4t8H/B
         Pbl1MbBRrILWpxMq1M0rR85mBG77/ZXX20DC5hMUM8EJxMs6iRuQt1bvUHiqIbtq20zx
         YrrDXLLp8jj09I7DE0vrVcdzxKLcZAI+zsSpF1DP+U+sKuXSwZ7YgxTCVPivyP50Lqby
         NvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900624; x=1731505424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
        b=LDmudyk7GG3yVVxAelT0/M//BVmZiwlUhXYfxRiR0GcIeBDThMo9dp5TCfccRn7uZy
         RTc6u6i8/RvWdkNTe3L+9adUgFWoBBVzluM8hwHRtxt4bsinT1R4qT7bJfzlBywszYvi
         BqL6R/rjxJxBJSQionqIYeIoGP4LHdj1Cmhs1EZHXwnoJl6+xGRMtbczvGBLtvPwbuva
         f/+QVBlDCujnA73RE268fN6HnYtehnTu9gOR86cTX0KIXNLOIHTrJ20wrfqdjabEB7Lh
         9tMxVGGBZ1YUGmsqfKHCH1VMgKSsPH5BoNCpOsV91B4Q5VXfJtr67PTrstGrd96Y+uYz
         Nlcg==
X-Forwarded-Encrypted: i=1; AJvYcCXlcDXtVaZbqBGBTs+ES4dH5rJVbvv2QN7JcOtI9jOb0NJRPQgSTSacnr/Quw2dclWUmQYqJYxEW3ppag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPRzDQ/DhF0Rko2c05MXX3jpQAG0XEDk8ckh04ZCGbs5tfUONT
	/R2bwtrHbDB+0VDrONmrTlUZofPep1YZ/KQUyZPoMDnXLTq2lSxYWGOcqvAe4zPIeCkns5zCMrc
	gQDfeJzVVshMA6uOh1X3JzV1c0fpv+M+ADNuvfQ==
X-Google-Smtp-Source: AGHT+IHUtnnhEva3lCB8uWh8uIWC06tcgEpMXvu5am5NhlAEbhUxeQ79Id1SoLC6uXkPBOCC/N9jH1BHhM6ITnKzWf8=
X-Received: by 2002:a05:651c:210a:b0:2fa:ce0d:ec34 with SMTP id
 38308e7fff4ca-2ff0cb2376emr8634191fa.2.1730900624427; Wed, 06 Nov 2024
 05:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <ZytP0XGgmz_R5gos@smile.fi.intel.com>
In-Reply-To: <ZytP0XGgmz_R5gos@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 6 Nov 2024 14:43:32 +0100
Message-ID: <CAMRc=MfQw1YmOoq-rK5Bq3uDK8cmjG_xsUgVDs28phsqkcHofA@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 12:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 04, 2024 at 11:34:18AM +0200, Andy Shevchenko wrote:
> > This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
> > left. Convert those users to call modern APIs and drop this legacy piec=
e
> > from the source tree.
> >
> > The idea is to route this via GPIO tree, please Ack.
>
> Thank you for Acks, folks!
>
> Dominik, is it possible to get yours or are you inactive nowadays (I saw
> last mention of your name ca. 2023).
>
> Bart, we have all Acks except pcmcia (see also above), and the change is
> the same all over the places, do you think it's okay to apply if Dominik
> won't respond for a few days?
>

If we don't get an ack until Friday, I will take it as is.

Bart


Return-Path: <linux-input+bounces-7975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4F59C1811
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 09:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D52A1F23806
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 08:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A911DF753;
	Fri,  8 Nov 2024 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjAlJJWq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BEB1D1519
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054847; cv=none; b=oTa2g/tnX5BFL9TatebEB5sgvMQE5yvv1AiCTgRTxDwsmugipFplB8PE66HSeJXHWm+ZJXAhctelNKKfV0YIheFubDu7K2B9lNuVYCP5PnuhcK7F+kX5qHYks/geUDbY1x5Oydv26yGknefWPxWLJ/ZhctiFjaSomFuqweTIx4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054847; c=relaxed/simple;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3rYIEgboxGjNyLQnvlSFF30Hv0Q9S24FARgsbk8RbOjUFkJrfDSz6eI9h38X6rWcM2bEtFdWPcUiiPZZRuIRm87/FO82sLN+FjPbLZ7l7DKIgBmyhjasUkIEoJcvSSBCUgS3n9300+Yy7xNd7wxjGY3IWXO1q+ARgkN042FfBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjAlJJWq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb5111747cso18556181fa.2
        for <linux-input@vger.kernel.org>; Fri, 08 Nov 2024 00:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054843; x=1731659643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=xjAlJJWqX0HSSNoH6NdsMfiPu44D1spoJUIiT3J3Xp40RiHVFvafLYUmQzldCpIs5D
         WnLruQJJDv7+UlQJemNEYN4CogQZwaani60Ol7k0hz9L1jpCiqzhCMUt02yxVqZrjAoL
         QRJc9r8obpv+vQohZpQKKy+W/l4hvECRujmHRSaB7a5CvyuULcW2ndh75zxjGIrqFLMM
         cOws26E39SCdUPt9DxB8C9s2yPUNByN5aZJBDyyu9xPFGB9LmNWMgkjfCgq5nT4BzNUe
         tN6AHJ94trIAE8KOD1bOB/HHM6PX9KXoOn/I3t9b1wLyZGDzq6wnhRUKnwdFsSUwWaYU
         D6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054843; x=1731659643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=hlZMvbRo/gzbv/MNVU/acsMRI1lkhAUnnLu/FrCzkTO5Iemf5OsKt9BdhrFBh0Y1SA
         w8RhNFtN0cUY113J/4Y6HtYl1Eyk1sZXAU2WnD5rOhc9MQKYqaAm5owoIKkyucAtTfiK
         h36rhkcAbiRT7DuJXEylpXdST/KqbwcjHjj34TNa8DSk4DAL7FvGtV53sCqgkx2Iq6tq
         Nd1wqIQBvBWvSIoVSxSkXlX/gMF4FIeOt7V9J51tE2s6vDbDw9iH8pJ3PsvrOGKrp4B+
         a7LG8UuvuVLy/L7EiFssrmP0Ow4F4TVqkGIJngDNoHJkG4TeMIFKteDRlcQCrgUW5sk6
         RW7w==
X-Forwarded-Encrypted: i=1; AJvYcCWmiv8c5bbgeuUb7Cxii/odPNUWtp8fFojYlL4HFZJsdAUPTZuFMK7+x10GqTHlPiy06Bfd6bVWHcuIQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKrP2jn3dYzvTRoSs/06cxBpO8Sb2eCNKn2K/sAmlcWktXYH+q
	lmxYxheBzL341ODPwez+LeZZAJPixHHA/57CoyI+EOpCeOfKH4K3oA6CUMxHVPpQ9mAIIOZeLSF
	EkZD1G9GGF8bIEPYxWk00yYpbS/EitgF0ntXdFQ==
X-Google-Smtp-Source: AGHT+IGtlBw8/BzKpYwXBVKDarOJwHXN0bQ5Y2Edkm/hG0GzbaUmoWPVA9ksvjdd8kLv/JY3KG1mkk4/qEjDQJYnfQs=
X-Received: by 2002:a2e:be86:0:b0:2fb:59dc:735a with SMTP id
 38308e7fff4ca-2ff2031a659mr7523931fa.41.1731054843501; Fri, 08 Nov 2024
 00:34:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:33:51 +0100
Message-ID: <CACRpkdb2NvL3-+BahUHVWEj+gPKLRmVi3aTrLUSemFoNuj2nmg@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


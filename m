Return-Path: <linux-input+bounces-1238-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D582D5BA
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 10:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8281C21488
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 09:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31633C8D2;
	Mon, 15 Jan 2024 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GULQGNiM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D7C8C2
	for <linux-input@vger.kernel.org>; Mon, 15 Jan 2024 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e811c5c1adso72532307b3.2
        for <linux-input@vger.kernel.org>; Mon, 15 Jan 2024 01:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705310330; x=1705915130; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8j6jpoH+e29byFqwjhQgTJ23T0dWFo+7NJRMVvuKTbY=;
        b=GULQGNiMAPKub+ED4etGgjTIrafBleJRbTyucRdKKTq/IYKheimsyDg5DR9SMCN4aH
         RNZlLcm7g6UE2VFJ55q5gn7Fu6dfgUA9WbHHGloih5U0B0Y8oEaY2MFqVSV6W98SV1ah
         ie2VxAHIPF5gygFJHXJGlUuCZ2bn//dM7NFT99aMWWwDMh22utGpOmnRTSMxGc4mhFKR
         t7QKgA4BxtMYpN+Bf6wcjLigxFzYbtt6Rb4qT2b4IMY05EczLoGZE/coaLpi+09z5oF9
         u16H0q8GeglfXN5Y1k9jru80o5fqAOzzcwCStxVyZYibS2RPjUnOurKbmWP97OYAP8Hj
         dMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705310330; x=1705915130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8j6jpoH+e29byFqwjhQgTJ23T0dWFo+7NJRMVvuKTbY=;
        b=Shu/Ys+6b5dz0P07l/rLFtd3BWh0YpGqfD+9ejxwVHWCSVFwWmRhKZ27vSFvRI4wF0
         2kKiee8NcUqAV04KNo4kZrZ7BfUrpuba1UdddXzdJ5hg/HnfJsmfFyv9vPTEza6/1CLY
         ORUUoZfqd5kqnk73HwnaJQ6Ufa7lXe/3z201lL5RJfUFjwlWsQ4jhi15iCYKWtZukp7L
         2g0k4AyWF9s6fnOIOFoIIgdvEg0OzfG90EChZYf3vJBqquKmCK5t+ll63kvaud9ANPtE
         WjZY6dH3zlIc30vX9GQYXnX3kj6fEtq9JY/sSY1zPJTyPZOZYHiari7KN9AeMJ982zSk
         b19w==
X-Gm-Message-State: AOJu0YzO7psOK4PegQcJs5OLVpBu6A0LqHNCcpiijanuuOddXSKLtaxZ
	1USRE6JFdQdw8+eKIM/VILm01KnVKpfr7ZlgRHL84jTm4R1Sag==
X-Google-Smtp-Source: AGHT+IGRd/TXax8WDQ3qyr9wNBdbA3NDQ4CmAuXJJ/xLOjfFGsAEY1UN1ufGvBLiBeyWtdMpxs1kpiyzbzcZUTvurMY=
X-Received: by 2002:a05:690c:b0d:b0:5d7:1941:356b with SMTP id
 cj13-20020a05690c0b0d00b005d71941356bmr2945275ywb.82.1705310330701; Mon, 15
 Jan 2024 01:18:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f7b5ff1e-8f34-4d98-a7be-b826cb897dc8@moroto.mountain>
In-Reply-To: <f7b5ff1e-8f34-4d98-a7be-b826cb897dc8@moroto.mountain>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 15 Jan 2024 10:18:39 +0100
Message-ID: <CACMJSetMZ5Z0rhEy3uGJSAWjzwT9t60eBLxjmPOr9eAq3UpHNQ@mail.gmail.com>
Subject: Re: [bug report] gpiolib: use a mutex to protect the list of GPIO devices
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-wireless@vger.kernel.org, linux-input@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jan 2024 at 09:50, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Hello Bartosz Golaszewski,
>
> The patch 65a828bab158: "gpiolib: use a mutex to protect the list of
> GPIO devices" from Dec 15, 2023 (linux-next), leads to the following
> Smatch static checker warning:
>
>         drivers/net/wireless/ath/ath9k/hw.c:2836 ath9k_hw_gpio_get()
>         warn: sleeping in atomic context
>
> drivers/net/wireless/ath/ath9k/hw.c
>     2826                         val = MS_REG_READ(AR9285, gpio);
>     2827                 else if (AR_SREV_9280(ah))
>     2828                         val = MS_REG_READ(AR928X, gpio);
>     2829                 else if (AR_DEVID_7010(ah))
>     2830                         val = REG_READ(ah, AR7010_GPIO_IN) & BIT(gpio);
>     2831                 else if (AR_SREV_9300_20_OR_LATER(ah))
>     2832                         val = REG_READ(ah, AR_GPIO_IN(ah)) & BIT(gpio);
>     2833                 else
>     2834                         val = MS_REG_READ(AR, gpio);
>     2835         } else if (BIT(gpio) & ah->caps.gpio_requested) {
> --> 2836                 val = gpio_get_value(gpio) & BIT(gpio);
>                                ^^^^^^^^^^^^^^
>
>     2837         } else {
>     2838                 WARN_ON(1);
>     2839         }
>     2840
>     2841         return !!val;
>     2842 }
>
> Before gpio_get_value() took a spinlock but now it takes a mutex
> (actually a rw semaphor now).  The call tree where we are in atomic
> context is:
>
> ath_btcoex_period_timer() <- disables preempt
> -> ath_detect_bt_priority()
>    -> ath9k_hw_gpio_get()
>
> Another warning this change causes is:
>
> drivers/input/keyboard/matrix_keypad.c:95 enable_row_irqs() warn: sleeping in atomic context
> matrix_keypad_scan() <- disables preempt
> -> enable_row_irqs()
>
> drivers/input/keyboard/matrix_keypad.c:108 disable_row_irqs() warn: sleeping in atomic context
> matrix_keypad_interrupt() <- disables preempt
> -> disable_row_irqs()
>
> regards,
> dan carpenter

Ah, the legacy API is at it again. Every legacy gpio_get/set_value()
call results in calling gpio_to_desc() after which a chip lookup
follows, taking the sleeping lock). Ugh, I will have to revert this. I
think that the only way forward will be an SCRU protected list.

That is what 15 years of technical debt looks like sadly. :(

Bartosz


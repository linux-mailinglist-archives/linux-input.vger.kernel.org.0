Return-Path: <linux-input+bounces-7976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CBA9C1813
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 09:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52A5C1F2427D
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 08:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335BC1D1519;
	Fri,  8 Nov 2024 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDwgzitj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727671DDC26
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054877; cv=none; b=Rn31CR9YmzOA8mf4L9rCRRRpaSM5MpK580wDS+gsM7tGuNrfLojet5Dcime5647bB4nK5oUR39mbU/9cmeKiDM1uWb1lhOr0OFhEaqYiukg+/JHbL5veLc8XgZw3ViJpAF6IugYPiaIH/EycFvY47H50VN1SDZhu+Xjfv4oO7XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054877; c=relaxed/simple;
	bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbAc5i1O4fr91fLygy+5NVHxOXvb59Gl3kW+E5q5o7RyUqakYN1USjMjo5YLPUAvVta0hVOc7AaZR0qQRDfeZUCN3L7ouKXZFkFaY3+qAc5Y9bJAytGcyvCXQO/+0k23w9MXexDZfCZCdYcuApYWjTBbn9oCuSZSaF/0yqaieUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDwgzitj; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so17961551fa.3
        for <linux-input@vger.kernel.org>; Fri, 08 Nov 2024 00:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054873; x=1731659673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
        b=aDwgzitjyirX0jfR/DSNwos9ZnkUVJ7ZTgdXUcb3X0YnrIrTeUPlDgmy22bQxvTZDv
         WQAelVSxAdMmnzYPwwWrTZQkRWncJ7zUyjBfi+/VBiWH5SjQI+CMEpS8X1SUlsNuk2ax
         qcdyKmSZ/X9oG7ph9zEphqgzCDjVUL9h6DipVhM4xwbE1MjSZy4q3vmMIJIkorXDB5Ls
         N5WzTZsPeW0ptZnLqGWhT2uAhKYousBH7RtRPoAPunn0Ps4OeLJhUgr0bZYlj5EVz5Bs
         Ea9GwO6o1InpZkEK4B0Bbvh2OeqA2T6ri0RtzZQmek0HfqbMVg8X2Z+bg29HWYOSdvp5
         cRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054874; x=1731659674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
        b=d5IZ8iHAmVKQgJY1Pl/lRJgXdUEPZAlL1LTspzmd5Gw5Pb1SgpNfkrSe0eu5q1qj/+
         kTqZCT54sDsRYL2Y4oZKP2BIFaYl2dP7xyfQWY1PFlG17TzbG7Yg/mkFrKiIkv6FLEfE
         NsD7nAtSIrc583PXSvu81tjX0fzbjCFxkUyZ48UxoNbNZ5qJh3vgtIE1nGojAjgPz8HL
         7/ffP4rjoeDbZlnmbGT3co//1kv1rGcSKoS8QUr00sS6sebMO8Ra0Tw/aamIyQF8MMU7
         9s32hkDr5EXHOLV/5AephcpgFyjutWh3ycB7ELlzp91yGe6I2wqV+MVms0SUeP4um9tF
         bhog==
X-Forwarded-Encrypted: i=1; AJvYcCXEaI+ombn7K6WS8lRZwJJsQ6KjnKIIQ/3JXDtNNRMfdL+kZ7fj2YDGJ6BvHDtJQMv8/x+mpSaFlWHZ1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIW39xm8aFdGsDioSi/fvr7ttC6M6rnMXOSjoZrftaShCcu1Ha
	826d4eGw4nVh2AswYj3ZsXHK/ZtgnexV0bAgDATBnxyWQolaXQZ9nNLAh8wx3sLJ01tAJ1lKSn6
	uZfkk+4eoyO1Rd4U0jmatrtv+g8aSN0HE3psFqg==
X-Google-Smtp-Source: AGHT+IHx7mAPhJnzxE7EYgyRjyP79PfLYtwkdmgWKx0QpJkHxCqAuAqQZIcNr65Vl/TTpb1mgGDc7xzfzo1LsoeLK4Y=
X-Received: by 2002:a2e:a98c:0:b0:2f7:a759:72a7 with SMTP id
 38308e7fff4ca-2ff2016dabfmr8041491fa.22.1731054873529; Fri, 08 Nov 2024
 00:34:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:34:22 +0100
Message-ID: <CACRpkdZ6gYfbkjcWMNOOyN9owg8n6ApFVv5XZXUA2CY4-JXOVw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
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


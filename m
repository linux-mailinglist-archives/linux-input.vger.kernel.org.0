Return-Path: <linux-input+bounces-7995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B99C2DAF
	for <lists+linux-input@lfdr.de>; Sat,  9 Nov 2024 14:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 057A91C20CA1
	for <lists+linux-input@lfdr.de>; Sat,  9 Nov 2024 13:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED2C1957FD;
	Sat,  9 Nov 2024 13:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i8RgDA+R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F1C194ADB
	for <linux-input@vger.kernel.org>; Sat,  9 Nov 2024 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731160572; cv=none; b=uFqpNoKGHGt2xVyf7XzVyZz3SiB/MdjOdnZg3Bv6Fd6CNt4168H4yuj58ZFjtDXtbO1eRRtkJ0frmmRNKORlijFrDWx0Xr+kgyda2O8FyeM4UROMay50dY0prYvpzZdCYdaIHE36lSBbg4JUjF6PPSr+cNOYlMW8rreePqlsmnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731160572; c=relaxed/simple;
	bh=6tMOEZ4hYeIaERsoiWpF63YtRH/4HelSxe57Ej6i2fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=phjkXm6+Lb8JCADPxzFcNCXhb/DVV1dti/J1so8tfG+qtjnweSE9NiAVsfnQGgRzIGnFZV8updgoDfy2jVZcdrAHIxcoWMd0/cjBYn92r++KlzfaBJo/OBKhEPL9wc2qPyfCn4Z9voA/PQ4XYuE9MhXBLUsJZuI05fQ+Rk/cohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i8RgDA+R; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d447de11dso2266502f8f.1
        for <linux-input@vger.kernel.org>; Sat, 09 Nov 2024 05:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731160569; x=1731765369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+Kc0rzleBniDws42taDJiRijBO7TNIofluEdMhVLBw=;
        b=i8RgDA+RwNTUcYFVoXTTBi5tKRLJdcQYHhkF2m4E6IsH3rvwLc/IqT3Uu7KT1A5EsB
         Z5sTBiXFWkXrliwc2JWgk0vPtvzdf7KW4qjUiwh9lpdnboLjSDzjN08ZnPxePDuaQ+Xi
         jIu+Gj9BBtyWwFHEiooN9pnN/F9WmaUqu3qAnT1iJ1c7lFL4h5gMlo5sroxmq+ql4PD9
         lYQc6kefHnldblWrz3FdtuuPQqnYx4e+SElm5xCVyASrt5OgJe87kXjgeEnV4zDJQ0Gt
         8tSfnRdJMi8UKc+94Cl69/kZx62QbU8xWRmZlDRmQ8cpYFNAXnd2mfptNEBQNxge+5th
         yf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731160569; x=1731765369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+Kc0rzleBniDws42taDJiRijBO7TNIofluEdMhVLBw=;
        b=dvipSkqlsqod9Tm6g9up0Y9WBUF2KfJp+Qi06njntH0ORkxl35BLx7Oujdcws8e+24
         f780uUDKAyiAykxzUJNADKB8f0C1oJsUZaP9REqCQ4y/Os60qAXHSJRzrLeSn678pEX0
         Ip1sE5R/ten2wWC+vQOpjYfzo45L3QdRQOlVqlwZnE2gUEvH007iCX8lKQKdlPAGvD/e
         ksYyeZmeJemxYXWzYE2F0+ckEmoWH3Oqe8+upQsP/OoKRHxD+B6jCHx3SLDwMY7t+jzZ
         Lrn5y2vIm4wowzDYsu8wln2uS8aHgZjtwrF8sEyvlU0XtWJdDYcE5B78Y6LzU0eH+48X
         9L7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVh1eWDnFdBKi3Mt/qm0sguUJ0Qn6dySdj1VxrTZarhhHI8lFBQKZe9ooyr7byyiaw7rTodrWGi6RBqLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyloM1e/5smdxMn+EcngC2DShDMCCFhx4GIw0SozvvHbFbiL/h1
	l4eJtEyJFsrX7DAhQX1+HU6WQI4krsKsh/RSTKHXpGY5jWK3K/vjDwbHl1tHbOY=
X-Google-Smtp-Source: AGHT+IFsS2LMq6BH18aGRCC9suSXqIwBnIqgdOjirnJVxP9+m+h71xqEBknv7upPJ7jntZEG8ZeeBg==
X-Received: by 2002:a05:6000:385:b0:381:e702:af15 with SMTP id ffacd0b85a97d-381f182fc64mr5833268f8f.37.1731160568840;
        Sat, 09 Nov 2024 05:56:08 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3194:2330:43bb:8a9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c18e0sm109576935e9.28.2024.11.09.05.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 05:56:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
Date: Sat,  9 Nov 2024 14:56:06 +0100
Message-ID: <173116056404.6855.877058419163067768.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 04 Nov 2024 11:34:18 +0200, Andy Shevchenko wrote:
> This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
> left. Convert those users to call modern APIs and drop this legacy piece
> from the source tree.
> 
> The idea is to route this via GPIO tree, please Ack.
> 
> Andy Shevchenko (6):
>   Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
>   Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
>   leds: gpio: Avoid using GPIOF_ACTIVE_LOW
>   pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
>   USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
>   gpio: Get rid of GPIOF_ACTIVE_LOW
> 
> [...]

Applied, thanks!

[1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
      commit: a04abf25fb1ac47dd2bf1e1b7ca24ca78688b175
[2/6] Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
      commit: 081aaf2dfcfa10fa5cb5444b77b154cce4355708
[3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
      commit: e6a2f0ea519fd2478920d02ce3de07a14fe36b2f
[4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
      commit: 15998583b19749e63c5cd0431a2517f524352762
[5/6] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
      commit: 62d2a940f29e6aa5a1d844a90820ca6240a99b34
[6/6] gpio: Get rid of GPIOF_ACTIVE_LOW
      commit: fffb9fff12250018a6f4d3e411f9d289210da329

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


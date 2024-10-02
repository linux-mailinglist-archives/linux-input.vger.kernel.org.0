Return-Path: <linux-input+bounces-7033-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C533098E4CD
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 23:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 821E9286100
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 21:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEF0216A3D;
	Wed,  2 Oct 2024 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="knovUlSm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B452141D6
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 21:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727904057; cv=none; b=pUt8u5d6tHWgLkx8Xvbav2Z4EIwFHTvtJnhr6eMYoL5Y8bisQSSFQK/PCjcEnfRvMW6yYL1r0bI5+mkGHNXHtkwWxKnzW9LNKv5Xyrb27LyJoyf747bQOWawKRj6PLVWKtVjFK8s3rVhzhMT2jFOEj3SNX7vhytSWMhB6RySh+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727904057; c=relaxed/simple;
	bh=73IOJeQNO2jRGPysszj7T+K8Fx+/mkFyvUd2/qXGo+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJEEWgn/RGEuy5+u43T32Fc1anhtoSJ8wfN6qwsjPmTvmpNM9OFoAYHQ/q7RZyJw7NSGfdViouG7sAB5t0mlnd1CRpi6vd2CfRIk79Mn9KmZhrkNK6nZVg59ewxkONKXzcfSNDV9egb4J/QZXL+bgOamD4Os4XtHWhYgYQyXAAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=knovUlSm; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad75b46a3so2839311fa.2
        for <linux-input@vger.kernel.org>; Wed, 02 Oct 2024 14:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727904053; x=1728508853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73IOJeQNO2jRGPysszj7T+K8Fx+/mkFyvUd2/qXGo+Y=;
        b=knovUlSmYtx4tOl37lRRaS0Ux0VWf4sfrHlIkQazjWXA7cP8jsFT1steiUiNhMINXO
         k+Gn/jQ30KfG2lu/geK8dzBz614gytscdE4qj6fqNMYAY/3R9ApJRbArGuUiQFpfwZsL
         db0f6zHZR4B3rd5U421KFqLn6GTCZww0PCAUp3wjsYi3WgR3IEyPDrSqtVu9GlMaWqtq
         +W4u2iNR/RUnKSkPKh7wd70xPwe8yblWkGot1QzpksTDyyvbwt82MhHEGQNkIKb7ym1E
         zC7yH/rnhS2m475ITEnmbm+m/105A2+nuQMUYZ10rW2vIURxDyJ+2VJaC9Ryur7BHa8d
         Xvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727904053; x=1728508853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73IOJeQNO2jRGPysszj7T+K8Fx+/mkFyvUd2/qXGo+Y=;
        b=bfpLaoUYF0KMEOuHJQmGWCvNgFuuf4O6fTleAO6UOmJ7TdfpMgbejwWSzHBLCw6VO8
         xQAzQvDoCufUrqLD3OHWa7CpVKGJronAKzf86u7Gcaxxef1FNgmgZC48koQYmh3fBojq
         MAZhBSpv6X+dBNQrCJx2jz49pLt+3tXCjBOQRWpOPXSw6juWGH+K5WwfzACCS9W5MNJu
         /ERL1uWqSvcWKkDwHxFMoLB9AtRXGjUrakqul18jkA3zRwcF9INjh6R2ngYoeOXqB1kl
         Q9VT+YoTIrC5oWQNqcuxC6oxepdbHygGjwY/MqS0i3N49Z8NWW1syD6suv0Ki9V8LVvL
         rI0w==
X-Forwarded-Encrypted: i=1; AJvYcCWVs/grUT9Zkcn6vrQIsI0JH29Ur0PIW81oDPwHRrd2mUFrBQjeVJ1lG7iROQ6fUxv9oU7Ua0i4ej+x/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6YGM14llWmBv9LSnX190AGTtWxHL+I/mxNiCPZyc+q9MQh3bc
	emiQIq7lUN4AJ6u3O2UQe5RdBPOBs8VrylT7cuzXSBHlmcoX5wK0UVbkCrwbEoq1TJcrU/zy1yj
	WI0PUCwLlOtY+XCxJDv+aSOe/79JQpscnnuWWPQoJuVCPB5Df
X-Google-Smtp-Source: AGHT+IHgPq6jsvUU3hV6GNS2J0rDfWJNW1OOn+us9N3edzguKRahKt3EKGkINd7bQSjtE0kx1rL0AcSSWIU6TWVp3s0=
X-Received: by 2002:a2e:be90:0:b0:2fa:d3d8:e991 with SMTP id
 38308e7fff4ca-2fae1003b3bmr28418661fa.6.1727904053354; Wed, 02 Oct 2024
 14:20:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru>
 <CACRpkdZj57_jGDJiXgeatntUMKLdUV-GWCN=crkDRD2sUgQ95w@mail.gmail.com> <4b37b70b52234017e0ade2710c276f3f@trvn.ru>
In-Reply-To: <4b37b70b52234017e0ade2710c276f3f@trvn.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 23:20:41 +0200
Message-ID: <CACRpkda99fSxMbuQPsTqinJFxN8F07o94YFM5deSMGGDb+2_4g@mail.gmail.com>
Subject: Re: [PATCH] Input: zinitix - Don't fail if linux,keycodes prop is absent
To: Nikita Travkin <nikita@trvn.ru>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jakob Hauser <jahau@rocketmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 4:48=E2=80=AFPM Nikita Travkin <nikita@trvn.ru> wrot=
e:

> > BTW: Nikita have you noticed and weird offsets in your Zinitix
> > touchscreens? Mine seem to be off and I need to put my
> > fingers a bit below the actual target on the screen, consistently.
> > I was thinking maybe calibration support is necessary.
>
> I for sure noticed this in the context of touchkeys: On the device I
> have, if you don't enable the touchkeys, the controller assigns
> the lines connected to them to the touch grid, which offsets
> the real touchscreen by two lines. Effectively this means that
> touch surface is stretched a bit below the screen, and i.e. touching
> at the very bottom will produce a touch event a bit above
> the actual touch point. Enabling touchkeys reassigns those lines
> and then the display is working correctly.
>
> This was the prime reason why I've even made the tkey series in
> the first place :D

It's embarrassing that I was so focused on just testing the touchkey
support to not notice that it actually fixes this issue for me too :D

Excellent, two problems solved.

Yours,
Linus Walleij


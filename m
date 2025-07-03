Return-Path: <linux-input+bounces-13359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9BFAF6D0E
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 10:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39C887AB078
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 08:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05EA2D0C81;
	Thu,  3 Jul 2025 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qBUXl54i"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE2A2DE6E8
	for <linux-input@vger.kernel.org>; Thu,  3 Jul 2025 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531769; cv=none; b=aMKIiPaJP4cvwCYfpRD/1t2/2prdECY+NkVNGAoKRuLC8hqo83fjZkyAhU2Cf17YK8jf0Hbn/xZ+XM8cjGMQQG2EDKxKe3qdHlhr2EFufyW6R1UVHwhA/FOB5A39uNvrCmoLo0TxAAdcem01NgUspjpwKz6HeN58Jz2qDCWAh7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531769; c=relaxed/simple;
	bh=yCgvEF3BXwg254BL3VuI6mSXhUcwMOdng9eK89uzkVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYLoRb60ONWLEdFesDvitG2Y9i6+Y+G4nat9lc0RgHbS3tGeN57A0r22kzMJ8+aXOF93Rnrwl+6Q+toaIl+4AHlqnHB4HKLt7qAVrTZEK90fzRf30Tcl8gmDpOansZIUEMbM/Z28wJokjc29gHmryTV9O5CpQz4+fhLj9jtfAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qBUXl54i; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553dceb345eso6369803e87.1
        for <linux-input@vger.kernel.org>; Thu, 03 Jul 2025 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751531765; x=1752136565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNAqI6qp9DPwgHXIMziYUYhWIJDnhFlRLmGxn/xudMY=;
        b=qBUXl54ibB/dGWkpR/I2WyS/E15jfFW79yGc6qa1VmQ3AXeaYC0ro6eYqlzjVFCN68
         3czFxQqGStMCmtbWwNrtAE6XiG4jWfN/uyCoVKVJGJlknAkVyvwkKGTn0+x5XZK0uD0N
         HsBDaEDl6UT0iiSS7ZP6AVpcuVbXb29uS7qYanZ0oLG/K1D0hLIgQzzUcdCq/8i3Prmz
         sb7MECuu63Hn+KGEV2vC+paqfoPr+Dpl4IIwEY7NjKnyX3/04cfE6SvqY/+ER4Fe0DEZ
         7dzH5Wz6MhsuVv/I4hhjcSigYCrccvwagc6rJe08KB0LuHqmVRyJlB5WbZpXdbv6W7Tc
         2Zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531765; x=1752136565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNAqI6qp9DPwgHXIMziYUYhWIJDnhFlRLmGxn/xudMY=;
        b=Ft237tI4Dnx0Bq8We01Fxt40JP+3wHptn+9p6Skodt+F4DzV/sadP+Bh9uVnINPp0n
         WotqdW3iRCNjXesT1M1ZoaqhX8fEeT8f/1mTR1370GZE297rUq6p4uRFfsKQrre6eWH7
         1c8RFYjDW2nQYK75nVOgpAwa5FVgMCHFLc+zqoYPmcjbfbL5oK8+UyKfFrIQBhbN0HUm
         rVCHCFfT4xxdnF2ekhW44vdNfCPT/F8u5yneJ3i+KglVkrXY9EUXWQepIolgg5t1dCB7
         kg8WxAslnrZ1YvAvyBpPd9Xav3F0/m0niVkzHMP24S3IOCGpOPx5Kl/78oRtXLkRxp1K
         naGw==
X-Forwarded-Encrypted: i=1; AJvYcCXb9TG2UTzJHEiGGCEJ2zYBDRaFeJhWMxl7qajXwk/NxTlM9lrYI0XIoctm+N5zLOgS8mQleObAHssaSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXuUKVGaC5T2HhVpdk9z3W+uFmyt1+/6In7joLk0Gj93h6g8dX
	awFrzKIoRTBxZUAyVDklqp/vOx4QU1y1NqqZFwdXrDutWrZkEYvLQM9NUQZakZCkHkrVfyV+sAs
	4Uctc+C+OlWgNd06caBWIGtrrKA5GriYTjMLz5bFK8Q==
X-Gm-Gg: ASbGncsPa+7yqCN2cs7iwNHgRV1aB6ZKBt7m1i1O0uhGKbItvLscLFrC0SEUxor3ZA2
	20EmNRKHLHE/FM6VT5NwrN+Nzamu7Cdjbnp6ASSZQ3x4x1yqpCLa728RWMUb+Gcl5BgSYy8GUIj
	A0Lb5f32utcqzud1jzalk4EXhObHtkAJxI1hlOTlPmh7QQyJ8jB9+BjcTSrjrrrMfMF9Vv7fvF7
	A==
X-Google-Smtp-Source: AGHT+IEuPyZAYFCdmQ89V9IkFw3Ed/mlCz+VFY/HSyYfKRFKouDT5YAQiOyUj8RrcRrwDGza8mWYWDjfTyIwVp4+DXE=
X-Received: by 2002:a05:6512:3994:b0:553:341f:12a3 with SMTP id
 2adb3069b0e04-5562ef9a6c8mr676826e87.39.1751531764763; Thu, 03 Jul 2025
 01:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-dev-adp5589-fw-v7-0-b1fcfe9e9826@analog.com> <20250702133609.GQ10134@google.com>
In-Reply-To: <20250702133609.GQ10134@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Jul 2025 10:35:53 +0200
X-Gm-Features: Ac12FXxFfJbvdzw57rmctFgHkWKx-gv4baKpEMbXxjF0v8UThJiEjLVfc7FisWs
Message-ID: <CAMRc=MfSeJrAatC-42upkH5iWYxuNvR26ZfHS=1v+XewspGnJg@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between MFD, GPIO, Input and PWM due
 for the v6.17 merge window
To: Lee Jones <lee@kernel.org>
Cc: nuno.sa@analog.com, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:36=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> Enjoy!
>
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-i=
nput-pwm-v6.17
>
> for you to fetch changes up to 45ee66c37f9bd8cff7718c70d84e0291d385a093:
>
>   mfd: adp5585: Add support for a reset pin (2025-07-01 21:50:51 +0100)
>
> ----------------------------------------------------------------

Thanks, pulled.

Bartosz


Return-Path: <linux-input+bounces-11822-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0812AA91C34
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 14:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59801446DAD
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 12:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD30624501D;
	Thu, 17 Apr 2025 12:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oH/r7LEs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E0235BE1
	for <linux-input@vger.kernel.org>; Thu, 17 Apr 2025 12:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892951; cv=none; b=hCpqBIZjdk5kBI7y3OpXFZi45sIu+9AZoHlghG6Je0jvRE413D5P0wWAxx5GbvMQOeuBh4OEZCbMUWCAeEQPqZcoGkqAT2setk1Lb7fMalSmXKuxsQ94XwKlkoIf0cLktsqFQcPRYPmbA5OxCFkWcUl4W6vYUhEys0P/SpNHw+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892951; c=relaxed/simple;
	bh=nu6kbIacrpDCT5vMw5ES0U54Qb9pSv7ZCfuS9blSr08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L81DDpyCbdz35TrD15d12UXPVbRaHE3CAEODc5xElGwTcQE9tUFr6PC2I86d3idhfuBKAL4iaGTAY+nn7CVY2QZEdEq4hknu5z73/asW7VwhCieieILJwMKUlelwuv5YwWD3JQvZcO/ahe06MAk6ppg+TEfV49ha20mxHUbwmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oH/r7LEs; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54ac9d57173so1949886e87.0
        for <linux-input@vger.kernel.org>; Thu, 17 Apr 2025 05:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744892948; x=1745497748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nu6kbIacrpDCT5vMw5ES0U54Qb9pSv7ZCfuS9blSr08=;
        b=oH/r7LEsFoAz0i1pw1RFw6ScprK94yEpx7iis+HM63ZVWEVzko9AU1wMLopqzg+fAb
         DgQbDu4mQqxtRMnbFJqlg8Ip32xKqv7nULaSedKbmcfxViynuRJsYRXXPTaQlUYTlUNI
         w6HGaaOIh1KB4ikcg04yvIgX4nEMfa8ZQm+imUBibn3w+Wvdec+nM+93CHI/KXiOQdfv
         wakzn+USbfO7rHxmJan9gG4mvfPVKoFpt65JWR3pjQbcF0jtSiwC0En55FJs9xZFRodM
         7HwvfHqsvyFmZsYLg+hqLJmWOE90DQDzt9+GmDEglO8P/EN6Pp6ss4l3A9Ohskpit50q
         Gk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892948; x=1745497748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nu6kbIacrpDCT5vMw5ES0U54Qb9pSv7ZCfuS9blSr08=;
        b=wI/+o4Ibfq7F3GXkerf+xyBkSyPbOgthlSc77WPX3STWUXHDnmVYNyp/o6nzKOcwV0
         Phx7JEbHlPefW4/+tn7pw2CnpWJ1DA3KD2GebfU7SoQU9vza2U+VvsMllUpku9BIFdMh
         J+lJxPbung9i2d0/RDLMD2s6wnf2jb/IsEerkiXVioUjlwXbEXrb/4dFa6fV1m4ekk2k
         B66H9zgYHLIQKo0VJVlXLxkvesCu8jlRvSCu6j1onGSfIgMPcFUIbem8zQLopoP8qunc
         ki5cxdsxtBENDQSH9kE9gf1jsxoWtibrD7IKPa48R/AgyeQ/KW1j05Mi/YE6xIHWQWZA
         hrIw==
X-Forwarded-Encrypted: i=1; AJvYcCUutdaNW2UjVsWFeGAXQi3JwSPqsUaMeNkNVrG226C+MD/qFfvbqtT7poPnBvr3f+O3oqhJEBD8sErDmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgR83oOUlrBnpfVqzmEbNmR9H1KCNnLwHI1/F6e3X7uLR3/Mf
	N3CTUDAElWVHjzceD1nJMwkp3OyrMqqrWZsfOIKaynerrcmmU4AOKihXyFfoM0ZvNWV7B0fS2Gj
	m6ImZQdFBK5qEkrDmBydgMJRbbsJk6dt1+u/+ozbipnE+X+4GemI=
X-Gm-Gg: ASbGnctGRJ1Li8aLC45AeSUdkCRPM+rP7yByCxDaNEsTLQA6SKsw1WqN0TGMVT8BgWC
	cwdC2HUdBnohfdjyT3GzTqpUrwnNYizxjOAglnIhOQDA/VbcFOtDWL2TKJgKQPTFo0kkHr01OT0
	ojJcrD74QW0m6ESA29z+pp1qo/gJOTlkeI4SfYAF/173BHgPqCAblRtlY=
X-Google-Smtp-Source: AGHT+IEF+h77GIjECx++dvbLtSxZcrgUv4As1K7LTL0wGasowDO/DAHV6mNaDlM5AhBuOyn8iTjUFe/V1V2STZoogO4=
X-Received: by 2002:a05:6512:3056:b0:545:4ca:d395 with SMTP id
 2adb3069b0e04-54d69b4d325mr703862e87.2.1744892947916; Thu, 17 Apr 2025
 05:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-dev-adp5589-fw-v2-0-3a799c3ed812@analog.com> <20250415-dev-adp5589-fw-v2-11-3a799c3ed812@analog.com>
In-Reply-To: <20250415-dev-adp5589-fw-v2-11-3a799c3ed812@analog.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 14:28:56 +0200
X-Gm-Features: ATxdqUEjG3srjaR1zbdJGVx0d1VvANk4hPBYsb6-d9hZ0St9SHLUzFXCFtyNaIE
Message-ID: <CAMRc=Meu8KK6s=DUs-4N9FwD8n1diPo6zvgzG_XKB_kg=7Pfuw@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] gpio: adp5585: support gpi events
To: nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:49=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:
>
> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> Add support for adding GPIs to the event FIFO. This is done by adding
> irq_chip support. Like this, one can use the input gpio_keys driver as a
> "frontend" device and input handler.
>
> As part of this change, we now implement .init_valid_mask() as we can't
> blindly consume all available pins as GPIOs (example: some pins can be
> used for forming a keymap matrix).
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


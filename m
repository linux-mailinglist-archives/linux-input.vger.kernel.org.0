Return-Path: <linux-input+bounces-15064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 025ECB996C9
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 12:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D67D8175C01
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 10:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C782A2DEA96;
	Wed, 24 Sep 2025 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mjk2ru3n"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBB42DC783
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 10:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709548; cv=none; b=s8KEAMUvCLe55BnUwhf5KY09s6fVmJDOx3AtQ0p3ktNgm7TAt89FU+ICZ9ENlxiJL4W4hBRoT9gYG0OlSETYrfsrZAgq40K0CI9dkmXurmMKFlwAtYEzKzUrsHlkiyixb/VWY1Dc6FxjITlPKB6HJ9zt48i0AhGhP6tYR0p46tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709548; c=relaxed/simple;
	bh=9tTQHdTnMEjzeTy9gNC8FHNqhXGpvcXXbYnm12wLkX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKU2TGl2wwlJWHOm0kAo+N0Pr99YskTVm5jivIdQIRfksB5Uw/Wu5R+d8DNIYSxN8d7qNNifcW0R6sJtGb129ijQwnz6J8Z1a2ky2dslu9ONxSNKZawxa9wCo5QhiUj+1ZudrFGGcRu62gPySL+wOZkMYKkW6Jn3XdbRHYbMM+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mjk2ru3n; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57dfd0b6cd7so4128521e87.0
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758709541; x=1759314341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdjFzTm1jV+mKm+4AQWxy96QqFUQYU3h21wLWV5Vfxw=;
        b=Mjk2ru3nfgPuCECLTuPGbIYKiw1EeoaNdgoiDY5DYHBxXjeQcCJ3g46IISsoDsyzbr
         6LklLxgCjUkaNZnuFpVTN2pUQR5K9SENObd5E1HxxC3qP3QeBszD3M6PGp2cAmh/j7T/
         JAAvedQrbOKmOHATIM6eBW0qgu+2y3NhIyHmPDYHKPgHV4JXLs6t3BhmW5gkhjV9DI9j
         +F7JjocxTZADCYKvtcPgsZeI9pcovXCPlDDcvrlMescFcgJdKfgzUbEBhOPrUDH5tysF
         7lb0SsbzJgfkvJbdSWVyJW/6akPNpAHX9agtjsvTYDHGNsOdrzhXKBMRtl4aQrgS9DEB
         zbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709541; x=1759314341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdjFzTm1jV+mKm+4AQWxy96QqFUQYU3h21wLWV5Vfxw=;
        b=OIRXijhTGN8VDljHJy8H8hXiuPQYf/0z8DP8ywpZTC6f74I5We3//vM4CaJZDFa0/v
         OQ3lKBOKpd0JvIflj+V7zuu77aQ4ftlCvxYpyQ+IsEUkUi2UU8vCrfJx4los/n9cTato
         /cEBKsUwzOc7dVmOvxaR63R2g/5ZjLLAjbf3U2l22bhl/7b79IVZNa7Z6pRIqwoN3can
         /fYv6jNC81vS69ZL4IoYJRSgAc2d7BJ2c1b88ja0WvmNbiVO1yNVBduqS+9/ClVCdy/O
         90AiP7k+5DRWY4f6OpKK8IFmjQlRP77f61CchugdA1/Dr/e2kNo4K7VnwY+NtscRA5Ts
         j6uA==
X-Forwarded-Encrypted: i=1; AJvYcCUuKMwWKtpB+4ezhasRDUZ3gURpE0ySU8PDlV8iVckeORbrAX8BRN2rNWnyFh90l1NizpclaL6PrujXxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI3TzG/tcUt6zfVj0AK8zWCLgZfurMjIOHRWenS7AS8To2DWem
	UYORrAb/P4lv6PNVqxczMubdNS9Yyu/J2o4myzQQl0O3Ki0w10b/miDXWGsT3vOpUlyg5pqzmFD
	S0AAguFYmH34mQ55KjQICgVIS5sBL2+goWBk2TfdOMg==
X-Gm-Gg: ASbGncvGiJYPur3utjb27i93MlunZXQmYohuFHdZfDTJS5UjC6nYmKIzl3uavhpLqow
	yCOoW7e32yS40BOULvR1bpGMNYgcBR7GWA8b0pzS0lJvsPMkY81FC20Q25FqRYLFILrnni4Jzsh
	n3Ii0fYxhlexsfZsqInlC7TFPfCdbWagopYkdzI6JQ02HMsGz+tT+Ef6GH5gRhK4RaSDsnCR0lW
	NZf9Ek=
X-Google-Smtp-Source: AGHT+IFImbpSnkKTmdYZWq2y32wIgPtsOBYgZADyrCIQdkdei+4Xzcd+hFLfmCRQz+/C6K3QYTGKGbeRQIa0uVpBpPY=
X-Received: by 2002:a05:6512:2398:b0:576:dc00:37cc with SMTP id
 2adb3069b0e04-580727044eemr2043332e87.34.1758709541266; Wed, 24 Sep 2025
 03:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924064905.276174-1-wei.liu@oss.qualcomm.com>
In-Reply-To: <20250924064905.276174-1-wei.liu@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Sep 2025 12:25:29 +0200
X-Gm-Features: AS18NWDhFZXcWlgI3iR1wo9nuYptBt7TRZXg-S0z3gK7su7ZFxZUkhzkwnEhO0Q
Message-ID: <CACRpkdZ49_mo0AN78ri4WTt+V2gNdFOTgxzgfXw+3vd2rNNiJw@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio-keys - fix misleading GPIO number
To: Wei <wei.liu@oss.qualcomm.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gatien.chevallier@foss.st.com, 
	namcao@linutronix.de, zhiqiang.tu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 8:49=E2=80=AFAM Wei <wei.liu@oss.qualcomm.com> wrot=
e:

> From: Wei Liu <wei.liu@oss.qualcomm.com>
>
> The error log prints button->gpio, which is unset and default to 0
> in non-legacy configurations, leading to misleading messages.
>
> Use desc_to_gpio() to report the actual global GPIO number.
>
> Signed-off-by: Wei Liu <wei.liu@oss.qualcomm.com>
> ---
>  drivers/input/keyboard/gpio_keys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/=
gpio_keys.c
> index f9db86da0818..243295a3ea1d 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -584,7 +584,7 @@ static int gpio_keys_setup_key(struct platform_device=
 *pdev,
>                                 error =3D irq;
>                                 dev_err_probe(dev, error,
>                                               "Unable to get irq number f=
or GPIO %d\n",
> -                                             button->gpio);
> +                                             desc_to_gpio(bdata->gpiod))=
;

That's technically a legacy interface.

Can we just not mention the GPIO number?

The only thing that would actually make sense in this kind
of errors is if we add some new interface like:

const char * get_gpiod_debug_string(gpiod);

that can output the chip and line number from the core.

Yours,
Linus Walleij


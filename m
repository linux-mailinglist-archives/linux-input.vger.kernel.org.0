Return-Path: <linux-input+bounces-5569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07888951FA1
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 18:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B88EE1F22915
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 16:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B78A1B9B30;
	Wed, 14 Aug 2024 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYd9KDXL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AAB1B9B2D;
	Wed, 14 Aug 2024 16:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652283; cv=none; b=FzSws/Z96Hn6X4DdIH5mRLd2gvEDxeLUj2MrykC0Bwn5O4GagdSgqjGlsC1SwLSzHNGQZSFnvh13eCHFKhY4sBbkjYJbVJCsLd9oGKz1O/8fhS9ljb8mHoH/GOWMhUI/uOVnX2WsDD+aqOFkAJ5VnJBu0/dg5WmqOKwojFKK8+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652283; c=relaxed/simple;
	bh=qjGHmCCT3n7na7guZ53a4L38VNclwcsnw+vHrgqGSVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7TfT83aKW/coIMxkjwC9fPpDGjMnhKR0HYiiFXtiv6/RlYiNIAK4wZha7q2W59V1QjyBcnvc7Q1aJA08PHWlRB+wwVbd4K1DaQ7vVo0ix1jZWtgt0VVetT6bdVYyEBG7/lk2r/BdXx8gBTxxsc3dmjD+khVymI/NNf+Piv7I8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYd9KDXL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efd530a4eso52958e87.0;
        Wed, 14 Aug 2024 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723652279; x=1724257079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6GhjpSzNcKT1K05L2BbnSGw53j/7mRIROTvKsTi+mM=;
        b=fYd9KDXLbf5RUw038Snw82hBUuiiW6L+NHsSEFqaSNTZo2YayPd44HC2wi0bxCyRSw
         1V6Kc4lBHELwE3fL+wAEVoE9vBobhJ7AsbmTpt5WWIv6Pbb96Cw/pojwOXaVZ3Pm/Eyo
         3+H2zrV+9WybYOd9FeWnLlHWKTlkjzuznyz7yrWLDBD+HIp2k7A37cU0tewDBYZMRwfx
         Hqrk28IoGz7hUKYgyvdZXbkvo6jJNFN2r9DWCDDrQXOqMWvbGfVQl2w070HFwhCQCqbR
         hUrfhvS2f/lArZR4qoYFVWQRzli2pgHDGATVCriKwDvwWwVPz2cVKNtAzNXKCYY8F7Re
         j3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723652279; x=1724257079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6GhjpSzNcKT1K05L2BbnSGw53j/7mRIROTvKsTi+mM=;
        b=m+Q9rLmdUgxYoATuOPN2c1O34KEiJZrImI9QvYdM5wkVPP2EB4nAMN2HZ/rsM5Vhcm
         1p0kviLLOHFhcZpCXEeixnwICGpTwy28z00BGJyUyvOqSS0qvNwKHdNXa29roTXjrTn8
         SCCZtqpihW0+yOjXVmc0QXqpuolBt1Qiw3YwenvcQV8qlsSv/LGrgQkM+zPji+qZvdlr
         SFdakkAYDbOi1NtD7lylXdlsi1B5AQbsetREDl5YoHeG2rvW0WTVMkm4JjECkIuQsDvb
         nydAE/e6AfLzkZMdU0MPOxg9G0ikigzxXP+ga6a9nTtst7qc4oP8UPnHVLsmIIHlOO/C
         2t5g==
X-Forwarded-Encrypted: i=1; AJvYcCV4leHYqTbvdrq7U6+Q3IJp/CKEvSjw2PFO1US+PAE3325sFkg/5nb/bq6tzR3jH6E3yDlA5xh4nWJznMZN/DXhLfJgfIz9Frw6hvEGjX2Pu646+JL36QVwd7zWIhXoORvTwLAiKIX3oyY=
X-Gm-Message-State: AOJu0YzNR67HQS0ka1BjubO1QpR9z3zy3QsqqI1pAsD6ApRpAGtz+bW/
	SZ73qAADyjmKKJ3Xt635ucBl/ZxH/RcnfX9GeD+Le0jYCl6z3hE1KDhz9x/emlm1htnGWbBMx5j
	ZBbRRPKtjfprkI9ZQwLQ6zA3/eqo=
X-Google-Smtp-Source: AGHT+IFTt6dc7a7BKyJuOH6ExjMRSwVGbfZGPoo6MzUgnA0WpOCitBL+7TAGEBnj4WjYAyHszWBxwwuUiAKQSrJgBE4=
X-Received: by 2002:a05:6512:33cf:b0:52e:76d5:9504 with SMTP id
 2adb3069b0e04-532eda6728dmr2025990e87.3.1723652279165; Wed, 14 Aug 2024
 09:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811130906.3682-1-max@enpas.org>
In-Reply-To: <20240811130906.3682-1-max@enpas.org>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Wed, 14 Aug 2024 09:17:46 -0700
Message-ID: <CAEc3jaBELzAnffyE4mzQeNAiH-F5AhQqMGvMKoL6yu4naHBo+w@mail.gmail.com>
Subject: Re: [PATCH v2] hid-playstation: DS4: Update rumble and lightbar together
To: Max Staudt <max@enpas.org>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathaniel.lewis@sony.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Max,

That looks like a reasonable workaround. I think it would be fine to
add. We will try to support that with Android as well.

Thanks,
Roderick

On Sun, Aug 11, 2024 at 6:15=E2=80=AFAM Max Staudt <max@enpas.org> wrote:
>
> Some 3rd party gamepads expect updates to rumble and lightbar together,
> and setting one may cancel the other.
>
> Let's maximise compatibility by always sending rumble and lightbar
> updates together, even when only one has been scheduled.
>
> Further background reading:
>
> - Apparently the PS4 always sends rumble and lightbar updates together:
>
>   https://eleccelerator.com/wiki/index.php?title=3DDualShock_4#0x11_2
>
> - 3rd party gamepads may not implement lightbar_blink, and may simply
>   ignore updates with 0x07 set, according to:
>
>   https://github.com/Ryochan7/DS4Windows/pull/1839
> ---
> Changes in v1 -> v2:
>  - Simplified the code, comment, and commit message.
> ---
>  drivers/hid/hid-playstation.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index e7c309cfe3a0..0d90d7ee693c 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -2143,6 +2143,26 @@ static void dualshock4_output_worker(struct work_s=
truct *work)
>
>         spin_lock_irqsave(&ds4->base.lock, flags);
>
> +       /*
> +        * Some 3rd party gamepads expect updates to rumble and lightbar
> +        * together, and setting one may cancel the other.
> +        *
> +        * Let's maximise compatibility by always sending rumble and ligh=
tbar
> +        * updates together, even when only one has been scheduled, resul=
ting
> +        * in:
> +        *
> +        *   ds4->valid_flag0 >=3D 0x03
> +        *
> +        * Hopefully this will maximise compatibility with third-party pa=
ds.
> +        *
> +        * Any further update bits, such as 0x04 for lightbar blinking, w=
ill
> +        * be or'd on top of this like before.
> +        */
> +       if (ds4->update_rumble || ds4->update_lightbar) {
> +               ds4->update_rumble =3D true; /* 0x01 */
> +               ds4->update_lightbar =3D true; /* 0x02 */
> +       }
> +
>         if (ds4->update_rumble) {
>                 /* Select classic rumble style haptics and enable it. */
>                 common->valid_flag0 |=3D DS4_OUTPUT_VALID_FLAG0_MOTOR;
> --
> 2.39.2
>
>


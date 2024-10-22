Return-Path: <linux-input+bounces-7603-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0821D9A9814
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 06:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A79721F2140D
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 04:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363AC824AF;
	Tue, 22 Oct 2024 04:57:32 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF781C27;
	Tue, 22 Oct 2024 04:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729573052; cv=none; b=eLSTRh6li8ORIq1XUH0hs9Vm7NOnBLxd4BnYIhSFpME1h2u11V9nF3GkGqNsTGbBaGb6B4RaSBz8wXctfQTIIhWGEZvFEvBvjjGLIISs5FyRdMDylI0YwzjrERDjdyYsUxaMm3BYNZMhptG/X2u8pen6almk5LqUOiMMpX11y38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729573052; c=relaxed/simple;
	bh=5bT90VHYpTm313NrIpd4fKVtZ40irZW3FExZLtrjQQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRXEIygmfXSHtQ6A5iQAXl+M5Qm3thCmtEE0PehwFRLPg0LhY4WUnjrdBcluCANQn4yU4O5Ulmm3h8PnsC3wGezJ1/Sd+R4tW/Jz52B53Shv2/785OFU6iqvKh3OT3Gobcbs3GZU/YRoHKdBvQoAz04ZZT4lPUfjF+ctElO0hj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb3110b964so45334341fa.1;
        Mon, 21 Oct 2024 21:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729573047; x=1730177847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MtKhiSbi539gpYrHXAAkHxczz0yx9HoWEP1SfArti/I=;
        b=DbY0rJFc+5xojeD/fzAq7A66qPjvAXYn5GVg+fJzL8i0NXnxaj6tC/QiuazlkvzmdT
         36nOaaaJbXzdNAP3OvBo8mNeZvcX2XQrqMrjmvJMrYuUDAeCkP7JkBzuEEeWjHLzsC05
         wLR0bEaJSEfRi8NTPWffFuTAy9RkaGBKS59B3pgqdwbZ6GotzUNX75HBoQxNuBXwT+2I
         97Uv3otYAL/+4AQyRcOhKF/aBbq3GEfR+jww0ErcVlJ0q4Up+ZiHP8Xa/GwxSf4Ps0WX
         5bpQyuIWKJZOLYawx4fcDQZY0V+FZjBBBC4e3pS+GJ3zTi+OaPoiloZjfp4qMOTukIhW
         PbRg==
X-Forwarded-Encrypted: i=1; AJvYcCVqqX8iXR7eCe5Ll49N2lJCrR2DvdS3rvWyOAsNpUXE6bzA4nil7JPfnrjNebfeUpQYrPdHFuGqdB93MnOM@vger.kernel.org, AJvYcCWTxM7cL5Tq+G0S+6mO4gowS51a2JEqlHVREkBdjUOyt1EP6PYqwdT2+26KA/W81BVX0bBAYWHZXE13XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSnWgU/ZCKy0+Rz7/O03sy2Ixsa1Yy1W8c6yA1e+WDuRvloPcc
	h0PqiFSWC05MlqWi9CMpkAMy5aBJxEDTUEyBKy3lg5f1p7+e5WNb2wpREL0v
X-Google-Smtp-Source: AGHT+IEYVfSQ312S0qihhADV8AtGmuna+qr+naVmvQGIDSeI069I8mbZzavdy4noinZSxNKZuilVeg==
X-Received: by 2002:a2e:4e02:0:b0:2fb:2f7c:28e0 with SMTP id 38308e7fff4ca-2fb82ea1cd1mr49145971fa.18.1729573047038;
        Mon, 21 Oct 2024 21:57:27 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad907a2sm6781201fa.71.2024.10.21.21.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 21:57:26 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso52404041fa.0;
        Mon, 21 Oct 2024 21:57:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWg/oabaLfP8PbtLXgeJ8LZ3MEPwh49DjQY5Kyp30rEh4mJahK/jBcjSR6Gs9qCzssurjpTOoYZfwsbERq4@vger.kernel.org, AJvYcCXviGlcLcArDajIutkHEmD7J3SvMCOp/E9oqL/EHGcpo+VB8N17VknXISYNri61i0QMKhoEVmRbM+qwLg==@vger.kernel.org
X-Received: by 2002:a05:651c:551:b0:2fa:d4ef:f222 with SMTP id
 38308e7fff4ca-2fb8320b662mr54455541fa.38.1729573045773; Mon, 21 Oct 2024
 21:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com> <20241021-input_automate_of_node_put-v3-2-cc73f636e1bc@gmail.com>
In-Reply-To: <20241021-input_automate_of_node_put-v3-2-cc73f636e1bc@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 22 Oct 2024 12:57:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v66b60moJjOP9Fo6NRAC=WA3fTBd-EJ0JifTsgz2Kocq0A@mail.gmail.com>
Message-ID: <CAGb2v66b60moJjOP9Fo6NRAC=WA3fTBd-EJ0JifTsgz2Kocq0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Input: sparcspkr - use cleanup facility for device_node
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans de Goede <hdegoede@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 4:28=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Use the 'free(device_node)' macro to simplify the code by automatically
> freeing the device node, which removes the need for explicit calls to
> 'of_node_put()'.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Not sure why I received this patch, but given my recent experience
with the cleanup stuff,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/input/misc/sparcspkr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspk=
r.c
> index e484d79b5597..8d7303fc13bc 100644
> --- a/drivers/input/misc/sparcspkr.c
> +++ b/drivers/input/misc/sparcspkr.c
> @@ -182,7 +182,6 @@ static int bbc_beep_probe(struct platform_device *op)
>  {
>         struct sparcspkr_state *state;
>         struct bbc_beep_info *info;
> -       struct device_node *dp;
>         int err;
>
>         state =3D devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
> @@ -193,13 +192,12 @@ static int bbc_beep_probe(struct platform_device *o=
p)
>         state->event =3D bbc_spkr_event;
>         spin_lock_init(&state->lock);
>
> -       dp =3D of_find_node_by_path("/");
> +       struct device_node *dp __free(device_node) =3D of_find_node_by_pa=
th("/");
>         if (!dp)
>                 return -ENODEV;
>
>         info =3D &state->u.bbc;
>         info->clock_freq =3D of_getintprop_default(dp, "clock-frequency",=
 0);
> -       of_node_put(dp);
>         if (!info->clock_freq)
>                 return -ENODEV;
>
>
> --
> 2.43.0
>


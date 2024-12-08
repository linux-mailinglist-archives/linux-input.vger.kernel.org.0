Return-Path: <linux-input+bounces-8439-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0D29E879F
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 21:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8165B1646A5
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 20:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96E337160;
	Sun,  8 Dec 2024 20:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ngelscBf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073354728
	for <linux-input@vger.kernel.org>; Sun,  8 Dec 2024 20:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733688572; cv=none; b=g0aGdTO/vXt/an2PSDLmxbCeRHPtSCPpJDnaEEOF3j61OhyrzLoA8UvDbxZsfNhJQQZxUvzKPLlzEavNIPBpDKN1b93eHWUAPLzuvD5vwe0A+TE0mrxZQmFUXY+I5MOjd+miVdEeQPgWk3qR9xd6rFPEgA4Rapmx7CxKhAwkuUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733688572; c=relaxed/simple;
	bh=tDolt7CdTcOAuj3WjqpFgrueMTWHOLF8Meouj6r0xp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIh92GhHkHz8hjOPaJ13CD6hGP7qc5tD6dJE5joUyFxK49dCA37NIZKYqULTECU+jEn9PIXEVA46nz6LgMov3kZCe/31tLkCY/FPZ1OJQS4aHtiJ7oD8+WtNqvGgcYEO1vgBZh6+Aa9HQtwmqYmJ5yRWf0SjUcCEg0iEzfKvR1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ngelscBf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-724d23df764so3486512b3a.1
        for <linux-input@vger.kernel.org>; Sun, 08 Dec 2024 12:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733688570; x=1734293370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bLhwkBOgmbpT4U5gL2AOUVQiIkPnhXXcl0f3hXuuoIA=;
        b=ngelscBfuKU56gJx8DjdNW8M4GrUQD1xfCTS+ZfcxRTEsVFyWArzATGLk79rlBEhOL
         buUDYuxn/UxeIbYUgnO/Oa1Oxb2+NmTPjZKiFwONBE/6G9NoW62YQlS7XGotin0UCTLw
         /wKArIr+1lQiouCUrlDZqb2pfurKtLDqeVGzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733688570; x=1734293370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLhwkBOgmbpT4U5gL2AOUVQiIkPnhXXcl0f3hXuuoIA=;
        b=lV5EFm+DS+rXMcUCG0SJ9tlyiruJf5X9jcP0n/VMb4rEKSW78XHW9dwoE273+Rpkvr
         4j0YOPHpv9nEqtSbzj0Ax1s6cqauj0cBHSPokgUwA7rSHNMtaZSE/T9mpvAtbLALoxu4
         qlG2DrJvEUdfPZRuZaZ0hkp//SaYXNikMqXvajCWZ/UCvpnBJwHgvFvq8gshHZf+bXhe
         mWd+CyIda63N92GKTF3k79bpehqB2D7EZ3z0KFMH5qupAG1aS3z6k8ae3pF8PjVyc+7T
         ZFgGi4bt2EKAItQiCH7gEpzsMXGLbNk7NvJeMgh2drW3PrYHcshp+VFnG6SMJEFWt2pc
         AG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLZK+1Ywok/w1MM1KkG2RKvA8nZ0tjSTC93r5opn9HBDtWRJ/wNeg+0vAHHXh81T8ascm8zbkgLsyvGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJ/uLZHudbmyXIjwV9Hu7tGaXA9Pn4iB3nTnPMUzWcTbyZRp+
	4kIbgAMcRgBq0evEMnKA7h/myfyq/s57UMtbavW8QFKUhML+PcrpazBTJGU+30qJdMZw+tMWxdw
	=
X-Gm-Gg: ASbGncvMqVAK0Q3wnnMNdUUYYf5+9MbXceISd7YN+LrIzkZNR16a97pH9U+S4q370td
	rsj4oFihhHluCQzScyUv0TZbOlSYAMxP8bpcN5WO0KvI5JUI0dVkDGeO5A9YqhjSYJjk3h+Ud8Z
	5s5Hi3BATblCEvTpCx2egzFzoFrVNsc81yLmoaJ80s5LFGhJlitG2GnZadNwbFWoAQiZRjGyD4r
	ewE8jISHNrbYfoJqvkSwsBUzDOndELAvrt6t3l/XkQJL8ZcCfVjPjNOL5xNHt/FZS5ODK1Gj6k6
	mL5rd6MkFVm8rQs4
X-Google-Smtp-Source: AGHT+IG2L23YGy/54mw6LEVsgVFv3C3roWuuDP+0esCnlifkl6tl5gD2SZJcmB7JLDtozHJkc9d9Dw==
X-Received: by 2002:a05:6a00:ae16:b0:725:db34:6a7d with SMTP id d2e1a72fcca58-725db346d85mr7190193b3a.23.1733688569916;
        Sun, 08 Dec 2024 12:09:29 -0800 (PST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29eb17esm6160909b3a.55.2024.12.08.12.09.29
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 12:09:29 -0800 (PST)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215b13e9ccbso34209975ad.0
        for <linux-input@vger.kernel.org>; Sun, 08 Dec 2024 12:09:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVRGFSDrTmwc2WYE3/qTNYOOnV1XtSZicpATl2APavnlZUgjDP8yjC0KQ+ucIeEDwUqOoF6zrM5IvciQ==@vger.kernel.org
X-Received: by 2002:a17:902:fc4d:b0:216:3dc5:1240 with SMTP id
 d9443c01a7336-2163dc515d4mr53882835ad.45.1733688568741; Sun, 08 Dec 2024
 12:09:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-fix-hid-sensor-v1-1-9b789f39c220@chromium.org> <20241208163851.41c47c3f@jic23-huawei>
In-Reply-To: <20241208163851.41c47c3f@jic23-huawei>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 8 Dec 2024 21:09:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCsD2gGBPVaFMU4uhtpWf3dUr4-MA5MpcjZRcLMgBmtjZg@mail.gmail.com>
X-Gm-Features: AZHOrDljjJs2pi977K4dUh9IOYsTVktxzHjXF2FzE_KTvdtIKS-5f-wvx8t2_EE
Message-ID: <CANiDSCsD2gGBPVaFMU4uhtpWf3dUr4-MA5MpcjZRcLMgBmtjZg@mail.gmail.com>
Subject: Re: [PATCH] iio: hid-sensor-prox: Merge information from different channels
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-input@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan


On Sun, 8 Dec 2024 at 17:39, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Thu, 05 Dec 2024 12:59:20 +0000
> Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> > The device only provides a single scale, frequency and hysteresis for
> > all the channels. Fix the info_mask_* to match the reality of the
> > device.
> >
> > Without this patch:
> > in_attention_scale
> > in_attention_hysteresis
> > in_attention_input
> > in_attention_offset
> > in_attention_sampling_frequency
> > in_proximity_scale
> > in_proximity_sampling_frequency
> > in_proximity_offset
> > in_proximity0_raw
> > in_proximity_hysteresis
> >
> > With this patch:
> > hysteresis
> > scale
> > sampling_frequency
> > in_attention_input
> > in_attention_offset
> > in_proximity0_offset
> > in_proximity0_raw
> >
> > Fixes: 596ef5cf654b ("iio: hid-sensor-prox: Add support for more channels")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> whilst perhaps not ideal use of the ABI, what is there today is not wrong
> as such.  If the ABI above was all introduce in the recent patch I might
> be fine adjusting it as you suggestion. However it wasn't, in_proximity_scale
> has been there a long time so this would be an ABI change.
> Those are generally only ok if there is a bug.
>
> Drivers are always allowed to provide finer granularity than necessary
> so in this case I don't see this as a bug.

Is it ok that changing the attention_sampling frequency the
proximity_sampling frequency changes as well?
(Just asking for my own education, not complaining :) )

Also, what about ?:
in_attention_scale
in_attention_hysteresis
in_attention_input
in_attention_offset
in_attention_sampling_frequency
in_proximity0_scale
in_proximity0_sampling_frequency
in_proximity0_offset
in_proximity0_raw
in_proximity0_hysteresis

Would that be acceptable? I think that if we are giving the false
impression that every sampling frequency is independent we should go
all the way in. WDYT?

Thanks!

ps: this patch is in the queue in case you missed it
https://lore.kernel.org/linux-iio/20241122-fix-processed-v2-1-b9f606d3b519@chromium.org/

That one is a real fix for the driver :)

>
> Jonathan
>
>
> > ---
> >  drivers/iio/light/hid-sensor-prox.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
> > index e8e7b2999b4c..f21d2da4c7f9 100644
> > --- a/drivers/iio/light/hid-sensor-prox.c
> > +++ b/drivers/iio/light/hid-sensor-prox.c
> > @@ -49,9 +49,11 @@ static const u32 prox_sensitivity_addresses[] = {
> >  #define PROX_CHANNEL(_is_proximity, _channel) \
> >       {\
> >               .type = _is_proximity ? IIO_PROXIMITY : IIO_ATTENTION,\
> > -             .info_mask_separate = _is_proximity ? BIT(IIO_CHAN_INFO_RAW) :\
> > -                                   BIT(IIO_CHAN_INFO_PROCESSED),\
> > -             .info_mask_shared_by_type = BIT(IIO_CHAN_INFO_OFFSET) |\
> > +             .info_mask_separate = \
> > +             (_is_proximity ? BIT(IIO_CHAN_INFO_RAW) :\
> > +                             BIT(IIO_CHAN_INFO_PROCESSED)) |\
> > +             BIT(IIO_CHAN_INFO_OFFSET),\
> > +             .info_mask_shared_by_all = \
> >               BIT(IIO_CHAN_INFO_SCALE) |\
> >               BIT(IIO_CHAN_INFO_SAMP_FREQ) |\
> >               BIT(IIO_CHAN_INFO_HYSTERESIS),\
> >
> > ---
> > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > change-id: 20241203-fix-hid-sensor-62e1979ecd03
> >
> > Best regards,
>


-- 
Ricardo Ribalda


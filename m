Return-Path: <linux-input+bounces-9145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF3CA0A232
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 10:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B60887A4393
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 09:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067E51862BB;
	Sat, 11 Jan 2025 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y8KakJ8h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AF4185B5F
	for <linux-input@vger.kernel.org>; Sat, 11 Jan 2025 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736587064; cv=none; b=cCMN9irur3BltBlZKGA4tbQt3D99G4bOOHcbWPQX/uDg3a4b3ld3Xs1P9TQgnKIE1Ly2tsy7C0eK5pxWawNZdKXlW/R9DTaNnujbDCxCRuOiN29oKHR8cdUjKTQTBxqmeHfAJHXR4blGzCY9FnirySpzC1V+VTvOs/gcbtp/fbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736587064; c=relaxed/simple;
	bh=kSz2ozfM+GDCUl2noTxMIW/0mQvo0ucpjYOvKWX2YDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIrBE4vVRl6S2HAVG3vIH/VdD5LeJKH4dPhoJF2ASqxxJ9L1oY27uJ4SaUK5pUPc4jMD6D/dm7EgfHIcEEJTdJqSKOey2hiM5b0BQDBcWNlU+EvsvVELWvY1BqB7hgE6xpVpA/YRlafVHxZ4TiIWnwnbfSL9wo/HJy8cFyfRKwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y8KakJ8h; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401b7f7141so2447504e87.1
        for <linux-input@vger.kernel.org>; Sat, 11 Jan 2025 01:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736587061; x=1737191861; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tisWqy82G+U2up76UdxFU1XP7JkgoC4pn3Hzy6vKW3s=;
        b=Y8KakJ8h1TSIc4IUgk5KUW1LguFo15h3qVI+acVBZ9QG2RRr2Mv2HxGgkuLyLc12mi
         Std3H8lylzcAzBOKvHM2PeAKYgXSeVRAZuPare3NzMqFL5Ems04QCXgvbthUyA5zafBz
         MlK8xDNhS5swHkXn1cPfvW6mUyDDxZwBnVX3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736587061; x=1737191861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tisWqy82G+U2up76UdxFU1XP7JkgoC4pn3Hzy6vKW3s=;
        b=lLKVLDmvkiyd/0mP5uu4YxRCvc7YSZv4chsq5vIZeVedi3PO7Gr9Q6IAGlznJrG3Gf
         C72PITbLC5RZ6sGZXgCCoD20IOpoAc2PVw0IegaMvL+rwkz48PufavJ9r6VgAz0v3NAa
         Cx6iWr1IUz1V8dncZ1vCZelWfkN4sGhpDUlt7F6gny8SN2NQjyJZY/U3FLTaBC9PROcP
         QzpKHqil01QoZ/GMbFAvE3AIuevqknXyyicv1bI9vSVHZytCdbr6dxsNfJcgs59mnRsk
         B3kB8DITgx3TK6P9Lso0DRyjDEuiJbfODeDU/ZOsHHBnmKepxLiC6WaMd8Y01qYnufG2
         6E1A==
X-Forwarded-Encrypted: i=1; AJvYcCWGYY7KCMm2pYtc+3FDknyaZwSP6bOrXnxBa5pVxOYKxVTk18+CXhGfOrHGgyf0vlUDOmpDMs30U/dnBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6GyMDVTEpafw+5cDbxVAq5vjDKyd09Dr8K38j3Rmlde5q/Vk9
	eeiDuiPpV6g0oZUAQOj82bUygVexREQm2ln6xqRN8U5Duyqlc64CInUpU/S7ZTAbFmm4ik4C3lY
	=
X-Gm-Gg: ASbGncvOmId5AzBjHCLGHwHcveM36l/g8BHZbqZFaXpJ78BIFDxloYES+UHXTattRT4
	s+6lZiQ6MwfTu2T8igyYtdFlE2oZrwjlKVjiwmSgomtVqNFYrLkb5ki1sT6JTrsYNw0fhc/9Wkt
	FfJVOj3zxrJPl1cz3mn6BfJRipv+8ltzIX7DYSHmD6e5UXHNjm4PeikG4+gpm8WMWAPFWNP9bNn
	3xGf4pi07GbCHvM6UIXs28+hF4QWC+Hf4rjOysVYtikSwaKuQ/pS6Cp7v+j3EnM8VXBWZjrKOKa
	i6eSsmWyQZx90+yfvzVREHA=
X-Google-Smtp-Source: AGHT+IF183+TrkUliQwrlzoQZujcux65MQOGoCS3UsQcC8r6NTti78QfAnVGzraQ4IGddZAOMA5S2A==
X-Received: by 2002:a05:6512:3994:b0:542:29a6:a063 with SMTP id 2adb3069b0e04-542847f9de7mr4891874e87.43.1736587060913;
        Sat, 11 Jan 2025 01:17:40 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec3314sm779903e87.223.2025.01.11.01.17.39
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2025 01:17:40 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-305d840926fso20690531fa.2
        for <linux-input@vger.kernel.org>; Sat, 11 Jan 2025 01:17:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXudCbT3Xtemoohofi6KlsN3fp2qgBXSlGrOx60/1PiTSax9Zn5QBrm0UPT1FSNmXY0PgCKpNZrBvQ0rw==@vger.kernel.org
X-Received: by 2002:a05:6512:3994:b0:542:29a6:a063 with SMTP id
 2adb3069b0e04-542847f9de7mr4891846e87.43.1736587059313; Sat, 11 Jan 2025
 01:17:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-fix-hid-sensor-v2-1-ff8c1959ec4a@chromium.org> <20241219171718.2af17d6d@jic23-huawei>
In-Reply-To: <20241219171718.2af17d6d@jic23-huawei>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 10:17:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCvkKX68UqSuKiGiys8nwm5BX-FbKmHPtxJK=Hh=B4RqZQ@mail.gmail.com>
X-Gm-Features: AbW1kvb3kmA3hlXu6jsQWY_mgIugqbft_Rz5Xg5Vgrmik685pNeK1ZCM9EUmt1o
Message-ID: <CANiDSCvkKX68UqSuKiGiys8nwm5BX-FbKmHPtxJK=Hh=B4RqZQ@mail.gmail.com>
Subject: Re: [PATCH v2] iio: hid-sensor-prox: Split difference from multiple channels
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-input@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan

Happy new year!

Friendly ping about this patch so we can change the ABI before the
kernel release happens

On Thu, 19 Dec 2024 at 18:17, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Mon, 16 Dec 2024 10:05:53 +0000
> Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> > When the driver was originally created, it was decided that
> > sampling_frequency and hysteresis would be shared_per_type instead
> > of shared_by_all (even though it is internally shared by all). Eg:
> > in_proximity_raw
> > in_proximity_sampling_frequency
> >
> > When we introduced support for more channels, we continued with
> > shared_by_type which. Eg:
> > in_proximity0_raw
> > in_proximity1_raw
> > in_proximity_sampling_frequency
> > in_attention_raw
> > in_attention_sampling_frequency
> >
> > Ideally we should change to shared_by_all, but it is not an option,
> > because the current naming has been a stablished ABI by now. Luckily we
> > can use separate instead. That will be more consistent:
> > in_proximity0_raw
> > in_proximity0_sampling_frequency
> > in_proximity1_raw
> > in_proximity1_sampling_frequency
> > in_attention_raw
> > in_attention_sampling_frequency
> >
> > Fixes: 596ef5cf654b ("iio: hid-sensor-prox: Add support for more channels")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I got lost somewhere in the discussion.  This is still an ABI change compared
> to original interface at the top (which is the one that has been there
> quite some time).
>
> However we already had to make one of those to add the index that wasn't there
> for _raw. (I'd missed that in earlier discussion - thanks for laying out the
> steps here!)  Srinivas, Jiri, do you think we are better off just assuming users
> of this will be using a library that correctly deals with sharing and just
> jump to
> in_proximity0_raw
> in_proximity1_raw
> in_attention_raw
> (should have indexed that but it may never matter) and
> sampling_frequency
>
> Which is what I think Ricardo originally asked.
>
> Do we have any guarantee the sampling_frequency will be shared across the
> sensor channels?  It may be the most common situation but I don't want to
> wall us into a corner if it turns out someone runs separate sensors at
> different rates (no particularly reason they should be one type of sensor
> so this might make sense).  If we don't have that guarantee
> then this patch is fine as far as I'm concerned.
>
> Jonathan
>
>
>
> > ---
> > Changes in v2:
> > - Use separate
> > - Link to v1: https://lore.kernel.org/r/20241205-fix-hid-sensor-v1-1-9b789f39c220@chromium.org
> > ---
> >  drivers/iio/light/hid-sensor-prox.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
> > index c83acbd78275..71dcef3fbe57 100644
> > --- a/drivers/iio/light/hid-sensor-prox.c
> > +++ b/drivers/iio/light/hid-sensor-prox.c
> > @@ -49,9 +49,10 @@ static const u32 prox_sensitivity_addresses[] = {
> >  #define PROX_CHANNEL(_is_proximity, _channel) \
> >       {\
> >               .type = _is_proximity ? IIO_PROXIMITY : IIO_ATTENTION,\
> > -             .info_mask_separate = _is_proximity ? BIT(IIO_CHAN_INFO_RAW) :\
> > -                                   BIT(IIO_CHAN_INFO_PROCESSED),\
> > -             .info_mask_shared_by_type = BIT(IIO_CHAN_INFO_OFFSET) |\
> > +             .info_mask_separate = \
> > +             (_is_proximity ? BIT(IIO_CHAN_INFO_RAW) :\
> > +                             BIT(IIO_CHAN_INFO_PROCESSED)) |\
> > +             BIT(IIO_CHAN_INFO_OFFSET) |\
> >               BIT(IIO_CHAN_INFO_SCALE) |\
> >               BIT(IIO_CHAN_INFO_SAMP_FREQ) |\
> >               BIT(IIO_CHAN_INFO_HYSTERESIS),\
> >
> > ---
> > base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
> > change-id: 20241203-fix-hid-sensor-62e1979ecd03
> >
> > Best regards,
>


-- 
Ricardo Ribalda


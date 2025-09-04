Return-Path: <linux-input+bounces-14479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC6B43C07
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FB1F3BAB2F
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 12:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC632FC009;
	Thu,  4 Sep 2025 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXbzv+W2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47265464D;
	Thu,  4 Sep 2025 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990131; cv=none; b=mDc4R8mAKZIlRYDksP0Yqg3nXj+BSQ3EBavIp0H6m+KDj703I8KxR+v5YoKk0IKKkysjjpQ3XYGulK19/ewZpiKI0Fl2RY7SqxmXHkUlPg9fH5cwSkQ5qvf1JXROsYCWlqVWYAAgHTTnNbmVqWhcFBYVNrKCKy/AqONoRyYvxZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990131; c=relaxed/simple;
	bh=X4XQaMvtFiSI0o01k9Y+U2kGWuRSS1mgykufRyzX2Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+O1Uo2wS2kVLZLCecCsNe9MhByiLafmH/WF5Pm8kCyMwYWu/iY78DO8vOz+KiE+BZIdQuDDWlKBI5xLR+ky8mMBqrFlCMckNd47jIrbO2F3v28wn9j6KZI9WyUhaLLsM7GKNCnGIxmvVOb0Bbx5LjodEWMnmyTy0jgHFfsbI5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXbzv+W2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so1328543f8f.0;
        Thu, 04 Sep 2025 05:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756990128; x=1757594928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZVlyZjRKsXifjqY1UL5f20VbSu7xNc630lWHOD2+kc=;
        b=aXbzv+W2dYUYFJJrQ4io41Oh80Vdok1hgaIBFfMNkFyynIR6jEN2P6TSQ8v0UQSkjA
         XvDxqw19qjt3drCDNmk9G/KINRwXMUzED290wvKmwcrnyWJ7n3zCKFaOlRDEvJ/q0PLD
         tp1IDJ2Xum2zXJkvaaub/C3hu+KBuUQFH3E4efAU9NyMMDtL5S+/Mys2zbqDi+Fney+A
         bR+SGhxrcrpQaVn/d3bFavJBiLUJyNTBbINZGNXqn04S/TEFZVYPpAx6Vi/2RIA+uF6d
         IK/zBXCKHo/atJAo8FXmMhxQJYflGT6+di8Pq11m2IfKqJzJxv1hVr3tPd74/l6ZSE1e
         y6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756990128; x=1757594928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZVlyZjRKsXifjqY1UL5f20VbSu7xNc630lWHOD2+kc=;
        b=Polyn0fbKxDAXd8VMes1buHJwL9w0Vrlb0gW4anSmCdWcYIv69csxkHx5Nsqx+7heK
         j9YKnTcIPTpAmQT2DqiApoUnYEFyitne9JKrV+Fc/pKvjsXZJcewdwNeq/l8nqMZbaPD
         xI7eIPnSIYgpfiLUXLU3Z+3BMoetDa8B+rES0wWlBj8F+Owa3cWgmBcrSDCFqs7u15pI
         me3wTskg6ndiVWqu0E4cQBoUstypGqQ0gJNzcq02S288qN6FrBCdxVunuj8HcQgqZlnM
         9Q323VzciHAAivpTiiJJXnD2UJGQd4toDiRVr9LD6SQAPpcdbrmDT1KjmMKmAUFFWMe/
         Rh4Q==
X-Forwarded-Encrypted: i=1; AJvYcCULQoUtnzRHmAps6yJ5Ts6Q2Ja+tdaLgVF0wqqTL4iMyT9TjY/QiCYahpXPxLKDRuGFBymIhEpN6PA1Abn1@vger.kernel.org, AJvYcCV6dGxnbYR2Bvka0WUO4UDMpi+7BnBt+LNMDOFL0mrdfFx0tHzDJ8hzwTSqjAqOKS2mEk7VVArapgvH01w=@vger.kernel.org, AJvYcCWXwGJExayHwvvxSCzzu/THNH4slnyFCOukU17ZaOvb99YfjikEXOngbcIYY5kL3veqi1VXx4FhqC56@vger.kernel.org, AJvYcCXatUo1nuHR6hz6iyZwozuzz6vocvEx8jZA61K2d+AeA6hHP6pzmHc3xBhZN6GRWwOCuEl3741Uq9RXRCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7a9b2RNrI1mJnBQ8swzP4NM0dDq56DyaJmmITBdnM5IdqsHLC
	orCaCX7BXS4Gdae3VUu7D24eT3R8lpX0oKuqHIIQ0iKCaEqAivySkUnNqNQEkQ62SLyC4UMDBsV
	gqYoqglyhktuzBv/MOla5meVDydQOiKU=
X-Gm-Gg: ASbGnctUKB94+7WSeh9cr8l6DDHsJRKYREaXMAWz/AWoRot80HVeRbpX6BdVsGRL0hS
	jJy0pWylT8SF1ufNmYxHGgzu2T3PHCm+kZaEgqimH+6EcxLUZqeS/XgKVXoLNAtn/MEZDaOzjyL
	ekDW1F8WqAimPjzVe8ZsxJavJLKR0qbD48yi3Kzezazm+5k6u5S800Ean5PPB5IlEST+tVU+Ok0
	N9jlKWy/WPBZmFolQ7i35VAebPd0Q==
X-Google-Smtp-Source: AGHT+IHJgb5ZK3/x3D0k4RvP5eDU3ZpKPFmw0GCoXPu4nPhadRVrgI33bU76aO+Qn842wznMLbls7IyO86ZUoYmBKJY=
X-Received: by 2002:a05:6000:26d1:b0:3e0:b982:ca49 with SMTP id
 ffacd0b85a97d-3e0b982d0acmr2131607f8f.2.1756990127686; Thu, 04 Sep 2025
 05:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161947.109328-1-clamor95@gmail.com> <20250903161947.109328-2-clamor95@gmail.com>
 <75wc4lutipb7uszkqfuakjl7iqsygjif4df5phosifkgi3serc@t75jpefbbbcs>
In-Reply-To: <75wc4lutipb7uszkqfuakjl7iqsygjif4df5phosifkgi3serc@t75jpefbbbcs>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 4 Sep 2025 15:48:36 +0300
X-Gm-Features: Ac12FXyqolMHhcEVaWO6TF_qYRS1ymxnZW7Xsug83f2VeNBvmBV6FfcI9PTDfjY
Message-ID: <CAPVz0n0b7wAZXQc9inET6+pQUnp-GRVF+ojwSDENmu5yxHgW9w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] input: rmi4: fix RMI_2D clipping
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 4 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 14:58 Dmitr=
y Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Wed, Sep 03, 2025 at 07:19:45PM +0300, Svyatoslav Ryhel wrote:
> > From: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> >
> > The physical max_y value was overridden with a clip_y_max value. This
> > caused problems when inverting/flipping the screen. Further it messed u=
p
> > calculation of resolution.
> >
> > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/input/rmi4/rmi_2d_sensor.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/input/rmi4/rmi_2d_sensor.c b/drivers/input/rmi4/rm=
i_2d_sensor.c
> > index b7fe6eb35a4e..b4762b3c8b24 100644
> > --- a/drivers/input/rmi4/rmi_2d_sensor.c
> > +++ b/drivers/input/rmi4/rmi_2d_sensor.c
> > @@ -56,7 +56,7 @@ void rmi_2d_sensor_abs_process(struct rmi_2d_sensor *=
sensor,
> >               obj->x =3D min(sensor->max_x, obj->x);
> >
> >       if (axis_align->clip_y_high)
> > -             obj->y =3D  min(sensor->max_y, obj->y);
> > +             obj->y =3D  min(axis_align->clip_y_high, obj->y);
> >
> >       sensor->tracking_pos[slot].x =3D obj->x;
> >       sensor->tracking_pos[slot].y =3D obj->y;
> > @@ -149,13 +149,12 @@ static void rmi_2d_sensor_set_input_params(struct=
 rmi_2d_sensor *sensor)
> >
> >               sensor->min_y =3D sensor->axis_align.clip_y_low;
> >               if (sensor->axis_align.clip_y_high)
> > -                     sensor->max_y =3D min(sensor->max_y,
> > +                     max_y =3D min(sensor->max_y,
>
> I see that you want to have sensor->max_y to carry maximum coordinate
> the sensor is capable of reporting, so that flipping works properly. If
> this is the case you should also be deleting sensor->min_y and always
> use 0 in its place, otherwise there is inconsistency.
>
> You also need to deal with X coordinate in the similar fashion.
>
> >                               sensor->axis_align.clip_y_high);
> >
> >               set_bit(EV_ABS, input->evbit);
> >
> >               max_x =3D sensor->max_x;
> > -             max_y =3D sensor->max_y;
>
> This makes max_y potentially uninitialized.
>
> >               if (sensor->axis_align.swap_axes)
> >                       swap(max_x, max_y);
> >               input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_x, =
0, 0);
>
> I am unconvinced that using raw sensor coordinates to calculate
> resolution is a good idea. It has potential to regress existing users.
>
> Thanks.
>

I will take a deeper look, thank you for review.

> --
> Dmitry


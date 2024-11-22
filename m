Return-Path: <linux-input+bounces-8195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F06A9D5A2E
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2024 08:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B456D1F21CC9
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2024 07:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261A2166F26;
	Fri, 22 Nov 2024 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NxLi/nQs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7643C22081
	for <linux-input@vger.kernel.org>; Fri, 22 Nov 2024 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261597; cv=none; b=DHW3WIjLEKiNYSMCWj+kHZjgdSuPQ+xUMeYla6PrEgtH/bYAyzoUjnB23W4MswpcB8UenHNAiGT0t2g5Vkhlhfg/V1XZuSztHNrZIISY1EG6iRKVbWUggtr+IRbOXLqhGcFNBZGt0OepiVEt7ecPmpCCSC7q4BHoQQcfi80HgXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261597; c=relaxed/simple;
	bh=ZEt3yoR0cr5/kASiXDyIBRVJ5cVFZ2AeNaZON5w/kHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4Zba9NS5YE35nuxNyiDRk865oXSeY1HjyMj7RYx0aES7HPamYL4J3WzhQNocRPIdWxQYzXtdklSL11cjcTzdKAFFaISIbNp7XGgiBotpOowfAiCL7A0rXSdUrXD9083B20v3wLkel0MzBwVPgC0nSl0z1edvIcTsVf9VsgIZik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NxLi/nQs; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7242f559a9fso1794844b3a.1
        for <linux-input@vger.kernel.org>; Thu, 21 Nov 2024 23:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732261594; x=1732866394; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rV7OUDMMlgxjwFF1dF4a3L3rrV3TIom9pYtmVzZiP3c=;
        b=NxLi/nQszJxZ38c92b01yrWLzhHtKcsPUOe8GT7kd0ZGNeyaYNsAeh9nNF7/gxQZ5N
         YhlIVG5IU620p5aerdElFuCdDFo0xAkgOxZHY/3Qhq0MSpNfy/VwIGA1E+KeaM0UsCAK
         UaLsmhWceWL51KLmK709esK8UGhxIVh+m/S88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732261594; x=1732866394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rV7OUDMMlgxjwFF1dF4a3L3rrV3TIom9pYtmVzZiP3c=;
        b=EpC0lZKOgxA7B6OsBnPALFmVnR8EFZIw4CEqKRcBK57Whz6x6ytLuhvhNj9l4pQRvj
         Fmf3Jje7Gw0fJ6WGMw9Y8OTUzc/mKRFDusBEq+2awJsvhYvbJKzJKvXC4UuM5+tIyHcZ
         sM5ILtJEMj8qgMAGTeXfW9b+9txZXf5eUp+52w/OnWEJ/hHDda+v/5KZioiHYo+0FC4X
         nidZppxbmZU1Upz7S59ZZ+ygRGzLwr7Rh2SyVoVDtAfUVC68enB/YnAj3IUb3gP/YAxT
         ErSvau6CIVBBe62ehcY6NhLPJItJtSTgUrX0VXkrgtvfYz5/wcOPSh8kl86sMcuYdx7c
         yyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUseN4UfLk47dxJcsiOP6l1B7eF3rC71PPHxHl2QG8BhIizfCmO7I+k1UNMlymOmaHxaCVRnU7X0S/e0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtmvSDmOisqw9du2trwPH+exNwFUkBuTXpU1DaXPlZ899WwloA
	cKYnmcCPqRJh5Ca+J0NDVh/l0Ou+YQ36fe2y1fJ6fRBpe3aGwfSeDzgSleyaHnuJ9vVR82Hosdw
	=
X-Gm-Gg: ASbGncvLyKvSl8XXxKbMNVsE2FyKFbGD3o+iLFgc/5PAEuGqm3lx0KcPhMu0Adx8npR
	OJsHI8FYkxbgyPtwRnmMw105u3Jw9E/y/ukSMzk2YIvZ3Y6K0aknaN45lD78Uu90l7aEkf8tE7d
	7JiwFhteptP81LQ8nOBWi2HUYWu0oSn4o9ZlrxdsG0RT3PLTarP6lgTn6hgpm/t6nMtWu1Vypwe
	QSP4D+8qnXFHvUW8seLdOjuf/fxC3vWin6jt8Gv1Qi4HZQBLbvvDSsta/QldYMGDI8jJCEfb2o6
	L1l2ouoH3G9KDgfq
X-Google-Smtp-Source: AGHT+IE73O5v2pVy0Twr4j6K4ogt0Qeb4wXCfbsu9+pt+pcUaW8NlQkuJ5hZnQZDfXNj8c1ukTF5iQ==
X-Received: by 2002:a17:902:d2ce:b0:211:6b67:10ea with SMTP id d9443c01a7336-2129fce2f89mr23959495ad.8.1732261594692;
        Thu, 21 Nov 2024 23:46:34 -0800 (PST)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc13af5sm10085465ad.210.2024.11.21.23.46.33
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 23:46:33 -0800 (PST)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fbc65f6c72so953648a12.1
        for <linux-input@vger.kernel.org>; Thu, 21 Nov 2024 23:46:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1V1rf21nReL0xHqnwS+e/OCmXRwDs6QrCpXdMToxIE7G2kqnAU8ydMe4MkgLELDFucIgFGhD8WBiY7Q==@vger.kernel.org
X-Received: by 2002:a05:6a20:3949:b0:1dc:2365:a114 with SMTP id
 adf61e73a8af0-1e09e4b19b9mr2861897637.24.1732261593103; Thu, 21 Nov 2024
 23:46:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121-fix-processed-v1-1-4fae6770db30@chromium.org> <853def565622848427e6e5df8f073465fa52e76c.camel@linux.intel.com>
In-Reply-To: <853def565622848427e6e5df8f073465fa52e76c.camel@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 08:46:21 +0100
X-Gmail-Original-Message-ID: <CANiDSCuV1zo0=wGLir26Bn0np+BbVj9aj-JK3ZMreOT78c73UQ@mail.gmail.com>
Message-ID: <CANiDSCuV1zo0=wGLir26Bn0np+BbVj9aj-JK3ZMreOT78c73UQ@mail.gmail.com>
Subject: Re: [PATCH] iio: hid-sensor-prox: Fix invalid read_raw for attention
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Nov 2024 at 17:44, srinivas pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Thu, 2024-11-21 at 09:16 +0000, Ricardo Ribalda wrote:
> > The attention channel is a IIO_CHAN_INFO_PROCESSED, not a
> > IIO_CHAN_INFO_RAW.
> >
> > Modify prox_read_raw() to support it.
> >
> What is the sysfs entry to trigger this IIO_CHAN_INFO_PROCESSED read?
> Don't you have an entry *_raw?

/sys/.../iio:deviceX/in_attention_input

There is no _raw device for it.

>
>
> Thanks,
> Srinivas
>
> > Fixes: 596ef5cf654b ("iio: hid-sensor-prox: Add support for more
> > channels")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/iio/light/hid-sensor-prox.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iio/light/hid-sensor-prox.c
> > b/drivers/iio/light/hid-sensor-prox.c
> > index e8e7b2999b4c..8e5d0ad13a5f 100644
> > --- a/drivers/iio/light/hid-sensor-prox.c
> > +++ b/drivers/iio/light/hid-sensor-prox.c
> > @@ -94,6 +94,7 @@ static int prox_read_raw(struct iio_dev *indio_dev,
> >       *val2 = 0;
> >       switch (mask) {
> >       case IIO_CHAN_INFO_RAW:
> > +     case IIO_CHAN_INFO_PROCESSED:
> >               if (chan->scan_index >= prox_state->num_channels)
> >                       return -EINVAL;
> >               address = prox_state->channel2usage[chan-
> > >scan_index];
> > @@ -107,8 +108,7 @@ static int prox_read_raw(struct iio_dev
> > *indio_dev,
> >
> > report_id,
> >
> > SENSOR_HUB_SYNC,
> >                                                          min < 0);
> > -             if (prox_state->channel2usage[chan->scan_index] ==
> > -                 HID_USAGE_SENSOR_HUMAN_ATTENTION)
> > +             if (mask == IIO_CHAN_INFO_PROCESSED)
> >                       *val *= 100;
> >               hid_sensor_power_state(&prox_state-
> > >common_attributes, false);
> >               ret_type = IIO_VAL_INT;
> >
> > ---
> > base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
> > change-id: 20241121-fix-processed-ed1a95641e64
> >
> > Best regards,
>


-- 
Ricardo Ribalda


Return-Path: <linux-input+bounces-12446-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 751FDABC46E
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 18:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2E2D3A034A
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 16:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A702749F5;
	Mon, 19 May 2025 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZxVfgp2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C75286410;
	Mon, 19 May 2025 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671788; cv=none; b=eN1QGWEAJjNovCeEJvM67ie0xHEXfPwCSS3967GAsk40EmD7oZeOUGQzp2l83M7Koi7jNp/hjWSJd8UWt79C0fKFgqsxyAdvXrgBJT8cKUsqIveh7meF2+TZsWop4WLXl7CGtA9B85Pc/8r6ieBHyHGp7PTHMSnlbPim/oqFW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671788; c=relaxed/simple;
	bh=yoLcLLMfUq+oIbdeG+lgM/suMocyB+BzY0AGIpG2I6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axCEfKcIxM7tD0H5Na44lMAzw/6dj3FV+whSjtN4SVQ3Ei0DtBh6bthFvPx8PBHte1Pk+g1n3f/2aWF2/moEv/U9xn6zJcGwSU7S+bgLUHYmgVtHbbUyW/flrwxV+9fgPXAg6g3hrfF74bhorkOeVSv7DWceARx8XvKCviBq1IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZxVfgp2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30ea7770bd2so3074683a91.0;
        Mon, 19 May 2025 09:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747671786; x=1748276586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NbXUILecFZqM1QNrDc/94P68oIZz2J/rCibArTJ2XQ8=;
        b=UZxVfgp2o4u4/dlwGAGelXQHys7a5jEcZ15t0oFTHfxvfk+MvTsqLWMn5rQVOX+spA
         FGEHDDnKKLfVodGWoPTFYo9rii9CHfR/okEygQU3JpQShdbzUq3D2t/tFHRSmwcm2hrx
         hLwWZV9iPUGWWHQMg1UNrvMFO/5i0a3ntA6HHnHNYPGkCdGlX6uX1mpR+CVAfoEALVkz
         XLnbySRcwYl857W29lC+l3sj59qbdlbQXyWwYLEgDiTaYfdzKlmlQFd4c2e65B1uriUI
         9m6sZi1ceD/+NsP3uIeZ7uanbrj8FF4/69foJ52Wku26bnT8Aj8kVfFaAS/iN3xpVctC
         koqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747671786; x=1748276586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbXUILecFZqM1QNrDc/94P68oIZz2J/rCibArTJ2XQ8=;
        b=oV4IDT4gqPrc5kX0GX0MynTVBKwDDXyNcxTbI3uYMkrzcFBlCeziQIHutedQeMY8Ic
         VnotwxXAGkvfdRlMVVqAczdoqz8qQMnv74EUX+tk1zaepVhz1kEiLaXTs547LuqI4XSb
         PzKf4wBcLO1zUHQLJ76I1q+ZNa+MItlm/5IKAkJtzYJ1qiy5gVT+OTCzHbX1oLoGEqGx
         RyWRsOFcAKqi6VaVTBdUW6hgM/GZ0LhHN6D5wViolboQLwYh8W7ojI8X2Fh0O6zE7bwh
         +Wew0puWHG0lEgtM6BNHzPt58smQsNvj30i4k4r8XZ5pciBh8xBGgsVw3KKupm92T20M
         1qBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfyYStVMN3d8rdxk1cxzG405uSSI7zkC0aPz9m1K2xwi5DOTM4+H/pAqHvMpwBUXBCuSC0McKS/w1WKQ==@vger.kernel.org, AJvYcCXIKb+kk5RdJ2zt90uikQPnxYJfLzgwPT4Y1rVvZaugYFUDJno+XOaLOzzv3Xq2oTaHp2+e8bsfaOJKIMGf@vger.kernel.org
X-Gm-Message-State: AOJu0YwMCNEEyl5jSwstrYwVOpJn/WFZK6JsZ6IL2BRIqeNrq7I9GGHv
	Q+kwFQc/SHNJQ63W+/Z9GAdl90R4kfhgVWhpFWvnl8puYKEfXvpuP0I4
X-Gm-Gg: ASbGncvixe2L3UCePigy95fjAsrq25jCcnymeSJaJif60qeM/Mbe9LnOwiMSL+RFS+E
	E7duEeBSxPHcdCdXljUA0w4jInNSyuUMkPBvb0LCKvAxr13wJUtwQyBviOUhL20WK7KUNMH6ZP+
	RRJWvX867fwK2LhdOl7DXLIoga30EcSzYhAqQc8E5XcHUDDHVvoNwpyv+K63EwV478rNs7v1hb6
	zGFaQDXCaoKYNJzvYTWk+21dHilEz29/rxCUb+2U6WkCSGTWD0XlDwzsBfSKulyfYm1LBZNKBoA
	RqrnDj0T7kueKYF+tBM5sLupbdUgbwm3HJY5xeCG25abVDBiOQ==
X-Google-Smtp-Source: AGHT+IHprM+8PN4JrIjf6mE6Iwiw0Z+YfhCyzCdw3//7JM4PwiCVoQ7+1bWhkBTrFoiKg2+S6zo7jg==
X-Received: by 2002:a17:90b:4a50:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-30e7d500953mr20100588a91.6.1747671785910;
        Mon, 19 May 2025 09:23:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e134:a6aa:27:6156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ef3c50c31sm2549387a91.45.2025.05.19.09.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:23:05 -0700 (PDT)
Date: Mon, 19 May 2025 09:23:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Bastien Nocera <hadess@hadess.net>, 
	Hans de Goede <hdegoede@redhat.com>, "open list:GOODIX TOUCHSCREEN" <linux-input@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] input: goodix: add poll mode for goodix touchscreen
Message-ID: <t6umftlzqhpiwtq3oi2xgtmmvxc7o4ab2bjxqywvwrp25jpi5a@vlryb74pcvxi>
References: <20250519085744.3116042-1-qijian.guo@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519085744.3116042-1-qijian.guo@nxp.com>

Hi Joseph,

On Mon, May 19, 2025 at 05:57:43PM +0900, Joseph Guo wrote:
> goodix touchscreen only support interrupt mode by default.
> Some panels like waveshare panel which is widely used on raspeberry pi
> don't have interrupt pins and only work on i2c poll mode.
> The waveshare panel 7inch panel use goodix gt911 touchscreen chip.
> 
> Update goodix touchscreen to support both interrupt and poll mode.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  drivers/input/touchscreen/goodix.c | 69 +++++++++++++++++++++++++++---
>  drivers/input/touchscreen/goodix.h |  4 ++
>  2 files changed, 67 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index aaf79ac50004..87991b56494d 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -47,6 +47,7 @@
>  #define RESOLUTION_LOC		1
>  #define MAX_CONTACTS_LOC	5
>  #define TRIGGER_LOC		6
> +#define POLL_INTERVAL_MS		17	/* 17ms = 60fps */
> 
>  /* Our special handling for GPIO accesses through ACPI is x86 specific */
>  #if defined CONFIG_X86 && defined CONFIG_ACPI
> @@ -497,6 +498,23 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>  	input_sync(ts->input_dev);
>  }
> 
> +static void goodix_ts_irq_poll_timer(struct timer_list *t)
> +{
> +	struct goodix_ts_data *ts = from_timer(ts, t, timer);
> +
> +	schedule_work(&ts->work_i2c_poll);
> +	mod_timer(&ts->timer, jiffies + msecs_to_jiffies(POLL_INTERVAL_MS));
> +}

Why are you not suing the existing polling infrastructure
(input_setup_polling())?

Thanks.

-- 
Dmitry


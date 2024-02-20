Return-Path: <linux-input+bounces-1966-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA185B713
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 10:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DA571C24252
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 09:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1887860253;
	Tue, 20 Feb 2024 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="STMPGgqH"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0C5FEE8
	for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708420659; cv=none; b=sBwE8zEfMv21RgqmAY64l08z8P2W0IgwrdLFuY3eQVpi2Y8Pwz5XSUdOHvhnsv+ytxuImdzLK6e7I/mnp9DP5JvmTAMhE9XUBnOrHtRTCOqsBrpLWCOWqxeaOANoYy5JhaR32HXtQ+5qf2rA3hqjib0McKrY1PfLVtMk3UFh/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708420659; c=relaxed/simple;
	bh=nkf5Q/o2N6uxU/krrkxMdk5G+u0NWrK1OwF42W4+exU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q3bx5DVPf1mR29IPKcM2mD1YD/Jt13D7Y5mmuwTifxxmSX/ANfRz5pgjFVl8CERrWOxJm+I/5PqJs9Mquz0/XTfzmfsjzIKqHhawNgB/lyCWoqxMtQ5NYXVuJMrPf9aOg0u71uVKFwwswGFepeCIB4JhR0ZN+IOLkWTqkC6t55A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=STMPGgqH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708420656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QdkBCPYDeheTT+uzHIWpGEdO4JJdk+hRLV0yR8IOegg=;
	b=STMPGgqHuQw+Eqm56NZXLvzBV5wI9kjOYHHH7G3wV8dWHIzXtn/LwOBQ6jxHQNVVFelfag
	xMAzzox2kfEPI7BLwFYKUY12INIZujEy2c6v0V3GqQbEbm32t6KWMua8g/9q+SsLhfGTp5
	K4WebKlg9VBMgWnk3fLLnrqOsd8VJJ0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-iVbJ53zPNl2Q5WLCQ6H9vQ-1; Tue, 20 Feb 2024 04:17:34 -0500
X-MC-Unique: iVbJ53zPNl2Q5WLCQ6H9vQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2d24452f743so7618751fa.0
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 01:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708420652; x=1709025452;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdkBCPYDeheTT+uzHIWpGEdO4JJdk+hRLV0yR8IOegg=;
        b=nk4fkXG6YK7CeHt/t1zgwyOiqr/f7n5MYRURVfsz27eOCk8ZQiAboJ+TQuMwuOprqf
         nd7cPZShZ28SwE+EEoV5JlZEEOYy7Rx433iOV9d9BxaZyRUp4sSeM9DqHq/CEwZqDEsf
         55G0Kpdj3onjv3/SYXEW7OCKxp9cMrdXj0uwCJ35ToyHzW00Tb9TyWtJ3xmlT1+OGiL9
         NOS9o5hstplVgSsb4u9/TUGxFtVd9jqYo0rfMSQt0aWM8NRU/+uutPrSozb6Vw9GH/5Y
         tbPqbzfUL7LRxqezxNyo4ZNg08Qg8QKVMUrjbjLlVpjAlU9qi5NhhO40+Gz5L01QrR6/
         BrJA==
X-Forwarded-Encrypted: i=1; AJvYcCVhvgAAOdt+1MqQ7leUhEXGWBPMQCPTFpLIl4DlDfJ60SjaXlH08FiZAa9Bp+JsS2tf+JMlk1aDccgVRgYqHsIhscyAnFWxsgeu380=
X-Gm-Message-State: AOJu0YxuaKmn3wIzJe4c3xLHJOnbwoeDEGJExugJSJv1Ftfhmk4/ulG4
	zX1rfL+Po3OVRMsTsfVTNoS30LGQcDVPvsYNQJP0S2q6hWMzL1NUQ37vqHWQYb+g2FeZvFyPSL0
	wyK4kJ16S/45pCcE/DRMtrVFCn8xZXvY47lzbPeHSssKAcsZYE8ryPSbBTOnJ
X-Received: by 2002:ac2:5e62:0:b0:512:a93a:f5a5 with SMTP id a2-20020ac25e62000000b00512a93af5a5mr4159541lfr.19.1708420652693;
        Tue, 20 Feb 2024 01:17:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAJvY45CWeh5zWa4RXaJeTqSuMBy6I0QeL2Im2jjuR1AxRWVjKK6LynUjbfe5DTheoNd69ag==
X-Received: by 2002:ac2:5e62:0:b0:512:a93a:f5a5 with SMTP id a2-20020ac25e62000000b00512a93af5a5mr4159530lfr.19.1708420652349;
        Tue, 20 Feb 2024 01:17:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s6-20020a05600c45c600b00412696bd7d9sm4074941wmo.41.2024.02.20.01.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:17:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 01/10] backlight: Match backlight device against struct
 fb_info.bl_dev
In-Reply-To: <20240212162645.5661-2-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-2-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:17:31 +0100
Message-ID: <87bk8bjxzo.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Framebuffer drivers for devices with dedicated backlight are supposed
> to set struct fb_info.bl_dev to the backlight's respective device. Use
> the value to match backlight and framebuffer in the backlight core code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/backlight.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 86e1cdc8e3697..48844a4f28ad3 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -98,7 +98,8 @@ static int fb_notifier_callback(struct notifier_block *self,
>  {
>  	struct backlight_device *bd;
>  	struct fb_event *evdata = data;
> -	int node = evdata->info->node;
> +	struct fb_info *info = evdata->info;
> +	int node = info->node;
>  	int fb_blank = 0;
>  
>  	/* If we aren't interested in this event, skip it immediately ... */
> @@ -110,8 +111,12 @@ static int fb_notifier_callback(struct notifier_block *self,
>  
>  	if (!bd->ops)
>  		goto out;
> -	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
> +	else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
>  		goto out;
> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> +	else if (info->bl_dev && info->bl_dev != bd)

If the driver doesn't provide a struct backlight_ops .check_fb callback, I
think that having an info->bl_dev should be mandatory ? Or at least maybe
there should be a warning if info->bl_dev isn't set ?

The would be a driver bug, right ?

Regardless, the change makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat



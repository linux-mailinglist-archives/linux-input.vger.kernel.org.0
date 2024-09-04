Return-Path: <linux-input+bounces-6189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDB596C6BE
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456BE2812BF
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 18:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023141DEFCD;
	Wed,  4 Sep 2024 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETzY3Njs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5D81E203D;
	Wed,  4 Sep 2024 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475768; cv=none; b=dcqInB54zf9Ur+GoaQxM/vG+9mt9XGXxhrGWUhFGX0YeQqFYUQV4OYDds/Bgi7J76cuDPPtSV/+qGTYZskL54M24qYkxB9bmswMKsvWv5DuEiIWYqItZriaIeknSRFNdKEJqMmkGiCVfKfbF6trU/DL+On5hlzA5+TFvj8mb64Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475768; c=relaxed/simple;
	bh=icNS8H6X54UMd5UzwI7ckw4Rb/ifvsdVP9fbO5oAasc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIXEx/qNkvkMA9/hIwLxWIgH0akzeTaU0kZuJU3UN8y1EvN8WmmNjV1QkRUKxyAOx69B/LL8kFp81X7BVKITjyTgRanuZBet5FKK4X3tM0Fqna4Uu0omd2NCxdSrya2gLkexI3w3OTPGeQ1qk7t7jqGBiyigEhdeKKRyrd6FbcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETzY3Njs; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so6929710a12.1;
        Wed, 04 Sep 2024 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475765; x=1726080565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPcwubZ04o5BpkQZwNjRYqMlTb6GH8f+j2Sdf7T0beE=;
        b=ETzY3NjsNqojXYsoG31tOVzdxWzJ4ihCXUzONgEWpT3+oIlpKme58VX1eCcco9j8Hw
         YLb/0aNjx7z6dBGyoOuNYAw9iAXWNUcTi6f+zaWL3r9K/P/o97tPepJzrqrFr2Om6/c+
         rQdhIKW+MpXOEeZqXz7IMuoRNF1MS8XdjJuba/6As8putjvys1mWNru01YXbc8HNQV4J
         GgWj6y07g8i8p50YTpooZ3Loq4s6GEYFH+HJceRjJx1PcZUV+Gdt4ke8IGrOm4xCn4jM
         8csM2b0yMvSgYPrk8H8ssMlykoW0iG0LGRZQDGJkFzndHXF4UZZOaTmmBDarN6SQb04s
         fcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475765; x=1726080565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPcwubZ04o5BpkQZwNjRYqMlTb6GH8f+j2Sdf7T0beE=;
        b=C33iCfIhvHym9F+tVRweXso7k6iVkz+/Vi4OmxkFjh9T0RM26Zw8dibNxLH5Tl0Q+Y
         CcAhayeIZWq1NI3UOfLg0UarWrK0nP1vslEtb9srRorJpyF/R33SjBbPiNoBkbTiqg8b
         nfE3vV76T0y6WcogpzdqJ2z2vmcEUSsMIqRe/emXY0ofTMvZ9c2cQVWySb4lDPrlmJB/
         19pb7O86JpBs7LUndSkvkWPICcknS3tyK4lmF6/d2rxygY60Z9/261Oa+ZSfEr2SRwe4
         9tWSwslEbM7SG7nzUz8NKWtulY/VmJe+VgNIA9/GO+r4ZHXFrLnKSUOQmcjqXHx48VWI
         s/mw==
X-Forwarded-Encrypted: i=1; AJvYcCWXa+prRoaxJ2btesq3QJPJ2xt3qP68vkaa8xhw8j0gx+1zStcdzB16qc3M93zNye4cidj1XGsR6rQrUQ==@vger.kernel.org, AJvYcCWnbXDWlNsQeIzUayA3R1p2MmvUXV1juN6v6AeoLhxTd/R2jhQf6Htbq/Ho2UgRFBAWBvqs+yOl+8QUnCFj@vger.kernel.org
X-Gm-Message-State: AOJu0YzWiezHtqiH+/jzpWIY0FByf4LdCOLrIsBfb+o7o6a/5kIvQ4m/
	Jn4Sl0JWO1sPFmjYdiIzENqFb+t6DQxjZ6N+GlEoUic1Ou858G4O
X-Google-Smtp-Source: AGHT+IHcTlQEtcHUWPhKkcmKfHRjZWMCykag4wMXC+gU0gdJNXlfXtbBaVpfsVO7bfQ7BXZuLP1Aqw==
X-Received: by 2002:a17:906:f5aa:b0:a86:851e:3a2e with SMTP id a640c23a62f3a-a897f8bd084mr1728157666b.30.1725475764935;
        Wed, 04 Sep 2024 11:49:24 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a6236d164sm23204066b.111.2024.09.04.11.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:49:23 -0700 (PDT)
Message-ID: <c251bacb-8376-4572-b32b-27dffb03f4fc@gmail.com>
Date: Wed, 4 Sep 2024 20:49:22 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] Input: ati_remote2 - use guard notation when
 acquiring mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044244.1042174-3-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-3-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/ati_remote2.c | 57 +++++++++++---------------------
>  1 file changed, 19 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/input/misc/ati_remote2.c b/drivers/input/misc/ati_remote2.c
> index 795f69edb4b2..e84649af801d 100644
> --- a/drivers/input/misc/ati_remote2.c
> +++ b/drivers/input/misc/ati_remote2.c
> @@ -244,29 +244,21 @@ static int ati_remote2_open(struct input_dev *idev)
>  	if (r) {
>  		dev_err(&ar2->intf[0]->dev,
>  			"%s(): usb_autopm_get_interface() = %d\n", __func__, r);
> -		goto fail1;
> +		return r;
>  	}
>  
> -	mutex_lock(&ati_remote2_mutex);
> +	scoped_guard(mutex, &ati_remote2_mutex) {
> +		if (!(ar2->flags & ATI_REMOTE2_SUSPENDED)) {
> +			r = ati_remote2_submit_urbs(ar2);
> +			if (r)
> +				break;
> +		}
>  
> -	if (!(ar2->flags & ATI_REMOTE2_SUSPENDED)) {
> -		r = ati_remote2_submit_urbs(ar2);
> -		if (r)
> -			goto fail2;
> +		ar2->flags |= ATI_REMOTE2_OPENED;
>  	}
>  
> -	ar2->flags |= ATI_REMOTE2_OPENED;
> -
> -	mutex_unlock(&ati_remote2_mutex);
> -
>  	usb_autopm_put_interface(ar2->intf[0]);
>  
> -	return 0;
> -
> - fail2:
> -	mutex_unlock(&ati_remote2_mutex);
> -	usb_autopm_put_interface(ar2->intf[0]);
> - fail1:
>  	return r;
>  }
>  
> @@ -276,14 +268,12 @@ static void ati_remote2_close(struct input_dev *idev)
>  
>  	dev_dbg(&ar2->intf[0]->dev, "%s()\n", __func__);
>  
> -	mutex_lock(&ati_remote2_mutex);
> +	guard(mutex)(&ati_remote2_mutex);
>  
>  	if (!(ar2->flags & ATI_REMOTE2_SUSPENDED))
>  		ati_remote2_kill_urbs(ar2);
>  
>  	ar2->flags &= ~ATI_REMOTE2_OPENED;
> -
> -	mutex_unlock(&ati_remote2_mutex);
>  }
>  
>  static void ati_remote2_input_mouse(struct ati_remote2 *ar2)
> @@ -713,16 +703,14 @@ static ssize_t ati_remote2_store_channel_mask(struct device *dev,
>  		return r;
>  	}
>  
> -	mutex_lock(&ati_remote2_mutex);
> -
> -	if (mask != ar2->channel_mask) {
> -		r = ati_remote2_setup(ar2, mask);
> -		if (!r)
> -			ar2->channel_mask = mask;
> +	scoped_guard(mutex, &ati_remote2_mutex) {
> +		if (mask != ar2->channel_mask) {
> +			r = ati_remote2_setup(ar2, mask);
> +			if (!r)
> +				ar2->channel_mask = mask;
> +		}
>  	}
>  
> -	mutex_unlock(&ati_remote2_mutex);
> -
>  	usb_autopm_put_interface(ar2->intf[0]);
>  
>  	return r ? r : count;
> @@ -892,15 +880,13 @@ static int ati_remote2_suspend(struct usb_interface *interface,
>  
>  	dev_dbg(&ar2->intf[0]->dev, "%s()\n", __func__);
>  
> -	mutex_lock(&ati_remote2_mutex);
> +	guard(mutex)(&ati_remote2_mutex);
>  
>  	if (ar2->flags & ATI_REMOTE2_OPENED)
>  		ati_remote2_kill_urbs(ar2);
>  
>  	ar2->flags |= ATI_REMOTE2_SUSPENDED;
>  
> -	mutex_unlock(&ati_remote2_mutex);
> -
>  	return 0;
>  }
>  
> @@ -917,7 +903,7 @@ static int ati_remote2_resume(struct usb_interface *interface)
>  
>  	dev_dbg(&ar2->intf[0]->dev, "%s()\n", __func__);
>  
> -	mutex_lock(&ati_remote2_mutex);
> +	guard(mutex)(&ati_remote2_mutex);
>  
>  	if (ar2->flags & ATI_REMOTE2_OPENED)
>  		r = ati_remote2_submit_urbs(ar2);
> @@ -925,8 +911,6 @@ static int ati_remote2_resume(struct usb_interface *interface)
>  	if (!r)
>  		ar2->flags &= ~ATI_REMOTE2_SUSPENDED;
>  
> -	mutex_unlock(&ati_remote2_mutex);
> -
>  	return r;
>  }
>  
> @@ -943,11 +927,11 @@ static int ati_remote2_reset_resume(struct usb_interface *interface)
>  
>  	dev_dbg(&ar2->intf[0]->dev, "%s()\n", __func__);
>  
> -	mutex_lock(&ati_remote2_mutex);
> +	guard(mutex)(&ati_remote2_mutex);
>  
>  	r = ati_remote2_setup(ar2, ar2->channel_mask);
>  	if (r)
> -		goto out;
> +		return r;
>  
>  	if (ar2->flags & ATI_REMOTE2_OPENED)
>  		r = ati_remote2_submit_urbs(ar2);
> @@ -955,9 +939,6 @@ static int ati_remote2_reset_resume(struct usb_interface *interface)
>  	if (!r)
>  		ar2->flags &= ~ATI_REMOTE2_SUSPENDED;
>  
> - out:
> -	mutex_unlock(&ati_remote2_mutex);
> -
>  	return r;
>  }
>  

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


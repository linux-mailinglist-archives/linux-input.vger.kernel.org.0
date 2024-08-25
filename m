Return-Path: <linux-input+bounces-5854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02495E380
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 15:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACC6B1F217BB
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 13:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10223156678;
	Sun, 25 Aug 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtsD6BWP"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A8F155C9B
	for <linux-input@vger.kernel.org>; Sun, 25 Aug 2024 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724591451; cv=none; b=m5vxCLX74OpMBs6Yerghe4VSxVm0DYEJXrcnZmuzs7xpltY4I7vtcBEJNac4qmnMtZwIGpuG8aBQtmhGGEyYCD+R1ZhWcxV9CzZFKsy+3R4IPJ9jOQdiYqtI446da76jtsydw5pTCfF1sB1xvMvCXeP18aRfFkKn5BE4ZQb1Eu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724591451; c=relaxed/simple;
	bh=iKMY1BsfXW5DCDOM1rJutDkN7zW/92A/o9tWLFXitOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8TU4m1/RRvtEZD9vkFWSqghLnhcoGiX+rmesQ6I4QBVEm2JobCRWZ1VKENSSMrOf3ebqSEIbMnL1aJ+ddTlvAHrPX8hYU6BoX1SpCk4VXRvqLQaJmboV/uJt4Gv3spi6klSqdx1W6ORycnk8BoI8C1PRwsIHVmrWnW2PljD3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtsD6BWP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724591448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5HPuabIgkyx2GqHJrYxVWzQ9JtdHpCasYdEjisxJKo=;
	b=GtsD6BWPUetXAT/kd/ERI49JTLgcDIjvFcRHKrF2Y2onodGLiWyTTXbCPcX7HkPAQpSlNc
	FKA7KNSHdQNpAN4fokuqxMYwpJZMJ3LgaOE/VpTCaI/z4VkWiHflq1t/Y3X1yNnoN7p7r/
	91K4UbpIDCLq4bFvUChAEz79ANdYtXs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-iT7DgsRlPVSP3ARXSsMkfg-1; Sun, 25 Aug 2024 09:10:46 -0400
X-MC-Unique: iT7DgsRlPVSP3ARXSsMkfg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-533a8a3ca6aso2877096e87.1
        for <linux-input@vger.kernel.org>; Sun, 25 Aug 2024 06:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724591445; x=1725196245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5HPuabIgkyx2GqHJrYxVWzQ9JtdHpCasYdEjisxJKo=;
        b=qZKyp4tS+eXVlY1Utjc0av2OQ2lpGGQKQsveXshZFItaVTXguRzihfjzvAiV9U7PCG
         Xi0A+iUSPx+sxPS/hLqenBFKEv+R+Wuf1SqtaSR8cGZrFhcFlWg/N/9/SMRLcBRmSwbh
         hkPeJMpJwmmoSE/HEAKnhbu9Rq6NNEIRLeMXwiDYkfUjrmVr/8TjOgIWUbLBlBAHChRC
         qyPJGx6MYugX3CDLIkbqKTNqVDl0+HYSwt9xcxY0z8GgoPDxKYP8Gh7hzWYLJ5rpiZEE
         fK8R07POMReZhTQHASrcXXoIpFyihrjkAmtowFULRmXizCxuFU+K8IFGHpTyPHeXzoST
         E/3g==
X-Forwarded-Encrypted: i=1; AJvYcCXW5rrObnWQ3A7/9Xw7qE0BY9kaP3wKKURw9D662IfhFX2MBRiRUX/s+h5lIzod49uLo6Akb5bMvoRpSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3RaIhpf4Dv7Msm5MeLVIJf/IvmngAij1TSeDYC9lkUMWHKFEt
	t4JGS3ZBsF0sIBIu+6M9dY2hrIJJWoUPTVL0g/0snJ+3S1zBFZB34BJrh4Y3pyHvVJv2HmIDgOA
	DqQ3L4t6SVJcqEVH5cT7nyqL+xt9otLEP/TiAqCmJzD9zpnF2dKNGfD1RiSoS
X-Received: by 2002:a05:6512:2814:b0:52e:9ac6:a20f with SMTP id 2adb3069b0e04-534388610f5mr4667339e87.37.1724591444709;
        Sun, 25 Aug 2024 06:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyq3crzju8WROi3/9aXixWRhW7fyntueq+5N6z4YHdvwe29s5TLxrye+t2/cfTKoEIxN6TcA==
X-Received: by 2002:a05:6512:2814:b0:52e:9ac6:a20f with SMTP id 2adb3069b0e04-534388610f5mr4667316e87.37.1724591444076;
        Sun, 25 Aug 2024 06:10:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f29a4c7sm536588766b.65.2024.08.25.06.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 06:10:43 -0700 (PDT)
Message-ID: <0e8ae323-d6c7-4460-a342-85e52ce0c1ef@redhat.com>
Date: Sun, 25 Aug 2024 15:10:42 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] Input: gpio-keys - switch to using cleanup
 functions
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
 <20240825051627.2848495-6-dmitry.torokhov@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240825051627.2848495-6-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/25/24 7:16 AM, Dmitry Torokhov wrote:
> Start using __free() and guard() primitives to simplify the code
> and error handling. This makes the code more compact and error
> handling more robust by ensuring that locks are released in all
> code paths when control leaves critical section and all allocated
> memory is freed.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/input/keyboard/gpio_keys.c | 44 ++++++++++++------------------
>  1 file changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index 9fb0bdcfbf9e..380fe8dab3b0 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -245,23 +245,20 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
>  {
>  	int n_events = get_n_events_by_type(type);
>  	const unsigned long *bitmap = get_bm_events_by_type(ddata->input, type);
> -	unsigned long *bits;
>  	ssize_t error;
>  	int i;
>  
> -	bits = bitmap_alloc(n_events, GFP_KERNEL);
> +	unsigned long *bits __free(bitmap) = bitmap_alloc(n_events, GFP_KERNEL);
>  	if (!bits)
>  		return -ENOMEM;
>  
>  	error = bitmap_parselist(buf, bits, n_events);
>  	if (error)
> -		goto out;
> +		return error;
>  
>  	/* First validate */
> -	if (!bitmap_subset(bits, bitmap, n_events)) {
> -		error = -EINVAL;
> -		goto out;
> -	}
> +	if (!bitmap_subset(bits, bitmap, n_events))
> +		return -EINVAL;
>  
>  	for (i = 0; i < ddata->pdata->nbuttons; i++) {
>  		struct gpio_button_data *bdata = &ddata->data[i];
> @@ -271,12 +268,11 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
>  
>  		if (test_bit(*bdata->code, bits) &&
>  		    !bdata->button->can_disable) {
> -			error = -EINVAL;
> -			goto out;
> +			return -EINVAL;
>  		}
>  	}
>  
> -	mutex_lock(&ddata->disable_lock);
> +	guard(mutex)(&ddata->disable_lock);
>  
>  	for (i = 0; i < ddata->pdata->nbuttons; i++) {
>  		struct gpio_button_data *bdata = &ddata->data[i];
> @@ -290,11 +286,7 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
>  			gpio_keys_enable_button(bdata);
>  	}
>  
> -	mutex_unlock(&ddata->disable_lock);
> -
> -out:
> -	bitmap_free(bits);
> -	return error;
> +	return 0;
>  }
>  
>  #define ATTR_SHOW_FN(name, type, only_disabled)				\
> @@ -470,11 +462,10 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
>  {
>  	struct gpio_button_data *bdata = dev_id;
>  	struct input_dev *input = bdata->input;
> -	unsigned long flags;
>  
>  	BUG_ON(irq != bdata->irq);
>  
> -	spin_lock_irqsave(&bdata->lock, flags);
> +	guard(spinlock_irqsave)(&bdata->lock);
>  
>  	if (!bdata->key_pressed) {
>  		if (bdata->button->wakeup)
> @@ -497,7 +488,6 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
>  			      ms_to_ktime(bdata->release_delay),
>  			      HRTIMER_MODE_REL_HARD);
>  out:
> -	spin_unlock_irqrestore(&bdata->lock, flags);
>  	return IRQ_HANDLED;
>  }
>  
> @@ -1062,10 +1052,10 @@ static int gpio_keys_suspend(struct device *dev)
>  		if (error)
>  			return error;
>  	} else {
> -		mutex_lock(&input->mutex);
> +		guard(mutex)(&input->mutex);
> +
>  		if (input_device_enabled(input))
>  			gpio_keys_close(input);
> -		mutex_unlock(&input->mutex);
>  	}
>  
>  	return 0;
> @@ -1075,20 +1065,20 @@ static int gpio_keys_resume(struct device *dev)
>  {
>  	struct gpio_keys_drvdata *ddata = dev_get_drvdata(dev);
>  	struct input_dev *input = ddata->input;
> -	int error = 0;
> +	int error;
>  
>  	if (device_may_wakeup(dev)) {
>  		gpio_keys_disable_wakeup(ddata);
>  	} else {
> -		mutex_lock(&input->mutex);
> -		if (input_device_enabled(input))
> +		guard(mutex)(&input->mutex);
> +
> +		if (input_device_enabled(input)) {
>  			error = gpio_keys_open(input);
> -		mutex_unlock(&input->mutex);
> +			if (error)
> +				return error;
> +		}
>  	}
>  
> -	if (error)
> -		return error;
> -
>  	gpio_keys_report_state(ddata);
>  	return 0;
>  }



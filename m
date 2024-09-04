Return-Path: <linux-input+bounces-6202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F47B96C787
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445D11C22288
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EF01E633B;
	Wed,  4 Sep 2024 19:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c61TmSxq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D114037F;
	Wed,  4 Sep 2024 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725478077; cv=none; b=hPUd7JpQpmoDIcJvfxuNYcTo359ggLgQqW9Y+2x01SK18PYk2cfYMAA7WrahJCYCK/fzWQuHitHbhqhjL2LFFbnsVlYuA+7sWjP/mff6xzzWT5TUwv0wckPO82z+h0CXWi84txialrVfbBUIqDkoXRpyDkoKxs6RwAk+dVhgaK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725478077; c=relaxed/simple;
	bh=9l7M6l8+1s6gJqAZcbJspUFOvEvq6t4AxCwZscOxaH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZtbxkqigOH0UxE2PaeL63meO/TPhdqn08bbcIbygvKNKgGgZ7gKsrevfk+LFNZTIlCm9riNjNnEaKBG+lCB5I6JAl8Gpb21v7yVqOHx4bZ9eMx76CxsSf+llLhIhMRDJxLVaoGsmdtXRQDn8nZWoBPodCpCJNE2pRAgEkRV+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c61TmSxq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42bb81e795bso56917345e9.1;
        Wed, 04 Sep 2024 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725478074; x=1726082874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTQfgjsN6xkPuwzyk867uytloUf4CfdMonVobtQI8x0=;
        b=c61TmSxqt+sKJHt371VrCFhoAYEmYfuH3xQW0ekpiwwgNd2pRGpjpdDGVno6fBOIlj
         kkIm2neWlYV1+au0IUGrtVcINJnUWV2SyJdFtxduCs6H6M7et87ICwQqNeXfpq55poMa
         llAcUIPpkaMsGPmvMcpizQ1qSASkMXdB8nOMbDzDSIrIGQIanjDMzW6YpPJE9mQww7PC
         NjAX9YJWI/SBgqLelIs0fptHLWctgaxRKe/R5zaoyA0assFwHN7qEtJ9lYE3mxg0W9dc
         mspsVrW+66nXl1mT2N62bNv1Y7nsrje6fTIOLGkPgYzmjCx3ikk8le5i08QPEI/V/obM
         s1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725478074; x=1726082874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTQfgjsN6xkPuwzyk867uytloUf4CfdMonVobtQI8x0=;
        b=gYE4ds/w7FBurWisfcu4z2TG0W2AVo+V4KggcZ8lDvgVQfdnBgVGhoIx7lmVKbMt8C
         1XJlUgE05hpk/QS2z37M94Ni3sba66BcYu09SgiELFWkGJ/lnI1+jlS304SQoNiCW70e
         gB0yWKCe1lWY0St8VEh0emJkEvj4UDP6lWRFhXPlQSoKO6Xlpa5L0kBAPJDwcvjrvRQA
         D8dxP6e/SK9VN/Rvjqm91k2v77eCwMoTo1kf67StjWM9a6+cAhuCUeQ/p+GRuHe1qt8b
         l5xdT2kx3MBY2MXrj/eXm7y5m9t5lImlj1ImN6a+mkHVsJ8Y1cAkSxKdgH/mNCJ/5iot
         botA==
X-Forwarded-Encrypted: i=1; AJvYcCUvZmptPeauz/7A6taGVwQh6ZSMWoD6/0ge52H49Ut9tLEGiILZqtDhKvBPlsYDOEovFqf+RrsfI/jk0w==@vger.kernel.org, AJvYcCVDWl1D3Y61LFVSzqR7kny2FAII6F33ub2Q+t26IybxIzIZMmboJikD6rQMq1Ek6D0kpNSjXEtPAbBqzn2d@vger.kernel.org
X-Gm-Message-State: AOJu0YyN6or7IeBjkV5axppcEjBjZZZ2N1NK6mvnE3be1yTqy2U5eb4G
	GEAYNG7ncYpnJI/COV5Dvn9/wZe8ksqJEWRV5/E53tjD9fXI1+BY
X-Google-Smtp-Source: AGHT+IEpjylxfihbZ8h8fejxPh361yOFL+c45KgezRCzJw4uBjepa8n/75efX2oE7JiSnlx0qAAzNw==
X-Received: by 2002:a05:600c:1ca0:b0:424:a2be:c161 with SMTP id 5b1f17b1804b1-42bbb216f26mr139247665e9.20.1725478073846;
        Wed, 04 Sep 2024 12:27:53 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0a42sm208524125e9.11.2024.09.04.12.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:27:52 -0700 (PDT)
Message-ID: <3ff97fb3-27e0-496e-a8b0-0c2d69deeff2@gmail.com>
Date: Wed, 4 Sep 2024 21:27:52 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/22] Input: regulator-haptic - use guard notation when
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
 <20240904044922.1049488-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044922.1049488-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:49, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/regulator-haptic.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
> index 02f73b7c0462..41af6aefaa07 100644
> --- a/drivers/input/misc/regulator-haptic.c
> +++ b/drivers/input/misc/regulator-haptic.c
> @@ -83,12 +83,10 @@ static void regulator_haptic_work(struct work_struct *work)
>  	struct regulator_haptic *haptic = container_of(work,
>  					struct regulator_haptic, work);
>  
> -	mutex_lock(&haptic->mutex);
> +	guard(mutex)(&haptic->mutex);
>  
>  	if (!haptic->suspended)
>  		regulator_haptic_set_voltage(haptic, haptic->magnitude);
> -
> -	mutex_unlock(&haptic->mutex);
>  }
>  
>  static int regulator_haptic_play_effect(struct input_dev *input, void *data,
> @@ -207,17 +205,14 @@ static int regulator_haptic_suspend(struct device *dev)
>  	struct regulator_haptic *haptic = platform_get_drvdata(pdev);

error became an unused variable and can be dropped.

>  	int error;
>  
> -	error = mutex_lock_interruptible(&haptic->mutex);
> -	if (error)
> -		return error;
> -
> -	regulator_haptic_set_voltage(haptic, 0);
> -
> -	haptic->suspended = true;
> +	scoped_guard(mutex_intr, &haptic->mutex) {
> +		regulator_haptic_set_voltage(haptic, 0);
> +		haptic->suspended = true;
>  
> -	mutex_unlock(&haptic->mutex);
> +		return 0;
> +	}
>  
> -	return 0;
> +	return -EINTR;
>  }
>  
>  static int regulator_haptic_resume(struct device *dev)
> @@ -226,7 +221,7 @@ static int regulator_haptic_resume(struct device *dev)
>  	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
>  	unsigned int magnitude;
>  
> -	mutex_lock(&haptic->mutex);
> +	guard(mutex)(&haptic->mutex);
>  
>  	haptic->suspended = false;
>  
> @@ -234,8 +229,6 @@ static int regulator_haptic_resume(struct device *dev)
>  	if (magnitude)
>  		regulator_haptic_set_voltage(haptic, magnitude);
>  
> -	mutex_unlock(&haptic->mutex);
> -
>  	return 0;
>  }
>  


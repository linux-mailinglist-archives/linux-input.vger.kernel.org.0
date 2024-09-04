Return-Path: <linux-input+bounces-6194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA11996C70F
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 220B21F241FC
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA392143757;
	Wed,  4 Sep 2024 19:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBSwKHx6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADA6143726;
	Wed,  4 Sep 2024 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476750; cv=none; b=T5PsXU39qtkrkVyQiU7VPEwXUcNpg1i33oZBWBy4ouKcsdQmRHflzazOPtc3IQtimgkGSfQhiiB4XOGtSHnhv9tdjnA65rBNkXaf1N3a6O3Hfv8G3DCnUiN5lecoO+UivWaIbnc/ZBME0pBr8cOWrkF1JlkMVZUanmermkTJv8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476750; c=relaxed/simple;
	bh=v6fkC67lXyi97eTsp4B9Q3+t3ALNShVYWxLpaWo4Hu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVhA58ssrayI0irVx5NpNOOdi7KDC+No5BEfd5z8o31JTNTrK3MZUYppuCS7wFpMj1G49WXldqrRaQOFqFkaGOeqkP8exLzzCuRuOEix4g4uKab+zvtn0P6GLqT/lTHuXyuujdtBZohIQ5XYoxh/GcBlJu6rTjl1uXtYQcZU7hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBSwKHx6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c24c92f699so4851059a12.2;
        Wed, 04 Sep 2024 12:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725476747; x=1726081547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Chx7rLcvZZgwr5M+HiXv/tyfNsTzOHyQBWZ16l9ZnWQ=;
        b=dBSwKHx6Mh1iueadSR15mNKT483PAWazKDX2zt2N3tCmHrYAnQk/7tSMnErr8lbU9C
         UU3q0yaUBxRfO+pMW2zEPn4YDhilCOtmEKL1+UOmO5gtb8UMFiaOq2/YFcztsyJDmpLX
         HwtmJgifmDKGU5z//uIoF5QLtzNohcJQmdEURaxdwy2bQ52sESD6GPHKvldqMpo6PeKb
         RH9mv4hvA1h1VY4u794+d/D+Bs/mikXym5JIfiop5Zt/oF27K+yiRRiMqQ7SD1kMhd+M
         dvhKmrI5n0s4zLlNm0JFMhgQCQdPEdoWYHnOP/bbf1tfVCuAybBhpUoUMCyLfOSjLtrr
         aeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476747; x=1726081547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Chx7rLcvZZgwr5M+HiXv/tyfNsTzOHyQBWZ16l9ZnWQ=;
        b=NV4FW8Hl82wQJY5hKgROBGM/HmNV/iMflarVbqXOWuLxPoTMswOMuy5NFupzw4NUUp
         1mAKR4sragLVOTCuSGyZsgFO3EqYNvX4DvP0z91ua8N3x2u13U++mVmie3bTq5qkxT6t
         HoTEmJDTFihnA+uW6i4PKp281O9/TNypTCg/QIOL9vogncSk6a9kpqO6s2+VPUZMh/qg
         6TU/o536X8f+LKe1kIvx9DvUzpyPy+6mhD3nhpnCnObPwFBSdLOE1lTvba6zJI5p3kOR
         JwAQvTdL06HV4H0RoZ9hGBGB04/scTpF5+uAh2Y0dT9ZZprd8TlyKjqChgOvCv4HH3KO
         9WHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVht1Ua5G2X+DjqkqhvlVP3Zw7FD1iFEe5mgBh+UgcBQwnN13GMVueTfqVXpnr0ZupRK5C/7c5Hx/8L8A==@vger.kernel.org, AJvYcCXEITaMDb7pZsG+AO+cIwM/8qsjJgLkiHLakOu9/+lgZFBPMc5hY6KcwB7gqhjjIizZaRsGmYvHqS9mwS2R@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIWrlbAB884y8RriErSsRG8yOxwA2986tKRYKi69KC7x+snLL
	4oeLqQqSYtl46kv90IZji1Vv0yiVQ7HHVMwBeBd8GbebM1PA2CmCKwUnGNgf
X-Google-Smtp-Source: AGHT+IHGe4wrH/bOFuSg/ZDZg5ZE5aQbj1Jmjsk7141n+uI6BbNIWo3ojWc0qBHQJBzgIX0KAgZAiw==
X-Received: by 2002:a05:6402:354e:b0:5c2:43a0:47e3 with SMTP id 4fb4d7f45d1cf-5c27584b805mr3220991a12.36.1725476747002;
        Wed, 04 Sep 2024 12:05:47 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc528c21sm224507a12.10.2024.09.04.12.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:05:46 -0700 (PDT)
Message-ID: <a05a7dad-092d-4502-9b29-e76ff4b3470f@gmail.com>
Date: Wed, 4 Sep 2024 21:05:45 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/22] Input: drv260x - use guard notation when acquiring
 mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044244.1042174-8-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-8-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/drv260x.c | 50 +++++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
> index 61b503835aa6..96cd6a078c8a 100644
> --- a/drivers/input/misc/drv260x.c
> +++ b/drivers/input/misc/drv260x.c
> @@ -537,64 +537,62 @@ static int drv260x_probe(struct i2c_client *client)
>  static int drv260x_suspend(struct device *dev)
>  {
>  	struct drv260x_data *haptics = dev_get_drvdata(dev);
> -	int ret = 0;
> +	int error;
>  
> -	mutex_lock(&haptics->input_dev->mutex);
> +	guard(mutex)(&haptics->input_dev->mutex);
>  
>  	if (input_device_enabled(haptics->input_dev)) {
> -		ret = regmap_update_bits(haptics->regmap,
> -					 DRV260X_MODE,
> -					 DRV260X_STANDBY_MASK,
> -					 DRV260X_STANDBY);
> -		if (ret) {
> +		error = regmap_update_bits(haptics->regmap,
> +					   DRV260X_MODE,
> +					   DRV260X_STANDBY_MASK,
> +					   DRV260X_STANDBY);
> +		if (error) {
>  			dev_err(dev, "Failed to set standby mode\n");
> -			goto out;
> +			return error;
>  		}
>  
>  		gpiod_set_value(haptics->enable_gpio, 0);
>  
> -		ret = regulator_disable(haptics->regulator);
> -		if (ret) {
> +		error = regulator_disable(haptics->regulator);
> +		if (error) {
>  			dev_err(dev, "Failed to disable regulator\n");
>  			regmap_update_bits(haptics->regmap,
>  					   DRV260X_MODE,
>  					   DRV260X_STANDBY_MASK, 0);
> +			return error;
>  		}
>  	}
> -out:
> -	mutex_unlock(&haptics->input_dev->mutex);
> -	return ret;
> +
> +	return 0;
>  }
>  
>  static int drv260x_resume(struct device *dev)
>  {
>  	struct drv260x_data *haptics = dev_get_drvdata(dev);
> -	int ret = 0;
> +	int error;
>  
> -	mutex_lock(&haptics->input_dev->mutex);
> +	guard(mutex)(&haptics->input_dev->mutex);
>  
>  	if (input_device_enabled(haptics->input_dev)) {
> -		ret = regulator_enable(haptics->regulator);
> -		if (ret) {
> +		error = regulator_enable(haptics->regulator);
> +		if (error) {
>  			dev_err(dev, "Failed to enable regulator\n");
> -			goto out;
> +			return error;
>  		}
>  
> -		ret = regmap_update_bits(haptics->regmap,
> -					 DRV260X_MODE,
> -					 DRV260X_STANDBY_MASK, 0);
> -		if (ret) {
> +		error = regmap_update_bits(haptics->regmap,
> +					   DRV260X_MODE,
> +					   DRV260X_STANDBY_MASK, 0);
> +		if (error) {
>  			dev_err(dev, "Failed to unset standby mode\n");
>  			regulator_disable(haptics->regulator);
> -			goto out;
> +			return error;
>  		}
>  
>  		gpiod_set_value(haptics->enable_gpio, 1);
>  	}
>  
> -out:
> -	mutex_unlock(&haptics->input_dev->mutex);
> -	return ret;
> +	return 0;
>  }
>  
>  static DEFINE_SIMPLE_DEV_PM_OPS(drv260x_pm_ops, drv260x_suspend, drv260x_resume);

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


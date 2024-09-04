Return-Path: <linux-input+bounces-6195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC0796C72A
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0511C22630
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7DD1E1332;
	Wed,  4 Sep 2024 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+1u5sJO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798F3144D1F;
	Wed,  4 Sep 2024 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476884; cv=none; b=exRN9EGA3a+oH0XqsFpKY+XIICGz8cwjJhBVnvTT4p8uqBOMzQ1nsrX/pRrMdOs5m0LR9redzHSlRA7hqUxnDl+nLmoa1K84Twsv5+h5JQuTwagqAQ9TZz+1exFWmahMs/niPwKUWhLkMNtjtwNJASq+1wuDnpht5G+jTLJO88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476884; c=relaxed/simple;
	bh=L7GGA6isL9sk3WgIb5rYcY24S93K1r+gpSakh26tuGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgeYJdFjoxp/goq0p/1UpOS13byux+gNGG0OXeRXNPtIo7kedYDVhM/bvDTiM7AcKgBIxV66nG9L+aIxyoEW1BY3eFczqvnTCTz1sMw/YEM6ocyWqSLrR811X7cDloywL+t2X0XKmyopvFo82TSuqwsjSJjFwg0ISvld3oIZau4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+1u5sJO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42c2e50ec13so41360985e9.0;
        Wed, 04 Sep 2024 12:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725476881; x=1726081681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yipMOlFNL6AWzla/tV7B3lWWx5Z3dJLVtpKaWTYRTnc=;
        b=i+1u5sJOGGDX2vbEj2BOK5CTldDvA6+A/kj14jyb4jzXfygWjw9ZAoQev7pj8CH9AI
         9w31EAkhWTweqiiGxr6eM0bhRTJy1B1B9pYKlRN3VhpXe4srLO1opcs9Rlw22N52JtR9
         yvRq7vi8UDe9KQw0eI/zIVe2epZmojCV83rLOuAe4PkAxfk4r25rkqUejDVm6YFJYxIv
         BC4hQcJhMaVzuQpWUevj+fyghvdtxYJm/FKxi7M9hOHb1yGgNPpME8OPX+Vnkf4s9BHq
         GvU/qiwQJy3E+/868wWeqIDLKmBI2ib9yaqqiElfu35rMYf3jBtutvE8lDnWMHW9ZRnW
         sVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476881; x=1726081681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yipMOlFNL6AWzla/tV7B3lWWx5Z3dJLVtpKaWTYRTnc=;
        b=MvCq+tfaRsJLaK43MJN3Y+dXgaqC6z+lqXv2DyyaAVHjB91eqgIcsVxx5pBUtvqQG8
         JSPd7Br7UqmMIv78Bc12WjZIy7p9iBUl0wRy81J7/DGimR3pFAoeWSLiVzexuLpJcpTd
         OOpdPsTtAonG1smFSaRPghWHKHKqf8o1XhrGk5r0ugBX7L8/q0uZkKqB92nOsbT33aJo
         z824eIjQlbRD79J3iru68iND9MxmGXTLR+nROy8xzBNhwkYSNZkvH0ViCVrnJW2mkhgw
         +1lFwX6FXO1Ebs8bU9e/x8SzI0BiVEjlnbX3FSN7E9aPhEu9sAXD8lJQFI4Teqbx/Cqp
         SmBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3slh+nwlWBqq1dcX2b9E9rfmYZ+pCDIkH/d8TZ5CFx6n4HI1c7iuyaY5Nd59Mjxg77NH0g0vhzBbIrUao@vger.kernel.org, AJvYcCWgGW4ZTQY46QrrAsJ58DbsJdarrcSPeXoHS8RoIZxx3WsqV1eOoy8sPi2gHJNURlJO12LOl39li/KqYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvt2JpWc1Axo57Ua1p4SOrljNBNn1mYuvbmqVyzPSVYp+wgNQk
	W/xaZ0DvAdxlMLCdWeRnGqKjRyr2kqMfJlG20sPMvnngbmdPwbvM
X-Google-Smtp-Source: AGHT+IFwJU/c4fY6qdhzEqLIJW0IlswT1Z/tEzRWQKZkTAVfnoPTP06pH/azW97swAhg5CRf7qBaJQ==
X-Received: by 2002:a05:600c:3b9f:b0:426:6e8b:3dc5 with SMTP id 5b1f17b1804b1-42bbb440c8bmr147510855e9.32.1725476880644;
        Wed, 04 Sep 2024 12:08:00 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb37f7849sm218340675e9.7.2024.09.04.12.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:07:59 -0700 (PDT)
Message-ID: <722f763a-2e0d-4178-be04-0717facea6d0@gmail.com>
Date: Wed, 4 Sep 2024 21:07:58 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] Input: drv2665 - use guard notation when acquiring
 mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044244.1042174-9-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-9-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/drv2665.c | 44 +++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/input/misc/drv2665.c b/drivers/input/misc/drv2665.c
> index f98e4d765307..77ec96c7db76 100644
> --- a/drivers/input/misc/drv2665.c
> +++ b/drivers/input/misc/drv2665.c
> @@ -225,59 +225,57 @@ static int drv2665_probe(struct i2c_client *client)
>  static int drv2665_suspend(struct device *dev)
>  {
>  	struct drv2665_data *haptics = dev_get_drvdata(dev);
> -	int ret = 0;
> +	int error;
>  
> -	mutex_lock(&haptics->input_dev->mutex);
> +	guard(mutex)(&haptics->input_dev->mutex);
>  
>  	if (input_device_enabled(haptics->input_dev)) {
> -		ret = regmap_update_bits(haptics->regmap, DRV2665_CTRL_2,
> -					 DRV2665_STANDBY, DRV2665_STANDBY);
> -		if (ret) {
> +		error = regmap_update_bits(haptics->regmap, DRV2665_CTRL_2,
> +					   DRV2665_STANDBY, DRV2665_STANDBY);
> +		if (error) {
>  			dev_err(dev, "Failed to set standby mode\n");
>  			regulator_disable(haptics->regulator);
> -			goto out;
> +			return error;
>  		}
>  
> -		ret = regulator_disable(haptics->regulator);
> -		if (ret) {
> +		error = regulator_disable(haptics->regulator);
> +		if (error) {
>  			dev_err(dev, "Failed to disable regulator\n");
>  			regmap_update_bits(haptics->regmap,
>  					   DRV2665_CTRL_2,
>  					   DRV2665_STANDBY, 0);
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
>  static int drv2665_resume(struct device *dev)
>  {
>  	struct drv2665_data *haptics = dev_get_drvdata(dev);
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
> -		ret = regmap_update_bits(haptics->regmap, DRV2665_CTRL_2,
> -					 DRV2665_STANDBY, 0);
> -		if (ret) {
> +		error = regmap_update_bits(haptics->regmap, DRV2665_CTRL_2,
> +					   DRV2665_STANDBY, 0);
> +		if (error) {
>  			dev_err(dev, "Failed to unset standby mode\n");
>  			regulator_disable(haptics->regulator);
> -			goto out;
> +			return error;
>  		}
>  
>  	}
>  
> -out:
> -	mutex_unlock(&haptics->input_dev->mutex);
> -	return ret;
> +	return 0;
>  }
>  
>  static DEFINE_SIMPLE_DEV_PM_OPS(drv2665_pm_ops, drv2665_suspend, drv2665_resume);

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


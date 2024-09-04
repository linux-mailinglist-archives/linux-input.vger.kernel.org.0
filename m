Return-Path: <linux-input+bounces-6196-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8DA96C72E
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44F2A283715
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B351D47D8;
	Wed,  4 Sep 2024 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQDOWEI/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB371D86F3;
	Wed,  4 Sep 2024 19:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476917; cv=none; b=PT6Tzk9DRls6RnAiv6mS+m619+J5b0OOlAh3PABAnqiGhNI/PWjx22HxwArKyBg1dNaV6ORZ2unauqCumX13aykLhaBU+tf+JxMM5pR2Wp2b0TGBH3H0Em6NG+Lax1n3FKQ3CyI8dglEKsigux0TSJIPAFN6aaxFEGJmNGxUo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476917; c=relaxed/simple;
	bh=WOC0KVQaIC+Ez7rpVKi5XegWm+QkGEaVsYCJsZVwoFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esk5w95I123CcdTQIwpC0b8CtH+tAaXzBonXa00h0rRIVmZtCUCghfQaHeKOoy174IX59gEqMOgf6/lLdK+SEQpn4BS4+xOSLO7EYdIgXZvi1VLCT9Cxz1+rK9CmiyVM/s4sIfpNKOlAvgeU+MD63Ku8lfMscMIjPt/GBJyVwUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQDOWEI/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374c6187b6eso2435171f8f.0;
        Wed, 04 Sep 2024 12:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725476914; x=1726081714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+PbdKYqcYY8UBkSLL1+3kF+MfoykQhHRCrgaxFJEqM=;
        b=LQDOWEI/77o4N7qs5I3Tqps3UI2rag/23d+IqSE65NioQnP1XW3leBNrAfmtoWM0w0
         H1SRChSt7tPG9xQrGwNos2PY7rKrHq5yLtmp/4MHf2dOQ47NN0PsvnSnLYjbNgyT7rvg
         a1FyRjzco3bJcdHqmnrPHIk5roPPt9Y12D1f2jCuemvmuxuNKpf+IN3nu69BhmdH+ubl
         WDDt0yV5I0nv+wFh2yu5p6H0aOF5oi86zMEnYMR7nD0uiH3fXdYfauddPy1g8JV5fUB+
         GWapKDe2157Y2F6dAV+lwn2QTTaLVvHdwDRV5fxu8wIQBTgw6RALGCASU25xieL4jVK+
         a2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476914; x=1726081714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+PbdKYqcYY8UBkSLL1+3kF+MfoykQhHRCrgaxFJEqM=;
        b=A1FRqPHhlVpGQqWaZXyyde10hTi/KSDwPggWPJNRwUZKSMvOLDAZYexE7jF0aK7dFp
         zDh/5rCZP3f5qI4Q3AtxCyBH0Yp4UOJEqbG21PYpaIkjeDFkHqAONbeL+uHbsIkCmFpq
         BAzhMpyxDLDc3hd1fr/Z1Wv9vrjaA8I2ifzfqpzl5fc7yxV/pDd+YxZaJg7ln99VoD7+
         6+cOJ3qyvpO8A+LqeVXnM9cAW89kwgrrXraQPOxX52ItUML6vKKt82cyNgSht88HtjBD
         u+Ft1Coao2TyrkLxSoOrN1Ymo/BSf03W95fqkbcYChUpdW75ZPEhGLZWcEVCmgQwbGlG
         UlwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCNDQfCFueDtTdR9e5b6tJ5qbFBRzRa+CQZJmbnEt7qu/HgHDJD1H8iXBqZ2DTuYZMfxvxAPtyRWEaw959@vger.kernel.org, AJvYcCVvFtScpP5U4XhsuKlc8ZfGtmMwdymIXHO2HEAjltuiiSdrHeUX0t2Mpje8y2iq+oEpWrz7kcxWnCZJEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyLLx73S9Hy9bF5Hgu2Stg98yny2eGs4o/Uh7zqShJi5nLjPDw
	89zLvGf7YLiCpcKIZlOiuluq+SioRC4vVdrbus+W6BE8pKX3tXMV
X-Google-Smtp-Source: AGHT+IFAVtpRq9uKWihUi+4mLZYLfw/TrlUESDmcMCr+BGR6u64Cm0yVd9mQsVnfR5/qNI33TY+S1w==
X-Received: by 2002:a5d:438c:0:b0:374:ca54:4065 with SMTP id ffacd0b85a97d-374ca5440a1mr7191643f8f.48.1725476914172;
        Wed, 04 Sep 2024 12:08:34 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a55fsm17546648f8f.10.2024.09.04.12.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:08:33 -0700 (PDT)
Message-ID: <8b860de1-9387-4865-8ea0-58eefae81fc1@gmail.com>
Date: Wed, 4 Sep 2024 21:08:32 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] Input: drv2667 - use guard notation when acquiring
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
 <20240904044244.1042174-10-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-10-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/drv2667.c | 44 +++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/input/misc/drv2667.c b/drivers/input/misc/drv2667.c
> index ad49845374b9..906292625f84 100644
> --- a/drivers/input/misc/drv2667.c
> +++ b/drivers/input/misc/drv2667.c
> @@ -402,59 +402,57 @@ static int drv2667_probe(struct i2c_client *client)
>  static int drv2667_suspend(struct device *dev)
>  {
>  	struct drv2667_data *haptics = dev_get_drvdata(dev);
> -	int ret = 0;
> +	int error;
>  
> -	mutex_lock(&haptics->input_dev->mutex);
> +	guard(mutex)(&haptics->input_dev->mutex);
>  
>  	if (input_device_enabled(haptics->input_dev)) {
> -		ret = regmap_update_bits(haptics->regmap, DRV2667_CTRL_2,
> -					 DRV2667_STANDBY, DRV2667_STANDBY);
> -		if (ret) {
> +		error = regmap_update_bits(haptics->regmap, DRV2667_CTRL_2,
> +					   DRV2667_STANDBY, DRV2667_STANDBY);
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
>  					   DRV2667_CTRL_2,
>  					   DRV2667_STANDBY, 0);
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
>  static int drv2667_resume(struct device *dev)
>  {
>  	struct drv2667_data *haptics = dev_get_drvdata(dev);
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
> -		ret = regmap_update_bits(haptics->regmap, DRV2667_CTRL_2,
> -					 DRV2667_STANDBY, 0);
> -		if (ret) {
> +		error = regmap_update_bits(haptics->regmap, DRV2667_CTRL_2,
> +					   DRV2667_STANDBY, 0);
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
>  static DEFINE_SIMPLE_DEV_PM_OPS(drv2667_pm_ops, drv2667_suspend, drv2667_resume);


Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


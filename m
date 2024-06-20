Return-Path: <linux-input+bounces-4494-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C635B910A0F
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 17:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4843B1F22907
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 15:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4044B1B150A;
	Thu, 20 Jun 2024 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yv6aWu0u"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12C91B1422;
	Thu, 20 Jun 2024 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718897866; cv=none; b=Yq51XR3RQD9kZR+7psLACSmuIqe8FL/KZjmHxfM0qjT7uriwmYclzhpc23mNOfv5VRq4gLXC4RIqhvIS824BidoTEyTsGY+hmwApnGB9uX/7CS1Pj3biViDbt8yNfExcJJjXv+wPOTiCU6EeIcJuzoM5lTByv5xY9jGfJ0FK7fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718897866; c=relaxed/simple;
	bh=RsIlLBhJcyE3XwRqtVP46pxZY2iyfW8Fw1s+960Es2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbYhhAXx/McBP61pvs66XIPlTuXg6AmlF7/ZNBNKYHpjEIubmPmuGinJqCGHBFuGwk786cIw894bMX4WIXSmVOtGD2kDwwKQi2XkSnmr8D4NECHDgPe8YkT6n3hX0Oq3uicDdbZdYzzo4CZA1DC9Y8Q8N/S3CsZIGAJE+mUVvPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yv6aWu0u; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70633f0812dso948513b3a.0;
        Thu, 20 Jun 2024 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718897864; x=1719502664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s+h387lf4ounMi+iVhkJYXBLUErzSRJimx+T0EIiAWQ=;
        b=Yv6aWu0umi75kF+yz3Ur3Wo2+DRG0PU621TduJ+cqqIN6cq4qRDX5KlayaO/lQopvA
         IqeCCc8LrQZ5JrSlrYL1TpVHH8Q7AIZH7JRoZfcO03uJlatIQWsBnoXhWNAwV37Aqr4g
         nvXPKUDlCHeEX7HEN/BTGXHtnwNIvXggWWUew1OGqTZybPZRLI9+Ks9Nj0Vlbwhcs5MG
         vgo9E60l5Ci/gzIiD9PlfWI4kVovAfBF2y07JeVrygM0ocZVTHsFfWdf3nuEve26K42o
         lw4tSjVOYYWXJNSqFrgKNvopdRFEy1y9Cm0wdcsllKD9LFWG0Z3GayVJJRmRrgWwMCeg
         aD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718897864; x=1719502664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+h387lf4ounMi+iVhkJYXBLUErzSRJimx+T0EIiAWQ=;
        b=P2gRBpdKPxG4+3aJ+Oyq8JHs/LNemjQTs2Bn5XMQ1VMshpXowdXd8ee/elG6+Kc1wS
         O20hIgms4dFpvnRP4UZ6wkM+/S1tTMh1DNUw+D5kgqf/m1PvEkSUVZIGlxjmFyZRK/bY
         Uu4TwfyHkLlCknXHsSHALsjnl1/U1gwODsTr3QltyLnLazVAM7TTGv8AJpAwS3UsKjwV
         87Okqj+XbTMOM2aD5346pfz7FG/1s4biAh9UPA+PEpn5MRVH99Xa8sHDJ+PKf1hf+LBt
         rukZyrEtlo3isbs76VAVOr+gYFDbgDXgKJJc5J8uboai7Djub8W2bWgrH1flA5kW9F8p
         3eMA==
X-Forwarded-Encrypted: i=1; AJvYcCV0BizlvR+v9XOp/Ky5Gififq+TN+naABANcMgjRFGszUQT4v+7ZWaIxt4yCVaS21MSxZC/fCm9xPdGRMpVb1z8Tzx5J6aPp8p1aoLR4bMJrQhv9NNwO5WOCQjDmGkQhlLcj+6Dqtf9Ttv1zDI1Z7iL/li26ok7XdbrccMt4y2tehhUxyhk
X-Gm-Message-State: AOJu0YyCiSZPe+9OfS6YUov4ATKxnO5DaLl5O2n7gCPtmWndmYnpxklD
	OohW27qZBFcSw9jQhcdD0bgnz/yFh7QBeaWi2ld3jZGEbX/Y7u5h
X-Google-Smtp-Source: AGHT+IEdhGZIHUC59cCIO/mixYH72/cV9kIvYVpyNXHNqjJuo4SpZGFWObBqJtoJBrKvWs1VeIZvuQ==
X-Received: by 2002:a05:6a00:189b:b0:705:cade:1f50 with SMTP id d2e1a72fcca58-70629d012c0mr7919791b3a.34.1718897863773;
        Thu, 20 Jun 2024 08:37:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:36d9:2b1f:59f:8e9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc91e133sm12441315b3a.24.2024.06.20.08.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:37:43 -0700 (PDT)
Date: Thu, 20 Jun 2024 08:37:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: nick@shmanahar.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4 1/4] Input: atmel_mxt_ts - add power off and power on
 functions
Message-ID: <ZnRMxONryyi5uZ8a@google.com>
References: <20240417090527.15357-1-eichest@gmail.com>
 <20240417090527.15357-2-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417090527.15357-2-eichest@gmail.com>

Hi Stefan,

On Wed, Apr 17, 2024 at 11:05:24AM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a separate function for power off and power on instead of calling
> regulator_bulk_enable and regulator_bulk_disable directly.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 59 +++++++++++++++---------
>  1 file changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 542a31448c8f..52867ce3b9b6 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -1307,6 +1307,38 @@ static int mxt_soft_reset(struct mxt_data *data)
>  	return 0;
>  }
>  
> +static int mxt_power_on(struct mxt_data *data)
> +{
> +	int error;
> +
> +	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
> +				      data->regulators);
> +	if (error) {
> +		dev_err(&data->client->dev, "failed to enable regulators: %d\n",
> +			error);
> +		return error;
> +	}
> +
> +	msleep(MXT_BACKUP_TIME);
> +
> +	if (data->reset_gpio) {
> +		/* Wait a while and then de-assert the RESET GPIO line */
> +		msleep(MXT_RESET_GPIO_TIME);
> +		gpiod_set_value(data->reset_gpio, 0);
> +		msleep(MXT_RESET_INVALID_CHG);
> +	}
> +
> +	return 0;
> +}
> +
> +static void mxt_power_off(struct mxt_data *data)
> +{
> +	if (data->reset_gpio)
> +		gpiod_set_value(data->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
> +}
> +
>  static void mxt_update_crc(struct mxt_data *data, u8 cmd, u8 value)
>  {
>  	/*
> @@ -3305,25 +3337,9 @@ static int mxt_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> -	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
> -				      data->regulators);
> -	if (error) {
> -		dev_err(&client->dev, "failed to enable regulators: %d\n",
> -			error);
> +	error = mxt_power_on(data);
> +	if (error)
>  		return error;
> -	}
> -	/*
> -	 * The device takes 40ms to come up after power-on according
> -	 * to the mXT224 datasheet, page 13.
> -	 */
> -	msleep(MXT_BACKUP_TIME);
> -
> -	if (data->reset_gpio) {
> -		/* Wait a while and then de-assert the RESET GPIO line */
> -		msleep(MXT_RESET_GPIO_TIME);
> -		gpiod_set_value(data->reset_gpio, 0);
> -		msleep(MXT_RESET_INVALID_CHG);
> -	}
>  
>  	/*
>  	 * Controllers like mXT1386 have a dedicated WAKE line that could be
> @@ -3361,8 +3377,8 @@ static int mxt_probe(struct i2c_client *client)
>  	mxt_free_input_device(data);
>  	mxt_free_object_table(data);
>  err_disable_regulators:
> -	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
> -			       data->regulators);
> +	mxt_power_off(data);
> +
>  	return error;
>  }
>  
> @@ -3374,8 +3390,7 @@ static void mxt_remove(struct i2c_client *client)
>  	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
>  	mxt_free_input_device(data);
>  	mxt_free_object_table(data);
> -	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
> -			       data->regulators);
> +	mxt_power_off(data);

This change means that on unbind we will leave with GPIO line asserted.
Won't this potentially cause some current leakage? Why do we need to
have reset asserted here?

Thanks.

-- 
Dmitry


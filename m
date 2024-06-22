Return-Path: <linux-input+bounces-4561-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D33559132BA
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 10:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A3D9284867
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 08:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBB214AD0D;
	Sat, 22 Jun 2024 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie1VabeU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FEF376E7;
	Sat, 22 Jun 2024 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719044467; cv=none; b=EopiFB57SLV9pg7MIcWOBYp48SuP+PJ3gYrosjXgLWbL0p4DmF6dXggX8zKvzXvSXIOmXkhW3qZg+P/VLihkfZgek3EY4UKybuXiONrTPiKa/4z1sPuQ+yDWB9KbWd0C0Uhqn2Zs526mLDdA/+NAH7BTDw7aGwgalU7k9Y4NO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719044467; c=relaxed/simple;
	bh=VEQ15w085ucv6hv/bbJz6/KokNRIvSOvXcyfUrg3DYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPH3XxDTMpkmGocnOV14aXyOERzNxNSj8t/eL6/xOJ5+oEgWXQz7eHmtnjvUUZXQzDm0CW1sp3XPJ8I2oCjYC2oVz+E8Vl4SCLWss8/PzDJytg1RmZtNykaY92t/kg093E1gYm9Bs0O2/TdLITDiKa88P3MTxJ+s0GOtD+nHoO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie1VabeU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-70b2421471aso2011791a12.0;
        Sat, 22 Jun 2024 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719044465; x=1719649265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2D16OwazkGDYbKnGneFBjhT7c55Frq79Esclmq6VK8=;
        b=Ie1VabeUwyFFA9ipgSUwjZGLBvfjsVmH/b8t7T/p/Jfk6jl4NFplQnjKNYZe9C3a3c
         HgJ4+1uOFwB5cU010iurJQX3gFoFU9jmYzk45pcHg8cdnia/c9f9I2j3oMJcnCHt5a4a
         xKF7dJlOrVv2vgtgtqReoSodQNcwdkk0TMvR7LrIJla1+BV4IH0nhNnOzEPy7EKLA8JD
         3a9G3BoDQS7eNY/XcYO0eWJ2OD6ezFQwjTHvOOihbGJmGYiBT6wpABjPfcu6Oir0o4j/
         YZO5Zq/oO/qxALThV+0WhWOc/jAoIHDRncku1EyK2IQjXf5zDYSrq4povQ0np/ujMwlc
         aX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719044465; x=1719649265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2D16OwazkGDYbKnGneFBjhT7c55Frq79Esclmq6VK8=;
        b=C4xGLqN5dVzLgqghEn+CEntcLuGLZ4LqxkVig6NeOWcBllNnY7QvndsLe0KuRqiKcx
         IabFI9GBtrg3w16/xt8jF5IQb4k8rEYi55x8HqoEYtPJS8OYa7d0Qxq6nHghJOYDynWR
         2G+c9HXZ3wFZLXRdirywKWwKY0Dk5kyMrTlLQrtmGXhGlHXrk72ED8w5kAhxdQbR1Nkt
         RrLB0W7sBIc0MMb2bjqJe+pHEheWx2DQz1hHbwi48aNjSfHWO7uRNRR9hgmj7xW3mj4E
         m+GYCXViD0vbR5/nVuGOMW4fNr8NHXn82YdeZFONkfpt7aQVMw9uRtNj08YfikCBp3Kj
         RTPg==
X-Forwarded-Encrypted: i=1; AJvYcCXh0BBOESE974W9YCQP4ZF8UqNjEFOVzQ78agEqfabWFS2sfFUs9tk1Coxh04UJOhVtO3pZMfk3HjG0n0IaaP0Xj7Kagq8VL4E1TJLq2yJvDz4/1by0Nk3LHOc9WcdAOlgMrEBpd67TGP0=
X-Gm-Message-State: AOJu0YwNcwf0Rx1hU8xKE5dsQs2RNjWF+R3+tm2syqw/4s4Tsd893Wx2
	4WunJQwizEV0B5zmbZEViinDlWXJv1jOKt2cllZaJt5lmUPQCU6t
X-Google-Smtp-Source: AGHT+IGyewybrzmmQWedWZJ6utBpDNQKs30KQ2in5Wb/vf6wkHBgEjIdGXop7cUG1q9oCU2ZfF3qlg==
X-Received: by 2002:a17:90b:182:b0:2c7:8d53:dece with SMTP id 98e67ed59e1d1-2c7b5c8ab27mr9693815a91.24.1719044465407;
        Sat, 22 Jun 2024 01:21:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d2ec:59a0:2c5f:4460])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c844f55783sm808069a91.7.2024.06.22.01.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 01:21:05 -0700 (PDT)
Date: Sat, 22 Jun 2024 01:21:02 -0700
From: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
Cc: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
	"Bimpikas, Vasileios" <Vasileios.Bimpikas@analog.com>
Subject: Re: [PATCH] adp5588-keys: Support for dedicated gpio operation
Message-ID: <ZnaJbqXcABKGIj83@google.com>
References: <SJ0PR03MB6343CB033C1005A36B102BF89BC92@SJ0PR03MB6343.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR03MB6343CB033C1005A36B102BF89BC92@SJ0PR03MB6343.namprd03.prod.outlook.com>

Hi Utsav,

On Fri, Jun 21, 2024 at 10:44:12AM +0000, Agarwal, Utsav wrote:
> From: UtsavAgarwalADI <utsav.agarwal@analog.com>
> 
> We have a SoC which uses ADP5587 exclusively as an I2C GPIO expander.
> The current state of the driver for the ADP5588/87 only allows
> partial I/O to be used as GPIO. This support was present before as a
> separate gpio driver, which was dropped with the commit
> 5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
> functionality was deemed to have been merged with adp5588-keys.
> 
> To restore this functionality, the "gpio-only" property allows
> indicating if the device is to be used for GPIO only.
> When specified, the driver skips relevant input device
> checks/parsing and allows all GPINS to be registered as GPIO.
> 
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
>  drivers/input/keyboard/adp5588-keys.c | 30 ++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
> index 1b0279393df4..78770b2dfe1b 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -719,7 +719,7 @@ static int adp5588_probe(struct i2c_client *client)
>  	struct input_dev *input;
>  	struct gpio_desc *gpio;
>  	unsigned int revid;
> -	int ret;
> +	int ret, gpio_mode_only;
>  	int error;
>  
>  	if (!i2c_check_functionality(client->adapter,
> @@ -739,13 +739,17 @@ static int adp5588_probe(struct i2c_client *client)
>  	kpad->client = client;
>  	kpad->input = input;
>  
> -	error = adp5588_fw_parse(kpad);
> -	if (error)
> -		return error;
> +	gpio_mode_only = device_property_present(&client->dev, "gpio-only");

Do we really need a new property? Can we simply allow omitting
keypad,num-rows/cols properties in case where we only want to have
GPIO functionality?

In any case this requires DT binding update.

> +	if (!gpio_mode_only) {
> +		error = adp5588_fw_parse(kpad);
> +		if (error)
> +			return error;
>  
> -	error = devm_regulator_get_enable(&client->dev, "vcc");
> -	if (error)
> -		return error;
> +		error = devm_regulator_get_enable(&client->dev, "vcc");
> +		if (error)
> +			return error;

Why regulator is not needed for the pure GPIO mode? Please add a
comment.

> +
> +	}
>  
>  	gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(gpio))
> @@ -790,6 +794,11 @@ static int adp5588_probe(struct i2c_client *client)
>  	if (error)
>  		return error;
>  
> +	if (!client->irq && gpio_mode_only) {
> +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n", revid);
> +		return 0;
> +	}
> +

What is the reason for requesting interrupt in pure GPIO mode? Can we
program the controller to not raise attention in this case?

>  	error = devm_request_threaded_irq(&client->dev, client->irq,
>  					  adp5588_hard_irq, adp5588_thread_irq,
>  					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> @@ -800,6 +809,13 @@ static int adp5588_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> +
> +	if (gpio_mode_only) {
> +		dev_info(&client->dev, "Rev.%d irq %d, started as GPIO only\n",
> +				revid, client->irq);
> +		return 0;
> +	}
> +
>  	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
>  	return 0;
>  }
> -- 
> 2.34.1

Thanks.

-- 
Dmitry


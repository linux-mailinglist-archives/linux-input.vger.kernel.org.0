Return-Path: <linux-input+bounces-6199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799C96C736
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA2741C22C7F
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711841E4136;
	Wed,  4 Sep 2024 19:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqDmaGYx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA741E4134;
	Wed,  4 Sep 2024 19:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725477175; cv=none; b=Rn9pjbWmExz1zJcfxVJo00EAYKA1Ncu7dwvC+Y7IFR2hQRJB80DZC6eHuxr5aXYmTBNL+8z6nNtfOlgX/0bTrGn+8drjGRnZ0Muq+rQTZcjie/MUbLHU5knLY5Auh+otsrzM930kkEtDGWDWgul7R26OogaEfK1eZ+GPRc1KMmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725477175; c=relaxed/simple;
	bh=wCYCLUtZdmkEmE+1Wad9UcwehTklVDln9Rys9/ACRmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxgMEb102Ew+k1Xh+qdZksHUKV+nylq6Pqkxw0OEIggbNKlXb7IeZ2Fk+RW1GZq5WnS3v4MYMUiaQMCdwSsPs1xl69yntYNYXOcl3rAoqL4NHDiKeVDumJh4tbzDuYuRrR9ZUk1wNvLciUX4wG5x/U+m9jXnPCEt/nHbdll0Tz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqDmaGYx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c218866849so7478884a12.0;
        Wed, 04 Sep 2024 12:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725477172; x=1726081972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gH2vs2W0YRDv0r05EvTEiZvNKk32s2QRA9UbMJtEfIc=;
        b=QqDmaGYxVIg5DUDT4c2jFMjYhMiVNkas902A7t998sNy6fBAZnu2eD+Zgzhg5OoxXj
         RJa7Ee+Ccrlm2X9s+iWgNatIAdksjjLgzz+/Bp8S8Zuz7J+CRarVxP93NA4ADyH6xFKA
         KIa4GaWwBnetRnM5VGBM4iN8zXkT6rhZF+ISpRwwnX+lCyRx8BO28QI/LopiGnNCzMP9
         LCXDbRkBmiLN+n4U1WAR2lIa6Nj49L0aQTso3uWxAAbk0C8HXr1xp3D54Hr7yhBXxGMP
         768pvNMr8MLvGyeqv4hD0eNOi3Dos10zx1KG9Ryg6/YD+9F7xjS8nmVGRuAL4oonn19h
         J8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725477172; x=1726081972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gH2vs2W0YRDv0r05EvTEiZvNKk32s2QRA9UbMJtEfIc=;
        b=ABMqRGWanbmRFGOZ+M7DLuE1347WHDYOGUMnjFPEl/uhDhAQrq+fKtDJTAdxFD6upf
         gvas6PKk5ycjmaJRpE0UhNqV8xH6OdkjYrKgzaHX/AC64Qy514+XKMpmQePumag2SS5D
         +BSo4lYapqtMnDsbxUz1W7iK6ePGxVa5HG8oeGVcF2WWM9zGfpqeeuAYfuj1weSLzCjF
         qshv6lHCGw+D7PgbJJ3A1OLMNohzBDHuzn7IxSzfDkdskwFB8B+MWS/NgV8TzK6/Vm0w
         82tBKPmrZsa9p8PWYdHaZ2IYEDQ1oOu9NO6T0hSR0q5LNsc2dnX8je+0y1vTesAjfkq/
         rStw==
X-Forwarded-Encrypted: i=1; AJvYcCV3zfaywQb4wKiSEGIvt1syX6iyVwTUKA/Ad2yG5uh9y8QP8qxSOH5zogGhUPTs7yxSKYLxsWWbgPLG3lb8@vger.kernel.org, AJvYcCVhckSgPsU1H+OyqNf97/KpwneOfN82Kf69k6LEDPUvjA7vaWm3DyQbYalPoPLxuY1tEX7Y62bAUhbMrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwckjiA1PMyopO3P0nTRBM48xvo5Ui9mFuo2TpnJdcKO6aWHiRW
	a0ORg6kb8U8F5vrVe6xRc6svegv48MsteSy5sRCnnoh7i1zU7v93
X-Google-Smtp-Source: AGHT+IEmt4zEeI86HuhxjThHhCTgH58WPgsvbNY+5QG8P040d8PVvZsuJCPZG2HjFU8li7tRjEGzYA==
X-Received: by 2002:a17:906:6a1e:b0:a86:83f8:f5a2 with SMTP id a640c23a62f3a-a89b94cef24mr1347679966b.19.1725477171955;
        Wed, 04 Sep 2024 12:12:51 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623a6fa6sm25601866b.170.2024.09.04.12.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:12:51 -0700 (PDT)
Message-ID: <c0040ed2-2877-4acd-9cf7-101d40cda642@gmail.com>
Date: Wed, 4 Sep 2024 21:12:49 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/22] Input: max8997_haptic - use guard notation when
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
 <20240904044834.1048468-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044834.1048468-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:48, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/max8997_haptic.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
> index 11cac4b7dddc..2853455daef2 100644
> --- a/drivers/input/misc/max8997_haptic.c
> +++ b/drivers/input/misc/max8997_haptic.c
> @@ -153,19 +153,19 @@ static void max8997_haptic_enable(struct max8997_haptic *chip)
>  {
>  	int error;
>  
> -	mutex_lock(&chip->mutex);
> +	guard(mutex)(&chip->mutex);
>  
>  	error = max8997_haptic_set_duty_cycle(chip);
>  	if (error) {
>  		dev_err(chip->dev, "set_pwm_cycle failed, error: %d\n", error);
> -		goto out;
> +		return;
>  	}
>  
>  	if (!chip->enabled) {
>  		error = regulator_enable(chip->regulator);
>  		if (error) {
>  			dev_err(chip->dev, "Failed to enable regulator\n");
> -			goto out;
> +			return;
>  		}
>  		max8997_haptic_configure(chip);
>  		if (chip->mode == MAX8997_EXTERNAL_MODE) {
> @@ -173,19 +173,16 @@ static void max8997_haptic_enable(struct max8997_haptic *chip)
>  			if (error) {
>  				dev_err(chip->dev, "Failed to enable PWM\n");
>  				regulator_disable(chip->regulator);
> -				goto out;
> +				return;
>  			}
>  		}
>  		chip->enabled = true;
>  	}
> -
> -out:
> -	mutex_unlock(&chip->mutex);
>  }
>  
>  static void max8997_haptic_disable(struct max8997_haptic *chip)
>  {
> -	mutex_lock(&chip->mutex);
> +	guard(mutex)(&chip->mutex);
>  
>  	if (chip->enabled) {
>  		chip->enabled = false;
> @@ -194,8 +191,6 @@ static void max8997_haptic_disable(struct max8997_haptic *chip)
>  			pwm_disable(chip->pwm);
>  		regulator_disable(chip->regulator);
>  	}
> -
> -	mutex_unlock(&chip->mutex);
>  }
>  
>  static void max8997_haptic_play_effect_work(struct work_struct *work)

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


Return-Path: <linux-input+bounces-6192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 116CC96C702
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C23F4282918
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D520F13C3CF;
	Wed,  4 Sep 2024 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN03ldjK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280F913213C;
	Wed,  4 Sep 2024 19:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476545; cv=none; b=pCm8UPP9Eo7co+h3yaj2sqRIBP4bCPXqpMpNxom1IvhG5gBpeCB08GUPFgxPlfVTFsCWKnV+C2AZg/fUjZ34SYNi12bOXFSLIyNVNTN0unv+B/yxIvzBeDrW1Gq0rWtLz8UudYg4QkoxCGctMrMJhmp1QImT+ySwe0c1xyrc4vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476545; c=relaxed/simple;
	bh=HjIWWMumuDgvU0ntwXS8HycrEl8BW4+Jtf9AtY5EUVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dy+SXxwjRMXQlyzh1VemBBLznz6xhy9Qwr14vJGGv5wafcMwCMWL4zgzUsChPpq3oim1/hwiBEdT69H1kG7UwkXvNzQ6kXkRJKPLyn42vbe+biFE8j1UukTU4bx6eubkuugSnVR33LNNa8N2EOkats1UlDGNYLIrmI9787G3zIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN03ldjK; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c24c92f699so4846974a12.2;
        Wed, 04 Sep 2024 12:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725476542; x=1726081342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKQQy5nIVs9/+b4e20CQPjhxPiV/5+Cu9tm77K8JZuY=;
        b=DN03ldjKW1wIX2iPIWqGz2IU5FS158Wk9W7h7xH0ZoHVAkx06Dtxolt2BNCO8+dXZN
         ugAB43viwZqVAqmQqaRsTeK/OD2sL7YToMi8qKSLe+uL+GM26HslnlxSgqmnrNK3j0ol
         a7maHH8pjL+XRrHpJv80rD/Ez5bjTNl5orAgqntNPwkhxHM48ZzitBHRSDfOTFfu+ITz
         cAO3uTvucfcS4Cj5oUfFY/shQFGRju7S1jNxOCl4nLxwoPu1q0XLfP7jTziBXOuc/HYd
         MPZdp4h+dqliNIT7CC2QUfp3RHXiP/FIWBAXa6xCExYnUgJFOHUzmEWysziWVaTCdXYW
         k5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476542; x=1726081342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKQQy5nIVs9/+b4e20CQPjhxPiV/5+Cu9tm77K8JZuY=;
        b=vkJkVwuBTBn6yjj0caXeGszN9Opuz+yzCeoT0zzCHlYFBtmo04D6YkwzDbuFOmtETd
         DBbgVwpSD8uW5WuwGcWuWdcBrKtxMI++4b+tOlWDgZKI2ZoYF763fH4SWV/C/Aq/7lFx
         I6eEE1N5QEo+8sWvFtXi6P1YOqCHh1Y+uxfHtvgzrIENQAq2tiCfi3joUhCgMmakqj5C
         4O1eT3T3LiU6+xQkciD8g7PX/oWh6udl2nGK4RTKeYlcAQKf2GkOTdVu3Y4kV5LbDpUf
         A0bPEgR7Kxawu0FrwoETr2v3JwAZ1jsSrbthy6TH6pK5ixOscjVlAl6KMksyAbuEYoKH
         X8hg==
X-Forwarded-Encrypted: i=1; AJvYcCU+8Rz2QUjtI1qi4btNy8F1fbzky9PJGPPEISX5dhkJOtzafc/o5yvoFJqYNy0A6ud+/Yi06+n1eafMcyL0@vger.kernel.org, AJvYcCW6DzMUhiWVNo0farVY3SqRg2n7C1H/bkfzjcWGEGuEWZPmj662UZ6FT/0I486zRCrHd0ELhpd6Hpm1ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmKRav6V6udxJgxfo267Rxa/6yUYCKEN7mV58Xj+fQshZjCtBo
	yOFTkF1HBNMBM0eRPZuITkIMM+grNQJ2m19NOeKCD0acdz/8vX457zGI8wtE
X-Google-Smtp-Source: AGHT+IHmQnnfzoEoyjbzkXQjjedHB8Liabp3HAVxGBB3iZ0td/jnJhv0Ellp0Buwc7/bQ3+Avku9mw==
X-Received: by 2002:a17:907:969e:b0:a7a:ba59:3164 with SMTP id a640c23a62f3a-a8a32f9f203mr433611066b.53.1725476542084;
        Wed, 04 Sep 2024 12:02:22 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623e56basm24197966b.220.2024.09.04.12.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:02:21 -0700 (PDT)
Message-ID: <df3cc6e6-f6c2-4025-850a-3bf8449bd95d@gmail.com>
Date: Wed, 4 Sep 2024 21:02:19 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/22] Input: da7280 - use guard notation when acquiring
 mutex and spinlock
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044244.1042174-6-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-6-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that locks are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/da7280.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
> index 1629b7ea4cbd..e4a605c6af15 100644
> --- a/drivers/input/misc/da7280.c
> +++ b/drivers/input/misc/da7280.c
> @@ -1263,39 +1263,37 @@ static int da7280_suspend(struct device *dev)
>  {
>  	struct da7280_haptic *haptics = dev_get_drvdata(dev);
>  
> -	mutex_lock(&haptics->input_dev->mutex);
> +	guard(mutex)(&haptics->input_dev->mutex);
>  
>  	/*
>  	 * Make sure no new requests will be submitted while device is
>  	 * suspended.
>  	 */
> -	spin_lock_irq(&haptics->input_dev->event_lock);
> -	haptics->suspended = true;
> -	spin_unlock_irq(&haptics->input_dev->event_lock);
> +	scoped_guard(spinlock_irq, &haptics->input_dev->event_lock) {
> +		haptics->suspended = true;
> +	}
>  
>  	da7280_haptic_stop(haptics);
>  
> -	mutex_unlock(&haptics->input_dev->mutex);
> -
>  	return 0;
>  }
>  
>  static int da7280_resume(struct device *dev)
>  {
>  	struct da7280_haptic *haptics = dev_get_drvdata(dev);
> -	int retval;
> +	int error;
>  
> -	mutex_lock(&haptics->input_dev->mutex);
> +	guard(mutex)(&haptics->input_dev->mutex);
>  
> -	retval = da7280_haptic_start(haptics);
> -	if (!retval) {
> -		spin_lock_irq(&haptics->input_dev->event_lock);
> +	error = da7280_haptic_start(haptics);
> +	if (error)
> +		return error;
> +
> +	scoped_guard(spinlock_irq, &haptics->input_dev->event_lock) {
>  		haptics->suspended = false;
> -		spin_unlock_irq(&haptics->input_dev->event_lock);
>  	}
>  
> -	mutex_unlock(&haptics->input_dev->mutex);
> -	return retval;
> +	return 0;
>  }
>  
>  #ifdef CONFIG_OF

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


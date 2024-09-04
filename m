Return-Path: <linux-input+bounces-6190-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4C896C6C7
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D390C1F22283
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 18:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEFD80638;
	Wed,  4 Sep 2024 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBphdCFl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9409241C6D;
	Wed,  4 Sep 2024 18:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475910; cv=none; b=f5gESBK9w46mbeO+tiYX5VQWEcIjuudGY1hRYXnIn1RttKTJZuk7Uf5oX4b8CkmXnXfBo1dU4leb8sq8wKreQtXgf9lOS4OuiLHFZ1WsaeseF+6pQJlhlj3XxEgUFHZvV7hI7FOGvP/V7YWDqbXEIREx/+MNy/SJ3NgaAiAvWOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475910; c=relaxed/simple;
	bh=S7ANaOjOS0/UVI7RttLfBJryr1w8z2bqPqzuLmoWV3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/8aUvrxs0E0NyjNvt1zVo3F9xs6P+fufwes6miWk55DSvHpcVFu62QOWu0Yq9H7KcYrThcmjo72SET8/FL3ktOJ0pswygfs9SBOYmFKZa05cnrtJDK1ntKGga4PWxL2NmuQcFrE5UKupaf3ICM8uOK54QTX1npAF1YCuwwCT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBphdCFl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-375e5c12042so1418439f8f.3;
        Wed, 04 Sep 2024 11:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475907; x=1726080707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fW4EqVtvqSkqNkXayyW+rysLJX9gt9nn1XoHZPEUvvk=;
        b=FBphdCFl8pZ0iHjVFbcLYagbeyXqLsaI3f+20+ljgJgoK11soBGa/dY9hQMn74R8GS
         Qh5+tIa2Yja35Hj5TZRU98+BlW8ynKdG6+Z8VVdZLETMfCpc0CbSpWX9KC9rdzmz5GFw
         zAUiAHVsOprQ+9jUB+paPxWcNba3g+58/CjP5wE7T/ewHltwvOlLi7dtkIyean+DXlmO
         urmGuxT5nijOefQcBSel9lcDg/uNA2UwCIc6qnkdEw3vTlhOY1qj0Jby4LzXOPGPzA0G
         63RaLQ4tc1zpj7uBzKBChmTiySfiJzqQFYQzUzaJp9DgjB80uEFwSUPpYlWH5kJiiNpJ
         OJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475907; x=1726080707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fW4EqVtvqSkqNkXayyW+rysLJX9gt9nn1XoHZPEUvvk=;
        b=bBgPTLXpVSn8luz7ypRW6M5nnsJNUismGn7qRD4k5S/ibYVk9IMfh9hLB0ZV2KJGRs
         t5fk6IpkdXpnSyheRzYY8cocrHfRWOH6xI0AANqdD5f4KL2YfYrcg21uY9uchuhSuxM/
         rmDd6/6X2MOjs58WK+0ZCXpgL0GSN0fJC/MtfFG6IPyoQPAncqa6hZfVsVf3mb8cagwI
         aq1atVmfepcKAycXNEG0C9M207AItZyTLoLTvqznxjnYDFXkbOhx05pk7m3R1NNNW7bM
         CZxn0wUaKYDzcu3rCnKTHUR/9DdiJJjYfsZN5PTS02SrxnA5BHn8cuXdV1z5zCBnpLgi
         pRew==
X-Forwarded-Encrypted: i=1; AJvYcCUlfNRPzg9dq6LU55h1Fo5y3LKAybtjbO/aTcMMt7bHcqbTv2VxFv7nxR0bxBng4P495HpxzONL2OLbIune@vger.kernel.org, AJvYcCVDKG7QZnSJaU6tml+fQ7r6WQV8w52B1KuEFen21A3qzNB91Q9KlwmldKUlRmsm21aCE77ilWT5zEHlOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvZ7hPSFBtGyyP3rtU4HCaJObgcs2CSuGaynQLFwEruENoI1m+
	xQ4X0Kg9u3rOkPiw1ynf/yKXy7w6SPqMpcWWZaLS3GmC/fReP9nME8B/LrTi
X-Google-Smtp-Source: AGHT+IG+sXLiPuCyn2kurxXAufIsTg5c1aj/+xB6YBHAHDftILl3WNZn+FG2/US+2StPaQwOMd9++g==
X-Received: by 2002:adf:a451:0:b0:374:c57b:a909 with SMTP id ffacd0b85a97d-374f9e476aemr5696057f8f.48.1725475906715;
        Wed, 04 Sep 2024 11:51:46 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27467sm211362285e9.38.2024.09.04.11.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:51:46 -0700 (PDT)
Message-ID: <8289d6af-5956-4d75-854a-a91a8d1648e8@gmail.com>
Date: Wed, 4 Sep 2024 20:51:44 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] Input: cma3000_d0x - use guard notation when
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
 <20240904044244.1042174-5-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-5-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/cma3000_d0x.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/misc/cma3000_d0x.c b/drivers/input/misc/cma3000_d0x.c
> index 0c68e924a1cc..cfc12332bee1 100644
> --- a/drivers/input/misc/cma3000_d0x.c
> +++ b/drivers/input/misc/cma3000_d0x.c
> @@ -217,15 +217,13 @@ static int cma3000_open(struct input_dev *input_dev)
>  {
>  	struct cma3000_accl_data *data = input_get_drvdata(input_dev);
>  
> -	mutex_lock(&data->mutex);
> +	guard(mutex)(&data->mutex);
>  
>  	if (!data->suspended)
>  		cma3000_poweron(data);
>  
>  	data->opened = true;
>  
> -	mutex_unlock(&data->mutex);
> -
>  	return 0;
>  }
>  
> @@ -233,40 +231,34 @@ static void cma3000_close(struct input_dev *input_dev)
>  {
>  	struct cma3000_accl_data *data = input_get_drvdata(input_dev);
>  
> -	mutex_lock(&data->mutex);
> +	guard(mutex)(&data->mutex);
>  
>  	if (!data->suspended)
>  		cma3000_poweroff(data);
>  
>  	data->opened = false;
> -
> -	mutex_unlock(&data->mutex);
>  }
>  
>  void cma3000_suspend(struct cma3000_accl_data *data)
>  {
> -	mutex_lock(&data->mutex);
> +	guard(mutex)(&data->mutex);
>  
>  	if (!data->suspended && data->opened)
>  		cma3000_poweroff(data);
>  
>  	data->suspended = true;
> -
> -	mutex_unlock(&data->mutex);
>  }
>  EXPORT_SYMBOL(cma3000_suspend);
>  
>  
>  void cma3000_resume(struct cma3000_accl_data *data)
>  {
> -	mutex_lock(&data->mutex);
> +	guard(mutex)(&data->mutex);
>  
>  	if (data->suspended && data->opened)
>  		cma3000_poweron(data);
>  
>  	data->suspended = false;
> -
> -	mutex_unlock(&data->mutex);
>  }
>  EXPORT_SYMBOL(cma3000_resume);
>  

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


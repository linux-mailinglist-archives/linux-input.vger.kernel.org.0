Return-Path: <linux-input+bounces-6193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC496C707
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5111F22FAD
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C157113DDC0;
	Wed,  4 Sep 2024 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ywgeqhmx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911313D61D;
	Wed,  4 Sep 2024 19:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476618; cv=none; b=lNogE56UtWhxJACufPOHvKnoCLwiNsGnH52zMxyYpdPVTV+EtdGMnZsCIhIOM8Z/pLQmZHtB2Gfta3U0KBSGxWB0mPCDGAkX1SrlllffaeUgIUaF9t4vqKE9CvEh2mbmkfDzL1Lu6bvNfB/srSN4bj2nhEmYEec4YyV5cng7Zck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476618; c=relaxed/simple;
	bh=yAT8a9Q7jclre9eYolMiSk/ZLXfIdIkUokiVaYj4HII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SsCxynZMGsH/KiSLVpkrJ4UCnMaYwiEPxwXpeqW9APuASRu91gh+eVlAKuYCq3f+4OY/P7sTjFFXOnQT4fXWfXO5APy63KYsWdxbKtxCpeHAJApCZboBP0Qw9nPvIUf9qfDJTQh14h5df8A3gHAEhP9f+P7LBYiEjcL+mBcQTHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ywgeqhmx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a869332c2c2so198050366b.0;
        Wed, 04 Sep 2024 12:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725476615; x=1726081415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szFtxgewi3Mq4G6bvUltwe1shiFypazXnx5Zk6Fu5rQ=;
        b=Ywgeqhmxlz5/lDdvwnY8ncJGUa+MAu7ArB849I2s8LwIrPlmVPF6sD4OppLKZuH4Rc
         UTtf37nid6Z7BfHDARpV7jNnzMYlS6eg1cs5rTHdF5jccVFLmONaYj+bS5EXVzJk4+JQ
         vwDEen7p03e13+q95+e2uFFKatSwpuTqLn4GTFx3nEfo32aEMNlHcKVQ1SbWGwkw4qBA
         MqXvoMciQEA6M08OtFKEpzcqUUVeFPN1V7ZOZr1KwKBPyaJWYp0sxZUm9JYAMl2FnTmb
         mnPPfM5lkTMny/GLQzSKJID5WItkpM8Z8wNqQ/ARnj2QWoDPULJLnIPrMOVbiRLYRG6L
         IB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476615; x=1726081415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szFtxgewi3Mq4G6bvUltwe1shiFypazXnx5Zk6Fu5rQ=;
        b=ceKX/uXcmEJWfM8TfVfg+tmCQnNsmsY6odBFmzQJYZxrarLxDCTmEi47IhMAVh3uc0
         atBuB78ccU9Ntt12aUcgDDa5h27xaiZ537wnoG6ld/9jipCUOhGoeRqQjckX3+QhCOyf
         Dz6HbOxYvUZKviN4+KS5TiQIy14kc4LpLKOHqywDWbqk7XL1xAki++pMq27hWwYHcxXB
         J/4rdYNF8ghV4eAxzKW+B6rvyWP3aJ194j2YpyZNt69krGzIRuT71UQHy8VsV4RiDhWp
         Q+e6j4MeYsY8SUCme38Bom8b1jw43rDDon4nDh+1NncGGHpYfRCAy29XBJHKRa8eLSkN
         jJEA==
X-Forwarded-Encrypted: i=1; AJvYcCVm/d+/rvNLs8RAuWfY7ZAb6IGBv8Cvh1l/OYxFWRHz+fsHFzx/3PPwiWzIYNJvQmoz5iDO664Y2huR9g==@vger.kernel.org, AJvYcCWs4QnNGSw7wfI7P9bADM5nJGcaS66o7/HQxpnVcbcDScJ2zfQ2A67ufHlWYdwLCvTs9qm7iXEzKY6QsJuK@vger.kernel.org
X-Gm-Message-State: AOJu0YyQvSSMnXMqgAAECLlDC6DTSSmcr4FizCYeS166uYV+UdLSyeLN
	oE7rUFFYqgZoz4kr1/3AiZjpa6XcvU1ZizrEFpEjU+1X7JuYWqV7
X-Google-Smtp-Source: AGHT+IGno6GnieACYAoc4nRRKzJHQPyYDPcueFLc14Kpp7aDQDQ8w8v60YCOfnrUcdNtTlJyrNEoDA==
X-Received: by 2002:a17:907:2d8e:b0:a6f:996f:23ea with SMTP id a640c23a62f3a-a8a430adb51mr366814666b.15.1725476615163;
        Wed, 04 Sep 2024 12:03:35 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623e286dsm24342066b.211.2024.09.04.12.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:03:34 -0700 (PDT)
Message-ID: <225a9ea6-bc40-4c7c-a8dd-1db7649eaace@gmail.com>
Date: Wed, 4 Sep 2024 21:03:33 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/22] Input: kxtj9 - use guard notation when acquiring
 mutex/disabling irq
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044244.1042174-7-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-7-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released and interrupts are
> re-enabled in all code paths when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/kxtj9.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/misc/kxtj9.c b/drivers/input/misc/kxtj9.c
> index 837682cb2a7d..c6146bcee9f9 100644
> --- a/drivers/input/misc/kxtj9.c
> +++ b/drivers/input/misc/kxtj9.c
> @@ -314,9 +314,8 @@ static ssize_t kxtj9_set_poll(struct device *dev, struct device_attribute *attr,
>  		return error;
>  
>  	/* Lock the device to prevent races with open/close (and itself) */
> -	mutex_lock(&input_dev->mutex);
> -
> -	disable_irq(client->irq);
> +	guard(mutex)(&input_dev->mutex);
> +	guard(disable_irq)(&client->irq);
>  
>  	/*
>  	 * Set current interval to the greater of the minimum interval or
> @@ -326,9 +325,6 @@ static ssize_t kxtj9_set_poll(struct device *dev, struct device_attribute *attr,
>  
>  	kxtj9_update_odr(tj9, tj9->last_poll_interval);
>  
> -	enable_irq(client->irq);
> -	mutex_unlock(&input_dev->mutex);
> -
>  	return count;
>  }
>  
> @@ -504,12 +500,11 @@ static int kxtj9_suspend(struct device *dev)
>  	struct kxtj9_data *tj9 = i2c_get_clientdata(client);
>  	struct input_dev *input_dev = tj9->input_dev;
>  
> -	mutex_lock(&input_dev->mutex);
> +	guard(mutex)(&input_dev->mutex);
>  
>  	if (input_device_enabled(input_dev))
>  		kxtj9_disable(tj9);
>  
> -	mutex_unlock(&input_dev->mutex);
>  	return 0;
>  }
>  
> @@ -519,12 +514,11 @@ static int kxtj9_resume(struct device *dev)
>  	struct kxtj9_data *tj9 = i2c_get_clientdata(client);
>  	struct input_dev *input_dev = tj9->input_dev;
>  
> -	mutex_lock(&input_dev->mutex);
> +	guard(mutex)(&input_dev->mutex);
>  
>  	if (input_device_enabled(input_dev))
>  		kxtj9_enable(tj9);
>  
> -	mutex_unlock(&input_dev->mutex);
>  	return 0;
>  }
>  

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


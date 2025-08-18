Return-Path: <linux-input+bounces-14082-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB99B29A49
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 08:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1D3918988B9
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 06:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7EE27978D;
	Mon, 18 Aug 2025 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LC5muzpB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7233279359;
	Mon, 18 Aug 2025 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500173; cv=none; b=kpG9v5QwGYHuDzxdNuxxOepSgSdvKlr/U+pjeoGyKRNVNGjU5A6gdFxbLJjm1aKFE6XFXRb5SzZT4h74d6UrU6dGZB3xUCT3DZEQJaOeS/45VEuDHweBYC7RY5xzQTmI33j+9mHuVn/BPchurzsCwjDJlDU66yfMRsaOfk7Mj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500173; c=relaxed/simple;
	bh=Kb/Y4ZK460ljfeplYBQGvoG4PxNfvQD9VZHJ8VklMo4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EY2fcHHVbMf5w74c7i1Xpm4W/czyNLWuYGjmrblPXGxj4GenEAmKz15S7aRBohKx8RldvDF9odUhSK0aaWWbbD11dapGLAooJ6/LtJ3krNDQP3rO3RphDmPvQzQcq/OIr4RH6iTv0w0+DKad8yDlpJBKA/bGV5mE4BF/rKh7Ecc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LC5muzpB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce5095c8fso2992881e87.0;
        Sun, 17 Aug 2025 23:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755500170; x=1756104970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5Kic20bbeQ0vyV99roIZYUVJbgaVWDghEKvweN/Yaw=;
        b=LC5muzpBJbjtLV5fmUUC9gpw9ElULkGz7iGVQijvLs8XNOTpnXsjUqQGdU7o6zcBgD
         KLfJ5XMKm/tiD4xX8ppNCm3BEShsjET52rU8A3dthM8T1EOMSC5Tk9yGdqcl1pnG5Rad
         dU3fBBuszQfAgm4MLr5XyweB+AZWFLyq1laIlIRr3pZHDobINWs7gNbsuOB8yppjeaE8
         wylOOAH3H3MC+07vrMpYowlUBCIRRQmNYMHCJKTkSOyrmUl8Py0kUOtSFRpFvoFjInQM
         2ogZcLzYqW1Pu9EzWRlB0N3Jv/8GCK55g1vXAbZO4PAKbAvhhaHUn1IKl+FPq6R48b1p
         csFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500170; x=1756104970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5Kic20bbeQ0vyV99roIZYUVJbgaVWDghEKvweN/Yaw=;
        b=chzxoJrMSg/nOoBiVvh2x1px6jpJ+XZXsYu3EiwJeJXghu2hqy8YjB4RSaiXppPb0H
         uiB7KBrz9n+n+ofsNJ15Y31vZjeO8avzfEaFyTFI3zMaHEyxoyO1Hx0TrBK3wdzZDdEh
         APYv+pwz1oUdCNtu//GwBw7+/xNrl9PHOzcU6CI9B6UtA/B7xFWwmL01pGWy7jgNANhq
         1GG9PywUcnCrfSTinySdipstON/DmhoEpLTrkAcZUxOuhr3Mg85fEsS4cMkAOlPgVHEn
         0ACts5D4QvSNVuGXKC+NJblsij1JQUfdzxy0NhsdR7jEGhRInBF64o8Ac/zlhJtJogSN
         CNNg==
X-Forwarded-Encrypted: i=1; AJvYcCVF3E889IxAaF0OH3XHwC+211/rlMbjtLj6O5i7eoAfWtX6GibE5P3g3GRp9vGMqe0uP5Hd3OwcaO1r01VB@vger.kernel.org, AJvYcCXrlzZVJwbae3cXrXNcD2OHdY17dDvGdX9D7RpTa/MVmu1szVZ17NdjkjTwR9ZZ/uiLr3HmBtZk5HEnMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylkm0iKyaVqv1SrH1YW9DdnyMuk+qhWjcFVHq9nXK/HglQrDkA
	gFZMnskGdEAspVX/J+UsUzS7pnGOCD2j8mw3ue0+3IMnTqrCC8Yvsctk
X-Gm-Gg: ASbGncsna/embty05GomuFVI9gTyIZts8Ff9zS8AqJD20wHMLCmIICLzzxcUFu42O3N
	cawhMWOzjr7KT31O6eBNh+ohIOGj7PWywpL31M/Kl1/mSnNy5maaZEeClS7vQ0VSJKDPjHbyrBv
	vhzl2Ll0kvRvnjCfvEpy+bxFYg17FPnGh8iLwWlQZnldCk4vC3QRWSgnyF15HtYYtcoBrKd55jN
	8ThjLABYxjIfbod3Qj+L/stZWEDNwl3wHoyPj6kBmjWUEGophgYrykID5+4bFKMRG29ERlLMVbO
	Tn6x6pzNpxZjm1QjRLy3wKfHc1fdgXETQedoLarXigQDlAwVeKMDjYAVCnF1zJJh2/RqzHz2XEZ
	gYBuEPHBFEMY1BpBqNyc6k3F9vcwxsP1ur6TwQQhXf7ZQnHIpBHU2AQFRqpaCY55dIx46MXfrZ2
	RItR7LhK8jIBsx/g==
X-Google-Smtp-Source: AGHT+IFq6hoJ0wh+wmh5pPKVcsAvVhU3kf8u4kTgyXO40Os8zdT77oyXbZTBU/3uK6clII8vHy7YZQ==
X-Received: by 2002:a05:6512:3c8a:b0:55b:8476:ec8e with SMTP id 2adb3069b0e04-55ceeb42b83mr2402423e87.25.1755500169674;
        Sun, 17 Aug 2025 23:56:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35a8fasm1533034e87.49.2025.08.17.23.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:56:09 -0700 (PDT)
Message-ID: <a3fb7466-6774-4ae6-9e67-d35247ffa765@gmail.com>
Date: Mon, 18 Aug 2025 09:56:07 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mfd: rohm-bd71828: Use software nodes for gpio-keys
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
 <20250817224731.1911207-2-dmitry.torokhov@gmail.com>
 <0adb5e0a-ea37-4bd5-87ff-654b770261f2@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <0adb5e0a-ea37-4bd5-87ff-654b770261f2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/08/2025 09:54, Matti Vaittinen wrote:
> On 18/08/2025 01:47, Dmitry Torokhov wrote:
>> Refactor the rohm-bd71828 MFD driver to use software nodes for
>> instantiating the gpio-keys child device, replacing the old
>> platform_data mechanism.
> 
> Thanks for doing this Dmitry! I believe I didn't understand how 
> providing the IRQs via swnode works... :)
> 
> If I visit the ROHM office this week, then I will try to test this using 
> the PMIC HW. (Next week I'll be in ELCE, and after it I have probably 
> already forgotten this...)
> 
>> The power key's properties are now defined using software nodes and
>> property entries. The IRQ is passed as a resource attached to the
>> platform device.
>>
>> This will allow dropping support for using platform data for configuring
>> gpio-keys in the future.
>>
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> ---
>>   drivers/mfd/rohm-bd71828.c | 81 +++++++++++++++++++++++++++-----------
>>   1 file changed, 58 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
>> index a14b7aa69c3c..c29dde9996b7 100644
>> --- a/drivers/mfd/rohm-bd71828.c
>> +++ b/drivers/mfd/rohm-bd71828.c
>> @@ -4,7 +4,6 @@
> 
> // ...snip
> 
>> +static int bd71828_reg_cnt;
>> +
>> +static int bd71828_i2c_register_swnodes(void)
>> +{
>> +    int error;
>> +
>> +    if (bd71828_reg_cnt == 0) {
> 
> Isn't this check racy...
> 
>> +        error = software_node_register_node_group(bd71828_swnodes);
>> +        if (error)
>> +            return error;
>> +    }
>> +
>> +    bd71828_reg_cnt++;
> 
> ... with this...
> 
>> +    return 0;
>> +}
>> +
>> +static void bd71828_i2c_unregister_swnodes(void *dummy)
>> +{
>> +    if (bd71828_reg_cnt != 0) {
> 
> ...this...
> 
>> +        software_node_unregister_node_group(bd71828_swnodes);
>> +        bd71828_reg_cnt--;
> 
> ...and this? Perhaps add a mutex or use atomics?
> 
> Also, shouldn't the software_node_unregister_node_group() be only called 
> for the last instance to exit (Eg, "if (bd71828_reg_cnt == 0)" instead 
> of the "if (bd71828_reg_cnt != 0) {")?

Oh. Probably "if (bd71828_reg_cnt == 1)".

> 
>> +    }
>> +}
>> +
> 
> Other than that - I like this idea :)
> 
> Thanks!
> 
> Yours,
>      -- Matti



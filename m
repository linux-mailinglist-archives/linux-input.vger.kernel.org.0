Return-Path: <linux-input+bounces-6186-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AAA96C699
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 309CC1C220B9
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 18:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0856B1E4117;
	Wed,  4 Sep 2024 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsQ6RV4a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D235A1E203C;
	Wed,  4 Sep 2024 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475297; cv=none; b=GrqHgL3zA881wj5WT7h2MiwV7LRJeyXCcwq2tMgRXuMDmQ7PJhsKawMBmNAxHOxXt1HBN/IgrGWmMTwRkCNYDGK59pol2cJndM7xvfAiWKocPhzvFHMO4diau3OtrechgZcIxO1XWZrMnecMTRRu1HwWdFb9UbTH8VZBMzNKItQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475297; c=relaxed/simple;
	bh=A3ro/nfnjAl4s81sSOoMnUR+2g5Ubu7GFMcfa1xCd/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYrRtQ26KMWD0oGdsANHVkYvD6tIUGAeNn33U2bdE6ZPrdGdOejNWw0tPPd94cD0K7Oin7dJgqgGEYG1OCPhTrxsOI4xwK9adBi2VJ6NBKT2Xf6xJIzVxSVvMiLEHIc7NqCPaImQhBNlZy0bYTjJgPhRCoIZjnifeHe4ZosFo1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsQ6RV4a; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8695cc91c8so728703066b.3;
        Wed, 04 Sep 2024 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475293; x=1726080093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwUgBvho3B0QvIg0ctI8JPj/EWGRCH/IJjBVlNqiQsE=;
        b=hsQ6RV4ann3zHyKjm3g52Vy5W6st/xSO7VUN8mRy4MdbSkB70y3w3iC/ElyDGSA8/a
         sGrEvaCuIljHXEaLxQ6X+BGgWkfaiw6/j2NcsCnwv7jyNbq7GOtq9gjaDqArcQqLnaPT
         SQgcN7FTEZO492lFTkM/ygak5WkgF6gZYsv4kahcGGT2xb5cH7kCLStk3KGoEIQyzxkZ
         cpIqSfAfH/WO50N0n92sctkvy5bdUI+/JKb2BDT+skOIe7sF8+XzeF4KZMd0EkwxuSIG
         lo4jOx0LDbTbcGWr3nRfElSpAtNsms5JFsN9W4o766OuzXvIY7st0sPdXAVe5aPrAoLe
         4KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475293; x=1726080093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwUgBvho3B0QvIg0ctI8JPj/EWGRCH/IJjBVlNqiQsE=;
        b=qSGuDg1UB9PH929w8pvuQhJKnKalACU6mLXN4wnOeheB1ToapLSMfkIbpiEjvQn/66
         VpzZ51fKzlYcWhWSY45jcPdjqkyteHjE/SfQWVBIOzmqTm3ausKc4bXvjdiMsC7WTf6Y
         0WOEbgB2ACwO1FGtfWHU8ZlCAOTOUzzmqdn6Hc6YKZOxVMhku6J/Iu9A7z4Ie63OwdEx
         /CSRGi5+5ZQJpmUG3k4sYdr/0tMBkASNeOiqi0vQewR/niX/8BPsSG4VL+n9RYjQ11Es
         GQA6ObY08q6WVWLdeX+vJ9cYSgT/7OabiPVcdhj86WWzoR4Gc5nLEtqIovFc/PKULPIT
         4rwA==
X-Forwarded-Encrypted: i=1; AJvYcCVNXQPvoGZ4V6dGVdtTdlcf5IoCiFNEFiEYv1WgUVXQuN66RxoJJlToT9YiUHvcJ+LdjoaOybcUlqV5iKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ajr6C/T1/qFPYq5bgfHIIdOzr6GKCPLAs/SCQ9w04lB3HcpJ
	OlUJYMn66ds79XLDTEeynwFIZrRCunjBMzjmnUyf7YSu1TrsV8Hp
X-Google-Smtp-Source: AGHT+IG3U2Il4yRhkgfYtW8gFeMe/a6wnJ1Il0WFF8MHIJcPcXuD4ybYVAWrqJuVDFGfzd6OA+cU1w==
X-Received: by 2002:a17:907:2d22:b0:a7a:bae8:f297 with SMTP id a640c23a62f3a-a897f84bd71mr1631202866b.15.1725475292693;
        Wed, 04 Sep 2024 11:41:32 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a61fd64e0sm23332966b.36.2024.09.04.11.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:41:32 -0700 (PDT)
Message-ID: <818a1972-2862-460c-89b7-476ac0680db7@gmail.com>
Date: Wed, 4 Sep 2024 20:41:30 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/22] Input: iqs269a - use guard notation when acquiring
 mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044756.1047629-1-dmitry.torokhov@gmail.com>
 <9cc5b106-88dc-4539-b831-3cc6cb3ef860@gmail.com>
 <ZtilRLKICDSXKyEp@google.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZtilRLKICDSXKyEp@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 20:21, Dmitry Torokhov wrote:
> Hi Javier,
> 
> On Wed, Sep 04, 2024 at 03:53:40PM +0200, Javier Carrasco wrote:
>> On 04/09/2024 06:47, Dmitry Torokhov wrote:
>>> Using guard notation makes the code more compact and error handling
>>> more robust by ensuring that mutexes are released in all code paths
>>> when control leaves critical section.
>>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> ---
>>>  drivers/input/misc/iqs269a.c | 46 +++++++++++++-----------------------
>>>  1 file changed, 16 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
>>> index 843f8a3f3410..c34d847fa4af 100644
>>> --- a/drivers/input/misc/iqs269a.c
>>> +++ b/drivers/input/misc/iqs269a.c
>>
>> ...
>>
>>> @@ -453,9 +449,9 @@ static int iqs269_ati_base_get(struct iqs269_private *iqs269,
>>>  	if (ch_num >= IQS269_NUM_CH)
>>>  		return -EINVAL;
>>>  
>>> -	mutex_lock(&iqs269->lock);
>>> +	guard(mutex)(&iqs269->lock);
>>> +
>>>  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>>
>> maybe scoped_guard() to keep the scope of the mutex as it used to be?
> 
> Thank you for looking over patches.
> 
> It is just a few computations extra, so I decided not to use
> scoped_guard(). Note that original code was forced to release mutex
> early to avoid having to unlock it in all switch branches.
> 
>>
>>> -	mutex_unlock(&iqs269->lock);
>>>  
>>>  	switch (engine_b & IQS269_CHx_ENG_B_ATI_BASE_MASK) {
>>>  	case IQS269_CHx_ENG_B_ATI_BASE_75:
>>> @@ -491,7 +487,7 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
>>>  	if (target > IQS269_CHx_ENG_B_ATI_TARGET_MAX)
>>>  		return -EINVAL;
>>>  
>>> -	mutex_lock(&iqs269->lock);
>>> +	guard(mutex)(&iqs269->lock);
>>>  
>>>  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>>>  
>>> @@ -501,8 +497,6 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
>>>  	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
>>>  	iqs269->ati_current = false;
>>>  
>>> -	mutex_unlock(&iqs269->lock);
>>> -
>>>  	return 0;
>>>  }
>>>  
>>> @@ -515,10 +509,9 @@ static int iqs269_ati_target_get(struct iqs269_private *iqs269,
>>>  	if (ch_num >= IQS269_NUM_CH)
>>>  		return -EINVAL;
>>>  
>>> -	mutex_lock(&iqs269->lock);
>>> -	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>>> -	mutex_unlock(&iqs269->lock);
>>> +	guard(mutex)(&iqs269->lock);
>>
>> same here?
>>
>>>  
>>> +	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>>>  	*target = (engine_b & IQS269_CHx_ENG_B_ATI_TARGET_MASK) * 32;
> 
> Same here, calculating the line above will take no time at all...
> 
> Thanks.
> 

As you pointed out, in reality the extra locked instructions will not
make any difference. But as the conversion added instructions to be
locked by the mutex without mentioning it, I thought it should be either
left as it used to be with scoped_guard(), or explicitly mentioned in
the description.

No strong feelings against it, but out of curiosity, why would you
rather use guard()? I think scoped_guard() is a better way to
self-document what has to be accessed via mutex, and what not.

Best regards,
Javier Carrasco


Return-Path: <linux-input+bounces-6178-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E215596BF20
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 15:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A8631F21677
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 13:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD39D1DB937;
	Wed,  4 Sep 2024 13:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcZz164V"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C991DB927;
	Wed,  4 Sep 2024 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725458025; cv=none; b=QsMuUiBKOwEeLYikXu4FUNjxrfuRQlDrFQs/UdLhyT/3SUBHi5MN/hi8d5ghuxXkXB5WyLlyJ9Pf3XhGjcSAom7YFVR/TFEWYM+tI9QJythiOOx7YLqoyhTXKvfNbKAZGt5lCrqY2f0CiB477qSu7RyeTyGM9pF5YvB95pGFTY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725458025; c=relaxed/simple;
	bh=NavpN/BaJ+RYnRHKRJdRXruCLSjTU4NSagNdsbwCafg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ew+oQshs1V/8Fq7SePVKFTTthqT5MjAPNdM4tiPC1aknJ0tjzyS7WsR1WNzTKOO+rfmXHqm2hfMBQ7JlGtSRQQisGdtFawcZPmtw5G+fjUVwq5nAcv/hmxs1ajBX0HA0w6AIhC7gBKbY8X2nDvR6VbXKEEPCfA81L5v1IUSrIYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcZz164V; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f0a31ab2so75985591fa.0;
        Wed, 04 Sep 2024 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725458022; x=1726062822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0U2/VKvJKEs9AiofdOtz6nA+R/YzJdCNntmXmJw29ho=;
        b=LcZz164VqHnAy5YsxQufZGNfMc7pTTYK6bxkz4hR6oleynWaVUvqSUczvG5mCuSJcQ
         /5yBYyX3vIB6kBpuiyV8XmBd+VpRmYqabCt+L//MxX46jkXb2yKsnueuvfjmFoM0CGdY
         q3XpSzaHp/24v44wQzyrX4LunSG4fS7fzqvt+4ZJ5qwQ2HbJmrURbvcme/AH09EWRdc9
         DQ8qjAYt5At/uoKAuhmU+IjWGJgK/O22YtDdKLXUo5H8MX+h4WV5/0+fEJ3I1VWkpqc8
         KJthBCtcBX4c5+pKse2dMKEVpk1P/09b6xAULQ6osC5H3LAKqbSmzRWFPAFr0V9HS9z/
         VB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725458022; x=1726062822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0U2/VKvJKEs9AiofdOtz6nA+R/YzJdCNntmXmJw29ho=;
        b=IPMWlBOeX86Ff27klDhEuF7VaspftY89IViOUl8NTBsL+bXI0UVb02ozz55b0hMqZj
         GNFDQMhONV4XB1+ebrrvTgAfzX1UFl+6KQGi7fYWS5udC2XEcOgAHm6KKOveWto00ULN
         D5wM9X53jfFgs9IbIell+eJ/XsJu1eNOr8YoJJywII3OOhtBryWMo+ttIlW5CvuWzsjy
         jZjDGBqAwdkrVru+zDuf33Glr93I1vG5poHdx67Vly/tpUKXYAgEcmZtt0PEkQWpmA8Z
         XoFOvSfx8Yobtd4tM4VykZqldKWqUiToa43DeexAjhb9l2grFXYzP6i/+0UkBf29ASuO
         DDMA==
X-Forwarded-Encrypted: i=1; AJvYcCVHk0/xSloAxAAMzmFBuNBBsGwd0gZJRZnbuO/HgLr9KJcZHFZuv2Uvlyl90JD6SdJkaaKvNvi2RQkD1A==@vger.kernel.org, AJvYcCXsY9vAAfycp43S73SBdqQwMSoxfJMBYByMAwDdeWSgH9GpDTPT9a7gND6B0+vMgihRAPC8M5Py/pn04qbN@vger.kernel.org
X-Gm-Message-State: AOJu0YxTiMoM62zWXIovDj+bSjNz26jyvxYr3/Gv/XS0WmMT03QVCOqb
	MirKC/WuIU8DzWsU18G+Sih+ePWX+xKSb5abE4ZzlVl/7xtY7qjZ
X-Google-Smtp-Source: AGHT+IFjOelvL52QV7wLyLEjJps5newOrboqUlIreoHinpW7cUm9PbRr5dOlhOyYuSRwc0SF5Uc6lQ==
X-Received: by 2002:a2e:461a:0:b0:2f6:4f17:aead with SMTP id 38308e7fff4ca-2f64f17b38cmr18473371fa.21.1725458021940;
        Wed, 04 Sep 2024 06:53:41 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a3cdsm7655043a12.12.2024.09.04.06.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 06:53:41 -0700 (PDT)
Message-ID: <9cc5b106-88dc-4539-b831-3cc6cb3ef860@gmail.com>
Date: Wed, 4 Sep 2024 15:53:40 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/22] Input: iqs269a - use guard notation when acquiring
 mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044756.1047629-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044756.1047629-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:47, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/iqs269a.c | 46 +++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index 843f8a3f3410..c34d847fa4af 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c

...

> @@ -453,9 +449,9 @@ static int iqs269_ati_base_get(struct iqs269_private *iqs269,
>  	if (ch_num >= IQS269_NUM_CH)
>  		return -EINVAL;
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
> +
>  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);

maybe scoped_guard() to keep the scope of the mutex as it used to be?

> -	mutex_unlock(&iqs269->lock);
>  
>  	switch (engine_b & IQS269_CHx_ENG_B_ATI_BASE_MASK) {
>  	case IQS269_CHx_ENG_B_ATI_BASE_75:
> @@ -491,7 +487,7 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
>  	if (target > IQS269_CHx_ENG_B_ATI_TARGET_MAX)
>  		return -EINVAL;
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
>  
>  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>  
> @@ -501,8 +497,6 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
>  	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
>  	iqs269->ati_current = false;
>  
> -	mutex_unlock(&iqs269->lock);
> -
>  	return 0;
>  }
>  
> @@ -515,10 +509,9 @@ static int iqs269_ati_target_get(struct iqs269_private *iqs269,
>  	if (ch_num >= IQS269_NUM_CH)
>  		return -EINVAL;
>  
> -	mutex_lock(&iqs269->lock);
> -	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> -	mutex_unlock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);

same here?

>  
> +	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>  	*target = (engine_b & IQS269_CHx_ENG_B_ATI_TARGET_MASK) * 32;
>  
>  	return 0;

Best regards,
Javier Carrasco


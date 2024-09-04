Return-Path: <linux-input+bounces-6203-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE096C798
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75C2A284651
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B7B1E6DF1;
	Wed,  4 Sep 2024 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTAEfzH0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A612FF70;
	Wed,  4 Sep 2024 19:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725478360; cv=none; b=edoDEYX5i9Z4FuqTOiNl6DlcbyzZgLGQXWCCKvRRR4ix4Mxpj6Q5NCSyYlOilZZiFEcIRHlTuw8oAgLvI0T0KwPu9P5O+eg8SoDZ1bDps3Am5k/hGS/x9TedrJZo0x+Sj5Yub4hZDOoc1AytHqTg6h1NT7e3a0Q6t+cGladcfs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725478360; c=relaxed/simple;
	bh=vLvCokUlN6DlWABSC+t1bX2VtBPDStu6b/twXp1ThXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3D+v6aaxwQierGjafgO7bxSWtGJSY7h2TUWHaE80adwBJdh6ktmMiJxJEkPgFPoXtO4TCWZUwJ8Zi7txSDmumw3ujcejSbELqgxlEorsjSFNmhl8KCFb+z2IEhlNg1VNVu7eve3IDUXD/bK7ld6otA0V6Uy8aSr0Aq6cOlOa6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTAEfzH0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a843bef98so1659266b.2;
        Wed, 04 Sep 2024 12:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725478357; x=1726083157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rqp0bKow87X7S/anuoY8G1mDkEEuOaC0XdLsw7sL7GI=;
        b=ZTAEfzH0/5znHiwF64hvklXx3CMYqPKAYDV3CeNpSvQ6TuyTCiIqaBTM4v8NvTZCk8
         Dat3MK7jkSCWv1UqPjPbZTMrpAS6BV1msErODdd7GBvbmdRtlXt7HB8agI5mSY+As8Cw
         2fX6nYqd2PU8uu9CiW8WsvG0vG7AvaI7F0gC03a8NgPggN+c2ZVNzeHHUoNtP7JnyQs+
         +IXnUohkKJvLV1t4MDN750NSMirf9+PAykVItS6QPBUrQLF4ow77w20CvDWqfgLbivGa
         BNQPcL+d5ELC5fYts9FtG6C27vx2152/Z7Lc6Kzxkkp8XI+njjvS5HYSDydiJcEd0CE7
         bMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725478357; x=1726083157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqp0bKow87X7S/anuoY8G1mDkEEuOaC0XdLsw7sL7GI=;
        b=vryeuE9Con65p4ZIctoMxuqjBRJnbXmQgKnpVRFfAK0BkkHgpvSj5r7d/7b66e8QiU
         uAbfOqFPIW94Bk5EzwHg4ybkUaBG9PCDII2SSQwxcaoOGa/XYnO7id0fJltRgb6UdLoU
         i/84EZ62CYjz59+i/pzL3dbpCOITkgoj+FEW26Y8kTsWyx+BZ5iXjLvKoX2aIslM+ftp
         QcZdKFrxO4dvLdE8BIH64+NNmSTyQKf9tSnmFxTJ9o/gjIeYJFSblc0QLz9y9s1xmvcX
         zX3Tbiwz3qyWfogWs97LKn02lQehBSf7ii4Otfeu7O4Q1Yya+70k0dQ5GFmKy2V8Fe/q
         CEjg==
X-Forwarded-Encrypted: i=1; AJvYcCU/RGpshnsiHw8mfceohw6qIW4YzJ8HOo1t2KDOA+kbePEsQvi62M1XV3FpMO4ob2tMVpUdWTDr58sxTu1L@vger.kernel.org, AJvYcCXxZHIIsG+F0TxubC57K178QHX0MwtUju50lopyc8Dt9LEKlAJnCTR1+2QBuGQzM/a6W72u+o+GznBWrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwemxX4K4geRQ+n7Ka6DqZUvuEMGhv9HrrOnsMxJlsZNAZRSj
	am2gZlF+lD/o4KlUOrBf/WgGG+sKHo8CCNdfhioUq+UEX7guyQEv
X-Google-Smtp-Source: AGHT+IGZE7H1wh5DzcWv1y6mhhNimytIdpJw+5qE2mtjz7gLe8k9We27pJpNHwRrplUxmTL6XhOULA==
X-Received: by 2002:a17:907:3684:b0:a77:b5c2:399 with SMTP id a640c23a62f3a-a89d879c0a9mr1154504166b.31.1725478356726;
        Wed, 04 Sep 2024 12:32:36 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a6236d057sm27947966b.124.2024.09.04.12.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:32:35 -0700 (PDT)
Message-ID: <f74cb5d9-3489-4aef-a43e-0989132cf344@gmail.com>
Date: Wed, 4 Sep 2024 21:32:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] Input: rotary_encoder - use guard notation when
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
 <20240904044929.1049700-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044929.1049700-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:49, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/rotary_encoder.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
> index 6628fe540834..52761da9f999 100644
> --- a/drivers/input/misc/rotary_encoder.c
> +++ b/drivers/input/misc/rotary_encoder.c
> @@ -113,7 +113,7 @@ static irqreturn_t rotary_encoder_irq(int irq, void *dev_id)
>  	struct rotary_encoder *encoder = dev_id;
>  	unsigned int state;
>  
> -	mutex_lock(&encoder->access_mutex);
> +	guard(mutex)(&encoder->access_mutex);
>  
>  	state = rotary_encoder_get_state(encoder);
>  
> @@ -136,8 +136,6 @@ static irqreturn_t rotary_encoder_irq(int irq, void *dev_id)
>  		break;
>  	}
>  
> -	mutex_unlock(&encoder->access_mutex);
> -
>  	return IRQ_HANDLED;
>  }
>  
> @@ -146,7 +144,7 @@ static irqreturn_t rotary_encoder_half_period_irq(int irq, void *dev_id)
>  	struct rotary_encoder *encoder = dev_id;
>  	unsigned int state;
>  
> -	mutex_lock(&encoder->access_mutex);
> +	guard(mutex)(&encoder->access_mutex);
>  
>  	state = rotary_encoder_get_state(encoder);
>  
> @@ -159,8 +157,6 @@ static irqreturn_t rotary_encoder_half_period_irq(int irq, void *dev_id)
>  		}
>  	}
>  
> -	mutex_unlock(&encoder->access_mutex);
> -
>  	return IRQ_HANDLED;
>  }
>  
> @@ -169,22 +165,19 @@ static irqreturn_t rotary_encoder_quarter_period_irq(int irq, void *dev_id)
>  	struct rotary_encoder *encoder = dev_id;
>  	unsigned int state;
>  
> -	mutex_lock(&encoder->access_mutex);
> +	guard(mutex)(&encoder->access_mutex);
>  
>  	state = rotary_encoder_get_state(encoder);
>  
> -	if ((encoder->last_stable + 1) % 4 == state)
> +	if ((encoder->last_stable + 1) % 4 == state) {
>  		encoder->dir = 1;
> -	else if (encoder->last_stable == (state + 1) % 4)
> +		rotary_encoder_report_event(encoder);
> +	} else if (encoder->last_stable == (state + 1) % 4) {
>  		encoder->dir = -1;
> -	else
> -		goto out;
> -
> -	rotary_encoder_report_event(encoder);
> +		rotary_encoder_report_event(encoder);
> +	}
>  
> -out:
>  	encoder->last_stable = state;
> -	mutex_unlock(&encoder->access_mutex);
>  
>  	return IRQ_HANDLED;
>  }

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


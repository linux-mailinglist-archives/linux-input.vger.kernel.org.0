Return-Path: <linux-input+bounces-6197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619496C731
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF01E283B69
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7861448C4;
	Wed,  4 Sep 2024 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anCXqxdG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E46144312;
	Wed,  4 Sep 2024 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476981; cv=none; b=J/IKn6zqersB+PdoUwgHJmdLfUuO2uvTE5ujzVWuR9Dj/fM2CGioFHn/WOFqtV+tF/cQTYXvZBHONlyJ/tnp996SJzzOnh9r2aN/FZdRNxHmuoSNNQECjoZAOXywayuc45uFPPu98jwD0KPUuJp6NQFzWMAAnLBgCi1oZNFvC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476981; c=relaxed/simple;
	bh=EeKx/wLreEhrDowNXJZbs3j4vFzWVmYCx7LUV39mXEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ED7JGfrCwdVBOwANtSGlOGwLnvxFR7edTf2+tZfwl6gJPyU15Tz+GPsJYGQYvsaizZkJxoLh7AyDV6zsZ2J6yqwg/WAkKEvG0GlsvunMRuy127P2bK0TrNLUAKEEe8BzMdbpzJwFTlhj4XpU0zFAl6InuPHoozfVbKth3zany3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anCXqxdG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374ca65cafdso1869222f8f.2;
        Wed, 04 Sep 2024 12:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725476978; x=1726081778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yg8FRUrlc1eiZA3eoaxHbkbh/Mt4lbvYb4i//mDb2PY=;
        b=anCXqxdGaZmXDwZ35ckS1rJn0MiaJK9fT4pq/L22uC4EY9r+ZY0E43UOrw9XgyKt7y
         HupZwD9Q970C4vibMq5Ol3lMDE+giXmb/o1gGeXB18wVG+YzQ0HhbcxqC8WzOa/JThbg
         yhVMfyE5sGHK+HoIY3UjIaMZ26/gqD8cJ1QGErtJC5p2C1INHm7UCkURbOSpnc+XMQoI
         LBGM7gTW220U4o1Al4j8/++An9Y2gnqHYxrspuFDOyfMrte7UfSCy7UlKsuNMix7f1vO
         LAqcOlOIV17Js1i6EpFaDxMnKWwm8T0VgOKTvlneMxaYFiZj6G7RtrRegRMulFiKPvqv
         wrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476978; x=1726081778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yg8FRUrlc1eiZA3eoaxHbkbh/Mt4lbvYb4i//mDb2PY=;
        b=O+jKnuxRnR+3k9NoXg0Q+wqs62r5hclZpojMoET/qhyNj3Vb0zMUaAk7a2hkHzgmvp
         68DgYwxAksX1YlgRQDKODkYOVPrNTyohCkqLmCeJL0pXCb3rrgRM9BitwyIuGqS19ZOa
         WjpOUjMjIvwP+mkvH6SOwwxkEwDLrZI8ck4k4i6MRSxybBGei+Q2DGmuB7wyk7RUzuS1
         u40sBBy3h4/04Ig9VvPnI8vx/6z3FTRDIFMewJC36V8xxrNlyJTZRW9EULBQif8CS+Pb
         Gv6YtyngKtA6UO8EmO1KG4dWr4ZzwoNz6Wsl5wD+Vz9QQNXbX4eJpLagQQ679S7SqZE7
         asGw==
X-Forwarded-Encrypted: i=1; AJvYcCU6JE/yaG6f9vD6NzY9Yn9usHNSiFo9w9X2MtvO3IEX4w4VaNPFATAh7BzULJwYxoTPVUo7x5T/+ZmpZg==@vger.kernel.org, AJvYcCUMo1avsFgRmCeBxeNmIA1W/TJeDbdq4p17A9Arz6nx8SDHLb2fjM2P5haI96b/na0QfzVrJhJR36FePK/1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyifi3GFX91A08028NTSfOCZWwKw46SJkhztRH+oRsxkI22ahg6
	9sVsg5N6Ji3eupQ01hB/w7Z3jWl3+ez6sWNLSHVNtrnDqB2crEXm
X-Google-Smtp-Source: AGHT+IG+geSWPKs8ltMKChxbTZ+NhKT5nv+mCKxitpfXCF7XlxcQzw17hLyFbgWPcw0DlXnQbKU+Zg==
X-Received: by 2002:a5d:4088:0:b0:374:c31e:9724 with SMTP id ffacd0b85a97d-374c31e98c4mr8391134f8f.10.1725476977696;
        Wed, 04 Sep 2024 12:09:37 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4ac81sm17508907f8f.14.2024.09.04.12.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:09:37 -0700 (PDT)
Message-ID: <23fbb6fa-8a31-4928-a7c2-5cf5e176d909@gmail.com>
Date: Wed, 4 Sep 2024 21:09:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/22] Input: ideapad_slidebar - use guard notation when
 acquiring spinlock
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044244.1042174-11-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-11-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that locks are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/ideapad_slidebar.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/input/misc/ideapad_slidebar.c b/drivers/input/misc/ideapad_slidebar.c
> index fa4e7f67d713..592bd159a194 100644
> --- a/drivers/input/misc/ideapad_slidebar.c
> +++ b/drivers/input/misc/ideapad_slidebar.c
> @@ -95,41 +95,29 @@ static struct platform_device *slidebar_platform_dev;
>  
>  static u8 slidebar_pos_get(void)
>  {
> -	u8 res;
> -	unsigned long flags;
> +	guard(spinlock_irqsave)(&io_lock);
>  
> -	spin_lock_irqsave(&io_lock, flags);
>  	outb(0xf4, 0xff29);
>  	outb(0xbf, 0xff2a);
> -	res = inb(0xff2b);
> -	spin_unlock_irqrestore(&io_lock, flags);
> -
> -	return res;
> +	return inb(0xff2b);
>  }
>  
>  static u8 slidebar_mode_get(void)
>  {
> -	u8 res;
> -	unsigned long flags;
> +	guard(spinlock_irqsave)(&io_lock);
>  
> -	spin_lock_irqsave(&io_lock, flags);
>  	outb(0xf7, 0xff29);
>  	outb(0x8b, 0xff2a);
> -	res = inb(0xff2b);
> -	spin_unlock_irqrestore(&io_lock, flags);
> -
> -	return res;
> +	return inb(0xff2b);
>  }
>  
>  static void slidebar_mode_set(u8 mode)
>  {
> -	unsigned long flags;
> +	guard(spinlock_irqsave)(&io_lock);
>  
> -	spin_lock_irqsave(&io_lock, flags);
>  	outb(0xf7, 0xff29);
>  	outb(0x8b, 0xff2a);
>  	outb(mode, 0xff2b);
> -	spin_unlock_irqrestore(&io_lock, flags);
>  }
>  
>  static bool slidebar_i8042_filter(unsigned char data, unsigned char str,

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


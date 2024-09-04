Return-Path: <linux-input+bounces-6204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DE696C7A1
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 879A31C24BDB
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EAD1E6321;
	Wed,  4 Sep 2024 19:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtA76iJE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3FA84A27;
	Wed,  4 Sep 2024 19:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725478410; cv=none; b=LTWcGjX/Ft8mPMIU+s3D7X9t6DDRlzLGMJrbofAVt9kEQrRteP6uo50JeiWcABdZhcQLlJZurKH5tYTXS0dtAC4kPfRUZiltG02hLVmbTrB3I/Ao7FfNYnjy5mh7I+AbOld8rnsHPre14xEzYvOnbG9e920e49WB1F9bpidbdQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725478410; c=relaxed/simple;
	bh=oXXWnACi8DBdoIS6DiuSnW/O/kcUiAQnc2jnKTDAP6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7nqhEHf/ARrlrGNAOSFcr5u/g+KHJNlAaEMP3TTfX/3U5q2EyQ35pC14RknhXcca/j5jKG/Qg4bxbSzm9sTg2pgKoUn2c+6OGpYAsqyEJ+66yxMAdgVoJuRqPdxXsCgFX5NR3WIBJcxRzreEQr1U7Fk9IH1ZkKmslHYwQivR4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtA76iJE; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c24c92f699so4885682a12.2;
        Wed, 04 Sep 2024 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725478407; x=1726083207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnZIheVzC6+fYTWkbVL2yM+3KNoipMt0wdIyf3umYUI=;
        b=jtA76iJEzWfYfAmeCacAxA+vxXBZ4IvRYgH2gpAHgf+fCGxTY+WO9JSegp5RJuk5Pl
         vKlqLP5u4je0W4xEqi60l4U60NN6ROeZNYHoGWlBHRdqANZNjfYPlgrNGZetuDoTw6Hp
         U/3bCxTjvQq8PH/35Hs3Brig3GXTp3OdFUO1n0yUJlnMNB8WcU+EKwkMM/Qc8ivXC+da
         Tw42ZwOxj1T8Ev08C/YYNg5l+uXEWBrpuIgjx24LlzlbDMBw5foMyc7dEGWZ0le/rw/G
         yzT4MmZ0d31vOS3uaNwSrUixPd+yxCvAsk/06/TbK4gmhE6NgmKG89jIMqcv8aryw5dL
         r8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725478407; x=1726083207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnZIheVzC6+fYTWkbVL2yM+3KNoipMt0wdIyf3umYUI=;
        b=cjuXjzrSzhL8UZCQ1A3PW1X/fc+gEK8aDOC4joRBd3RbovQQTrJbwvKM/9HCc5vzWx
         1Hx7TeoQiCkwWl6e2GI7d5eaVVzDYUBJUqDxiiKOUflPO9NYHsqC4gZpNeV/RyQvl3HA
         KdaiUmLcmxSPqFCEz21jrWbqxaD68e/qkGUxI6HwllF6CjZHAS0Pb/nV28fd0fnDCadq
         wgF4xWJ5b9FIo31D0ZfbP8kkBLz+MMXGQtjYf8z/NjzWbEWNdkJ04OLW7thtayM4aTTd
         uHigGy/3H/5xFiCtEhxpeAOCP5TL1G6OgSgQ5jDWgYuVuvIgTyrMZydJNefDJZM+9e6j
         3WRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOL/WC9fDA0PI0o1MAuaeNmq1fcWE19yWw3LiiVLEVJH1lL0UksWm0MeRaqyI70RkTX0+4/SJKbCoxHQ==@vger.kernel.org, AJvYcCXrfdZN/pDba8NgaYDUsUn2IICawq/n44k03o60Rq6ht6A4yze4OR6fE/sSBIu7xKl/788u1Rm5+/HKDoLf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywui/URYrI7xgex2r+lA8ccj/M+Y27PGIPLbv3Juuac++R+3h55
	sK0jBrWrw6M08x+H9XgCoz64U4GbEVCQwM8O1g+DHQt6n/CDgNrn
X-Google-Smtp-Source: AGHT+IH9dU/vZpzmSyxzpuSoZxO12pYGGkfLOhND/rWHshrlLgSdWYoOwmtHTNSQrjYBVYkqZCc2BQ==
X-Received: by 2002:a05:6402:4406:b0:5c0:8c5a:f4f3 with SMTP id 4fb4d7f45d1cf-5c2758316dbmr3697785a12.26.1725478406839;
        Wed, 04 Sep 2024 12:33:26 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc6a49dbsm248501a12.82.2024.09.04.12.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:33:25 -0700 (PDT)
Message-ID: <20b6b133-48e4-4640-8e93-3b3c69a7d2df@gmail.com>
Date: Wed, 4 Sep 2024 21:33:25 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] Input: sparcspkr - use guard notation when
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
 <20240904044938.1049843-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044938.1049843-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:49, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that locks are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/sparcspkr.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
> index 20020cbc0752..5de59ae90c67 100644
> --- a/drivers/input/misc/sparcspkr.c
> +++ b/drivers/input/misc/sparcspkr.c
> @@ -69,7 +69,6 @@ static int bbc_spkr_event(struct input_dev *dev, unsigned int type, unsigned int
>  	struct sparcspkr_state *state = dev_get_drvdata(dev->dev.parent);
>  	struct bbc_beep_info *info = &state->u.bbc;
>  	unsigned int count = 0;
> -	unsigned long flags;
>  
>  	if (type != EV_SND)
>  		return -1;
> @@ -85,7 +84,7 @@ static int bbc_spkr_event(struct input_dev *dev, unsigned int type, unsigned int
>  
>  	count = bbc_count_to_reg(info, count);
>  
> -	spin_lock_irqsave(&state->lock, flags);
> +	guard(spinlock_irqsave)(&state->lock);
>  
>  	if (count) {
>  		sbus_writeb(0x01,                 info->regs + 0);
> @@ -97,8 +96,6 @@ static int bbc_spkr_event(struct input_dev *dev, unsigned int type, unsigned int
>  		sbus_writeb(0x00,                 info->regs + 0);
>  	}
>  
> -	spin_unlock_irqrestore(&state->lock, flags);
> -
>  	return 0;
>  }
>  
> @@ -107,7 +104,6 @@ static int grover_spkr_event(struct input_dev *dev, unsigned int type, unsigned
>  	struct sparcspkr_state *state = dev_get_drvdata(dev->dev.parent);
>  	struct grover_beep_info *info = &state->u.grover;
>  	unsigned int count = 0;
> -	unsigned long flags;
>  
>  	if (type != EV_SND)
>  		return -1;
> @@ -121,7 +117,7 @@ static int grover_spkr_event(struct input_dev *dev, unsigned int type, unsigned
>  	if (value > 20 && value < 32767)
>  		count = 1193182 / value;
>  
> -	spin_lock_irqsave(&state->lock, flags);
> +	guard(spinlock_irqsave)(&state->lock);
>  
>  	if (count) {
>  		/* enable counter 2 */
> @@ -136,8 +132,6 @@ static int grover_spkr_event(struct input_dev *dev, unsigned int type, unsigned
>  		sbus_writeb(sbus_readb(info->enable_reg) & 0xFC, info->enable_reg);
>  	}
>  
> -	spin_unlock_irqrestore(&state->lock, flags);
> -
>  	return 0;
>  }
>  

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


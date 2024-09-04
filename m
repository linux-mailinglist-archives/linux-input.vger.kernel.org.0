Return-Path: <linux-input+bounces-6188-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C896C6AB
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6D711C21EEA
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 18:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8209C1E2007;
	Wed,  4 Sep 2024 18:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lC+g1w2O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F6341C6D;
	Wed,  4 Sep 2024 18:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475674; cv=none; b=BFxRLRT2jypaYNEM0tbAgO59H+qxsKeV/Fw3r5u8Sfbz8mc1/F9pSMe6IMU0Uzz/GO/Pu4vp7vYHWjUWbWvag6VsbTdiGskUh9pRi2tws4A87s0NhooZHepolVafaM0ctOljMUyt4kCMe2vDv6nkq8TUNURm1mtov5YWSA9Q9I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475674; c=relaxed/simple;
	bh=2wvsLLYun14IA9S9GuxTZmAmHgf/eGTzmBisN7jDuxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgHRb6hssUQEu4lpCH3qQr5B4no9g7tphnrXiufNW8Cmdu+acuqslUa0Bc2lQrou70o/rRo9buJBzZ/ijdXCxpiXIxtStwSZ+4zT9eDYa7Lds/UIPjo0whwSSu+KC1TTKI7eMicwV3blsTlNerarT8Jtwy+qAjVqOpokF/W46kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lC+g1w2O; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a81bd549eso653493566b.3;
        Wed, 04 Sep 2024 11:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475671; x=1726080471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GpmoKnD+SjRcx4GiEflL9y18EuLdmzyMp8nNUGN+1I=;
        b=lC+g1w2O87USzAvp9oeMrmd0+d6UpBcPUlv75qyG/3xnkzNlAo+lodt0yvUGgRQjQf
         G4NvgD2DbwbOIUtsZ1dhnE7QweCvMeJQRaH5GPzxT5Djsu+FjkjDFXQTFu2SlVkseqf9
         Pr+OObI9t0dsdY/Kd5eT0IfaqdfZKS1PggvXWW9p7TfrA2MNRH6/iABb5UVFFnzUIyBz
         bwfyB1J/K9V4eqFigQSQwepbdW7pJS0zatReSsetYGintiCuXH+kOj/IxQ4Tqe9GC0gd
         EcA8ZeeoHbs6jP52m2cWMX5HL6NPk2JUe5nLLPoV8QBC4VrFpgS1jmHHaUfp3nukl6LK
         pU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475671; x=1726080471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GpmoKnD+SjRcx4GiEflL9y18EuLdmzyMp8nNUGN+1I=;
        b=edLvmtpVbahwsRThrut8qrZaQlSiryT7HicWSdyeEHPiT/YAvtAN1vDEHu43cMbzoS
         8KKAPBpf3MrErB7gfgKFNwyuwtqNFriD29xGcRgqpMaBZg4fmxrjK2puIstu3EuhyS+v
         yPy3xyyPyxWn7blkMuvnC1Lqvl0Qzw2YaaneHMOqg4gx18PNhkWeBAwMBJZg5Sfaz0kD
         Gz62dvayw/XWjCGtJ+HII03hdmiJUuY1aqhoEpyUiazsu+FDUZuvg9ejYgXwtVNapFNw
         uEA9WSIK27n/NCOjhRr3nmUPQJruJDiukxFUuSu/MblaLII7vsmibUuAebcGDWMaW/5p
         X/vg==
X-Forwarded-Encrypted: i=1; AJvYcCUYlk0Yy1oNQs0gW/NS7ltqj7b8V15ucgimKSHXcg/m9eyuS6t0UgqdYrOQFG641q/TKxnvr20ohzJGLg==@vger.kernel.org, AJvYcCXeEcbV9FInHi943kRKujq0gdS7R+AwFbj+0CDAcYxdo2dVGsDxGNUH6+THBlTKXxbxvkzEoIHkq4h4H+Ph@vger.kernel.org
X-Gm-Message-State: AOJu0YwEuSmUtVfzEE7BXQOdvEMVqPkRmody5MWlWSyl/OzL6FUaVfK8
	y0EcsEvfzwj1OXJjMwfytz1uRtDiF8ImPiehPqb/7k3MshoIZLhQ
X-Google-Smtp-Source: AGHT+IHVLbWu1FVY+isVRqdguuhsmaDAwnrQ3lPH6qyzixC1e4TODc4MhV+ERKQp47qoKlMJgeKEcA==
X-Received: by 2002:a17:907:971c:b0:a86:6e5e:620d with SMTP id a640c23a62f3a-a8a1d2d5cc5mr713199666b.27.1725475670789;
        Wed, 04 Sep 2024 11:47:50 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc52922bsm211800a12.15.2024.09.04.11.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:47:49 -0700 (PDT)
Message-ID: <d946c659-7726-4e56-b408-0ad5c2cd7e67@gmail.com>
Date: Wed, 4 Sep 2024 20:47:49 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] Input: ad714x - use guard notation when acquiring
 mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044244.1042174-2-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/ad714x.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/input/misc/ad714x.c b/drivers/input/misc/ad714x.c
> index 1acd8429c56c..d106f37df6bc 100644
> --- a/drivers/input/misc/ad714x.c
> +++ b/drivers/input/misc/ad714x.c
> @@ -941,7 +941,7 @@ static irqreturn_t ad714x_interrupt_thread(int irq, void *data)
>  	struct ad714x_chip *ad714x = data;
>  	int i;
>  
> -	mutex_lock(&ad714x->mutex);
> +	guard(mutex)(&ad714x->mutex);
>  
>  	ad714x->read(ad714x, STG_LOW_INT_STA_REG, &ad714x->l_state, 3);
>  
> @@ -954,8 +954,6 @@ static irqreturn_t ad714x_interrupt_thread(int irq, void *data)
>  	for (i = 0; i < ad714x->hw->touchpad_num; i++)
>  		ad714x_touchpad_state_machine(ad714x, i);
>  
> -	mutex_unlock(&ad714x->mutex);
> -
>  	return IRQ_HANDLED;
>  }
>  
> @@ -1169,13 +1167,11 @@ static int ad714x_suspend(struct device *dev)
>  
>  	dev_dbg(ad714x->dev, "%s enter\n", __func__);
>  
> -	mutex_lock(&ad714x->mutex);
> +	guard(mutex)(&ad714x->mutex);
>  
>  	data = ad714x->hw->sys_cfg_reg[AD714X_PWR_CTRL] | 0x3;
>  	ad714x->write(ad714x, AD714X_PWR_CTRL, data);
>  
> -	mutex_unlock(&ad714x->mutex);
> -
>  	return 0;
>  }
>  
> @@ -1184,7 +1180,7 @@ static int ad714x_resume(struct device *dev)
>  	struct ad714x_chip *ad714x = dev_get_drvdata(dev);
>  	dev_dbg(ad714x->dev, "%s enter\n", __func__);
>  
> -	mutex_lock(&ad714x->mutex);
> +	guard(mutex)(&ad714x->mutex);
>  
>  	/* resume to non-shutdown mode */
>  
> @@ -1197,8 +1193,6 @@ static int ad714x_resume(struct device *dev)
>  
>  	ad714x->read(ad714x, STG_LOW_INT_STA_REG, &ad714x->l_state, 3);
>  
> -	mutex_unlock(&ad714x->mutex);
> -
>  	return 0;
>  }
>  

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


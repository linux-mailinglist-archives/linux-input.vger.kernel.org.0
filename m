Return-Path: <linux-input+bounces-6201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB81896C765
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4DB82875A9
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B471E503D;
	Wed,  4 Sep 2024 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePSYqRaC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26011E5015;
	Wed,  4 Sep 2024 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725477753; cv=none; b=khnMbW8Q5v9V/f93tHzS9lJJOl9Om2tUHmzFOcwD02gb+juAAQxTJTvaSnv1EMEEk3U+s+K+Ppe+PPSdOPcSFWoHfJLgnHVmtbKlpClb2Wl1mTpOh20AYblHkTIDBcru2z26vp7KAKbgy3EqEcug/MxAFTHrpATh4MWADlVS9ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725477753; c=relaxed/simple;
	bh=Z/F8ZXWCi+TprFG+Bv4UcN0DfVjIiJozcfBWAXe0RcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kute52P7mU2wJfhZLdKX5ET/o/gR90L1JeqchV/3ohKoBT9VIpQdzkNiogdXAPRUNI22MSxFgMH4w4iXwxQlONjbIEn+ui9CqVu/nz7CGGxVIxoj2Z1NLSSbqpv2itCind2bAVv/D0ZOxiHwhwWFmB9QEOROF22J6gz/Deh2CVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePSYqRaC; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f3f163e379so27316831fa.3;
        Wed, 04 Sep 2024 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725477749; x=1726082549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjqkjL/p4dZNv/iF6Lxf9Me3sFhO3rNX5U+Ucbchtg4=;
        b=ePSYqRaCnLsITKLasR05qZ6hsjtVvAMOTjKTBgi98nxMlEevCAUYYK9FBWaELAGIC6
         fWaZZmbKmXw/KihwdbMHzr0jw9dnAljsDxKPjElva9x0aN6plh9dseD+bHD+5J0bKcQ7
         nItjewX8juQ0eWWY84ySaux1HrxQuVl6sC1iddNiTa+1n03yN2hFPORW+kI2bnnr/mkH
         f23Mu3kS/Wu/5cpmZLYDcpW4UWhsAvuy6M7k27EHDeYc33rXamjGUoNxRlvRLRLuZ/kc
         BKuDgki4Ua193huU1hxUDK0Qx39XE//AXsyc7l7eg3Za3CEqmb7ZzSriJvni1SKXXnxA
         D3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725477749; x=1726082549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjqkjL/p4dZNv/iF6Lxf9Me3sFhO3rNX5U+Ucbchtg4=;
        b=MBALoPcs9aEydOznAbD7M039dxrjQheBuzgvVvGD8rvNGNbq01QfG9vmyQiejXPONx
         G8UPZIt4lKqCN1z98QwSrxpMtOzH9iB9Y9QmIjIKpJuIcF0hX1Fw0RQrIKwGucHsvPIT
         4FpVvplxHA85mDquHXuE99vShOqxnHCPtzGXeczWOxxJQ60hliR7gUnlje7IIpUC5XSk
         osFzb4PxNkED7DpF3mUwcb5zFdbaXbltZ9VdDJmwBIy2PJEuIapPYtPETYlNdbmDrDq7
         R63JJDgNUMmBTE2bRKpcTqFjC4aPQ3Sm+DPqPPrC7Q8EWftzd3tAcNkFUSX+L8FgYBO5
         2k8g==
X-Forwarded-Encrypted: i=1; AJvYcCUF9LIHo0RIn4ov7AP2hjOf20rINQd2YCsjzv3fD6wNfo8vTXLB5RTPCw6790lN7FNz7ny0B3kk3ppdRQ==@vger.kernel.org, AJvYcCVCxk/QgPFoJjgrMumabX+fWP6pgUgeUTT4L45wqDGOVS4cP59AMDn7oCZVf6YXjNeDiCXjyGtyQ5BTy6Vq@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0XSzcT3TBGcmHdgHqSGgtLYH3hZOEnGE8fxO54ZuWIF9I1y2
	ngfdQiOaqCueRX2jKNMZ5t5Kn4uEjkaO4M1+nfgFgXDINkol0U18
X-Google-Smtp-Source: AGHT+IElPttu5ytauiRBVB1xK1ShtaXUxLrvw1z7LtmZeO/fL0ZibAepflpEwsPWbLpKjdbv95SkIQ==
X-Received: by 2002:a2e:a78a:0:b0:2f6:4d1b:d9d6 with SMTP id 38308e7fff4ca-2f6517b6661mr29740131fa.25.1725477748650;
        Wed, 04 Sep 2024 12:22:28 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc697efasm237479a12.59.2024.09.04.12.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:22:27 -0700 (PDT)
Message-ID: <5d550e3c-5e18-43c7-b961-e779cc32ae03@gmail.com>
Date: Wed, 4 Sep 2024 21:22:26 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/22] Input: pwm-beeper - use guard notation when
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
 <20240904044914.1049280-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044914.1049280-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:49, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that locks are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/pwm-beeper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
> index 5b9aedf4362f..0e19e97d98ec 100644
> --- a/drivers/input/misc/pwm-beeper.c
> +++ b/drivers/input/misc/pwm-beeper.c
> @@ -203,9 +203,9 @@ static int pwm_beeper_suspend(struct device *dev)
>  	 * beeper->suspended, but to ensure that pwm_beeper_event
>  	 * does not re-submit work once flag is set.
>  	 */
> -	spin_lock_irq(&beeper->input->event_lock);
> -	beeper->suspended = true;
> -	spin_unlock_irq(&beeper->input->event_lock);

I assume you know that you don't need the braces for the scoped_guard()
in these cases. If you prefer doing so to clarify (you are leaving an
empty line afterwards anyway, but still), I am ok with it.

Note that other users of scoped_guard() tend to use them without braces
for single instructions.

> +	scoped_guard(spinlock_irq, &beeper->input->event_lock) {
> +		beeper->suspended = true;
> +	}
>  
>  	pwm_beeper_stop(beeper);
>  
> @@ -216,9 +216,9 @@ static int pwm_beeper_resume(struct device *dev)
>  {
>  	struct pwm_beeper *beeper = dev_get_drvdata(dev);
>  
> -	spin_lock_irq(&beeper->input->event_lock);
> -	beeper->suspended = false;
> -	spin_unlock_irq(&beeper->input->event_lock);
> +	scoped_guard(spinlock_irq, &beeper->input->event_lock) {
> +		beeper->suspended = false;
> +	}
>  
>  	/* Let worker figure out if we should resume beeping */
>  	schedule_work(&beeper->work);

With or without braces,

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


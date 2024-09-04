Return-Path: <linux-input+bounces-6210-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E696C9A2
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 23:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6D5A283AB9
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE3B14F118;
	Wed,  4 Sep 2024 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkPbGeuV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ABB1F19A;
	Wed,  4 Sep 2024 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486098; cv=none; b=u1N1kAhl0x0T6wDsBjqPNcyQr+NxS78JAc8oqSVEWGyjOlDXAsJ4P4Sb/6BdcplhkPmWJp07Jp5RVfBIep6IHa3bXSgCTQHOyTpG3AY2mREeduu1/y9JJ92M56fjUIwmB53y7z3VheZ3hncJuOmk5A1OaBT5GpWXp5eGS3Q+dKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486098; c=relaxed/simple;
	bh=VVkq6SA/Z/x6PfVPoTtVDOnyLdeM5G6eLRpVQxDR2l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8S4723CK1WWphDSyGxyP9ibrPDbgqEGPYMNdJI6mgd4AXG2Z/n2KcqFSboLTaVAbgEye715IaqtH9HUSbdt47c5BVmda1+QDsjbK89mIgPRxM1TmGoCn7UDmTEi/Gr1nffkGMGo47zvGo7XboqoNyt6T39UShmS2btGSF3Qhno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkPbGeuV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a869f6ce2b9so21823466b.2;
        Wed, 04 Sep 2024 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725486095; x=1726090895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hcbaf6+UaSPY3b28zOWLp/GYVaJ5rEmz83YMV8ucCg=;
        b=JkPbGeuVWz3k6f4cQeU351+pov0l6TQWc6iXw2HHLaR+svA0QPe5fEACOFxEdSHbS1
         8VNs4oF2LxnaPTFeQFzHv9RSkhTQfumfu0wSrhFUyJmwGND20Eck8Ay/23xwGIE+oO2h
         dky1sWLWp+00PHa+KcvBtSZh7VZY8j9wn2/0HHOnGp4m/pOkw2dGctWAKvxfFV5AXvZF
         HLenKf62Ib0OPw9aK54sWgxZScUJoKfUHKaHjq8HETX3TyNKkXH5A5g2FwPB77LFVgI/
         1y5t+e7nELStapMCBzqARM+jOPHKaEMq45tSNLUy+H1IexqKb660qGikJU1cgKmPXwby
         jVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725486095; x=1726090895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hcbaf6+UaSPY3b28zOWLp/GYVaJ5rEmz83YMV8ucCg=;
        b=Pguagbvk9b1/1M3UW2/+E/X7QilQrWr1U7dC4DmDrLt2QMH8Y0kvaIFCuIQMUNgxq2
         k6KYx9i5ksTMBPvGJO+OsfLiTDJYVDs78TEn1jwjr09Jg3rz3Hj9gYQyV7H419aryvpz
         Pu+/Mbvt5RhauPjh4lZPGzS/Q0c4fT3QkFp1j4/YiUOM2NvwrNGaKhNVugr4XG36ANML
         V39n509XavURvDBnNduJqpVfHViwd894zLI4ACjrbb/Rr375CcuWObcNXX2WoDejoXYE
         LAoY1LMi5Z87K6paAr0P47NtniG4hZANQS1m8LND/im0QC2V3XvVhtW5pVImrKUUIXO5
         M4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9LJzLeI2DeqAUiJuTKqobrFt15FCb0JHYPybryv3bE82ya8U5BvO6rjLchYHH/IPg5OYx3CKdTU9ULMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOuYsrtGGwD/w6TYqn7jSt9cKYUDPr0L45J0+iA/DWzDgjcTR
	j0zQtkDx/HIZsJJm7h1JzrJjIY+kkKeSQTXtEnpkTYV687bICcgU
X-Google-Smtp-Source: AGHT+IEvSgH6+ZluoT5d3Avl13AnZuqas22rWEegucN7LjNtvOeMWiGeX113xkzDVCArBf+m6Ht83Q==
X-Received: by 2002:a17:907:2ce5:b0:a7a:8da1:eb00 with SMTP id a640c23a62f3a-a8a32df36eemr406124366b.7.1725486095210;
        Wed, 04 Sep 2024 14:41:35 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a61fbaed2sm42532666b.1.2024.09.04.14.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 14:41:34 -0700 (PDT)
Message-ID: <254b8ef4-98ef-426c-b902-d1722d191a28@gmail.com>
Date: Wed, 4 Sep 2024 23:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/22] Input: regulator-haptic - use guard notation
 when acquiring mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044922.1049488-1-dmitry.torokhov@gmail.com>
 <3ff97fb3-27e0-496e-a8b0-0c2d69deeff2@gmail.com>
 <ZtjJKxQRRzJE0aWZ@google.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZtjJKxQRRzJE0aWZ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 22:55, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> v2: drop no linger used "error" variable in regulator_haptic_suspend()
> 
>  drivers/input/misc/regulator-haptic.c |   24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
> index 02f73b7c0462..3666ba6d1f30 100644
> --- a/drivers/input/misc/regulator-haptic.c
> +++ b/drivers/input/misc/regulator-haptic.c
> @@ -83,12 +83,10 @@ static void regulator_haptic_work(struct work_struct *work)
>  	struct regulator_haptic *haptic = container_of(work,
>  					struct regulator_haptic, work);
>  
> -	mutex_lock(&haptic->mutex);
> +	guard(mutex)(&haptic->mutex);
>  
>  	if (!haptic->suspended)
>  		regulator_haptic_set_voltage(haptic, haptic->magnitude);
> -
> -	mutex_unlock(&haptic->mutex);
>  }
>  
>  static int regulator_haptic_play_effect(struct input_dev *input, void *data,
> @@ -205,19 +203,15 @@ static int regulator_haptic_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
> -	int error;
>  
> -	error = mutex_lock_interruptible(&haptic->mutex);
> -	if (error)
> -		return error;
> -
> -	regulator_haptic_set_voltage(haptic, 0);
> +	scoped_guard(mutex_intr, &haptic->mutex) {
> +		regulator_haptic_set_voltage(haptic, 0);
> +		haptic->suspended = true;
>  
> -	haptic->suspended = true;
> -
> -	mutex_unlock(&haptic->mutex);
> +		return 0;
> +	}
>  
> -	return 0;
> +	return -EINTR;
>  }
>  
>  static int regulator_haptic_resume(struct device *dev)
> @@ -226,7 +220,7 @@ static int regulator_haptic_resume(struct device *dev)
>  	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
>  	unsigned int magnitude;
>  
> -	mutex_lock(&haptic->mutex);
> +	guard(mutex)(&haptic->mutex);
>  
>  	haptic->suspended = false;
>  
> @@ -234,8 +228,6 @@ static int regulator_haptic_resume(struct device *dev)
>  	if (magnitude)
>  		regulator_haptic_set_voltage(haptic, magnitude);
>  
> -	mutex_unlock(&haptic->mutex);
> -
>  	return 0;
>  }
>  

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


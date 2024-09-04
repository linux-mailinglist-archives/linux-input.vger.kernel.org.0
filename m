Return-Path: <linux-input+bounces-6205-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D596C7D2
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9D51C253E7
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D5F1E6DC0;
	Wed,  4 Sep 2024 19:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZIs9UUY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D712C54B;
	Wed,  4 Sep 2024 19:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725479100; cv=none; b=prdB5KDQh2yHjIBSRn0PiWIEcUKnk1BG8on8BqzjKKwZt6hzV80Gz7yEFGbOdn+q6Wer0OgsyNIxmmsl7itmQtRvnEDr12GlE1bO7Ogl2yU+JXdC9o5DaUnZAH1UtJNrUg6mhJwZX62MNataxuAiB9mcOA8zdO4V/Zsfvveux6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725479100; c=relaxed/simple;
	bh=VudqCsBqdRxgxiAbexoJ3cXbvuFBD8Sz3Th88LaZVLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nm9fOetuIfgogRD+vrxr597KcjXwz9P/xH2qAaimoupsaHlT2/K40qeWPT4M58+ChkC8FuhWdHR35YYjJElhNbeXLjuwy3qF4zRxbsHDIhpsqUUtuUeMVEDgP5/Oc7qDddBWDUmalnO6br/lz9fkPzh6H+tGC0GrjSe8zBZg4zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZIs9UUY; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c26852af8fso3441580a12.2;
        Wed, 04 Sep 2024 12:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725479097; x=1726083897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljJrsx/AOsvBxGZp0eo0tP3bDry9WRlzJyd8Xb3foIo=;
        b=cZIs9UUY3/9ByHrN29hgX36z7kFjqr6KaHzttWdUM42HC37dWtb4Nto9Jq9pwfqAEJ
         EnZHrE5Mfi07FH6kUJVhCeFKyUaAX0F1m+Ql2GZlWlqbhiZJ1l554XAPbSshqqJvmf5f
         dsji3Cqb8WBA3C0vsVJsBGeLDZ6poJRnog//QYUUM70N2IfDU+kugsheJedwIixHdyIB
         +yIpA3daT1pOeN7lrn3M3AbFCaV/KfQNX+K7/a1jGG/FNAhsFtQtjFHioBetSX+rC0iA
         ni8Y35dBkrOHxOixRuAlEDiADvdfRlQjno61i/Nc/FOuTBFp1RYRJO/3ZXz7AAlrHPkh
         O7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725479097; x=1726083897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljJrsx/AOsvBxGZp0eo0tP3bDry9WRlzJyd8Xb3foIo=;
        b=MoJxIsdrr+PkhNhNZZ4ArFZxK4R3V+KRJ0YOPqxfrijyzNPKNu7VZTs073w7wi84gC
         j2swej1G+24J5KAm8FxjyXapWyX57dDBXMgK79Mp0xi6Mfr5B2svxSoX0uPlEOovZfXk
         4WJahzcet+Jch8uQwh4mlkC8kzaX75sKBl3cd0+bI6uCLqTbBqHv+BdpRe8k9CVzgVKZ
         p7cnCkZvNA+/6A686p0kZYTotEG8c1OPHo8C3GnfKbBEIZ+LD2UvsMWokcYgQezQOFHw
         +Uz3TC4US6mmDZv6xevYWm4fvdswQCfHDNL/fBtP0jOLhv2quR0j7g6n/CSKhz/C782O
         /sqg==
X-Forwarded-Encrypted: i=1; AJvYcCVMDRYCbwW5tfnPcjfuXildpKBdTY8A0V27JKE4mKYyw2k5DGNKgtHg2vZdP+3OZMfuBvE+5f3kXAeoDw==@vger.kernel.org, AJvYcCXWsb7d+TUuCbHHu3FPLbirjFOmKum0vrWVSmnh4aSzhy0c6acRrbExd3YkjKruFJUDrOJ65+lCpIfBeGvf@vger.kernel.org
X-Gm-Message-State: AOJu0YwWp6kVgDzulHYwqyyjILQu7iAVm3Q8FscBW927K6Wzp/m69DDB
	sRHC8aqbzx6ob2l6laj7FqgblvEfm8kwv+yTCsuNZ4KnsX1H41Cg
X-Google-Smtp-Source: AGHT+IGYwG2QKIyfP9cCHw/aAUsj+eqGw1WyAihijQ9niMLQPmEFaOM7/L5h+HBnhd+zN6ahoZteag==
X-Received: by 2002:a17:907:d90:b0:a86:b64e:bc4d with SMTP id a640c23a62f3a-a897fa74489mr1743651566b.44.1725479096986;
        Wed, 04 Sep 2024 12:44:56 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623e3458sm28919066b.191.2024.09.04.12.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:44:56 -0700 (PDT)
Message-ID: <83199f0f-67a9-4fe7-9cbe-f3821ad4c041@gmail.com>
Date: Wed, 4 Sep 2024 21:44:54 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] Input: cm109 - use guard notation when acquiring
 mutex and spinlock
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044244.1042174-4-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044244.1042174-4-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:42, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that locks are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/cm109.c | 167 ++++++++++++++++++-------------------
>  1 file changed, 79 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
> index 728325a2d574..0cfe5d4a573c 100644
> --- a/drivers/input/misc/cm109.c
> +++ b/drivers/input/misc/cm109.c
> @@ -355,6 +355,35 @@ static void cm109_submit_buzz_toggle(struct cm109_dev *dev)
>  			__func__, error);
>  }
>  
> +static void cm109_submit_ctl(struct cm109_dev *dev)
> +{
> +	int error;
> +
> +	guard(spinlock_irqsave)(&dev->ctl_submit_lock);
> +
> +	dev->irq_urb_pending = 0;
> +
> +	if (unlikely(dev->shutdown))
> +		return;
> +
> +	if (dev->buzzer_state)
> +		dev->ctl_data->byte[HID_OR0] |= BUZZER_ON;
> +	else
> +		dev->ctl_data->byte[HID_OR0] &= ~BUZZER_ON;
> +
> +	dev->ctl_data->byte[HID_OR1] = dev->keybit;
> +	dev->ctl_data->byte[HID_OR2] = dev->keybit;
> +
> +	dev->buzzer_pending = 0;
> +	dev->ctl_urb_pending = 1;
> +
> +	error = usb_submit_urb(dev->urb_ctl, GFP_ATOMIC);
> +	if (error)
> +		dev_err(&dev->intf->dev,
> +			"%s: usb_submit_urb (urb_ctl) failed %d\n",
> +			__func__, error);
> +}
> +
>  /*
>   * IRQ handler
>   */
> @@ -362,8 +391,6 @@ static void cm109_urb_irq_callback(struct urb *urb)
>  {
>  	struct cm109_dev *dev = urb->context;
>  	const int status = urb->status;
> -	int error;
> -	unsigned long flags;
>  
>  	dev_dbg(&dev->intf->dev, "### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x\n",
>  	     dev->irq_data->byte[0],
> @@ -401,32 +428,7 @@ static void cm109_urb_irq_callback(struct urb *urb)
>  	}
>  
>   out:
> -
> -	spin_lock_irqsave(&dev->ctl_submit_lock, flags);
> -
> -	dev->irq_urb_pending = 0;
> -
> -	if (likely(!dev->shutdown)) {
> -
> -		if (dev->buzzer_state)
> -			dev->ctl_data->byte[HID_OR0] |= BUZZER_ON;
> -		else
> -			dev->ctl_data->byte[HID_OR0] &= ~BUZZER_ON;
> -
> -		dev->ctl_data->byte[HID_OR1] = dev->keybit;
> -		dev->ctl_data->byte[HID_OR2] = dev->keybit;
> -
> -		dev->buzzer_pending = 0;
> -		dev->ctl_urb_pending = 1;
> -
> -		error = usb_submit_urb(dev->urb_ctl, GFP_ATOMIC);
> -		if (error)
> -			dev_err(&dev->intf->dev,
> -				"%s: usb_submit_urb (urb_ctl) failed %d\n",
> -				__func__, error);
> -	}
> -
> -	spin_unlock_irqrestore(&dev->ctl_submit_lock, flags);
> +	cm109_submit_ctl(dev);
>  }
>  
>  static void cm109_urb_ctl_callback(struct urb *urb)
> @@ -434,7 +436,6 @@ static void cm109_urb_ctl_callback(struct urb *urb)
>  	struct cm109_dev *dev = urb->context;
>  	const int status = urb->status;
>  	int error;
> -	unsigned long flags;
>  
>  	dev_dbg(&dev->intf->dev, "### URB CTL: [0x%02x 0x%02x 0x%02x 0x%02x]\n",
>  	     dev->ctl_data->byte[0],
> @@ -449,35 +450,31 @@ static void cm109_urb_ctl_callback(struct urb *urb)
>  				    __func__, status);
>  	}
>  
> -	spin_lock_irqsave(&dev->ctl_submit_lock, flags);
> +	guard(spinlock_irqsave)(&dev->ctl_submit_lock);
>  
>  	dev->ctl_urb_pending = 0;
>  
> -	if (likely(!dev->shutdown)) {
> -
> -		if (dev->buzzer_pending || status) {
> -			dev->buzzer_pending = 0;
> -			dev->ctl_urb_pending = 1;
> -			cm109_submit_buzz_toggle(dev);
> -		} else if (likely(!dev->irq_urb_pending)) {
> -			/* ask for key data */
> -			dev->irq_urb_pending = 1;
> -			error = usb_submit_urb(dev->urb_irq, GFP_ATOMIC);
> -			if (error)
> -				dev_err(&dev->intf->dev,
> -					"%s: usb_submit_urb (urb_irq) failed %d\n",
> -					__func__, error);
> -		}
> -	}
> +	if (unlikely(dev->shutdown))
> +		return;
>  
> -	spin_unlock_irqrestore(&dev->ctl_submit_lock, flags);
> +	if (dev->buzzer_pending || status) {
> +		dev->buzzer_pending = 0;
> +		dev->ctl_urb_pending = 1;
> +		cm109_submit_buzz_toggle(dev);
> +	} else if (likely(!dev->irq_urb_pending)) {
> +		/* ask for key data */
> +		dev->irq_urb_pending = 1;
> +		error = usb_submit_urb(dev->urb_irq, GFP_ATOMIC);
> +		if (error)
> +			dev_err(&dev->intf->dev,
> +				"%s: usb_submit_urb (urb_irq) failed %d\n",
> +				__func__, error);
> +	}
>  }
>  
>  static void cm109_toggle_buzzer_async(struct cm109_dev *dev)
>  {
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&dev->ctl_submit_lock, flags);
> +	guard(spinlock_irqsave)(&dev->ctl_submit_lock);
>  
>  	if (dev->ctl_urb_pending) {
>  		/* URB completion will resubmit */
> @@ -486,8 +483,6 @@ static void cm109_toggle_buzzer_async(struct cm109_dev *dev)
>  		dev->ctl_urb_pending = 1;
>  		cm109_submit_buzz_toggle(dev);
>  	}
> -
> -	spin_unlock_irqrestore(&dev->ctl_submit_lock, flags);
>  }
>  
>  static void cm109_toggle_buzzer_sync(struct cm109_dev *dev, int on)
> @@ -556,32 +551,30 @@ static int cm109_input_open(struct input_dev *idev)
>  		return error;
>  	}
>  
> -	mutex_lock(&dev->pm_mutex);
> -
> -	dev->buzzer_state = 0;
> -	dev->key_code = -1;	/* no keys pressed */
> -	dev->keybit = 0xf;
> +	scoped_guard(mutex, &dev->pm_mutex) {
> +		dev->buzzer_state = 0;
> +		dev->key_code = -1;	/* no keys pressed */
> +		dev->keybit = 0xf;
>  
> -	/* issue INIT */
> -	dev->ctl_data->byte[HID_OR0] = HID_OR_GPO_BUZ_SPDIF;
> -	dev->ctl_data->byte[HID_OR1] = dev->keybit;
> -	dev->ctl_data->byte[HID_OR2] = dev->keybit;
> -	dev->ctl_data->byte[HID_OR3] = 0x00;
> +		/* issue INIT */
> +		dev->ctl_data->byte[HID_OR0] = HID_OR_GPO_BUZ_SPDIF;
> +		dev->ctl_data->byte[HID_OR1] = dev->keybit;
> +		dev->ctl_data->byte[HID_OR2] = dev->keybit;
> +		dev->ctl_data->byte[HID_OR3] = 0x00;
>  
> -	dev->ctl_urb_pending = 1;
> -	error = usb_submit_urb(dev->urb_ctl, GFP_KERNEL);
> -	if (error) {
> -		dev->ctl_urb_pending = 0;
> -		dev_err(&dev->intf->dev, "%s: usb_submit_urb (urb_ctl) failed %d\n",
> -			__func__, error);
> -	} else {
> -		dev->open = 1;
> +		dev->ctl_urb_pending = 1;
> +		error = usb_submit_urb(dev->urb_ctl, GFP_KERNEL);
> +		if (!error) {
> +			dev->open = 1;
> +			return 0;
> +		}
>  	}
>  
> -	mutex_unlock(&dev->pm_mutex);
> +	dev->ctl_urb_pending = 0;
> +	usb_autopm_put_interface(dev->intf);
>  
> -	if (error)
> -		usb_autopm_put_interface(dev->intf);
> +	dev_err(&dev->intf->dev, "%s: usb_submit_urb (urb_ctl) failed %d\n",
> +		__func__, error);
>  
>  	return error;
>  }
> @@ -590,17 +583,15 @@ static void cm109_input_close(struct input_dev *idev)
>  {
>  	struct cm109_dev *dev = input_get_drvdata(idev);
>  
> -	mutex_lock(&dev->pm_mutex);
> -
> -	/*
> -	 * Once we are here event delivery is stopped so we
> -	 * don't need to worry about someone starting buzzer
> -	 * again
> -	 */
> -	cm109_stop_traffic(dev);
> -	dev->open = 0;
> -
> -	mutex_unlock(&dev->pm_mutex);
> +	scoped_guard(mutex, &dev->pm_mutex) {
> +		/*
> +		 * Once we are here event delivery is stopped so we
> +		 * don't need to worry about someone starting buzzer
> +		 * again
> +		 */
> +		cm109_stop_traffic(dev);
> +		dev->open = 0;
> +	}
>  
>  	usb_autopm_put_interface(dev->intf);
>  }
> @@ -823,9 +814,9 @@ static int cm109_usb_suspend(struct usb_interface *intf, pm_message_t message)
>  
>  	dev_info(&intf->dev, "cm109: usb_suspend (event=%d)\n", message.event);
>  
> -	mutex_lock(&dev->pm_mutex);
> +	guard(mutex)(&dev->pm_mutex);
> +
>  	cm109_stop_traffic(dev);
> -	mutex_unlock(&dev->pm_mutex);
>  
>  	return 0;
>  }
> @@ -836,9 +827,9 @@ static int cm109_usb_resume(struct usb_interface *intf)
>  
>  	dev_info(&intf->dev, "cm109: usb_resume\n");
>  
> -	mutex_lock(&dev->pm_mutex);
> +	guard(mutex)(&dev->pm_mutex);
> +
>  	cm109_restore_state(dev);
> -	mutex_unlock(&dev->pm_mutex);
>  
>  	return 0;
>  }

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


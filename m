Return-Path: <linux-input+bounces-6207-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709396C7FA
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3397B22D9A
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CE61E6321;
	Wed,  4 Sep 2024 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NN7xmuwm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98E340C03;
	Wed,  4 Sep 2024 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725479546; cv=none; b=NY2V+SCJH16RhynY5pr9EKIHmJ4T4RFICMEufSeKilVh34AGiI1u1bO9mI5vryBA8a3UsNFFdvEHWzUc0S9rJgPdQno0+78TesKq+jOK6wYijGZr3qdZNi5PrIX4zDTQzwSsAcawMDOEprxMDCWMyHuqyWg7f0C4Ff0Z1kBo+5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725479546; c=relaxed/simple;
	bh=Z/VMfqanYFjI3q3ZnsYgwDCUPClsurgForHmfmr+Whc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPqJDWjnCSth1dXV3/EbyKngoHHZV1eOqvWBTbqOiEgadGJo4JiXBgfmeBp5SSEFaZQU7f1FAsYCRHzo/e/WzXuEyCD8L/x+WoUrIlRqkfmMaJPTuDKxReAtcxq+z3zhxvDcw7C6y1NHogZsM9DkjgjXs+7jFRtHyQsJ0f/rA8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NN7xmuwm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42bbd0a40faso48811815e9.1;
        Wed, 04 Sep 2024 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725479543; x=1726084343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=td9L9uL8QEgZmMDYezTAoB1Jhlil36yrfMrEVwDuq2g=;
        b=NN7xmuwmM/TNIcUmn9OPFGT0vBdSon5JzoXe4rNSTtuRPM9X5JU2zhr5v0C/yVyb/M
         mpjiSR5AWpjhTr0AJorC2bMacvby3il5twENV92LzpMvB5IJ7Y0DqBuqnzwmlQRs3PTx
         OngqtmB/6mtfVjOMpYk5WqeXYwfe2h6H18ZapoLDltnCNRaQtErnnl6uyZH7eElccgqN
         /PqTd9HjqjxneE74qcyS6I6VRql58jJuyM08Sl0Qa437FHJY11/PkQtEIT8y5nzFj3VL
         XYiHGq1i8q2frCFkcySkuJBowgr3iHOyDi6bal9B2uroXrk0h8G096ZUaO/b1QuIhraA
         /esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725479543; x=1726084343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=td9L9uL8QEgZmMDYezTAoB1Jhlil36yrfMrEVwDuq2g=;
        b=tQLsxwZ16gO/LI0PRRwkMhVvQxMvmuo0pjVidpx3q1RlaYxk2Qh20dMXt4QMGeSbFv
         gItnTxwjVQe7qABIDMezlBBkkTcTnWFWDHgru4NqbFe6EqOoqyhi4J7wfeQzUeSv6Zvl
         y1gcXYTuf8R+o/zJS1DIW3i0ZyuYO7PjYw59a2Fqy6HAe45Uei76WK0EQufSAOvjdgTO
         R5ZnWWUjVSBMHc0Hsl64sBQVNyqdDr0inmKXYoNvT335oVR+T9Lsa4JXchI8xVRdTgEx
         Bld31aQtgr7IIvAzQlh4oiRz41A/S1FFfpKh/KU0uU3JAQuRAnEB60TTbrZ+VOBy0RJO
         O9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCX57JbaQ9b42cm7lFHrGwfwZyUtWSvFqswhYiPSLB6zwzHM2G75nUq3tkH0iQPGEiamm9pUW9ll7hS+Wg==@vger.kernel.org, AJvYcCXKFg3KmjrIHknwG3Hie1PislqazaSOWj5jvRtwTNCPaEmr/aCZEfcVLzfXBBf7MctOeZ3T/Rl61qrcaAT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4jxFh8/jXo9UPgcwTC4Iv0jP3y/k/GXd9SaI3HH0gA7cPlvVa
	Y2pwrTpUJCpeS27a5kHbfMJ7RRVoSNHCVbPVYCJ0Z7jt+n5ernaI
X-Google-Smtp-Source: AGHT+IE6wVWP11nzvH7yWHUyjKjlEpUgeB9KeWdrMZk2ykUYwvQGmGM9zpXoS2IjrKN6TWAlW/oMaA==
X-Received: by 2002:a05:600c:45d1:b0:42b:afbb:1704 with SMTP id 5b1f17b1804b1-42c880ec5e4mr71119725e9.6.1725479543010;
        Wed, 04 Sep 2024 12:52:23 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c07eed5dsm12421884f8f.116.2024.09.04.12.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:52:22 -0700 (PDT)
Message-ID: <a41bb88a-b624-4b5b-a2ea-b49761c45a93@gmail.com>
Date: Wed, 4 Sep 2024 21:52:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/22] Input: pegasus_notetaker - use guard notation when
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
 <20240904044842.1048638-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044842.1048638-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:48, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/tablet/pegasus_notetaker.c | 86 +++++++++++++-----------
>  1 file changed, 48 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
> index a68da2988f9c..e1dc8365bfe9 100644
> --- a/drivers/input/tablet/pegasus_notetaker.c
> +++ b/drivers/input/tablet/pegasus_notetaker.c
> @@ -214,6 +214,28 @@ static void pegasus_init(struct work_struct *work)
>  			error);
>  }
>  
> +static int __pegasus_open(struct pegasus *pegasus)
> +{
> +	int error;
> +
> +	guard(mutex)(&pegasus->pm_mutex);
> +
> +	pegasus->irq->dev = pegasus->usbdev;
> +	if (usb_submit_urb(pegasus->irq, GFP_KERNEL))
> +		return -EIO;
> +
> +	error = pegasus_set_mode(pegasus, PEN_MODE_XY, NOTETAKER_LED_MOUSE);
> +	if (error) {
> +		usb_kill_urb(pegasus->irq);
> +		cancel_work_sync(&pegasus->init);
> +		return error;
> +	}
> +
> +	pegasus->is_open = true;

Nit: blank line before return.

> +	return 0;
> +}

Nit: multiple blank lines.

> +
> +
>  static int pegasus_open(struct input_dev *dev)
>  {
>  	struct pegasus *pegasus = input_get_drvdata(dev);
> @@ -223,39 +245,25 @@ static int pegasus_open(struct input_dev *dev)
>  	if (error)
>  		return error;
>  
> -	mutex_lock(&pegasus->pm_mutex);
> -	pegasus->irq->dev = pegasus->usbdev;
> -	if (usb_submit_urb(pegasus->irq, GFP_KERNEL)) {
> -		error = -EIO;
> -		goto err_autopm_put;
> +	error = __pegasus_open(pegasus);
> +	if (error) {
> +		usb_autopm_put_interface(pegasus->intf);
> +		return error;
>  	}
>  
> -	error = pegasus_set_mode(pegasus, PEN_MODE_XY, NOTETAKER_LED_MOUSE);
> -	if (error)
> -		goto err_kill_urb;
> -
> -	pegasus->is_open = true;
> -	mutex_unlock(&pegasus->pm_mutex);
>  	return 0;
> -
> -err_kill_urb:
> -	usb_kill_urb(pegasus->irq);
> -	cancel_work_sync(&pegasus->init);
> -err_autopm_put:
> -	mutex_unlock(&pegasus->pm_mutex);
> -	usb_autopm_put_interface(pegasus->intf);
> -	return error;
>  }
>  
>  static void pegasus_close(struct input_dev *dev)
>  {
>  	struct pegasus *pegasus = input_get_drvdata(dev);
>  
> -	mutex_lock(&pegasus->pm_mutex);
> -	usb_kill_urb(pegasus->irq);
> -	cancel_work_sync(&pegasus->init);
> -	pegasus->is_open = false;
> -	mutex_unlock(&pegasus->pm_mutex);
> +	scoped_guard(mutex, &pegasus->pm_mutex) {
> +		usb_kill_urb(pegasus->irq);
> +		cancel_work_sync(&pegasus->init);
> +
> +		pegasus->is_open = false;
> +	}
>  
>  	usb_autopm_put_interface(pegasus->intf);
>  }
> @@ -411,10 +419,10 @@ static int pegasus_suspend(struct usb_interface *intf, pm_message_t message)
>  {
>  	struct pegasus *pegasus = usb_get_intfdata(intf);
>  
> -	mutex_lock(&pegasus->pm_mutex);
> +	guard(mutex)(&pegasus->pm_mutex);
> +
>  	usb_kill_urb(pegasus->irq);
>  	cancel_work_sync(&pegasus->init);
> -	mutex_unlock(&pegasus->pm_mutex);
>  
>  	return 0;
>  }
> @@ -422,31 +430,33 @@ static int pegasus_suspend(struct usb_interface *intf, pm_message_t message)
>  static int pegasus_resume(struct usb_interface *intf)
>  {
>  	struct pegasus *pegasus = usb_get_intfdata(intf);
> -	int retval = 0;
>  
> -	mutex_lock(&pegasus->pm_mutex);
> +	guard(mutex)(&pegasus->pm_mutex);
> +
>  	if (pegasus->is_open && usb_submit_urb(pegasus->irq, GFP_NOIO) < 0)
> -		retval = -EIO;
> -	mutex_unlock(&pegasus->pm_mutex);
> +		return -EIO;
>  
> -	return retval;
> +	return 0;
>  }
>  
>  static int pegasus_reset_resume(struct usb_interface *intf)
>  {
>  	struct pegasus *pegasus = usb_get_intfdata(intf);
> -	int retval = 0;
> +	int error;
> +
> +	guard(mutex)(&pegasus->pm_mutex);
>  
> -	mutex_lock(&pegasus->pm_mutex);
>  	if (pegasus->is_open) {
> -		retval = pegasus_set_mode(pegasus, PEN_MODE_XY,
> +		error = pegasus_set_mode(pegasus, PEN_MODE_XY,
>  					  NOTETAKER_LED_MOUSE);
> -		if (!retval && usb_submit_urb(pegasus->irq, GFP_NOIO) < 0)
> -			retval = -EIO;
> +		if (error)
> +			return error;
> +
> +		if (usb_submit_urb(pegasus->irq, GFP_NOIO) < 0)
> +			return -EIO;
>  	}
> -	mutex_unlock(&pegasus->pm_mutex);
>  
> -	return retval;
> +	return 0;
>  }
>  
>  static const struct usb_device_id pegasus_ids[] = {

Apart from the minor nitpicks,

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


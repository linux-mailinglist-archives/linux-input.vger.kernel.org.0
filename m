Return-Path: <linux-input+bounces-6200-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA3596C756
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFCD11F26696
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46591E5036;
	Wed,  4 Sep 2024 19:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddh6PIQd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A31E4921;
	Wed,  4 Sep 2024 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725477386; cv=none; b=aXmIoguSV3Sv8y7tl26Cqv94TekTuLHZzFojZqixhtvFbRkQEswIwcNnsi8+C4hXAVj4p7p/QFGkOzBQuYnw4IcwmMQO81P9Bp6fGCdPWLLt7LEHiPCkCBoIZMovTvOXQ0yAbnEXT59kTwpAJAE+nns3+tdqWHrk1mpuoV+pnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725477386; c=relaxed/simple;
	bh=nhsrHnEsMlnnTiCbTBVNHbb+/ULqv2U6DtGkCcLXKH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FqZFiCdSWxk0PsZbb/54HSln/JkTnvbWmAqrnx6QBCv7oTFw3TJ+1FBPT2RMsRIUCHfLdD2H5TfWadSxQTqtxcN5C1/jqeYyDRXmEYN6YGZMx01Dk+SHD+3ceJLTykyFaqgvyoZxDFyoaSRa2IMcJVsZCQ/7IyZeafO86c0FxlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddh6PIQd; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f50ca18a13so83934501fa.1;
        Wed, 04 Sep 2024 12:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725477383; x=1726082183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ecWxmSdlEAY3T5UrX15kGaPsyAsRyZMUa4Di/cMCXFI=;
        b=ddh6PIQdDuenxm3k3FHgVuj8hTVI+I83jz+CJkmVDJh/xk5cPfWs+aG4S+dAlXcmSS
         UMzrelBoXOVtDB1ipn/TfoIJQFwhUeWBBL21wJ9CaS++yMuuTNptwlmA7SRSvIx8F8lR
         dMiSgddZaWOR6ZdlYB5bkkOe3fMlqcWz0PyKPUEZDxnAj/yhTA1X73VLYh4j6K89Z8p7
         uP/ZKitHmqIpWMYOeJxnlc/rvPjf+QLs0vyIKam94Z4/O/DSuiz5+5++xmXSD7diKO2M
         +SWzwTkBy4UZeG5h2pXkx/V6JdwkDawUARPhvqrSnWbeEFDVRYp6FXPWibvlFmum8RYV
         HyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725477383; x=1726082183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecWxmSdlEAY3T5UrX15kGaPsyAsRyZMUa4Di/cMCXFI=;
        b=blk7vesi8fdUhgvZuPjWm9VG4KzaVxvYCz9/rYIuJrD4K1k75zNQyZGFJ+Qc48KJpH
         LUUrZ3onlk2TY2ZjOZ5NPloeSC6WZxO7sY8BXmrX/9iIVRY5dNaI++eH1meh/cyfAVuh
         YxkEdrTszDGHlMzUewJSLEQbPkOf+Dev+DpCvoNDqrxyg6RE8052XhecMJJiGwdf+FM3
         sshvZxH0/mJbu+xGMNjQp5o89rp/++zABnfvqz63pID+zYyyYXk3D/A00d2MK4yFvMue
         ngGIY6PygXHgKzTxQw1ZLBqGuDwWV3jhhdmeYDEDhP/pSl7XfOgee9Hy5RJhbpQqAHzM
         U2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+h3tNV89CMFzWrLto5HZzY+lXaa+7Vhx/uyfDOfCw2DXnFw8cUdtazrlf1Hp71bQAegvwIj3prHyPyQ==@vger.kernel.org, AJvYcCWiSIbdgrFIZhgDl/88+9HW4LJXTL7UmEuXiqKsg8MEwFkMOmv858Tt6XAKmDYVzxP/bm/dqeEySDOIyJOX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pn30Jm3coWtGIOpD+txKO6XLHh0Xrqep5/aeAXpZ0NfOUxN4
	qgCDqJ3SvzJys8WLu7aUqNbNFe62WfqLD/nP7VgaiEvGUsDa5oSy
X-Google-Smtp-Source: AGHT+IGIRVLiKyEhxZ1uo9S8EscCI1mmCRNIj9YYobqVKCt+R5Y827KNmuZM1nTVb4rMFFpaX8s3LQ==
X-Received: by 2002:a2e:461a:0:b0:2f6:4f17:aead with SMTP id 38308e7fff4ca-2f64f17b38cmr23257631fa.21.1725477382664;
        Wed, 04 Sep 2024 12:16:22 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc54eafbsm238928a12.33.2024.09.04.12.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:16:22 -0700 (PDT)
Message-ID: <f2bc481b-8560-40b4-88a1-5517c21f5630@gmail.com>
Date: Wed, 4 Sep 2024 21:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/22] Input: powermate - use guard notation when
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
 <20240904044902.1049017-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044902.1049017-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:49, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that locks are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/powermate.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/input/misc/powermate.c b/drivers/input/misc/powermate.c
> index 4b039abffc4b..ecb92ee5ebbc 100644
> --- a/drivers/input/misc/powermate.c
> +++ b/drivers/input/misc/powermate.c
> @@ -194,22 +194,18 @@ static void powermate_sync_state(struct powermate_device *pm)
>  static void powermate_config_complete(struct urb *urb)
>  {
>  	struct powermate_device *pm = urb->context;
> -	unsigned long flags;
>  
>  	if (urb->status)
>  		printk(KERN_ERR "powermate: config urb returned %d\n", urb->status);
>  
> -	spin_lock_irqsave(&pm->lock, flags);
> +	guard(spinlock_irqsave)(&pm->lock);
>  	powermate_sync_state(pm);
> -	spin_unlock_irqrestore(&pm->lock, flags);
>  }
>  
>  /* Set the LED up as described and begin the sync with the hardware if required */
>  static void powermate_pulse_led(struct powermate_device *pm, int static_brightness, int pulse_speed,
>  				int pulse_table, int pulse_asleep, int pulse_awake)
>  {
> -	unsigned long flags;
> -
>  	if (pulse_speed < 0)
>  		pulse_speed = 0;
>  	if (pulse_table < 0)
> @@ -222,8 +218,7 @@ static void powermate_pulse_led(struct powermate_device *pm, int static_brightne
>  	pulse_asleep = !!pulse_asleep;
>  	pulse_awake = !!pulse_awake;
>  
> -
> -	spin_lock_irqsave(&pm->lock, flags);
> +	guard(spinlock_irqsave)(&pm->lock);
>  
>  	/* mark state updates which are required */
>  	if (static_brightness != pm->static_brightness) {
> @@ -245,8 +240,6 @@ static void powermate_pulse_led(struct powermate_device *pm, int static_brightne
>  	}
>  
>  	powermate_sync_state(pm);
> -
> -	spin_unlock_irqrestore(&pm->lock, flags);
>  }
>  
>  /* Callback from the Input layer when an event arrives from userspace to configure the LED */

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


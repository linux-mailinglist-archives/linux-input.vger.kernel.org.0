Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353EF3B244E
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 02:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhFXAoO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Jun 2021 20:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhFXAoN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Jun 2021 20:44:13 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50DDC061574
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 17:41:54 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id v7so3253319pgl.2
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 17:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oJjpSJ1KnjV6k/DnXmjcD/hXxmteZqlfifNyNG+WqB0=;
        b=ZQ9sAX200tijYNd4bY2mggEltcd22x+nTI2IHdADoWLOBOHO+fuoAVJXuYs5kLCo8B
         HW4K5ZkV90FPWZkDtVYAIcLb1+hy3pmKH7eR+d4sdav95/HhJRx+XLFA1y4L8Es58k7w
         Fv+PWS86aOm0H8+a27cYExwpTxBzIVvfhp554xJgqZ5o0ur/+02MP/9OyzS5r8fg3Tfg
         GiPOWcRmfw0QyHDYY5/1V0nEPNMDK4nNY5PpMFmr0Fmu44vz6ATOsaSm4hVRwmYHQX5S
         wZyM4WommzAG267jkcvVOP9Xp20jUq2KqZ0Hnmxoin7FTkTVUyvdvooALPWxPi9FJ3qT
         6fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oJjpSJ1KnjV6k/DnXmjcD/hXxmteZqlfifNyNG+WqB0=;
        b=jjSljZzWc+Mktcdd7GyEmkBYjbc+L3qbPswKk2yKHn6fBetG7mGQigjyr+Qk+UE2uO
         Wu2jZKBQJ9d0jjATAKcgyj3PCqWLgh8NAuOXcKt0Puhso17Cdn15PFRJl+WjxkHhp0jf
         RwIHSEVsoOWccYslTQzxi3BfuxSFq0Y+m9gC6wDkmQAs02z9v89JoeNW0gj+aJiR4y4N
         OrCz0WqW8n3lVKJh4h2rWobwUlEUgJktZ2potG6op0E6WfZG7zVaerzW3BkGV7LY5059
         TcaQLsjK5vtl6B0uCZDMQ4qCIXu7qru3YHBfLtpEaMolb/FHrFOBzdaYq10jqrriCNQh
         jjDw==
X-Gm-Message-State: AOAM5318s4j7BxATr34w8A1Foq4K3zyxPXpe+Y6K1X2gfzEmcjjXsehk
        wpzwUAIkQgpufTbwpuBY6u4=
X-Google-Smtp-Source: ABdhPJx96AW6zQqpdQDtOIe7Jho4C9MtNj9M/Y5AubncDw7+cpcPIW9X+qPSWCS9BywXaJsoWUno9Q==
X-Received: by 2002:a62:7b4c:0:b029:300:6209:83e with SMTP id w73-20020a627b4c0000b02903006209083emr2280872pfc.59.1624495314159;
        Wed, 23 Jun 2021 17:41:54 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:db68:d728:8b76:2cb9])
        by smtp.gmail.com with ESMTPSA id t3sm850182pfl.44.2021.06.23.17.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 17:41:53 -0700 (PDT)
Date:   Wed, 23 Jun 2021 17:41:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: atmel_mxt_ts: Add wake-up support
Message-ID: <YNPUzjrJaJEnR7vo@google.com>
References: <1624456597-9486-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624456597-9486-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Loic,

On Wed, Jun 23, 2021 at 03:56:36PM +0200, Loic Poulain wrote:
> Add capability for the touchscreen to wakeup the host on touch event.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 05de92c..807f449 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -3223,6 +3223,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return error;
>  	}
>  
> +	device_set_wakeup_capable(&client->dev, true);

We do not want to make the touch controller be wakeup source
unconditionally. I2C core recognized "wakeup-source" in device tree,
other platforms may employ different techniques setting I2C_CLIENT_WAKE
when registering I2C devices to mark them as wakeup capable/enabled.

> +
>  	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
>  				      data->regulators);
>  	if (error) {
> @@ -3309,8 +3311,12 @@ static int __maybe_unused mxt_suspend(struct device *dev)
>  
>  	mutex_lock(&input_dev->mutex);
>  
> -	if (input_device_enabled(input_dev))
> -		mxt_stop(data);
> +	if (input_device_enabled(input_dev)) {
> +		if (device_may_wakeup(dev))
> +			enable_irq_wake(data->irq);

For devices that are registered as I2C_CLIENT_WAKE i2c core ensures that
their interrupts are configured for wakeup when system transitions to
sleep state, so you do not need to call enable_irq_wake() and
disable_irq_wake().

You also need to make sure the controller is powered up when it is
configured for wakeup.

> +		else
> +			mxt_stop(data);
> +	}
>  
>  	mutex_unlock(&input_dev->mutex);
>  
> @@ -3332,8 +3338,12 @@ static int __maybe_unused mxt_resume(struct device *dev)
>  
>  	mutex_lock(&input_dev->mutex);
>  
> -	if (input_device_enabled(input_dev))
> -		mxt_start(data);
> +	if (input_device_enabled(input_dev)) {
> +		if (device_may_wakeup(dev))
> +			disable_irq_wake(data->irq);
> +		else
> +			mxt_start(data);
> +	}
>  
>  	mutex_unlock(&input_dev->mutex);
>  
> -- 
> 2.7.4
> 

Thanks.

-- 
Dmitry

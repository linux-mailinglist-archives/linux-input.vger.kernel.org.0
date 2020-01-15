Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDCF13BDC4
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 11:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgAOKuO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jan 2020 05:50:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52968 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728904AbgAOKuO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jan 2020 05:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579085412;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0zPdYw55o/NQ5YWQsGG35pXdQyrv0EYjb0Mj4Frs9Ks=;
        b=enLnaSMdQxg+rRqxahneSLTdm2ENo+aATIEUZtQA2tqAwvbISHbgPbixf3Eor8fwwAk0nB
        EMq/4H0Du/BMPxSuhv4qGZy5Anvj2yJ5Or3zK3NA8u2mKOT4E0XCszC+XssAFAXZJdFejI
        f/W/R+QCilNe+DPKwTNLXTq8FysZxsA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-4kQFVLIeM1qUhRtE6ifrhA-1; Wed, 15 Jan 2020 05:50:11 -0500
X-MC-Unique: 4kQFVLIeM1qUhRtE6ifrhA-1
Received: by mail-wm1-f72.google.com with SMTP id y125so1368706wmg.1
        for <linux-input@vger.kernel.org>; Wed, 15 Jan 2020 02:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0zPdYw55o/NQ5YWQsGG35pXdQyrv0EYjb0Mj4Frs9Ks=;
        b=EkCinEA6WcDWSqeztKC4ZYBkoSUubKN+bblxSDeEehwk/KCmnbGSfmMkrVZvr7UNtt
         6g4Xi9GAw1Oo6Yn/6Csbgy9SU2yL3iHi7ea2rwclJe2rCruMjnTHIR1WWRoiQFDs+urL
         uUqjViEElAb0Lcgp1FwzDKGQuYM7RERs9+PhrbV7U281FdnbfYZsAk5MMuLwFI1q4/hz
         L5C0SDH2XwMCuDsZF97v8yjXbgvAcPvwv5IcB1lqmRUJ3289VrN7Ka5XK4BzXqMQrjw/
         V92YH/hvt7ae9cv5VHWjPxQsR+RrnJS2Spyem4FVllMH6WoqSZufDIBVi0L35CezxTrr
         efPQ==
X-Gm-Message-State: APjAAAW3qO3kP8kY5yug0esFWkRcHGBF+1XmU8x22H9kwVqWRVxukf3U
        pP7iokQ2RYvF4OV+WKKV2DfLXIqgq5MJaj3Y6bVwjUyonBgwgm7AwimEEDpKRckE9edLL80rcde
        xGTBD8Ln3zGWr9KB0QOvaFgg=
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr31182567wmj.168.1579085409808;
        Wed, 15 Jan 2020 02:50:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXY+dnsYNXC/k0VTIyQlvYqpGEx/a/AJP7STlMcs8KdLZzeEcSOCesRyRmKX4FhdBaQrIkKw==
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr31182549wmj.168.1579085409606;
        Wed, 15 Jan 2020 02:50:09 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id r68sm22683998wmr.43.2020.01.15.02.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 02:50:08 -0800 (PST)
Subject: Re: [PATCH v2 1/2] Input: axp20x-pek - Respect userspace wakeup
 configuration
To:     Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20200115051253.32603-1-samuel@sholland.org>
 <20200115051253.32603-2-samuel@sholland.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <674932c7-c120-092f-0255-5fa94925155d@redhat.com>
Date:   Wed, 15 Jan 2020 11:50:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200115051253.32603-2-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 15-01-2020 06:12, Samuel Holland wrote:
> Unlike most other power button drivers, this driver unconditionally
> enables its wakeup IRQ. It should be using device_may_wakeup() to
> respect the userspace configuration of wakeup sources.
> 
> Because the AXP20x MFD device uses regmap-irq, the AXP20x PEK IRQs are
> nested off of regmap-irq's threaded interrupt handler. The device core
> ignores such interrupts, so to actually disable wakeup, we must
> explicitly disable all non-wakeup interrupts during suspend.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/input/misc/axp20x-pek.c | 37 ++++++++++++++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
> index 17c1cca74498..0ace3fe3d7dc 100644
> --- a/drivers/input/misc/axp20x-pek.c
> +++ b/drivers/input/misc/axp20x-pek.c
> @@ -280,7 +280,7 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
>   	}
>   
>   	if (axp20x_pek->axp20x->variant == AXP288_ID)
> -		enable_irq_wake(axp20x_pek->irq_dbr);
> +		device_init_wakeup(&pdev->dev, true);
>   
>   	return 0;
>   }
> @@ -352,6 +352,40 @@ static int axp20x_pek_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int __maybe_unused axp20x_pek_suspend(struct device *dev)
> +{
> +	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
> +
> +	/*
> +	 * As nested threaded IRQs are not automatically disabled during
> +	 * suspend, we must explicitly disable non-wakeup IRQs.
> +	 */
> +	if (device_may_wakeup(dev)) {
> +		enable_irq_wake(axp20x_pek->irq_dbf);
> +		enable_irq_wake(axp20x_pek->irq_dbr);
> +	} else {
> +		disable_irq(axp20x_pek->irq_dbf);
> +		disable_irq(axp20x_pek->irq_dbr);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused axp20x_pek_resume(struct device *dev)
> +{
> +	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev)) {
> +		disable_irq_wake(axp20x_pek->irq_dbf);
> +		disable_irq_wake(axp20x_pek->irq_dbr);
> +	} else {
> +		enable_irq(axp20x_pek->irq_dbf);
> +		enable_irq(axp20x_pek->irq_dbr);
> +	}
> +
> +	return 0;
> +}
> +
>   static int __maybe_unused axp20x_pek_resume_noirq(struct device *dev)
>   {
>   	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
> @@ -371,6 +405,7 @@ static int __maybe_unused axp20x_pek_resume_noirq(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops axp20x_pek_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(axp20x_pek_suspend, axp20x_pek_resume)
>   #ifdef CONFIG_PM_SLEEP
>   	.resume_noirq = axp20x_pek_resume_noirq,
>   #endif
> 


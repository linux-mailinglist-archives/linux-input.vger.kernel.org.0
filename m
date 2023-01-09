Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088526620A5
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 09:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjAIIyS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Jan 2023 03:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234256AbjAIIxH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Jan 2023 03:53:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71AB018E12
        for <linux-input@vger.kernel.org>; Mon,  9 Jan 2023 00:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673253895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VVRr3pem4IVv9X/+Ipx/K58OrzYuB9xFCWEs3yV35Ks=;
        b=iV5Nkq+09y+o+jHQmO/FAsGEhm4kxKEYhBke2xJ8F7NgMCu02RRVPYiMDGDpeShPf9CZr2
        GsQyJS8/ndGnu+Sfs1LGDamCBUQ+1F/eHeu3uV6F/70oYcP7tckVnP2VQrnLmscOqmckAS
        WV8vmiOf/OtnKFPlxSxRZJSOaUgvCLc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-_4IbgSyGMUKKiF0Ge8zhfw-1; Mon, 09 Jan 2023 03:44:54 -0500
X-MC-Unique: _4IbgSyGMUKKiF0Ge8zhfw-1
Received: by mail-ed1-f70.google.com with SMTP id w18-20020a05640234d200b0048cc3aa4993so4766692edc.7
        for <linux-input@vger.kernel.org>; Mon, 09 Jan 2023 00:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VVRr3pem4IVv9X/+Ipx/K58OrzYuB9xFCWEs3yV35Ks=;
        b=T8+K2bQyCCgLUiU+SU4eJ1dINGj4pHW/K96BIqJ32E8vaqSIgQJPZ15uIFN7B75p7K
         XzXT7NdFojY05WNxBcuRpFkxNJreVCwLYp0rBZRAPYs24TUKkvh3MCNlKzyIxqk6Gcl4
         BrU/c3ytVvW+nm0+1y2+CZziHRYt7a4hEeEiFKCJEYx2uQE9lijnI6xs5x7s1MehX5xF
         u92CK1674VuzDTwfubMOJ6hxG9iOAP+ah7fdyqLAZKAKbRkw0Hyx8KDqtGOg+3Vk2m2u
         10TJvLP8HJOTLMVgOBWFrasJuQMX1gKZHtzYbClH9DoD3QAU1ykpfknwC3qau6YoUBzV
         wznQ==
X-Gm-Message-State: AFqh2krhQgPl6QUROgSJvSqOYTXAnl8JCtFHEOyzJ9idPB+XpaCZt/7I
        x6dqOvX1jtmFYnnQYatJ4NBTxkD0G8fMkdIN2rxloG+lLz34gXhggpYS4IJtVepLtGNtsx04Y/U
        EdI8l5N9H2Zv6sJTj/DWulFk=
X-Received: by 2002:a17:906:2816:b0:7c0:d452:2e74 with SMTP id r22-20020a170906281600b007c0d4522e74mr54880226ejc.4.1673253892820;
        Mon, 09 Jan 2023 00:44:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuXkJ9YE3/Kd3gQaBXO07CT3syOegPUB0Fw06fFfpXWG0TCbFfOczPg5UwQ6Q6eAWtwhOODpA==
X-Received: by 2002:a17:906:2816:b0:7c0:d452:2e74 with SMTP id r22-20020a170906281600b007c0d4522e74mr54880220ejc.4.1673253892620;
        Mon, 09 Jan 2023 00:44:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060cd200b0084c723a626csm3440106ejh.209.2023.01.09.00.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:44:52 -0800 (PST)
Message-ID: <d5f7a425-e978-fc8c-7992-59b519cd21df@redhat.com>
Date:   Mon, 9 Jan 2023 09:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 44/69] input: ektf2127 - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Content-Language: en-US, nl
To:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-45-jic23@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230102181842.718010-45-jic23@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/2/23 19:18, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/touchscreen/ektf2127.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
> index 328841eaa1b7..e6f1e46d003d 100644
> --- a/drivers/input/touchscreen/ektf2127.c
> +++ b/drivers/input/touchscreen/ektf2127.c
> @@ -177,7 +177,7 @@ static void ektf2127_stop(struct input_dev *dev)
>  	gpiod_set_value_cansleep(ts->power_gpios, 0);
>  }
>  
> -static int __maybe_unused ektf2127_suspend(struct device *dev)
> +static int ektf2127_suspend(struct device *dev)
>  {
>  	struct ektf2127_ts *ts = i2c_get_clientdata(to_i2c_client(dev));
>  
> @@ -189,7 +189,7 @@ static int __maybe_unused ektf2127_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused ektf2127_resume(struct device *dev)
> +static int ektf2127_resume(struct device *dev)
>  {
>  	struct ektf2127_ts *ts = i2c_get_clientdata(to_i2c_client(dev));
>  
> @@ -201,8 +201,8 @@ static int __maybe_unused ektf2127_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(ektf2127_pm_ops, ektf2127_suspend,
> -			 ektf2127_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(ektf2127_pm_ops, ektf2127_suspend,
> +				ektf2127_resume);
>  
>  static int ektf2127_query_dimension(struct i2c_client *client, bool width)
>  {
> @@ -348,7 +348,7 @@ MODULE_DEVICE_TABLE(i2c, ektf2127_i2c_id);
>  static struct i2c_driver ektf2127_driver = {
>  	.driver = {
>  		.name	= "elan_ektf2127",
> -		.pm	= &ektf2127_pm_ops,
> +		.pm	= pm_sleep_ptr(&ektf2127_pm_ops),
>  		.of_match_table = of_match_ptr(ektf2127_of_match),
>  	},
>  	.probe_new = ektf2127_probe,


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C521240FF7E
	for <lists+linux-input@lfdr.de>; Fri, 17 Sep 2021 20:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235405AbhIQSjC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Sep 2021 14:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31485 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231364AbhIQSjA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Sep 2021 14:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631903855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2uGSUJ4OwEDinUYdbE9Xm9EZmCzZGXaFlbE5avYj6BU=;
        b=OUGWmISgq3xUbkIgf6DVgBfNxw2lgDnBqsehJbSdiHhlkOAuAKbYO3UiEzIsR+8uRM34zm
        SFOxKLhlbVfprElvi3ryMVMiIyOaG6k9RVHbwwKImlCarjwNJaekrWcIHUkzva1mgsEwOs
        R+c8AxS5YCt3kVziXu8/eyypr81wIKg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-tfXZH0NYP-Cy2NHjnKEt4Q-1; Fri, 17 Sep 2021 14:37:34 -0400
X-MC-Unique: tfXZH0NYP-Cy2NHjnKEt4Q-1
Received: by mail-ed1-f69.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so9894619edy.14
        for <linux-input@vger.kernel.org>; Fri, 17 Sep 2021 11:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2uGSUJ4OwEDinUYdbE9Xm9EZmCzZGXaFlbE5avYj6BU=;
        b=101s8E7+UBU8InMBV0mLtGoa47dln4++eryeRYZXT2CAEOYAGABwLl5aYFkUOO7JAF
         7NtHypLFylrB2+0nz3T8wLFxbSDsWYhNyogUfOfS8sz7w9Za+ymP0y8stoweahcIgJVS
         L6D6hz86HpchVhJmXM4dERgzcKD1IbYX+HMHV2bPT60UIqxM/oqeGV8oK9y0zgN+rzch
         SjvQzrGIj33grtfZJyZeZQXXgWk6VkbQfpKSqOYHjoDt/y7ZLYJM7kfkW6T5YDvotdqD
         JV3/Rvv157X4Lh7w8jGjxmMgc1fOuTuS2f+JoOe4atXIRwr/Fl1Z6KwcVykpPOzv+psN
         tLXw==
X-Gm-Message-State: AOAM531bE7vQXdQKimozt2FGfNmV7hemBQhJbUb0fkwWu7C83Wzb+K++
        BPc4ipO0hwjThh/i04leoybieBLUMv36C7Kzh7sIISaWplwBeuYKV7HLaoO99XcCmlde7CaIudF
        hoGmZ1C6trFttbYaOYDpwqk4=
X-Received: by 2002:a50:e1c4:: with SMTP id m4mr6128299edl.307.1631903853526;
        Fri, 17 Sep 2021 11:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNbhN9Xkm6HUn/UupN6L6rbjYldGZ9ByZPcxb82N8bRPpnSTbC7H/rf8BnRjTmNHq7BNslfg==
X-Received: by 2002:a50:e1c4:: with SMTP id m4mr6128287edl.307.1631903853384;
        Fri, 17 Sep 2021 11:37:33 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id e22sm3175909edu.35.2021.09.17.11.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 11:37:33 -0700 (PDT)
Subject: Re: [PATCH] Input: silead - Make use of the helper function
 dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210916153426.15158-1-caihuoqing@baidu.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <83e5b7db-4707-0ab3-c02e-e467c3190358@redhat.com>
Date:   Fri, 17 Sep 2021 20:37:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916153426.15158-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 9/16/21 5:34 PM, Cai Huoqing wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/input/touchscreen/silead.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 1ee760bac0cf..adfac271f0b5 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -548,11 +548,9 @@ static int silead_ts_probe(struct i2c_client *client,
>  
>  	/* Power GPIO pin */
>  	data->gpio_power = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
> -	if (IS_ERR(data->gpio_power)) {
> -		if (PTR_ERR(data->gpio_power) != -EPROBE_DEFER)
> -			dev_err(dev, "Shutdown GPIO request failed\n");
> -		return PTR_ERR(data->gpio_power);
> -	}
> +	if (IS_ERR(data->gpio_power))
> +		return dev_err_probe(dev, PTR_ERR(data->gpio_power),
> +				     "Shutdown GPIO request failed\n");
>  
>  	error = silead_ts_setup(client);
>  	if (error)
> 


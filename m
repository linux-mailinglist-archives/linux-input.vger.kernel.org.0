Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044FE6C46BB
	for <lists+linux-input@lfdr.de>; Wed, 22 Mar 2023 10:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjCVJmq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Mar 2023 05:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjCVJmp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Mar 2023 05:42:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6277215C92
        for <linux-input@vger.kernel.org>; Wed, 22 Mar 2023 02:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679478118;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DFGRBQosIj9vyHsVGDhOFNURTnbZjTQuyPtt51CKxoE=;
        b=UesyR/Vo4Jzz3JfdyQ1JzzklEQiLUcowuXraGDqmSWW+NxswxjcC37qFS53JtA4nSxYXDd
        m8O8e/aU4PxBEO1pLEBd3cUHuontFc+ZDnE02MGUt1SKr4aAgLReqR5AwCmtsq5tAcQNvW
        giTLgRQklI2F8KsHfQxcp6C55mS9FC8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-NcG-zdD0PaiJq8dAdL70_w-1; Wed, 22 Mar 2023 05:41:57 -0400
X-MC-Unique: NcG-zdD0PaiJq8dAdL70_w-1
Received: by mail-ed1-f70.google.com with SMTP id e18-20020a056402191200b004fa702d64b3so26702156edz.23
        for <linux-input@vger.kernel.org>; Wed, 22 Mar 2023 02:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679478116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFGRBQosIj9vyHsVGDhOFNURTnbZjTQuyPtt51CKxoE=;
        b=xUiokyPu3ShW9F4bHXVFIjiHEIUAj7PzunpjN9FC3MNgjFa05CNozvcEQv9eQmeglV
         4uwiL4gvD00MYatWi8IrXV/N0ESfK3KZyjXnEx5ipBavPc7UljQoyVwid996Ux5bxI6i
         XPdg+yuANGtjY3zUPLxxuaK6x0BtoY+LJtDtRUYrFpUqfyDCJUyG8nVtbDRZ6pkds2Jl
         s5B1D0+KPkruiZBfB/KFvFUpNToEmwdfx/MOWXAJ79Q2FGa2HyjcEuxpIXeZKCJt9MA8
         LGBhnQkjqoE/Z1dkV2up8OnlrOvXcf3qIGfumj/RExOKEGuTZO38ezi9+0dPk9gVt1xR
         JoRA==
X-Gm-Message-State: AO0yUKXREPn73DbhAkjpxhYX49MjxgmcGInxr64NfCO5iYAVNxra3xUA
        Kq5w5zRPNvQ9IBvlMsw+Wygi0nYluTYvK/jmEtvGlTzQqF5yB5huUWHIJu16wgQ65OsJPgO7xt0
        BJMF+BEpnqFDcy/8XgdPtJIO0TujABmc=
X-Received: by 2002:a17:907:78cf:b0:889:58bd:86f1 with SMTP id kv15-20020a17090778cf00b0088958bd86f1mr6376579ejc.14.1679478115884;
        Wed, 22 Mar 2023 02:41:55 -0700 (PDT)
X-Google-Smtp-Source: AK7set+pP0DzvWK9D2FJXhcECGDV7IlfuKGizE5Hr2SqOPT5W6JnRpLmA0d6YfCqhnBNmfbBA6z1xw==
X-Received: by 2002:a17:907:78cf:b0:889:58bd:86f1 with SMTP id kv15-20020a17090778cf00b0088958bd86f1mr6376562ejc.14.1679478115557;
        Wed, 22 Mar 2023 02:41:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ot17-20020a170906ccd100b008e51a1fd7bfsm7026055ejb.172.2023.03.22.02.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 02:41:54 -0700 (PDT)
Message-ID: <41a38d9c-ad41-6611-1b43-dee9c557bdef@redhat.com>
Date:   Wed, 22 Mar 2023 10:41:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Input: silead - Use dev_err_probe()
To:     ye.xingchen@zte.com.cn
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202303221650190306634@zte.com.cn>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202303221650190306634@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/22/23 09:50, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/input/touchscreen/silead.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index a37fac089010..f464155aed65 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -706,11 +706,9 @@ static int silead_ts_probe(struct i2c_client *client)
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


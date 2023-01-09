Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F122C66209E
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 09:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbjAIIxG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Jan 2023 03:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236711AbjAIIwd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Jan 2023 03:52:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A84E186BA
        for <linux-input@vger.kernel.org>; Mon,  9 Jan 2023 00:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673253876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E8q5jpTo62ZXlOOGGv2dS1aCiXpU1bZezyIGO2F7ao0=;
        b=CKe+nnLGa6NJXeHSKkGmUewcPEddQvhw5w9Vqxx9yO7fGcVp05kIhVJJn4d5KpQdiolcj0
        RVoToWcmIuBC4DaVHsc10xYJRA5L6ExZAcM8KuZxc3c3sz8t0GduZk0J0V9O3zSSH0mtKE
        t72LYQ1OMSqJWuV8a/pkASlYEGoAScs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-TxmdAkwvOkOaIF_9vSfOUA-1; Mon, 09 Jan 2023 03:44:34 -0500
X-MC-Unique: TxmdAkwvOkOaIF_9vSfOUA-1
Received: by mail-ej1-f71.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso4942636ejb.14
        for <linux-input@vger.kernel.org>; Mon, 09 Jan 2023 00:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8q5jpTo62ZXlOOGGv2dS1aCiXpU1bZezyIGO2F7ao0=;
        b=4giyoBtT8zNsNam8JrgpA1SKG43XKXrhVlbuyul+eCjG1RFLSRkHqUrPxHnkfBdv/q
         vkNcmOj4YMCTPlSK6DDywxcmIT7J3JgQPcHLfEt8+ZR4UHjRMRF2+53XyALzCWVY+16N
         8qZ4YVHpQ9rRH5Qn12Y+xzWQNGBjghB2rUjMLFJ+bJ8Pg+pWW/5l8kksgnVQ0pgu/jbJ
         TwKLs2YcjlCwRFld7XsAOrpp7Yl4FK93CWz9+5WJota7BCFWNWvwaVh1UA/+wQQgWPsb
         aop5/4S/ouFvsWAT9ce00i/o2e0R0n764Nk7+DcLsFojNh9Ccu8gnKkHAFPiLLKCwOHQ
         Wtzg==
X-Gm-Message-State: AFqh2kpGplC07hR6LIrvYavjaqszLoRb/5cjWAMc/L7YFft9w2Fpc16U
        352YaGcdrYeLxI6KXID0p5DzsvZ4g7tNVm99ZDB/0IDTOawF1zIAHazyW0DYpBZ08erc6xTNWuF
        7N+02HuZ8ZNugfh2IcgoodZw=
X-Received: by 2002:a05:6402:2:b0:483:5e56:7bc5 with SMTP id d2-20020a056402000200b004835e567bc5mr43659836edu.40.1673253873608;
        Mon, 09 Jan 2023 00:44:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvEWKrRwylHa8Df0azEda6waifEazhezH5/O9DzsUjNiHtwziQxoD/ho42S82Wi2RrKzLLLNQ==
X-Received: by 2002:a05:6402:2:b0:483:5e56:7bc5 with SMTP id d2-20020a056402000200b004835e567bc5mr43659831edu.40.1673253873398;
        Mon, 09 Jan 2023 00:44:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p3-20020a056402500300b00488abbbadb3sm3414601eda.63.2023.01.09.00.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:44:32 -0800 (PST)
Message-ID: <78f675ed-c9c0-156e-b588-d8e70868b823@redhat.com>
Date:   Mon, 9 Jan 2023 09:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 37/69] Input: chipone_in8318 - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Content-Language: en-US, nl
To:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-38-jic23@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230102181842.718010-38-jic23@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
> removed. Thus also drop the #ifdef guards.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/touchscreen/chipone_icn8318.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
> index f6769e4bd4f2..32b714a6ed2d 100644
> --- a/drivers/input/touchscreen/chipone_icn8318.c
> +++ b/drivers/input/touchscreen/chipone_icn8318.c
> @@ -148,7 +148,6 @@ static void icn8318_stop(struct input_dev *dev)
>  	gpiod_set_value_cansleep(data->wake_gpio, 0);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int icn8318_suspend(struct device *dev)
>  {
>  	struct icn8318_data *data = i2c_get_clientdata(to_i2c_client(dev));
> @@ -172,9 +171,8 @@ static int icn8318_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
> -static SIMPLE_DEV_PM_OPS(icn8318_pm_ops, icn8318_suspend, icn8318_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(icn8318_pm_ops, icn8318_suspend, icn8318_resume);
>  
>  static int icn8318_probe(struct i2c_client *client)
>  {
> @@ -263,7 +261,7 @@ MODULE_DEVICE_TABLE(i2c, icn8318_i2c_id);
>  static struct i2c_driver icn8318_driver = {
>  	.driver = {
>  		.name	= "chipone_icn8318",
> -		.pm	= &icn8318_pm_ops,
> +		.pm	= pm_sleep_ptr(&icn8318_pm_ops),
>  		.of_match_table = icn8318_of_match,
>  	},
>  	.probe_new = icn8318_probe,


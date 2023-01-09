Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0359F6620A8
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 09:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233357AbjAIIyT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Jan 2023 03:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbjAIIxS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Jan 2023 03:53:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583D11900C
        for <linux-input@vger.kernel.org>; Mon,  9 Jan 2023 00:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673253904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WHMPsZ2LAhFDTPza7KSNM9WKo2j0Lf1I7t8L6fiitkk=;
        b=PZM7b0H80tu/AmC5kp9Et5HDhUVppi4HGXdljjEhNlXhmhRjOh4K93Vnbgq2+R5OuG2ZCY
        moAa1MAfhwC6sjejZ3svwtl/jFv/YXuDHlXMkppJRPM3/HIF4uD5q0X353B+1lnMAfWI9I
        I5CQF+t9SMwpBHzAPLYZL5m+TiQFXKU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-5p_wudOtNB20Jh64LZohlQ-1; Mon, 09 Jan 2023 03:45:03 -0500
X-MC-Unique: 5p_wudOtNB20Jh64LZohlQ-1
Received: by mail-ej1-f69.google.com with SMTP id jg25-20020a170907971900b007c0e98ad898so4949051ejc.15
        for <linux-input@vger.kernel.org>; Mon, 09 Jan 2023 00:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHMPsZ2LAhFDTPza7KSNM9WKo2j0Lf1I7t8L6fiitkk=;
        b=nCBHpb/bft1Ts6wcCoRM1Rsu4u3A83RJ9rmsEgQdwkft6r+Ky87ZqGlpy0wTMk8iyZ
         VrgtwOc4hj0i6icaH7JcdpmJJCIJp3LGrOKsgpVbg7vE9GgEIvE6C3JLIA56iKGF3sS+
         dw29vL04YYXRdAjZWb/MMFxS/k9N+Y/ILvD7a4Pn8esP+FnK5L9KHi3EG27ugSjctO5C
         j0evzVk8U2SzpDxklsIZU/XunuL4GLwGjuL/gF8jRZz2FfaTGG6dE3B2m/u5Zaj+u7G2
         2/MTK+8LSspW07gAApAzyRo7itf6La/NzwdgtwAnBdjbsk2e327PFGP5qxP2KO73BPOf
         92oA==
X-Gm-Message-State: AFqh2kr8eG/wq68jfX2jFg43rn1wduNAgdkbGy1xrWA9o7eLwBuXLtAw
        wPF1K4GoF+edAeR7vYBilctmtxVB5/Pv+8yHfACDWg/6U3Zf3HpkfuXWVl5AO05OYojjxaIeGrQ
        d0TUC+GaY+sy+QtH4J4/CZaA=
X-Received: by 2002:a17:906:9616:b0:78d:f457:108f with SMTP id s22-20020a170906961600b0078df457108fmr54419556ejx.76.1673253902316;
        Mon, 09 Jan 2023 00:45:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuiM1vALaXH1AGVV/25wAQittRUIqC22A5fXddfodZgxNdrWry+psEDHOBIEIi4mqlxpuxPcA==
X-Received: by 2002:a17:906:9616:b0:78d:f457:108f with SMTP id s22-20020a170906961600b0078df457108fmr54419548ejx.76.1673253902082;
        Mon, 09 Jan 2023 00:45:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id os24-20020a170906af7800b0084cfec99548sm3511696ejb.222.2023.01.09.00.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:45:01 -0800 (PST)
Message-ID: <3edda5a5-b413-1012-aee2-263d36991a3e@redhat.com>
Date:   Mon, 9 Jan 2023 09:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 46/69] Input: goodix - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Content-Language: en-US, nl
To:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bastien Nocera <hadess@hadess.net>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-47-jic23@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230102181842.718010-47-jic23@kernel.org>
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
> removed. Thus also drop the __maybe_unused markings.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Bastien Nocera <hadess@hadess.net>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/touchscreen/goodix.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 8a0a8078de8f..b348172f19c3 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1401,7 +1401,7 @@ static void goodix_ts_remove(struct i2c_client *client)
>  		wait_for_completion(&ts->firmware_loading_complete);
>  }
>  
> -static int __maybe_unused goodix_suspend(struct device *dev)
> +static int goodix_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct goodix_ts_data *ts = i2c_get_clientdata(client);
> @@ -1448,7 +1448,7 @@ static int __maybe_unused goodix_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused goodix_resume(struct device *dev)
> +static int goodix_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct goodix_ts_data *ts = i2c_get_clientdata(client);
> @@ -1497,7 +1497,7 @@ static int __maybe_unused goodix_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(goodix_pm_ops, goodix_suspend, goodix_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(goodix_pm_ops, goodix_suspend, goodix_resume);
>  
>  static const struct i2c_device_id goodix_ts_id[] = {
>  	{ "GDIX1001:00", 0 },
> @@ -1543,7 +1543,7 @@ static struct i2c_driver goodix_ts_driver = {
>  		.name = "Goodix-TS",
>  		.acpi_match_table = ACPI_PTR(goodix_acpi_match),
>  		.of_match_table = of_match_ptr(goodix_of_match),
> -		.pm = &goodix_pm_ops,
> +		.pm = pm_sleep_ptr(&goodix_pm_ops),
>  	},
>  };
>  module_i2c_driver(goodix_ts_driver);


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0176C6620AB
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 09:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbjAIIyX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Jan 2023 03:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236968AbjAIIxw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Jan 2023 03:53:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C35E19C11
        for <linux-input@vger.kernel.org>; Mon,  9 Jan 2023 00:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673253913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EfKGawghBZdsRFPfs5p9QceNL5m8jQj9g6qWgcPYJiw=;
        b=P9ieauosiv9bvuxoRo1PK8a0pzSPbr2nvbEvlC7Mugdh9YWkCRQGPpCWvi6J9u66Zymlz8
        xJfwjHDNphC7XtLEyE4QcKtTpst490CDUGeXYOfhJADXrzG/EzNGeXElCGCS8+skTKRNWt
        KxxWvq7r/zc96kzy6Ou1uf3uMYL9Rm4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663--W62hlPQPJGR4OUJ_c7omw-1; Mon, 09 Jan 2023 03:45:12 -0500
X-MC-Unique: -W62hlPQPJGR4OUJ_c7omw-1
Received: by mail-ej1-f69.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso4943559ejb.14
        for <linux-input@vger.kernel.org>; Mon, 09 Jan 2023 00:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EfKGawghBZdsRFPfs5p9QceNL5m8jQj9g6qWgcPYJiw=;
        b=sl9zrnLonz2YJ7XGDR62aHcTUb0sLBoqWA5tC9gkx89k+o/SpFMscdHIf5xiV7UN+q
         xBTvEusNPPFsG4Cgg6Kw/Xf6uf1Prz00zi9r80uNc5frytKsEuhyBUtjZaCOlOndSN1s
         Bug7w7oYRsNUGW/PsQrzK2+JB/EsxB27t/l3shheH55lGeInt62wrqdgWNSratTFnPJ/
         sSnZb81CX2tU1NS+rhFYKB0CQDQ4w/c77QyQDmAOx3/XeeXl2wQNY9/5Fmzr7inW0hSS
         XgI/ngfnaOXuLnKoTud/zGh4XIM02oy/6k+zCHLC5fwDG6bcBCQ17Qov/nakAo0V9Ml1
         qhJg==
X-Gm-Message-State: AFqh2kpLdpzABNvEPRt7OCeObC3goB76as0xXFSV3VKNOjCrr3EeSYPs
        dP5tRStCsSPolHCCWH7y/EiaPDNqwe2YtF3Oi1l++064vpc3oa3r1+zC6wPb5QtePenvJidA1ey
        hoIfgUxN2bCb5kzz2PeJv1S4=
X-Received: by 2002:a17:907:d38c:b0:7c0:b0f9:e360 with SMTP id vh12-20020a170907d38c00b007c0b0f9e360mr55435868ejc.16.1673253911026;
        Mon, 09 Jan 2023 00:45:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvEP4Rjwae9rdl/LculB7XO/9Ofg5tfBHr2OXntq7mHFea+kvg4rLxU09JEI1dv4mDJRWzpoQ==
X-Received: by 2002:a17:907:d38c:b0:7c0:b0f9:e360 with SMTP id vh12-20020a170907d38c00b007c0b0f9e360mr55435860ejc.16.1673253910825;
        Mon, 09 Jan 2023 00:45:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p14-20020a170906784e00b00849c1e5c00esm3460991ejm.72.2023.01.09.00.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:45:10 -0800 (PST)
Message-ID: <f04c6477-a457-37ea-fb53-0321a8c04767@redhat.com>
Date:   Mon, 9 Jan 2023 09:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 59/69] Input: silead - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Content-Language: en-US, nl
To:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-60-jic23@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230102181842.718010-60-jic23@kernel.org>
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

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/touchscreen/silead.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 8a7351c4414c..a37fac089010 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -736,7 +736,7 @@ static int silead_ts_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int __maybe_unused silead_ts_suspend(struct device *dev)
> +static int silead_ts_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  
> @@ -745,7 +745,7 @@ static int __maybe_unused silead_ts_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused silead_ts_resume(struct device *dev)
> +static int silead_ts_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	bool second_try = false;
> @@ -784,7 +784,7 @@ static int __maybe_unused silead_ts_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(silead_ts_pm, silead_ts_suspend, silead_ts_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(silead_ts_pm, silead_ts_suspend, silead_ts_resume);
>  
>  static const struct i2c_device_id silead_ts_id[] = {
>  	{ "gsl1680", 0 },
> @@ -832,7 +832,7 @@ static struct i2c_driver silead_ts_driver = {
>  		.name = SILEAD_TS_NAME,
>  		.acpi_match_table = ACPI_PTR(silead_ts_acpi_match),
>  		.of_match_table = of_match_ptr(silead_ts_of_match),
> -		.pm = &silead_ts_pm,
> +		.pm = pm_sleep_ptr(&silead_ts_pm),
>  	},
>  };
>  module_i2c_driver(silead_ts_driver);


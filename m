Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 395F1630ED8
	for <lists+linux-input@lfdr.de>; Sat, 19 Nov 2022 13:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbiKSM7B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Nov 2022 07:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbiKSM7A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Nov 2022 07:59:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BF39E944
        for <linux-input@vger.kernel.org>; Sat, 19 Nov 2022 04:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668862644;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DoohYdxomzFI0EF/wRsM8Z079B1g2KPQS7s9vOJu/Uc=;
        b=BVhrwyq79wddoViaeNFTQwjoE5t6DjemK35z0ynvjO3L0aj85h/9xisW+TVaocYEBiM/cc
        QHJOpZiEQFHorAzj2KlsWxOVEAd7K4x+Yspjv47pxubw12on6VnmMUt4efquz+sn+O+xzP
        X6a+clycxE8l5ZPzGaJbDe6EBdsDf/I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-128-jo4coQCEPoa2GgAGSF-THg-1; Sat, 19 Nov 2022 07:57:23 -0500
X-MC-Unique: jo4coQCEPoa2GgAGSF-THg-1
Received: by mail-ej1-f72.google.com with SMTP id qf25-20020a1709077f1900b0078c02a23da3so4615115ejc.0
        for <linux-input@vger.kernel.org>; Sat, 19 Nov 2022 04:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoohYdxomzFI0EF/wRsM8Z079B1g2KPQS7s9vOJu/Uc=;
        b=Hp1kUfCa2qs8MYiol3+9LE9pXyuFGVr445B+OgxPk9JCfwxtxr9dwaYOvK6fEAl9VU
         LDOpvqr6S8n1gwQ9xe4suNUDR8mqNtj/+Fn130udrSJopKVweHHf2MRQJvZ0/YGOUmcp
         ymkXAIpqdrRrnU7QKQvA9zivgB89IgfEdrdaAoHvEMifw+WmDX76QODVQvM9s7DXsAj1
         4AKDXrOiH2GKwEyBHAPNlrYd4NjxnfJ2VO29RD67M7h3ajZbnWWpi0rx6O7TYMFHvJ1E
         6a9+YfHlSuv1kYgcxkK4C19bhIjAcHTKrFevn93b4LH6FZw+faOyuNiTFB0iBqNEq94s
         l3eg==
X-Gm-Message-State: ANoB5pk0y/h/XCc77b9aBrADXbPweOApLnNjT3dcPFct5Y6tIi5nQBmp
        a8cMBgKOIURANeOeuPJBmTZ9VVqsj00tL9Uj1D2LLkVs+eV0dKFHDV3qYKQVA82wQwOTwFRjACk
        qHrOQwRWe0vwHYxmEpOw+ID0=
X-Received: by 2002:a17:907:b606:b0:7af:ecf4:61c0 with SMTP id vl6-20020a170907b60600b007afecf461c0mr9552291ejc.178.1668862642265;
        Sat, 19 Nov 2022 04:57:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52zR3yzGKuX9psCaXYWLRlwDF0kXnEq4EPv6Qz9MZI/7RUZoujsjIKJ5PgKZTbB+EpzM/yRA==
X-Received: by 2002:a17:907:b606:b0:7af:ecf4:61c0 with SMTP id vl6-20020a170907b60600b007afecf461c0mr9552274ejc.178.1668862642057;
        Sat, 19 Nov 2022 04:57:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u22-20020aa7d896000000b00459f4974128sm2946114edq.50.2022.11.19.04.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 04:57:21 -0800 (PST)
Message-ID: <16a6e578-6e05-301d-cc0d-996cfc339110@redhat.com>
Date:   Sat, 19 Nov 2022 13:57:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 231/606] Input: chipone_icn8318 - Convert to i2c's
 .probe_new()
Content-Language: en-US, nl
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-232-uwe@kleine-koenig.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221118224540.619276-232-uwe@kleine-koenig.org>
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

On 11/18/22 23:39, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/touchscreen/chipone_icn8318.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
> index f2fb41fb031e..f6769e4bd4f2 100644
> --- a/drivers/input/touchscreen/chipone_icn8318.c
> +++ b/drivers/input/touchscreen/chipone_icn8318.c
> @@ -176,8 +176,7 @@ static int icn8318_resume(struct device *dev)
>  
>  static SIMPLE_DEV_PM_OPS(icn8318_pm_ops, icn8318_suspend, icn8318_resume);
>  
> -static int icn8318_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int icn8318_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct icn8318_data *data;
> @@ -267,7 +266,7 @@ static struct i2c_driver icn8318_driver = {
>  		.pm	= &icn8318_pm_ops,
>  		.of_match_table = icn8318_of_match,
>  	},
> -	.probe = icn8318_probe,
> +	.probe_new = icn8318_probe,
>  	.id_table = icn8318_i2c_id,
>  };
>  


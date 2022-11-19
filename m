Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80376630EDB
	for <lists+linux-input@lfdr.de>; Sat, 19 Nov 2022 13:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbiKSM7D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Nov 2022 07:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbiKSM7C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Nov 2022 07:59:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A554E9E96C
        for <linux-input@vger.kernel.org>; Sat, 19 Nov 2022 04:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668862658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=grM0b1rhOZ7QNvsVUn5HC172wdCzsZ8WYGZE4EbRE1g=;
        b=TA2ZhypJkLttZrVDNgho5oqEY7iXodK8V59cy26JLeFRk9H7FsII0z7+LfuKQNPE4nqezR
        oW9fdXudPjHRRYlXLDpw/9cX/1V4Tc0HP7vIYwl2PrxGaVzPT56JJCo5WFLAL6Ed4RcC2o
        bOFQOT4DI/eDaUVY0u5xdwr/kMpAJsg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-WIHtwyXaMiyjQLh4w64nnQ-1; Sat, 19 Nov 2022 07:57:37 -0500
X-MC-Unique: WIHtwyXaMiyjQLh4w64nnQ-1
Received: by mail-ed1-f69.google.com with SMTP id m13-20020a056402510d00b0046913fa9291so2079388edd.6
        for <linux-input@vger.kernel.org>; Sat, 19 Nov 2022 04:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grM0b1rhOZ7QNvsVUn5HC172wdCzsZ8WYGZE4EbRE1g=;
        b=yBr06L7H+cswiHhTQpid0GJnC6/6xdzC0TwQAh87EJNeUIkupUujmtLqTQQdQqjfn9
         al5IPqNxO8CvlffEOBl2woMESG1Bb73hP8LCPZY+JBYJme2xWsnJfOUUSEc/+UzWEmJd
         05qY4e6doS0Gbb4oelTO8izr2ZhPbf7cj0KDhRJfoGH9eYCO8H4A159uWpW/Sti+D5eV
         flL6zQ60f5OJN64aB4JkKJfFa6VmsZpvkbUHq8w5hrreadZGNyBHGQDOlMDSDQE6iQBX
         +N6VE4EgIhEej7j2H/0kPTKBlgoHVc3tUgnfI9FcoG2RnPAuylQbYUkJm5rjEyX0380X
         d2Kg==
X-Gm-Message-State: ANoB5pmLtgP3ABoZpj6VQeUci+IfBAqCOAYqpzoR5nlyXl3//8vx/Nv1
        rEr/EGYH2y857y+og8h6jjF5HVOs93L4kuDeLUd6tk2FfkITXFZweGx4TJtiAmjoRPoRRn0819S
        uucNSLCjOu/XzVEDaEPJRDl0=
X-Received: by 2002:a05:6402:b1a:b0:469:15eb:71b5 with SMTP id bm26-20020a0564020b1a00b0046915eb71b5mr4800356edb.312.1668862654412;
        Sat, 19 Nov 2022 04:57:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5IJAKQ8WPZChDMi40oyMPY0++sRl542avbymdZdHQ9tGoMVyhva9Ayksdzq9SX0awFf2h8tg==
X-Received: by 2002:a05:6402:b1a:b0:469:15eb:71b5 with SMTP id bm26-20020a0564020b1a00b0046915eb71b5mr4800349edb.312.1668862654199;
        Sat, 19 Nov 2022 04:57:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id gq20-20020a170906e25400b007aece68483csm2830602ejb.193.2022.11.19.04.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 04:57:33 -0800 (PST)
Message-ID: <1fb89e36-366b-b708-7b25-351286b75253@redhat.com>
Date:   Sat, 19 Nov 2022 13:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 241/606] Input: goodix - Convert to i2c's .probe_new()
Content-Language: en-US, nl
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-242-uwe@kleine-koenig.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221118224540.619276-242-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
>  drivers/input/touchscreen/goodix.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index c281e49826c2..8a0a8078de8f 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1282,8 +1282,7 @@ static void goodix_disable_regulators(void *arg)
>  	regulator_disable(ts->avdd28);
>  }
>  
> -static int goodix_ts_probe(struct i2c_client *client,
> -			   const struct i2c_device_id *id)
> +static int goodix_ts_probe(struct i2c_client *client)
>  {
>  	struct goodix_ts_data *ts;
>  	const char *cfg_name;
> @@ -1537,7 +1536,7 @@ MODULE_DEVICE_TABLE(of, goodix_of_match);
>  #endif
>  
>  static struct i2c_driver goodix_ts_driver = {
> -	.probe = goodix_ts_probe,
> +	.probe_new = goodix_ts_probe,
>  	.remove = goodix_ts_remove,
>  	.id_table = goodix_ts_id,
>  	.driver = {


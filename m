Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF29630ED3
	for <lists+linux-input@lfdr.de>; Sat, 19 Nov 2022 13:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbiKSM6M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Nov 2022 07:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbiKSM6K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Nov 2022 07:58:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 641479E0AE
        for <linux-input@vger.kernel.org>; Sat, 19 Nov 2022 04:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668862635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3ZLrYgChEilRNXcz3x7R3l8Y3PsKaP5ZzhNykAinpEw=;
        b=D8yQOnqe0yRMJC55VrDHl1byFK5UWMcouqDx9cgATH5Z9Nni0C0hf+vcUCC0lqIBKtqvqz
        oZS8OD+uMyi8KSxCjh372EPaRkIY5/YNnkkvhWU3z4hsNUoYcqWPYVQ4WJz4N3GkyNn6rp
        THGNlkxEJ1xTEOm8eriC8SCzp5dITZQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-sMnqNsmVNCqctU2LvgBPfQ-1; Sat, 19 Nov 2022 07:57:14 -0500
X-MC-Unique: sMnqNsmVNCqctU2LvgBPfQ-1
Received: by mail-ej1-f69.google.com with SMTP id jg27-20020a170907971b00b007ad9892f5f6so4655500ejc.7
        for <linux-input@vger.kernel.org>; Sat, 19 Nov 2022 04:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZLrYgChEilRNXcz3x7R3l8Y3PsKaP5ZzhNykAinpEw=;
        b=2h7MeJgKlKrZLKz9NZsWgXbudI2E5e/GqoX6knfh/yPsDXTiZWrBXVd/wMWjrZ3xb0
         AvFmhlhSQYEFVOurOME939qjAqADAzVxoot1q29T/PSRkUiUcZLVhU7LT1Mr8SE+mWM1
         UFWCuDMVOow1UOEqMcZdVhtHCedtOgwFT/I0p0YwG+9fiZWUs1JC1He++SCQXz3Ry7jk
         YHsYpE31WR0rUzQ/cpFuJX5Eb/LuFswoG5RylXXmNbvcfc8n4x2prdeJjltIS6RJvLYS
         nbQtdSjnq97aUMYFRNH0qsfoM/Qz2Dc3ZbHRZVbFa1njDbk3vMwgsAqO8ss5pnn+7q3y
         nGBQ==
X-Gm-Message-State: ANoB5pmDidaY9dB4WkMT8ZJPx0YrI1x0gObEedRFiksf0Q9HJEoAzdNX
        Ewi1sorWOYHtVHG3eLaWE90ZSDpMIqSQ11hVQ9KayorLBevdhymEu0TwGFS30TSeHaFw0JS8Jem
        7o+Wu+spV5JfVmBWilVL+pa4=
X-Received: by 2002:a17:906:5fd5:b0:7ac:2e16:a8d3 with SMTP id k21-20020a1709065fd500b007ac2e16a8d3mr9732531ejv.667.1668862633184;
        Sat, 19 Nov 2022 04:57:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6HDkDtWh48gl/FrRJ3EIAftfWdoS4Smgp3VaG7iQJdTKGPoTQRnsYwFEM94VzW3+nHMG1JQg==
X-Received: by 2002:a17:906:5fd5:b0:7ac:2e16:a8d3 with SMTP id k21-20020a1709065fd500b007ac2e16a8d3mr9732519ejv.667.1668862633025;
        Sat, 19 Nov 2022 04:57:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v19-20020aa7dbd3000000b0045b910b0542sm2896451edt.15.2022.11.19.04.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 04:57:12 -0800 (PST)
Message-ID: <884b308e-2775-4817-372b-a622cf382b72@redhat.com>
Date:   Sat, 19 Nov 2022 13:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 221/606] Input: elan_i2c_core - Convert to i2c's
 .probe_new()
Content-Language: en-US, nl
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-222-uwe@kleine-koenig.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221118224540.619276-222-uwe@kleine-koenig.org>
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
>  drivers/input/mouse/elan_i2c_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index d4eb59b55bf1..a25d5b055553 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -1188,8 +1188,7 @@ static void elan_disable_regulator(void *_data)
>  	regulator_disable(data->vcc);
>  }
>  
> -static int elan_probe(struct i2c_client *client,
> -		      const struct i2c_device_id *dev_id)
> +static int elan_probe(struct i2c_client *client)
>  {
>  	const struct elan_transport_ops *transport_ops;
>  	struct device *dev = &client->dev;
> @@ -1438,7 +1437,7 @@ static struct i2c_driver elan_driver = {
>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.dev_groups = elan_sysfs_groups,
>  	},
> -	.probe		= elan_probe,
> +	.probe_new	= elan_probe,
>  	.id_table	= elan_id,
>  };
>  


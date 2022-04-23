Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE84A50C99A
	for <lists+linux-input@lfdr.de>; Sat, 23 Apr 2022 13:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235253AbiDWLhy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Apr 2022 07:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235249AbiDWLhw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Apr 2022 07:37:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2753023B9B1
        for <linux-input@vger.kernel.org>; Sat, 23 Apr 2022 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650713692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tP+OStt+5BIiPFFos2fgFGGuX+lGUN/kwPpgQkfnD8U=;
        b=WImUAUvOnin3q3SkZcB9NjUsWm426Wkh1x6fEz0Tog7cA81t8VRmzPqR3WxDaJWA6xLI9g
        LKy+0PDvX6buHVuiWib7RRh1PZxdhuD3cjzeabmT/tOL+Yk3iH19ln6HjMaT3lyMdctaxI
        uqQnfk1xY8i7cnJ3ujehZzEU/WIz/h8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-IKwYBj0JOTaR_ZaDRRULcg-1; Sat, 23 Apr 2022 07:34:51 -0400
X-MC-Unique: IKwYBj0JOTaR_ZaDRRULcg-1
Received: by mail-ed1-f71.google.com with SMTP id da8-20020a056402176800b0041d79488e29so6473449edb.3
        for <linux-input@vger.kernel.org>; Sat, 23 Apr 2022 04:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tP+OStt+5BIiPFFos2fgFGGuX+lGUN/kwPpgQkfnD8U=;
        b=Xyl/E2oNw9KbeJXLwRwwtVnd1SqRQNBRupl7VNO/gpQ1uw+YayBbngp6nprnZgKtCm
         LbnnjLKBRyIiMgVO2qdLxNvS4qUOfBBNf7meIQhWMT8ZYv99kKXgQDZE6bIg7ctGaw7H
         JiL2qBEATqsis9Xx6h3xcKbdTVJHYtfbwzRE8E3kSOYFtZT+9mTUUq0S9OY8rLFtgMsj
         FTvjZ+JAKCddFHlCnkns/Scf07JvaCCMKlLdLlCtEc3VAPt/STXC5GmBMwX1IYYu3tKO
         sgB55N2Ct1T+8qb1OuFxGDZiMo4y27l6EW34AbcUVhWPelPDgokTBSvWWrRzn/tXTU2z
         7q4Q==
X-Gm-Message-State: AOAM533Flbar9fE0hF4t43zYxzJPcmCCQMUVgCDDLAb2j71fOln0cVn2
        oBDTL1FvpumXMGe++ScRbSTQoDstm+8FvMcHUMI37xJFakztwoCQd7m+uL31ZAzLW9Sveeglb4Z
        4pV7fiNe6ZgiwyOsmPYoAnUE=
X-Received: by 2002:a50:bae7:0:b0:425:c0fa:e0a7 with SMTP id x94-20020a50bae7000000b00425c0fae0a7mr7333111ede.104.1650713689715;
        Sat, 23 Apr 2022 04:34:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBICN5j0/I2xi3fDz8X5wC3a7//wxjCNmPzYn9kWz6azfHe9pqJJ3d2ieqPiN1o3jU/g4awg==
X-Received: by 2002:a50:bae7:0:b0:425:c0fa:e0a7 with SMTP id x94-20020a50bae7000000b00425c0fae0a7mr7333090ede.104.1650713689552;
        Sat, 23 Apr 2022 04:34:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id gz15-20020a170906f2cf00b006f3802a963fsm98600ejb.21.2022.04.23.04.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 04:34:48 -0700 (PDT)
Message-ID: <c4f8bfef-1cb6-d7bb-dfe1-04b3d952738a@redhat.com>
Date:   Sat, 23 Apr 2022 13:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/3] Input: goodix - Fix double free on managed resource
Content-Language: en-US
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        hadess@hadess.net
Cc:     dmitry.torokhov@gmail.com, rydberg@bitmath.org, lains@riseup.net,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220422161709.30198-1-jose.exposito89@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220422161709.30198-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi José,

On 4/22/22 18:17, José Expósito wrote:
> As described in the documentation for devm_input_allocate_device():
> 
>   Managed input devices do not need to be explicitly unregistered or
>   freed as it will be done automatically when owner device unbinds from
>   its driver (or binding fails).
> 
> However this driver was explicitly freeing the input device.
> 
> Remove the calls to input_free_device() to avoid a possible double free
> error.
> 
> Fixes: 5ede7f0cfb93f ("Input: goodix - add pen support")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/input/touchscreen/goodix.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 752e8ba4fecb..61eb69f3a259 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -308,10 +308,8 @@ static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
>  		return NULL;
>  
>  	input_alloc_absinfo(input);
> -	if (!input->absinfo) {
> -		input_free_device(input);
> +	if (!input->absinfo)
>  		return NULL;
> -	}
>  
>  	input->absinfo[ABS_X] = ts->input_dev->absinfo[ABS_MT_POSITION_X];
>  	input->absinfo[ABS_Y] = ts->input_dev->absinfo[ABS_MT_POSITION_Y];

I don't know what tree you've based this on, but the above code has been replaced
with the new input_copy_abs helper in Linus' current master branch:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/goodix.c#n310

> @@ -340,10 +338,8 @@ static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
>  		input->id.product = 0x1001;
>  	input->id.version = ts->version;
>  
> -	if (input_register_device(input) != 0) {
> -		input_free_device(input);
> +	if (input_register_device(input) != 0)
>  		return NULL;
> -	}
>  
>  	return input;
>  }

And this code has also already been fixed, so this patch can be dropped.

Regards,

Hans


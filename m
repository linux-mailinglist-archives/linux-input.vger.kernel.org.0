Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC54A5E5DF2
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 10:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbiIVIwR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 04:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiIVIwO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 04:52:14 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66C7B07F1
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:52:13 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t14so14344617wrx.8
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=JiN+SUsbKASJMIn+alILcOFssysT9+1+IG/iGqkIGKU=;
        b=2GeZeww5mV34pduJGRxUIB4vRvpFBG19gSSi177+Y9gyba75mBeXNBSM5Q3bHIXLkG
         mSoMzJJxoGMa9ESkmF1vIc5Ed4r0mb9qt8J77SWyVB0tZoZlCVuh97OMi9yIFBhnhZKm
         5TisHXLyNrV+nCeesr02zVPoELArCPw8YR+mtn6Wj198bwi77u8iAqNbBzVMzct+0bG+
         PiLMDf8e/1QAwMieTdzdCSPu+iiCeLUC9eVRleLw3qnlKX1gwCZAIJPH53fI6bLhRmDI
         ErNSMrFJqQatrJXJDl3LsaRJo8zSdoiJqCNZhfad/5sn2x+sgaCP5ZVGTz9vN6LRW9A/
         tJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=JiN+SUsbKASJMIn+alILcOFssysT9+1+IG/iGqkIGKU=;
        b=qYvHhELqtcR3VPDpUuh4V/hK5LlzZRmiv4VAeJ/iP/8brRvDRQ7FxsetxoOqflnsx9
         PPUgNpVpLBYoEl/f0ew4ZgVDfLHWbvyv3R0enE7OhJaXppllgKfHAcbXHBj/y/Tjlepm
         h+Z2yFgfKPKzDBwBrtLuWERp8bJZi2m4itqYkZw8w5sf+/PhBUZ2GN6BApJvl9xCyoiR
         coPSaGJ6wTgdChqKTUPcU/dm1TXvb+7cFsbId7QAaUpHcu9cuZDgg0frCC5AeltkcQrZ
         R7rg1+FZWqLnvYnCM7IEZxX5D4Dk0RkMgiVWP1A8iTiOA1Q7YWBR7WP8G06yTdOleMvA
         p6Lg==
X-Gm-Message-State: ACrzQf1Px0TxuDOvRhqFBET/QBQWk2LUB/Y8ZZYF6ae9yc+qEaiRxpjd
        j3tiBSLf/ckNIQQxfTeNMQfRlw==
X-Google-Smtp-Source: AMsMyM5VRk3Gj+ODLA/yU+XI7V95SRmqnsApNpr65yz82vUXzZk+arjnprBGvMcPTaKLsCtWOHSHWA==
X-Received: by 2002:adf:e24d:0:b0:22a:4a40:d5cc with SMTP id bl13-20020adfe24d000000b0022a4a40d5ccmr1320226wrb.494.1663836732206;
        Thu, 22 Sep 2022 01:52:12 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6b02000000b00229e0def760sm4543685wrw.88.2022.09.22.01.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:52:11 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com
Subject: Re: [PATCH -next 4/4] Input: gpio_keys_polled - Switch to use
 dev_err_probe() helper
In-Reply-To: <87y1ubg5g4.fsf@baylibre.com>
References: <20220920153055.3465115-1-yangyingliang@huawei.com>
 <20220920153055.3465115-4-yangyingliang@huawei.com>
 <87y1ubg5g4.fsf@baylibre.com>
Date:   Thu, 22 Sep 2022 10:52:11 +0200
Message-ID: <87sfkjg5ac.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 22, 2022 at 10:48, Mattijs Korpershoek <mkorpershoek@baylibre.com> wrote:

> Hi Yang,
>
> Thank you for your patch,
>
> On Tue, Sep 20, 2022 at 23:30, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER and prints the
>> error name. It also sets the defer probe reason which can be
>> checked later through debugfs.
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>  drivers/input/keyboard/gpio_keys_polled.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
>> index c3937d2fc744..ba00ecfbd343 100644
>> --- a/drivers/input/keyboard/gpio_keys_polled.c
>> +++ b/drivers/input/keyboard/gpio_keys_polled.c
>> @@ -299,13 +299,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>>  							     NULL, GPIOD_IN,
>>  							     button->desc);
>>  			if (IS_ERR(bdata->gpiod)) {
>> -				error = PTR_ERR(bdata->gpiod);
>> -				if (error != -EPROBE_DEFER)
>> -					dev_err(dev,
>> -						"failed to get gpio: %d\n",
>> -						error);
>>  				fwnode_handle_put(child);
>> -				return error;
>> +				return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
>> +						     "failed to get gpio\n");
>
> If we look at the input tree, we can see that there is no occurence of
> dev_err_probe():
>
> $ ~/src/linux/drivers/input/ 483fed3b5dc8 grep -rsn dev_err_probe
> $ ~/src/linux/drivers/input/ 483fed3b5dc8
>
> The reason for this is that the input maintainer (Dmitry) dislikes
> dev_err_probe() as he stated in [1]
>
> So I don't think he will apply this.
>
> Regards,
> Mattijs

Argh, I missed the link. here it is:

[1] https://lore.kernel.org/r/YWTpg35wyYS1uoFZ@google.com

>
>>  			}
>>  		} else if (gpio_is_valid(button->gpio)) {
>>  			/*
>> -- 
>> 2.25.1

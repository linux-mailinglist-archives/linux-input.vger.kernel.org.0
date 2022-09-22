Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88F545E5DF3
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 10:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiIVIwc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 04:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiIVIwb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 04:52:31 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D617FB07F1
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:52:30 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id v3-20020a1cac03000000b003b4fd0fe6c0so851125wme.5
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=jeSPHfnC0uJ1kdJSZkrh47xdyMnZPdIwBOpxeoIueyg=;
        b=2E3ABcqkDN91Xv1WxMWTFGxU1X1ZYcYoT1fGmrzYF5clnQhU0uwVo5p52p/eYkCF9H
         DfBTENYVV7GmTZYd7z7nLZOJ5dwL0f275NUzuH4dI4+IrWw42pnVN+Q7E1lSKfv2zROX
         e5r2rUnZ91YC3TRM06BWlXI7v6nRyChgDgfjjsAwSkOxEjsrjv+yBi9Sr++moqTSidBW
         4YICuxdDPoSwGlXjegDPOsOeun8DuSCvrY4V5PdW2hycrw4iYSlLr8lvvMpV5xer0z0K
         UoozOYAiA+vX0SERcMSN2cGpaxXcCgJz8F73VyT/MP7XvXSyNfOB8Jo71j1TuskxZ8eq
         yK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=jeSPHfnC0uJ1kdJSZkrh47xdyMnZPdIwBOpxeoIueyg=;
        b=MAbSc6PWz+/el7gFysMyZL6H+kstwu9uMIt7Xsz1Hw3+XYjV5x+8RyV1UWhXc6tctt
         43zfU/Q0divZEc78LnAF93ZGM1SHLjYIx7lpm0tIwdIZEXtfUU0FEcSWZKdVIXfxUuhc
         hlV8M7leEcTQC2mmA7YVK5LImy4EPFJu2b3KdZKNCnGeGTuZ0ldk6ls/O//W6XJvovTU
         rFYm9SbebOnGHyEb1fZ8O5HnYI5tIgpMgqcN1KyB0N1MY1wIsWJj1KSEUQ5rTcBPilnq
         EX0grrAOSPGdCssZq4Vm+1F/TqHRQCACzL2KcLbYBnKKW4Fk7skDpBxdRmfl8vOejTY4
         pSGw==
X-Gm-Message-State: ACrzQf3MC6tUAUd0vclz5VeEU4ewXevsSCbyuPfIH1Ije9a6OCcONZaF
        CoSCnK5PSwIed8ipnps3QC45AQ==
X-Google-Smtp-Source: AMsMyM4zp0H94wunF+yvgPRGY2Jis3bqap5GSz30cFrrHbCWfegZaQMs9xsONn17zLv0+75F22qJjA==
X-Received: by 2002:a7b:cd14:0:b0:3b4:8680:79a7 with SMTP id f20-20020a7bcd14000000b003b4868079a7mr1599577wmj.28.1663836749366;
        Thu, 22 Sep 2022 01:52:29 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id bg17-20020a05600c3c9100b003a5f4fccd4asm5374166wmb.35.2022.09.22.01.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:52:28 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com
Subject: Re: [PATCH -next 3/4] Input: gpio_keys - Switch to use
 dev_err_probe() helper
In-Reply-To: <87zgerg5g8.fsf@baylibre.com>
References: <20220920153055.3465115-1-yangyingliang@huawei.com>
 <20220920153055.3465115-3-yangyingliang@huawei.com>
 <87zgerg5g8.fsf@baylibre.com>
Date:   Thu, 22 Sep 2022 10:52:28 +0200
Message-ID: <87pmfng59v.fsf@baylibre.com>
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
>>  drivers/input/keyboard/gpio_keys.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
>> index a5dc4ab87fa1..ac74e85006a8 100644
>> --- a/drivers/input/keyboard/gpio_keys.c
>> +++ b/drivers/input/keyboard/gpio_keys.c
>> @@ -530,10 +530,8 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>>  				 */
>>  				bdata->gpiod = NULL;
>>  			} else {
>> -				if (error != -EPROBE_DEFER)
>> -					dev_err(dev, "failed to get gpio: %d\n",
>> -						error);
>> -				return error;
>> +				return dev_err_probe(dev, error,
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
>>  		}
>>  	} else if (gpio_is_valid(button->gpio)) {
>> -- 
>> 2.25.1

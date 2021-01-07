Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44092EE81C
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 23:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbhAGWFs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 17:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbhAGWFs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 17:05:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A2BC0612F5;
        Thu,  7 Jan 2021 14:05:07 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o17so18272717lfg.4;
        Thu, 07 Jan 2021 14:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JQNiO2Mnj6QxwX1KOBemH+gofG2EOUwTUr4JeDXvjvk=;
        b=jgw+CU1Q5PZmru7wKEP4suIgDUIZgoXFY6oAGUeETSt3z6gUwm9UKspKZpb1nO8/Ag
         tPGxXtiV9S/qr0zbBLdE5X23OjABwUyrDRCzhFE5gIW3H8/pnCYGVJJ7TGwIIxx2kmjp
         J8UOvbmVaHdhStxm/2Looa/gR4Wx0Yfzy+0C5JqTd0v5aAPV4B8bYDrHCtVzXMtqaojd
         O74nNncQCLwjvxpr2UbkEeyVFlJ69fCRz8KSTPXMqxgqQzJnWEvKKfiG0yj+8Ne/wcgd
         IYOdgGItsHSB5pOVN9N2rxUDvl0qEFuvstdsVLkKWfL9zJaU78K7leiRzC+4waChx+j8
         rFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JQNiO2Mnj6QxwX1KOBemH+gofG2EOUwTUr4JeDXvjvk=;
        b=HME2otYDn28QTZs1BbXj+SGWYqO0iUamisocPIzDVWHbNS29gTLpxG2RM5SnsI/hs4
         O1iTqB1h3gxcBg9yZJKl9rBU1pwFZfVBzjcXldU4L+KKKpvsXcJp+VYg9leUtixoGPi0
         ziqm2I9vTaRU0DcZopZMhCsSxkwhFGBDceXBI2RYWSW073kwEpxI8dnL8+iP6puDmw4S
         gh7c/RSXpAdVi7Qb635Sl0iaMdGztNy3u4azZVtrFX2OhtW0lg5udKyl/Z8SW4DXn7XS
         ekfa0Mv1pbMnRNBf0YZ21uBsyEg/YNE+nRy9WiGS7LIPbcxPAYY2zMvaT2bibY7n92K4
         v8Ig==
X-Gm-Message-State: AOAM530pHlPOUiGfR66Uw79fGixZ13hzYLbo0Z3rhbfCOKVnnCnLvBxc
        k2ze4tjNPbz0ojIM9hE9qV9CF5ZdMdQ=
X-Google-Smtp-Source: ABdhPJyKqM9KoMtCnGj//sZ+f2Zm5WBIE6fUHYwgGxtsGuMPhEBZqVCWR5E9Tbuml69jadxCYBYxLA==
X-Received: by 2002:a2e:93d6:: with SMTP id p22mr225896ljh.169.1610057105955;
        Thu, 07 Jan 2021 14:05:05 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id f27sm1433917lfk.293.2021.01.07.14.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 14:05:05 -0800 (PST)
Subject: Re: [PATCH v3 0/3] Support wakeup methods of Atmel maXTouch
 controllers
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201206212217.6857-1-digetx@gmail.com>
 <X9QuTuGEicUnlaJp@google.com>
 <3577ed5b-feff-5915-7d70-5fa8fe4a0a82@gmail.com>
 <X9WblR19HZPZ5XtY@google.com>
 <6b515373-e7b3-4700-7d34-4413a630c461@gmail.com>
Message-ID: <508585f7-6c2b-3b33-ada8-91cc15ed683e@gmail.com>
Date:   Fri, 8 Jan 2021 01:05:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <6b515373-e7b3-4700-7d34-4413a630c461@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

13.12.2020 12:26, Dmitry Osipenko пишет:
> 13.12.2020 07:41, Dmitry Torokhov пишет:
>> Thank you for the logs. I am confused where these calls to put the
>> controller into deep sleep are coming from. Does something constantly
>> open and close input device?
> 
> Input devices are re-opened multiple times during Linux distro boot-up,
> a regular Ubuntu 20.10 in this case.
> 
>> Do you have any additional patches?
> 
> No, I'm using next-20201211 + this "wakeup methods" patchset.
> 
>> We definitely do not issue deep sleep request in mxt_start(). Do you mind
>> putting dump_stack() into mxt_set_t7_power_cfg() to see where the calls
>> are coming from?
> 
> Please see the log below, I added it like this:
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c
> b/drivers/input/touchscreen/atmel_mxt_ts.c
> index e3342fdfe9f3..bbc5a5ee158a 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -2271,6 +2271,8 @@ static int mxt_set_t7_power_cfg(struct mxt_data
> *data, u8 sleep)
>  	dev_dbg(dev, "Set T7 ACTV:%d IDLE:%d\n",
>  		new_config->active, new_config->idle);
> 
> +	dump_stack();
> +
>  	return 0;
>  }
> 
>> I also do not see additional "waking up controller" messages after
>> requesting the chip via T7 to be configured to be active, which I'd
>> expected to see if we indeed needed to wake it up again for T6 to
>> succeed.
> 
> I'm not familiar with what controller does internally, hence no clue.
> 
> 
> [ 1.195295] Family: 160 Variant: 0 Firmware V1.0.AA Objects: 18
> [ 1.195468] T37 Start:118 Size:130 Instances:1 Report IDs:0-0
...
Dmitry Torokhov, do you have any more comments? Are you okay with v3? If
yes, could you please pick up patches into -next?

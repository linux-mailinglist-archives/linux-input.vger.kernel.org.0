Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1B22D06F6
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 20:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgLFTnV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Dec 2020 14:43:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgLFTnU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Dec 2020 14:43:20 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C17C0613D0;
        Sun,  6 Dec 2020 11:42:40 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id u19so14970061lfr.7;
        Sun, 06 Dec 2020 11:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P8pAgTSPFmcGo2WsinSV0Iu1rGYJWBvbZOs81Qoj/1Q=;
        b=Rg8YskXjofnemn8ddmL6FT3vkTom0Agh0dOKmLySHrVg7nNsCMaaLg/1bJhoQaGLtM
         oW1np1+2oed9jTlfYjWts5Ns+5g2aqeSE36NOYBMBP7iOEtDFZ6ZnLaHTt0yHOpixlAS
         gkWNujFxMe2O1UAMuTKymrvPWdCglWPqmn3AMhmuzfDj48pKcZzrYPcsbvH1726ULGoG
         jcZT1gaBQPXlcp+Oxw5oOogsTifSauCrRQITLH+mCHo2x6FySPvdBGQo6FO1C4mH/C8H
         InUpJFKBla1hy3H2gU+8HpL54IAwtYCkaKyOCR+uUmnU8egvg6HVpC7yIYB++os/7HHn
         A/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P8pAgTSPFmcGo2WsinSV0Iu1rGYJWBvbZOs81Qoj/1Q=;
        b=TNjqJK0qQENRIVn8Exih+WQr4XIPWZLI0LkPUh+vcfH2xAoY7I/UCuxaFHU6Pqq3KF
         uKC6ALNJDd0UR3uVz7CfW+Q6pJ1Op690EJQcxelrUh694PhT8NrOJtVBY+qLBxmsv59B
         FcQ70jhmp+7fq91zIgY0NE2jv9EJr0ardrVG6SYuclTLfYXWI6bWhfUQh3hgVIuvqcnv
         AGTCI6wfpMzj2PyxvdNOe66KYfoaJ3PWTj5Y5afwVlW01C0mjgOxJyfJdVqok8d5FIUL
         A6cAlbt6E2J5MDsBU5IML8rCG80tq0JdnGNJMlfa6w5/woy7INM4mk9a8Xf5QmMzcWsA
         YQVg==
X-Gm-Message-State: AOAM532XHiOfQDfU/KU9PxPYY10dHhz/+r5w1vZNduRGxCz1hiD03y8L
        1wRyGxs1LMEJBcZCsnGsbU+ZDXJKZtg=
X-Google-Smtp-Source: ABdhPJysKEeEGlcBRVCI6+4AbOu+6HX3tV2ke3jyc1U6OEtF9pKNdVNPnM7O6gsIUf5jBw52swKQzA==
X-Received: by 2002:a19:48c6:: with SMTP id v189mr1998085lfa.360.1607283758811;
        Sun, 06 Dec 2020 11:42:38 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.googlemail.com with ESMTPSA id j25sm2625938lfh.71.2020.12.06.11.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Dec 2020 11:42:38 -0800 (PST)
Subject: Re: [PATCH v2 2/3] Input: atmel_mxt_ts - support wakeup methods
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201205054749.26487-1-digetx@gmail.com>
 <20201205054749.26487-3-digetx@gmail.com>
 <CACRpkdZoxsamwCpckeMOVSkK_DQOqakmZ3fHzYb8CeSGZ1V_NA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1c98644e-dd57-026e-54d2-59f3398bdd6d@gmail.com>
Date:   Sun, 6 Dec 2020 22:42:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdZoxsamwCpckeMOVSkK_DQOqakmZ3fHzYb8CeSGZ1V_NA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

06.12.2020 18:20, Linus Walleij пишет:
> On Sat, Dec 5, 2020 at 6:48 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> According to datasheets, chips like mXT1386 have a WAKE line, it is used
>> to wake the chip up from deep sleep mode before communicating with it via
>> the I2C-compatible interface.
>>
>> If the WAKE line is connected to a GPIO line, the line must be asserted
>> 25 ms before the host attempts to communicate with the controller. If the
>> WAKE line is connected to the SCL pin, the controller will send a NACK on
>> the first attempt to address it, the host must then retry 25 ms later.
>>
>> Implement the wake-up methods in the driver. Touchscreen now works
>> properly on devices like Acer A500 tablet, fixing problems like this:
>>
>>  atmel_mxt_ts 0-004c: __mxt_read_reg: i2c transfer failed (-121)
>>  atmel_mxt_ts 0-004c: mxt_bootloader_read: i2c recv failed (-121)
>>  atmel_mxt_ts 0-004c: Trying alternate bootloader address
>>  atmel_mxt_ts 0-004c: mxt_bootloader_read: i2c recv failed (-121)
>>  atmel_mxt_ts: probe of 0-004c failed with error -121
>>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> OK looks interesting!
> 
>> +       /* Request the WAKE line as asserted so controller won't sleep */
>> +       data->wake_gpio = devm_gpiod_get_optional(&client->dev,
>> +                                                 "wake", GPIOD_OUT_HIGH);
>> +       if (IS_ERR(data->wake_gpio)) {
>> +               error = PTR_ERR(data->wake_gpio);
>> +               dev_err(&client->dev, "Failed to get wake gpio: %d\n", error);
>> +               return error;
>> +       }
> 
> That is a bit brutal, don't you think? Now you force the controller
> to be on at all times. Even across suspend/resume.

Still it's better than a disfunctional hardware :)

> Shouldn't the same patch drive this low in mxt_suspend()
> and driver it high + wait 25 ms in mxt_resume()?
> Waiting 25ms in mxt_resume() is chill, it is anyway on the
> slowpath.

I don't have hardware which uses the wake-gpio in order to test that it
works properly, hence wanted to keep it minimal. But indeed sounds like
toggling the GPIO in suspend/resume should be okay to do. Alright, I'll
improve it in the v3. Thank you!

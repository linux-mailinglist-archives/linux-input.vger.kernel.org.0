Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20DF227105C
	for <lists+linux-input@lfdr.de>; Sat, 19 Sep 2020 21:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgISTtK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Sep 2020 15:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgISTtK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Sep 2020 15:49:10 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC86C0613CE;
        Sat, 19 Sep 2020 12:49:10 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x69so9806401lff.3;
        Sat, 19 Sep 2020 12:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iRl4Hsy9O4I7BJY7bZPGaXxXlud7f1VtwGO5tvJEaiY=;
        b=RdH6omBgja3rfceBY7qOmD636Q7XMpZvGIhI3u8nrebDoTQEnoyiTO1VtKKt99o3db
         USbWuOuclM1b8Xfy2iJEo0CdwYru2VkdOwmVPNY9AoTADrZ2AQbgeQqGBW4tAiiYep/X
         SJw4EbIa/F0vgLk8pZsbIxEldYcZYlEoUhdIcF7Kc5pOrpfKUvL+tTN8gEkQwHkw154Z
         iIqEbPHr8+ODlUI5Y3Ax3yn7Lz+qe/fvlwj8jFL28Fyqed59BFxLQBclERxP0yb+GK8Y
         0eqHPL8OoajZ/LXPuaDyC/xvlf0BkEw6/GLE47pQKknPwQIBIn9pJojROwYEYmulY7QE
         tMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iRl4Hsy9O4I7BJY7bZPGaXxXlud7f1VtwGO5tvJEaiY=;
        b=L6+j1mCKaPw3lh6XMFydqzkU8wtbrtMLIm6N5ayd/PS5bwRE2Mbw21gcCwDifhbSHn
         Ds7I44EbYGXp2jF1wC25VCUPYF0/S/BP2OebyAJq4Fci0UtKwke6x8AgCoBwM7F3Edze
         OyVcG2+3DS7gUrLM/2sKTbGuScxX0szer5xtT/Y+jdK6efcPMIDyF7yrvbQqBpoPo5Nb
         N6dZVC5+z9drPpvZFFyvB+29OIplT+NZTQoejxHT8+cjvtIwfa7KbJhf3Kgc1O2t2nVL
         5JUM2faJE//EKSqpmlOTniUNwF2UjKjxSrbSeQq3Tx0W2E5fcIZ0/0r39B5OybolL28O
         soVg==
X-Gm-Message-State: AOAM531eO1kOWWmkZWEatQxIxJ5/5FEsUxW+LaSv98+5rD410XWtL8vR
        zOYYOFtTTonJpj9cRjfE7pY=
X-Google-Smtp-Source: ABdhPJxBMkzal6gO9zQwDPFK2Tws6+5zrCr7dpCEzLYOtsdbMhcv0vAI9Wkj7q/XJHissYC63bM6Ng==
X-Received: by 2002:a19:4e:: with SMTP id 75mr12378023lfa.159.1600544948772;
        Sat, 19 Sep 2020 12:49:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id n2sm1416147lji.97.2020.09.19.12.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2020 12:49:08 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] Input: atmel_mxt_ts - wake mXT1386 from deep-sleep
 mode
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com
References: <20200918125601.8210-1-jiada_wang@mentor.com>
 <20200918125601.8210-2-jiada_wang@mentor.com>
 <2c3e093a-dc75-d315-519d-9b8fbab9b41b@gmail.com>
 <d0d8dffe-be52-992e-af2b-020d4b159747@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <11e0052b-ae7a-71bc-1b28-9d5b42acfd11@gmail.com>
Date:   Sat, 19 Sep 2020 22:49:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0d8dffe-be52-992e-af2b-020d4b159747@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

18.09.2020 18:55, Wang, Jiada пишет:
...
>>>   +static void mxt_wake(struct mxt_data *data)
>>> +{
>>> +    struct i2c_client *client = data->client;
>>> +    struct device *dev = &data->client->dev;
>>> +    struct device_node *np = dev->of_node;
>>> +    union i2c_smbus_data dummy;
>>> +
>>> +    if (!of_device_is_compatible(np, "atmel,mXT1386"))
>>> +        return;
>> I'm not sure whether you misses the previous answers from Dmitry
>> Torokhov and Rob Herring, but they suggested to add a new device-tree
>> property which should specify the atmel,wakeup-method.
>>
> I think Rob Herring prefers for the compatible solution than property.

Actually, seems you're right. But I'm not sure now whether he just made
a typo, because it's actually a board-specific option.

It could be more preferred to skip the i2c_smbus_xfer() for the NONE
variant, but it also should be harmless in practice. I guess we indeed
could keep the current variant of yours patch and then add a clarifying
comment to the commit message and to the code, telling that
i2c_smbus_xfer() is harmless in a case of the hardwired WAKE-LINE.

>> There are 3 possible variants:
>>
>>    - NONE
>>    - GPIO
>>    - I2C-SCL
>>
>> Hence we should bail out from mxt_wake() if method is set to NONE or
>> GPIO.
>>
> for "GPIO", we still need 25 ms sleep. but rather than a dummy read,
> WAKE line need to be asserted before sleep.

Correct, I just meant to bail out because GPIO is currently unsupported.

...
>>>   static int mxt_initialize(struct mxt_data *data)
>>>   {
>>>       struct i2c_client *client = data->client;
>>>       int recovery_attempts = 0;
>>>       int error;
>>>   +    mxt_wake(data);
>>> +
>>>       while (1) {
>>
>> I assume the mxt_wake() should be placed here, since there is a 3
>> seconds timeout in the end of the while-loop, meaning that device may
>> get back into deep-sleep on a retry.
>>
> Can you elaborate a little more why exit from bootload mode after sleep
> for 3 second could enter deep-sleep mode.

The loop attempts to exit from bootload mode and then I suppose
mxt_read_info_block() may fail if I2C "accidentally" fails, hence the
deep-sleep mode still will be enabled on a retry.

The datasheet says that there are 2 seconds since the time of the last
I2C access before TS is put back into auto-sleep if deep-sleep mode is
enabled. The wait-loop has msleep(3000).

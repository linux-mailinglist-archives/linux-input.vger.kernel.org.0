Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2747F271572
	for <lists+linux-input@lfdr.de>; Sun, 20 Sep 2020 17:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgITPtn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Sep 2020 11:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITPtm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Sep 2020 11:49:42 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662EBC061755;
        Sun, 20 Sep 2020 08:49:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u21so9039281ljl.6;
        Sun, 20 Sep 2020 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KLEq7NDgstqDGIfDMX9P58k/4dUT7WQv1PJsm6l4Jgs=;
        b=TJenO6HGmb7QSBWlTrIiwpMqzFe4PgdBUcw/BJ9peFZfzXNuxz1ZdLgQGd0slPSsIH
         t2A2plnMKEigkCum8cbhigBEBsOmnq4sfKADU5VxiuHeKw0NmFMZbIFXB+p1h5Zfd8hj
         FizE7vF/LdAPySEHHbc3eqELsCNF1u1Bw8sUnIB3PoRdNsQb4Q/tuJ7BYll5Ux4wjAwm
         HEPuAnkIKaoEcQrWAxM6v1tqQH3Gllz/SrokfvfHoVFGAjdoTDp3zjHCnJUq4mEj7g3H
         s8WPZTVwAfYdt2pJuTIWEKRGsDGnB81gN99Al9eVHG8vQpW10+vynFFL6O0Ykdez7ezT
         Dnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KLEq7NDgstqDGIfDMX9P58k/4dUT7WQv1PJsm6l4Jgs=;
        b=Oqld5aOny8boGTmI0M0ts2piTGAPms4ZkEXcFs3D/0OSe2EJnrDMMlJZn2bb8ecfCb
         VqacBiRI2drQONAkBk+/RWeUB+wKdH9aQLjxGkW4oqc03NkuMgRzjImpYg5uQbkKZY3a
         opDOyeK5HnCPeP14T6AcDjxSalp5pAO05XZfWdD9op3A+sHGHDhnZ+zKtN4XNfKkBMqY
         tdAh/5KROXnr1NQkAG1UakNgyJPm3x3+LXodVnL6hfBGrzKJzeRcst/m8M2ii85A5lLM
         h/Kn9x4E0xosOFEDQ/CBIWOYcagVsAuVN77JPw9/yFNDSeGuxBXeJgOcqVUdladfn+yV
         oYiw==
X-Gm-Message-State: AOAM530F+ELqVBfwD/q1f/2NZJVd9ePXjG1Jo1nhy5t8zjVKsldPxkwA
        SGmU8GUUyyZ3yXSwZRfmg7l7lXb5v5Q=
X-Google-Smtp-Source: ABdhPJzZThw0jO56HDdng/PLr5E49NeeHBymUrei6WPAeXWmoHYcvfY54rUsYnxFhy7iqs/aiJZ8nA==
X-Received: by 2002:a2e:8011:: with SMTP id j17mr16186145ljg.444.1600616979776;
        Sun, 20 Sep 2020 08:49:39 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id u10sm1867735lfr.33.2020.09.20.08.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 08:49:39 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] Input: atmel_mxt_ts - wake mXT1386 from deep-sleep
 mode
To:     "Wang, Jiada" <jiada_wang@mentor.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200918125601.8210-1-jiada_wang@mentor.com>
 <20200918125601.8210-2-jiada_wang@mentor.com>
 <2c3e093a-dc75-d315-519d-9b8fbab9b41b@gmail.com>
 <d0d8dffe-be52-992e-af2b-020d4b159747@mentor.com>
 <11e0052b-ae7a-71bc-1b28-9d5b42acfd11@gmail.com>
 <e9ad6ba7-05a3-af3b-85c3-94797fb33554@mentor.com>
 <CAKdAkRQnvCb+E1-i3HaZgXBPSYoJnr3_wEVB_51cXw3FV+NW7A@mail.gmail.com>
 <8b5f2198-a94e-7ccd-f91d-fb74e5ec7a4f@mentor.com>
 <1a5265f7-8ffd-5fba-c436-3c938a90198c@gmail.com>
 <d54c5626-c693-7838-9b21-82eda6cfc678@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eae6dc1d-8712-3c7d-50fc-5acebf3d3bbd@gmail.com>
Date:   Sun, 20 Sep 2020 18:49:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d54c5626-c693-7838-9b21-82eda6cfc678@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

20.09.2020 17:36, Wang, Jiada пишет:
> Hi Dmitry
> 
> On 2020/09/20 23:21, Dmitry Osipenko wrote:
>> 20.09.2020 16:13, Wang, Jiada пишет:
>>> Hi Dmitry
>>>
>>> On 2020/09/20 15:02, Dmitry Torokhov wrote:
>>>> On Sat, Sep 19, 2020 at 10:28 PM Wang, Jiada <jiada_wang@mentor.com>
>>>> wrote:
>>>>>
>>>>> Hi Dmitry
>>>>>
>>>>> On 2020/09/20 4:49, Dmitry Osipenko wrote:
>>>>>> 18.09.2020 18:55, Wang, Jiada пишет:
>>>>>> ...
>>>>>>>>>      +static void mxt_wake(struct mxt_data *data)
>>>>>>>>> +{
>>>>>>>>> +    struct i2c_client *client = data->client;
>>>>>>>>> +    struct device *dev = &data->client->dev;
>>>>>>>>> +    struct device_node *np = dev->of_node;
>>>>>>>>> +    union i2c_smbus_data dummy;
>>>>>>>>> +
>>>>>>>>> +    if (!of_device_is_compatible(np, "atmel,mXT1386"))
>>>>>>>>> +        return;
>>>>>>>> I'm not sure whether you misses the previous answers from Dmitry
>>>>>>>> Torokhov and Rob Herring, but they suggested to add a new
>>>>>>>> device-tree
>>>>>>>> property which should specify the atmel,wakeup-method.
>>>>>>>>
>>>>>>> I think Rob Herring prefers for the compatible solution than
>>>>>>> property.
>>>>>>
>>>>>> Actually, seems you're right. But I'm not sure now whether he just
>>>>>> made
>>>>>> a typo, because it's actually a board-specific option.
>>>>>>
>>>>> Right, I think since it is a board specific issue,
>>>>> so "property" is the preferred way,
>>>>
>>>> Why are you saying it is a board-specific issue? It seems to me that
>>>> it is behavior of a given controller, not behavior of a board that
>>>> happens to use such a controller?
>>>>
>>>
>>> the issue only occurs on mXT1386 controller,
>>> but with same mXT1386 soc, behavior differs from how WAKE line is
>>> connected, (left low, connect to GPIO or connect to SCL),
>>> so I think the issue also is board-specific?
>>>
>>>>> if I understand you correctly,
>>>>> compatible combine with property is what you are suggesting, right?
>>>>
>>>> We should gate the behavior either off a compatible or a new property,
>>>> but not both.
>>
>> Both variants will work. But if other controller models have a similar
>> need, then a wakeup-method property should be more universal since
>> potentially it could be reused by other TS models without much changes
>> to the code.
>>
>> To be honest, I'm not familiar with other Atmel TS controllers, so have
>> no clue what variant should be more preferred. The wakeup-method should
>> be a safer variant, but it also will be a bit more invasive code change.
>>
>>>>>> It could be more preferred to skip the i2c_smbus_xfer() for the NONE
>>>>>> variant, but it also should be harmless in practice. I guess we
>>>>>> indeed
>>>>>> could keep the current variant of yours patch and then add a
>>>>>> clarifying
>>>>>> comment to the commit message and to the code, telling that
>>>>>> i2c_smbus_xfer() is harmless in a case of the hardwired WAKE-LINE.
>>>>>>
>>>>> I will skip dummy read for "NONE" variant.
>>>>>
>>>>>>>> There are 3 possible variants:
>>>>>>>>
>>>>>>>>       - NONE
>>>>>>>>       - GPIO
>>>>>>>>       - I2C-SCL
>>>>>>>>
>>>>>>>> Hence we should bail out from mxt_wake() if method is set to
>>>>>>>> NONE or
>>>>>>>> GPIO.
>>>>>>>>
>>>>>>> for "GPIO", we still need 25 ms sleep. but rather than a dummy read,
>>>>>>> WAKE line need to be asserted before sleep.
>>>>>>
>>>>>> Correct, I just meant to bail out because GPIO is currently
>>>>>> unsupported.
>>>>>>
>>>>>
>>>>> OK
>>>>>
>>>>>> ...
>>>>>>>>>      static int mxt_initialize(struct mxt_data *data)
>>>>>>>>>      {
>>>>>>>>>          struct i2c_client *client = data->client;
>>>>>>>>>          int recovery_attempts = 0;
>>>>>>>>>          int error;
>>>>>>>>>      +    mxt_wake(data);
>>>>>>>>> +
>>>>>>>>>          while (1) {
>>>>>>>>
>>>>>>>> I assume the mxt_wake() should be placed here, since there is a 3
>>>>>>>> seconds timeout in the end of the while-loop, meaning that
>>>>>>>> device may
>>>>>>>> get back into deep-sleep on a retry.
>>>>>>>>
>>>>>>> Can you elaborate a little more why exit from bootload mode after
>>>>>>> sleep
>>>>>>> for 3 second could enter deep-sleep mode.
>>>>>>
>>>>>> The loop attempts to exit from bootload mode and then I suppose
>>>>>> mxt_read_info_block() may fail if I2C "accidentally" fails, hence the
>>>>>> deep-sleep mode still will be enabled on a retry.
>>>>
>>>> If the controller is in bootloader mode it will not be in a deep sleep
>>>> mode. If the controller was just reset via reset GPIO it will not be
>>>> in deep sleep mode. The controller can only be in deep sleep mode if
>>>> someone requested deep sleep mode. I'd recommend moving the mxt_wake
>>>> in the "else" case of handling reset GPIO.
>>
>> My observation on Acer A500 shows that first I2C transfer after the
>> reset via GPIO could easily get a NAK, hence mxt_wake() definitely must
>> be placed before the mxt_read_info_block(). Apparently reset doesn't
>> wake controller.
>>
>> What's even more interesting is that I now spotted that the NAK could
>> happen in mxt_interrupt() after mxt_initialize().
>>
>> I'm also now seeing that both mxt_set_t7_power_cfg() and
>> mxt_t6_command() in mxt_start() need the mxt_wake()! Because both 100%
>> get a NAK without the wakes.
>>
>> @@ -3005,9 +3022,11 @@ static void mxt_start(struct mxt_data *data)
>>
>>       case MXT_SUSPEND_DEEP_SLEEP:
>>       default:
>> +        mxt_wake(data);
>>           mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
>>
>>           /* Recalibrate since chip has been in deep sleep */
>> +        mxt_wake(data);
>>           mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
>>           break;
>>       }
>>
>> Maybe adding I2C retries still isn't a bad idea?
> 
> Yes, by working on find out where need to place mxt_wake(),
> I am having feeling, we must over look somewhere which needs mxt_wake(),
> also it will introduce lots of difficulty, later someone needs add some
> new routines.
> 
> probably based on retries idea, we can add "compatible" check,
> to only narrow the retry mechanism happen on mXT1368 controller,
> is more easier way...

Agree, this should be the best option.

BTW, could you please add a patch to update the touchscreen@4c entry in
arch/arm/boot/dts/tegra20-acer-a500-picasso.dts? Thanks in advance!

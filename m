Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B95E719E7C3
	for <lists+linux-input@lfdr.de>; Sat,  4 Apr 2020 23:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgDDViq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Apr 2020 17:38:46 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42360 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgDDViq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Apr 2020 17:38:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id s13so8677888lfb.9;
        Sat, 04 Apr 2020 14:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1i+S6a4uHzSY+BQZ8PHkY5IC7kC4Cj62mj3ww4KuN0s=;
        b=qG9Xv3/J7M6EwLU3dRRGCXzNCve0vRhsgTHEEHGvLV0QifAW6J/VK49jNtYlBCExgE
         47Yt5EnulF6Uf1viL4wvobvYyk899mSPD+9VZvUm1+DroVT8O6DEXaMf3B3jiPujOacW
         ZS9Mm3ctgdTz0omaU/Ho1wFYrAPELDo8jWeM5r40/FXfj6Y82gR7nGQdhQxQlSswtj7X
         shnQoxdaG8pRqnzHLrYElQVkq6TeI5gOjM4OdEqf7iV8ipYGYsg69bW90/LlNInxLWeB
         e1+bB+J8xhkYML9br36O5cRvdJzuJVnhxfidTZvysUKLT39WP/lrnOFQXgNaRAi2cU7h
         nV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1i+S6a4uHzSY+BQZ8PHkY5IC7kC4Cj62mj3ww4KuN0s=;
        b=EeWgm1MjbcAwJ11kR9vApwOgrPfVZCKUF0gQI2o4OvOB1wo+stmIR9AflzP28E/emS
         hJC7AvnJOHt09GP+Bq43UVfXcmX8owrQeWj8QDYXw65RUqY6+Gc+HQ4YmSufnYj46JhT
         VR8PNssBhGjsgcw+ENqVyCK01WvLIoqLuCp9tNg+djXGuCA7XC371mpPltgpwKOyMYsR
         /CgtIqhqMilxFCRok/DA/HHvWmUMPRfqCqpD9gGPEqmReNy8uhoX19r398/8APlRON+l
         kk+v/yu0sBBbf+3jwVCK8UBAOgGi/ZSJ+PaGsa0OHO8TVV8o4I/10/3jDJ1awBbIJx+A
         CAWg==
X-Gm-Message-State: AGi0PuYhEREkhHRTjcaSd51069qao9FZdHBEsX4XT1wCrH0Ieh1jhDfI
        L+NtE1Vq5aZOXySYRH9jRoI=
X-Google-Smtp-Source: APiQypL/WS5BkYpFiYatRqfon1xKCULCb1LS1ppwANvI6/MQo+M6De7OuwPHxhO4AEIq9IV6bHCEqw==
X-Received: by 2002:a19:6749:: with SMTP id e9mr8621242lfj.122.1586036323466;
        Sat, 04 Apr 2020 14:38:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id g5sm8802157lfj.14.2020.04.04.14.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2020 14:38:42 -0700 (PDT)
Subject: Re: [PATCH v10 54/55] Input: atmel_mxt_ts: Implement synchronization
 during various operation
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-55-jiada_wang@mentor.com>
 <c53637ef-8e5d-3243-7236-5da360021f21@gmail.com>
 <b06c7915-562f-ec68-766a-2118cfe57a0f@mentor.com>
 <b9a8865c-7754-16f7-8f66-9cd70dc42d3c@gmail.com>
 <271b1013-63e4-cd05-f859-07032c0e8a85@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <19099308-7965-7d2f-e985-d41fe40cc6d6@gmail.com>
Date:   Sun, 5 Apr 2020 00:38:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <271b1013-63e4-cd05-f859-07032c0e8a85@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

03.04.2020 11:39, Wang, Jiada пишет:
> Hi Dmitry
> 
> On 2020/04/02 22:24, Dmitry Osipenko wrote:
>> 02.04.2020 14:50, Wang, Jiada пишет:
>>> Hi Dmitry
>>>
>>> On 2020/04/02 1:04, Dmitry Osipenko wrote:
>>>> 31.03.2020 13:50, Jiada Wang пишет:
>>>>> From: Sanjeev Chugh <sanjeev_chugh@mentor.com>
>>>>>
>>>>> There could be scope of race conditions when sysfs is being handled
>>>>> and at the same time, device removal is occurring. For example,
>>>>> we don't want the device removal to begin if the Atmel device
>>>>> cfg update is going on or firmware update is going on. In such
>>>>> cases, wait for device update to be completed before the removal
>>>>> continues.
>>>>>
>>>>>       Thread                                          Thread 2:
>>>>> =========================
>>>>> =========================
>>>>> mxt_update_fw_store()                           mxt_remove()
>>>>> mutex_lock(&data->lock)                         ...
>>>>> mxt_initialize()                                //Tries to acquire
>>>>> lock
>>>>>     request_firmware_nowait()                    
>>>>> mutex_lock(&data->lock)
>>>>> ...                                             ==>waits for lock()
>>>>> ...                                             .
>>>>> ...                                             .
>>>>> mutex_unlock(&data->lock)                       .
>>>>>                                                   //Gets lock and
>>>>> proceeds
>>>>>                                                 
>>>>> mxt_free_input_device();
>>>>>                                                   ...
>>>>>                                                 
>>>>> mutex_unlock(&data->lock)
>>>>>                                                   //Frees atmel driver
>>>>> data
>>>>>                                                   kfree(data)
>>>>>
>>>>> If the request_firmware_nowait() completes after the driver removal,
>>>>> and callback is triggered. But kernel crashes since the module is
>>>>> already removed.
>>>>>
>>>>> This commit adds state machine to serialize such scenarios.
>>>>
>>>> Won't it be easier to bump driver's module use-count by __module_get()
>>>> while firmware is updating? Or remove sysfs during of mxt_remove()? >
>>>
>>> thanks for your inspiration, I will replace state machine with module
>>> use-count.
>>
>> I'm actually now thinking that the suggestion about the module-count
>> wasn't very correct because this won't really help in regards to
>> mxt_update_fw_store() / mxt_remove() racing.
>>
>> I see that mxt_remove() already invokes the mxt_sysfs_remove(), which
>> should block until mxt_update_fw_store() is completed, shouldn't it?
> 
> Yes, you are correct,
> this commit isn't addressing the real root cause
> 
>>
>> I guess the kfree(data) isn't the real cause of the problem and
>> something like this should help:
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c
>> b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index b2edf51e1595..4e66106feeb9 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -4254,6 +4254,7 @@ static void mxt_sysfs_remove(struct mxt_data *data)
>>       struct i2c_client *client = data->client;
>>
>>       sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
>> +    sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
>>   }
>>
>>   static void mxt_reset_slots(struct mxt_data *data)
>> @@ -4649,31 +4650,19 @@ static int mxt_remove(struct i2c_client *client)
>>   {
>>       struct mxt_data *data = i2c_get_clientdata(client);
>>
>> -    mutex_lock(&data->lock);
>> -    if (data->e_state == MXT_STATE_UPDATING_CONFIG_ASYNC ||
>> -        data->e_state == MXT_STATE_UPDATING_CONFIG) {
>> -        data->e_state = MXT_STATE_GOING_AWAY;
>> -        mutex_unlock(&data->lock);
>> -        mxt_wait_for_completion(data, &data->update_cfg_completion,
>> -                    MXT_CONFIG_TIMEOUT);
>> -    } else {
>> -        data->e_state = MXT_STATE_GOING_AWAY;
>> -        mutex_unlock(&data->lock);
>> -    }
>> +    mxt_sysfs_remove(data);
>>
>> -    disable_irq(data->irq);
>> -    sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
>>       if (data->reset_gpio) {
>>           sysfs_remove_link(&client->dev.kobj, "reset");
>>           gpiod_unexport(data->reset_gpio);
>>       }
>> +
>>       mxt_debug_msg_remove(data);
>> -    mxt_sysfs_remove(data);
>>       mxt_free_input_device(data);
>>       mxt_free_object_table(data);
>>
>>     if (debug_state)
>>         cancel_delayed_work_sync(&data->watchdog_work);
>> +    disable_irq(data->irq);
>>
>>       return 0;
>>   }
>>
> yes, I confirmed, the root cause is because irq is disabled while
> firmware is being updated, this cause update of firmware can't proceed.
> by move disable irq after sysfs entry removal can fix the issue

Okay :)

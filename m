Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F17FB19EFA4
	for <lists+linux-input@lfdr.de>; Mon,  6 Apr 2020 06:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgDFES1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Apr 2020 00:18:27 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:28337 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgDFES1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Apr 2020 00:18:27 -0400
IronPort-SDR: Ni8MtU0rJJpVR4l9FjeVfxTyuH1oSMqr3+kyLKYYjvYauQfwfkAFdVFfENMCnsjbElQnTBUVuj
 mbXDudO+ScuhjqW3GyPCONzkUZYDqitNilICWPZmA8g6zRlvCNmAS3F/sRghbhuql0/kJS50fC
 9uHkOcjdYYS6WX0ZWjanBjOCglfrRRHg7N3HpSVbQ/M+LVvVOElxLORsSpKuwz4/kAkxUNHbW6
 OlnR0UkINdFnkVF0iSG+rWod0UiugDz6O9W+w2RMQiuLFaD1WQQ+t/wjtDjql00ZgIo2KlxBeL
 LPY=
X-IronPort-AV: E=Sophos;i="5.72,349,1580803200"; 
   d="scan'208";a="47376664"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 05 Apr 2020 20:18:26 -0800
IronPort-SDR: DBR+18PDclapNTKp4JqtQltGoJHolxARNGD5NY7LCmWz+dXxDjHa/TY6XMEBYCDWnuwCohZQAh
 cdLrXIWc0hdH+WHUcS6DFotq9di5G00ZLMt/lP8fo0x9Bl+PP8xEi2X3L+rTxMhQeSoWVvP7O2
 0h/tzHcnpn/l5EZLps8bLc/UmUSePbtjIoZYXBvRPKtd0zruZ4JOeYkjHV3G2iWKkhb0gw8bt7
 LgMsPBBmiVe7EO61VYQ7XNjpcT4+4cZ/jTOC9MF1u/eROgufi/dfD918f1/DC/zKgvShVdoT6d
 85w=
Subject: Re: [PATCH v10 54/55] Input: atmel_mxt_ts: Implement synchronization
 during various operation
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-55-jiada_wang@mentor.com>
 <c53637ef-8e5d-3243-7236-5da360021f21@gmail.com>
 <b06c7915-562f-ec68-766a-2118cfe57a0f@mentor.com>
 <b9a8865c-7754-16f7-8f66-9cd70dc42d3c@gmail.com>
 <c5e7dc2d-08c7-e55e-352d-b9b0d86fe63e@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <500c814a-b0f4-db9f-30f6-bc6ac985c5e2@mentor.com>
Date:   Mon, 6 Apr 2020 13:18:20 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c5e7dc2d-08c7-e55e-352d-b9b0d86fe63e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/04/02 23:00, Dmitry Osipenko wrote:
> 02.04.2020 16:24, Dmitry Osipenko пишет:
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
>>>>>       Thread                                          Thread 2:
>>>>> =========================
>>>>> =========================
>>>>> mxt_update_fw_store()                           mxt_remove()
>>>>> mutex_lock(&data->lock)                         ...
>>>>> mxt_initialize()                                //Tries to acquire lock
>>>>>     request_firmware_nowait()                     mutex_lock(&data->lock)
>>>>> ...                                             ==>waits for lock()
>>>>> ...                                             .
>>>>> ...                                             .
>>>>> mutex_unlock(&data->lock)                       .
>>>>>                                                   //Gets lock and
>>>>> proceeds
>>>>>                                                  
>>>>> mxt_free_input_device();
>>>>>                                                   ...
>>>>>                                                  
>>>>> mutex_unlock(&data->lock)
>>>>>                                                   //Frees atmel driver
>>>>> data
>>>>>                                                   kfree(data)
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
>>   	struct i2c_client *client = data->client;
>>
>>   	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
>> +	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
>>   }
>>
>>   static void mxt_reset_slots(struct mxt_data *data)
>> @@ -4649,31 +4650,19 @@ static int mxt_remove(struct i2c_client *client)
>>   {
>>   	struct mxt_data *data = i2c_get_clientdata(client);
>>
>> -	mutex_lock(&data->lock);
>> -	if (data->e_state == MXT_STATE_UPDATING_CONFIG_ASYNC ||
>> -	    data->e_state == MXT_STATE_UPDATING_CONFIG) {
>> -		data->e_state = MXT_STATE_GOING_AWAY;
>> -		mutex_unlock(&data->lock);
>> -		mxt_wait_for_completion(data, &data->update_cfg_completion,
>> -					MXT_CONFIG_TIMEOUT);
>> -	} else {
>> -		data->e_state = MXT_STATE_GOING_AWAY;
>> -		mutex_unlock(&data->lock);
>> -	}
>> +	mxt_sysfs_remove(data);
>>
>> -	disable_irq(data->irq);
>> -	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
>>   	if (data->reset_gpio) {
>>   		sysfs_remove_link(&client->dev.kobj, "reset");
>>   		gpiod_unexport(data->reset_gpio);
>>   	}
>> +
>>   	mxt_debug_msg_remove(data);
>> -	mxt_sysfs_remove(data);
>>   	mxt_free_input_device(data);
>>   	mxt_free_object_table(data);
>>
>> 	if (debug_state)
>> 		cancel_delayed_work_sync(&data->watchdog_work);
>> +	disable_irq(data->irq);
>>
>>   	return 0;
>>   }
>>
> 
> I'm looking at this again and the original tear-down order of the
> mxt_remove() looks okay, so no need to change it.
> 
> Reading the commit message, it says that request_firmware_nowait() races
> with kfree(data), but that can't happen because the data is
> resource-managed and request_firmware_nowait() bumps device's use-count.
> 
> https://elixir.bootlin.com/linux/v5.6.2/source/drivers/base/firmware_loader/main.c#L1043
> 
> I think this patch was ported from some very old kernel version and it's
> simply not applicable to the upstream anymore.
> 

I had some test,
and confirmed you are right,
this commit is no longer applicable to upstream,
but as discussed in another patch,
disable_irq() need to be moved after remove of mxt_fw_attr_group.
I will add this change in a new commit.

Thanks,
Jiada

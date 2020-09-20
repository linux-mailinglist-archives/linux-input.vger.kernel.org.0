Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC16271465
	for <lists+linux-input@lfdr.de>; Sun, 20 Sep 2020 15:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgITNNY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Sep 2020 09:13:24 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:58349 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgITNNY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Sep 2020 09:13:24 -0400
IronPort-SDR: fAmS3AXkehq2R9njmFeWf0Cd6PjuA2+eUHJ9YbkawOJmRXVPfBYxD1GSHlb8Ai3l7VC/IYyPO2
 D0yXNuJ7tq0FYVwzs92tOmVpdh08gnM09eGDD/ygkhhLxF4NrdTfxM9j1xHg98cpSuyH5zZ4mJ
 m55XBhIy8HRTIEqbS2w5V6y0tf7hxCFR7So3AIOlQ+mHEIXP5T6qWg5O6R/n4E3ds6mivvQfVK
 2qFIc9cUmM5fgMZuVn3jFI4RubnyBpsLLZNLqVwL1qlK+RjI5+iNNfCUgbHOIgUR8yg0boCgl1
 3VY=
X-IronPort-AV: E=Sophos;i="5.77,282,1596528000"; 
   d="scan'208";a="53205370"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 20 Sep 2020 05:13:23 -0800
IronPort-SDR: JRs2rV7mboNaCLTTDw51zsLcDsU7J9s++vna+X/YMXzpPgnkLWUCCO8uzVbZL0KTeE2cfdung9
 o9Hbnt0bLwnu5aciifC6Gy8uApHAWTdQRRMSDX5pFlaKZax8GgCB/DTtv1UOkQfFeOPdXIRTy7
 SemeXfcYp+AC9nfPWN6wQs08VvKs/6nRna9r+O/YBer5awmtKUnIvxLo+aq7+M0cRDNHml1DDI
 krHy6dmx8pMAn34oyVTTQ2djiRfLhtDnxb9yQoXxCFMFJvtISokJpBahfHHri/cZEtFPNb+qPa
 QGw=
Subject: Re: [PATCH v2 2/2] Input: atmel_mxt_ts - wake mXT1386 from deep-sleep
 mode
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Dmitry Osipenko <digetx@gmail.com>, Nick Dyer <nick@shmanahar.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200918125601.8210-1-jiada_wang@mentor.com>
 <20200918125601.8210-2-jiada_wang@mentor.com>
 <2c3e093a-dc75-d315-519d-9b8fbab9b41b@gmail.com>
 <d0d8dffe-be52-992e-af2b-020d4b159747@mentor.com>
 <11e0052b-ae7a-71bc-1b28-9d5b42acfd11@gmail.com>
 <e9ad6ba7-05a3-af3b-85c3-94797fb33554@mentor.com>
 <CAKdAkRQnvCb+E1-i3HaZgXBPSYoJnr3_wEVB_51cXw3FV+NW7A@mail.gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <8b5f2198-a94e-7ccd-f91d-fb74e5ec7a4f@mentor.com>
Date:   Sun, 20 Sep 2020 22:13:17 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKdAkRQnvCb+E1-i3HaZgXBPSYoJnr3_wEVB_51cXw3FV+NW7A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/09/20 15:02, Dmitry Torokhov wrote:
> On Sat, Sep 19, 2020 at 10:28 PM Wang, Jiada <jiada_wang@mentor.com> wrote:
>>
>> Hi Dmitry
>>
>> On 2020/09/20 4:49, Dmitry Osipenko wrote:
>>> 18.09.2020 18:55, Wang, Jiada пишет:
>>> ...
>>>>>>     +static void mxt_wake(struct mxt_data *data)
>>>>>> +{
>>>>>> +    struct i2c_client *client = data->client;
>>>>>> +    struct device *dev = &data->client->dev;
>>>>>> +    struct device_node *np = dev->of_node;
>>>>>> +    union i2c_smbus_data dummy;
>>>>>> +
>>>>>> +    if (!of_device_is_compatible(np, "atmel,mXT1386"))
>>>>>> +        return;
>>>>> I'm not sure whether you misses the previous answers from Dmitry
>>>>> Torokhov and Rob Herring, but they suggested to add a new device-tree
>>>>> property which should specify the atmel,wakeup-method.
>>>>>
>>>> I think Rob Herring prefers for the compatible solution than property.
>>>
>>> Actually, seems you're right. But I'm not sure now whether he just made
>>> a typo, because it's actually a board-specific option.
>>>
>> Right, I think since it is a board specific issue,
>> so "property" is the preferred way,
> 
> Why are you saying it is a board-specific issue? It seems to me that
> it is behavior of a given controller, not behavior of a board that
> happens to use such a controller?
> 

the issue only occurs on mXT1386 controller,
but with same mXT1386 soc, behavior differs from how WAKE line is 
connected, (left low, connect to GPIO or connect to SCL),
so I think the issue also is board-specific?

>> if I understand you correctly,
>> compatible combine with property is what you are suggesting, right?
> 
> We should gate the behavior either off a compatible or a new property,
> but not both.
> 
>>
>>> It could be more preferred to skip the i2c_smbus_xfer() for the NONE
>>> variant, but it also should be harmless in practice. I guess we indeed
>>> could keep the current variant of yours patch and then add a clarifying
>>> comment to the commit message and to the code, telling that
>>> i2c_smbus_xfer() is harmless in a case of the hardwired WAKE-LINE.
>>>
>> I will skip dummy read for "NONE" variant.
>>
>>>>> There are 3 possible variants:
>>>>>
>>>>>      - NONE
>>>>>      - GPIO
>>>>>      - I2C-SCL
>>>>>
>>>>> Hence we should bail out from mxt_wake() if method is set to NONE or
>>>>> GPIO.
>>>>>
>>>> for "GPIO", we still need 25 ms sleep. but rather than a dummy read,
>>>> WAKE line need to be asserted before sleep.
>>>
>>> Correct, I just meant to bail out because GPIO is currently unsupported.
>>>
>>
>> OK
>>
>>> ...
>>>>>>     static int mxt_initialize(struct mxt_data *data)
>>>>>>     {
>>>>>>         struct i2c_client *client = data->client;
>>>>>>         int recovery_attempts = 0;
>>>>>>         int error;
>>>>>>     +    mxt_wake(data);
>>>>>> +
>>>>>>         while (1) {
>>>>>
>>>>> I assume the mxt_wake() should be placed here, since there is a 3
>>>>> seconds timeout in the end of the while-loop, meaning that device may
>>>>> get back into deep-sleep on a retry.
>>>>>
>>>> Can you elaborate a little more why exit from bootload mode after sleep
>>>> for 3 second could enter deep-sleep mode.
>>>
>>> The loop attempts to exit from bootload mode and then I suppose
>>> mxt_read_info_block() may fail if I2C "accidentally" fails, hence the
>>> deep-sleep mode still will be enabled on a retry.
> 
> If the controller is in bootloader mode it will not be in a deep sleep
> mode. If the controller was just reset via reset GPIO it will not be
> in deep sleep mode. The controller can only be in deep sleep mode if
> someone requested deep sleep mode. I'd recommend moving the mxt_wake
> in the "else" case of handling reset GPIO.
> 

OK.

Thanks,
Jiada
> Thanks,
> 

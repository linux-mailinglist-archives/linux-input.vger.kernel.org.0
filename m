Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682FD271289
	for <lists+linux-input@lfdr.de>; Sun, 20 Sep 2020 07:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgITFf5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Sep 2020 01:35:57 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:38646 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgITFf5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Sep 2020 01:35:57 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 01:35:56 EDT
IronPort-SDR: 3BReqJoXREzd5Dtbw5U9NUqTvfWy/KxJ70pngSzG/X8ovgjsWxRme3hgLOW4m074WE1KGB9Vk+
 MfkCYEYdamVGYYv31kc1DXxOzzI8d75yDPgGnq5Uq2QZC4ONuByX0oS/3BG5tx1mqK3QX9QpNG
 nbHTymyBXR/bPO4HpPnoJtf0osD41IKlUcG7BbOEHBKwZkZItUycylR/oKLjcnpDAzccWBG/Zu
 3wPblBV9El9t+/fGflyivuGCvoSG+ZiAxYuzPYc5IKXSYwvntjenSL1fEAt5lBjXZRzHeLTsnZ
 66A=
X-IronPort-AV: E=Sophos;i="5.77,281,1596528000"; 
   d="scan'208";a="53106235"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 19 Sep 2020 21:28:50 -0800
IronPort-SDR: bYIzAEPNrQjjhBBoT5k+ao+kqFvc/BlhJI6MjnIEAVHSYPnnMibdijgXB+kwn5A1Yg5U57gbdd
 qOTX+ZDG7wFgeDWBxPH/kO8/d8wG68Vo7oReCriNHwKANiZaHRMjJjo7SagK7pA6HIsx3Oicpi
 mrL/+IZ1FWxPD7ykYw9tzIQ6bc8wwwtWZpYXCsZMI+1rtGdb5OHQypXYG7H2eZwXjBzkMjnSTs
 TUlrrTxLAmkVLBwQ4P2KXP6bUKQLRMyvBO/68eGWp4Ld0e0TK+96IihtTP4IBmf3IbLvRbIH8M
 9SY=
Subject: Re: [PATCH v2 2/2] Input: atmel_mxt_ts - wake mXT1386 from deep-sleep
 mode
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andy.shevchenko@gmail.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
References: <20200918125601.8210-1-jiada_wang@mentor.com>
 <20200918125601.8210-2-jiada_wang@mentor.com>
 <2c3e093a-dc75-d315-519d-9b8fbab9b41b@gmail.com>
 <d0d8dffe-be52-992e-af2b-020d4b159747@mentor.com>
 <11e0052b-ae7a-71bc-1b28-9d5b42acfd11@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <e9ad6ba7-05a3-af3b-85c3-94797fb33554@mentor.com>
Date:   Sun, 20 Sep 2020 14:28:45 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <11e0052b-ae7a-71bc-1b28-9d5b42acfd11@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/09/20 4:49, Dmitry Osipenko wrote:
> 18.09.2020 18:55, Wang, Jiada пишет:
> ...
>>>>    +static void mxt_wake(struct mxt_data *data)
>>>> +{
>>>> +    struct i2c_client *client = data->client;
>>>> +    struct device *dev = &data->client->dev;
>>>> +    struct device_node *np = dev->of_node;
>>>> +    union i2c_smbus_data dummy;
>>>> +
>>>> +    if (!of_device_is_compatible(np, "atmel,mXT1386"))
>>>> +        return;
>>> I'm not sure whether you misses the previous answers from Dmitry
>>> Torokhov and Rob Herring, but they suggested to add a new device-tree
>>> property which should specify the atmel,wakeup-method.
>>>
>> I think Rob Herring prefers for the compatible solution than property.
> 
> Actually, seems you're right. But I'm not sure now whether he just made
> a typo, because it's actually a board-specific option.
> 
Right, I think since it is a board specific issue,
so "property" is the preferred way,
if I understand you correctly,
compatible combine with property is what you are suggesting, right?

> It could be more preferred to skip the i2c_smbus_xfer() for the NONE
> variant, but it also should be harmless in practice. I guess we indeed
> could keep the current variant of yours patch and then add a clarifying
> comment to the commit message and to the code, telling that
> i2c_smbus_xfer() is harmless in a case of the hardwired WAKE-LINE.
> 
I will skip dummy read for "NONE" variant.

>>> There are 3 possible variants:
>>>
>>>     - NONE
>>>     - GPIO
>>>     - I2C-SCL
>>>
>>> Hence we should bail out from mxt_wake() if method is set to NONE or
>>> GPIO.
>>>
>> for "GPIO", we still need 25 ms sleep. but rather than a dummy read,
>> WAKE line need to be asserted before sleep.
> 
> Correct, I just meant to bail out because GPIO is currently unsupported.
> 

OK

> ...
>>>>    static int mxt_initialize(struct mxt_data *data)
>>>>    {
>>>>        struct i2c_client *client = data->client;
>>>>        int recovery_attempts = 0;
>>>>        int error;
>>>>    +    mxt_wake(data);
>>>> +
>>>>        while (1) {
>>>
>>> I assume the mxt_wake() should be placed here, since there is a 3
>>> seconds timeout in the end of the while-loop, meaning that device may
>>> get back into deep-sleep on a retry.
>>>
>> Can you elaborate a little more why exit from bootload mode after sleep
>> for 3 second could enter deep-sleep mode.
> 
> The loop attempts to exit from bootload mode and then I suppose
> mxt_read_info_block() may fail if I2C "accidentally" fails, hence the
> deep-sleep mode still will be enabled on a retry.
> 
> The datasheet says that there are 2 seconds since the time of the last
> I2C access before TS is put back into auto-sleep if deep-sleep mode is
> enabled. The wait-loop has msleep(3000).

OK, thanks for the clarification

Thanks,
Jiada
> 

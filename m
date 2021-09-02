Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D89A3FEDEB
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 14:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344320AbhIBMpF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Sep 2021 08:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234098AbhIBMpF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Sep 2021 08:45:05 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2435C061575;
        Thu,  2 Sep 2021 05:44:06 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DA80682DBA;
        Thu,  2 Sep 2021 14:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630586644;
        bh=h+eb+xNiGGcksHiVR36S/ZDem9MgmoQYhpwzDPG17oE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=i3+xHaLd35OXBSq7MVhtXRBbtMf3+CE9GXoONQaFUqXGZPU/kfDDU9awzuV965+T3
         1nIri/64h1GBiUmKOXQK/dp+HwhJub7GNRJGq5uHrUd0utrhOczPV5ksA2MCGKX4TZ
         UkTvnsGLpGMYQ+hGxHeHqnJFCrJwiqu2ez1rH4r31Lk5NUZZeo/XnbbnH09et1s5ek
         kng6Kid5w+HHwSqlaebOz3Z60dBe6ITwfBSCwQJzIv0xEeF0V978+3qia7pjTLr48Y
         f9Yyr0MpCsGPp5393RGGun8YuvBY80U6N5CTEijIVkVQPXvQ9WF6HoZB7u8O3qx32p
         omGQm3ukkqtRQ==
Subject: Re: [PATCH] Input: ili210x - Set the device name according to the
 device model
To:     Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc:     dmitry.torokhov@gmail.com, hansemro@outlook.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210901192229.29864-1-rpimentel.silva@gmail.com>
 <4e8ad91c-2554-4b8f-94db-aa5add5f524d@denx.de>
 <CAOkaPuUYQQHQZrjj3CcS1dOZrA=rH=nJJPKaPNNdBJaXO_t7ng@mail.gmail.com>
 <c0f13f0f-48c8-f58d-4589-ad78b64fe809@denx.de>
 <CAOkaPuVV3HK8OvVMQxjRPh1S_pFjvbEgsR-5UB51H8aguCw6Lw@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <2cf4320e-1111-2c2d-dc5a-92b171647450@denx.de>
Date:   Thu, 2 Sep 2021 14:44:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOkaPuVV3HK8OvVMQxjRPh1S_pFjvbEgsR-5UB51H8aguCw6Lw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/2/21 2:39 PM, Rogerio Pimentel wrote:
> On Wed, Sep 1, 2021 at 5:48 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 9/1/21 10:27 PM, Rogerio Pimentel wrote:
>>> On Wed, Sep 1, 2021 at 4:46 PM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 9/1/21 9:22 PM, Rogerio Pimentel wrote:
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
>>>>> index 30576a5f2f04..ca7af4a6f588 100644
>>>>> --- a/drivers/input/touchscreen/ili210x.c
>>>>> +++ b/drivers/input/touchscreen/ili210x.c
>>>>> @@ -19,6 +19,8 @@
>>>>>     #define ILI251X_DATA_SIZE1  31
>>>>>     #define ILI251X_DATA_SIZE2  20
>>>>>
>>>>> +#define ILI_NAME_LEN         27
>>>>> +
>>>>>     /* Touchscreen commands */
>>>>>     #define REG_TOUCHDATA               0x10
>>>>>     #define REG_PANEL_INFO              0x20
>>>>> @@ -394,6 +396,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>>>>>         struct input_dev *input;
>>>>>         int error;
>>>>>         unsigned int max_xy;
>>>>> +     char *model_name;
>>>>>
>>>>>         dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
>>>>>
>>>>> @@ -440,7 +443,11 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>>>>>         i2c_set_clientdata(client, priv);
>>>>>
>>>>>         /* Setup input device */
>>>>> -     input->name = "ILI210x Touchscreen";
>>>>> +     input->name = "Ilitek         Touchscreen";
>>>>> +     model_name = (char *)input->name;
>>>>> +     snprintf(model_name, ILI_NAME_LEN, "Ilitek %s Touchscreen",
>>>>
>>>> Which ilitek devices do you have available exactly ?
>>>>
>>>> There is a firmware interface which does report the device type, but I
>>>> don't know whether it works on all the ilitek touchscreen devices. If it
>>>> does, then it could be used here to pull the type from the firmware and
>>>> then use this instead
>>>>
>>>> snprintf(model_name, ILI_NAME_LEN, "Ilitek ILI%04x Touchscreen", type);
>>>>
>>>> Try this command against the touch controller, it sends it command 0x61
>>>> and reads two bytes of the reply:
>>>> i2ctransfer -f -y 1 w1@0x41 0x61 r2
>>>> 0x10 0x25 # <---- on ILI2510 it reports 0x25 0x10 in reverse
>>>
>>> Thanks for the comments and suggestions. I'll make the changes and send V2.
>>
>> Can you tell which ILI2xxx touch controller you have exactly ?
> 
> Now I have only the ILI2511. Will also have to support ILI2510 and ILI2118.
> 
>> Can you share the output of the 'i2ctransfer' (from i2c-tools) command
>> above ?
> 
> # i2ctransfer -f -y 3 w1@0x41 0x61 r2
> 0x11 0x25

Nice, so this works at least with the 251x series. Let's see how the 
2118 behaves, I bet you will get 0x18 0x21 there too.

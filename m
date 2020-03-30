Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 727EE1972F7
	for <lists+linux-input@lfdr.de>; Mon, 30 Mar 2020 06:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgC3EKs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Mar 2020 00:10:48 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:38367 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgC3EKs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Mar 2020 00:10:48 -0400
IronPort-SDR: hWexN6+CD3P93rbld9iS91esFRZsstagQIivQJJUtUlOzm1vN1AV8yxSi/98UhGuO3PWWrirYT
 HZCgxDKiQtZf7u0DC9+FknuLTUIqFMPN/39cMSh2KzK9LmxCpy0FRm5tFG2sHgY3xGTl7gsJPc
 bcubU/sVn9RrelBYPP3Bg6NQv9/NfUKaiHrc2Qv2bXBLo44D6SzlAQya61HW/NJ/hEnwZXl2b9
 Wy6iF0YQLnzqMgdbzi/WAl794bKAmmVZi3QEK5mCMJ3cV1UOJcx/HWKXRKEI06u0GfC5vokZxg
 psE=
X-IronPort-AV: E=Sophos;i="5.72,322,1580803200"; 
   d="scan'208";a="47140911"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 29 Mar 2020 20:10:47 -0800
IronPort-SDR: peAIlDJjt+UVVhpQE3wuqb3MhOpL53QKLBCZjxBZb01BkoS6XeZ5/eOm/I/yT1Qj29RbwzkeEg
 1jT2tMKD5EMEj8ykKvWt0Bb7408RH1YoelcEHPN0dZ5DyAUHVkNEojUjTcVEJHUg7J1MTMqGng
 jDi59bof4jsWrtklYjFTbI35LViRaSy/rw/3FbF3Iv8f4SJRK8To2c/u2BfRexp5XSZiG0sOWJ
 duv4hOcyG3OWYwuydtJWMDXI8LN4ZO+s9CpCeP46O86ZQvmXvRhdh2OiRcJXCMSHl0KcZY/Mo3
 JQ8=
Subject: Re: [PATCH v9 13/55] Input: atmel_mxt_ts - add regulator control
 support
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
 <20200325133334.19346-14-jiada_wang@mentor.com>
 <672615bc-adce-213f-9e44-864163c0a770@gmail.com>
 <85a74259-6f52-34a0-af34-0217a088cc5b@mentor.com>
 <20d8dbc3-ee0e-95e4-6d33-2ed10c0268c6@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <278eb2ef-dc55-99dc-5525-f0eccea508f6@mentor.com>
Date:   Mon, 30 Mar 2020 13:10:41 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20d8dbc3-ee0e-95e4-6d33-2ed10c0268c6@gmail.com>
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

On 2020/03/30 3:54, Dmitry Osipenko wrote:
> 27.03.2020 14:09, Wang, Jiada пишет:
>> Hi Dmitry
>>
>> On 2020/03/26 4:05, Dmitry Osipenko wrote:
>>> 25.03.2020 16:32, Jiada Wang пишет:
>>>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>>>
>>>> Allow the driver to optionally manage enabling/disable power to the
>>>> touch
>>>> controller itself. If the regulators are not present then use the deep
>>>> sleep power mode instead.
>>>>
>>>> For a correct power on sequence, it is required that we have control
>>>> over
>>>> the RESET line.
>>>
>>> ...
>>>> +    data->reg_vdd = devm_regulator_get(dev, "vdd");
>>>> +    if (IS_ERR(data->reg_vdd)) {
>>>> +        error = PTR_ERR(data->reg_vdd);
>>>> +        dev_err(dev, "Error %d getting vdd regulator\n", error);
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    data->reg_avdd = devm_regulator_get(dev, "avdd");
>>>> +    if (IS_ERR(data->reg_avdd)) {
>>>> +        error = PTR_ERR(data->reg_avdd);
>>>> +        dev_err(dev, "Error %d getting avdd regulator\n", error);
>>>> +        goto fail_release;
>>>> +    }
>>>
>>> Hello Jiada,
>>>
>>> The new regulator properties should be documented in the device-tree
>>> binding.
>>>
>> I will document new regulator properties in a separate commit in
>> v10 patch-set
> 
> Please make sure that all patches are added in a correct order and that
> they at least compile. This patch doesn't compile:
> 
Sure, I will take care of this issue in next version

Thanks,
Jiada
>    CC      drivers/input/touchscreen/atmel_mxt_ts.o
> drivers/input/touchscreen/atmel_mxt_ts.c:34:10: fatal error:
> dt-bindings/input/atmel_mxt_ts.h: No such file or directory
>     34 | #include <dt-bindings/input/atmel_mxt_ts.h>
> 

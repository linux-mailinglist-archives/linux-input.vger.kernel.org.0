Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A89C2446DF
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 18:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392821AbfFMQzM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 12:55:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:32771 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730027AbfFMCJj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 22:09:39 -0400
Received: from [114.252.212.37] (helo=[192.168.1.101])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hbFBC-0000NY-8F; Thu, 13 Jun 2019 02:09:30 +0000
Subject: Re: [PATCH] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
References: <20190612070517.20810-1-hui.wang@canonical.com>
 <20190612073817.ju2skswtatl2fxjn@pali>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <dd3533ab-374d-ee6d-1d02-14fb83534ae3@canonical.com>
Date:   Thu, 13 Jun 2019 10:09:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612073817.ju2skswtatl2fxjn@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019/6/12 下午3:38, Pali Rohár wrote:
> On Wednesday 12 June 2019 15:05:17 Hui Wang wrote:
>> On a latest Lenovo laptop, the trackpoint and 3 buttons below it
>> don't work at all, when we move the trackpoint or press those 3
>> buttons, the kernel will print out:
>> "Rejected trackstick packet from non DualPoint device"
>>
>> This device is identified as alps touchpad but the packet has
>> trackpoint format, so the alps.c drops the packet and prints out
>> the message above.
>>
>> According to XiaoXiao's explanation, this device is named cs19 and
>> is trackpoint-only device, its firmware is only for trackpoint, it
>> is independent of touchpad and is a completely different device from
>> DualPoint ones.
>>
>> To drive this device with mininal changes to the existing driver, we
>> just let the alps driver not handle this device, then the trackpoint.c
>> will be the driver of this device.
>>
>> With the trackpoint.c, this trackpoint and 3 buttons all work well,
>> they have all features that the trackpoint should have, like
>> scrolling-screen, drag-and-drop and frame-selection.
>>
>> Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   drivers/input/mouse/alps.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
>> index 0a6f7ca883e7..ff522cd980a0 100644
>> --- a/drivers/input/mouse/alps.c
>> +++ b/drivers/input/mouse/alps.c
>> @@ -24,6 +24,7 @@
>>   
>>   #include "psmouse.h"
>>   #include "alps.h"
>> +#include "trackpoint.h"
>>   
>>   /*
>>    * Definitions for ALPS version 3 and 4 command mode protocol
>> @@ -2864,6 +2865,24 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
>>   	return NULL;
>>   }
>>   
>> +static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
>> +{
>> +	u8 param[2] = { 0 };
>> +	int error;
>> +
>> +	error = ps2_command(&psmouse->ps2dev,
>> +			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
>> +	if (error)
>> +		return false;
>> +
>> +	if (param[0] == TP_VARIANT_ALPS && param[1] & 0x20) {
> Hi!
>
> Do we need to check firmware id? Is not check for "any alps trackpoint"
> enough? If in future there would be more alps trackpoint-only devices it
> probably have different firmware id.
>
> Also you need to put param[1] & 0x20 into parenthesis due to priority of
> & and && operators.
Got it, will drop param[1] & 0x20 and make it work for more alps devices.
>
> Also, what about making trackpoint_start_protocol() function non-static
> and use it in alps_is_c19_trackpoint implementation? It is doing exactly
> same thing.

Suppose users enabled the CONFIG_MOUSE_PS2_ALPS while disabled the 
CONFIG_MOUSE_PS2_TRACKPOINT, there will be some building error.

We may change Kconfig to let ALPS depend on TRACKPOINT, but it is not 
worth doing that only for one function.
>> +		psmouse_dbg(psmouse, "It is an ALPS trackpoint-only device (CS19)\n");
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
>>   {
>>   	const struct alps_protocol_info *protocol;
>> @@ -2883,6 +2902,15 @@ static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
>>   	if ((e6[0] & 0xf8) != 0 || e6[1] != 0 || (e6[2] != 10 && e6[2] != 100))
>>   		return -EINVAL;
>>   
>> +	/*
>> +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
>> +	 * of touchpad. So it is a different device from DualPoint ones, if it
>> +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
>> +	 * let trackpoint.c drive this device.
>> +	 */
>> +	if (alps_is_cs19_trackpoint(psmouse))
>> +		return -EINVAL;
>> +
> This change is not ideal as this function would be called two times, see
> alps_detect(). I would suggest to think more about detection and come up
> with better solution so above trackpoint check would called only once
> during PS/2 device detection.
>
> Calling that trackpoint check two times is useless and just increase
> detection time of PS/2 devices.

OK, I will try to move this checking into the alps_detect(), then it 
will be called once.

Thanks.


>
>>   	/*
>>   	 * Now get the "E7" and "EC" reports.  These will uniquely identify
>>   	 * most ALPS touchpads.

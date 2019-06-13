Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2B0442D8
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 18:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbfFMQ0P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 12:26:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41177 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730963AbfFMIgR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 04:36:17 -0400
Received: from [222.130.132.197] (helo=[192.168.1.101])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hbLDN-0006Zo-W6; Thu, 13 Jun 2019 08:36:10 +0000
Subject: Re: [PATCH v2] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
References: <20190613033249.20307-1-hui.wang@canonical.com>
 <20190613074518.jf55wmug5njddzn4@pali>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <63493fb3-d670-fae3-1e71-42188e15761d@canonical.com>
Date:   Thu, 13 Jun 2019 16:36:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613074518.jf55wmug5njddzn4@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019/6/13 下午3:45, Pali Rohár wrote:
> On Thursday 13 June 2019 11:32:49 Hui Wang wrote:
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
>> In the v2, I move the cs19 checking to alsp_detect(), and
>> drop the param[1] checking. And because after executing
>> alps_indetify(), the device is not in the command mode,
>> i rewrite teh alsp_is_cs19_trackpoint() to add enter/exit_command_mode().
>>
>>   drivers/input/mouse/alps.c | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
>> index 0a6f7ca883e7..6f227e8ddd7e 100644
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
>> @@ -2864,6 +2865,28 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
>>   	return NULL;
>>   }
>>   
>> +static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
>> +{
>> +	u8 param[2] = { 0 };
>> +
>> +	if (alps_enter_command_mode(psmouse))
>> +		return false;
> Ufff... is this correct? Entering to command mode e.g. on rushmore
> devices put ALPS touchpad into passthrough mode, when touchpad forwards
> all packets from trackstick (connected to touchpad) directly to the
> host.
>
> I understood that ALPS trackpoint-only device do not have any touchpad,
> so how is command mode suppose to work? What passthrough mean there?
>
> Also does not it break e.g. ALPS rushmore devices?
>
> I would suggest if you can provide architecture how this trackpoint-only
> device is connected and which protocols it understand. Seems that there
> are missing for us important details, like why is passthrough mode
> needed and where it passthrough (there is a second device? which?).
I don't want to put the controller into the passthrough mode,  I add the 
alps_enter_command_mode() just because the alps_identify() calls the 
alps_exit_command_mode().
>
>> +	if (ps2_command(&psmouse->ps2dev,
>> +			param, MAKE_PS2_CMD(0, 2, TP_READ_ID)))
>> +		return false;
> So if ps2_command fails then device stay in passthrough mode forever.
> And in past I was told by ALPS people that some ALPS rushmore devices
> have a firmware bug that PS/2 reset command does not exit from
> passthrough mode. So this code put some ALPS devices into fully
> unusable and unresetable mode. And full machine power off is needed.

Yes, this is a problem, I thought the immediate followed psmouse_reset() 
will reset the controller to normal state.


And I just tested to remove the enter_command_mode() and 
exit_command_mode(), the device still worked well, it could read the 
TP_ID through the ps2_command(&psmouse->ps2dev, param, MAKE_PS2_CMD(0, 
2, TP_READ_ID))), so if removing enter/exit_command_mode() and only keep 
the ps2_command(...), do you think it is safe for other alps devices?

Thanks,

Hui.


>
>> +	if (alps_exit_command_mode(psmouse))
>> +		return false;
>> +
>> +	if (param[0] == TP_VARIANT_ALPS) {
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
>> @@ -3164,6 +3187,15 @@ int alps_detect(struct psmouse *psmouse, bool set_properties)
>>   	if (error)
>>   		return error;
>>   
>> +	/*
>> +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
>> +	 * of touchpad. So it is a different device from DualPoint ones, if it
>> +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
>> +	 * let trackpoint.c to drive this device.
>> +	 */
>> +	if (alps_is_cs19_trackpoint(psmouse))
>> +		return -EINVAL;
>> +
>>   	/*
>>   	 * Reset the device to make sure it is fully operational:
>>   	 * on some laptops, like certain Dell Latitudes, we may
>> -- 
>> 2.17.1
>>

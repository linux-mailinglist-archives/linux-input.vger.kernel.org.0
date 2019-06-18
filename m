Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC7049C6C
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2019 10:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbfFRIys (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 04:54:48 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44323 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728991AbfFRIys (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 04:54:48 -0400
Received: from [125.35.49.90] (helo=[10.0.0.24])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hd9t4-0003wx-R3; Tue, 18 Jun 2019 08:54:43 +0000
Subject: Re: [PATCH v4] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
References: <20190617120555.8750-1-hui.wang@canonical.com>
 <20190618082759.aaq4jndhfbe7lqt7@pali>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <6310b8a3-1245-d5c2-7013-0f430acfdd3d@canonical.com>
Date:   Tue, 18 Jun 2019 16:54:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618082759.aaq4jndhfbe7lqt7@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019/6/18 下午4:27, Pali Rohár wrote:
> On Monday 17 June 2019 20:05:55 Hui Wang wrote:
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
>> Sorry, forgot to add "param[1] & 0x20" checking in the v3, please
>> ignore the v3 patch.
>>   drivers/input/mouse/alps.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
>> index 0a6f7ca883e7..6bed9eb16c2c 100644
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
>> @@ -2864,6 +2865,23 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
>>   	return NULL;
>>   }
>>   
>> +static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
>> +{
>> +	u8 param[2] = { 0 };
>> +
>> +	if (ps2_command(&psmouse->ps2dev,
>> +			param, MAKE_PS2_CMD(0, 2, TP_READ_ID)))
>> +		return false;
>> +
>> +	if ((param[0] == TP_VARIANT_ALPS) && (param[1] & 0x20)) {
> You should describe what does magic (param[1] & 0x20) check is doing.
> Reading trakcpoint.c gives us assumption that param[1] is firmware id,
> but why mask 0x20 is not explained.

Hi XiaoXiao,

what explanation should we add for (param[1] & 0x20)?

>
>> +		psmouse_warn(psmouse,
>> +			     "It is an ALPS trackpoint-only device (CS19), make sure the MOUSE_PS2_TRACKPOINT is enabled to drive it\n");
> This will throw a warning for every CS19 device independently of kernel
> configuration. You should not throw warning and spam users who compiled
> kernel with trackpoint support.
>
> Rather use something like this:
>
>    if (param[0] ...) {
>      if (IS_ENABLED(CONFIG_MOUSE_PS2_TRACKPOINT))
>        psmouse_dbg(psmouse, "ALPS CS19 trackpoint-only device detected, not using ALPS touchpad driver\n");
>      else
>        psmouse_warn(psmouse, "ALPS CS19 trackpoint-only device detected, but CONFIG_MOUSE_PS2_TRACKPOINT is not enabled, fallback to bare PS/2 mouse\n");
>      return true;
>    }
>
> Just rephrase messages to not be too long and useful for user.

OK, will change it.

Thanks

>
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
>>   {
>>   	const struct alps_protocol_info *protocol;
>> @@ -3164,6 +3182,17 @@ int alps_detect(struct psmouse *psmouse, bool set_properties)
>>   	if (error)
>>   		return error;
>>   
>> +	/*
>> +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
>> +	 * of touchpad. So it is a different device from DualPoint ones, if it
>> +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
>> +	 * let trackpoint.c to drive this device.
>> +	 * If ps2_command() fails here, we depend on the immediate followed
>> +	 * psmouse_reset() to reset the device to normal state.
>> +	 */
>> +	if (alps_is_cs19_trackpoint(psmouse))
>> +		return -EINVAL;
>> +
>>   	/*
>>   	 * Reset the device to make sure it is fully operational:
>>   	 * on some laptops, like certain Dell Latitudes, we may

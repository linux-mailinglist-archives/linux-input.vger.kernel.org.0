Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A97598AD2
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 07:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfHVFYp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 01:24:45 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:18158 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbfHVFYp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 01:24:45 -0400
IronPort-SDR: 3H6w9hvd9Rzw5T9ljf00OEusFFCBovyHPtGxTQ9zJE0tfv2enJbNgL4yyUpx+Pe/GoGDsCAzUG
 ihk0aPMOy/sdnt3367zEeDDY4Zrg5087K09Rh0Xmop7CLPxueFMpWzMyBffz/saqo+e3NKjgYR
 whXSKN7G6bV5Cl+3Ov9HSv2pgx6NgSc5aHWu58MDdEPVVT5K0Y1tsGAl18LvXxL2qbKVuBNuyz
 IMXZcrLVActYZmqLgl/vnxdgAzE+ID1MFyT8Fv0mbl+3Cq3dDZXmrunmqgDL5X8TRW+jJxVV/J
 Iu0=
X-IronPort-AV: E=Sophos;i="5.64,415,1559548800"; 
   d="scan'208";a="40662973"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 21 Aug 2019 21:24:44 -0800
IronPort-SDR: ytXDY1HL31EmIsp7bVLWwQ0GsHktTIcm+bDVDts1rG3xTyJoIsLtbl9JfT1VRGNCAJPtBA8hGY
 v7dav1CS+OQc9SiUDpPMT7pq71PS/aw9X6HGSIy/uFpYwsGFTC16VR4A9nmMopquvh5q1xgd4/
 kcqG8l5K4tV4ZP8yST999d8gzPVvxnuzg+x7tJLOxDDUNBiJfZXQtUNpcPeWGBJ1XpFBufG5ow
 5rgeu52SnKCeFSb5wLCnF9hw/3inmUiDg7++5526tTWkrYrXDiXwf9jh52Ht9PAdDqdU0wCk04
 4vI=
Subject: Re: [PATCH v1 04/63] Input: atmel_mxt_ts - split large i2c transfers
 into blocks
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
 <20190816082952.17985-5-jiada_wang@mentor.com>
 <20190816171837.GG121898@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <4f9aaee0-c3de-3ad4-4c66-333afd92240e@mentor.com>
Date:   Thu, 22 Aug 2019 14:24:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816171837.GG121898@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2019/08/17 2:18, Dmitry Torokhov wrote:
> On Fri, Aug 16, 2019 at 05:28:53PM +0900, Jiada Wang wrote:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> On some firmware variants, the size of the info block exceeds what can
>> be read in a single transfer.
>>
>> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
>> (cherry picked from ndyer/linux/for-upstream commit 74c4f5277cfa403d43fafc404119dc57a08677db)
>> [gdavis: Forward port and fix conflicts due to v4.14.51 commit
>> 	 960fe000b1d3 ("Input: atmel_mxt_ts - fix the firmware
>> 	 update").]
>> Signed-off-by: George G. Davis <george_davis@mentor.com>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 27 +++++++++++++++++++++---
>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index 9b165d23e092..2d70ddf71cd9 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -40,7 +40,7 @@
>>   #define MXT_OBJECT_START	0x07
>>   #define MXT_OBJECT_SIZE		6
>>   #define MXT_INFO_CHECKSUM_SIZE	3
>> -#define MXT_MAX_BLOCK_WRITE	256
>> +#define MXT_MAX_BLOCK_WRITE	255
>>   
>>   /* Object types */
>>   #define MXT_DEBUG_DIAGNOSTIC_T37	37
>> @@ -659,6 +659,27 @@ static int __mxt_read_reg(struct i2c_client *client,
>>   	return ret;
>>   }
>>   
>> +static int mxt_read_blks(struct mxt_data *data, u16 start, u16 count, u8 *buf)
> 
> Can we call this __mxt_read_reg() and the original read reg call
> __mxt_read_chunk()?
>
yes, I will update in v2 patch-set,
so that every call to __mxt_read_reg() in atmel driver,
can have the feature to split large size transfer.

Thanks,
Jiada

>> +{
>> +	u16 offset = 0;
>> +	int error;
>> +	u16 size;
>> +
>> +	while (offset < count) {
>> +		size = min(MXT_MAX_BLOCK_WRITE, count - offset);
>> +
>> +		error = __mxt_read_reg(data->client,
>> +				       start + offset,
>> +				       size, buf + offset);
>> +		if (error)
>> +			return error;
>> +
>> +		offset += size;
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Thanks.
> 

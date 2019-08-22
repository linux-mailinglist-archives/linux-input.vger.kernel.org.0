Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8E198AF1
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 07:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731411AbfHVFxC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 01:53:02 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:18443 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731379AbfHVFxC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 01:53:02 -0400
IronPort-SDR: Rz/vsKz/ZrCwjli1wyH8FQkneU0NPS8mLn5x8RbAx625ZpfvcoM9XkZJBr45q9X5F6RemBp6wV
 juh9wupgc8dV5wxXD/uui0ChjT7IVWIqO/hCKW2/XBK4AxLAZIic/0saDMNmPSlavjZvRRVqzh
 sBPRfI0tmzrms7PDsAuZKhDP+n9wWsUUcUMScfa5W/fUG+wFbNlYcnpB/zkCe1b8fb7ZDNU2hn
 SRgqY0LuuwqJnnQ8Z/rKb5Wd/NuTq0t0bBsXs0QWXXBsmFXYoznpuhun7FLErreJHSCe7rRAUB
 +Oc=
X-IronPort-AV: E=Sophos;i="5.64,415,1559548800"; 
   d="scan'208";a="40663374"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 21 Aug 2019 21:53:01 -0800
IronPort-SDR: O8JRi/Ew6E4tPqjpwTRnG377DfKmvYUuUS4skw+4Ce9z5P/4q5k8t5ZpaW6q4+kYLQwKYYlw8/
 v0D0yPPIvXgUh4O2s3y6hZlzR2JLLKgHmYUvw9Z3QFv6vDHGAujdFQzedvp0f4VPofyZMufQOp
 nFpivY9vOX9HAb37zTzjC+29heVpwI8YzynO3mVzQsaeBXQSuJes/hJAg6iIIWrdxzxhKBGhlP
 k+waTjLK53o+LGXWF46DdJFBMZuE1G1CtlbPKi0y6drqd3g5S9ZzwiCUBKri4u//JG4eB0zA8Z
 U2w=
Subject: Re: [PATCH v1 06/63] Input: atmel_mxt_ts - output status from T42
 Touch Suppression
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816083130.18250-1-jiada_wang@mentor.com>
 <20190816083130.18250-2-jiada_wang@mentor.com>
 <20190816173426.GM121898@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <07f3ff0d-5076-2b36-ece4-5fce8ceada8f@mentor.com>
Date:   Thu, 22 Aug 2019 14:52:57 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816173426.GM121898@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On 2019/08/17 2:34, Dmitry Torokhov wrote:
> On Fri, Aug 16, 2019 at 05:30:33PM +0900, Jiada Wang wrote:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
>> Acked-by: Benson Leung <bleung@chromium.org>
>> Acked-by: Yufeng Shen <miletus@chromium.org>
>> (cherry picked from ndyer/linux/for-upstream commit ab95b5a309999d2c098daaa9f88d9fcfae7eb516)
>> Signed-off-by: George G. Davis <george_davis@mentor.com>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 25 ++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index a75c35c6f9f9..9226ec528adf 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -155,6 +155,9 @@ struct t37_debug {
>>   #define MXT_RESET_VALUE		0x01
>>   #define MXT_BACKUP_VALUE	0x55
>>   
>> +/* Define for MXT_PROCI_TOUCHSUPPRESSION_T42 */
>> +#define MXT_T42_MSG_TCHSUP	BIT(0)
>> +
>>   /* T100 Multiple Touch Touchscreen */
>>   #define MXT_T100_CTRL		0
>>   #define MXT_T100_CFG1		1
>> @@ -323,6 +326,8 @@ struct mxt_data {
>>   	u8 T9_reportid_max;
>>   	u16 T18_address;
>>   	u8 T19_reportid;
>> +	u8 T42_reportid_min;
>> +	u8 T42_reportid_max;
>>   	u16 T44_address;
>>   	u8 T48_reportid;
>>   	u8 T100_reportid_min;
>> @@ -978,6 +983,17 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
>>   	data->update_input = true;
>>   }
>>   
>> +static void mxt_proc_t42_messages(struct mxt_data *data, u8 *msg)
>> +{
>> +	struct device *dev = &data->client->dev;
>> +	u8 status = msg[1];
>> +
>> +	if (status & MXT_T42_MSG_TCHSUP)
>> +		dev_info(dev, "T42 suppress\n");
>> +	else
>> +		dev_info(dev, "T42 normal\n");
> 
> dev_dbg(). There is no need to flood the logs with this. I'd assume this
> is for assisting in bringup. Should there be some more generic way of
> monitoring the status?
> 
will replace with dev_dbg() in v2 patchset

thanks,
Jiada

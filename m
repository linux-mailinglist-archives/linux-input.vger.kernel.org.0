Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B0AA62CF
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 09:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfICHjm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 03:39:42 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:32023 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfICHjm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 03:39:42 -0400
IronPort-SDR: JCSLeuwZdj8Ynscl8d03ZQDv6CgILXpRexnIQQJEZIwXp1nE4F6By1yVqkCWnoJWQwcug31kW5
 uoqkBVGfNzBK4o3LMaDD0f2Cz3yj1hl6Rd5YrdxtQP9llL8IuZpjbIezjgDxDWMO4fSPDvSTFg
 dBeWm2JPmzGBKi/pQ+ULMGwbteOaxE6mkGCfpl9K6bOnJfZa2wYN31hTajgXU/1eDQiGRB5FGW
 R6UVZ/i3FmyPBu/8Hqrtz4pLbIl1FQ5rLFfkfesQJQ/wTyAqoc1swEfdTvzN52FDShqkvRcUNE
 v/o=
X-IronPort-AV: E=Sophos;i="5.64,462,1559548800"; 
   d="scan'208";a="40981245"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 02 Sep 2019 23:39:41 -0800
IronPort-SDR: 35HFBf4IB4rsH7nw4NcOS0b3VfKkz2tp1a128GNUK3777TLBhFYVr+aAGcw0NzD5XH8dldBOrr
 WLV8+0gC3Xho28VXqtulwGLvWmwcW9oC3Nv5h8LfrJi+jqDfR8AgwD004peu7ZGkc2q6oucHTa
 f4jSi9C5ha1TMXkXwdunlPAYS3mGkSKSkImEj0cc6cKa5tUpCHN658HMvUBrwix8Gxz3F09tW4
 Lk7CLHumHK7alvUxRm4i1/yxNJvQ6b3Z7XMT/f33rUhFGHn3JVD1D1MrVht38+xZcCZRZ83UC0
 leU=
Subject: Re: [PATCH v2 29/49] Input: atmel_mxt_ts - implement debug output for
 messages
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <george_davis@mentor.com>
References: <20190827062943.20698-1-jiada_wang@mentor.com>
 <20190827062943.20698-5-jiada_wang@mentor.com>
 <20190829153124.cozqsegnmvxveecd@holly.lan>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <f0e8045a-e5d8-1fcf-268e-9a0ae6d9c0d4@mentor.com>
Date:   Tue, 3 Sep 2019 16:39:32 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829153124.cozqsegnmvxveecd@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel

On 2019/08/30 0:31, Daniel Thompson wrote:
> On Tue, Aug 27, 2019 at 03:29:23PM +0900, Jiada Wang wrote:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> Add a debug switch which causes all messages from the touch controller to
>> be dumped to the dmesg log with a set prefix "MXT MSG:". This is used by
>> Atmel user-space utilities to debug touch operation. Enabling this output
>> does impact touch performance.
>>
>> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
>> (cherry picked from ndyer/linux/for-upstream commit 3c3fcfdd4889dfeb1c80ae8cd94a622c6342b06a)
>> [gdavis: Forward port and fix conflicts.]
>> Signed-off-by: George G. Davis <george_davis@mentor.com>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 44 ++++++++++++++++++++++--
>>   1 file changed, 41 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index 2d2e8ea30547..941c6970cb70 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -335,6 +335,7 @@ struct mxt_data {
>>   	u8 t100_aux_ampl;
>>   	u8 t100_aux_area;
>>   	u8 t100_aux_vect;
>> +	bool debug_enabled;
>>   	u8 max_reportid;
>>   	u32 config_crc;
>>   	u32 info_crc;
>> @@ -460,8 +461,8 @@ static bool mxt_object_readable(unsigned int type)
>>   
>>   static void mxt_dump_message(struct mxt_data *data, u8 *message)
>>   {
>> -	dev_dbg(&data->client->dev, "message: %*ph\n",
>> -		data->T5_msg_size, message);
>> +	dev_dbg(&data->client->dev, "MXT MSG: %*ph\n",
>> +		       data->T5_msg_size, message);
> 
> I'm not 100% convinced that the kernel should change here (arguably the
> userspace utility should be modified instead) but if the messages are
> conforming to some sort of vendor specific protocol then some commenting
> is needed.
I will update with inline comment
> 
> 
>> @@ -3538,6 +3573,8 @@ static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
>>   static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
>>   static DEVICE_ATTR(update_cfg, S_IWUSR, NULL, mxt_update_cfg_store);
>>   static DEVICE_ATTR(config_crc, S_IRUGO, mxt_config_crc_show, NULL);
>> +static DEVICE_ATTR(debug_enable, S_IWUSR | S_IRUSR, mxt_debug_enable_show,
>> +		   mxt_debug_enable_store);
> 
> Why isn't CONFIG_DYNAMIC_DEBUG sufficient to enable/disable the
> messages?
> 
thanks for the comment, I think the only difference is,
by only using CONFIG_DYNAMC_DEBUG, it's hard to differentiate
the messages between valid report_id and exceptional case
(explicitly set of "dump = true")


Thanks,
Jiada
> 
> Daniel.
> 

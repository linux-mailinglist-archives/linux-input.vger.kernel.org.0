Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DBD1A3194
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 11:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgDIJLm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 05:11:42 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:40456 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgDIJLl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 05:11:41 -0400
IronPort-SDR: ct4va3PXa6gQfQJrKzxknWr6fH1WT2JNNMAOzeV/1M1PsC/1mVNkhXuQIJWdJgyzmbPWZ77D+N
 3uVFVCRQr9jqWjYcGTRNA1blOzKTtupDioCFPL9QICYrMNL3uTeJWFatPYcFN0tB/lG5BPDJj9
 wBowsRYKJo59K0taIx5dbL1B2ew4d6G7UQytJZo97gqEw65jS8aRxo7qRtAvDYh/6RpOunJgTB
 W23lt5RDa4o32xFcLFgGdi93+bBymZFO6JY7OkHixQXuSOzJbFzeI4ek41VzzUvWqI7nx43+Qd
 O4w=
X-IronPort-AV: E=Sophos;i="5.72,362,1580803200"; 
   d="scan'208";a="47642037"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 09 Apr 2020 01:11:41 -0800
IronPort-SDR: /UoAsK/CNHGHlgO2hG4TioUfunh1NUNLEFQIgZ+Wo5sclgKRILoC0zkz8qhgagkWBS4duRMpur
 cqXAjXItpdvzSanhGo2+9IUV9r8kDhzBkxy7ZPpkfTgCm8hOor+bEOwq9Sb3eDLu0MocZgh625
 0REFH6kmnviSmCnaj6M6zCeeJOX9IDL5ZF/+IWer9ysbHj8e3TXHvNZzRZ1qwLUfpDI7qyx1eb
 RvHV9wxa6kdqJ3W00kW7A0HhNIAUdjB1nDw1KZw/GheMKSBwgG9/qzzsxrUPV/TN3q+YrGV40R
 kMg=
Subject: Re: [PATCH v10 20/55] Input: atmel_mxt_ts - handle cfg filename via
 pdata/sysfs
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-21-jiada_wang@mentor.com>
 <d926e4be-84ee-24f3-3523-776e763e6d4e@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <9dc72d14-f6fe-45b7-1550-f1f25d841ef2@mentor.com>
Date:   Thu, 9 Apr 2020 18:11:35 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d926e4be-84ee-24f3-3523-776e763e6d4e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-06.mgc.mentorg.com (147.34.90.206) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitrij

On 2020/04/07 23:56, Dmitry Osipenko wrote:
> 31.03.2020 13:50, Jiada Wang пишет:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> There may be multiple maXTouch chips on a single device which will require
>> different configuration files. Add a platform data value for the
>> configuration filename.
>>
>> Add sysfs entry to write configuration file if the platform data is not
>> set.
>>
>> Split out the object initialisation code from mxt_initialize() into
>> mxt_configure_objects() to allow this.
>>
>> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
>> Acked-by: Yufeng Shen <miletus@chromium.org>
>> (cherry picked from ndyer/linux/for-upstream commit 71a2a4d1954460b949a16b607f72bafab294ca79)
>> [gdavis: Resolve forward port conflicts due to applying upstream
>> 	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
>> 	 data support").]
>> Signed-off-by: George G. Davis <george_davis@mentor.com>
>> [gdavis: Squash fix from Vladimir Zapolskiy:
>> 	 - Input: atmel_mxt_ts - fix error paths in mxt_configure_objects()]
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>> [jiada: Separate Documentation/ portion change to another commit
>> 	Rename mxt_update_cfg_store to update_cfg_store
>> 	Replace DEVICE_ATTR with DEVICE_ATTR_WO]
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 109 +++++++++++++++++++----
>>   1 file changed, 94 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index 720574417219..d1865250f492 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -34,7 +34,6 @@
>>   #include <dt-bindings/input/atmel_mxt_ts.h>
>>   
>>   /* Configuration file */
>> -#define MXT_CFG_NAME		"maxtouch.cfg"
>>   #define MXT_CFG_MAGIC		"OBP_RAW V1"
> ...
> 
>>   static void mxt_input_sync(struct mxt_data *data)
>>   {
>> -	input_mt_report_pointer_emulation(data->input_dev,
>> -					  data->t19_num_keys);
>> -	input_sync(data->input_dev);
>> +	if (data->input_dev) {
>> +		input_mt_report_pointer_emulation(data->input_dev,
>> +						  data->t19_num_keys);
>> +		input_sync(data->input_dev);
>> +	}
>>   }
> 
> Looks like this hunk shouldn't belong to this patch.
yes, this part of change
squash fix from ndyer/linux/for-upstream commit 
c909ada856861f305653b127db3ea0fa60264331
- Input: atmel_mxt_ts - check data->input_dev is not null in 
mxt_input_sync()
seems due to some mistake, commit description about the squash,
start to be missing from v6 patch-set

I will separate it back into a single commit
> 
> ...
>> +	if (data->pcfg_name)
>> +		mxt_update_file_name(&data->client->dev,
>> +				     &data->cfg_name,
>> +				     data->pcfg_name,
>> +				     strlen(data->pcfg_name));
> 
> This looks wrong to me because I think the cfg_name should fall back to
> "maxtouch.cfg" if atmel,cfg_name isn't specified in device-tree,
> otherwise this commit may break devices that use an older device-tree.
> 
I agree with you, in next version,
I will update this patch to also be compatible with legacy cfg name 
"maxtouch.cfg"

Thanks,
Jiada

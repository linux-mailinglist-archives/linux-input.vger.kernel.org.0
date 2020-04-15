Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90191AA363
	for <lists+linux-input@lfdr.de>; Wed, 15 Apr 2020 15:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441347AbgDONJA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Apr 2020 09:09:00 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:10713 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730996AbgDONIy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Apr 2020 09:08:54 -0400
IronPort-SDR: 6k2uFKYTgrJE0rhzjuRkpiJvuqgCWkuP7DCmMFrEkYZOaSoZqNwvgLqaRLl6+jxfOgjmQngmUR
 XhxbBICcQjqxiwiYElZ8YuRw7VRqSs5fWKEeQy3rvZLoMUNOsoWFIvJcgnWP4TAZwUBkrhRts8
 TiUyymwPgyawCFHrCv5Ct7HWPUW4PIeDvctokaPojl7gzfFu5C7jYFKf2l1TNPLJht8GWbepOi
 qlg6uJB6vTejRYnHsUds5o1+DpqJV7IoFCcYx1BQ+4XkONifbvj7gdhXZ+wSPquiyXJ9sYBklE
 B7k=
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="49774491"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 15 Apr 2020 05:08:39 -0800
IronPort-SDR: Y5LAQRItYnmMOn+DC8fv4yqie+YpKzOr+dWbCm+EKPE654a2TpX2guXwd4cB9WW/MCLh0d+iUY
 BsB6XlVT70qdLBaCLeEYHRwjYjgBe3eIWVv8YIRhU9NjrQ/w3+xt5MQ0ltBSrpexPxctv5g/MD
 ovOH9jODJaeC87HMj2+75S657YDnNIWlkshO1TmXod+gkzejCwOoNMfklbwSNVOv1j7mHVIWUt
 LBA3bu7dBRUkvLi+U2GCBJ6RSSHY292pdULSFYiBo3veTcvtcazDamY2AiW4aXvFoQ/PKhZDzC
 5ew=
Subject: Re: [PATCH v10 18/55] Input: atmel_mxt_ts: Rename mxt_hw_version_show
 to hw_version_show
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-19-jiada_wang@mentor.com>
 <aae29974-7a8f-404b-b115-59416021ff61@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <620a300b-4aa4-efe6-20e4-4f44fd9a3fd0@mentor.com>
Date:   Wed, 15 Apr 2020 22:08:34 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aae29974-7a8f-404b-b115-59416021ff61@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-06.mgc.mentorg.com (147.34.90.206) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/04/11 6:46, Dmitry Osipenko wrote:
> 31.03.2020 13:50, Jiada Wang пишет:
>> Rename mxt_hw_version_show to hw_version_show to address checkpatch warning
>>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index b2a37a9597f3..cec823de4096 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -3114,8 +3114,8 @@ static ssize_t fw_version_show(struct device *dev,
>>   }
>>   
>>   /* Hardware Version is returned as FamilyID.VariantID */
>> -static ssize_t mxt_hw_version_show(struct device *dev,
>> -				   struct device_attribute *attr, char *buf)
>> +static ssize_t hw_version_show(struct device *dev,
>> +			       struct device_attribute *attr, char *buf)
>>   {
>>   	struct mxt_data *data = dev_get_drvdata(dev);
>>   	struct mxt_info *info = data->info;
>> @@ -3404,7 +3404,7 @@ static const struct attribute_group mxt_fw_attr_group = {
>>   };
>>   
>>   static DEVICE_ATTR_RO(fw_version);
>> -static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
>> +static DEVICE_ATTR_RO(hw_version);
>>   static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
> 
> What about to add a patch to convert the mxt_object_show to
> DEVICE_ATTR_RO(object_show)?
> 
sure, mxt_object, is the last attr not using DEVICE_ATTR_[RO|WO|RW],
I will add another commit to update in next version

Thanks,
Jiada

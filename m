Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8FA98CBA
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 09:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbfHVH5Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 03:57:16 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:34307 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfHVH5P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 03:57:15 -0400
IronPort-SDR: ZSeoSX1oBghHHzRNQ7o6UK41ShWYdlIOcXTBP6WJDycpgG5OgFcgtpFk1MWfF5DboRYa5uJqhB
 B6/CIHqCiH527kAcmDvxzObRigDui8MGU5X4zXMLP7OI7sUDfSlXAxzIJBu1ZNdtoa+WcW50yT
 GF4Co34we5MoqxrBoCUqG0nhyOXPDt6uMLaS+WyrQTdSE1gdV6On2BAINzuvb9Y8A+c1r6onGs
 TDl9qbi1VS40EXKBObBKkL2xiEBbHhhChnjXiaNK8lLeTx4Y7kne+BQLcSwvLiIeeVWhCIjNsR
 KEc=
X-IronPort-AV: E=Sophos;i="5.64,415,1559548800"; 
   d="scan'208";a="40637609"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 21 Aug 2019 23:57:15 -0800
IronPort-SDR: S5FHnPkZl+154JHRdXpegyD1qv7BLTvnLiG7lncwgts/R5Vr+iFloCy0FswjaeR0f+zLsRk0Vo
 SvE+/3jVi3/7LFTSxv8txRm6B6oYOKcaC0l1dlLUzu+vQNemORbXuagY6717k4Q7PyuMwqkFsD
 FjIBXWpxIK3Rm/2L81+4WErRYtCz5KwYDZwM7+x1+AXfTreMc4B5emulG3/vf9slfYPivJynE6
 wef7XEPSpVQR6cJPcRmTclRNB68IHSEhFuGTpUpL6v1I6U3u42oI0N0E9KzuM2zng2YknUtiq8
 M44=
Subject: Re: [PATCH v1 39/63] Input: touchscreen: Atmel: Add device tree
 support for T15 key array objects
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816083525.19071-1-jiada_wang@mentor.com>
 <20190816083525.19071-5-jiada_wang@mentor.com>
 <20190816172500.GI121898@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <f40a8123-6d94-26ff-d6f1-cc8c9db313a4@mentor.com>
Date:   Thu, 22 Aug 2019 16:57:10 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172500.GI121898@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On 2019/08/17 2:25, Dmitry Torokhov wrote:
> On Fri, Aug 16, 2019 at 05:35:01PM +0900, Jiada Wang wrote:
>> From: Daniel Gong <Zhanli.Gong@cn.bosch.com>
> 
> This should be with the code adding T15 handling.
> 
will squash this patch into T15 handling one in v2 patchset

Thanks,
Jiada
>>
>> Signed-off-by: Daniel Gong <Zhanli.Gong@cn.bosch.com>
>> Signed-off-by: George G. Davis <george_davis@mentor.com>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 29 ++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index be63002c2b31..3b9544c0a209 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -4143,10 +4143,12 @@ static int mxt_parse_device_properties(struct mxt_data *data)
>>   {
>>   	static const char keymap_property[] = "linux,gpio-keymap";
>>   	static const char gpios_property[] = "atmel,gpios";
>> +	static const char buttons_property[] = "atmel,key-buttons";
>>   	struct device *dev = &data->client->dev;
>>   	struct device_node *np = dev ? dev->of_node : NULL;
>>   	struct device_node *np_gpio;
>>   	u32 *keymap;
>> +	u32 *buttonmap;
>>   	int n_keys;
>>   	int error;
>>   
>> @@ -4181,6 +4183,33 @@ static int mxt_parse_device_properties(struct mxt_data *data)
>>   		data->t19_num_keys = n_keys;
>>   	}
>>   
>> +	if (device_property_present(dev, buttons_property)) {
>> +		n_keys = device_property_read_u32_array(dev, buttons_property,
>> +							NULL, 0);
>> +		if (n_keys <= 0) {
>> +			error = n_keys < 0 ? n_keys : -EINVAL;
>> +			dev_err(dev, "invalid/malformed '%s' property: %d\n",
>> +				buttons_property, error);
>> +			return error;
>> +		}
>> +
>> +		buttonmap = devm_kmalloc_array(dev, n_keys, sizeof(*buttonmap),
>> +					       GFP_KERNEL);
>> +		if (!buttonmap)
>> +			return -ENOMEM;
>> +
>> +		error = device_property_read_u32_array(dev, buttons_property,
>> +						       buttonmap, n_keys);
>> +		if (error) {
>> +			dev_err(dev, "failed to parse '%s' property: %d\n",
>> +				buttons_property, error);
>> +			return error;
>> +		}
>> +
>> +		data->t15_keymap = buttonmap;
>> +		data->t15_num_keys = n_keys;
>> +	}
>> +
>>   	device_property_read_u32(dev, "atmel,suspend-mode", &data->suspend_mode);
>>   
>>   	np_gpio = of_get_child_by_name(np, gpios_property);
>> -- 
>> 2.19.2
>>
> 

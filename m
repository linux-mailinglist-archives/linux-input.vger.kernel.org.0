Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71BEA242811
	for <lists+linux-input@lfdr.de>; Wed, 12 Aug 2020 12:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgHLKLl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Aug 2020 06:11:41 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:41936 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgHLKLl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Aug 2020 06:11:41 -0400
IronPort-SDR: /Na1TFej3rwiPwoC1wHSsVWyqg8mBfRNNKikqZtVeJbnGno3FTf6RS9/91eSmLsOUdqXqGfkrZ
 xklOvFu4aTCGiHTYnDrC/M1/loka+fxD+kz8Ux5P5k5fAkPRJmYjaWVTu9b9c4mjVypj+Jqpgv
 tCW9gmUB1dCHiYDrpgXvpWpCkBFPXocPpUkS0/3M8uW56mLbZHiSvQN4usOHNk5svcYqYBWM2s
 9/oGABz5EiVBXIqkjetY5cjzEBggPK7u/cAyEn5VEwHSf4yMZPkBSH3ZsiF+dUg8M38vUTkaQ/
 54M=
X-IronPort-AV: E=Sophos;i="5.76,303,1592899200"; 
   d="scan'208";a="54015934"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 12 Aug 2020 02:11:39 -0800
IronPort-SDR: mejU22uvxz4tPtEmuQVl+kgGTP6+w3XIrqzSRUEJ3wk6N9HFD8BTMKhpOGk4heBQ6DFlmQK5Pl
 CU1sQayIa9Lj/pywUGTwoXtJ3yH+Y6uXQFhhhmsCvMpe8S8kekB2yux3VQhswVS/I08P0Jz8XP
 gHpGWyzwhdgnYSBufiBuqyq2xp87MKjk7xSiJ5IoHu2uBeXzNWGXkILD9CGSTl/cu+c2Xu7m3Q
 2NjQvK+qlxaRDcVHWDJuSZrGqXLxo1U8G5tsOZVrKzu1xAku7+NNW5Ohi2cDzjvzADA73g8Ik8
 WmM=
Subject: Re: [PATCH 1/1] Input: atmel_mxt_ts - allow specification of firmware
 file name
To:     Dmitry Osipenko <digetx@gmail.com>,
        "nick@shmanahar.org" <nick@shmanahar.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "erosca@de.adit-jv.com" <erosca@de.adit-jv.com>,
        "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>
References: <20200731075714.10608-1-jiada_wang@mentor.com>
 <e5da9e03-8156-39f6-c78b-0226c95690c6@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <a0af72eb-11d9-cab1-c79a-0c42c3eb0e19@mentor.com>
Date:   Wed, 12 Aug 2020 19:11:34 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e5da9e03-8156-39f6-c78b-0226c95690c6@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-06.mgc.mentorg.com (147.34.90.206) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/08/10 5:11, Dmitry Osipenko wrote:
> 31.07.2020 10:57, Jiada Wang пишет:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> On platforms which have multiple device instances using this driver, the
>> firmware may be different on each device. This patch makes the user give
>> the name of the firmware file when flashing.
>>
>> This also prevents accidental triggering of the firmware load process.
>>
>> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
>> Acked-by: Benson Leung <bleung@chromium.org>
>> Acked-by: Yufeng Shen <miletus@chromium.org>
>> (cherry picked from ndyer/linux/for-upstream commit 76ebb7cee971cb42dfb0a3a9224403b8b09abcf1)
>> [gdavis: Forward port and fix conflicts.]
>> Signed-off-by: George G. Davis <george_davis@mentor.com>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 42 ++++++++++++++++++++----
>>   1 file changed, 36 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index a2189739e30f..024dee7a3571 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -30,8 +30,6 @@
>>   #include <media/videobuf2-v4l2.h>
>>   #include <media/videobuf2-vmalloc.h>
>>   
>> -/* Firmware files */
>> -#define MXT_FW_NAME		"maxtouch.fw"
>>   #define MXT_CFG_NAME		"maxtouch.cfg"
>>   #define MXT_CFG_MAGIC		"OBP_RAW V1"
>>   
>> @@ -308,6 +306,7 @@ struct mxt_data {
>>   	struct t7_config t7_cfg;
>>   	struct mxt_dbg dbg;
>>   	struct gpio_desc *reset_gpio;
>> +	char *fw_name;
> 
> Hello, Jiada!
> 
> Have you decided to abandon the patch which allowed to specify firmware
> name in a device tree?
> 
In v11 patch-set, there is a patch allows user to specify config file 
name via device-tree and sysfs, I will drop device-tree part, since 
Dmitry Torokhov commented he would like to change the behavior of 
firmware loading during boot time,
but I will keep sysfs interface part, which is similar to this patch but 
for configuration file.

>>   	/* Cached parameters from object table */
>>   	u16 T5_address;
>> @@ -2766,7 +2765,7 @@ static int mxt_check_firmware_format(struct device *dev,
>>   	return -EINVAL;
>>   }
>>   
>> -static int mxt_load_fw(struct device *dev, const char *fn)
>> +static int mxt_load_fw(struct device *dev)
>>   {
>>   	struct mxt_data *data = dev_get_drvdata(dev);
>>   	const struct firmware *fw = NULL;
>> @@ -2776,9 +2775,9 @@ static int mxt_load_fw(struct device *dev, const char *fn)
>>   	unsigned int frame = 0;
>>   	int ret;
>>   
>> -	ret = request_firmware(&fw, fn, dev);
>> +	ret = request_firmware(&fw, data->fw_name, dev);
>>   	if (ret) {
>> -		dev_err(dev, "Unable to open firmware %s\n", fn);
>> +		dev_err(dev, "Unable to open firmware %s\n", data->fw_name);
>>   		return ret;
>>   	}
>>   
>> @@ -2887,6 +2886,33 @@ static int mxt_load_fw(struct device *dev, const char *fn)
>>   	return ret;
>>   }
>>   
>> +static int mxt_update_file_name(struct device *dev, char **file_name,
>> +				const char *buf, size_t count)
>> +{
>> +	char *file_name_tmp;
>> +
>> +	/* Simple sanity check */
>> +	if (count > 64) {
>> +		dev_warn(dev, "File name too long\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	file_name_tmp = krealloc(*file_name, count + 1, GFP_KERNEL);
>> +	if (!file_name_tmp)
>> +		return -ENOMEM;
> 
> The allocated string is never release, this is not good.
> 
> Wouldn't it be nicer to make data->fw_name a fixed-size string?

OK, I will change to a fixed-size string

> 
>> +	*file_name = file_name_tmp;
>> +	memcpy(*file_name, buf, count);
>> +
>> +	/* Echo into the sysfs entry may append newline at the end of buf */
>> +	if (buf[count - 1] == '\n')
>> +		(*file_name)[count - 1] = '\0';
>> +	else
>> +		(*file_name)[count] = '\0';
> 
> What about to use strscpy?
> 
Thanks for the advice, I will replace with strscpy

>> +	return 0;
>> +}
>> +
>>   static ssize_t mxt_update_fw_store(struct device *dev,
>>   					struct device_attribute *attr,
>>   					const char *buf, size_t count)
>> @@ -2894,7 +2920,11 @@ static ssize_t mxt_update_fw_store(struct device *dev,
>>   	struct mxt_data *data = dev_get_drvdata(dev);
>>   	int error;
>>   
>> -	error = mxt_load_fw(dev, MXT_FW_NAME);
>> +	error = mxt_update_file_name(dev, &data->fw_name, buf, count);
>> +	if (error)
>> +		return error;
> 
> This change breaks old behavior, I'm not sure that it's acceptable. The
> default name should remain to be "maxtouch.fw", IMO.

it makes sense, I will update to write default "maxtouch.fw",
in case user doesn't specify a file name in sysfs write operation

Thanks,
Jiada
> 
>> +	error = mxt_load_fw(dev);
>>   	if (error) {
>>   		dev_err(dev, "The firmware update failed(%d)\n", error);
>>   		count = error;
>>
> 

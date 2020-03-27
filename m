Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 468D319577E
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 13:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0Mtf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Mar 2020 08:49:35 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:2339 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgC0Mtf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Mar 2020 08:49:35 -0400
IronPort-SDR: N6mJ5jQVFmaoeXk8IMWTdHonEVfzBavS3kGzVjRHFyY9vLDwSuYoottRmIFz0M9PqDdwAPONOM
 VTvo6pqyDhJ+O1sWLY8j73PIhXp1tYpza+durdvE/WHjI6UWejjULSb69/8lybnxh6iSdKsg/A
 l5VsiBgNoJepBtvzaPAHJ1c0TrUbNOkB8ujakZmUDuwlfqogWDHdtvIsUq8DRoxm8ZqYZwQs9R
 CE9Zp042pXau6IG5R8yj2etullPYURzCTGT372j4FxybiB3Qxdr7I/UFDRc92wj8UVswgoPuyY
 JCE=
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; 
   d="scan'208";a="47175290"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 27 Mar 2020 04:49:34 -0800
IronPort-SDR: mLbGuIWhr8qHvJEGRs4rGITXzvziN+jYvXMPNxgqaGORCP7VS8sUeq6K/esQ7Ya5CGMEtL1a0p
 QhKXGnBHaLtIdXBRearHR3KfZC66p76yiATCHAQ+PwyMsg0tHj3OulVzXuHvIi3MNLYXFk2/O0
 PjFkrky3JvEk9QP9JheQ3h0iJmxbJ93Vfs93sIDpTmpGkrFCT83SnM/ZPC9lv2QPL0yPXBrKds
 GVEgpuwPOFlbbT5XKeSZLINl9zNhz7B7f+m9D0FBa3hoADIvyiZv4ci2u41JqItwRbFD8OuCEz
 zYA=
Subject: Re: [PATCH v9 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs
 entry for touchscreen status
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
 <20200325133334.19346-53-jiada_wang@mentor.com>
 <4aeda6f1-25d8-9437-5cd0-560e43dbe081@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <b9368137-2fdc-558d-c27c-54d56950f7b8@mentor.com>
Date:   Fri, 27 Mar 2020 21:49:14 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4aeda6f1-25d8-9437-5cd0-560e43dbe081@gmail.com>
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

On 2020/03/26 4:35, Dmitry Osipenko wrote:
> 25.03.2020 16:33, Jiada Wang пишет:
>> From: Naveen Chakka <Naveen.Chakka@in.bosch.com>
>>
>> To know the current communication status of the touch controller during
>> runtime, sysfs interface is added
>>
>> sysfs interface: /sys/class/i2c-dev/i2c-*/device/*/touch_dev_stat
>> Executing the above sysfs interface provides two output values
>>
>> 1)Status of the touch device
>> 	value 0 represents device is inactive
>> 	value 1 represents device is active
>> 2)Error counter
>> 	value represents the number of times device in inactive since last read
> 
> ...
>>   /* Each client has this additional data */
>>   struct mxt_data {
>>   	struct i2c_client *client;
>> @@ -372,6 +380,9 @@ struct mxt_data {
>>   	const char *pcfg_name;
>>   	const char *input_name;
>>   	struct mxt_flash *flash;
> 
>> +	struct work_struct watchdog_work;
>> +	struct timer_list watchdog_timer;
> 
> This should be replaced with a delayed_work.

will replace with delayer_work
> 
>> +	struct mxt_statusinfo mxt_status;
>>   
>>   	/* Cached parameters from object table */
>>   	u16 T5_address;
> 
> ...
>> +static void mxt_watchdog_work(struct work_struct *work)
>> +{
>> +	struct mxt_data *data =
>> +		container_of(work, struct mxt_data, watchdog_work);
>> +	u16 info_buf;
>> +	int ret = 0;
>> +	u8 size = 2;
> 
>> +	if (data->suspended || data->in_bootloader)
>> +		return;
>> +
>> +	ret = __mxt_read_reg(data->client, 0, size, &info_buf);
> 
> Looks like this need to be protected with a lock to not race with the
> suspending / bootloader states.
> 
right, I will add lock in next version

>> +	if (ret) {
>> +		data->mxt_status.error_count++;
>> +		data->mxt_status.dev_status = false;
>> +	} else {
>> +		data->mxt_status.dev_status = true;
>> +	}
>> +}
> 
> ...> @@ -4329,6 +4414,13 @@ static int mxt_probe(struct i2c_client
> *client, const struct i2c_device_id *id)
>>   		msleep(MXT_RESET_TIME);
>>   	}
>>   
>> +	INIT_WORK(&data->watchdog_work, mxt_watchdog_work);
>> +
>> +	/* setup watchdog timer */
>> +	timer_setup(&data->watchdog_timer, mxt_watchdog_timer, 0);
>> +
>> +	mxt_start_wd_timer(data);
> 
> I'd expect it to be optional and opt-in by either using #ifdef
> TOUCHSCREEN_ATMEL_MXT_DEBUG or having a new debugfs option to explicitly
> enable the "watchdog".
> 
Thanks for your suggestion, I will use module_param to enable/disable
watchdog

Thanks,
Jiada

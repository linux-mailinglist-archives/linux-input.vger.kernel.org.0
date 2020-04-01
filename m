Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6BF19AC06
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 14:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732252AbgDAMvf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 08:51:35 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:24389 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732166AbgDAMvf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 08:51:35 -0400
IronPort-SDR: jRJISy966l80lm/tAYjztwcpmEcae8GLhKxE/NyMtHPCnOvX34HRn5Afdp4X9txVYhKKszMmZb
 +OJICKt+TYErsSr+SfMvs/r57nJ8KheHGhif0k+mnqMI66xKlfoYWznZ3RqS1sgavfHSomjzoA
 F1VWZCkeBstmh1g3YFZyAPVD/kYz1RmG6aqk5HliKxQqA26lVn5Zf8axqT7FiTKdfqoOtfOBEE
 UFVuGQeggzpeuqGr2dgY+hHd+IbSTrYrZdAREOhj1dfkvYMv/Qgo+5Rj6bFnG2/HiRcimujCQn
 mqI=
X-IronPort-AV: E=Sophos;i="5.72,331,1580803200"; 
   d="scan'208";a="47339772"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 01 Apr 2020 04:51:34 -0800
IronPort-SDR: FH5TaqMIScuQlA4UMm+NWvQaIhpEm+o+vdYX2MNLgbvTrkq3JXWTpFSyg3aHNfg82srUGjm+KE
 mce1WNZIaFNA7TXajzxLK+INC9nX7oxbm2GjMGPRFD+zJv08UOntCTkHIjxXQvYDs462ySG30a
 sVC1bAU77r3fs/Ksk69Jtmio5fmMH4n/o2OI7ERdZo4mpfuIDI9v6ww/ITs5lDE5SE8JONXgfQ
 OtsoOzVJi50XhdotyshISsIfZhMxnvzoyMNzEKbjn9X2e8Hbzo0w1O+d0WFKzhZqfn+ZPbfiyn
 umU=
Subject: Re: [PATCH v10 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs
 entry for touchscreen status
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-53-jiada_wang@mentor.com>
 <63336277-8ed2-a097-a983-6e8ac48d776e@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <1ea292db-d0c3-935e-e74c-7b4afe251edc@mentor.com>
Date:   Wed, 1 Apr 2020 21:51:28 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <63336277-8ed2-a097-a983-6e8ac48d776e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

Thanks for your comments

On 2020/04/01 0:08, Dmitry Osipenko wrote:
> 31.03.2020 13:50, Jiada Wang пишет:
> ...
>> +static void mxt_watchdog_work(struct work_struct *work)
>> +{
>> +	struct mxt_data *data =
>> +		container_of(work, struct mxt_data, watchdog_work.work);
>> +	u16 info_buf;
>> +	int ret;
>> +
>> +	if (data->suspended || data->in_bootloader ||
>> +	    data->mxt_status.intp_triggered)
>> +		goto sched_work;
> 
> Won't it become a problem if other thread puts device into suspended /
> bootloader state in the same time?
> 
right, I will use mutex lock to prevent such case.
also I think data->mxt_status.intp_triggered isn't necessary,
when lock is used.

>> +	ret = __mxt_read_reg(data->client, 0, sizeof(info_buf), &info_buf);
>> +
>> +	if (ret) {
>> +		data->mxt_status.error_count++;
>> +		data->mxt_status.dev_status = false;
>> +	} else {
>> +		data->mxt_status.dev_status = true;
>> +	}
>> +
>> +sched_work:
>> +	schedule_delayed_work(&data->watchdog_work,
>> +			      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
>> +}
> ...
> 
>> @@ -4329,6 +4390,12 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>   		msleep(MXT_RESET_TIME);
>>   	}
>>   
>> +	if (debug_state) {
>> +		INIT_DELAYED_WORK(&data->watchdog_work, mxt_watchdog_work);
>> +		schedule_delayed_work(&data->watchdog_work,
>> +				      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
>> +	}
>> +
>>   	error = mxt_initialize(data);
>>   	if (error)
>>   		goto err_free_object;
>> @@ -4343,6 +4410,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>   	return 0;
>>   
>>   err_free_object:
>> +	if (debug_state)
>> +		cancel_delayed_work_sync(&data->watchdog_work);
>>   	mxt_free_input_device(data);
>>   	mxt_free_object_table(data);
>>   	if (data->reset_gpio) {
>> @@ -4367,6 +4436,9 @@ static int mxt_remove(struct i2c_client *client)
>>   	mxt_free_input_device(data);
>>   	mxt_free_object_table(data);
>>   
>> +	if (debug_state)
>> +		cancel_delayed_work_sync(&data->watchdog_work);
> 
> What will happen if debug_state was false during of mxt_probe() and then
> the debug_state parameter was changed to true via sysfs?

module_param debug_state is added with permission 0,
so it's value won't change during driver operation
> 
> I think the INIT_DELAYED_WORK() and cancel_delayed_work_sync() should be
> invoked unconditionally.
> 
>>   	return 0;
>>   }
>>   
>> @@ -4463,3 +4535,7 @@ module_i2c_driver(mxt_driver);
>>   MODULE_AUTHOR("Joonyoung Shim <jy0922.shim@samsung.com>");
>>   MODULE_DESCRIPTION("Atmel maXTouch Touchscreen driver");
>>   MODULE_LICENSE("GPL");
>> +
>> +module_param(debug_state, bool, 0);
>> +MODULE_PARM_DESC(debug_state, "Enable/Disable watchdog work to check device state (default="
>> +		 __MODULE_STRING(MXT_DEBUG_STATE) ")");
>>
> 
> The "default=..." part of MODULE_PARM_DESC() probably isn't really
> useful and could be omitted, don't you think so?
> 
since debug_state can't be updated via sysfs, so I think add it's 
default in MODULE_PARM_DESC() is useful? what's your opinion?

Thanks,
Jiada

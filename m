Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949B81CCF54
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 04:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbgEKCF5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 May 2020 22:05:57 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:51944 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729075AbgEKCF5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 May 2020 22:05:57 -0400
IronPort-SDR: aaREmatvyLFG1RDNziHAZ5oGgMBvz3oI4gpXxaa2OC9U7qW+lVWO2NxkDHWRBnR1bdy2MVmQoC
 GUcHeiyPcyMaFn25STG9TzDowO4Rdt97Dwt+psavv4Gq7oqAjC38XlYr1D+V0npaLy8zEwkEfD
 /Ob/5sqiYYLN6vBaGJeh/SB8mJ1tutu07vCG+Q8h/36G8eUNkh5qgUC82CjAtPtFj9hPhp4XZE
 X+OK2whN5kBimh7rhVSFZd98Ko4AVtk2fW19oU8dCagxUGZD+FkLpytrnIfCpg3QMWTpKXmmIU
 k5o=
X-IronPort-AV: E=Sophos;i="5.73,378,1583222400"; 
   d="scan'208";a="48704677"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 10 May 2020 18:05:55 -0800
IronPort-SDR: 6e6wRdJxlFS3+1c9zx6KqiiHZhYtgREtRJaDj2vKeBTLZWt+zuV09ogggmkvShy6nNhFivi6f3
 z4nS0H8Mxm3PfG6FF8+GHwMlrr9jXLaGHWTAErE5QCOPz1ASgRG2yGkkPuy+P+QcjNk8UuLtiv
 lzkjOyW2YD293FdZkrpNctocuHvqPi/pXW0E6DpwxYGzEqaItUmSDTVSWPlOZZ/dXiyMfzBCcE
 eXtch0GLhBgiYxzG5+7TqvmWojsqHzoCzr6clsktQNEaESe2kspUuPLHUgECw3UBJ1hcgcUgA3
 MxM=
Subject: Re: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-34-jiada_wang@mentor.com>
 <3a942afa-c047-2c88-1c8e-a90fa018738e@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <6af23ae6-2f1c-0459-d2b6-1b01ddb0c3dc@mentor.com>
Date:   Mon, 11 May 2020 11:05:33 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3a942afa-c047-2c88-1c8e-a90fa018738e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

Thanks for your comment and test,

can you let me know which platform (board) you are using for test,
and DTS changes if you have added any.

Thanks,
Jiada

On 2020/05/11 10:05, Dmitry Osipenko wrote:
> 08.05.2020 08:56, Jiada Wang пишет:
>> The path of enabling the IRQ in the probe function is not safe in level
>> triggered operation, if it was already powered up and there is a message
>> waiting on the device (eg finger down) because the object table has not yet
>> been read. This forces the ISR into a hard loop.
>>
>> Delay enabling the interrupt until it is first needed, by set flag
>> IRQ_NOAUTOEN.
>>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> CC: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index 7c9a738e633a..ab4eceac8fe7 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -3822,6 +3822,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>   		return error;
>>   	}
>>   
>> +	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
>>   	error = devm_request_threaded_irq(&client->dev, client->irq,
>>   					  NULL, mxt_interrupt, IRQF_ONESHOT,
>>   					  client->name, data);
>> @@ -3831,17 +3832,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>   	}
>>   
>>   	if (data->suspend_mode == MXT_SUSPEND_REGULATOR) {
>> +		enable_irq(data->irq);
> 
> Hello Jiada,
> 
> This change contradicts to the commit's message since enabling IRQ until
> hardware has been fully powered-on and reset is not allowed.
> 
>>   		error = mxt_probe_regulators(data);
>>   		if (error)
>>   			return error;
>> +
>> +		disable_irq(data->irq);
>>   	} else if (data->reset_gpio) {
>>   		msleep(MXT_RESET_GPIO_TIME);
>>   		gpiod_set_value(data->reset_gpio, 1);
>>   		msleep(MXT_RESET_INVALID_CHG);
>>   	}
>>   
>> -	disable_irq(data->irq);
>> -
>>   	error = mxt_initialize(data);
>>   	if (error)
>>   		return error;
>>
> 
> Secondly, I gave a try to this version of the series and unfortunately
> it doesn't work at all:
> 
> [  125.928709] INFO: task systemd-udevd:184 blocked for more than 61
> seconds.
> [  125.929130]       Not tainted
> 5.7.0-rc4-next-20200508-00189-g0fe7f91d4a66-dirty #2206
> [  125.929474] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  125.929900] systemd-udevd   D    0   184    173 0x00000080
> [  125.929921] [<c098b995>] (__schedule) from [<c098bdc1>]
> (schedule+0x65/0xc0)
> [  125.929965] [<c098bdc1>] (schedule) from [<c0166ce3>]
> (synchronize_irq+0x5b/0x7c)
> [  125.930001] [<c0166ce3>] (synchronize_irq) from [<c067e0f9>]
> (mxt_stop+0x51/0xe0)
> [  125.930016] [<c067e0f9>] (mxt_stop) from [<c067e1d3>]
> (mxt_input_close+0x13/0x34)
> [  125.930042] [<c067e1d3>] (mxt_input_close) from [<c0664b19>]
> (input_close_device+0x3d/0x5c)
> [  125.930063] [<c0664b19>] (input_close_device) from [<c066b9df>]
> (evdev_release+0xa7/0xbc)
> [  125.930088] [<c066b9df>] (evdev_release) from [<c025a871>]
> (__fput+0x91/0x198)
> [  125.930121] [<c025a871>] (__fput) from [<c0136efb>]
> (task_work_run+0x73/0x90)
> [  125.930138] [<c0136efb>] (task_work_run) from [<c0108fa9>]
> (do_work_pending+0x381/0x430)
> [  125.930149] [<c0108fa9>] (do_work_pending) from [<c01000d1>]
> (slow_work_pending+0x9/0x18)
> [  125.930153] Exception stack(0xedd0ffb0 to 0xedd0fff8)
> 
> Please test everything properly and fix it in the next version.
> 
> BTW, it won't hurt to apply a spell-checker to the commit messages to
> fix small typos.
> 

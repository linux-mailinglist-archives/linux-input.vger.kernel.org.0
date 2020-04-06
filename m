Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1C2619F085
	for <lists+linux-input@lfdr.de>; Mon,  6 Apr 2020 08:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgDFG7c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Apr 2020 02:59:32 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:34655 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgDFG7c (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Apr 2020 02:59:32 -0400
IronPort-SDR: f0n79POK3s4uHmSLl+2AhmPr0N7/KMklsfoF5yH41uxRlVjTxftwnz2waRrIHHWn1sqmRFH+ju
 kCBcZ0axiz4x9R1VhLAJ3WJqZN0UFZQdUust/VgrF1Pxiv6UivyVBwISMR240CslpMOoicS9Yg
 xa4UmPFCxu+uHAYGoKo5MXn3NQk8CDHSMzMoh+AqNlyEdvaYa8jImcfdg+IQiFvmGWAJH9GqHF
 rfm51mwD1YRGDfU4+jUFTMlOLqz77KSqzRRldMfMQsTfpuOHgcULVv9ZENsZbdslDZriaFjdSL
 bnE=
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; 
   d="scan'208";a="47520272"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 05 Apr 2020 22:59:31 -0800
IronPort-SDR: A1tlaH5yuY+bCu7Rj7I7TmWSTBve+cI+tattIeO+YHRGJRfuwaHXXXGJMv3PNxpjddbzWpmtCh
 P2mqYM1aBONusGs2QoiBAiCxM1JdAwuntI/RkRljQRFipj5j+aC8nt3quTeg91bMOoPKItmRG1
 g24TfEBTy7XbETBC5WCbI8vgS0sW7JHAltQ7Y0/26viYKpZQX24eoe6vufOB2HplYsJEhAfbeu
 2nzBi8iaHy/uUHMBPraM5kUjpks7nrH88IsuzXucTtZ9Me0k1nv5TIQYB1k8fKm4XCEDEJ8vLB
 bOM=
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
 <1ea292db-d0c3-935e-e74c-7b4afe251edc@mentor.com>
 <4dd3fa36-6ea7-1d5a-e675-a1a7066207b4@gmail.com>
 <e4c9623c-9ee9-90f9-8251-c36443352072@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <812005d3-0147-bbae-c15e-c2453e510e53@mentor.com>
Date:   Mon, 6 Apr 2020 15:59:25 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e4c9623c-9ee9-90f9-8251-c36443352072@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/04/02 1:10, Dmitry Osipenko wrote:
> 01.04.2020 17:33, Dmitry Osipenko пишет:
>> 01.04.2020 15:51, Wang, Jiada пишет:
>>> Hi Dmitry
>>>
>>> Thanks for your comments
>>>
>>> On 2020/04/01 0:08, Dmitry Osipenko wrote:
>>>> 31.03.2020 13:50, Jiada Wang пишет:
>>>> ...
>>>>> +static void mxt_watchdog_work(struct work_struct *work)
>>>>> +{
>>>>> +    struct mxt_data *data =
>>>>> +        container_of(work, struct mxt_data, watchdog_work.work);
>>>>> +    u16 info_buf;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (data->suspended || data->in_bootloader ||
>>>>> +        data->mxt_status.intp_triggered)
>>>>> +        goto sched_work;
>>>>
>>>> Won't it become a problem if other thread puts device into suspended /
>>>> bootloader state in the same time?
>>>>
>>> right, I will use mutex lock to prevent such case.
>>> also I think data->mxt_status.intp_triggered isn't necessary,
>>> when lock is used.
> 
> Won't it be cleaner to stop/start the watchdog instead of messing with
> the locks?
> 
will stop/start watchdog work when necessary in next version

Thanks,
Jiada
>>>>> +    ret = __mxt_read_reg(data->client, 0, sizeof(info_buf), &info_buf);
>>>>> +
>>>>> +    if (ret) {
>>>>> +        data->mxt_status.error_count++;
>>>>> +        data->mxt_status.dev_status = false;
>>>>> +    } else {
>>>>> +        data->mxt_status.dev_status = true;
>>>>> +    }
>>>>> +
>>>>> +sched_work:
>>>>> +    schedule_delayed_work(&data->watchdog_work,
>>>>> +                  msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
>>>>> +}
>>>> ...
>>>>
>>>>> @@ -4329,6 +4390,12 @@ static int mxt_probe(struct i2c_client
>>>>> *client, const struct i2c_device_id *id)
>>>>>            msleep(MXT_RESET_TIME);
>>>>>        }
>>>>>    +    if (debug_state) {
>>>>> +        INIT_DELAYED_WORK(&data->watchdog_work, mxt_watchdog_work);
>>>>> +        schedule_delayed_work(&data->watchdog_work,
>>>>> +                      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
>>>>> +    }
>>>>> +
>>>>>        error = mxt_initialize(data);
>>>>>        if (error)
>>>>>            goto err_free_object;
>>>>> @@ -4343,6 +4410,8 @@ static int mxt_probe(struct i2c_client *client,
>>>>> const struct i2c_device_id *id)
>>>>>        return 0;
>>>>>      err_free_object:
>>>>> +    if (debug_state)
>>>>> +        cancel_delayed_work_sync(&data->watchdog_work);
>>>>>        mxt_free_input_device(data);
>>>>>        mxt_free_object_table(data);
>>>>>        if (data->reset_gpio) {
>>>>> @@ -4367,6 +4436,9 @@ static int mxt_remove(struct i2c_client *client)
>>>>>        mxt_free_input_device(data);
>>>>>        mxt_free_object_table(data);
>>>>>    +    if (debug_state)
>>>>> +        cancel_delayed_work_sync(&data->watchdog_work);
>>>>
>>>> What will happen if debug_state was false during of mxt_probe() and then
>>>> the debug_state parameter was changed to true via sysfs?
>>>
>>> module_param debug_state is added with permission 0,
>>> so it's value won't change during driver operation
>>
>> Thank you for the clarification, I didn't realize that setting
>> permission to 0 hides the parameter completely in sysfs.
> 
> Anyways, I'm still thinking that the condition removal will make code
> cleaner a tad.
> 

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC115E5FCD
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 12:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbiIVKX4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 06:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbiIVKXt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 06:23:49 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3C5D8250
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 03:23:47 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYB946RMqzlXT6;
        Thu, 22 Sep 2022 18:19:36 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 18:23:45 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 18:23:44 +0800
Subject: Re: [PATCH -next 1/5] Input: da7280 - Switch to use dev_err_probe()
 helper
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        <linux-input@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>
References: <20220920153656.3486879-1-yangyingliang@huawei.com>
 <87v8pfg5bm.fsf@baylibre.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <468abf76-2049-695f-c3f3-710bc779d806@huawei.com>
Date:   Thu, 22 Sep 2022 18:23:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87v8pfg5bm.fsf@baylibre.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mattijs,

On 2022/9/22 16:51, Mattijs Korpershoek wrote:
> Hi Yang,
>
> Thank you for your series,
>
> On Tue, Sep 20, 2022 at 23:36, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER and prints the
>> error name. It also sets the defer probe reason which can be
>> checked later through debugfs.
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/input/misc/da7280.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
>> index b08610d6e575..b1ca4fd94e9e 100644
>> --- a/drivers/input/misc/da7280.c
>> +++ b/drivers/input/misc/da7280.c
>> @@ -1166,12 +1166,9 @@ static int da7280_probe(struct i2c_client *client,
>>   	if (haptics->const_op_mode == DA7280_PWM_MODE) {
>>   		haptics->pwm_dev = devm_pwm_get(dev, NULL);
>>   		error = PTR_ERR_OR_ZERO(haptics->pwm_dev);
>> -		if (error) {
>> -			if (error != -EPROBE_DEFER)
>> -				dev_err(dev, "Unable to request PWM: %d\n",
>> -					error);
>> -			return error;
>> -		}
>> +		if (error)
>> +			return dev_err_probe(dev, error,
>> +					     "Unable to request PWM\n");
> For the whole series:
>
> If we look at the input tree, we can see that there is no occurence of
> dev_err_probe():
>
> $ ~/src/linux/drivers/input/ 483fed3b5dc8 grep -rsn dev_err_probe
> $ ~/src/linux/drivers/input/ 483fed3b5dc8
>
> The reason for this is that the input maintainer (Dmitry) dislikes
> dev_err_probe() as he stated in [1]
>
> So I don't think he will apply this.

OK, thanks for replying and mentioning it.

>
> Regards,
> Mattijs
>
> [1] https://lore.kernel.org/r/YWTpg35wyYS1uoFZ@google.com
>
>>   		/* Sync up PWM state and ensure it is off. */
>>   		pwm_init_state(haptics->pwm_dev, &state);
>> -- 
>> 2.25.1
> .

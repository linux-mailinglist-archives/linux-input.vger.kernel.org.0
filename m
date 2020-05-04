Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242531C3626
	for <lists+linux-input@lfdr.de>; Mon,  4 May 2020 11:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbgEDJvv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 May 2020 05:51:51 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:33978 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728166AbgEDJvv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 May 2020 05:51:51 -0400
Received: from [192.168.178.106] (pD95EF30E.dip0.t-ipconnect.de [217.94.243.14])
        by mail.bugwerft.de (Postfix) with ESMTPSA id D237C403BFA;
        Mon,  4 May 2020 09:49:09 +0000 (UTC)
Subject: Re: [PATCH] input: touch: ads7846: switch to devm initialization
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        kstewart@linuxfoundation.org
References: <20200430175323.187870-1-daniel@zonque.org>
 <20200504073416.l3gpwumjss24jlzu@pengutronix.de>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <363fb36e-33ea-3785-c8d2-300b7452582f@zonque.org>
Date:   Mon, 4 May 2020 11:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504073416.l3gpwumjss24jlzu@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

On 5/4/20 9:34 AM, Marco Felsch wrote:
> thanks for your patch :)
> 
> On 20-04-30 19:53, Daniel Mack wrote:
>> This simplies the code a lot and fixes some potential resource leaks in
>> the error return paths. It also ensures the input device is registered
>> before the interrupt is requested, as the IRQ handler will commit events
>> when it fires.
> 
> Why is it necessary to get those events during probe()? Pls, see also my
> inline comments.

My concern was that the IRQ handler starts firing as soon as the
interrupt is requested. I however just learned that this is not a
problem though. So I'll drop that change to keep the patch smaller.
Thanks for noting!

>> ---
>>  drivers/input/touchscreen/ads7846.c | 137 +++++++++-------------------
>>  1 file changed, 45 insertions(+), 92 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
>> index 8fd7fc39c4fd..acf736f5ddab 100644
>> --- a/drivers/input/touchscreen/ads7846.c
>> +++ b/drivers/input/touchscreen/ads7846.c
>> @@ -528,30 +528,19 @@ static int ads784x_hwmon_register(struct spi_device *spi, struct ads7846 *ts)
>>  		break;
>>  	}
>>  
>> -	ts->hwmon = hwmon_device_register_with_groups(&spi->dev, spi->modalias,
>> -						      ts, ads7846_attr_groups);
>> +	ts->hwmon = devm_hwmon_device_register_with_groups(&spi->dev,
>> +							   spi->modalias, ts,
>> +							   ads7846_attr_groups);
> 
> We don't need the hwmon member anymore if we are switching to the devres
> intializer. Pls, can you drop it completely?

Right. Will drop it.

>>  static ssize_t ads7846_pen_down_show(struct device *dev,
>> @@ -944,8 +933,8 @@ static int ads7846_setup_pendown(struct spi_device *spi,
>>  		ts->get_pendown_state = pdata->get_pendown_state;
>>  	} else if (gpio_is_valid(pdata->gpio_pendown)) {
>>  
>> -		err = gpio_request_one(pdata->gpio_pendown, GPIOF_IN,
>> -				       "ads7846_pendown");
>> +		err = devm_gpio_request_one(&spi->dev, pdata->gpio_pendown,
>> +					    GPIOF_IN, "ads7846_pendown");
> 
> I see that you want to keep the changes minimal and I'm fine with this
> but we should considering to move the driver to gpio_desc.

Yes, we should. But I'll keep that out of this patch set.

>> +	ts = devm_kzalloc(dev, sizeof(struct ads7846), GFP_KERNEL);
>> +	packet = devm_kzalloc(dev, sizeof(struct ads7846_packet), GFP_KERNEL);
>> +	input_dev = devm_input_allocate_device(dev);
>> +	if (!ts || !packet || !input_dev)
>> +		return -ENOMEM;
> 
> Pls, can we split that so each alloc get its own error check?

Okay.

>>  	input_dev->name = ts->name;
>>  	input_dev->phys = ts->phys;
>> -	input_dev->dev.parent = &spi->dev;
>> +	input_dev->dev.parent = dev;
> 
> I would split the dev usage into another patch since it is unrelated to
> the change you wanna make and keeps the diff smaller.

Agreed.

>> +	err = input_register_device(input_dev);
>> +	if (err)
>> +		goto err_cleanup_filter;
> 
> It seems quite common to register the device on the end.

Yes, as stated above. Reverted that change in ordering.

>>  	err = regulator_enable(ts->reg);
>>  	if (err) {
>> -		dev_err(&spi->dev, "unable to enable regulator: %d\n", err);
>> -		goto err_put_regulator;
>> +		dev_err(dev, "unable to enable regulator: %d\n", err);
>> +		goto err_cleanup_filter;
>>  	}
> 
> From now on the regulator is on an keeps on since you never turn it of.
> So you need to add a devm_add_action_or_reset() here.

Good point. Added.

Will send a v2 soon. Thanks for the review!


Daniel

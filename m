Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 965F6175B79
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 14:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgCBNXk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 08:23:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21759 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727361AbgCBNXk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 08:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583155418;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DlEbZXLtMt9M8NhjOsxxiqF1qQVh+Jm+dmpzZ8+ImJs=;
        b=Eu/SMUl00S+ZWM61OR73E9jtgP/b+z3Vvf9Q+0MUr1o13QXiXklGxwSueEac+awoCsneLn
        frJm+cf76ce107U3s1VksZ19qQMRi7ZBV+QvCyRkr2enFbSR4JUA7ScKdId+AkbjUunKgN
        3JtD1LYxSiFDiWXedZNUIePGf7k169g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-SDcC-luBNDemx20cmd84VA-1; Mon, 02 Mar 2020 08:23:34 -0500
X-MC-Unique: SDcC-luBNDemx20cmd84VA-1
Received: by mail-wr1-f70.google.com with SMTP id q18so352474wrw.5
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 05:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DlEbZXLtMt9M8NhjOsxxiqF1qQVh+Jm+dmpzZ8+ImJs=;
        b=WBpLOg3iusi4O+3uV3TX/shi/GGUTBFcgc2PLEZa1fTFyINWX6IlbaWL9lYCNNQI42
         XvGuNGP7VlvlDfAusyyDjbvUWUXtC0o8jceUbeYFbRbf5B1Ix1O9VDM9cW04FXnuBFVf
         qz0smaqDKsY84r6ZJGA1YCfG6FBW3ZbmOMFxTFNklbm/H1mTbdq+WZx4T3w1g1L30Hdt
         Cs9Sx/E4xgfIVyauzzn6o3WEjcCb5tShmMAuWgHSa8xp8ppNzPYhh37Xf34tuMjZKBqL
         PhRMQOt10XZZhooClAwzT18haySuWXWC4otXc2bsofDphbiat/G837Heek4YtB/rqQHP
         YT+A==
X-Gm-Message-State: APjAAAU8sUwfLtM950jU7eEym+PpnFr3CcU2P8dbdzY72KWLsfPU5QDY
        jv7y9B4DQeiE5LYocwEe7n8EG8NcRk9n45REt3mTDFioBRwkaYbtOK9Q7rL5/N48Ca9M2sYzETP
        4gczriwuMemGWRgdYv/fyd9I=
X-Received: by 2002:a5d:6086:: with SMTP id w6mr22034172wrt.224.1583155412690;
        Mon, 02 Mar 2020 05:23:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzcXLOtmW9tm3Cja0n2rW2KxScCZgHfEfBLHM6sbvedB6Fv/BcblM8OcVijT2077tc9Zq6GQA==
X-Received: by 2002:a5d:6086:: with SMTP id w6mr22034105wrt.224.1583155411443;
        Mon, 02 Mar 2020 05:23:31 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id t83sm8847690wmf.43.2020.03.02.05.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 05:23:30 -0800 (PST)
Subject: Re: [PATCH resend 01/10] Input: goodix - Refactor IRQ pin GPIO
 accesses
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
 <1c57e9d567af8041fb8aff94d4095af0ff8b4484.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fa381456-f53b-ed05-feb6-d860eabf9519@redhat.com>
Date:   Mon, 2 Mar 2020 14:23:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1c57e9d567af8041fb8aff94d4095af0ff8b4484.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/2/20 12:09 PM, Bastien Nocera wrote:
> On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
>> Suspending Goodix touchscreens requires changing the interrupt pin to
>> output before sending them a power-down command. Followed by wiggling
>> the interrupt pin to wake the device up, after which it is put back
>> in input mode.
>>
>> So far we have only effectively supported this on devices which use
>> devicetree. On X86 ACPI platforms both looking up the pins; and using
>> a
>> pin as both IRQ and GPIO is a bit more complicated. E.g. on some
>> devices
>> we cannot directly access the IRQ pin as GPIO and we need to call
>> ACPI
>> methods to control it instead.
>>
>> This commit adds a new irq_pin_access_method field to the
>> goodix_chip_data
>> struct and adds goodix_irq_direction_output and
>> goodix_irq_direction_input
>> helpers which together abstract the GPIO accesses to the IRQ pin.
>>
>> This is a preparation patch for adding support for properly
>> suspending the
>> touchscreen on X86 ACPI platforms.
>>
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
>> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
>> Cc: Dmitry Mastykin <mastichi@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/input/touchscreen/goodix.c | 62 ++++++++++++++++++++++++--
>> ----
>>   1 file changed, 51 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c
>> b/drivers/input/touchscreen/goodix.c
>> index 0403102e807e..08806a00a9b9 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -31,6 +31,11 @@
>>   
>>   struct goodix_ts_data;
>>   
>> +enum goodix_irq_pin_access_method {
>> +	irq_pin_access_none,
>> +	irq_pin_access_gpio,
> 
> I don't know if that matches the kernel coding style, but I'd rather
> the enum member names were upper-case, and typedef'ed.

I checked and most of the kernel also uses upper-case for
enum member names, I'll fix this (for the entire series) for
v2 of the series.

As for using typedef-s that is typically not done in the kernel
for enums / structs so I'm going to keep that as is.


> 
>> +};
>> +
>>   struct goodix_chip_data {
>>   	u16 config_addr;
>>   	int config_len;
>> @@ -53,6 +58,7 @@ struct goodix_ts_data {
>>   	const char *cfg_name;
>>   	struct completion firmware_loading_complete;
>>   	unsigned long irq_flags;
>> +	enum goodix_irq_pin_access_method irq_pin_access_method;
>>   	unsigned int contact_size;
>>   };
>>   
>> @@ -502,17 +508,48 @@ static int goodix_send_cfg(struct
>> goodix_ts_data *ts,
>>   	return 0;
>>   }
>>   
>> +static int goodix_irq_direction_output(struct goodix_ts_data *ts,
>> +				       int value)
>> +{
>> +	switch (ts->irq_pin_access_method) {
>> +	case irq_pin_access_none:
>> +		dev_err(&ts->client->dev,
>> +			"%s called without an irq_pin_access_method
>> set\n",
>> +			__func__);
>> +		return -EINVAL;
>> +	case irq_pin_access_gpio:
>> +		return gpiod_direction_output(ts->gpiod_int, value);
> 
> Is that going to complain about default not being handled? If so, an if
> conditional might be enough.

All the values in the enum are handled so there is no need for a default
label. As for changing this to an if, later patches add more values
to the enum and to the switch-case, having this as a switch-case from
the start makes the diff in later patches smaller.

> 
>> +	}
>> +
>> +	return -EINVAL; /* Never reached */
>> +}
>> +
>> +static int goodix_irq_direction_input(struct goodix_ts_data *ts)
>> +{
>> +	switch (ts->irq_pin_access_method) {
>> +	case irq_pin_access_none:
>> +		dev_err(&ts->client->dev,
>> +			"%s called without an irq_pin_access_method
>> set\n",
>> +			__func__);
>> +		return -EINVAL;
>> +	case irq_pin_access_gpio:
>> +		return gpiod_direction_input(ts->gpiod_int);
> 
> Ditto.

Ditto.

> Looks fine otherwise.

Thank you for the review.

Regards,

Hans



> 
> 
>> +	}
>> +
>> +	return -EINVAL; /* Never reached */
>> +}
>> +
>>   static int goodix_int_sync(struct goodix_ts_data *ts)
>>   {
>>   	int error;
>>   
>> -	error = gpiod_direction_output(ts->gpiod_int, 0);
>> +	error = goodix_irq_direction_output(ts, 0);
>>   	if (error)
>>   		return error;
>>   
>>   	msleep(50);				/* T5: 50ms */
>>   
>> -	error = gpiod_direction_input(ts->gpiod_int);
>> +	error = goodix_irq_direction_input(ts);
>>   	if (error)
>>   		return error;
>>   
>> @@ -536,7 +573,7 @@ static int goodix_reset(struct goodix_ts_data
>> *ts)
>>   	msleep(20);				/* T2: > 10ms */
>>   
>>   	/* HIGH: 0x28/0x29, LOW: 0xBA/0xBB */
>> -	error = gpiod_direction_output(ts->gpiod_int, ts->client->addr
>> == 0x14);
>> +	error = goodix_irq_direction_output(ts, ts->client->addr ==
>> 0x14);
>>   	if (error)
>>   		return error;
>>   
>> @@ -617,6 +654,9 @@ static int goodix_get_gpio_config(struct
>> goodix_ts_data *ts)
>>   
>>   	ts->gpiod_rst = gpiod;
>>   
>> +	if (ts->gpiod_int && ts->gpiod_rst)
>> +		ts->irq_pin_access_method = irq_pin_access_gpio;
>> +
>>   	return 0;
>>   }
>>   
>> @@ -889,7 +929,7 @@ static int goodix_ts_probe(struct i2c_client
>> *client,
>>   	if (error)
>>   		return error;
>>   
>> -	if (ts->gpiod_int && ts->gpiod_rst) {
>> +	if (ts->irq_pin_access_method == irq_pin_access_gpio) {
>>   		/* reset the controller */
>>   		error = goodix_reset(ts);
>>   		if (error) {
>> @@ -912,7 +952,7 @@ static int goodix_ts_probe(struct i2c_client
>> *client,
>>   
>>   	ts->chip = goodix_get_chip_data(ts->id);
>>   
>> -	if (ts->gpiod_int && ts->gpiod_rst) {
>> +	if (ts->irq_pin_access_method == irq_pin_access_gpio) {
>>   		/* update device config */
>>   		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
>>   					      "goodix_%d_cfg.bin", ts-
>>> id);
>> @@ -943,7 +983,7 @@ static int goodix_ts_remove(struct i2c_client
>> *client)
>>   {
>>   	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>>   
>> -	if (ts->gpiod_int && ts->gpiod_rst)
>> +	if (ts->irq_pin_access_method == irq_pin_access_gpio)
>>   		wait_for_completion(&ts->firmware_loading_complete);
>>   
>>   	return 0;
>> @@ -956,7 +996,7 @@ static int __maybe_unused goodix_suspend(struct
>> device *dev)
>>   	int error;
>>   
>>   	/* We need gpio pins to suspend/resume */
>> -	if (!ts->gpiod_int || !ts->gpiod_rst) {
>> +	if (ts->irq_pin_access_method == irq_pin_access_none) {
>>   		disable_irq(client->irq);
>>   		return 0;
>>   	}
>> @@ -967,7 +1007,7 @@ static int __maybe_unused goodix_suspend(struct
>> device *dev)
>>   	goodix_free_irq(ts);
>>   
>>   	/* Output LOW on the INT pin for 5 ms */
>> -	error = gpiod_direction_output(ts->gpiod_int, 0);
>> +	error = goodix_irq_direction_output(ts, 0);
>>   	if (error) {
>>   		goodix_request_irq(ts);
>>   		return error;
>> @@ -979,7 +1019,7 @@ static int __maybe_unused goodix_suspend(struct
>> device *dev)
>>   				    GOODIX_CMD_SCREEN_OFF);
>>   	if (error) {
>>   		dev_err(&ts->client->dev, "Screen off command
>> failed\n");
>> -		gpiod_direction_input(ts->gpiod_int);
>> +		goodix_irq_direction_input(ts);
>>   		goodix_request_irq(ts);
>>   		return -EAGAIN;
>>   	}
>> @@ -999,7 +1039,7 @@ static int __maybe_unused goodix_resume(struct
>> device *dev)
>>   	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>>   	int error;
>>   
>> -	if (!ts->gpiod_int || !ts->gpiod_rst) {
>> +	if (ts->irq_pin_access_method == irq_pin_access_none) {
>>   		enable_irq(client->irq);
>>   		return 0;
>>   	}
>> @@ -1008,7 +1048,7 @@ static int __maybe_unused goodix_resume(struct
>> device *dev)
>>   	 * Exit sleep mode by outputting HIGH level to INT pin
>>   	 * for 2ms~5ms.
>>   	 */
>> -	error = gpiod_direction_output(ts->gpiod_int, 1);
>> +	error = goodix_irq_direction_output(ts, 1);
>>   	if (error)
>>   		return error;
>>   
> 


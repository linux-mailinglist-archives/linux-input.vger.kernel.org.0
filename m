Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3817F192A86
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbgCYNz4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:55:56 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:41747 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727277AbgCYNzz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585144553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xDstPSipOMUudtaYQpWfwkduPt3X8LuZd7RA1XdiirA=;
        b=JBxJmlDdSVRKFOV+LT69C3a2a5HfdngVnmBOHDnnoOPaQ3dS+k3VX21nDcnSZURAaI5z6B
        86od3f7T/gIyZNcgkIgGd0GihghqEYASvt8CN4y9RC5CGTD3Z/9Wm/qtHVWPTZPUKuhPxP
        AmLfb49RipbUC4q69YSjifVpCEDqXnM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-rWTbjeAHNy6BxRA0eOYNfw-1; Wed, 25 Mar 2020 09:55:50 -0400
X-MC-Unique: rWTbjeAHNy6BxRA0eOYNfw-1
Received: by mail-wr1-f72.google.com with SMTP id m15so1197686wrb.0
        for <linux-input@vger.kernel.org>; Wed, 25 Mar 2020 06:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xDstPSipOMUudtaYQpWfwkduPt3X8LuZd7RA1XdiirA=;
        b=Gk/MnkO2pxrEbGDeCbe2ETGuxX3fNYPPWZWj+0Xxl0iXVjCypNNUTsRoGy2Zaz/rPM
         XNYGQ8p+B1QrWvaS+6sdwQq9+stInwv+Lqs4Qc3WKsogr3iVHdD24+F5z5+0ropeapvZ
         DaydTYxNsy4OhhxqT6LcKtc5ORCY1r9Wr2LJmkiXetE26W6BAsLJm8PHprThNPZFv43G
         VIH/v25jxioJxEqlH8870lQt88fp4W3jXTSDEviXc0RJQgdg0Fz/JeXMtt+sqwOSNAcN
         KU3pQ31bw+D+Tcm9NNHblV28XA00H+av1dh+4bf3tg565Qcuzo+G49wD47saV3UEpBm0
         czxQ==
X-Gm-Message-State: ANhLgQ1affVS8crJ6kaEFqLkj3oyGl0OsDtXMWGYr7Ryhk6hM8Hgz9jR
        YL2QjRiQvCxJS4F9yuR/RpkZZRDU6buwhe16P1DziuMxXh3mPgAcay5tCOuCPQi9ReY2e9Lf1cz
        PyRzle7MzkogZlngmOlcOzUw=
X-Received: by 2002:adf:f042:: with SMTP id t2mr3760977wro.255.1585144548577;
        Wed, 25 Mar 2020 06:55:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsg49BFabLkpfsb/9KRceC/P4N3hxHepiAIbHUZCsS6BkRcXvk/l4MqV0fkDOe6UCD1HGz5Yw==
X-Received: by 2002:adf:f042:: with SMTP id t2mr3760947wro.255.1585144548251;
        Wed, 25 Mar 2020 06:55:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id l8sm9286029wmj.2.2020.03.25.06.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 06:55:47 -0700 (PDT)
Subject: Re: [PATCH] Input: goodix - Fix compilation when ACPI support is
 disabled
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kbuild test robot <lkp@intel.com>
References: <20200325103348.108792-1-hdegoede@redhat.com>
 <9f4df3fdc54448728582ea35f4d3a08411f6aba5.camel@hadess.net>
 <6611fe58-8e3d-d443-9dd1-6ed9086fa752@redhat.com>
 <1db6a35732a2c191ff56043f1ae357d8ae1b5b10.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5aca9fe9-3751-f0f6-9851-5d9a0c048388@redhat.com>
Date:   Wed, 25 Mar 2020 14:55:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1db6a35732a2c191ff56043f1ae357d8ae1b5b10.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/25/20 1:11 PM, Bastien Nocera wrote:
> On Wed, 2020-03-25 at 12:49 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 3/25/20 11:47 AM, Bastien Nocera wrote:
>>> On Wed, 2020-03-25 at 11:33 +0100, Hans de Goede wrote:
>>>> acpi_execute_simple_method() is not part of the group of ACPI
>>>
>>> Could we not stub acpi_execute_simple_method() either in acpi.h or
>>> in
>>> this driver, and make it return -EINVAL?
>>
>> We have 2 troublesome calls:
>>
>> acpi_execute_simple_method() in goodix_irq_direction_output()
>> acpi_evaluate_object() in goodix_irq_direction_input()
>>
>> The second one was not in the build-bot output because the
>> build-bot never got around to linking and its prototype is
>> brought in even when CONFIG_ACPI is not set.
>>
>> This also immediately introduces a problem with adding
>> a stub for this one. We cannot have a static stub in
>> goodix.c for it because that will trigger warnings after
>> include/acpi/acpixf.h first having it declared public.
>>
>> We could add a non static stub, but that just feels wrong.
>>
>> Doing a static inline stub in include/linux/acpi.h also is
>> not possible for the same reason.  That would leave adding
>> #ifdef with a stub to include/acpi/acpixf.h, but that is
>> not going to fly either because the headers under include/acpi
>> are part of the ACPICA project:
>> https://github.com/acpica/acpica
>>
>> Which is OS independent and the kernel syncs the files from
>> it once each cycle, so we cannot make Linux specific changes
>> to those headers.
> 
> And we can't do something like that?
> 
> static acpi_status
> goodix_acpi_execute_simple_method (...)
> {
> #ifdef whatever
>    return acpi_execute_simple_method(....);
> #else
>    return -EINVAL;
> #endif
> }

We could do something like that, but TBH I'm not a fan of that
adding extra wrappers makes it harder to see what the code is
actually doing.

I understand your dislike for the extra braces I added and
I'm fine with fixing that by adding __maybe_unused to the
variable declarations at the top. I don't really see what
the problem with the #ifdef-s is given how clean they are,
with the braces thing fixed by using __maybe_unused things
would look like e.g. this:

	switch (ts->irq_pin_access_method) {
	case IRQ_PIN_ACCESS_NONE:
		dev_err(&ts->client->dev,
			"%s called without an irq_pin_access_method set\n",
			__func__);
		return -EINVAL;
	case IRQ_PIN_ACCESS_GPIO:
		return gpiod_direction_input(ts->gpiod_int);
#if defined CONFIG_X86 && defined CONFIG_ACPI
	case IRQ_PIN_ACCESS_ACPI_GPIO:
		return gpiod_direction_input(ts->gpiod_int);
	case IRQ_PIN_ACCESS_ACPI_METHOD:
		status = acpi_evaluate_object(ACPI_HANDLE(dev), "INTI",
					      NULL, NULL);
		return ACPI_SUCCESS(status) ? 0 : -EIO;
#endif
	}

IMHO that looks just fine, it is not as if the #if makes it really
hard to read things and / or if there are all sort of weird
constructs necessary to make things work with the #if.

Regards,

Hans



> 
> 
>> So all in all I believe that #ifdef is the best solution.
>>
>> Also note that all the #ifdef-s are in switch-case and cover
>> whole cases, so they are pretty clean IMHO.
>>
>> As for the braces, alternatively we could keep the variables
>> at the top of the goodix_irq_direction_[in|out]put functions
>> and mark the as __maybe_unused, then the extra braces this
>> change introduces goes away.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> There's already a stub to avoid those 2 access methods from being
>>> used,
>>> and I'd prefer a little more code to more ifdef-spaghetti, or
>>> awkwardly
>>> placed curly braces.
>>>
>>>> related functions which get stubbed by include/linux/acpi.h
>>>> when ACPI support is disabled, so the IRQ_PIN_ACCESS_ACPI_METHOD
>>>> handling code must be disabled through an #ifdef when ACPI
>>>> support
>>>> is not enabled.
>>>>
>>>> For consistency also #ifdef out the IRQ_PIN_ACCESS_ACPI_GPIO code
>>>> and use the same #if condition as which is used to replace
>>>> goodix_add_acpi_gpio_mappings with a stub.
>>>>
>>>> Fixes: c5fca485320e ("Input: goodix - add support for controlling
>>>> the
>>>> IRQ pin through ACPI methods")
>>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>    drivers/input/touchscreen/goodix.c | 27 +++++++++++++++++++--
>>>> ------
>>>>    1 file changed, 19 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/input/touchscreen/goodix.c
>>>> b/drivers/input/touchscreen/goodix.c
>>>> index 2c9cd1bfb860..a593ca38b35b 100644
>>>> --- a/drivers/input/touchscreen/goodix.c
>>>> +++ b/drivers/input/touchscreen/goodix.c
>>>> @@ -68,8 +68,10 @@ struct goodix_ts_data;
>>>>    enum goodix_irq_pin_access_method {
>>>>    	IRQ_PIN_ACCESS_NONE,
>>>>    	IRQ_PIN_ACCESS_GPIO,
>>>> +#if defined CONFIG_X86 && defined CONFIG_ACPI
>>>>    	IRQ_PIN_ACCESS_ACPI_GPIO,
>>>>    	IRQ_PIN_ACCESS_ACPI_METHOD,
>>>> +#endif
>>>>    };
>>>>    
>>>>    struct goodix_chip_data {
>>>> @@ -572,9 +574,6 @@ static int goodix_send_cfg(struct
>>>> goodix_ts_data
>>>> *ts, const u8 *cfg, int len)
>>>>    static int goodix_irq_direction_output(struct goodix_ts_data
>>>> *ts,
>>>>    				       int value)
>>>>    {
>>>> -	struct device *dev = &ts->client->dev;
>>>> -	acpi_status status;
>>>> -
>>>>    	switch (ts->irq_pin_access_method) {
>>>>    	case IRQ_PIN_ACCESS_NONE:
>>>>    		dev_err(&ts->client->dev,
>>>> @@ -583,26 +582,29 @@ static int
>>>> goodix_irq_direction_output(struct
>>>> goodix_ts_data *ts,
>>>>    		return -EINVAL;
>>>>    	case IRQ_PIN_ACCESS_GPIO:
>>>>    		return gpiod_direction_output(ts->gpiod_int,
>>>> value);
>>>> +#if defined CONFIG_X86 && defined CONFIG_ACPI
>>>>    	case IRQ_PIN_ACCESS_ACPI_GPIO:
>>>>    		/*
>>>>    		 * The IRQ pin triggers on a falling edge, so
>>>> its gets
>>>> marked
>>>>    		 * as active-low, use output_raw to avoid the
>>>> value
>>>> inversion.
>>>>    		 */
>>>>    		return gpiod_direction_output_raw(ts-
>>>>> gpiod_int,
>>>> value);
>>>> -	case IRQ_PIN_ACCESS_ACPI_METHOD:
>>>> +	case IRQ_PIN_ACCESS_ACPI_METHOD: {
>>>> +		struct device *dev = &ts->client->dev;
>>>> +		acpi_status status;
>>>> +
>>>>    		status =
>>>> acpi_execute_simple_method(ACPI_HANDLE(dev),
>>>>    						    "INTO",
>>>> value);
>>>>    		return ACPI_SUCCESS(status) ? 0 : -EIO;
>>>>    	}
>>>> +#endif
>>>> +	}
>>>>    
>>>>    	return -EINVAL; /* Never reached */
>>>>    }
>>>>    
>>>>    static int goodix_irq_direction_input(struct goodix_ts_data
>>>> *ts)
>>>>    {
>>>> -	struct device *dev = &ts->client->dev;
>>>> -	acpi_status status;
>>>> -
>>>>    	switch (ts->irq_pin_access_method) {
>>>>    	case IRQ_PIN_ACCESS_NONE:
>>>>    		dev_err(&ts->client->dev,
>>>> @@ -610,13 +612,20 @@ static int
>>>> goodix_irq_direction_input(struct
>>>> goodix_ts_data *ts)
>>>>    			__func__);
>>>>    		return -EINVAL;
>>>>    	case IRQ_PIN_ACCESS_GPIO:
>>>> +		return gpiod_direction_input(ts->gpiod_int);
>>>> +#if defined CONFIG_X86 && defined CONFIG_ACPI
>>>>    	case IRQ_PIN_ACCESS_ACPI_GPIO:
>>>>    		return gpiod_direction_input(ts->gpiod_int);
>>>> -	case IRQ_PIN_ACCESS_ACPI_METHOD:
>>>> +	case IRQ_PIN_ACCESS_ACPI_METHOD: {
>>>> +		struct device *dev = &ts->client->dev;
>>>> +		acpi_status status;
>>>> +
>>>>    		status = acpi_evaluate_object(ACPI_HANDLE(dev),
>>>> "INTI",
>>>>    					      NULL, NULL);
>>>>    		return ACPI_SUCCESS(status) ? 0 : -EIO;
>>>>    	}
>>>> +#endif
>>>> +	}
>>>>    
>>>>    	return -EINVAL; /* Never reached */
>>>>    }
>>>> @@ -862,6 +871,7 @@ static int goodix_get_gpio_config(struct
>>>> goodix_ts_data *ts)
>>>>    	ts->gpiod_rst = gpiod;
>>>>    
>>>>    	switch (ts->irq_pin_access_method) {
>>>> +#if defined CONFIG_X86 && defined CONFIG_ACPI
>>>>    	case IRQ_PIN_ACCESS_ACPI_GPIO:
>>>>    		/*
>>>>    		 * We end up here if
>>>> goodix_add_acpi_gpio_mappings()
>>>> has
>>>> @@ -878,6 +888,7 @@ static int goodix_get_gpio_config(struct
>>>> goodix_ts_data *ts)
>>>>    		if (!ts->gpiod_rst)
>>>>    			ts->irq_pin_access_method =
>>>> IRQ_PIN_ACCESS_NONE;
>>>>    		break;
>>>> +#endif
>>>>    	default:
>>>>    		if (ts->gpiod_int && ts->gpiod_rst) {
>>>>    			ts->reset_controller_at_probe = true;
> 


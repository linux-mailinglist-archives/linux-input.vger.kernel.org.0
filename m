Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38CD65C6A6
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 03:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfGBBdZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 21:33:25 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52868 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfGBBdZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 21:33:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so1254472wms.2;
        Mon, 01 Jul 2019 18:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VgvgzmIVrDSUjOY8EuC931M5g5ggSix1hpz5q9juADs=;
        b=LpRaLkOJ1zbdPPz+gCkN8fxSUmSH610Tv0OGF+prqAfFrtP3Bo0nGQ5sKjF6Bc0rXm
         +5D8vp/xyXW3BjMtjKoiL5w5dqBnQcag6ynIhdwxsidkV4SBzoLXWXOmFospadmg1b7+
         KM+NeUzC/m7R48n7lWfwwm6qO2aKiqjZHgTo+BYc4n8rn8rL+ieSaFDALZaqHOjxvWSh
         744r6B1VcoP0syIJMwrtiXmE4H/7Mcv9dE1ecRMnTB0Rha5TKq4ck8AIAnHwTcAHJjcN
         zagpv0sEHcwka9FY5aZcNi0WJh/AllPcT8AASvwj8zBH6W3aB7x3HZ5L/SpmMBQpgUA+
         UHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VgvgzmIVrDSUjOY8EuC931M5g5ggSix1hpz5q9juADs=;
        b=jjZjpWK8pmgSpJPCOtu/h847aY1O1BL/mz9KNbqENk7aX7P24e5DT5KhNC6dw7GSwK
         kgmclpCYJlOXkVRiLSWobE7msYe8riaN7fI4JJCurbCo1j7ojeqcmRXrMmWtr/ofhPa1
         gHszoageZAiNYlFO9UvDL8kQs0ntwkMM6SykqZTrg3eQFjjIy/wNAun2mC+dqoawQWdr
         u7LgQugyGPO2n8vqlOe+wQIb95UIA6uC9qkihhNAFT2pmtuiC462kawoPYRp1F3HWBN3
         nmBNQ0JnM3eHoahKDwb700rRnJFaUtpqLbGCtksfmBxbZ7nQh5yHAIQ9D3H+KNilTAlz
         2UmQ==
X-Gm-Message-State: APjAAAX98uZ9DMGI2NRwo43Pf0Rwo1S41kdMuAA32TMj7U3siTCzkC2J
        6Udgf6Q4++YyccYs7mMY/9w=
X-Google-Smtp-Source: APXvYqxoONF1T1GoeykizBu5RbG/Y58GKftODvSI+mFlqeZ0Wqc+blYee3SgczTmb5ueBCwoi4QKxg==
X-Received: by 2002:a1c:5a56:: with SMTP id o83mr1040541wmb.103.1562031202570;
        Mon, 01 Jul 2019 18:33:22 -0700 (PDT)
Received: from [192.168.2.202] (p5487BBD4.dip0.t-ipconnect.de. [84.135.187.212])
        by smtp.gmail.com with ESMTPSA id u13sm10089367wrq.62.2019.07.01.18.33.21
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 18:33:21 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] platform: Fix device check for surfacepro3_button
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Yu Chen <yu.c.chen@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <20190702003740.75970-2-luzmaximilian@gmail.com>
 <20190702011443.GA19902@chenyu-office.sh.intel.com>
 <91349d00-e7e2-887b-45e5-4689a401aa2f@gmail.com>
Message-ID: <d7e17f54-4c33-fa8d-be03-9e507da8e495@gmail.com>
Date:   Tue, 2 Jul 2019 03:33:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <91349d00-e7e2-887b-45e5-4689a401aa2f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/2/19 3:25 AM, Maximilian Luz wrote:
> On 7/2/19 3:14 AM, Yu Chen wrote:
>> On Tue, Jul 02, 2019 at 02:37:39AM +0200, Maximilian Luz wrote:
>>> +/*
>>> + * Surface Pro 4 and Surface Book 2 / Surface Pro 2017 use the same device
>>> + * ID (MSHW0040) for the power/volume buttons. Make sure this is the right
>>> + * device by checking for the _DSM method and OEM Platform Revision.
>>> + */
>>> +static int surface_button_check_MSHW0040(struct acpi_device *dev)
>>> +{
>>> +    acpi_handle handle = dev->handle;
>>> +    union acpi_object *result;
>>> +    u64 oem_platform_rev = 0;
>>> +
>>> +    // get OEM platform revision
>>> +    result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
>>> +                     MSHW0040_DSM_REVISION,
>>> +                     MSHW0040_DSM_GET_OMPR,
>>> +                     NULL, ACPI_TYPE_INTEGER);
>>> +
>> Does it mean, only 5th, 6th and newer platforms have OEM platform revision?
>> 3rd/4th will get NULL result? Or the opposite?
> 
> Correct, from my testing (with limited sample size) and AML code: 5th
> and 6th generation devices have a non-zero OEM platform revision,
> whereas 3rd and 4th gen. devices do not have any (i.e. result will be
> NULL).
> 
>>> +    if (result) {
>>> +        oem_platform_rev = result->integer.value;
>>> +        ACPI_FREE(result);
>>> +    }
>>> +
>>> +    dev_dbg(&dev->dev, "OEM Platform Revision %llu\n", oem_platform_rev);
>>> +
>>> +    return oem_platform_rev == 0 ? 0 : -ENODEV;
>> if 3rd/4th do not have this oem rev information while 5th/newer have,
>> why the latter returns NODEV(it actually has this info)?
> 
> Since we always expect a non-zero platform revision (for 5th/6th gen.),
> we can initialize it to zero and use that as "unknown"/"not available".
> So if it can not be determined, we return NODEV.

Sorry, small mistake here: If it can be determined (i.e. is 5th or 6th
gen.) then we return NODEV. Not the other way around.

Also to clarify on your last question:

On 7/2/19 3:14 AM, Yu Chen wrote:
>>   static int surface_button_add(struct acpi_device *device)
>>   {
>>   	struct surface_button *button;
>> @@ -154,6 +188,10 @@ static int surface_button_add(struct acpi_device *device)
>>   	    strlen(SURFACE_BUTTON_OBJ_NAME)))
>>   		return -ENODEV;
>>   
>> +	error = surface_button_check_MSHW0040(device);
>> +	if (error)
>> +		return error;
>> +
> ditto, 3rd/4th get error=0?

You are correct.

Maximilian

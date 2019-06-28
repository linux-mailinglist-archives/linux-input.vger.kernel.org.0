Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A5B5972D
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2019 11:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfF1JQw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Jun 2019 05:16:52 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45971 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfF1JQv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Jun 2019 05:16:51 -0400
Received: by mail-ed1-f68.google.com with SMTP id a14so10010485edv.12
        for <linux-input@vger.kernel.org>; Fri, 28 Jun 2019 02:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DL2X9ZKHs3SIYUrbrmS+viYLmQxjYZSCt4hAb+5m8Lk=;
        b=Q8Mcuy4JxD9BTJMJzh5kEVo7PX9KtI9Rt+V9UjWql66Lp++KCXfFufiL3IJfXG+Z3q
         qFvewJAT85bHWFse1vPcT7DJ4Z3+OhUoRMHd9J+tF0t2u3uDtgm4H/p1X5+r2/MfvCBe
         XWHfEnoDy9TjAWZJcwqa4K7F3B8zQVLCyTSUIMf45MXoKwt3vr/BYEkFbt19V2B+yjkz
         5fRVdoOrsc0ltOGqwotoZ6aqetzSbfIC7FVa8mV8VLle3qQI5U3V8pnAZTGHhBcObOuh
         9Zi6cufC27SWbnO3Ey0wUl846kgbyllZDR6Xh0L9Ifiaod+k7DZY0nCMjbDWs33eqGGb
         3Amw==
X-Gm-Message-State: APjAAAWyQZJJdPSIz1IALpRZHXD6VeXfa8FxJndQdgqdsrktSyxprD79
        bdFmFWg5J2b21+NFleF5iBhznxNU3z0=
X-Google-Smtp-Source: APXvYqz1Qpw4wY8HaiPDCRz9upnWwL6YMxdc/MhtbeVukRYm58D/H6ofd9O60514M4nIZLWBiTkQXQ==
X-Received: by 2002:a50:9422:: with SMTP id p31mr9935810eda.127.1561713410129;
        Fri, 28 Jun 2019 02:16:50 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id q18sm344901ejm.5.2019.06.28.02.16.49
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 02:16:49 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for 'Chuwi Hi10
 Pro' touchscreen
To:     Daniel Otero <otero.o.daniel@gmail.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>, linux-input@vger.kernel.org
References: <20190605232204.24679-1-otero.o.daniel@gmail.com>
 <e434bca4-51d9-e601-5130-55eb48649ce5@redhat.com>
 <20190627225055.GB9615@Wall-E.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <88eb8c70-1ab9-638f-62c0-0f979b7c37bd@redhat.com>
Date:   Fri, 28 Jun 2019 11:16:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627225055.GB9615@Wall-E.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 28-06-19 00:50, Daniel Otero wrote:
> Thanks Hans!
> 
> Anything else that I can do to get this accepted?

Nothing more is needed, the platform-x86 driver maintainers should
pick this up soonish.

Regards,

Hans



> 
> Regards,
> 
> On Thu, Jun 06, 2019 at 09:33:17AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 06-06-19 01:22, Daniel Otero wrote:
>>> Add touchscreen platform data for the 'Chuwi Hi10 Pro' tablet touchscreen.
>>>
>>> Signed-off-by: Daniel Otero <otero.o.daniel@gmail.com>
>>
>> Patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Regards,
>>
>> Hans
>>
>>
>>> ---
>>>    drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>>>    1 file changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
>>> index b662cb2d7cd5..d942082c5b7b 100644
>>> --- a/drivers/platform/x86/touchscreen_dmi.c
>>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>>> @@ -87,6 +87,23 @@ static const struct ts_dmi_data chuwi_hi10_air_data = {
>>>    	.properties	= chuwi_hi10_air_props,
>>>    };
>>> +static const struct property_entry chuwi_hi10_pro_props[] = {
>>> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1911),
>>> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1276),
>>> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 9),
>>> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 9),
>>> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>>> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
>>> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>>> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
>>> +	{ }
>>> +};
>>> +
>>> +static const struct ts_dmi_data chuwi_hi10_pro_data = {
>>> +	.acpi_name	= "MSSL1680:00",
>>> +	.properties	= chuwi_hi10_pro_props,
>>> +};
>>> +
>>>    static const struct property_entry chuwi_vi8_props[] = {
>>>    	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
>>>    	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
>>> @@ -601,6 +618,14 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>>>    			DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
>>>    		},
>>>    	},
>>> +	{
>>> +		/* Chuwi Hi10 Pro (CWI529) */
>>> +		.driver_data = (void *)&chuwi_hi10_pro_data,
>>> +		.matches = {
>>> +			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
>>> +		},
>>> +	},
>>>    	{
>>>    		/* Chuwi Vi8 (CWI506) */
>>>    		.driver_data = (void *)&chuwi_vi8_data,
>>>

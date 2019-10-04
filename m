Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E39DCC59B
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2019 00:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfJDWHU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 18:07:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42078 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbfJDWHU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Oct 2019 18:07:20 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A26A92A09BA
        for <linux-input@vger.kernel.org>; Fri,  4 Oct 2019 22:07:19 +0000 (UTC)
Received: by mail-ed1-f71.google.com with SMTP id p55so4949128edc.5
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2019 15:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Uam/3duvWTvFhnuDUue8U73fo4Zp2lBsCMnIA+fsGXk=;
        b=a8XyejlmRKsJbYoSEAje+YwOhMXu7FX0zKQJODmslfTSjwt/v/IB1+w7FStV/7YeSL
         sdJvjXuyHTz6TScwYHB4OPvlCwYyga1GWt+tbHlZ5ijQvnhwCxE9UZ23BnItM9AmtMZT
         vjxh7L/l1jibCe8OnlYroyoYoFrOaN8p5Os/RkjFlGDdjsgd4y4RftdHMuhh1/nMANQR
         +F19Gwb+Cu8Bp8GnOqPXL4qGbS5vS9SnG2tz8EoEHPp8XQXfYSQP3glSIYeATEO8NZsn
         +dH/HDq8GuJ+Res5uZS22th5FmZEiWj6JmoADvkRcT5H4qqeR9MjDQ7mUsf5hvG5N1wa
         rPaw==
X-Gm-Message-State: APjAAAV04P6HBzp5BQIcJ/gQHmmwSSE6J5l2BCxCZIINsvbb4ygkYJBD
        9P/qkzv3sOT83Hs4Rn+9x9fRz6zH3Xtb5peG/bblYyqvd3XXLtZ7Epuuxkh2fRqFnR3hsDCLDxa
        CQ1mkSdfmaAvhWrXRezOq0lw=
X-Received: by 2002:aa7:dc4b:: with SMTP id g11mr17894446edu.70.1570226838373;
        Fri, 04 Oct 2019 15:07:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmYoGQJk9xqnPF+XfADfg/AQzQ65Xjlxm/ewT4dbzIZpwdmoipLUy0i2qZCbY5TIALrd6ueA==
X-Received: by 2002:aa7:dc4b:: with SMTP id g11mr17894435edu.70.1570226838200;
        Fri, 04 Oct 2019 15:07:18 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id gl4sm770631ejb.6.2019.10.04.15.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2019 15:07:17 -0700 (PDT)
Subject: Re: [PATCH] HID: logitech: Add depends on LEDS_CLASS to Logitech
 Kconfig entry
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
References: <20191004073715.6075-1-hdegoede@redhat.com>
 <CAO-hwJ+kGmQSJZTO=PHKO6kTpwV6GwkbCkCMTtYV4=LabkUTNQ@mail.gmail.com>
 <a4342ade-f5c6-f981-3957-8820937f89f2@redhat.com>
 <CAO-hwJ+_nQJgPqtWAhp==rR-k40ARf_-2GOOpFbzGziFSp_o6Q@mail.gmail.com>
 <CAO-hwJKJY+_Wi73FGm51wd50qgLZAMTsfdn9K+nDvkcTrL9aTA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a30ef480-0335-33eb-4a41-f7c62ef585f7@redhat.com>
Date:   Sat, 5 Oct 2019 00:07:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJKJY+_Wi73FGm51wd50qgLZAMTsfdn9K+nDvkcTrL9aTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 04-10-2019 18:22, Benjamin Tissoires wrote:
> On Fri, Oct 4, 2019 at 11:01 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
>>
>> On Fri, Oct 4, 2019 at 8:05 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 10/4/19 1:30 PM, Benjamin Tissoires wrote:
>>>> Hi Hans,
>>>>
>>>> On Fri, Oct 4, 2019 at 3:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Commit 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
>>>>> makes the hid-lg15 kernel module, which gets configured through config
>>>>> HID_LOGITECH depends on symbols from the led class. Add a depends on
>>>>> LEDS_CLASS to HID_LOGITECH to avoid undefined reference errors on the
>>>>> led class symbols.
>>>>>
>>>>> Fixes: 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
>>>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>> ---
>>>>>    drivers/hid/Kconfig | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
>>>>> index 1ecb5124421c..494a39e74939 100644
>>>>> --- a/drivers/hid/Kconfig
>>>>> +++ b/drivers/hid/Kconfig
>>>>> @@ -525,6 +525,7 @@ config HID_LENOVO
>>>>>    config HID_LOGITECH
>>>>>           tristate "Logitech devices"
>>>>>           depends on HID
>>>>> +       depends on LEDS_CLASS
>>>>
>>>> My CI failed with this patch. It seems this creates a loop in the
>>>> dependencies and I can not create the config file. Also, it seems
>>>> weird to have a depends on LEDS_CLASS when you surely wants to enable
>>>> it. How about using SELECT instead?
>>>
>>> That is weird, there is a whole bunch of other HID_FOO config
>>> symbols in drivers/hid/Kconfig which also have a depends on LEDS_CLASS,
>>> so if this is a problem then it should be a problem for those other ones
>>> too.
>>
>> Yeah, it seems it's my script that generates the config that is bugged...
>>
>>>
>>> I do see that there are others which use select instead of depends
>>> (yeah consistency) so I guess that changing to select is fine here...
>>>
>>> Please let me know how you want to proceed with this.
>>
>> I'll try to fix this and will push the depnds preferably or the
>> selects if no other options is possible.
> 
> I just fixed my config script and pushed your patch on top of for-5.5/logitech.

Great, thank you.

Regards,

Hans

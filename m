Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4EEB9A0ED
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 22:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388924AbfHVUOg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 16:14:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40104 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388845AbfHVUOg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 16:14:36 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id AE4CC7E44B
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 20:14:35 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id r21so4000720edc.6
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 13:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y6bQf+vBMvNZfxqlbhVeyibdR2R3c2eZFnGcUbXcd9o=;
        b=ErB2cjzGPm08k15GcRxZt3+qqaas1RBpQjv49x6iPXT1dzIcyYv94urT8Y5Ln7sMy0
         wWsMjoL8MBGgbdengmkgchFlaopGeeZWQgPLUbBq30ggmroPMqQqdlJC0XDJSzLhomfM
         VsfRkbo2I0byug7qFWIXOlDB35LNOMUNegPmZX1GoYJ/7RuxhFvq7DKORyOpoTgLQrpa
         czE7c37mEDaQfdSEOwH3bIRvl/j6KK16uyMm7vzaxrVOp4cclwg2OKCgJsBcjap3BQNh
         yTIn7OLe7uHOnL6jDZ6D7Ns2C0SgTpSfyZCGMGw8tBkBJrPL7XGIqE8iQ/t+cwkg2H2G
         vyvA==
X-Gm-Message-State: APjAAAWvOL9XryaMwcJ/PJvHj7Il2Des5x3FB4RU8uy3nhhnJzKqPniY
        xno/0edtfYYMncIY8Sd6y2zDR3LCpsGp/dYc0PluLHAw/vwujyhhWW0hjc+nMxVSz89nC9MUHuZ
        5fFBO4+Ynoh0CXTEj7SiYRvM=
X-Received: by 2002:a17:906:28ce:: with SMTP id p14mr1039023ejd.306.1566504873458;
        Thu, 22 Aug 2019 13:14:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhCocjNs4NBvo4SKVcDy3Ce9gl/gTlaRvxMn0jIl3IIMAdUGdMu2ZY4gRKaClpyHPmePQQRg==
X-Received: by 2002:a17:906:28ce:: with SMTP id p14mr1039006ejd.306.1566504873253;
        Thu, 22 Aug 2019 13:14:33 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id k12sm82677edr.84.2019.08.22.13.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2019 13:14:32 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] Input: Add event-codes for macro keys found on
 various keyboards
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20190821205937.4929-1-hdegoede@redhat.com>
 <20190821205937.4929-2-hdegoede@redhat.com> <20190822180604.GG76194@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8f356b32-97e8-6603-6d46-8a643763acb5@redhat.com>
Date:   Thu, 22 Aug 2019 22:14:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822180604.GG76194@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 22-08-19 20:06, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Wed, Aug 21, 2019 at 10:59:31PM +0200, Hans de Goede wrote:
>> Various keyboards have macro keys, which are intended to have user
>> programmable actions / key-sequences bound to them. In some cases these
>> macro keys are actually programmable in hardware, but more often they
>> basically are just extra keys and the playback of the key-sequence is done
>> by software running on the host.
>>
>> One example of keyboards with macro-keys are various "internet" / "office"
>> keyboards have a set of so-called "Smart Keys", typically a set of 4 keys
>> labeled "[A]" - "[D]".
>>
>> Another example are gaming keyboards, such as the Logitech G15 Gaming
>> keyboard, which has 18 "G"aming keys labeled "G1" to G18", 3 keys to select
>> macro presets labeled "M1" - "M3" and a key to start recording a macro
>> called "MR" note that even though there us a record key everything is
>> handled in sw on the host.
>>
>> Besides macro keys the G15 (and other gaming keyboards) also has a buildin
>> LCD panel where the contents are controlled by the host. There are 5 keys
>> directly below the LCD intended for controlling a menu shown on the LCD.
>>
>> The Microsoft SideWinder X6 keyboard is another gaming keyboard example,
>> this keyboard has 30 "S"idewinder keys and a key to cycle through
>> macro-presets.
>>
>> After discussion between various involved userspace people we've come to
>> the conclusion that since these are all really just extra keys we should
>> simply treat them as such and give them their own event-codes, see:
>> https://github.com/libratbag/libratbag/issues/172
>>
>> This commit adds the following new KEY_ defines for this:
>>
>> KEY_LCD_MENU1 - KEY_LCD_MENU5, KEY_MACRO_RECORD, KEY_MACRO_PRESET_CYCLE,
>> KEY_MACRO_PRESET1 - KEY_MACRO_PRESET3, KEY_MACRO1 - KEY_MACRO30.
>>
>> The defines leave room for adding some more LCD-menu, preset or macro keys,
>> the maximum values above are based on the maximum values to support all
>> currently known internet, office and gaming keyboards.
> 
> I must say that I am not too hot on having these in the keys space,
> with the exception of KEY_MACRO_RECORD_* as we were trying to allow
> userspace consumers to know what keys are supposed to mean, instead of
> just blanked "programmable" keys. Still, we have the BTN_TRIGGER_HAPPY.
> 
> I guess as long as we do not try to use the new range for keys that have
> a defined meaning but lack their own button code it is OK.

Right, these new codes are for key which are intended to be user programmable,
they have no icon on them / no defined meaning. They come with markings
like G1-G18 (for the Logitech _G_aming series), but they have no meaning and
under Windows they do not function at all without host side software turning
them intro macro keys. Other keyboards have markings like e.g. S1 - S30 for
the Microsoft _S_idewinder series, again the intended use for these keys is
use as macro keys configured through host side software...

Do you want me to add a big fat comment to the next version spelling this
out extra explicitly ?

>> BugLink: https://github.com/libratbag/libratbag/issues/172
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   include/uapi/linux/input-event-codes.h | 54 ++++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
>> index 85387c76c24f..80df3a6d6bcb 100644
>> --- a/include/uapi/linux/input-event-codes.h
>> +++ b/include/uapi/linux/input-event-codes.h
>> @@ -650,6 +650,60 @@
>>   #define KEY_DATA			0x277
>>   #define KEY_ONSCREEN_KEYBOARD		0x278
>>   
>> +/*
>> + * Some keyboards have a buildin LCD panel where the contents are controlled
>> + * by the host. Often these have a number of keys directly below the LCD
>> + * intended for controlling a menu shown on the LCD. These keys often don't
>> + * have any labelling so we just name them KEY_LCD_MENU#
>> + */
>> +#define KEY_LCD_MENU1			0x280
> 
> KEY_KBD_LCD_MENUn to show that it is supposed to control the LCD *on*
> the keyboard?

KEY_KBD_LCD_MENUn works for me, I will change to this for v3 of the patchset.

> I also wonder if we could move it down by 16 to start with 0x290? This
> will give us more buffer for new keycodes.

Sure, will do for v3.

Regards,

Hans

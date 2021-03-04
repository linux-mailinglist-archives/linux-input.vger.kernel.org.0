Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3493532DA55
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 20:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbhCDTZH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 14:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54050 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236391AbhCDTYn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 14:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614885797;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XMub52vQg3xrfuZxKplzv0SeIzHmZpsZMO1PFqvJoKI=;
        b=dPj7S7+UCZdPCKd9KGewtmrGZZ6dVh7eE140caIGu5wWVfJC6GnJgLIY0z/S6oNsY4ehRZ
        HbU7J0WxWMgsnOwgRO5HyinuaQ+mweG7QG69Ww5INTAaEoT59GBJaU89ZaHg8xGbKETxtp
        9KlwOSUZGHoYkEwFBEt6kIOJ+9t3Pb8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-RXQQUH3MNDGu7FFIP48Juw-1; Thu, 04 Mar 2021 14:23:15 -0500
X-MC-Unique: RXQQUH3MNDGu7FFIP48Juw-1
Received: by mail-ed1-f69.google.com with SMTP id i19so12226251edy.18
        for <linux-input@vger.kernel.org>; Thu, 04 Mar 2021 11:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XMub52vQg3xrfuZxKplzv0SeIzHmZpsZMO1PFqvJoKI=;
        b=HHIhsUpr/dtX5aqjhfk6kF7NvEyuKUfBv4OoZ+LzNDgvcbH41gQaqBXsAH3X20BDyk
         H2YIRTx343bCeVq6GREQiCEiv66gM7uv+RTnuqcsH4ZNgxJmyi7KmJJ3u+R70oaXrfKa
         1m014LBTqMQQkw3h8iH2ffFnV1uZpBlc4TOWEeLcSaWQdQaxo5lqs2o4Gnxg66PIC08r
         ooLMLuOVbHNf2EdZZZzudMQ+MiY2VCG/FJnUQ9beLKmr2vuSWOzBNSupOsWIwR+rmdJQ
         hlLckYPyI2y0VF23gyCBhf/vd4i9OoJYMse/scqKNbzg58llPuvh4nwrluWg1EqkGX2/
         +2tw==
X-Gm-Message-State: AOAM5337U6IHAVBs9MIHKZgfxxfZv8pVkKaqu+hIfN1C0gW08nsESyZR
        j7M8cohkwZEf7FwhjobbYFEDkDoqaAmlyR9UddKWpLGk5oGyGBO1FrcpKmcqkMUbd2b+kbNp9kL
        CmIvEkkjg+0jf9NSPl40lO8RNGW2tCz7IEJf2t9yuvtrA5fxF0I4vfa3d1jDLDNCBhJrJwPuNON
        o=
X-Received: by 2002:a05:6402:1342:: with SMTP id y2mr6172169edw.285.1614885793324;
        Thu, 04 Mar 2021 11:23:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPFZ14oZjVIfb/olwU8hLvdk10wc0yQHlM0gDJHRKJGHMJYzkCUFxrQsyTdnhb/NSg0YCHDw==
X-Received: by 2002:a05:6402:1342:: with SMTP id y2mr6172148edw.285.1614885793071;
        Thu, 04 Mar 2021 11:23:13 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q20sm140395ejs.41.2021.03.04.11.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 11:23:12 -0800 (PST)
Subject: Re: Support for X1 tablet keyboard (was Re: [PATCH] platform/x86:
 thinkpad_acpi: handle HKEY 0x4012, 0x4013 events)
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>
Cc:     linux-input <linux-input@vger.kernel.org>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de>
 <be3f6a0f-281f-975f-70c2-b167adb5547c@redhat.com>
 <64a4f249-f90b-c6b2-887f-55a016d93c65@a-kobel.de>
 <29961a1a-a66a-e732-ff7c-c7f2da52a83d@redhat.com>
 <b1392cd8-eefc-4fff-d327-5159714ba304@a-kobel.de>
 <b61d2451-f9f2-1b2c-bd7b-193713d87dbc@redhat.com>
 <7007c7e4-c24f-93a1-53e4-bd497e2d7e83@a-kobel.de>
 <d5878c95-0e0f-7119-bdf7-2ee5f504f08f@redhat.com>
 <7263ee42-b18f-34ce-bc62-9a4efde1edd0@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6fd6a54f-7256-c527-4dfc-b6cbe1a883a8@redhat.com>
Date:   Thu, 4 Mar 2021 20:23:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7263ee42-b18f-34ce-bc62-9a4efde1edd0@a-kobel.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/24/21 10:59 PM, Alexander Kobel wrote:
> Hi,
> 
> On 2/24/21 10:00 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 2/22/21 1:31 PM, Alexander Kobel wrote:
>>> On 2/21/21 5:30 PM, Hans de Goede wrote:
> 
> <snip>
> 
>>>> The input report used by the Fn + key "media keys" use a 24 bit report
>>>> with 1 bit per key. The standard keyboard interface uses 1 byte per
>>>> pressed key (with a maximum of 6 pressed keys) where the full byte
>>>> encodes the scancode of the key. Normally SysRq is 0x46 but for some
>>>> reason your keyboard is sending 0x9a you can map this by adding the following
>>>> to the mapping function:
>>>>
>>>> 	if (usage->hid == (HID_UP_KEYBOARD | 0x009a))
>>>> 		map_key_clear(KEY_SYSRQ);
>>>
>>> And the same here, I think. Works with return 1; after the map_key_clear, see the attached function.
>>
>> Ah yes, I forgot the return 1, sorry about that.
> 
> No problem, nearby pattern matching and copy-paste is a great way to learn sometimes. ;-)
> 
>>>> Likewise for the sleep combo:
>>>>
>>>> 	if (usage->hid == (HID_UP_KEYBOARD | 0x0072))
>>>> 		map_key_clear(KEY_SLEEP);
>>>
>>> This seems unnecessary, as the sleep combo already emits KEY_SLEEP. Which I don't quite get, cause - if I learned correctly how to read the rdesc - sleep should be on 0x0072 should emit F23 (and 0x0078 sleep), but the key produces the 0x0072 pattern according to hidraw.
>>> By the way, the Fn+4 for sleep also works in hid-generic, and also just once, see below.
>>
>> Ok.
>>
>>>> ###
>>>>
>>>> Note chances are you have more Fn + 'letter' combinations at least on
>>>> the thinkpad10 kbd I have:
>>>>
>>>> Fn + T -> SysRq
>>>> Fn + I -> Insert
>>>> Fn + P -> Pause
>>>> Fn + S -> Sysrq
>>>> Fn + K -> ScrollLock
>>>> Fn + B -> Pause
>>>>
>>>> Note these do not need any special mappings on the thinkpad10 kbd and I guess
>>>> the doubles may have something to do with some non qwerty keymaps.
>>>
>>> Not the same on this keyboard. I have Fn + {B,K,P,S,End,4} for {Break,ScrLk,Pause,SysRq,Insert,Sleep}, but only SysRq was missing; the others are available on the "default" device, both with hid-lenovo and hid-generic.
>>
>> Ok.
>>
>>>>> The ugly:
>>>>>
>>>>> Fn+4 ("sleep") triggers the appropriate ACPI event button/sleep and emits something on /dev/hidraw0, too, but *only once*. After resuming, no reaction at all (neither on ACPI nor hidraw) until I unload and reload the hid_lenovo module.
>>>>
>>>> As for the sleep key working only once, what happens after a suspend/resume ?
>>>
>>> Nothing. At least nothing I can measure (via evtest, libinput debug-events, cat /dev/hidraw*, dmesg, journal, acpi_listen). The key simply doesn't react anymore.
>>> Irrespective on how I wake the device. Even irrespective of whether I actually suspend the device or disable the sleep handler altogether, e.g. by systemd-inhibit. In only see the KEY_SLEEP press (no release!) event once until I reload the module or unplug and reattach the keyboard.
>>> Very strange. And, by the way: the same for hid-generic.
>>>
>>>> I think the key may have some special handling to avoid it sending
>>>> a second KEY_SLEEP when the user uses it to wakeup the system, to
>>>> avoid the system immediately going to sleep again when the user tries
>>>> to wake the system this way.
>>>
>>> Yes, that'd make sense. So probably the handler should restore something; apparently, that part is initialized when the module is loaded, so it's not just the keyboard firmware.
>>
>> Maybe echo-ing to the fnlock attribute resets the key ? The driver does always force the fnlock LED on when it is loaded.
> 
> Good catch, but that doesn't help, either.
> 
> It's only a minor nuisance, though; in any case, it can be worked around by reloading the driver in a resume hook. If one actually wants to use that button; I personally won't.
> 
>>>>> Finally, keyboard backlight is handled in firmware, apparently; Fn+Space is visible on /dev/hidraw1 (see attached capture), but it toggles the backlight levels without any userspace code involved, as far as I can see.
>>>>
>>>> Yes I saw this in your dump, this is really weird because it sets 3 bits at once in the INPUT(3) report.
>>>> Does it always set the same 3 bits independent of the brightness level ?
>>>
>>> Yes; the four key presses are actually one full cycle over off, auto, dim, and bright. hidraw dumps are identical.
>>>
>>>>> Also, the keyboard backlight doesn't create an entry in /sys/class/backlight or the like, so neither read nor write access. Out-of-the-box, at least. But I'm not even sure if this is possible in Windows.
>>>>
>>>> Actuallu kbd-backlighting used the /sys/class/leds interface, but yeah that is not support by Linux ATM for this kbd.
>>>>
>>>> Yeah, adding support for that (assuming the hw can do it) would definitely require making some USB dumps under Windows
>>>> (after finding sw which can change it from within the OS under Windows).
>>>
>>> I double-checked; somewhat unsurprisingly, there is at least a notification client on Windows that displays the new configuration after Fn+Space. The client only reports the setting; not sure if it would be technically feasible to also set the brightness level in software.
>>
>> We could try asking Nitin if he has any info about this, but I agree that this is a low priority item.
> 
> Ack.
> 
>>> But anyways: I feel that I exploited your generosity in helping me far enough. I hope I wasn't just fed, but learned a bit how to fish for myself in the future. So, unless you're really committed to walk me through this further, I won't beg any further.
>>>
>>> And in case you're looking for problems to tackle on the Tablet 2nd Gen, this one about the power button could be way more significant - but not sure if it's in an area that you are familiar in:
>>> https://bbs.archlinux.org/viewtopic.php?id=248857
>>> https://bugzilla.kernel.org/show_bug.cgi?id=204763
>>
>> I see that you have already tested the patch which was posted for this, so I assume that this is resolved now ?
> 
> Correct. I resurrected the bugzilla task shortly after my last mail, and Alban cranked out a patch with you in CC within few hours. Didn't want to add more noise here.
> 
>>>>> Bottom line: this is mostly usable already, modulo the adjustments for the different keys. I'd like to make F10 to F12 work before it hits testing; everything else is icing on the cake, I suppose. Do you have an hint for me how I can approach that?
>>>>
>>>> See above, I think we are pretty close to solving this.
>>>
>>> Attached is the modified version of the input mapping for this keyboard, working subject to the above mentioned restrictions. I think this is fine.
>>> As you did all the real work, I feel this should be your contribution. But of course I can also prepare a patch on top of yours.
>>
>> I think you're underestimating your own contribution here...
>>
>> For cases like this we usually add a co-authored tag. Since this applies on top of another hid-lenovo series which I recently send out it is probably easier if I upstream this, that I agree on.
>>
>> I would like to attribute your work though, so I would like to suggest adding the following 2 tags to the commit msg for
>> the "HID: lenovo: Add support for Thinkpad X1 Tablet Thin keyboard" patch:
>>
>> Co-authored-by: Alexander Kobel <a-kobel@a-kobel.de>
>> Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>
>>
>> Alternatively
> 
> <snip>
> 
>> But I believe that co-authored-by + s-o-b are more appropriate.
> 
> Okay, so be it. I trust your opinion here.

Great, I've submitted a new version of my previous hid-lenovo series upstream now, with the 2 patches to add support for the X1 tablet keyboard added to the series.

Regards,

Hans


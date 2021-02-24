Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D5332458A
	for <lists+linux-input@lfdr.de>; Wed, 24 Feb 2021 22:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbhBXVCC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Feb 2021 16:02:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53437 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232623AbhBXVCB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Feb 2021 16:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614200434;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=60JHxrRXVogxjAQ/DE/xsByUBsL2F7tz3KsyZ/7HNwE=;
        b=ISLEc9r5goER02TJ5sKOmBtl2pVdcX+W96mgYbuWe9woKwXtRHhQVHhuDF/30TwrP9x+jG
        dfRx2FSnxxrNUpkxXO9aQGP27ncDhcuvqitrdQPueo62tnxQuGrBJxL2agsB0TbL2A13Y0
        ySuywZjhR84T4QqiG+hU7ujXa6/t4AY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-khBUAZN6OBu-6h_PRcu0Rw-1; Wed, 24 Feb 2021 16:00:29 -0500
X-MC-Unique: khBUAZN6OBu-6h_PRcu0Rw-1
Received: by mail-ej1-f72.google.com with SMTP id v10so1371310ejh.15
        for <linux-input@vger.kernel.org>; Wed, 24 Feb 2021 13:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=60JHxrRXVogxjAQ/DE/xsByUBsL2F7tz3KsyZ/7HNwE=;
        b=FVnxO08+MbdFHGAE48c2vgLwAZkBFA5+f9Hp4F2SaXy+HyIW0EiGFVGQNXKoy92nA+
         tqZKQFjAehWBA9SGekfIJ4XNiuhsU6nfO6aL5xC4mzfp/KFiK46z2mTSO+9ItDAa2Sb2
         If78GoBtf+d+P6NjmGiJkiTCUyKWEDsCxLqo4xYcEUNj0cB1W8DAm1kq9Xi5/vw8GqfA
         5IxGaAKpH/4xJfbUuVK8lYucq+fHazuVstH9sQi4HDFcet5rmgblAP36b28iVaUysuZu
         QqbuseGHW2ujee/x2tvvrXUp7iEl5UlvZ7Qx/8qS/wZ/xTYp0RvItCG4ZLC2vR0mmovA
         FluQ==
X-Gm-Message-State: AOAM533u4kIdV9OS3h4JkSPuaNLdjafE18W/en8i+U+pcmmg6158cxCr
        bvCYatZe60MGt++C/cN/1XUTJqujUdxg9OKIgJZOtbOBRfPhulcZvELICpdwkkwX6bLqUW7bw98
        hjsM9+ZQmajj5oMYJBsAua6f6yUtZIDi4xUQAAnbS4fwrNmRIm6560oKFqqEQkYWMVNFWJPPbv+
        w=
X-Received: by 2002:a05:6402:1d9b:: with SMTP id dk27mr20031122edb.209.1614200428167;
        Wed, 24 Feb 2021 13:00:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt2vyKBf0b2pqdc4qtf+hKfqFR1ovX4mT6Cvii7yZqJcjZSQcUQ9OA4TzfHsTnw02HkAsJCA==
X-Received: by 2002:a05:6402:1d9b:: with SMTP id dk27mr20031074edb.209.1614200427649;
        Wed, 24 Feb 2021 13:00:27 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b17sm1955765ejj.9.2021.02.24.13.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 13:00:27 -0800 (PST)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d5878c95-0e0f-7119-bdf7-2ee5f504f08f@redhat.com>
Date:   Wed, 24 Feb 2021 22:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7007c7e4-c24f-93a1-53e4-bd497e2d7e83@a-kobel.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/22/21 1:31 PM, Alexander Kobel wrote:
> On 2/21/21 5:30 PM, Hans de Goede wrote:

<snip>

>>> I could adjust some of the key mappings for the X1 Tablet 2nd keyboard. What I couldn't do is to get Fn+F10, Fn+F11, Fn+F12 and Fn+PrtSc to work.
>>> Following the logic of /dev/hidraw1 capture (attached), those should be on usage_index 16 to 19. But apparently those are on a different usage page or something like that? Unfortunately, my RTFM skills didn't really help with figuring out how that's supposed to work.
>>> (Is looking at the bit indices in /dev/hidraw traces how you figure out those mappings? If there's a better way, I'm eager to be told...)
>>
>> You are swapping to low and high byte of the 3 data bytes in the report. Here is an annotated part of the descriptors to explain better:
>>
>>   INPUT(3)[INPUT]
>>     Field(0)
>>       Application(Consumer.0001)
>>       Usage(24)
>>  0        Consumer.0001 F10 00000001 00000000 00000000
>>  1        Consumer.0001 F11 00000010 00000000 00000000
>>  2        Consumer.0001 F12 00000100 00000000 00000000
>>  3        Consumer.0001 Prt 00001000 00000000 00000000
>>  4        Consumer.0001
>>  5        Consumer.00e2 F1  00100000 00000000 00000000
>>  6        Consumer.0001
>>  7        Consumer.0001
>>  8        Consumer.0001 ESC 00000000 00000001 00000000
>>  9        Consumer.0001 F4  00000000 00000010 00000000
>> 10        Consumer.0001 F9  00000000 00000100 00000000
>> 11        Consumer.00b7
>> 12        Consumer.0001
>> 13        Consumer.0001 F7  00000000 00100000 00000000
>> 14        Consumer.0001 F8  00000000 01000000 00000000
>> 15        Consumer.0001 
>> 16        Consumer.0001
>> 17        Consumer.0001
>> 18        Consumer.0001 
>> 19        Consumer.006f F6  00000000 00000000 00001000
>> 20        Consumer.00ea F2  00000000 00000000 00010000
>> 21        Consumer.00e9 F3  00000000 00000000 00100000
>> 22        Consumer.0070 F5  00000000 00000000 01000000
>> 23        Consumer.0001
>>       Logical Minimum(0)
>>       Logical Maximum(1)
>>       Report Size(1)
>>       Report Count(24)
>>       Report Offset(0)
>>       Flags( Variable Absolute )
>>
>> Notice how the keys with standard codes (which work without mapping)
>> F1 - F3, F5, F6 now all line up with _none_ Consumer.0001 entries.
>> And if you check those codes in drivers/hid/hid-input.c around
>> line 960 you will see the standard mappings line up too.
>>
>> IOW your case 16 needs to be case 0, case 17, case 1, etc.
> 
> Gotcha, I suppose. At least on a shallow level... Thanks!
> And, yes: that works perfectly.
> 
>>> Similarly - I assume - Fn+S should emit SysRq according to https://download.lenovo.com/pccbbs/mobiles_pdf/x1_tablet_gen_2_ug_en.pdf, page 51. This is not on the "consumer control" device, but the usual keyboard, so /dev/hidraw0. Again, couldn't get much further than producing a capture. But I cannot make sense of this one, because way more bits are set, so I cannot extrapolate from your code.
>>
>> The input report used by the Fn + key "media keys" use a 24 bit report
>> with 1 bit per key. The standard keyboard interface uses 1 byte per
>> pressed key (with a maximum of 6 pressed keys) where the full byte
>> encodes the scancode of the key. Normally SysRq is 0x46 but for some
>> reason your keyboard is sending 0x9a you can map this by adding the following
>> to the mapping function:
>>
>> 	if (usage->hid == (HID_UP_KEYBOARD | 0x009a))
>> 		map_key_clear(KEY_SYSRQ);
> 
> And the same here, I think. Works with return 1; after the map_key_clear, see the attached function.

Ah yes, I forgot the return 1, sorry about that.

> 
>> Likewise for the sleep combo:
>>
>> 	if (usage->hid == (HID_UP_KEYBOARD | 0x0072))
>> 		map_key_clear(KEY_SLEEP);
> 
> This seems unnecessary, as the sleep combo already emits KEY_SLEEP. Which I don't quite get, cause - if I learned correctly how to read the rdesc - sleep should be on 0x0072 should emit F23 (and 0x0078 sleep), but the key produces the 0x0072 pattern according to hidraw.
> By the way, the Fn+4 for sleep also works in hid-generic, and also just once, see below.

Ok.

>> ###
>>
>> Note chances are you have more Fn + 'letter' combinations at least on
>> the thinkpad10 kbd I have:
>>
>> Fn + T -> SysRq
>> Fn + I -> Insert
>> Fn + P -> Pause
>> Fn + S -> Sysrq
>> Fn + K -> ScrollLock
>> Fn + B -> Pause
>>
>> Note these do not need any special mappings on the thinkpad10 kbd and I guess
>> the doubles may have something to do with some non qwerty keymaps.
> 
> Not the same on this keyboard. I have Fn + {B,K,P,S,End,4} for {Break,ScrLk,Pause,SysRq,Insert,Sleep}, but only SysRq was missing; the others are available on the "default" device, both with hid-lenovo and hid-generic.

Ok.

>>> The ugly:
>>>
>>> Fn+4 ("sleep") triggers the appropriate ACPI event button/sleep and emits something on /dev/hidraw0, too, but *only once*. After resuming, no reaction at all (neither on ACPI nor hidraw) until I unload and reload the hid_lenovo module.
>>
>> As for the sleep key working only once, what happens after a suspend/resume ?
> 
> Nothing. At least nothing I can measure (via evtest, libinput debug-events, cat /dev/hidraw*, dmesg, journal, acpi_listen). The key simply doesn't react anymore.
> Irrespective on how I wake the device. Even irrespective of whether I actually suspend the device or disable the sleep handler altogether, e.g. by systemd-inhibit. In only see the KEY_SLEEP press (no release!) event once until I reload the module or unplug and reattach the keyboard.
> Very strange. And, by the way: the same for hid-generic.
> 
>> I think the key may have some special handling to avoid it sending
>> a second KEY_SLEEP when the user uses it to wakeup the system, to
>> avoid the system immediately going to sleep again when the user tries
>> to wake the system this way.
> 
> Yes, that'd make sense. So probably the handler should restore something; apparently, that part is initialized when the module is loaded, so it's not just the keyboard firmware.

Maybe echo-ing to the fnlock attribute resets the key ? The driver does always force the fnlock LED on when it is loaded.

>>> Finally, keyboard backlight is handled in firmware, apparently; Fn+Space is visible on /dev/hidraw1 (see attached capture), but it toggles the backlight levels without any userspace code involved, as far as I can see.
>>
>> Yes I saw this in your dump, this is really weird because it sets 3 bits at once in the INPUT(3) report.
>> Does it always set the same 3 bits independent of the brightness level ?
> 
> Yes; the four key presses are actually one full cycle over off, auto, dim, and bright. hidraw dumps are identical.
> 
>>> Also, the keyboard backlight doesn't create an entry in /sys/class/backlight or the like, so neither read nor write access. Out-of-the-box, at least. But I'm not even sure if this is possible in Windows.
>>
>> Actuallu kbd-backlighting used the /sys/class/leds interface, but yeah that is not support by Linux ATM for this kbd.
>>
>> Yeah, adding support for that (assuming the hw can do it) would definitely require making some USB dumps under Windows
>> (after finding sw which can change it from within the OS under Windows).
> 
> I double-checked; somewhat unsurprisingly, there is at least a notification client on Windows that displays the new configuration after Fn+Space. The client only reports the setting; not sure if it would be technically feasible to also set the brightness level in software.

We could try asking Nitin if he has any info about this, but I agree that this is a low priority item.

> But anyways: I feel that I exploited your generosity in helping me far enough. I hope I wasn't just fed, but learned a bit how to fish for myself in the future. So, unless you're really committed to walk me through this further, I won't beg any further.
> 
> And in case you're looking for problems to tackle on the Tablet 2nd Gen, this one about the power button could be way more significant - but not sure if it's in an area that you are familiar in:
> https://bbs.archlinux.org/viewtopic.php?id=248857
> https://bugzilla.kernel.org/show_bug.cgi?id=204763

I see that you have already tested the patch which was posted for this, so I assume that this is resolved now ?

>>> Bottom line: this is mostly usable already, modulo the adjustments for the different keys. I'd like to make F10 to F12 work before it hits testing; everything else is icing on the cake, I suppose. Do you have an hint for me how I can approach that?
>>
>> See above, I think we are pretty close to solving this.
> 
> Attached is the modified version of the input mapping for this keyboard, working subject to the above mentioned restrictions. I think this is fine.
> As you did all the real work, I feel this should be your contribution. But of course I can also prepare a patch on top of yours.

I think you're underestimating your own contribution here...

For cases like this we usually add a co-authored tag. Since this applies on top of another hid-lenovo series which I recently send out it is probably easier if I upstream this, that I agree on.

I would like to attribute your work though, so I would like to suggest adding the following 2 tags to the commit msg for
the "HID: lenovo: Add support for Thinkpad X1 Tablet Thin keyboard" patch:

Co-authored-by: Alexander Kobel <a-kobel@a-kobel.de>
Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>

Alternatively I could add:

Reported-and-tested-by: Alexander Kobel <a-kobel@a-kobel.de>

But I believe that co-authored-by + s-o-b are more appropriate.

If you can let me know which one you prefer, then I will drop in your fixed lenovo_input_mapping_x1_tab_kbd() function, remove the WIP from the commit subject and submit the last 2 patches of the set which I send you upstream (the rest was already submitted earlier).

>> Note in the mean time I've posted a hid-lenovo patch-series with various improvements related to
>> the LED handling. I'll send you an offlist mail with the latest patches so that you can base any work you do on top of those.
> 
> Didn't have a look yet, but will do.
> 
>>> Also, I'd make sure that this is about the "ThinkPad X1 Tablet Thin Keyboard **Gen 2**". The consumer functions are different for the **Gen 1** keyboard, so I would also adjust the function names. I do have an old Gen 1 keyboard lying around, but unfortunately it's either broken (it lights up shortly after attaching in Windows, but doesn't report keypresses at all, and pretends to be completely dead in Linux), or it's incompatible with my X1 Tablet 2nd Gen. So I cannot test how your patch might impact the Gen1, too... :-/
>>
>> I would expect the Gen1 to have a different product-id, so my patch shouldn't do anything.
> 
> Right. In this light, perhaps the function should still be called lenovo_input_mapping_x1_tab2_kbd (note the "2")?

Well drivers/hid/hid-ids.h has this:

#define USB_DEVICE_ID_LENOVO_X1_COVER   0x6085
#define USB_DEVICE_ID_LENOVO_X1_TAB     0x60a3
#define USB_DEVICE_ID_LENOVO_X1_TAB3    0x60b5

And I guess that the COVER might be the X1 gen1 product-id ?

Your working kbd is using the USB_DEVICE_ID_LENOVO_X1_TAB id. note not TAB2 just tab.

I don't know, but it is not all that important really, we can always rename both the #define USB_DEVICE_ID_LENOVO_X1_TAB and the function later if there is a reason to do so.

> Thanks a lot,

You're welcome and thank you for helping with improving support for Linux on these devices.

Regards,

Hans


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D5E320BBB
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 17:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhBUQbz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 11:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26469 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229974AbhBUQbx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 11:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613925025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+B4kKsEccOIMUUL/ltVlX6uoj2aIxPmVHpmen99nINI=;
        b=ALrUr3RrY5I2CpXeY9xOu4l5W/dUcr9wlGdsYMbFwBRHxo4daK8WM7hJJ4ttRAbwK2nkGy
        BL7WkkYHqrnamfxwpH79rw0jQU3vXq0RfCOUQiHI/pRUTdXWp2w5bbIxND2fVIV4/ucCzE
        cGLtMC5ULXbhxe32fYicEHwOiIrjRIw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-3jxvBBrwMPyBeG-bJJUTZA-1; Sun, 21 Feb 2021 11:30:21 -0500
X-MC-Unique: 3jxvBBrwMPyBeG-bJJUTZA-1
Received: by mail-ed1-f69.google.com with SMTP id m16so5748520edd.21
        for <linux-input@vger.kernel.org>; Sun, 21 Feb 2021 08:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+B4kKsEccOIMUUL/ltVlX6uoj2aIxPmVHpmen99nINI=;
        b=IGZ1UFcK4OzBBC90YCaYe+p+3wVDYOahsx6QLdpyPIf4So2ywrVcHgFJR0AW2QWlbM
         nTiiHzy3gWQX+N2Rff739inBNFY8v7/gP6TGM6WyzY2WL/O8H6YKFZTYQQgqXol1E5VZ
         kHK5YMroNfai3uK5i3y1rQHlPO0y5iQ6m31bjkiiP7Xlo/hZaMDZXl1qWMtBzWMYEL6L
         jJMK6rWdgio/q084/0erqWSjpMuzttTc/k0j/5NPrdWzDEoTQKuzZY69utXai54xWH2X
         zaK/EH2hrzP5AAbCYYX0g03Q1lQYHeCtNIP3W4TjS81wLK3FrJ1yc4q0zmrGo4mtGkGm
         bL8w==
X-Gm-Message-State: AOAM533KlaOdf9Hj/j4bzbMp0HIlekmGnCBKyzGGOJXFdNx1uVPITjKa
        Rcfa7y8rwHk2Nycmv9hhyhRULA4PxJ9pA+ac9/oRsTj3bqWJsNKO4WtUBycYUSNWiyFmNHPrkNv
        /2pf1tkuv3Ljc3YxRteZIxJC8yj0rGvH9f8CautT5Q2KGBPG8jqZmSacORj57VGKC+ysLtAQdCM
        w=
X-Received: by 2002:a17:906:958:: with SMTP id j24mr16957300ejd.411.1613925020002;
        Sun, 21 Feb 2021 08:30:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwF2Z8fwF5zbCaQ0onJ3b/ugDwx76kQSrA+MEC6NnNpGTyD/QLfq//epPpE21+atBT832bXhA==
X-Received: by 2002:a17:906:958:: with SMTP id j24mr16957265ejd.411.1613925019607;
        Sun, 21 Feb 2021 08:30:19 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w24sm9247181edu.2.2021.02.21.08.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 08:30:19 -0800 (PST)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b61d2451-f9f2-1b2c-bd7b-193713d87dbc@redhat.com>
Date:   Sun, 21 Feb 2021 17:30:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b1392cd8-eefc-4fff-d327-5159714ba304@a-kobel.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/21/21 2:17 PM, Alexander Kobel wrote:
> Hi,
> 
> finally I got to investigate that patch. Thanks for your draft and explanations!
> 
> On 2/12/21 12:42 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 2/9/21 4:16 PM, Alexander Kobel wrote:
>>> Hi,
>>>
>>> On 2/8/21 11:17 AM, Hans de Goede wrote:
>>>> On 2/7/21 6:55 PM, Alexander Kobel wrote:
>>>>> <snip>
>>>>> I'll go off and try to improve.
>>>>
>>>> So Nitin has been kind enough to provide us with some docs for this,
>>>> please see me reply to Nitin's email and lets continue this part of this mail
>>>> thread there.
>>>
>>> Right. I have the other patch ready, thanks to your great help. I'm
>>> waiting for Nitin's okay whether / how much info I can copy from the
>>> reference sheet to source code comments. Once I have that confirmation,
>>> I will post the revised patch.
>>>
>>>> <snip>
>>>>
>>>>> Finally, I mentioned some open ends already on a post to ibm-acpi-devel
>>>>> at https://sourceforge.net/p/ibm-acpi/mailman/message/37200082/; this
>>>>> very question is among them.
>>>>> I will start tackling the SW_TABLET_MODE event issue first, but if Mark
>>>>> and Nitin can already hint about the keyboard shortcuts, it'd be highly
>>>>> appreciated.
>>>>
>>>> I think I might be able to help there, a couple of months ago I bought
>>>> a second-hand thinkpad-10 tablet which also has a USB attached keyboard.
>>>>
>>>> In hindsight I guess I could have asked Mark and Nitin for some more info,
>>>> but I went on autopilot and just ran hexdump -C on the /dev/hidraw node
>>>> to see which events all the keys send.
>>>>
>>>> And I fired up an usb-sniffer under Windows to figure out the audio-leds,
>>>> since I'm used to just figure these things out without help from the vendor :)
>>>
>>> Yeah, why take the boring route if you know how to do all the work on
>>> your own... ;-)
>>>
>>>> See the recent commits here for my work on this:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/hid/hid-lenovo.c
>>>
>>> Thanks, very helpful.
>>>
>>>> So on the ibm-acpi list message you said that the kbd sends the following:
>>>>
>>>> type 4 (EV_MSC), code 4 (MSC_SCAN), value c0001
>>>> type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 1
>>>>
>>>> For the Fn-keys, does it send the same MSC_SCAN code for *all* the
>>>> non-working Fn-keys ?
>>>
>>> Correct. And I can confirm that /dev/hidraw1 lets me distinguish between
>>> the keys.
>>>
>>>> If so then it seems that this is very much like the thinkpad 10 kbd dock
>>>> which also does this, see the lenovo_input_mapping_tp10_ultrabook_kbd()
>>>> function in drivers/hid/hid-lenovo.c .
>>>>
>>>> If I have that right, then I think we should be able to get the
>>>> Fn keys to work without too much trouble. You could try hacking up
>>>> drivers/hid/hid-lenovo.c a bit:
>>>
>>> (Not yet there, but will investigate.)
>>>
>>>> 1. Add an entry to the lenovo_devices array like this:
>>>>
>>>> 	/*
>>>> 	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard part,
>>>> 	 * while letting hid-multitouch.c handle the touchpad and trackpoint.
>>>> 	 */
>>>>         { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>>>>                      USB_VENDOR_ID_LENOVO,
>>>>                      USB_DEVICE_ID_LENOVO_X1_TAB),
>>>>
>>>> 2. Add the following entry to the switch-case in lenovo_input_mapping() :
>>>>
>>>>         case USB_DEVICE_ID_LENOVO_X1_TAB:
>>>>                 return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
>>>>                                                                usage, bit, max);
>>>>
>>>> And then build hid-lenovo.c and modprobe it.
>>>>
>>>> After the modprobe to:
>>>>
>>>> ls -l /sys/bus/hid/devices/0003:17EF:60A3.*/driver
>>>>
>>>> This should show 2 devices (I guess) with one being bound to hid-lenovo
>>>> and 1 being bound to hid-multitouch.
>>>
>>> So far (without patching hid-lenovo), 2 bound to hid-generic and 1 to
>>> hid-multitouch.
>>
>> Ok, so it seems that they kept the thinkpad 10 kbd bits (mostly) with
>> 1 keyboard interface using the usb boot kbd interface (so that it will
>> also work inside the BIOS) and a second interface for multimedia-keys +
>> the mouse emulation of the thinkpad 10 touchpad, those are interfaces
>> 1 and 2, except that they removed the mouse emulation as they added a
>> new proper multi-touch capable touchpad as interface 3; and that one
>> also handles the pointing stick I believe.
>>
>> So yes 2 bound to hid-generic, 1 bound to hid-multitouch seems to be
>> correct.
> 
> Right, that's what I observe.
> 
>>>> If this works some of your Fn + F# keys will now hopefully start doing
>>>> something, you can play around with modifying lenovo_input_mapping_tp10_ultrabook_kbd
>>>> to make it do the right thing for your kbd.
>>>> z
>>>> ###
>>>>
>>>> About LED support, just enabling the LED support bits for the
>>>> USB_DEVICE_ID_LENOVO_TP10UBKBD handling for now might work fine,
>>>> but there is a tiny chance that sending the wrong command somehow puts
>>>> the kbd in firmware update mode, I had that happen once with a Logitech
>>>> kbd which did not seem to have any kind of handshake / passcode to avoid
>>>> accidental fw updates (*).
>>>>
>>>> If you can give me a dump of the hid-descriptors for your keyboard,
>>>> then I can check if that the LEDs might work the same way too (or not).
>>>>
>>>> The easiest way to get a dump is to run the following command as root:
>>>>
>>>> cat /sys/kernel/debug/hid/0003:17EF:60A3.*/rdesc > rdesc
>>>>
>>>> And then attach rdesc to your next email.
>>>
>>> Please find this one attached already now.
>>> In case it helps, the * expands to 0057 0058 0059 on my system.
>>
>> Ok, so there still is an output-report number 9 on the second interface,
>> which probably still controls the LEDS but its descriptors are subtly
>> different. Although different in a good way I guess because the thinkpad
>> 10 dock descriptor describes the 2 bytes in the output report as being
>> in the range of 0-1 which is not how they are actually used.
>>
>> So I think that the code for the Thinkpad 10 ultrabook keyboard as
>> Lenovo calls it, should also work on the X1 tablet thin keyboard.
> 
> Mostly, modulo some key mappings, as expected.
> 
> The good:
> 
> LEDs are working exactly as expected with your patch, with the appropriate triggers automatically active. Perfect!

Good :)

> The bad:
> 
> I could adjust some of the key mappings for the X1 Tablet 2nd keyboard. What I couldn't do is to get Fn+F10, Fn+F11, Fn+F12 and Fn+PrtSc to work.
> Following the logic of /dev/hidraw1 capture (attached), those should be on usage_index 16 to 19. But apparently those are on a different usage page or something like that? Unfortunately, my RTFM skills didn't really help with figuring out how that's supposed to work.
> (Is looking at the bit indices in /dev/hidraw traces how you figure out those mappings? If there's a better way, I'm eager to be told...)

You are swapping to low and high byte of the 3 data bytes in the report. Here is an annotated part of the descriptors to explain better:

  INPUT(3)[INPUT]
    Field(0)
      Application(Consumer.0001)
      Usage(24)
 0        Consumer.0001 F10 00000001 00000000 00000000
 1        Consumer.0001 F11 00000010 00000000 00000000
 2        Consumer.0001 F12 00000100 00000000 00000000
 3        Consumer.0001 Prt 00001000 00000000 00000000
 4        Consumer.0001
 5        Consumer.00e2 F1  00100000 00000000 00000000
 6        Consumer.0001
 7        Consumer.0001
 8        Consumer.0001 ESC 00000000 00000001 00000000
 9        Consumer.0001 F4  00000000 00000010 00000000
10        Consumer.0001 F9  00000000 00000100 00000000
11        Consumer.00b7
12        Consumer.0001
13        Consumer.0001 F7  00000000 00100000 00000000
14        Consumer.0001 F8  00000000 01000000 00000000
15        Consumer.0001 
16        Consumer.0001
17        Consumer.0001
18        Consumer.0001 
19        Consumer.006f F6  00000000 00000000 00001000
20        Consumer.00ea F2  00000000 00000000 00010000
21        Consumer.00e9 F3  00000000 00000000 00100000
22        Consumer.0070 F5  00000000 00000000 01000000
23        Consumer.0001
      Logical Minimum(0)
      Logical Maximum(1)
      Report Size(1)
      Report Count(24)
      Report Offset(0)
      Flags( Variable Absolute )

Notice how the keys with standard codes (which work without mapping)
F1 - F3, F5, F6 now all line up with _none_ Consumer.0001 entries.
And if you check those codes in drivers/hid/hid-input.c around
line 960 you will see the standard mappings line up too.

IOW your case 16 needs to be case 0, case 17, case 1, etc.

> Similarly - I assume - Fn+S should emit SysRq according to https://download.lenovo.com/pccbbs/mobiles_pdf/x1_tablet_gen_2_ug_en.pdf, page 51. This is not on the "consumer control" device, but the usual keyboard, so /dev/hidraw0. Again, couldn't get much further than producing a capture. But I cannot make sense of this one, because way more bits are set, so I cannot extrapolate from your code.

The input report used by the Fn + key "media keys" use a 24 bit report
with 1 bit per key. The standard keyboard interface uses 1 byte per
pressed key (with a maximum of 6 pressed keys) where the full byte
encodes the scancode of the key. Normally SysRq is 0x46 but for some
reason your keyboard is sending 0x9a you can map this by adding the following
to the mapping function:

	if (usage->hid == (HID_UP_KEYBOARD | 0x009a))
		map_key_clear(KEY_SYSRQ);

Likewise for the sleep combo:

	if (usage->hid == (HID_UP_KEYBOARD | 0x0072))
		map_key_clear(KEY_SLEEP);

###

Note chances are you have more Fn + 'letter' combinations at least on
the thinkpad10 kbd I have:

Fn + T -> SysRq
Fn + I -> Insert
Fn + P -> Pause
Fn + S -> Sysrq
Fn + K -> ScrollLock
Fn + B -> Pause

Note these do not need any special mappings on the thinkpad10 kbd and I guess
the doubles may have something to do with some non qwerty keymaps.

> The ugly:
> 
> Fn+4 ("sleep") triggers the appropriate ACPI event button/sleep and emits something on /dev/hidraw0, too, but *only once*. After resuming, no reaction at all (neither on ACPI nor hidraw) until I unload and reload the hid_lenovo module.

As for the sleep key working only once, what happens after a suspend/resume ?

I think the key may have some special handling to avoid it sending
a second KEY_SLEEP when the user uses it to wakeup the system, to
avoid the system immediately going to sleep again when the user tries
to wake the system this way.

> Finally, keyboard backlight is handled in firmware, apparently; Fn+Space is visible on /dev/hidraw1 (see attached capture), but it toggles the backlight levels without any userspace code involved, as far as I can see.

Yes I saw this in your dump, this is really weird because it sets 3 bits at once in the INPUT(3) report.
Does it always set the same 3 bits independent of the brightness level ?

> Also, the keyboard backlight doesn't create an entry in /sys/class/backlight or the like, so neither read nor write access. Out-of-the-box, at least. But I'm not even sure if this is possible in Windows.

Actuallu kbd-backlighting used the /sys/class/leds interface, but yeah that is not support by Linux ATM for this kbd.

Yeah, adding support for that (assuming the hw can do it) would definitely require making some USB dumps under Windows
(after finding sw which can change it from within the OS under Windows).

> Bottom line: this is mostly usable already, modulo the adjustments for the different keys. I'd like to make F10 to F12 work before it hits testing; everything else is icing on the cake, I suppose. Do you have an hint for me how I can approach that?

See above, I think we are pretty close to solving this.

Note in the mean time I've posted a hid-lenovo patch-series with various improvements related to
the LED handling. I'll send you an offlist mail with the latest patches so that you can base any work you do on top of those.

> Also, I'd make sure that this is about the "ThinkPad X1 Tablet Thin Keyboard **Gen 2**". The consumer functions are different for the **Gen 1** keyboard, so I would also adjust the function names. I do have an old Gen 1 keyboard lying around, but unfortunately it's either broken (it lights up shortly after attaching in Windows, but doesn't report keypresses at all, and pretends to be completely dead in Linux), or it's incompatible with my X1 Tablet 2nd Gen. So I cannot test how your patch might impact the Gen1, too... :-/

I would expect the Gen1 to have a different product-id, so my patch shouldn't do anything.

>> I've prepared a set of patches which enable the tp10ubkbd code on
>> the X1 tablet thin keyboard. But beware as mentioned before there is a
>> tiny chance that sending the wrong command somehow puts the kbd in
>> firmware update mode. I believe that trying the tp10ubkbd code is safe,
>> esp. since this is using a 2 byte large output report and using that
>> for fw-updating would be a bit weird. Still there is a small risk
>> (there always is when poking hw) so I will leave it up to you if
>> you are willing to try this.
> 
> No issue at all, and everything below works just as expected.

Good.

Regards,

Hans


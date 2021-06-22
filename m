Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31263B01AD
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 12:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhFVKs2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Jun 2021 06:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23735 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229746AbhFVKs1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Jun 2021 06:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624358766;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F95mv06Qfw9FE8qSqdUyFC5s+2HfCly3wmTGY+I8Tyw=;
        b=XrjJzF+uj979Wcuf4W0nXTNIqMsR4FiQLc/7U8ztnCSG4M1ezvIRsv1BV9IB502ala/60L
        vDJWqZER1y1wBvH3UMhIDvhCO0MrqFk7wnYQgAQlnCawdEq33pmljrAaz0z64y+y/WyJwA
        vakTgzDv3/9ZT5npWgSfUHbinm48ZA4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-YLBjcNRnNtqN4Xxq6KLkVg-1; Tue, 22 Jun 2021 06:46:05 -0400
X-MC-Unique: YLBjcNRnNtqN4Xxq6KLkVg-1
Received: by mail-ej1-f71.google.com with SMTP id ci22-20020a170906c356b0290492ca430d87so2514225ejb.14
        for <linux-input@vger.kernel.org>; Tue, 22 Jun 2021 03:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F95mv06Qfw9FE8qSqdUyFC5s+2HfCly3wmTGY+I8Tyw=;
        b=IbCFMzZq0EuFWupgBiEF913MeA4DBlT8TmU+jsj0aubf1L0qUpnmzpj3zOUp/si4/J
         UT1GjP9FUEhB9X/7bNitfVTeHKqshqSxb1mH+OTKhH8ucptjRi+37rGPz38dnhYGo6sb
         i8074OYBjHALn7UDaxrigRJ/B46Al0ckKvhV3Jl/HFtN/8huwPFn1fcR516qoNewK/4N
         DnpvFcbdPyQAtTBvcD+SYZkKQ2JhloTSNg0k4Irn9AEZnKr4TTIXWa4th4gVrmFUhjO+
         8Hei0T7q0ZpTDSUnrVP8KJvCb76T6L+G1P7HiLyxONmg/EhCYJh64Pb9WLrmL50/79T8
         R9eA==
X-Gm-Message-State: AOAM530OGixRp2IZy+xdGGbPBDrfmswqGOxZEIHyPfMJ4+o2QLXLBL5B
        e/siF2pOxCqdZRViDU0yHF6GU4W5lPFxBz5TXQWi4kdEdwOupt7zPWgEyFyl77B7VJ69APK/veo
        aFo1NYEpR39usb4zq57t3HZ7dGs7I0NkRC3QJ244CMY6h6yuNM7VRQSb/Ac4gdBVgApsCJORfhy
        k=
X-Received: by 2002:a17:906:7b83:: with SMTP id s3mr3309384ejo.190.1624358764018;
        Tue, 22 Jun 2021 03:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyta8Gs3WoSSkCisp66z25f/bLa8LVcX5wHjFYSfP/wBKiErcVfq6IVsGKnRuPtF/XurvHfWg==
X-Received: by 2002:a17:906:7b83:: with SMTP id s3mr3309365ejo.190.1624358763757;
        Tue, 22 Jun 2021 03:46:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ml14sm1832678ejb.27.2021.06.22.03.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 03:46:03 -0700 (PDT)
Subject: Re: input devices vs. keyboard backlights [WAS: [PATCH v2]
 platform/x86: add support for Acer Predator LEDs]
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        leo60228 <leo@60228.dev>, platform-driver-x86@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-input@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
 <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
 <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
 <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
 <0148a2e3-c91e-7422-df3d-6942c38334ed@redhat.com>
 <436b87c1-5c24-05ce-98fd-c3664c7765e2@metux.net>
 <5661323e-9a75-cbbe-0e16-777355bba9f5@redhat.com>
 <45deb019-aca4-cddb-8edf-ae2987e31d7f@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6a734b7a-305f-3efb-bebf-c1a3a6782bfa@redhat.com>
Date:   Tue, 22 Jun 2021 12:46:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <45deb019-aca4-cddb-8edf-ae2987e31d7f@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 6/22/21 12:19 PM, Enrico Weigelt, metux IT consult wrote:
> On 21.06.21 21:43, Hans de Goede wrote:
> 
> Hi,
> 
>> The LED API actually has specific features which are typically
>> only used with kbd-backlights, such as the brightness_hw_changed
>> attribute which was specifically added to allow userspace to
>> monitor when a laptops embedded controller changes the kbd-backlight
>> brightness in response to a Fn + somekey hotkey keypress, so that
>> userspace can show an on-screen-display notification that the
>> kbd brightness has changed (like how it typically does for
>> audio volume changes too) and also showing the new brightness
>> level. See: Documentation/ABI/testing/sysfs-class-led for
>> the docs for the /sys/class/leds/<led>/brightness_hw_changed
> 
> yes, that's great. but it seems we're still lacking a direct standard
> way for associating an input device with the corresponding backlight
> LED.

True.

> Or am I missing something ?

In most cases the lacking way to associate the 2 is not a problem
because almost all systems have only a single keyboard backlight
and all existing standard Linux userspace code around kbd-backlights
(like upower) has been written with this assumption.

This is actually a problem when you plug in a fancy USB kbd with
backlight into a laptop where the laptop kbd also has a backlight ...

Fixing this would be great, but it requires fixes all over
the stack and associating the backlight with a specific kbd
is probably the smallest of the issues to solve here.

>>> Looks like a very complicated way to do that. But actually I've never
>>> understood why I should use this strange upower thing anways :p
>>
>> Just because you don't have a use for it does not mean that it
>> is not useful (and widely used) in cases where people use Linux
>> as a desktop OS, rather then for more embedded cases.
> 
> I'm actually using Linux on desktop for over 25 years now.
> 
> But let's go back to the kernel side.
> 
>>> In general, LED class isn't so bad, as it already gives us LED control
>>> (*1), but I don't see any portable way for finding the corresponding
>>> LED for some input device. In DRM I see the backlight as subdevice.
>>
>> With USB-HID keyboards the LED class device will have the same HID-device
>> as parent as the input device. If there is no HID parent-device, then any
>> foo_kbd_backlight device will belong to the atkbd (PS/2) input-device.
> 
> Still a lot of if's and guessing :(
> 
> Why can't we make it appear the same way like the other leds (eg. caps-
> lock) ?
> Here's how it looks on my Portege:
> 
> | ~ ls -l /dev/input/input0:

So you have an input0 symlink under /dev/input to /sys/class/input/input0/
that is non standard, but that is not really relevant you get the same
output if you directly do:

ls -l /sys/class/input/input0/

> |
> | drwxr-xr-x 2 root root    0 Jun 22 11:42 capabilities
> | lrwxrwxrwx 1 root root    0 Jun 22 11:42 device -> ../../../serio0
> | drwxr-xr-x 3 root root    0 Jun 22 11:42 event0
> | drwxr-xr-x 2 root root    0 Jun 22 11:42 id
> | drwxr-xr-x 3 root root    0 Jun 22 11:37 input0::capslock
> | drwxr-xr-x 3 root root    0 Jun 22 11:42 input0::numlock
> | drwxr-xr-x 3 root root    0 Jun 22 11:42 input0::scrolllock
> | -r--r--r-- 1 root root 4096 Jun 22 11:42 modalias
> | -r--r--r-- 1 root root 4096 Jun 22 11:42 name
> | -r--r--r-- 1 root root 4096 Jun 22 11:42 phys
> | drwxr-xr-x 2 root root    0 Jun 22 11:42 power
> | -r--r--r-- 1 root root 4096 Jun 22 11:42 properties
> | lrwxrwxrwx 1 root root    0 Jun 22 11:42 subsystem ->
> ../../../../../../class/input
> | -rw-r--r-- 1 root root 4096 Jun 22 11:42 uevent
> | -r--r--r-- 1 root root 4096 Jun 22 11:42 uniq
> 
> I'd imagine also having some "input0::backlight" here.
> 
> These leds seem to be sub-devices of the keyboard device,

They are child devices of the input-device instantiated for the
keyboard device, the keyboard device itself is likely actually:

/sys/devices/platform/i8042/serio0

If you do "ls -l /sys/class/input/input0" then you will see
that this is a symlink pointing to

/sys/devices/platform/i8042/serio0/input/input0

The LED class devices for the kbd LEDs are instantiated
by the input-subsys itself, hence they use the input-device
as parent.

For HID based keyboards the HID device which is the parent
of the input-device will also be the parent of the kbd-backlight
LED class device since both are instantiated by the HID driver.

E.g. if I plug in a Logitech G510 keyboard I get this:

[hans@x1 ~]$ ls -l /sys/bus/hid/devices/0003:046D:C22D.000D/{leds,input}/
'/sys/bus/hid/devices/0003:046D:C22D.000D/input/':
total 0
drwxr-xr-x. 6 root root 0 Jun 22 12:32 input53
drwxr-xr-x. 6 root root 0 Jun 22 12:32 input54

'/sys/bus/hid/devices/0003:046D:C22D.000D/leds/':
total 0
drwxr-xr-x. 3 root root 0 Jun 22 12:32 g15::kbd_backlight
drwxr-xr-x. 3 root root 0 Jun 22 12:32 g15::macro_preset1
drwxr-xr-x. 3 root root 0 Jun 22 12:32 g15::macro_preset2
drwxr-xr-x. 3 root root 0 Jun 22 12:32 g15::macro_preset3
drwxr-xr-x. 3 root root 0 Jun 22 12:32 g15::macro_record
drwxr-xr-x. 3 root root 0 Jun 22 12:32 g15::power_on_backlight_val

So the input and LED class devices can already be associated
with each other by finding a common parent. This is not
unusual, this is e.g. also how video4linux tv-apps like
xawtv and tvtime find the alsa record/input device to get
the audio from the tvcard, they look for an alsa device
which has the same parent (which can be either USB or PCI)
as the /dev/video# device from which they are grabbing the
video.

As I already mentioned, this linking the 2 by finding a
common parent works fine for HID devices, but is a problem
for laptops with a PS/2 kbd + embedded-controller controlled
kbd-backlight since on one hand we have the PS/2 stack and
on the other hand we have some drivers/platform/x86 driver
talking some vendor specific ACPI (or WMI or some-such)
interface to the embedded-controller for controlling the
kbd-backlight. So in this case we have to fallback to
some heuristics and guess that the kbd-backlight belongs
to the keyboard registered by the atkbd driver.

Now we could make the kernel do this heuristics for us
and have it register a symlink but that brings interesting
questions like which code is going to be responsible for
registering the symlink + possible probe-ordering issues
between the 2 drivers; and it would still be just a
heuristic, which will likely need some quirk tables for
some exceptions.

We are simply better of handling these heuristics in
userspace, so that we can e.g. use hwdb for any quirks.

We could even have a udev rule adding a symlink if that
is seen as useful, but I don't believe that these kinda
heuristics belong in the kernel.

Regards,

Hans


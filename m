Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA77F312ECF
	for <lists+linux-input@lfdr.de>; Mon,  8 Feb 2021 11:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhBHKVc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Feb 2021 05:21:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50777 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232021AbhBHKT2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Feb 2021 05:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612779480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nsplxaRDtKAAkbOz3qiY8e9OTVA7rBqISeIiP7kozAE=;
        b=gOjfoTd3cYCJazfFZA21DwH5xQoawWVBE08U0G+POZaQwoGa9EHP7H5ZNVJb5LwBAOTqIa
        ox8t/TUV63aONZ1cBb0rrO73ZH0WYxdgMBcEAgXemEIg9L5vyRx6TykR8lL+pbMTvxV423
        Q+cMr+Xp1Kdi4nWWftnFRYGyhmpjYcU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-r4vADsNGODqk_JOMEr8uGA-1; Mon, 08 Feb 2021 05:17:58 -0500
X-MC-Unique: r4vADsNGODqk_JOMEr8uGA-1
Received: by mail-ej1-f69.google.com with SMTP id w16so11307789ejk.7
        for <linux-input@vger.kernel.org>; Mon, 08 Feb 2021 02:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nsplxaRDtKAAkbOz3qiY8e9OTVA7rBqISeIiP7kozAE=;
        b=YXgh+sie9UaICk5E5h97qjB8vR48UeF5nEpDu8IKh1+A45PayMwQTwulVvnZ0oDmcM
         vazNiRy0VB3ktR3NS8wKOWVHr45xe9UtbJR9vBa61zxAhiRvay0Gj0BTgHH7680nCtqG
         oHVR3H11I0zdbnQqmBACY9irWH36K4sIKirdiOgWNEF0pzw4amuwaREg8SjLTFb42ocB
         +eH8rhAEv+f24fv28WR0K1WPfRNzC6NpckOtSlXxjcZC9o3GMRkhWGNaU4KiWeVOvr2s
         gl/TBIJJ+mUdeePPg3Fm6j1J7PHKKK4PY4uMxAt5/d5TpFO2mZyiEeCAIOfX/k79mpbi
         0zVw==
X-Gm-Message-State: AOAM53144dvr56iaDa0dNRse153+BUnHzKSakSI8VkdT+fLoGgyIgT3D
        k55U0UyXNHkYZjXxRccdgjTxMOwXJnmryTlKx0eXCc22xb98qd+g9ZjSkHqHiJoPyfEUGizvmCK
        E4bFUUOnvN3TqZxrjUHGC2aWyng1TnAw8I52/eqU8d449B1YNg2a9rcgnYhxRoACEoZzXTBOZ+L
        c=
X-Received: by 2002:a17:907:9614:: with SMTP id gb20mr1869788ejc.157.1612779477251;
        Mon, 08 Feb 2021 02:17:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkYi4kM/dAoc6sY/PAi2RT1L1H/Lc+6uB0mcrVzsCCrmezd1sPlubAXc5cc3Ev+he1vAut3A==
X-Received: by 2002:a17:907:9614:: with SMTP id gb20mr1869755ejc.157.1612779476889;
        Mon, 08 Feb 2021 02:17:56 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ha21sm2331964ejb.97.2021.02.08.02.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 02:17:56 -0800 (PST)
Subject: Support for X1 tablet keyboard (was Re: [PATCH] platform/x86:
 thinkpad_acpi: handle HKEY 0x4012, 0x4013 events)
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Message-ID: <be3f6a0f-281f-975f-70c2-b167adb5547c@redhat.com>
Date:   Mon, 8 Feb 2021 11:17:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/7/21 6:55 PM, Alexander Kobel wrote:
> Hi,
> 
> On 2/7/21 6:10 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 2/7/21 5:34 PM, Alexander Kobel wrote:
>>> Those events occur when a keyboard cover is attached to a ThinkPad
>>> Tablet device.  Typically, they are used to switch from normal to tablet
>>> mode in userspace; e.g., to offer touch keyboard choices when focus goes
>>> to a text box and no keyboard is attached, or to enable autorotation of
>>> the display according to the builtin orientation sensor.
>>
>> Thank you for your patch.
> 
> Thank you for your swift response.

You're welcome.

>>> No attempt is taken to emit an EV_SW event for SW_TABLET_MODE; this is
>>> left to userspace.
>>
>> I don't understand this part, in order for userspace to respond to these
>> events the thinkpad_acpi driver needs to emit events for this; and emitting
>> SW_TABLET_MODE seems like it is the right thing to do.
>>
>> Why are you not doing this ?
> 
> Quite frankly, because I did not know how to, reliably.  (First ever
> patch attempt to the kernel here, so I'd rather err on the safe side.)
> 
> There are a number of events (e.g., TP_HKEY_EV_HOTPLUG_DOCK) that do not
> propagate to userspace, but only report a specific message.  I figured
> it's better to have a meaningful entry in the log rather than just the
> warning about an unknown event.
> But on second thought: pretending to react, but not actually doing
> something, isn't too valuable.
> 
> I'll go off and try to improve.

So Nitin has been kind enough to provide us with some docs for this,
please see me reply to Nitin's email and lets continue this part of this mail
thread there.

<snip>

> Finally, I mentioned some open ends already on a post to ibm-acpi-devel
> at https://sourceforge.net/p/ibm-acpi/mailman/message/37200082/; this
> very question is among them.
> I will start tackling the SW_TABLET_MODE event issue first, but if Mark
> and Nitin can already hint about the keyboard shortcuts, it'd be highly
> appreciated.

I think I might be able to help there, a couple of months ago I bought
a second-hand thinkpad-10 tablet which also has a USB attached keyboard.

In hindsight I guess I could have asked Mark and Nitin for some more info,
but I went on autopilot and just ran hexdump -C on the /dev/hidraw node
to see which events all the keys send.

And I fired up an usb-sniffer under Windows to figure out the audio-leds,
since I'm used to just figure these things out without help from the vendor :)

See the recent commits here for my work on this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/hid/hid-lenovo.c

So on the ibm-acpi list message you said that the kbd sends the following:

type 4 (EV_MSC), code 4 (MSC_SCAN), value c0001
type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 1

For the Fn-keys, does it send the same MSC_SCAN code for *all* the
non-working Fn-keys ?

If so then it seems that this is very much like the thinkpad 10 kbd dock
which also does this, see the lenovo_input_mapping_tp10_ultrabook_kbd()
function in drivers/hid/hid-lenovo.c .

If I have that right, then I think we should be able to get the
Fn keys to work without too much trouble. You could try hacking up
drivers/hid/hid-lenovo.c a bit:

1. Add an entry to the lenovo_devices array like this:

	/*
	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard part,
	 * while letting hid-multitouch.c handle the touchpad and trackpoint.
	 */
        { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
                     USB_VENDOR_ID_LENOVO,
                     USB_DEVICE_ID_LENOVO_X1_TAB),

2. Add the following entry to the switch-case in lenovo_input_mapping() :

        case USB_DEVICE_ID_LENOVO_X1_TAB:
                return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
                                                               usage, bit, max);

And then build hid-lenovo.c and modprobe it.

After the modprobe to:

ls -l /sys/bus/hid/devices/0003:17EF:60A3.*/driver

This should show 2 devices (I guess) with one being bound to hid-lenovo
and 1 being bound to hid-multitouch.

If this works some of your Fn + F# keys will now hopefully start doing
something, you can play around with modifying lenovo_input_mapping_tp10_ultrabook_kbd
to make it do the right thing for your kbd.

###

About LED support, just enabling the LED support bits for the
USB_DEVICE_ID_LENOVO_TP10UBKBD handling for now might work fine,
but there is a tiny chance that sending the wrong command somehow puts
the kbd in firmware update mode, I had that happen once with a Logitech
kbd which did not seem to have any kind of handshake / passcode to avoid
accidental fw updates (*).

If you can give me a dump of the hid-descriptors for your keyboard,
then I can check if that the LEDs might work the same way too (or not).

The easiest way to get a dump is to run the following command as root:

cat /sys/kernel/debug/hid/0003:17EF:60A3.*/rdesc > rdesc

And then attach rdesc to your next email.

Regards,

Hans





*) Luckily it at least had a separate firmware-bootlader mode in which it
was stuck now, so with some cmdline magic to force an upgrade the Windows
fw installer could still fix it.


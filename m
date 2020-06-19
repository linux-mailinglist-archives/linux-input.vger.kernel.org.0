Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742702005CE
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 11:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732205AbgFSJ4m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 05:56:42 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26481 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729195AbgFSJ4h (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 05:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592560594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0uygxMg2BKhOGRuUrDX8E5FMxfmWNXMVkQ55v7zHdKI=;
        b=ZXlXqpcmSNXxbqvQ8PfboaBS1c/T+9zJDGxCH2PesBilMZfpNWut6MbP2Rfom+QbIkZec/
        K/rpzwZpMjxnvVVKiMdr6xXVPZTSDCqv84PTX17FIQT+Nxz5kLyvKPIe+6A4vHy2lcw3+T
        6KIljn7M3bIksc73NuOD3cIuPmgZIwE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-RJBuCwq_P6qitP7YFzm88g-1; Fri, 19 Jun 2020 05:56:30 -0400
X-MC-Unique: RJBuCwq_P6qitP7YFzm88g-1
Received: by mail-ej1-f69.google.com with SMTP id do21so3812243ejc.2
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 02:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0uygxMg2BKhOGRuUrDX8E5FMxfmWNXMVkQ55v7zHdKI=;
        b=RFcsWiX/yCoZWtI+b3nDgjtlFyvU5T1GxnINJsuUUkiGyCPNL0Il/nC9YNBFDtxB9j
         FJi6zU+6yyYZBX6GGsEbvpi3GNR4YMcDyWMy7W441vwgYe68Cm+gjsc/mJ04PwupQg6I
         n01moELPIvcaTYOuuu7ZLfdZCztpV75HiX3dV7y2bAuQVM7LQ+u8n6Hvaz53DzmzKeBL
         NAjCAcbNAhh6OofWoBX+3BINh6hUnt8/VHxYZ2j8NPIgc0XZ+kJkiicY4ZndVSu6gllP
         JKA7L69mKW3umnKBgR4KDAeQK1I8PcntoK0sc+6FvatopWa93iwHVwitLEkXKuGALv6H
         mWHg==
X-Gm-Message-State: AOAM530JVR8SmHbEWQZ0g7+Vq8lnmKVNlobFMdsG1Obviq5SsIDTjJYx
        tGEbSPacs+NlCUpfzb1B4kJ5JFKqKjfcOBNmuxLBRNm0EZiHDyCPQCOiHWSMef25c4w77PVAbJX
        mauq4O2UKS2ZuuOOpSIih6yw=
X-Received: by 2002:a05:6402:1217:: with SMTP id c23mr2414506edw.270.1592560589025;
        Fri, 19 Jun 2020 02:56:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw54L2OA1nLGJwIfcYX5qZvGLTQ4nslL4X0cYAEyiTaN4ih29wN8yvvMapO77NpbRirjNjMDg==
X-Received: by 2002:a05:6402:1217:: with SMTP id c23mr2414483edw.270.1592560588655;
        Fri, 19 Jun 2020 02:56:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n25sm4290635edo.56.2020.06.19.02.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 02:56:27 -0700 (PDT)
Subject: Re: [PATCH v3] HID: i2c-hid: Enable touchpad wakeup from
 Suspend-to-Idle
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Pavel Balan <admin@kryma.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200618145515.5055-1-kai.heng.feng@canonical.com>
 <c280d8b5-05bf-e560-51df-c57edeffe8a3@redhat.com>
 <FAF68BF5-FCBC-4D08-AF0F-98EEA209BB86@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1f96c309-cd64-6b84-1240-e67849637a50@redhat.com>
Date:   Fri, 19 Jun 2020 11:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <FAF68BF5-FCBC-4D08-AF0F-98EEA209BB86@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 6/19/20 6:16 AM, Kai-Heng Feng wrote:
> Hi,
> 
>> On Jun 18, 2020, at 23:28, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 6/18/20 4:55 PM, Kai-Heng Feng wrote:
>>> Many laptops can be woken up from Suspend-to-Idle by touchpad. This is
>>> also the default behavior on other OSes.
>>> So let's enable the wakeup support if the system defaults to
>>> Suspend-to-Idle.
>>
>> I have been debugging a spurious wakeup issue on an Asus T101HA,
>> where the system would not stay suspended when the lid was closed.
>>
>> The issue turns out to be that the touchpad is generating touch
>> events when the lid/display gets close to the touchpad. In this case
>> wakeup is already enabled by default because it is an USB device.
> 
> Sounds like a mechanical/hardware issue to me.

Nope, the laptop is pretty much in new state.

> I've seen some old laptops have the same issue.
> 
> Swollen battery can push up the touchpad, makes it contact to touchscreen, and wakes up the system.

This is a 2-in-1 with a detachable keyboard, which is why the
kbd/touchpad is a USB device rather then i2c-hid. Even if the
battery were swollen this would push up the back cover of the
tablet.

>> So I do not believe that this is a good idea, most current devices
>> with a HID multi-touch touchpad use i2c-hid and also use S2idle,
>> so this will basically enable wakeup by touchpad on almost all
>> current devices.
> 
> However, it's really handy to wake up the system from touchpad.

I agree this is somewhat handy, but the keyboard (space-bar) is
usually sitting right next to it. So we can live without it,
we really need to fix the spurious wakeup issue first, once
that is fixed I'm fine with enabling wakeup by touchpad.

>> There will likely be other devices with the same issue as the T101HA,
>> but currently we are not seeing this issue because by default i2c-hid
>> devices do not have wakeup enabled. This change will thus likely cause
>> new spurious wakeup issues on more devices. So this seems like a
>> bad idea.
> 
> But only under lid is closed?

Right.

> I wonder if it's okay to handle the case in s2idle_loop() or in userspace?
> Lid close -> Wakeup event from touchpad -> Found the lid is closed
> -> Turn off touchpad wakeup -> continue suspend.

I've discussed doing something about the spurious wakeup issue in
the kernel with the the kernel input maintainer (Dmitry) here:

https://lore.kernel.org/linux-acpi/964ca07a-3da5-101f-7edf-64bdeec98a4b@redhat.com/

He was quite clear that this must be fixed in userspace. We did
come up with a plan for fixing this in userspace:

1) Have udev-rules setting using hwdb for quirks which tags
some input devices as "input-disable-wake-on-closed-lid".
A simple udev rule could tag all i2c-hid touchpads with this and
for the detachable USB keyboards with builtin touchpad some
2-in-1s have we can then use quirks in hwdb to set the tag
on those.

2) Teach systemd-logind which does the suspend-on-lid on modern
GNOME3 based systems to disable wakeup on the parent of
input-devices which have this tag set before suspending.

As mentioned the kernel can then also use this to save
some power by disable scanning for fingers on suspend.

If you have time to work on these 2 items, that would be
great. Once this is in place I'm fine with the suggested
kernel change.

###

Semi-off-topic:

The thread I linked to above is about adding a new inhibit
feature to the input system, which is intended to allow
telling the input system system to stop listening for
events even if userspace has the device open (or it has
in kernel listeners) once this has landed, we can use
the same udev-tag to also teach systemd-logind to inhibit
e.g. the touchpad when the lid is closed but the system is
not suspending (e.g. external monitor connected).
Combined with some extra hid-multitouch changes this will
again allow us to tell the touchpad to stop scanning
for fingers saving some power.

The inhibit feature could likewise also be enabled on
internal touchpads and keyboards when a 360 degree (yoga)
style 2-in-1 is in tablet mode to avoid accidental key-pressed /
touchpad touches.

Note the inhibit when in tablet mode thing would require
a new: "input-inhibit-on-tablet-mode" tag. At first I
was thinking to just have an "input-device-is-internal"
tag, but that would e.g. also apply to the touchscreen,
on which we do want to disable wakeup when the lid is
closed, but not when in tablet mode.

Hmm, I guess to prepare for the inhibit stuff we should
probably call the other tag "input-inhibit-on-closed-lid"
rather then "input-disable-wake-on-closed-lid", and then
systemd-logind can defer that wit should also disable wake
(or initially only disable wake) from that. Otherwise we
get 4 possible tags and I don't see a usecase where we
want to inhibit but not also disable wakeup.

>> Also your commit message mentions touchpads, but the change
>> will also enable wakeup on most touchscreens out there, meaning
>> that just picking up a device in tablet mode and accidentally
>> touching the screen will wake it up.
> 
> I tried touch and i2c-hid touchscreen and it doesn't wake up the system.

I guess the :

         i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);

Call from i2c_hid_suspend() causes that, interesting that that
works for touchscreens but not for touchpads.

I'm pretty sure that if you comment out that line, your
patch will cause wake-ups on touchscreens too, which
IMHO means that your patch should maybe move the above
call into the else of the:

         if (device_may_wakeup(&client->dev)) {

block, if we enable wakeup then it should work. This should
probably be combined with being smarter about which devices
to enable wakeup on by default...

> However we should still handle the two different cases, probably differentiate touchpad and touchscreen in hid-multitouch.

Ack, see above.

>> Also hid multi-touch devices have 3 modes, see the diagrams
>> in Microsoft hw design guides for win8/10 touch devices:
>> 1. Reporting events with low latency (high power mode)
>> 2. Reporting events with high latency (lower power mode)
>> 3. Not reporting events (lowest power mode)
>>
>> I actually still need to write some patches for hid-multitouch.c
>> to set the mode to 2 or 3 on suspend depending on the device_may_wakeup
>> setting of the parent. Once that patch is written, it should
>> put most i2c-hid mt devices in mode 3, hopefully also helping
>> with Linux' relative high power consumption when a device is
>> suspended. With your change instead my to-be-written patch
>> would put the device in mode 2, which would still be an
>> improvement but less so.
> 
> IIRC, touchpad and touchscreen connect to different parents on all laptops I worked on.
> So I think it's possible to enable mode 2 for touchpad, and mode 3 for touchscreen.

Ack.

> Touchpad wake is really handy, let's figure out how to enable it while covering all potential regression risks.

See above I believe we should first get the userspace bits to disable it
when the lid is closed in place.  And even then we may need to have
a Kconfig option to disable it for people running an older userspace,
but I guess once the userspace bits are there, we can proceed without
the Kconfig option and then add that later if necessary (if people are
seeing regressions).

Regards,

Hans


>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> ---
>>> v3:
>>>   - Use device_init_wakeup().
>>>   - Wording change.
>>> v2:
>>>   - Fix compile error when ACPI is not enabled.
>>>   drivers/hid/i2c-hid/i2c-hid-core.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> index 294c84e136d7..dae1d072daf6 100644
>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> @@ -931,6 +931,12 @@ static void i2c_hid_acpi_fix_up_power(struct device *dev)
>>>   		acpi_device_fix_up_power(adev);
>>>   }
>>>   +static void i2c_hid_acpi_enable_wakeup(struct device *dev)
>>> +{
>>> +	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)
>>> +		device_init_wakeup(dev, true);
>>> +}
>>> +
>>>   static const struct acpi_device_id i2c_hid_acpi_match[] = {
>>>   	{"ACPI0C50", 0 },
>>>   	{"PNP0C50", 0 },
>>> @@ -945,6 +951,8 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
>>>   }
>>>     static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
>>> +
>>> +static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
>>>   #endif
>>>     #ifdef CONFIG_OF
>>> @@ -1072,6 +1080,8 @@ static int i2c_hid_probe(struct i2c_client *client,
>>>     	i2c_hid_acpi_fix_up_power(&client->dev);
>>>   +	i2c_hid_acpi_enable_wakeup(&client->dev);
>>> +
>>>   	device_enable_async_suspend(&client->dev);
>>>     	/* Make sure there is something at this address */
>>
> 


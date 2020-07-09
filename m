Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B701219815
	for <lists+linux-input@lfdr.de>; Thu,  9 Jul 2020 07:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgGIFqN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 9 Jul 2020 01:46:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52490 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgGIFqM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jul 2020 01:46:12 -0400
Received: from mail-pf1-f199.google.com ([209.85.210.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jtPNX-0001D9-GH
        for linux-input@vger.kernel.org; Thu, 09 Jul 2020 05:46:08 +0000
Received: by mail-pf1-f199.google.com with SMTP id o9so631434pfp.6
        for <linux-input@vger.kernel.org>; Wed, 08 Jul 2020 22:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=M1ifysLgqDXDbHGxHKCsWQJw7BE7GNKc4IqGaASIT3Y=;
        b=qZYtB/lcBmbSx3fXNG2CM8Hit4bu/Pt2NSRcUsdVHg3wgCnN7hydSCx6ka4hb+oZC1
         8o8VLFFTMRPp1SysUO9rNlIMsAS3p0N51XEsMTk9r+TApCSNvyfmORLYaGNL2q2yiO4n
         zYHcU4q9+BlBMe/1Aj5q8WtvunEFnBZokwrQ15f1pWC9yIvVcuuc2n3gRbwoRLUgu8ZC
         4J4/T+QOUL7g2G2bTI39p/Qdh1v9Lj2GmWljvbz6pmelAXow00FyLKSI9JEtgS+yzsAB
         ZU+Gn2JTsc/DpHrBjjyHQRLafkgDbKiZKyLHj5s5Q5YQhgJCThNLZOz02TSKoBSrOnyT
         XsdQ==
X-Gm-Message-State: AOAM533sMUakHAcfpeoTTLOMBZcRWjcMdl2U6KNP9uo/3wLujm/PTYJa
        dkdWYae5PDyZxXjCu0G40gxp1Npjck2m+yiZQn2iKiyysYOVUDiB09Rugnsy1gn2ypSHdvMYd4h
        bkFUPU6WRTvLjZeUMlZY6tyW2+YDyyg6wpVe/xc/m
X-Received: by 2002:a62:5c02:: with SMTP id q2mr57929598pfb.232.1594273549857;
        Wed, 08 Jul 2020 22:45:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHvgLX9hYV2dgfBhwcMOIE14zeCsxGzP5SsryM3LrvJxy2yhP5bIIYNf/XlrjSvgnXPYAlhg==
X-Received: by 2002:a62:5c02:: with SMTP id q2mr57929566pfb.232.1594273549232;
        Wed, 08 Jul 2020 22:45:49 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id s6sm1384654pfd.20.2020.07.08.22.45.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 22:45:48 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] HID: i2c-hid: Enable touchpad wakeup from
 Suspend-to-Idle
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <3eafb89f-b711-0505-e7a7-a84d2901c57a@redhat.com>
Date:   Thu, 9 Jul 2020 13:45:45 +0800
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Pavel Balan <admin@kryma.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <82FBD6F5-68B1-41FD-8AE8-688CD71E14BA@canonical.com>
References: <20200618145515.5055-1-kai.heng.feng@canonical.com>
 <c280d8b5-05bf-e560-51df-c57edeffe8a3@redhat.com>
 <FAF68BF5-FCBC-4D08-AF0F-98EEA209BB86@canonical.com>
 <1f96c309-cd64-6b84-1240-e67849637a50@redhat.com>
 <791C12EA-2A27-4BB1-9754-61C2198E7C27@canonical.com>
 <3eafb89f-b711-0505-e7a7-a84d2901c57a@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

> On Jul 3, 2020, at 20:27, Hans de Goede <hdegoede@redhat.com> wrote:
> 
> Hi,
> 
> On 7/1/20 8:46 AM, Kai-Heng Feng wrote:
>>> On Jun 19, 2020, at 17:56, Hans de Goede <hdegoede@redhat.com> wrote:
>>> 
>>> Hi,
>>> 
>>> On 6/19/20 6:16 AM, Kai-Heng Feng wrote:
>>>> Hi,
>>>>> On Jun 18, 2020, at 23:28, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>> 
>>>>> Hi,
>>>>> 
>>>>> On 6/18/20 4:55 PM, Kai-Heng Feng wrote:
>>>>>> Many laptops can be woken up from Suspend-to-Idle by touchpad. This is
>>>>>> also the default behavior on other OSes.
>>>>>> So let's enable the wakeup support if the system defaults to
>>>>>> Suspend-to-Idle.
>>>>> 
>>>>> I have been debugging a spurious wakeup issue on an Asus T101HA,
>>>>> where the system would not stay suspended when the lid was closed.
>>>>> 
>>>>> The issue turns out to be that the touchpad is generating touch
>>>>> events when the lid/display gets close to the touchpad. In this case
>>>>> wakeup is already enabled by default because it is an USB device.
>>>> Sounds like a mechanical/hardware issue to me.
>>> 
>>> Nope, the laptop is pretty much in new state.
>> Ack.
>>> 
>>>> I've seen some old laptops have the same issue.
>>>> Swollen battery can push up the touchpad, makes it contact to touchscreen, and wakes up the system.
>>> 
>>> This is a 2-in-1 with a detachable keyboard, which is why the
>>> kbd/touchpad is a USB device rather then i2c-hid. Even if the
>>> battery were swollen this would push up the back cover of the
>>> tablet.
>> What's the behavior on Windows?
>> I wonder if Windows has a different wakeup policy?
>> Like disable remote wakeup for USB touchpad and touchscreen?
> 
> I'm afraid I no longer have Windows on the device, so I cannot
> test this. I guess that Windows disables the builtin touchpad and
> touchscreenn when the lid is closed. That is sensible to do from
> a power-management pov even when not suspending, but just closing
> the lid and using an external monitor + kbd.

Ok. This seems worth further investigation.

> 
>>>>> So I do not believe that this is a good idea, most current devices
>>>>> with a HID multi-touch touchpad use i2c-hid and also use S2idle,
>>>>> so this will basically enable wakeup by touchpad on almost all
>>>>> current devices.
>>>> However, it's really handy to wake up the system from touchpad.
>>> 
>>> I agree this is somewhat handy, but the keyboard (space-bar) is
>>> usually sitting right next to it. So we can live without it,
>>> we really need to fix the spurious wakeup issue first, once
>>> that is fixed I'm fine with enabling wakeup by touchpad.
>> That's true. Spacebar is a good enough alternative.
>>> 
>>>>> There will likely be other devices with the same issue as the T101HA,
>>>>> but currently we are not seeing this issue because by default i2c-hid
>>>>> devices do not have wakeup enabled. This change will thus likely cause
>>>>> new spurious wakeup issues on more devices. So this seems like a
>>>>> bad idea.
>>>> But only under lid is closed?
>>> 
>>> Right.
>>> 
>>>> I wonder if it's okay to handle the case in s2idle_loop() or in userspace?
>>>> Lid close -> Wakeup event from touchpad -> Found the lid is closed
>>>> -> Turn off touchpad wakeup -> continue suspend.
>>> 
>>> I've discussed doing something about the spurious wakeup issue in
>>> the kernel with the the kernel input maintainer (Dmitry) here:
>>> 
>>> https://lore.kernel.org/linux-acpi/964ca07a-3da5-101f-7edf-64bdeec98a4b@redhat.com/
>>> 
>>> He was quite clear that this must be fixed in userspace. We did
>>> come up with a plan for fixing this in userspace:
>>> 
>>> 1) Have udev-rules setting using hwdb for quirks which tags
>>> some input devices as "input-disable-wake-on-closed-lid".
>>> A simple udev rule could tag all i2c-hid touchpads with this and
>>> for the detachable USB keyboards with builtin touchpad some
>>> 2-in-1s have we can then use quirks in hwdb to set the tag
>>> on those.
>> Maybe we can avoid using quirks in hwdb, external USB devices should have "Removable" bit set (i.e. it's external).
> 
> At the USB level there only is a somewhat reliable "removal" bit
> for storage devices, defined at the storage protocol level.
> 
> For other devices there is:
> 
> cat /sys/bus/usb/devices/1-8/removable
> 
> This comes from the ACPI tables parsed by:
> drivers/usb/core/usb-acpi.c
> 
> Which set the port's connect_type variable.

Actually most laptops I've used correctly marked internally connected USB 2 device with Removable bit.
And that's the reason why USB2 LPM, which only enables when Removable == 1, caused many issues for us.

> 
> I've tested this on a bunch of 2-in-1s with detachable USB
> keyboards and it is almost completely random and not at
> all related to the reality (both for the kbd-dock connector
> and for other USB ports) this info is so unreliable it is
> pretty much useless.

Ok, that means USB2 LPM will be inadvertently enabled for those devices...
Doesn't sound right.

> 
> And the kbd-dock is special anyways, the dock is removable,
> but when docked / the 2-in-1 is in laptop mode, the touchpad
> should be treated as an internal touchpad, as it will be
> covered by the display when the lid is closed.
> 
> Note I'm mostly referring to 2-in-1's which turn into normal
> clamshell laptops when docked into their keyboard dock,
> not those with the flimsy type-covers.
> 
> Good example's of the type I mean are the Asus T100 series
> and the Lenovo Miix 300 / 310 / 320.

Ok, good to know the difference.

> 
>>> 2) Teach systemd-logind which does the suspend-on-lid on modern
>>> GNOME3 based systems to disable wakeup on the parent of
>>> input-devices which have this tag set before suspending.
>>> 
>>> As mentioned the kernel can then also use this to save
>>> some power by disable scanning for fingers on suspend.
>>> 
>>> If you have time to work on these 2 items, that would be
>>> great. Once this is in place I'm fine with the suggested
>>> kernel change.
>> Ok, let me investigate a bit more.
>>> 
>>> ###
>>> 
>>> Semi-off-topic:
>>> 
>>> The thread I linked to above is about adding a new inhibit
>>> feature to the input system, which is intended to allow
>>> telling the input system system to stop listening for
>>> events even if userspace has the device open (or it has
>>> in kernel listeners) once this has landed, we can use
>>> the same udev-tag to also teach systemd-logind to inhibit
>>> e.g. the touchpad when the lid is closed but the system is
>>> not suspending (e.g. external monitor connected).
>>> Combined with some extra hid-multitouch changes this will
>>> again allow us to tell the touchpad to stop scanning
>>> for fingers saving some power.
>>> 
>>> The inhibit feature could likewise also be enabled on
>>> internal touchpads and keyboards when a 360 degree (yoga)
>>> style 2-in-1 is in tablet mode to avoid accidental key-pressed /
>>> touchpad touches.
>> I thought disabling keyboard/touchpad in tablet mode is done by system firmware.
>> Is it different now?
> 
> It is in some cases but not always.
> 
>> How does the kernel know it's in tablet mode?
> 
> There are various interfaces for this. I've recently submitted
> a series of patches upstream adding an input dev with SW_TABLET
> functionality to most 2-in-1s:
> 
> -I've done a bunch of fixes making the intel-vbtn code export
> SW_TABLET on more devices
> 
> -I've added support for the INT33D3 ACPI device to
> the soc_button_array driver, this device offers direct access
> to a GPIO for SW_TABLET mode (when it has a non empty resource list)
> 
> -I've added SW_TABLET support for HP devices using HP's custom WMI
> method for this to the hp_wmi driver.

Thanks for implementing this.

Seems like more and more devices will use software-based implementation for disabling input device.

> 
> 
>>> Note the inhibit when in tablet mode thing would require
>>> a new: "input-inhibit-on-tablet-mode" tag. At first I
>>> was thinking to just have an "input-device-is-internal"
>>> tag, but that would e.g. also apply to the touchscreen,
>>> on which we do want to disable wakeup when the lid is
>>> closed, but not when in tablet mode.
>>> 
>>> Hmm, I guess to prepare for the inhibit stuff we should
>>> probably call the other tag "input-inhibit-on-closed-lid"
>>> rather then "input-disable-wake-on-closed-lid", and then
>>> systemd-logind can defer that wit should also disable wake
>>> (or initially only disable wake) from that. Otherwise we
>>> get 4 possible tags and I don't see a usecase where we
>>> want to inhibit but not also disable wakeup.
>> I'll focus on the clamshell case for now, I don't have 2-in-1 in hand right now.
> 
> Ok, for the clamshell case it should be easy to have a few'
> simple universal (based on the bus/connection type of the touchpad)
> udev rules to tag them as "input-disable-wake-on-closed-lid".
> 
> Because of the Bay/Cherry Trail hw-enablement I've been doing as
> a personal side project I have quite a few 2-in-1s, so I can
> build on top of that adding a hwdb template + some initial
> entries for tagging the touchpads in detachable keyboards the
> same way.

Ack.

> 
> 
>>> 
>>>>> Also your commit message mentions touchpads, but the change
>>>>> will also enable wakeup on most touchscreens out there, meaning
>>>>> that just picking up a device in tablet mode and accidentally
>>>>> touching the screen will wake it up.
>>>> I tried touch and i2c-hid touchscreen and it doesn't wake up the system.
>>> 
>>> I guess the :
>>> 
>>>        i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
>>> 
>>> Call from i2c_hid_suspend() causes that, interesting that that
>>> works for touchscreens but not for touchpads.
>>> 
>>> I'm pretty sure that if you comment out that line, your
>>> patch will cause wake-ups on touchscreens too, which
>>> IMHO means that your patch should maybe move the above
>>> call into the else of the:
>>> 
>>>        if (device_may_wakeup(&client->dev)) {
>>> 
>>> block, if we enable wakeup then it should work. This should
>>> probably be combined with being smarter about which devices
>>> to enable wakeup on by default...
>> Comment out that line doesn't make touchscreen have the ability to wake up the system.
>> My guess is that there's no ACPI GPIO connects to the touchscreen.
> 
> But there is, i2c-hid devices always have an interrupt line,
> possibly the touchpad gets powered of on transition to D3 though.
> 
> Yes that is probably it, many touchscreens have a _PS3 method
> like this:
> 
>            Method (_PS3, 0, Serialized)  // _PS3: Power State 3
>            {
>                If ((^^^I2C7.AVBL == One))
>                {
>                    DATA = 0x1C
>                    ^^^I2C7.DL13 = BUFF /* \_SB_.PCI0.I2C6.TCS0.BUFF */
>                }
>            }
> 
> Which tells the PMIC to turn of the LDO supplying the touchscreen,
> so that means no wake from suspend by the touchscreen.
> 
> I'm pretty sure you will find something similar in the ACPI
> node describing the touchscreen on the device you are testing
> with.
> 
> If the ACPI tables do not explicitly turn off the device on D3,
> then it would be good to disable wake, and it cannot hurt on
> devices which do completely power down the touchscreen. So
> extending the "input-disable-wake-on-closed-lid" stuff to the
> touchscreen is probably a good idea. But for starters lets just
> focus on touchpads.

Ok, thanks for the explanation!

> 
>>>> However we should still handle the two different cases, probably differentiate touchpad and touchscreen in hid-multitouch.
>>> 
>>> Ack, see above.
>>> 
>>>>> Also hid multi-touch devices have 3 modes, see the diagrams
>>>>> in Microsoft hw design guides for win8/10 touch devices:
>>>>> 1. Reporting events with low latency (high power mode)
>>>>> 2. Reporting events with high latency (lower power mode)
>>>>> 3. Not reporting events (lowest power mode)
>>>>> 
>>>>> I actually still need to write some patches for hid-multitouch.c
>>>>> to set the mode to 2 or 3 on suspend depending on the device_may_wakeup
>>>>> setting of the parent. Once that patch is written, it should
>>>>> put most i2c-hid mt devices in mode 3, hopefully also helping
>>>>> with Linux' relative high power consumption when a device is
>>>>> suspended. With your change instead my to-be-written patch
>>>>> would put the device in mode 2, which would still be an
>>>>> improvement but less so.
>>>> IIRC, touchpad and touchscreen connect to different parents on all laptops I worked on.
>>>> So I think it's possible to enable mode 2 for touchpad, and mode 3 for touchscreen.
>>> 
>>> Ack.
>>> 
>>>> Touchpad wake is really handy, let's figure out how to enable it while covering all potential regression risks.
>>> 
>>> See above I believe we should first get the userspace bits to disable it
>>> when the lid is closed in place.  And even then we may need to have
>>> a Kconfig option to disable it for people running an older userspace,
>>> but I guess once the userspace bits are there, we can proceed without
>>> the Kconfig option and then add that later if necessary (if people are
>>> seeing regressions).
>> For now, as a comprise, can we still enable the wake up capability but disable it by default?
>> i.e. "device_init_wakeup(dev, false)" so user can still choose to enable touchpad wakeup at their own discretion.
> 
> Yes that sounds reasonable.

Thanks, will send a new revision.

Kai-Heng

> 
> Regards,
> 
> Hans
> 
> 
> 
>> Kai-Heng
>>> 
>>> Regards,
>>> 
>>> Hans
>>> 
>>> 
>>>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>>>> ---
>>>>>> v3:
>>>>>>  - Use device_init_wakeup().
>>>>>>  - Wording change.
>>>>>> v2:
>>>>>>  - Fix compile error when ACPI is not enabled.
>>>>>>  drivers/hid/i2c-hid/i2c-hid-core.c | 10 ++++++++++
>>>>>>  1 file changed, 10 insertions(+)
>>>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>>> index 294c84e136d7..dae1d072daf6 100644
>>>>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>>> @@ -931,6 +931,12 @@ static void i2c_hid_acpi_fix_up_power(struct device *dev)
>>>>>>  		acpi_device_fix_up_power(adev);
>>>>>>  }
>>>>>>  +static void i2c_hid_acpi_enable_wakeup(struct device *dev)
>>>>>> +{
>>>>>> +	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)
>>>>>> +		device_init_wakeup(dev, true);
>>>>>> +}
>>>>>> +
>>>>>>  static const struct acpi_device_id i2c_hid_acpi_match[] = {
>>>>>>  	{"ACPI0C50", 0 },
>>>>>>  	{"PNP0C50", 0 },
>>>>>> @@ -945,6 +951,8 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
>>>>>>  }
>>>>>>    static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
>>>>>> +
>>>>>> +static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
>>>>>>  #endif
>>>>>>    #ifdef CONFIG_OF
>>>>>> @@ -1072,6 +1080,8 @@ static int i2c_hid_probe(struct i2c_client *client,
>>>>>>    	i2c_hid_acpi_fix_up_power(&client->dev);
>>>>>>  +	i2c_hid_acpi_enable_wakeup(&client->dev);
>>>>>> +
>>>>>>  	device_enable_async_suspend(&client->dev);
>>>>>>    	/* Make sure there is something at this address */


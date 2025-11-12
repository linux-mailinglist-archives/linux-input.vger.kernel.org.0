Return-Path: <linux-input+bounces-16053-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E3278C5455E
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 21:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCB6A4E2396
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 19:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48831917F1;
	Wed, 12 Nov 2025 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xj9vWThh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770AA27E07E
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762977094; cv=none; b=fwVPkC7qjGKFyaR2L2ciFVOJzPDTJjFXIO8YD2KRCiSXgQ2LoBlbLMe+Y2JduT5kSAciDfLxEAMqLy6EDqLUHSdVfa9ihsYn5SZLO1GDEpWg9n6xnxCgrbFYOdai4xQYPJ/eE33W3ILRB0NpNrovvcggmk3hYg52HMHMvaviTjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762977094; c=relaxed/simple;
	bh=d7YE5jWwJXiiBgZ3dZLfK33AUrpCZCGUh0ISnB6wXvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvQCDN/y696ZPqi+T5QnSY6nBktUnm5W/7qMvctYVBgB4/xwguarW5APaZNgnHBK+wt7hOWlZhFfWUlcLnBRZDiGUgMTYnSzFWvek+oUowIomM6n2np/rcjXcdhU9ZlcONI2FwD0h8Zlk1GHkfoncEAIVqI2/9jwfdU3Y0VVSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xj9vWThh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso749635e9.3
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 11:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762977090; x=1763581890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L78LaQDMvDi3z+MQkhTM0pyXoQQ32IYJk408/ne+O6w=;
        b=Xj9vWThhoB+yKqH+VP+BVD+eRkIiBG5r/e8Mwmg+VgCCtSH0pQCvcOfZOC8lzTfI+b
         /ZxB4Vcx3zmgs9PwOETi0R3K6qYyGTSPyHP0zYCD2lbwEQbndLq2ulP/ejPDHLl6fNjn
         9NqzgqJo8oeb1nNETiOCX9sE6Qo6kwuyWM9qavgeD4zmUDNP3Yh6utszwgo2G1oV7xo3
         mMg/Ey64+zxzCw+u+v4YrgYpB3Zw3NRDGx6O7fG5O8gaGGIv07SQ7dN1MQEVX1RjnC/b
         qa9GGIEsFC3tLR00xrkO7xWTwdlTkHndoxhg1YTmVag+Nt54kuI5PGx3sQFz9/O/ed0f
         Jc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762977090; x=1763581890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L78LaQDMvDi3z+MQkhTM0pyXoQQ32IYJk408/ne+O6w=;
        b=ViUS1pebXeekmDtZcvkVIcNn0PkGqk8DAYXXgHCgNuB1Ed52MSEugObRvLF3iZ87Pw
         C6CYVb1Hma37hjLCcEDksrovp7lVfNOOBMkYHsGa7sGgdPWNZEamKDigbR6XiB1seo17
         7ccN4leT5NBbCOAt4Y+WIMFuRL1ePHUqnHh+CdrhubDQK/JFtfBSpZHBCXhZFCpOJOlk
         z3rTc7xUXJFhXr8v2ydBJykYlg6b+VMvXr+sBZvHL7vwdNZc9O0t2qR2gWjJAQpSzZsZ
         6lo3k3+fhcAqKJWXyfxxoLj99YSVJnv28xNzMNMsn23f98wqJZD1puYHmyJCXpGgfrXF
         melQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwcukxfCDn00yWDtSMIHkFh1HpVg1zPQdpYzQyHNZLFtkns/PCXUiDkzf2lghCQurdjA9TedBOJ/NeHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhF5p2qtpbN8YGxd0hJwdhC/MehL+cc1GaqttUgjxnw8tq+x9
	G8wwwRb0blVPmxDTxr/Cz1vFcq0a7U1cyVY5urGFdMmQfJ4jE6xw3F5S
X-Gm-Gg: ASbGnctKziPNAjI228sSnFqwFDl9evHXrYegONQDukU4YBpezh+jbQroFjzh3Jlc3kI
	c7GWQSMp6GV9K7qVrTva8nJUHqDxzK8j20RlGhTM7jVW8l+2uLt+POXruXnKO0tlhEClB66YzWu
	lTWcevWTcRV68NIMCgfvkuscBhCBoIwLdkOi2s8HeA68KPmCB3l51Lhk1BrbAMPT4CV/V7/CLpV
	ma4j6yyT/oNnl7gSV431fgtAu6dZ/lCO/ah6pLmyYYBb23SPeJGvfm71EyMSp9+wos5cF1QVwA9
	8zS1jg31jpHRvOZKOYX1KSrDLd+3Wj3BOiVvRX3U8D00+IImiMFq1Mx0lWFvQ0wAVspUnqHGAgy
	C9CEWemkmVky+x1ra45UtjPsgy7NRavMXKMVLrtfNxbKsrQ/qePwwfZQd0KK3GcwFZLLu7WECfT
	3xv3AY30XCdEUc
X-Google-Smtp-Source: AGHT+IFq2tch/thXW4nGgWqvY9HlY5yH+EPE2tLXG86TV1JZW7PGK1KWgNu1jEY2HwmFDyUV+j2KIA==
X-Received: by 2002:a05:600c:3546:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-47787095cc8mr39145765e9.23.1762977089390;
        Wed, 12 Nov 2025 11:51:29 -0800 (PST)
Received: from [192.168.1.121] ([176.206.83.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb30eacsm4357725e9.2.2025.11.12.11.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 11:51:29 -0800 (PST)
Message-ID: <74f91d3c-6494-4754-a10f-4d8c1d45f7ff@gmail.com>
Date: Wed, 12 Nov 2025 20:51:27 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Antheas Kapenekakis <lkml@antheas.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
 <27a74ecc-bff7-f3ae-b23e-a8362ac3a6b3@linux.intel.com>
 <CAGwozwGpacR=wYXpf3vOiwWNxaV6pJ6CdE-E-G1gRRpO4VHVMg@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwGpacR=wYXpf3vOiwWNxaV6pJ6CdE-E-G1gRRpO4VHVMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/12/25 14:41, Antheas Kapenekakis wrote:
> On Wed, 12 Nov 2025 at 14:22, Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
>> On Wed, 12 Nov 2025, Antheas Kapenekakis wrote:
>>
>>> On Sat, 1 Nov 2025 at 11:47, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>> This is a two part series which does the following:
>>>>   - Clean-up init sequence
>>>>   - Unify backlight handling to happen under asus-wmi so that all Aura
>>>>     devices have synced brightness controls and the backlight button works
>>>>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
>>>>
>>>> For more context, see cover letter of V1. Since V5, I removed some patches
>>>> to make this easier to merge.
>>> Small bump for this.
>> I looked at v8 earlier but then got an impression some of Denis' comments
>> against v7 were not taken into account in v8, which implies there will be
>> delay until I've time to delve into the details (I need to understand
>> things pretty deeply in such a case, which does take lots of time).
>>
>> Alternatively, if Denis says v8 is acceptable, then I don't need to spend
>> so much time on it, but somehow I've a feeling he isn't happy with v8
>> but just hasn't voiced it again...
>>
>> Please do realize that ignoring reviewer feedback without a very very good
>> reason always risks adding delay or friction into getting things
>> upstreamed. Especially, when the review comes from a person who has been
>> around for me to learn to trust their reviews or from a maintainer of the
>> code in question.
> Sure, sorry if it came out this way. Dennis had two comments on the V7
> version of the series.
>
> The first one was that asusctl has a hang bug, which he hasn't had
> time to look into yet. This should have been fixed by dropping the
> HID_QUIRK_INPUT_PER_APP. I retested the series and that QUIRK was a
> bit of a NOOP that does not need to be added in the future.
So it is supposed to not regress it now, correct?
> The second is he is concerned with dropping the 0x5d/0x5e inits. Luke
> said (back in March) that it is fine to drop 0x5e because it is only
> used for ANIME displays. However, for 0x5d, it is hard to verify some
> of the older laptops because they have only been tested with 0x5d and
> we do not have the hardware in question to test.
>
> For this series, I re-added "initialize LED endpoint early for old
> NKEY keyboards" that re-adds 0x5d for the keyboards that cannot be
> tested again so this comment should be resolved too. With that in
> mind, we do end up with an additional quirk/command that may be
> unneeded and will remain there forever, but since it was a point of
> contention, it is not worth arguing over.
>
> So both comments should be resolved
The driver should also not late-initialize anything.

Windows doesn't do it and the official asus application
can freely send LEDs changing commands to either WMI or USB
so I don't see any reason to do things differently [than windows]
and not prepare every USB endpoint to receive commands,
this has not been addressed unless I confused v7 and v8?
> @Denis: can give an ack if this is the case?
>
> As for Derek's comment, he has a PR for his project where he removes
> the name match for Ally devices with ample time for it to be merged
> until kernel 6.19 is released. In addition, that specific software for
> full functionality relies on OOT drivers on the distros it ships with,
> so it is minimally affected in either case.
The part we are talking about depends on this driver (hid-asus)
and there are people on asus-linux community using inputplumber
for non-ally devices (the OOT driver is only for ally devices)
therefore it is very important to us (and various other distributions)
not to break that software in any way.

Weighting pros and cons of changing the name I am not sure
changing name brings any benefit? Or am I missing something here?
It's simply used by userspace so the hardware should be loading
regardless of the name...

Along with IP and your tool and asusctl there is also openrgb,
and a newborn application for asus devices (I don't have contacts
with that dev nor I remember the name of the tool)
and I am not even that sure these are all asus-related
applications.

Excercise EXTRA care touching this area as these are enough changes
to make it difficult to understand what exactly is the problem if
someone shows up with LEDs malfunctioning, laptop not entering sleep
anymore or something else entirely. Plus over time
ASUS has used various workarounds for windows problems
and I am not eager to find out what those are since there is only
a realistic way it's going to happen....
> Moreover, that specific commit is needed for Xbox Ally devices anyway,
> as the kernel kicks one of the RGB endpoints because it does not
> register an input device (the check skipped by early return) so
> userspace becomes unable to control RGB on a stock kernel
> (hidraw/hiddev nodes are gone). For more context here, this specific
> endpoint implements the RGB Lamparray protocol for Windows dynamic
> lighting, and I think in an attempt to make it work properly in
> Windows, Asus made it so Windows has to first disable dynamic lighting
> for armoury crate RGB commands to work (the 0x5a ones over the 0xff31
> hid page).
Yes once ASUS introduces something new it sticks with that for
future models so it's expected more and more laptops will have
the same problem: I am not questioning if these patches are needed
as they very clearly are; I am questioning if everything that these
patches are doing are worth doing and aren't breaking/regressing
either tools or the flow of actions between the EC and these USB devices.
> Hopefully this clears things up
>
> Antheas
>
>>> Unrelated but I was b4ing this series on Ubuntu 24 and got BADSIG:
>>> DKIM/antheas.dev. Is there a reference for fixing this on my host?
>>> Perhaps it would help with spam
>> I see BADSIG very often these days from b4 (thanks to gmail expiring
>> things after 7 days or so, I recall hearing somewhere), I just ignore them
>> entirely.
>>
>> AFAIK, that has never caused any delay to any patch in pdx86 domain so if
>> that is what you thought is happening here, it's not the case.
>> If your patch does appear in the pdx86 patchwork, there's even less reason
>> to worry as I mostly pick patches to process using patchwork's list.
> Turns out I had to update my DNS records. It should be good now.
>
>> --
>>  i.
>>
>>> Antheas
>>>
>>>> ---
>>>> V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
>>>> V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
>>>> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
>>>> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
>>>> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
>>>> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
>>>> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>>>>
>>>> Changes since V7:
>>>>   - Readd legacy init quirk for Dennis
>>>>   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
>>>>   - Fix warning due to enum_backlight receiving negative values
>>>>
>>>> Changes since V6:
>>>>   - Split initialization refactor into three patches, update commit text
>>>>     to be clearer in what it does
>>>>   - Replace spinlock accesses with guard and scoped guard in all patches
>>>>   - Add missing includes mentioned by Ilpo
>>>>   - Reflow, tweak comment in prevent binding to all HID devices on ROG
>>>>   - Replace asus_ref.asus with local reference in all patches
>>>>   - Add missing kernel doc comments
>>>>   - Other minor nits from Ilpo
>>>>   - User reported warning due to scheduling work while holding a spinlock.
>>>>     Restructure patch for multiple handlers to limit when spinlock is held to
>>>>     variable access only. In parallel, setup a workqueue to handle registration
>>>>     of led device and setting brightness. This is required as registering the
>>>>     led device triggers kbd_led_get which needs to hold the spinlock to
>>>>     protect the led_wk value. The workqueue is also required for the hid
>>>>     event passthrough to avoid scheduling work while holding the spinlock.
>>>>     Apply the workqueue to wmi brightness buttons as well, as that was
>>>>     omitted before this series and WMI access was performed.
>>>>   - On "HID: asus: prevent binding to all HID devices on ROG", rename
>>>>     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fixup.
>>>>     This allows other quirks to apply (applies quirk that fixes keyboard
>>>>     being named as a pointer device).
>>>>
>>>> Changes since V5:
>>>>   - It's been a long time
>>>>   - Remove addition of RGB as that had some comments I need to work on
>>>>   - Remove folio patch (already merged)
>>>>   - Remove legacy fix patch 11 from V4. There is a small chance that
>>>>     without this patch, some old NKEY keyboards might not respond to
>>>>     RGB commands according to Luke, but the kernel driver does not do
>>>>     RGB currently. The 0x5d init is done by Armoury crate software in
>>>>     Windows. If an issue is found, we can re-add it or just remove patches
>>>>     1/2 before merging. However, init could use the cleanup.
>>>>
>>>> Changes since V4:
>>>>   - Fix KConfig (reported by kernel robot)
>>>>   - Fix Ilpo's nits, if I missed anything lmk
>>>>
>>>> Changes since V3:
>>>>   - Add initializer for 0x5d for old NKEY keyboards until it is verified
>>>>     that it is not needed for their media keys to function.
>>>>   - Cover init in asus-wmi with spinlock as per Hans
>>>>   - If asus-wmi registers WMI handler with brightness, init the brightness
>>>>     in USB Asus keyboards, per Hans.
>>>>   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
>>>>   - Fix oops when unregistering asus-wmi by moving unregister outside of
>>>>     the spin lock (but after the asus reference is set to null)
>>>>
>>>> Changes since V2:
>>>>   - Check lazy init succeds in asus-wmi before setting register variable
>>>>   - make explicit check in asus_hid_register_listener for listener existing
>>>>     to avoid re-init
>>>>   - rename asus_brt to asus_hid in most places and harmonize everything
>>>>   - switch to a spinlock instead of a mutex to avoid kernel ooops
>>>>   - fixup hid device quirks to avoid multiple RGB devices while still exposing
>>>>     all input vendor devices. This includes moving rgb init to probe
>>>>     instead of the input_configured callbacks.
>>>>   - Remove fan key (during retest it appears to be 0xae that is already
>>>>     supported by hid-asus)
>>>>   - Never unregister asus::kbd_backlight while asus-wmi is active, as that
>>>>   - removes fds from userspace and breaks backlight functionality. All
>>>>   - current mainline drivers do not support backlight hotplugging, so most
>>>>     userspace software (e.g., KDE, UPower) is built with that assumption.
>>>>     For the Ally, since it disconnects its controller during sleep, this
>>>>     caused the backlight slider to not work in KDE.
>>>>
>>>> Changes since V1:
>>>>   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
>>>>   - Fix ifdef else having an invalid signature (reported by kernel robot)
>>>>   - Restore input arguments to init and keyboard function so they can
>>>>     be re-used for RGB controls.
>>>>   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
>>>>     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
>>>>     keyboard rename into it.
>>>>   - Unregister brightness listener before removing work queue to avoid
>>>>     a race condition causing corruption
>>>>   - Remove spurious mutex unlock in asus_brt_event
>>>>   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
>>>>     relocking the mutex and causing a deadlock when unregistering leds
>>>>   - Add extra check during unregistering to avoid calling unregister when
>>>>     no led device is registered.
>>>>   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
>>>>     the driver to create 4 RGB handlers per device. I also suspect some
>>>>     extra events sneak through (KDE had the @@@@@@).
>>>>
>>>> Antheas Kapenekakis (10):
>>>>   HID: asus: simplify RGB init sequence
>>>>   HID: asus: use same report_id in response
>>>>   HID: asus: fortify keyboard handshake
>>>>   HID: asus: prevent binding to all HID devices on ROG
>>>>   HID: asus: initialize LED endpoint early for old NKEY keyboards
>>>>   platform/x86: asus-wmi: Add support for multiple kbd led handlers
>>>>   HID: asus: listen to the asus-wmi brightness device instead of
>>>>     creating one
>>>>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
>>>>   platform/x86: asus-wmi: add keyboard brightness event handler
>>>>   HID: asus: add support for the asus-wmi brightness handler
>>>>
>>>>  drivers/hid/hid-asus.c                     | 222 +++++++++++----------
>>>>  drivers/platform/x86/asus-wmi.c            | 214 +++++++++++++++++---
>>>>  include/linux/platform_data/x86/asus-wmi.h |  70 +++----
>>>>  3 files changed, 331 insertions(+), 175 deletions(-)
>>>>
>>>>
>>>> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
>>>> --
>>>> 2.51.2
>>>>
>>>>


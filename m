Return-Path: <linux-input+bounces-16369-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E380C8BBBD
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 20:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D19944E34F6
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 19:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC10A34028F;
	Wed, 26 Nov 2025 19:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmPrVsfv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71515340280
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187133; cv=none; b=Exk+Zptr6PB3FKV+xUXyX4p4F3TF0hz3OYRVJPbY+6z4PHyf+Vs2jbwGz/+VaAnLL556MD8EMMD4pGMYQXdK3mmACM7tRnVjsQKJvZtKE25G3G7akV60OquoR5Jp0BDhSqYjUpCcAsc3kby+3x2PdRzORWeHA5x989zuorC1lbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187133; c=relaxed/simple;
	bh=ouXDrryNbj+wome1fKjUn7mM0c30UoQh7+VKfbDhNr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdUj1uav7Q/t/r4a6iEY5lV4cqMQEN3B6f2A4fbKBRd95SEkOi0TeV+eihNDds4Y1CZYXnaDYTKWi242bfi6JbxPEXiQXEMxlq+0k/nP5fymrpMr+r5luzKewAk86LNlbj6JBbGAIRPH1XikmNf0TSEXIry501jXF6AY5O+VxKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmPrVsfv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so115435f8f.1
        for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 11:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764187130; x=1764791930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OExF1JQzYpc2h2zH4FrYnRdoMgy0dMAMagT+YpDZHyA=;
        b=hmPrVsfvF4gmoW32ZzDcuofanIOPqRQTXIx/ZZQbMOuO2jQ62K5zyk8jc2Mv/2JQiY
         60O//qMUDFhFZiNJiENtECpTeN9A4bmbtZWgwK21N8YnZc2ssSlKR7gx3o59Ewp1jCg+
         hfkC4qtZpeHpVU9UK2K7Zhh7llnNW49ZM4Fo8iaZ81qHFnNM/igpyKm7IcHE6o7RAFD8
         QJV1m99QXMVQotddXfUUR57YgrTt4rr1W74s8stJ3RTGGcBH93MdmQA5LZSag2lkPfZA
         CL7hHI6/2DCdoScTv8yHgXpYiUy2OdnsuduH00ADfgP0qitCBh2KIGOZSpHImC3pvD5N
         SiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764187130; x=1764791930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OExF1JQzYpc2h2zH4FrYnRdoMgy0dMAMagT+YpDZHyA=;
        b=gyiqIPNdzKzlYdgZfo07/1/eka7ieBDtUL1pTBe2/PnTh7IGmIYSr7IID71q8BDJWl
         QNt1vbyWly+pwpCRodqh0K8U3TS95BaMz8J6LfgeSL6P6MuythQ7CKnfo8/ZIU8CcAVi
         /rEaLXkFPnKmDdlmBDh0YPOVh9YXGcs5BJviGvDT20DD6A8XLfkRFya6ksMntqXi88ku
         O+4xhEO2bAZN+M5C39qH8DjSbeeaM5XENZWfJorIJbFaMex74QLb9x6GpDM44lMDFjPX
         qp26RissYOwK5afN8NYCAHgtvMHN5VilOevNJE2i2aAczeA7oHoi1pFbnMWVw6r1p86U
         xYZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqiOY5BGu/U3VBUhcRrMOlbTptnvpt+nCfV8575fJaFfBB6avF5JfneAnckYCErIZqOfWJare3YAlnSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0siCVFqGzCh7U9iCWX2t+IonCugLiaHqRK4sXhwjbbh+CScCz
	7Y5gP1mX5fyaWlbAAYtZBIS5PY7qoTfzFF8HlqJr5ElsB1gyuaMJ4emC
X-Gm-Gg: ASbGncu6rWHRB+RZWbESjUWHqnNt6V/2Cd79APL/TPCTbNEl9D36D8DM/ZFoMjzfXsL
	IRIIil8PE5BwkY1IWClSSWmT9NvZzUeGfMMnobv2vnbVtUPjHzQRSRMIdYoM5+VMjQJmrJ3VgVA
	k0YQnT74z1shhCQmKE8P6sPfRMEt7nA97lkjEUWB1QgyPxB7lOpoYHsdVA5RK79G56eyHQJa0Jf
	j7ac8Og9dPBKsmh5iwXhhExZwjTBTmM2A48MrLOBZuqP7dRid/3Obv4pdmuKS9fPTSf1vCtXAqC
	6kNEX7Yk6lML06ANRXr430P3AzkSokhZ9dyZ+2OSG6czWGxfU31U1N5y5WPXUHPzCz9ltpVR+aq
	WQAWBH16cmWjpP20a+T0ojBVvJLshTB7O/re+G26rp8PNptlA5U7q15vcRdhusu5dSi7os5hhvA
	O/EqeGRHEWddUiGQchIiNsrbc=
X-Google-Smtp-Source: AGHT+IEDx/wBoXNenK2Ypu2xX2VwmxU/aiE0sh64BmJQV0DD5n+jSMW41a202DpjwlE8D5noA5Eq1A==
X-Received: by 2002:a5d:5c89:0:b0:42b:32f5:ad43 with SMTP id ffacd0b85a97d-42cc1ceead7mr23615938f8f.17.1764187129456;
        Wed, 26 Nov 2025 11:58:49 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a76sm42726147f8f.24.2025.11.26.11.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 11:58:49 -0800 (PST)
Message-ID: <b2bf7eeb-6cc1-4b67-8118-632943fa9c7c@gmail.com>
Date: Wed, 26 Nov 2025 20:58:48 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <CAGwozwGwkBH_03JvPQrevQiszwDZ5R4uDBnzWVeVXLo8xRmeug@mail.gmail.com>
 <b91fa2c8-e342-9e46-f401-8c3d0590cd38@linux.intel.com>
 <CAGwozwGWL4Vr1XfVZBQoGCq7tKE4mBcPYS2n-p_GAt-V8LeKgg@mail.gmail.com>
 <CAGwozwHZrLcCAzH1m-AEKLJTZ2BE2fL1w0RY7-mF8Ck_yko8eA@mail.gmail.com>
 <b96548e0-d788-b9bf-d8ae-33df98bdf814@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <b96548e0-d788-b9bf-d8ae-33df98bdf814@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/26/25 16:31, Ilpo Järvinen wrote:
> On Wed, 26 Nov 2025, Antheas Kapenekakis wrote:
>
>> On Wed, 26 Nov 2025 at 16:28, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>> On Wed, 26 Nov 2025 at 16:24, Ilpo Järvinen
>>> <ilpo.jarvinen@linux.intel.com> wrote:
>>>> On Wed, 26 Nov 2025, Antheas Kapenekakis wrote:
>>>>
>>>>> On Sat, 22 Nov 2025 at 12:01, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>>>> This is a two part series which does the following:
>>>>>>   - Clean-up init sequence
>>>>>>   - Unify backlight handling to happen under asus-wmi so that all Aura
>>>>>>     devices have synced brightness controls and the backlight button works
>>>>>>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
>>>>>>
>>>>>> For more context, see cover letter of V1. Since V5, I removed some patches
>>>>>> to make this easier to merge.
>>>>> Slight bump on this. It addresses both of the remarks Denis made in
>>>>> the previous version.
>>>>>
>>>>> I begrudgingly argued a bit for those because I did not want to resend
>>>>> the series and they were not functional changes, so sorry about that.
>>>>> But they are fixed in this version incl. with the conflict with the
>>>>> armoury patchset. Denis, you omitted a rby on "platform/x86: asus-wmi:
>>>>> Add support for multiple kbd led handlers" even though I addressed
>>>>> your comment, so you may want to add that.
>>>> FYI, there's no direct relation that mandates a person to give a rev-by
>>>> even if all his/her comments were addressed.
>>> True, this is just a reminder because I did not hear from him and
>>> since he added a rev-by on the kfree patch. There's no obligation from
>>> my side.
Lack of time: I will review the rest shortly unless some more unexpected
thing shows up.
>>>> But generally yes, it would be useful to hear whether Denis is fine with
>>>> v10, especially those patches that had contention earlier but you've
>>>> modified post-v8.
>>>>
>>>>> As for "HID: asus: early return for ROG devices" changing the name of
>>>>> the devices of this driver, I will veto backporting it if it happens,
>>>>> so inputplumber will have the two full months to remove the name
>>>>> match. This is not a breaking change in the sense that software cannot
>>>>> be made to work on both previous and latter versions and there is no
>>>>> other software to my knowledge relying on name matches for Asus
>>>>> keyboards.
>>>> Did Hans give some opinion about this rename earlier, at least I don't
>>>> remember nor could find from lore archives?
>>> Hans jumped in on the ayaneo controller patch. I don't think I saw
>>> activity on this series
>> Hans had some feedback around half a year ago for the latter part of
>> this series that binds the devices together
> Yes but I was interested on specifically about this userspace visible 
> change. He has been around much much longer than me so his insight on 
> userspace visible changes is way more valuable than mine.
>
> --
>  i.
>
>>> Antheas
>>>
>>>> --
>>>>  i.
>>>>
>>>>> Moreover, an early exit is needed to prevent ejecting HID
>>>>> endpoints without an ->input parameter so it is a needed fix anyway.
>>>>> Postponing it will prevent Xbox Ally users from having RGB control
>>>>> through userspace on a stock kernel but it is also not worth arguing
>>>>> about
>>>>>
>>>>> It is also fine for me for this series to merge for 6.20, but I'd
>>>>> rather we handle it now since there will be some turbulence for asus
>>>>> users due to armoury merging so it makes sense to have this transition
>>>>> once.
>>>>>
>>>>>> ---
>>>>>> V9: https://lore.kernel.org/all/20251120094617.11672-1-lkml@antheas.dev/
>>>>>> V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.dev/
>>>>>> V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
>>>>>> V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
>>>>>> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
>>>>>> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
>>>>>> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
>>>>>> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
>>>>>> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>>>>>>
>>>>>> Changes since V9:
>>>>>>   - No functional changes
>>>>>>   - Rebase to review-ilpo-next
>>>>>>   - Fix armoury series conflict by removing the file asus-wmi-leds-ids on
>>>>>>     "remove unused keyboard backlight quirk" + imports
>>>>>>     Dismiss Luke's review as this patch diverged
>>>>>>   - Reword paragraph in "Add support for multiple kbd led handlers" to be
>>>>>>     more verbose
>>>>>>   - Use kfree in fortify patch
>>>>>>   - Fix minor style quirks from --nonstict checkpatch run
>>>>>>
>>>>>> Changes since V8:
>>>>>>   - No functional changes
>>>>>>   - Move legacy init patch to second, modify first patch so that their
>>>>>>     diff is minimized
>>>>>>   - Split "prevent binding to all HID devices on ROG" into two patches:
>>>>>>     - moving backlight initialization into probe
>>>>>>     - early exit to skip ->init check and rename
>>>>>>     - Remove skipping vendor fixups for non-vendor devices. It is not possible
>>>>>>       to read usages before the report fixups are applied, so it did not work
>>>>>>   - In that patch, reword a comment to be single line and make is_vendor a bool
>>>>>>   - Dismiss Luke's tags from "Add support for multiple kbd led handlers" as it
>>>>>>     has drifted too far since he reviewed/tested it.
>>>>>>
>>>>>> Changes since V7:
>>>>>>   - Readd legacy init quirk for Dennis
>>>>>>   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
>>>>>>   - Fix warning due to enum_backlight receiving negative values
>>>>>>
>>>>>> Changes since V6:
>>>>>>   - Split initialization refactor into three patches, update commit text
>>>>>>     to be clearer in what it does
>>>>>>   - Replace spinlock accesses with guard and scoped guard in all patches
>>>>>>   - Add missing includes mentioned by Ilpo
>>>>>>   - Reflow, tweak comment in prevent binding to all HID devices on ROG
>>>>>>   - Replace asus_ref.asus with local reference in all patches
>>>>>>   - Add missing kernel doc comments
>>>>>>   - Other minor nits from Ilpo
>>>>>>   - User reported warning due to scheduling work while holding a spinlock.
>>>>>>     Restructure patch for multiple handlers to limit when spinlock is held to
>>>>>>     variable access only. In parallel, setup a workqueue to handle registration
>>>>>>     of led device and setting brightness. This is required as registering the
>>>>>>     led device triggers kbd_led_get which needs to hold the spinlock to
>>>>>>     protect the led_wk value. The workqueue is also required for the hid
>>>>>>     event passthrough to avoid scheduling work while holding the spinlock.
>>>>>>     Apply the workqueue to wmi brightness buttons as well, as that was
>>>>>>     omitted before this series and WMI access was performed.
>>>>>>   - On "HID: asus: prevent binding to all HID devices on ROG", rename
>>>>>>     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fixup.
>>>>>>     This allows other quirks to apply (applies quirk that fixes keyboard
>>>>>>     being named as a pointer device).
>>>>>>
>>>>>> Changes since V5:
>>>>>>   - It's been a long time
>>>>>>   - Remove addition of RGB as that had some comments I need to work on
>>>>>>   - Remove folio patch (already merged)
>>>>>>   - Remove legacy fix patch 11 from V4. There is a small chance that
>>>>>>     without this patch, some old NKEY keyboards might not respond to
>>>>>>     RGB commands according to Luke, but the kernel driver does not do
>>>>>>     RGB currently. The 0x5d init is done by Armoury crate software in
>>>>>>     Windows. If an issue is found, we can re-add it or just remove patches
>>>>>>     1/2 before merging. However, init could use the cleanup.
>>>>>>
>>>>>> Changes since V4:
>>>>>>   - Fix KConfig (reported by kernel robot)
>>>>>>   - Fix Ilpo's nits, if I missed anything lmk
>>>>>>
>>>>>> Changes since V3:
>>>>>>   - Add initializer for 0x5d for old NKEY keyboards until it is verified
>>>>>>     that it is not needed for their media keys to function.
>>>>>>   - Cover init in asus-wmi with spinlock as per Hans
>>>>>>   - If asus-wmi registers WMI handler with brightness, init the brightness
>>>>>>     in USB Asus keyboards, per Hans.
>>>>>>   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
>>>>>>   - Fix oops when unregistering asus-wmi by moving unregister outside of
>>>>>>     the spin lock (but after the asus reference is set to null)
>>>>>>
>>>>>> Changes since V2:
>>>>>>   - Check lazy init succeds in asus-wmi before setting register variable
>>>>>>   - make explicit check in asus_hid_register_listener for listener existing
>>>>>>     to avoid re-init
>>>>>>   - rename asus_brt to asus_hid in most places and harmonize everything
>>>>>>   - switch to a spinlock instead of a mutex to avoid kernel ooops
>>>>>>   - fixup hid device quirks to avoid multiple RGB devices while still exposing
>>>>>>     all input vendor devices. This includes moving rgb init to probe
>>>>>>     instead of the input_configured callbacks.
>>>>>>   - Remove fan key (during retest it appears to be 0xae that is already
>>>>>>     supported by hid-asus)
>>>>>>   - Never unregister asus::kbd_backlight while asus-wmi is active, as that
>>>>>>   - removes fds from userspace and breaks backlight functionality. All
>>>>>>   - current mainline drivers do not support backlight hotplugging, so most
>>>>>>     userspace software (e.g., KDE, UPower) is built with that assumption.
>>>>>>     For the Ally, since it disconnects its controller during sleep, this
>>>>>>     caused the backlight slider to not work in KDE.
>>>>>>
>>>>>> Changes since V1:
>>>>>>   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
>>>>>>   - Fix ifdef else having an invalid signature (reported by kernel robot)
>>>>>>   - Restore input arguments to init and keyboard function so they can
>>>>>>     be re-used for RGB controls.
>>>>>>   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
>>>>>>     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
>>>>>>     keyboard rename into it.
>>>>>>   - Unregister brightness listener before removing work queue to avoid
>>>>>>     a race condition causing corruption
>>>>>>   - Remove spurious mutex unlock in asus_brt_event
>>>>>>   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
>>>>>>     relocking the mutex and causing a deadlock when unregistering leds
>>>>>>   - Add extra check during unregistering to avoid calling unregister when
>>>>>>     no led device is registered.
>>>>>>   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
>>>>>>     the driver to create 4 RGB handlers per device. I also suspect some
>>>>>>     extra events sneak through (KDE had the @@@@@@).
>>>>>>
>>>>>> Antheas Kapenekakis (11):
>>>>>>   HID: asus: simplify RGB init sequence
>>>>>>   HID: asus: initialize additional endpoints only for legacy devices
>>>>>>   HID: asus: use same report_id in response
>>>>>>   HID: asus: fortify keyboard handshake
>>>>>>   HID: asus: move vendor initialization to probe
>>>>>>   HID: asus: early return for ROG devices
>>>>>>   platform/x86: asus-wmi: Add support for multiple kbd led handlers
>>>>>>   HID: asus: listen to the asus-wmi brightness device instead of
>>>>>>     creating one
>>>>>>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
>>>>>>   platform/x86: asus-wmi: add keyboard brightness event handler
>>>>>>   HID: asus: add support for the asus-wmi brightness handler
>>>>>>
>>>>>>  drivers/hid/hid-asus.c                        | 205 ++++++++--------
>>>>>>  drivers/platform/x86/asus-wmi.c               | 223 +++++++++++++++---
>>>>>>  .../platform_data/x86/asus-wmi-leds-ids.h     |  50 ----
>>>>>>  include/linux/platform_data/x86/asus-wmi.h    |  28 +++
>>>>>>  4 files changed, 322 insertions(+), 184 deletions(-)
>>>>>>  delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h
>>>>>>
>>>>>>
>>>>>> base-commit: 2643187ccb8628144246ee9d44da5e3ac428f9c3
>>>>>> --
>>>>>> 2.52.0
>>>>>>
>>>>>>


Return-Path: <linux-input+bounces-15518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8DBBE379A
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 14:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00CD4583970
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 12:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EBA2E7F3F;
	Thu, 16 Oct 2025 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYPaG6uN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F283E26B942
	for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618795; cv=none; b=GKncPxfragBxsH7i/3LSHngOLKL6ZViRERop5mGLTVTU8wHaAg6rat4z/VSGKVukHlG/2bsXKsxWWgWj8hdwtdgIt9UiIzzz8b3rJXN+wVwy+MvjEAM0A81K5s5QzcS+jxa1/hrMcwhQkUYz6niBieXMPlNacTLSAWsUsYrTtU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618795; c=relaxed/simple;
	bh=Y04uFl/tFQK1TBYEH2gJH7/MTsfVghJJsWOriEsrYBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fO5ssMvmt1FILd2quZR3ZFAjCDiNm4Glg0Uur0jFeGWXCoWQUnMv5knZ9aqZot+Z3mWX0EPbFZsIERdICCmrFZupIrwGZc5EHeV3z38UrOY6R0nPBG23knoklB5RNMKv4/iESfjwqgCbUHdErW99vmocf0SYnjJzmnO6u3ywKsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYPaG6uN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so3724125e9.0
        for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760618791; x=1761223591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9NCOG5hIcUUv56KQjpk9bVsx0PDXKOMb2wYbq2aIws8=;
        b=hYPaG6uN0XmnWL3yYKEKwN1nt+wPYhE6mdVkHWVXyoAq5Q0mEwswWnLTkGLTbfU3Mc
         WJlfjO1v5e4+LvDmzSeaqr2S1OFadwqYZtTDv2ngT+z9y4GSYj/0M9jScskJibfOHHze
         6SDLRx8ho7+4EeTVAOa54tIic2nWsSkbI/ujwcnBBFAehLvg6LVmGmwnkyyO0KEaxtfQ
         UeAi/NDWpqSsJdJ9HpbrPcSKvY/J0fwCMl5lIDofC8jZGPlv5lgJSZiOe9laoYWjE0jj
         VkC8KYirNBqAaK5Oh/l1BNDcmvNGPQ3n9kW5YyjWt1nH8ID0qnvh9zl/bN+BjCqSM/AF
         czuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760618791; x=1761223591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9NCOG5hIcUUv56KQjpk9bVsx0PDXKOMb2wYbq2aIws8=;
        b=FNoVGGdxYYzoCE99/ueq27AfIBJ0cPlPFsgYE7ZvyhKr9OlNSPiM2rdq/7b37ktEv8
         onoJlxrQQD/6C5H7AuS0ySU87sy9jA1aFzsgroUS9WLcDqoI/DkKoC7fOo5f5teqsqAY
         wFPNdeQoB181SPQmKtF7h9AWRyX9yjfzvfpsDEO+jZixvuu1ZA3wVYWVj5BZOOonOybz
         GdhrWTXWdu5cboO845PLohzatLqFwSF/Q23PrcO44gj4J1E+5TqMQinPCU1Lb5QVyk8a
         2Qi1xMRNsLQBw1xXRIV0x9iBnyRp4t5oRnmvwIdkYiU1DbpaoatXqtcE4LfOZdsRUnyL
         xhrw==
X-Forwarded-Encrypted: i=1; AJvYcCXGCD+uREQb2ttTtFXdc4ORz76pkj3kOs2B0Y0Wu8EFw/0n7JnmzSVSATjMjh0WLfZcPkOsihYN36yIRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypgp7abRwL+P4uymHiRWLgFE1YK8jm/zqfdD/Z1mKckqgimKfX
	1YEeQ1wxljicvXUGFYQtzCGd51knmuhWUBcKPjl1wKaOuVuCjobVFFVm
X-Gm-Gg: ASbGncuz2VxQuIYiOl8u0UDfvM7HQuNTq//DfZ3AjNr0VYivJJ1rT8DlgJzpAsRgtu0
	Dkzogg8Frnb89BwaGZ5XntLas4lbURSbmLS22VfKtFVNP1eHAJYW9dQ9zFk67HNBH96wd5EuOdt
	9sKac6fXO7KYRW9yglQUhiPJyWmh9TJ7jGgGBafU9NxD7Xq0WBHFcj7zagpBA72UqlUsIzcWC0H
	aU5WvHyteHIvjBE+l0Au0CUzfL41G1wYBV4HnXuQ2k+RyZBg+sPOViDS2c3fXVEL7MhgzYfMgDI
	B0yY+ypZw0YcprGYoCDhOlBhjtRe6GCslT/ESDfAD2jgbninqBy1sUctgXIziSEMVYp/NF4gbX6
	nUyMnIhsTRDzGSGq1nJBY0dLxXgcPL0bcQNuJMkMwaHdQmU1I8AYeCpPnI7DXlx3gKKP4FnFDn8
	rZwNfx1+BpwfTk9Tm+/ESXOHC0HncY0dMeMjA=
X-Google-Smtp-Source: AGHT+IFSBOiFuaaskV9UqDDhCorjr3KR6vPkKvQJPRyRGdpOKbgG+z8OjmwJFddyM5wDDc3vMNCkJA==
X-Received: by 2002:a05:600d:4203:b0:46e:6af4:ed83 with SMTP id 5b1f17b1804b1-46fa9af9099mr239731785e9.23.1760618790979;
        Thu, 16 Oct 2025 05:46:30 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57cce5sm35401382f8f.1.2025.10.16.05.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:46:30 -0700 (PDT)
Message-ID: <13c53469-58fd-462a-a462-626975d6055f@gmail.com>
Date: Thu, 16 Oct 2025 14:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev>
 <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com>
 <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com>
 <ce8cc332-54ec-4e12-aa7c-a6d5e2b4fa9d@gmail.com>
 <CAGwozwHrWxxE_vyswe39W=ui8N6ej4ZPFvuKVueyw4xLL8C4ZQ@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwHrWxxE_vyswe39W=ui8N6ej4ZPFvuKVueyw4xLL8C4ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/16/25 14:28, Antheas Kapenekakis wrote:
> On Thu, 16 Oct 2025 at 14:19, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 10/16/25 14:14, Antheas Kapenekakis wrote:
>>> On Thu, 16 Oct 2025 at 13:57, Denis Benato <benato.denis96@gmail.com> wrote:
>>>> On 10/13/25 22:15, Antheas Kapenekakis wrote:
>>>>> This is a two part series which does the following:
>>>>>   - Clean-up init sequence
>>>>>   - Unify backlight handling to happen under asus-wmi so that all Aura
>>>>>     devices have synced brightness controls and the backlight button works
>>>>>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
>>>>>
>>>>> For more context, see cover letter of V1. Since V5, I removed some patches
>>>>> to make this easier to merge.
>>>>>
>>>>> All comments with these patches had been addressed since V4.
>>>> I have loaded this patchset for users of asus-linux project to try out.
>>>>
>>>> One of them opened a bug report about a kernel bug that happens
>>>> consistently when closing the lid of his laptop [1].
>>>>
>>>> He also sent another piece of kernel log, but didn't specify anything more
>>>> about this [2].
>>>>
>>>> [1] https://pastebin.com/akZx1w10
>>>> [2] https://pastebin.com/sKdczPgf
>>> Can you provide a link to the bug report? [2] seems unrelated.
>> The log in [2] was posted without additional context in the same
>> discord message as [1].
> Link me the kernel sources. Is it linux-g14 in the AUR?
Someone has replicated it on the AUR but it's just an out-of-sync replica.

The true source code is here:
https://gitlab.com/asus-linux/linux-g14 branch 6.17
>> I think I will tell the user to open a proper bug report because
>> I do agree on the fact that it's looking unrelated.
>>> As for [1], it looks like a trace that stems from a sysfs write to
>>> brightness stemming from userspace that follows the same chain it
>>> would on a stock kernel and times out. Is it present on a stock
>>> kernel?
>> I have asked more details to the user. The user is not online ATM
>> so I will get to you with more details when I can.
>>> Ilpo should know more about this, could the spinlock be interfering?
>>> My testing on devices that have WMI led controls is a bit limited
>>> unfortunately. However, most of our asus users have been happy with
>>> this series for around half a year now.
>> Unless they have looked to kernel logs they won't be able to tell
>> since apparently there are no visible consequences.
>>> Antheas
>>>
>>>>> ---
>>>>> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
>>>>> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
>>>>> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
>>>>> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
>>>>> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>>>>>
>>>>> Changes since V5:
>>>>>   - It's been a long time
>>>>>   - Remove addition of RGB as that had some comments I need to work on
>>>>>   - Remove folio patch (already merged)
>>>>>   - Remove legacy fix patch 11 from V4. There is a small chance that
>>>>>     without this patch, some old NKEY keyboards might not respond to
>>>>>     RGB commands according to Luke, but the kernel driver does not do
>>>>>     RGB currently. The 0x5d init is done by Armoury crate software in
>>>>>     Windows. If an issue is found, we can re-add it or just remove patches
>>>>>     1/2 before merging. However, init could use the cleanup.
>>>>>
>>>>> Changes since V4:
>>>>>   - Fix KConfig (reported by kernel robot)
>>>>>   - Fix Ilpo's nits, if I missed anything lmk
>>>>>
>>>>> Changes since V3:
>>>>>   - Add initializer for 0x5d for old NKEY keyboards until it is verified
>>>>>     that it is not needed for their media keys to function.
>>>>>   - Cover init in asus-wmi with spinlock as per Hans
>>>>>   - If asus-wmi registers WMI handler with brightness, init the brightness
>>>>>     in USB Asus keyboards, per Hans.
>>>>>   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
>>>>>   - Fix oops when unregistering asus-wmi by moving unregister outside of
>>>>>     the spin lock (but after the asus reference is set to null)
>>>>>
>>>>> Changes since V2:
>>>>>   - Check lazy init succeds in asus-wmi before setting register variable
>>>>>   - make explicit check in asus_hid_register_listener for listener existing
>>>>>     to avoid re-init
>>>>>   - rename asus_brt to asus_hid in most places and harmonize everything
>>>>>   - switch to a spinlock instead of a mutex to avoid kernel ooops
>>>>>   - fixup hid device quirks to avoid multiple RGB devices while still exposing
>>>>>     all input vendor devices. This includes moving rgb init to probe
>>>>>     instead of the input_configured callbacks.
>>>>>   - Remove fan key (during retest it appears to be 0xae that is already
>>>>>     supported by hid-asus)
>>>>>   - Never unregister asus::kbd_backlight while asus-wmi is active, as that
>>>>>   - removes fds from userspace and breaks backlight functionality. All
>>>>>   - current mainline drivers do not support backlight hotplugging, so most
>>>>>     userspace software (e.g., KDE, UPower) is built with that assumption.
>>>>>     For the Ally, since it disconnects its controller during sleep, this
>>>>>     caused the backlight slider to not work in KDE.
>>>>>
>>>>> Changes since V1:
>>>>>   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
>>>>>   - Fix ifdef else having an invalid signature (reported by kernel robot)
>>>>>   - Restore input arguments to init and keyboard function so they can
>>>>>     be re-used for RGB controls.
>>>>>   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
>>>>>     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
>>>>>     keyboard rename into it.
>>>>>   - Unregister brightness listener before removing work queue to avoid
>>>>>     a race condition causing corruption
>>>>>   - Remove spurious mutex unlock in asus_brt_event
>>>>>   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
>>>>>     relocking the mutex and causing a deadlock when unregistering leds
>>>>>   - Add extra check during unregistering to avoid calling unregister when
>>>>>     no led device is registered.
>>>>>   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
>>>>>     the driver to create 4 RGB handlers per device. I also suspect some
>>>>>     extra events sneak through (KDE had the @@@@@@).
>>>>>
>>>>> Antheas Kapenekakis (7):
>>>>>   HID: asus: refactor init sequence per spec
>>>>>   HID: asus: prevent binding to all HID devices on ROG
>>>>>   platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
>>>>>   HID: asus: listen to the asus-wmi brightness device instead of
>>>>>     creating one
>>>>>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
>>>>>   platform/x86: asus-wmi: add keyboard brightness event handler
>>>>>   HID: asus: add support for the asus-wmi brightness handler
>>>>>
>>>>>  drivers/hid/hid-asus.c                     | 235 +++++++++++----------
>>>>>  drivers/platform/x86/asus-wmi.c            | 157 ++++++++++++--
>>>>>  include/linux/platform_data/x86/asus-wmi.h |  69 +++---
>>>>>  3 files changed, 291 insertions(+), 170 deletions(-)
>>>>>
>>>>>
>>>>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787


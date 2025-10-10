Return-Path: <linux-input+bounces-15371-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517ABCEB93
	for <lists+linux-input@lfdr.de>; Sat, 11 Oct 2025 00:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B8E0C34FBED
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 22:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF46F2749CE;
	Fri, 10 Oct 2025 22:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hVE4sueK"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D031A9FAE;
	Fri, 10 Oct 2025 22:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760136725; cv=none; b=HiPB0utxAVl3BkXAgjRpNxtqA/MZuhTSB6BHFPC578q+3V1KHwmsQLtlBDIamaeSloKVAABt/YWl+W93ohvGXSKlXUmKWOotwqDfS70JC4RuvFBucwXjG1ba8Xaw/I1SoVHnquONqIaXLji0LBewd+MPdDmy3ZkSkteXfS+375o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760136725; c=relaxed/simple;
	bh=k6YhC9NBpNnOSVVMeiqTQaknXO9wXXNTs18UctEB2JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2amHxJjDEmpXyZMLrTBncYgd2fr7ix02l90IQKQVbBNoH3+iYFB+ssQLnueRXiY6KW65kMZm9DaMYDFeqN/BCoLqP+oG++xtzetuEoOPoWfiZG17gF63az9vmLKyFUxJ35elehxtSmBqXF5zXDB1mvZlrVAEW02kn7wDayBae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hVE4sueK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pvO3W/Lz36UxaHl800907mVxlEm6TgC58ZA7A3ouD+k=; b=hVE4sueKJ5q5AVHQLTz9xm4JlI
	J+7ggztN8pDhc9jGxLFxibA7JKzpFLw4Q4Hp1ECQD6S5rd+C3OWZvzHeVGsZ8fE0H0OKBAR6SMVN4
	3nwjD/DAG4KJc6RYCG5wlqRu7ehFUQU83FFsBsYQDQbtWkNLAnhbbRgnQTmB5wVwuGqPMVSC/T3nL
	pSzCf0EutL2NpU1Ljrm4wommXcJrmFk4AnUKBPrYARJXM1LeLpR6c6+TVCzdHOUgIHjwNiEQIh62j
	tQ7YZI2nGW3TARwSt+KKkbH+eSjqc6iuwVIW4rOWxgtV9vP2SV7364FrvUkU8tiO4SSRlnIN6iFyw
	mo8JTpAg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Lxu-00000009V7f-2NCK;
	Fri, 10 Oct 2025 22:51:58 +0000
Message-ID: <04df1bb8-8409-4ece-a21c-4c71592eb852@infradead.org>
Date: Fri, 10 Oct 2025 15:51:57 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
To: Jonathan Denose <jdenose@google.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
 Sean O'Brien <seobrien@google.com>, Lucas GISSOT <lucas.gissot.pro@gmail.com>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com>
 <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
 <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org>
 <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
 <f2243a9b-e032-416b-aef8-958198ff3955@infradead.org>
 <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/10/25 1:30 PM, Jonathan Denose wrote:
> Hi all,
> 
> Thanks for looking into this.
> 
> On Fri, Oct 10, 2025 at 1:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>
>> I think I found it... see below.
>>
>>
>> On 10/9/25 11:48 PM, Thorsten Leemhuis wrote:
>>> [Top-Posting for easier consumption]
>>>
>>> Mainly writing this mail to bring Lucas GISSOT in here, who reported the
>>> same error yesterday here:
>>> https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomain/
>>>
>>> Lucas there suggested:
>>> """but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) in
>>> hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
>>> Kconfig updated."""
>>>
>>> And Randy: Thx for the closer investigation! It explains some of the
>>> "that feels odd, am I holding this wrong" feeling I had when reporting this.
>>>
>>> Ciao, Thorsten
>>>
>>> On 10/10/25 06:50, Randy Dunlap wrote:
>>>> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
>>>>> On 8/19/25 01:08, Jonathan Denose wrote:
>>>>>> From: Angela Czubak <aczubak@google.com>
>>>>>>
>>>>>> Define a new structure that contains simple haptic device configuration
>>>>>> as well as current state.
>>>>>> Add functions that recognize auto trigger and manual trigger reports
>>>>>> as well as save their addresses.Hi,
>>>>>> Verify that the pressure unit is either grams or newtons.
>>>>>> Mark the input device as a haptic touchpad if the unit is correct and
>>>>>> the reports are found.
>>>>>>  [...]
>>>>>> +config HID_HAPTIC
>>>>>> +  tristate "Haptic touchpad support"
>>>>>> +  default n
>>>>>> +  help
>>>>>> +  Support for touchpads with force sensors and haptic actuators instead of a
>>>>>> +  traditional button.
>>>>>> +  Adds extra parsing and FF device for the hid multitouch driver.
>>>>>> +  It can be used for Elan 2703 haptic touchpad.
>>>>>> +
>>>>>> +  If unsure, say N.
>>>>>> +
>>>>>>  menu "Special HID drivers"
>>>>>
>>>>> I suspect this change is related to a build error I ran into today:
>>>>>
>>>>>   MODPOST Module.symvers
>>>>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
>>>>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
>>>>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
>>>>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
>>>>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
>>>>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
>>>>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
>>>>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1
>>>>>
>>>>> The config where this occurred had this:
>>>>>
>>>>> CONFIG_HID=y
>>>>> CONFIG_HID_MULTITOUCH=m
>>>>> CONFIG_HID_HAPTIC=m
>>>>>
>>>>> Changing the latter to "CONFIG_HID_HAPTIC=y" fixed the problem for me.
>>>>
>>>> Sure, but that's just covering up the problem.
>>>>> First, I get this build error:
>>>>
>>>> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-haptic.o
>>>>
>>
>> ISTM that tristate is incompatible with this newly added Makefile
>> line:
>>
>> +hid-$(CONFIG_HID_HAPTIC)       += hid-haptic.o
>>
>> hid-* lists files that should be builtin, not loadable modules.
>> These should all be hid-y.  AFAIK, hid-m is not useful.
>> (A maintainer can correct me as needed.)

More correctly, any .o that is listed as being built as part of
hid.o should is going to be controlled by CONFIG_HID and should
not its own have a Kconfig symbol at all.

E.g. here:
 hid-y                  := hid-core.o hid-input.o hid-quirks.o
hid-core, hid-input, and hid-quirks don't have their own
Kconfig symbols.



>> So adding a MODULE_LICENSE() and MODULE_DESCRIPTION() to
>> hid-haptic.c and changing drivers/hid/Makefile to use
>> obj-$(CONFIG_HID_HAPTIC_        += hid-haptic.o
>>
>> fixes the build errors for me.
>>
>> Angela, Jonathan D., is there any reason that
>> hid-haptic needs to be builtin instead of a loadable
>> module?  It's no problem for hid-multitouch.ko to call
>> into hid-haptic.ko (both as loadable modules) as long as
>> hid-haptic.ko is loaded first.
>>
> As long as hid-multitouch.ko is able to call into hid-haptic.ko I
> don't see any issues, but is there a way to enforce that when
> CONFIG_HID_HAPTIC is enabled, hid-haptic.ko will be loaded before
> hid-multitouch.ko?

I only know of two possibilities though there may be more.

a. use request_module(true, "hid-haptic");

This would probably be used in the hid core somewhere, afterthe device matching is done.

b. use udev. When a device that needs hid-multitouch is
discovered, have udev load both hid-haptic and hid-multitouch.


I see that hid-haptic.h is written so that it has stubs for
when CONFIG_HID_HAPTIC is not enabled. Can hid-multitouch
operate (in a reduced capacity) when HID_HAPTIC is not enabled?
So that they are separate modules and hid-multitouch is not
dependent on hid-haptic?

There is probably a use case for hid-multitouch without having
hid-haptic loaded since hid-multitouch existed without having
hid-haptic around at all.

It seems that you want both of them loaded. And then Lucas
has reported a build error when HID_HAPTIC=m and
HID_MULTITOUCH=y, so either (like Lucas said) HID_HAPTIC
should be bool, not tristate; or in Kconfig,
HID_MULTITOUCH should depend on HID_HAPTIC, which would not
allow the problem config that Lucas reported.
But that forces devices that want HID_MULTITOUCH to also
have HID_HAPTIC loaded, even though they may not need it.


-- 
~Randy



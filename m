Return-Path: <linux-input+bounces-15360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA26BCBCEE
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 08:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B413AEBD6
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 06:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673B31EE02F;
	Fri, 10 Oct 2025 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="V0US8huO"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5670C14286;
	Fri, 10 Oct 2025 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760078906; cv=none; b=GL4FoycC3IKhrN7OHbHi9o5lVlyw8IiVk7vHwqNwzSI5jCG+ZFGv3LZI0lxVhdFW0f4/ZWZzwedVMF4I3ov+icQCIpuTzdxOtxdAa0/Lcdxorz9qQ8ScocqNgc4d1nM6yV50aa4lMpcHeLsC/Ogj9334ooQHvFcCuaoqOxgsTFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760078906; c=relaxed/simple;
	bh=ld9KHF8hp5h2wDwV7ZSXjTTQYoQED6UBU5bjhe+/WH4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OYjKs70rfWaMPh+ofT0BJHoRatlObbg7gpWrEBzrJrxz0KAIC1WrCzsCUXiaxjgTl8n1h4miXaKgRnrAXQSzEyl4hOAgPpA2s3stMzFrki7q1b9D48+nVcfh2wkY4lKAwzo5lizf96ZJQ6Jp1bp0RuzdUhmQyrIb3QErMHkh2R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=V0US8huO; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=PEXFZhEo4Y2ButrlZIrBpEPRoqX0qYk7QFEJhw4k2RY=; t=1760078904;
	x=1760510904; b=V0US8huOADa0OQQG5yw37jO8LLmXRIN7Ez8F+cAQhI6bnb4DhxV4hokoTj7Gc
	0BYgnI2rMUtNwu4WsnJfoE9/Z1UAsmYBMgbqklm07PBRzFNUvcOw1X4PKB2e7tVOQC2feN5SBwrL0
	1tW76nc+NUa8pqflkCGr3j7UMmorsgADMpBXHkC0p+s8an9I0JwZPVRDEUB0KgOYq9oraEI2+ykTO
	dk1iV7Imdss3YIeypIEI6ywsmAiApGoMh3mNYvOrGYFNUl9m2+tshkZy/mZ04xOxDCI39XURKlQPv
	XWUur2eHTTQn0iwpd46tskyqec5sxOOZF3+I+291Kyh1n21zGA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1v76vG-006iXc-1P;
	Fri, 10 Oct 2025 08:48:14 +0200
Message-ID: <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
Date: Fri, 10 Oct 2025 08:48:11 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Denose
 <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
 Sean O'Brien <seobrien@google.com>, Lucas GISSOT <lucas.gissot.pro@gmail.com>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com>
 <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
 <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1760078904;3fe0ece1;
X-HE-SMSGID: 1v76vG-006iXc-1P

[Top-Posting for easier consumption]

Mainly writing this mail to bring Lucas GISSOT in here, who reported the
same error yesterday here:
https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomain/

Lucas there suggested:
"""but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) in
hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
Kconfig updated."""

And Randy: Thx for the closer investigation! It explains some of the
"that feels odd, am I holding this wrong" feeling I had when reporting this.

Ciao, Thorsten

On 10/10/25 06:50, Randy Dunlap wrote:
> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
>> On 8/19/25 01:08, Jonathan Denose wrote:
>>> From: Angela Czubak <aczubak@google.com>
>>>
>>> Define a new structure that contains simple haptic device configuration
>>> as well as current state.
>>> Add functions that recognize auto trigger and manual trigger reports
>>> as well as save their addresses.Hi,
>>> Verify that the pressure unit is either grams or newtons.
>>> Mark the input device as a haptic touchpad if the unit is correct and
>>> the reports are found.
>>>  [...]
>>> +config HID_HAPTIC
>>> +	tristate "Haptic touchpad support"
>>> +	default n
>>> +	help
>>> +	Support for touchpads with force sensors and haptic actuators instead of a
>>> +	traditional button.
>>> +	Adds extra parsing and FF device for the hid multitouch driver.
>>> +	It can be used for Elan 2703 haptic touchpad.
>>> +
>>> +	If unsure, say N.
>>> +
>>>  menu "Special HID drivers"
>>
>> I suspect this change is related to a build error I ran into today:
>>
>>   MODPOST Module.symvers
>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1
>>
>> The config where this occurred had this:
>>
>> CONFIG_HID=y
>> CONFIG_HID_MULTITOUCH=m
>> CONFIG_HID_HAPTIC=m
>>
>> Changing the latter to "CONFIG_HID_HAPTIC=y" fixed the problem for me.
> 
> Sure, but that's just covering up the problem.
>> First, I get this build error:
> 
> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-haptic.o
> 
> so I added those to hid-haptic.c.... and I still get that same build error.
> 
> So I looked at the hid-haptic.o file, in the .modinfo section,
> and saw this:
> 
> Disassembly of section .modinfo:
> 
> 0000000000000000 <__UNIQUE_ID_modinfo569>:
>    0:	68 69 64 2e 6c       	push   $0x6c2e6469
>    5:	69 63 65 6e 73 65 3d 	imul   $0x3d65736e,0x65(%rbx),%esp
>    c:	47 50                	rex.RXB push %r8
>    e:	4c 00            	rex.WR add %r13b,0x69(%rax)
> 
> which is ASCII " h  i  d  .  l  i  c  e  n  s  e  =  G  P  L".
> 
> so the license string is there.
> 
> Maybe something is modpost is having a problem.
> Unless someone who has modified modpost recently has any ideas,
> this needs a git bisect, I expect.


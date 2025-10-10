Return-Path: <linux-input+bounces-15355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809FCBCBA86
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 06:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 343F23BA7E9
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 04:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806C5238175;
	Fri, 10 Oct 2025 04:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hVGgvavC"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38427154BE2;
	Fri, 10 Oct 2025 04:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760071857; cv=none; b=RxH91qASKCZIuk+NO3lZOQpoP97cKiLRJTEmiVnt1D/Kpdg/TmI5zbYq59qNzV+JRgbu0vac/DCz25x5JRDEDf2PKSpna+pk5lIM50gATlzv8XRRry7VwS61HBGsKxUQIrOLVxfr7+bRmtmql9oLUqp7aSaqlJZVNAqpuAmpewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760071857; c=relaxed/simple;
	bh=0kWQqlge3ibfIqKIb57H5DjAi9xf8KkSBmcp8QEH+sQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9Ujv38NjfU8BDhCrKbFFm1Vs0cUrVxNo0B+/Euthd2rrfm25Oqh397G4eqId1HYPfY5T6Hy45Fc+PdEtDPpjNwib1kW3DBhktdS9hK0VhmqJJ/Rtjj4/7COtw13Acn3T/OlZVLdS8yZgDK/GUFYtU6BOM5w2v2IYOKqA5cOvrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hVGgvavC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=bw05gP/ShEPDLsMfaMo0V/ALc/pLmaUkqTajQJOIQFs=; b=hVGgvavCheCaOVYbPfkzU83MpO
	SZ4fWzf9xft5XP/lNwWcRqRGxzOCB3cWnUFo3jnQ4gmCJURfLhoGiZEHzNGuxcq6jYmrGL1h1HNKf
	LjEtsiVZycD4vK6FEZvZjVfu73ZlBLPgWCQZEJwuIPPEnjpLO+45lz0q+Rj9LhqhTcZmnQ5tJfWqf
	DZe+IM8ptph9S8EQWGYPeqFBpZTqZQKwZRoLxd7v4Df5gQCyllnvuqOTKLpkk1TAm1S8qvj6DoO80
	B8XGA+8ahwUwkfslP70jZYc3bB8jrg0kUh/FW2/2RxEGZnyrIAJADSSjwVxEz8wr8VTPg+lMG4Sqb
	K4f3mfaQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v755f-00000007fy5-013p;
	Fri, 10 Oct 2025 04:50:51 +0000
Message-ID: <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org>
Date: Thu, 9 Oct 2025 21:50:50 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
 Sean O'Brien <seobrien@google.com>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com>
 <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
> On 8/19/25 01:08, Jonathan Denose wrote:
>> From: Angela Czubak <aczubak@google.com>
>>
>> Define a new structure that contains simple haptic device configuration
>> as well as current state.
>> Add functions that recognize auto trigger and manual trigger reports
>> as well as save their addresses.Hi,
>> Verify that the pressure unit is either grams or newtons.
>> Mark the input device as a haptic touchpad if the unit is correct and
>> the reports are found.
>>  [...]
>> +config HID_HAPTIC
>> +	tristate "Haptic touchpad support"
>> +	default n
>> +	help
>> +	Support for touchpads with force sensors and haptic actuators instead of a
>> +	traditional button.
>> +	Adds extra parsing and FF device for the hid multitouch driver.
>> +	It can be used for Elan 2703 haptic touchpad.
>> +
>> +	If unsure, say N.
>> +
>>  menu "Special HID drivers"
> 
> I suspect this change is related to a build error I ran into today:
> 
>   MODPOST Module.symvers
> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1
> 
> The config where this occurred had this:
> 
> CONFIG_HID=y
> CONFIG_HID_MULTITOUCH=m
> CONFIG_HID_HAPTIC=m
> 
> Changing the latter to "CONFIG_HID_HAPTIC=y" fixed the problem for me.

Sure, but that's just covering up the problem.

First, I get this build error:

ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-haptic.o

so I added those to hid-haptic.c.... and I still get that same build error.

So I looked at the hid-haptic.o file, in the .modinfo section,
and saw this:

Disassembly of section .modinfo:

0000000000000000 <__UNIQUE_ID_modinfo569>:
   0:	68 69 64 2e 6c       	push   $0x6c2e6469
   5:	69 63 65 6e 73 65 3d 	imul   $0x3d65736e,0x65(%rbx),%esp
   c:	47 50                	rex.RXB push %r8
   e:	4c 00            	rex.WR add %r13b,0x69(%rax)

which is ASCII " h  i  d  .  l  i  c  e  n  s  e  =  G  P  L".

so the license string is there.

Maybe something is modpost is having a problem.
Unless someone who has modified modpost recently has any ideas,
this needs a git bisect, I expect.

---
~Randy






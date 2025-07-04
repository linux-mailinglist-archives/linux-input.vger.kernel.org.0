Return-Path: <linux-input+bounces-13369-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E635EAF855B
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 03:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50D9E1C83E4B
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 01:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685F11D7E35;
	Fri,  4 Jul 2025 01:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wly16Edp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEF733DF;
	Fri,  4 Jul 2025 01:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751594298; cv=none; b=qOER9i6p+Tu65CKqAmCHmmyIrk62A+AD8IP+2GNabn+VyDTgNSNe0NGN4gxKbuqciMipnDAtD8G6lUDcoCUPXqSTYq7F/yAMC1XCCyauVuRaht6ENScNZfIdoRsGNWsJ1pKgYBn3vCg1FAljTdHE+W4oc4brwXOzgMmdHS36DfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751594298; c=relaxed/simple;
	bh=+8oj1rsUkCGo3Ge6pkBest+5bfjbY2tsYyhkx3PRuDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9pRJMyUz68iBZbtHmiyAKc3ufuRCCl6oQLJxxjaqhKdA5of6nOv4yPWMRE6bsELEumqvcY8Lj/tHpcV/Al6kBunk6Wm0bIslmexWtnlPNKjDi6bq/02+34pgI5Ghb8tP1ziUnTjQcSgtQ3RKOdwYPQwwQn7W8+/1JgmLJNk/S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wly16Edp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24A1C4CEE3;
	Fri,  4 Jul 2025 01:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751594295;
	bh=+8oj1rsUkCGo3Ge6pkBest+5bfjbY2tsYyhkx3PRuDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wly16EdpXxKeqTTBFORGVcHt5uI/9fhSkKzmSO7wz1RP9yEtat70CfLPaDFiCZezA
	 I0mrqC+HV2VumcZiE1aASYiCYzO499MOj5xk2s9aO6LLf6nyV43r69sfYWSPBoGYAg
	 udJGRbL6xueX+eA4x4Kw6vf6vyrQ4cOl1v/mclrsP48+XT+f9bPpHV+9ERY6PWLPoF
	 eiLHWbKgoFu71/NCcspH6IptDFNYrTgJwmlhYAfLifr+qAj6XJGBQ5pZ8ShI/cfWKK
	 J3/zokxpzHhVwGwWyUcKZ7iXgwrBRZ+6HzLBOKLVqF/dPQ+k6R3HDMdhyse1ANTDNz
	 Nj531hHol1Pjw==
Message-ID: <098ab194-f678-4e85-9e35-f8339c2551c7@kernel.org>
Date: Thu, 3 Jul 2025 21:57:58 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] HID: Add Legion Go S Driver
To: Benjamin Tissoires <bentiss@kernel.org>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Richard Hughes <hughsient@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250703004943.515919-1-derekjohn.clark@gmail.com>
 <j3isljjyd6rlddlhpp7knxgss2mpr4ft3pcx5lc7r5r4bnnzpw@wjr6brfv2hsf>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <j3isljjyd6rlddlhpp7knxgss2mpr4ft3pcx5lc7r5r4bnnzpw@wjr6brfv2hsf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 09:48, Benjamin Tissoires wrote:
> Hi Derek,
> 
> [I'll answer to this email with a very high level overview of it, as I'm
> not sure I'll have time to dig much deeper in 6/6 today.]

I'll touch on my two patches at the front of the series and let Derek 
get to the questions/comments on the later ones.

> 
> On Jul 02 2025, Derek J. Clark wrote:
>> This series adds initial support for the Legion Go S's built-in
>> controller HID configuration interface. In the first patch a new HID
>> uevent property is added, HID_FIRMWARE_VERSION, so as to permit fwupd
>> to read the firmware version of the HID interface without detaching the
>> kernel driver.
> 
> That immediately raise red flags on my side. HID_FIRMWARE_VERSION will
> likely be used only for this new driver, and that means a special case
> in each and every client.

Actually Richard and I had envisioned that all updatable HID devices 
would start exporting their firmware version through this HID property.
lenovo-legos-hid was just the first.

The idea would then be that userspace software like fwupd would know to 
parse this property to show the current version and never need to 
interrogate the device directly unless it was actually being updated.

> 
> We had to deal with firmware versions in the past in the HID drivers,
> and we ended up relying on the uniq field of the hid_device (because the
> serial+firmware version uniquely identify the device).

I think this is a different case.  We don't care so much about the 
unique identification of the device as much as we care about the stream 
of firmware applied to the device.

If HID_UNIQ is the right way to get the firmware version but some 
drivers encode a serial+firmware and others encode firmware that's going 
to make for a very messy "generic" property to read the firmware version 
of a device.

> 
>> The second patch adds the ability for an hid_driver to
>> assign new/arbitrary uevent properties for static data that doesn't
>> benefit from having a sysfs entry.
> 
> That, in my mind, is even worse (for the reasons above).

Do clients actually need to know about all the properties?  My thought 
was that if a client encounters a property it doesn't care about it can 
just ignore it.

If that's misplaced; what would you prefer for all this static 
information?  A pile of sysfs files?

> 
>> The third patch adds the VID and PID
>> for the Lenovo Legion Go S MCU.
> 
> Which shouldn't be in its own patch, but part of the driver initial
> patch.
> 
>> The fourth patch adds ABI documentation
>> for the config interface introduced in the final patch. The fifth patch
>> introduces the core lenovo-legos-hid driver which acts as a routing
>> interface for the different endpoints.
> 
> That "core" patch is IMO useless. All it does is:
> - check for the USB endpoint (but in the wrong way, because if you
> 	insert a device through uhid with the same PID/VID it will crash)
> - replace the HID-core core functions with the same code
> 
> Really, this should be squashed into the next patch (with 3/6 then).
> 
> Also, why adding a new subdirectory? All the hid drivers are flat in the
> drivers/hid/ directory, and the subdirs are for transport layers. There
> is one exception for the surface driver but I don't see why you need
> such an exception (yeah, the code is big, but what's the difference in
> having a 1500 lines of code source in its own subdir vs at the root?)
> 
>> The sixth path introduces the
>> config lenovo-legos-hid driver wich uses both the HID_FIRMWARE_VERSION
>> as well as arbitrary uevent properties. Additional interfaces and config
>> properties are planned to be added in a future series.
> 
> That one is too big for my liking. Generally speaking, a commit
> descrition which says "this does this and that" can be split into 2
> patches at least :)
> 
> What kind of future interfaces and config properties are you planning?
> 
>>
>> Patch 6 introduces a checkpatch WARNING that I'm unable to resolve:
>> WARNING: ENOSYS means 'invalid syscall nr' and nothing else
>> 1292: FILE: drivers/hid/lenovo-legos-hid/lenovo-legos-hid-config.c:1085:
>> +       case -ENOSYS: /* during rmmod -ENOSYS is expected */
> 
> We can losely waive those while merging. We do it quite often actually.
> 
> But trying to minimize checkpatch warnings is a good thing, so thanks
> for that.
> 
>>
>> This error handling case was added as it is experienced in the real world
>> when the driver is rmmod. The LED subsystem produces this error code in
>> its legacy code and this is not a new novel use of -ENOSYS, we are simply
>> catching the case to avoid spurious errors in dmesg when the driver is
>> removed. If there is a way to prevent this error from being triggered by
>> checkpatch in the first place, that would be an ideal remedy, but I'm not
>> aware how that can be done at this time.
> 
> Again, nothing to worry about.
> 
> Cheers,
> Benjamin
> 
>>
>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>
>>
>> Derek J. Clark (4):
>>    HID: Add Legion Go S ID's
>>    HID: Add documentation for lenovo-legos-hid driver
>>    HID: Add lenovo-legos-hid core
>>    HID: Add lenovo-legos-hid configuration endpoint interface
>>
>> Mario Limonciello (2):
>>    HID: Include firmware version in the uevent
>>    HID: Allow HID drivers to add more uevent variables
>>
>>   .../ABI/testing/sysfs-driver-lenovo-legos-hid |  269 +++
>>   MAINTAINERS                                   |    7 +
>>   drivers/hid/Kconfig                           |    2 +
>>   drivers/hid/Makefile                          |    2 +
>>   drivers/hid/hid-core.c                        |   11 +
>>   drivers/hid/hid-ids.h                         |    4 +
>>   drivers/hid/lenovo-legos-hid/Kconfig          |   11 +
>>   drivers/hid/lenovo-legos-hid/Makefile         |    6 +
>>   drivers/hid/lenovo-legos-hid/config.c         | 1518 +++++++++++++++++
>>   drivers/hid/lenovo-legos-hid/config.h         |   19 +
>>   drivers/hid/lenovo-legos-hid/core.c           |  122 ++
>>   drivers/hid/lenovo-legos-hid/core.h           |   25 +
>>   include/linux/hid.h                           |    2 +
>>   13 files changed, 1998 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-legos-hid
>>   create mode 100644 drivers/hid/lenovo-legos-hid/Kconfig
>>   create mode 100644 drivers/hid/lenovo-legos-hid/Makefile
>>   create mode 100644 drivers/hid/lenovo-legos-hid/config.c
>>   create mode 100644 drivers/hid/lenovo-legos-hid/config.h
>>   create mode 100644 drivers/hid/lenovo-legos-hid/core.c
>>   create mode 100644 drivers/hid/lenovo-legos-hid/core.h
>>
>> -- 
>> 2.50.0
>>



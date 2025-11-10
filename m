Return-Path: <linux-input+bounces-15979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F570C4926B
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 20:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE125188A71C
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 19:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A821B32C33C;
	Mon, 10 Nov 2025 19:57:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (beyond-windows.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3941D221F03;
	Mon, 10 Nov 2025 19:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762804642; cv=none; b=b2N7DKDy0AnqH/Tt+KMNCqweT2O/8VBYp7k2DnzT03tMl5YiEsr+ADiBHwtHBuUoFimdAkkmHAqfaUTOk8Ap2HTE5z6wl2JsoKbPKMk/BywNv3LzLDxbF5Re8zUMFkPTSPvj8LuyyY+aVXa5UZM70qRrM35DpRxMgodZv6HxjAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762804642; c=relaxed/simple;
	bh=ki61gAvPmT3qzQg8Zlod4meWkinJwzolM8TgHrw11qQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XkcJvws08NbyqnkyzBCEfhrmr1wfLPrwyBd/YKvrYb40VPykJlJzOYZC9JQrBt6aGeJ6etar1dBRobsdVd56N8zmoUeM0sx/Cc7VWegzYXq2yHz1hTvFxmgpfo645ifw63Cspqhz+DFdcECzrg/2h6DdVXXfYocnNy1ivKeHQHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 2D78924AB7A9;
	Mon, 10 Nov 2025 11:57:14 -0800 (PST)
Message-ID: <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
Date: Mon, 10 Nov 2025 11:57:10 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: The-Luga <lugathe2@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Terry Junge <linuxsound@cosmicgizmosystems.com>,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com>
 <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/2025 10:54 PM, The-Luga wrote:
> PROBLEM IDENTIFIED AND SOLVED (almost)
> 
> Reading this: https://docs.kernel.org/hid/hidintro.html
> and https://github.com/torvalds/linux/blob/master/drivers/hid/hid-quirks.c
> 
> I decided to try the HID_QUIRK_NO_IGNORE:
> 
> I added to my kernel cmdline:
> 
> usbhid.quirks=0x2d99:0xa101:0x400

Are you sure?

HID_QUIRK_ALWAYS_POLL = 0x400
would stop suspending the device.

HID_QUIRK_NO_IGNORE = 0x40000000
would stop ignoring a device that is in the ignore list already.

> 
> And everything works as it should.
> 
> The usb bus is finally not silent and the speaker is not rebooting.
> 
> I guess, this device just need to be included on the quirk list to
> close this bug?
> 
> ```
>> sudo cat /sys/kernel/debug/usb/usbmon/3u
> ffff8903020c1800 42570546 C Ii:3:002:4 0:1 64 = 2fbbec66 00021002
> 21000000 00000000 00000000 00000000 00000000 00000000
> ffff8903020c1800 42570552 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 44428557 C Ii:3:002:4 0:1 64 = 2fbbec66 00021001
> 20000000 00000000 00000000 00000000 00000000 00000000
> ffff8903020c1800 44428560 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 47318560 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
> 0d020102 00001403 02000000 14ff0302 000014ff 04e200ff
> ffff8903020c1800 47318565 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 47319560 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
> 0d020700 000014ff 08ff2f15 14ff09ff ffff14ff 0a32ff82
> ffff8903020c1800 47319563 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 47671570 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
> 0d020102 00001e03 02000000 1eff0302 00001eff 04e200ff
> ffff8903020c1800 47671581 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 47672558 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
> 0d020700 00001eff 08ff2f15 1eff09ff ffff1eff 0a32ff82
> ffff8903020c1800 47672563 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 52600567 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
> 0d0b0102 00001e03 02000000 1eff0302 00001eff 04e200ff
> ffff8903020c1800 52600577 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 52601562 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
> 0d0b0700 00001eff 08ff2f15 1eff09ff ffff1eff 0a32ff82
> ffff8903020c1800 52601569 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 54112562 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
> 0d0b0102 00002803 02000000 28ff0302 000028ff 04e200ff
> ffff8903020c1800 54112569 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 54113557 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
> 0d0b0700 000028ff 08ff2f15 28ff09ff ffff28ff 0a32ff82
> ffff8903020c1800 54113562 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 54316567 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
> 0d0b0102 00003203 02000000 32ff0302 000032ff 04e200ff
> ffff8903020c1800 54316576 S Ii:3:002:4 -115:1 64 <
> ffff8903020c1800 54317559 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
> 0d0b0700 000032ff 08ff2f15 32ff09ff ffff32ff 0a32ff82
> ```


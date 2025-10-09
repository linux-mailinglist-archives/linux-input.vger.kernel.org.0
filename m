Return-Path: <linux-input+bounces-15335-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A367ABC74F5
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 05:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 568AB4002E0
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 03:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C1423BCED;
	Thu,  9 Oct 2025 03:37:43 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6824239E88
	for <linux-input@vger.kernel.org>; Thu,  9 Oct 2025 03:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759981063; cv=none; b=CQOwCwuSuAmtOeZn2LWeTmwD2Joal4IVoK0Y4YmLzQkpwg7EmgKXHY/7+ypJesOzk9YLJngLRgCLKaKN9VbN5bE1x8jDgqI4AZepTYgYFpSgy2/ODR5DGEUc+7X3O1YmWtB6O2c2dFvMCsjO3m5ICPc04NE/10N/7pr/BZOoFSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759981063; c=relaxed/simple;
	bh=vbtqT8kDKQwOkSYabXKuccoovK1Zil2lKdHc106uYoQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=KbCVQM3w1zxSlT+43I8BEcefPeKST8YKxsmHbw6uJwibYhTEB60OO0jIJIuJ+8Cz2N2BgcV3dQUFCdxG4WnEuPjEG619XSDBWLuc4YBt0Lq7IG4G6WbpdAOw4tkVapW35vLdvxy387idU/cnnwIfNKVIzhsNRUY0LCZIcBWUZ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 2C7FA1CD89DF;
	Wed,  8 Oct 2025 20:31:37 -0700 (PDT)
Message-ID: <ca562ad3-4472-4fd2-87c7-623bc1c0d126@cosmicgizmosystems.com>
Date: Wed, 8 Oct 2025 20:31:36 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Linux Hid <linuxhid@cosmicgizmosystems.com>
Subject: Re: [BUG] Side buttons not detected on Telink 2.4G mouse (ID
 320f:226f)
To: =?UTF-8?B?0JDRgNGC0LXQvCDQkdGW0LPQtNCw0Yg=?= <temabiill@gmail.com>,
 linux-input@vger.kernel.org
References: <CADYkRmrfhRf6VmQjc+su+mepyv=TsHc+aMcL6ryRZ5HTZ8pyFg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADYkRmrfhRf6VmQjc+su+mepyv=TsHc+aMcL6ryRZ5HTZ8pyFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Btema2,

The problem is probably in the report descriptor from the Telink 2.4G 
Wireless Receiver.

Can you send the Configuration, Device, and Report Descriptors from that 
device?

The VID 0x320f belongs to Evision Semiconductor Technology and there is 
already a driver in the kernel (drivers/hid/hid-evision.c). It would be 
easy enough to add a report fixup hook to that driver.

Would you be able to test the patch?

Thanks,
Terry

On 10/5/2025 10:57 AM, Артем Бігдаш wrote:
> Hello,
> 
> I am reporting an issue with a wireless mouse that uses a Telink 2.4G
> receiver. The side buttons (Forward/Back) are not detected by the
> system.
> 
> Device Information:
> - Name: Redragon King Lite
> - lsusb ID: 320f:226f Telink 2.4G Wireless Receiver
> - System: Fedora 42, KDE Plasma
> 
> Diagnostics:
> - Standard tools like `evtest` and `libinput debug-events` show no
> events when the side buttons are pressed. The kernel does not seem to
> create any evdev events for them.
> - However, `hid-recorder` on the correct hidraw interface
> (`/dev/hidraw1`) successfully captures the raw HID reports.
> 
> Raw HID Reports:
> 
> Pressing the first side button (likely Back/Forward) sends this report:
> E: ... 8 01 10 00 00 00 00 00 00
> Releasing it sends:
> E: ... 8 01 00 00 00 00 00 00 00
> 
> Pressing the second side button (likely Forward/Back) sends this report:
> E: ... 8 01 08 00 00 00 00 00 00
> Releasing it sends:
> E: ... 8 01 00 00 00 00 00 00 00
> 
> It seems the `usbhid` driver does not correctly parse these HID
> reports (report ID 1, second byte mask 0x10 and 0x08) into standard
> KEY_BACK/KEY_FORWARD events.
> 
> Could you please advise if a quirk can be added to the kernel to
> support this device correctly? All the necessary diagnostic data
> appears to be above.
> 
> Thank you for your time and work on the Linux kernel.
> 
> Best regards,
> Btema2
> 


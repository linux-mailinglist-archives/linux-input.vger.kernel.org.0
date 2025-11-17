Return-Path: <linux-input+bounces-16166-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 132FDC66477
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 22:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 13899360460
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 21:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC57322768;
	Mon, 17 Nov 2025 21:34:51 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E191FC0E2
	for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763415291; cv=none; b=R7wz7Bz5O8QIm/7zsdrTzwoq+v4cbK25ytRPdS/DGgQYmvP3m060tnT0MDG0VjKBIxIrm9rgoW9u1YaYxb+ZUvV/DSSL45dkqpcJMxja3lNLyawfXCrNfb9nBgCVJpphSqZAXNx6BMH0mymPxLK4jG59wMsfPL0WqKc59JsmSck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763415291; c=relaxed/simple;
	bh=WqmS96sz8GUhSrS2QWQQwjvBOUFh15x2/VsliaYOEj4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=uOKm5OhqEYOqeoNjPlyFqNnbS9TkLGXyku5AYJ7dT+NhA4/b1hGoN1LyoDZL0cFbWCW5wziH1Ecvzt+adjgthgww6UVkw98x2X0b3J3cYajFeTrgU04vxU+0UVxf912yMtePEWk/vRIQ5O3dvQWBAveZbdjtQ/yDEhGl1UC8Tzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 1FE0A24C3BC0;
	Mon, 17 Nov 2025 13:34:37 -0800 (PST)
Message-ID: <b627cfc9-0dda-4b59-ae5f-83f40cf6088b@cosmicgizmosystems.com>
Date: Mon, 17 Nov 2025 13:34:19 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
Subject: Re: [BUG] Side buttons not detected on Telink 2.4G mouse (ID
 320f:226f)
To: Artem <temabiill@gmail.com>
References: <CADYkRmrfhRf6VmQjc+su+mepyv=TsHc+aMcL6ryRZ5HTZ8pyFg@mail.gmail.com>
 <ca562ad3-4472-4fd2-87c7-623bc1c0d126@cosmicgizmosystems.com>
 <CADYkRmoNpF03Mk7fGgT48pS0daW=h79-87yURqrkgOwxZXjgnw@mail.gmail.com>
Content-Language: en-US
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
In-Reply-To: <CADYkRmoNpF03Mk7fGgT48pS0daW=h79-87yURqrkgOwxZXjgnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/2025 7:33 AM, Artem wrote:
> Hello Terry, sorry for the wait.
> 
> Yes, I am happy to test the patch once it is ready.
> 
> I also discovered that the side buttons work correctly when the mouse
> is connected directly via a USB-C cable (wired). The issue is
> definitely specific to the wireless receiver.
> 
> You asked for the Configuration, Device, and Report Descriptors. Sorry
> if something is wrong, I'm not an advanced user, but I believe this is
> what you asked for. The lsusb command should provide the Device and
> Configuration descriptors, but fails to get the Report Descriptors. so
> I used usbhid-dump to get the raw Report Descriptors.

Perfect, thanks...

As I suspected the Report Descriptor declares 5 buttons
but only declares 3 usages.

> 
> 007:002:000:DESCRIPTOR         1763220717.146252

05 01 Desktop Page
09 06 Keyboard Usage
A1 01 Application Collection
85 06 Report ID 6
05 07 Keyboard/Keypad Page
19 E0 Usage Min Keyboard Left Control
29 E7 Usage Max Keyboard Right GUI
15 00 Logical Min 0
25 01 Logical Max 1
75 01 Report Size 1
95 08 Report Count 8
81 02 Input
95 06 Report Count 6
75 08 Report Size 8
15 00 Logical Min 0
26 FF 00 Logical Max 255
05 07 Keyboard/Keypad Page
19 00 Usage Min 0
2A 65 00 Usage Max Keyboard Application
81 00 Input
C0 End Collection
05 01 Desktop Page
09 02 Mouse Usage
A1 01 Application Collection
85 01 Report ID 1
09 01 Usage Pointer
A1 00 Physical Collection
05 09 Button Page
19 01 Usage Min Button 1
29 03 Usage Max Button 3 -- only 3 usages - change to 5
15 00 Logical Min 0
25 01 Logical Max 1
75 01 Report Size 1
95 05 Report Count 5 -- 5 buttons
81 02 Input
75 03 Report Size 3
95 01 Report Count 1
81 01 Input
05 01 Desktop Page
09 30 Usage X
09 31 Usage Y
16 01 80 Logical Min -32767
26 FF 7F Logical Max 32767
75 10 Report Size 16
95 02 Report Count 2
81 06 Input
09 38 Usage Wheel
15 81 Logical Min -127
25 7F Logical Max 127
75 08 Report Size 8
95 01 Report Count 1
81 06 Input
05 0C Consumer Page
0A 38 02 Usage AC Pan
15 81 Logical Min -127
25 7F Logical Max 127
75 08 Report Size 8
95 01 Report Count 1
81 06 Input
C0 End Collection
C0 End Collection
05 0C Consumer Page
09 01 Usage Consumer Control
A1 01 Application Collection
85 02 Report ID 2
75 10 Report Size 16
95 01 Report Count 1
15 01 Logical Min 1
26 8C 02 Logical Max 0x28c
19 01 Usage Min Consumer Control
2A 8C 02 Usage Max AC Send
81 00 Input
C0 End Collection
05 01 Desktop Page
09 80 System Control Usage
A1 01 Application Collection
85 03 Report ID 3
09 82 Usage System Sleep
09 83 Usage System Wake Up
09 81 Usage System Power Down
15 00 Logical Min 0
25 01 Logical Max 1
19 01 Usage Min 1
29 03 Usage Max 3
75 01 Report Size 1
95 03 Report Count 3
81 02 Input
95 05 Report Count 5
81 01 Input
C0 End Collection
06 00 FF Vendor Page 0xff00
09 00 Usage 0
A1 01 Application Collection
85 05 Report ID 5
09 00 Usage 0
15 00 Logical Min 0
26 FF 00 Logical Max 255
75 08 Report Size 8
95 07 Report Count 7
81 02 Input
09 01 Usage 1
91 02 Output
09 02 Usage 2
B1 02 Feature
C0 End Collection
06 01 FF Vendor Page 0xff01
09 00 Usage 0
A1 01 Application Collection
85 04 Report ID 4
09 01 Usage 1
15 00 Logical Min 0
26 FF 00 Logical Max 255
75 08 Report Size 8
95 07 Report Count 7
B1 02 Feature
C0 End Collection

> 
> I believe this is all the information you requested. Please let me
> know if there's anything else I can do.
> 

I'll send out a patch in the next day or two.
If you could test it and let me know how it goes, it would be great.

Thanks,
Terry

> Best regards,
> Btema2


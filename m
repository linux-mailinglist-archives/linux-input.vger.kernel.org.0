Return-Path: <linux-input+bounces-14750-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B818B58816
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 01:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53E31581A2F
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 23:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5022D8783;
	Mon, 15 Sep 2025 23:15:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (beyond-windows.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63CF1DF723;
	Mon, 15 Sep 2025 23:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757978139; cv=none; b=ObW60ppOXRj0QrYCLsbAOgfwd5DI+avufkBcY6Xs8bFBUzFd8DHY4/+R28TtBzJMUt1xmvsiU+yAhsBNoyFyFX/HpNe+ppdigkrQauuxgEMxjQKOaQBYpkQlfNu23sojM85mT0odukSRn61Vez7cD5htJ9y2vaPqmslwrqPTLfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757978139; c=relaxed/simple;
	bh=0+yASABHD1oLRJxQ4j3zNau+abec8VVEFlh79vv6Gy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U4uDGw3sbo22LJU1pahIvEMpZxTtiH9dWAgMV7L5yuMIYqOMt+e6AOvkZwoQdjMgmYknRx/3Qvyo6Fw79fAyN7h3Jnd6XEv700vPM4qxWAeO327NWIn2ajnCAoznEP81GVJHliIORjhznzOWknaf3JRKiKqAYYZsEZOTs05Ufnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id CD3301E7ACA9;
	Mon, 15 Sep 2025 16:06:43 -0700 (PDT)
Message-ID: <735c20da-c052-4528-ad91-185a835ca40c@cosmicgizmosystems.com>
Date: Mon, 15 Sep 2025 16:06:39 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
To: zhangheng <zhangheng@kylinos.cn>,
 Staffan Melin <staffan.melin@oscillator.se>,
 Salvatore Bonaccorso <carnil@debian.org>
Cc: Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org, 1114557@bugs.debian.org
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
 <aMUxHZF-7p7--1qS@eldamar.lan> <aMUxg6FLqDetwiGu@eldamar.lan>
 <f08669ec112d6ab2f62e35c0c96d1f06@oscillator.se>
 <94520aac-2a68-40d2-b188-80f9e361d6de@kylinos.cn>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <94520aac-2a68-40d2-b188-80f9e361d6de@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/15/25 1:37 AM, zhangheng wrote:
> Apply this new patch and test the kernel again. I don't have the original mic device in my hands, which means I have to wait for a response for testing now.
> 
> You can test it first, and the other mic device also needs to be retested

Your patch will not work as you expect for two reasons.

	if (hid_match_id(hdev, hid_ignore_list) ||
	   (hid_match_id(hdev, hid_ignore_mic) && (hdev->version > 1.1)))
 		quirks |= HID_QUIRK_IGNORE;

hdev->version is U32 not float. Version (bcdDevice) 1.00 would be 0x0100. The value 1.1 is probably cast to 0x0001.

Second, both devices have identical VID, PID, bcdDevice, and Product names.

[  563.104908] usb 1-1.4.1.2: New USB device found, idVendor=4c4a, idProduct=4155, bcdDevice= 1.00
[  563.104910] usb 1-1.4.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  563.104911] usb 1-1.4.1.2: Product: USB Composite Device
[  563.104912] usb 1-1.4.1.2: Manufacturer: SmartlinkTechnology
[  563.104913] usb 1-1.4.1.2: SerialNumber: 20201111000001

[   10.451534] usb 3-3: New USB device found, idVendor=4c4a, idProduct=4155, bcdDevice= 1.00
[   10.451540] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   10.451543] usb 3-3: Product: USB Composite Device
[   10.451545] usb 3-3: Manufacturer: Jieli Technology
[   10.451546] usb 3-3: SerialNumber: FFFFFFFFFFFFFFFF

If you could get the descriptors for the microphone device, it would be helpful.

Thanks,
Terry

> 
> 在 2025/9/13 21:11, Staffan Melin 写道:
>> Ah, thanks, I get it now :)
>>
>> So I got 6.16.7, and the patch applied without problems.
>>
>> But no luck, the same results as before: touchscreen not working, xinput --list not showing the Jieli touchscreen. dmesg shows the same as before, too.
>>
>> Best regards,
>>
>> Staffan
>>
>>
>> On 2025-09-13 10:55, Salvatore Bonaccorso wrote:
>>> Hi Staffan,
>>>
>>> chiming in hopefully it is of help.
>>>
>>> Now really with the patch ...
>>>
>>> On Fri, Sep 12, 2025 at 09:57:04PM +0200, Staffan Melin wrote:
>>>> Thank you,
>>>>
>>>> I tried to apply this patch to 6.12.39, the first problematic kernel, as
>>>> well as 6.12.41, the first bad I tried, and on both I got an error message:
>>>>
>>>> Applying: HID: quirks: Add device descriptor for 4c4a:4155
>>>> error: patch failed: drivers/hid/hid-quirks.c:1068
>>>> error: drivers/hid/hid-quirks.c: patch does not apply
>>>> Patch failed at 0001 HID: quirks: Add device descriptor for 4c4a:4155
>>>>
>>>> To which kernel version should I apply the patch?
>>>
>>> As the deveopment goes from mainline then down to stable series, the
>>> fix needs to be developed first for mainline. So the patch is targeted
>>> there.
>>>
>>> But please find attached an updated patch which hopefully should work
>>> which resolved the context changes on top of 6.12.47.
>>>
>>> But ideally you can provide a Tested-by on zhangheng's mainline patch
>>> to get things rolling as needed.
>>>
>>> Regards,
>>> Salvatore



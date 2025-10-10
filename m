Return-Path: <linux-input+bounces-15372-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EBBBCEC08
	for <lists+linux-input@lfdr.de>; Sat, 11 Oct 2025 01:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70FD63B21EA
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 23:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9189326C38D;
	Fri, 10 Oct 2025 23:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="LFcgxHC0"
X-Original-To: linux-input@vger.kernel.org
Received: from mailfilter.crc.id.au (mailfilter.crc.id.au [203.4.137.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32AE2264D9
	for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 23:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.4.137.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760139046; cv=none; b=O+fK6HT4WsU9GGJ751wqxoa+h2gCAFIlmQTAzuKXca63cQMyy1ZRNDS9Wedwc120LjEvxXVgijL9P55FQIPutj9tHC9O9xrWHt1niX/AcHgPUcinVxaWKs+FLN3WmIzE4FhGs7KDsCX2WPETiKE+QEX1qeJOmlrWwY+ZUbbqKtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760139046; c=relaxed/simple;
	bh=7Xl31shH3Kv8Dsr6vg8OAfKDZ++zXFuaSwiol7cRtE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMsuvhBQ/NL55W0uy/8Uud54X8zUbdBkW18nRbsW0SsntTCulnxG8qMxlgOpr3eAta+IbB3wSgPV6WOhLETNCcP9ActRfqxYbr8/a14wqfz9dVA1KCXuIsgYfmdOi1mLzBiqw11zPU85qfusU8QA05PHqCdHbBbcLD1OU85OVoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au; spf=pass smtp.mailfrom=crc.id.au; dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b=LFcgxHC0; arc=none smtp.client-ip=203.4.137.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crc.id.au
Received: from mailfilter.crc.id.au (localhost.localdomain [127.0.0.1])
	by mailfilter.crc.id.au (Proxmox) with ESMTP id 59B4361FE0;
	Sat, 11 Oct 2025 10:30:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crc.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=default; bh=QerSqOCeS5qjuMFZd
	mUVQnhXkjfUSFLz4obFUWP3pQs=; b=LFcgxHC0VRdnc7b4b9f1TUQdHrZikyIoD
	AhaSu30TlIhf/B8Ef1daczX37f0L5EroUHrqXT5tu5ITKUACJsvf1Jcgbnn/gpgs
	nqvcskX1ac4TQH8oGmhNUld76J6bo/qYd3KklLUAxyxIHBnhNnzlOJBDbm642s08
	Ga9FsLsRmnQPgENUbCoAxYb2qitZ0cBaoCISyxsdU0EexTGDQ5PysgK8x3Wq0O8Z
	ZkEdw4zdaxu/PnFN/9kYq+k9jy0ECVM9MvH4wlATJrtgskbYrR3k9Kk4S0vNySFX
	vB0fuEgl7VANoj/xx9d1cUWSSeyyuEHVr7/rpSjq0XcrVdH0J0gBy7pqc67roNtD
	2qZUDkhfaM1ECWOn7gKliswmCvlzxFGi5Rja6LP5FqflIN2q29kGSbFAsXJN8EWu
	RwvLUOHnce3KPX7v4NAClpZN/SISdkDBkUT0drJiw8i9++14V8XKxztxb6vwXVRW
	dq3TILq0nKhbInLZROZak17Qkl7RYn0GCIOJfidRZ/e+8undddI48jRv7vZSsYox
	3TXY+TTzxIMuniYKSGGRQTVKszyuT+/QNAMOZsoSOxhVpL/fK7Zdcem1NTUzmurk
	w9Jk3k3h7LHGrK1RzjMXVygSVhZekhFEF5Di8RJq6mgpLD5oEPUuMF9uEZI+HfAM
	50jbYnnItg=
Message-ID: <595beaa6-0864-4bde-9cf7-2aa81979de4d@crc.id.au>
Date: Sat, 11 Oct 2025 10:30:40 +1100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hid_multitouch - random non-responsive, multitouch, scrolling and
 zooming
To: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: =?UTF-8?Q?St=C3=A9phane_Chatty?= <chatty@enac.fr>,
 Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org
References: <2a878c8a-0289-4378-9c32-6eaf57e7dbfc@crc.id.au>
 <d058871a-a2c6-4197-a77c-08edb0ce70b4@app.fastmail.com>
 <fd7e0577-a992-4761-823b-b5fe41a7ee74@crc.id.au>
 <8720ac11-2b1d-4b42-84c8-52407dbda7e7@app.fastmail.com>
 <26b03bc2-b824-4948-9803-5a0b5f08e394@crc.id.au>
 <ed69f310-8a4d-4023-b1ce-72b78e512177@app.fastmail.com>
Content-Language: en-AU
From: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <ed69f310-8a4d-4023-b1ce-72b78e512177@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/25 00:54, Benjamin Tissoires wrote:
> On Fri, Oct 10, 2025, at 2:21 PM, Steven Haigh wrote:
>> On 7/10/25 20:10, Benjamin Tissoires wrote:
>>> On Tue, Oct 7, 2025, at 3:42 AM, Steven Haigh wrote:
>>>> I ran `libinput record -o recording.yml /dev/event/input6` and have
>>>> attached the compressed output. Annoyingly, it seems like the touchpad
>>>> is working fine at the moment - so it may confirm the hardware
>>>> information, but not a recording of the problem right now.
>>>
>>> Yeah, same on one of the Dell laptops I have here. I know it has the bug, but whenever I try to reproduce it it never shows meaning I was never able to pin point the issue :(
>>
>> So, "good" news is that I managed to grab a recording today when the
>> touchpad started to play up. When using two-fingers to scroll, I ended
>> up zooming etc.
> 
> Unfortunately, this is a recording after the kernel processing, so all I can do is check that we have ghost fingers (and even that is trciky because I'm not sure if what we see are the expected events or not).

Ah, of course - that makes sense. For some reason, I had it in my head 
that it'd record the touchpad data directly - but that's a libinput 
tool. Seems obvious now, but I get you can't figure out the fake touches 
vs me mashing the touchpad :)
>>
>> I tried to make the recording as short as possible, but still include
>> examples of clicking, scrolling etc.
>>
>> Attached for reference.
>>
>> As for which way to approach a fix - I'm happy for you to suggest what
>> path we take - a BPF, kernel patch backport, or something else.
> 
> Great, thanks!
> 
>>
>> You tell me which one gives the most value and is likely to help more
>> people in the long run.
> 
> Right now the most valuable would be to test the series at
> https://lore.kernel.org/linux-input/20251008-fix-sticky-fingers-v1-0-760f1f26fce3@kernel.org/T/#m0fba507cbd43acd36bef28151ecb90b7077606a4
> 
> If this work and you want a quick and dirty fix you can then return to the default kernel, and use the BPF from https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/204, the latest version should be compatible with your device, just re-download and install it again.
> 
> But definitely a tested-by on the kernel patch would be appreciated :)

Ok, I'll take a peek at this. Just for my own workloads sake, I've 
installed the BPF hack first - just to make sure that it fixes the 
issue. I did have a thought that potentially its a hardware issue - but 
hopefully this issue is just the driver.

I'll give it a run for a little while to see if I get any of the same 
problems - and if not, try to figure out how to build a kernel with this 
patch.

To run a like for like comparison, I guess I'd want to take the Fedora 
SRPM, add the patch, rebuild that, and then run it to test. It's been a 
*long* time since I've done kernel builds :)

I know this isn't conducive to a quick test turnaround - but I'd rather 
give you correct feedback than quick feedback.

-- 
Steven Haigh

📧 netwiz@crc.id.au
💻 https://crc.id.au




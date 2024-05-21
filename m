Return-Path: <linux-input+bounces-3757-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1448F8CAF6E
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 15:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 374511C2158B
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 13:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5F86E602;
	Tue, 21 May 2024 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b="JTwcbAD4";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="J8uYfgc1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b="dA40V/lQ"
X-Original-To: linux-input@vger.kernel.org
Received: from e242-11.smtp-out.us-west-1.amazonses.com (e242-11.smtp-out.us-west-1.amazonses.com [23.251.242.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D877F32
	for <linux-input@vger.kernel.org>; Tue, 21 May 2024 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716298284; cv=none; b=mMtf9xHoSOqRUAmTAgxX9xxwKmH5JD5MD4w/IB9GHX7YO43l2Nyvu0lWpKD9BTItoZzQS1J8sGGl3P06ergl2bgJgDYnJ0NfpCjTwV+5Duk0WRWFJAP4dDUf1Vpodwre8YQCFCA1TmDugP9M4+RUWKUyPpgphCpUZnvrLOMPNXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716298284; c=relaxed/simple;
	bh=Zs/I9oolkSjtcYPVN3LBpc6+Q4BVG/q1UQVRFxb36gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SiURnsS+E3/Xrwmekp5Tu5DnaMXbqV+nCDVXTOVk6a3kX05AKu86+Ce/YlFzG5vxe8T1Sf1khPhDbyZ8oNm6d9zbhaRJoA/MC0sZ6n68VkXD9IKN3R9RVecJrc4/X+bPgeSxIpMxHp8SLGK9HMDNzYB4L2lE+6ywhZekx2Ej9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arazil.net; spf=pass smtp.mailfrom=us-west-1.amazonses.com; dkim=pass (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b=JTwcbAD4; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=J8uYfgc1; dkim=fail (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b=dA40V/lQ reason="signature verification failed"; arc=none smtp.client-ip=23.251.242.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arazil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=qo5nb3djytn6yyi2uek5wqamxnq536po; d=arazil.net; t=1716298282;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Zs/I9oolkSjtcYPVN3LBpc6+Q4BVG/q1UQVRFxb36gs=;
	b=JTwcbAD4fEWEHswvEs9Vt14kYILAr/aQmk6EqB9XlHamdsAVTgZEbm1QZZ7Q6vy6
	u05wQuiAa9XekbMnpnWMqSSEu6m0a/vrO1pVVx0YN8EsvbzGw1P9s1jhC924zPHZO3+
	Cac/IYhl97vXZNQgySFwMlcww/lPh7JwJcwtpC9Q77dIP1w3bNdpcjsqrroMpD5i7R8
	fIaJnpOQpqSIob6MmR+Wb0v6+DIzEbM/6zbhg1zaTA0J9ATGHLLVqPDvLW3TqtO6X8S
	R3gNDwgIJdtb9vnWrKtJhREUU7f0yCWFf0CaNUe4seFgg7k6QmGTBw4ca5Kr1AV5QrQ
	WmwfvVllFQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iek43urnex4zqv5t3opageoatkmhcael; d=amazonses.com; t=1716298282;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=Zs/I9oolkSjtcYPVN3LBpc6+Q4BVG/q1UQVRFxb36gs=;
	b=J8uYfgc1nlU5q27OlS3ArQTbDKkcoqMdGL3WzD/G5OucHO6z9AIMjM7eR8a1sQMh
	kIvrAfxxJ2iuuVu9ub3zAyQsjUYIBrpH/jUfkuafEmf2/G1ookq+Ny6XxX33rn/RPih
	Ox5HrSdYcsODDGfp2v1wxsy4xJR9AJJ24Njz63Fk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arazil.net; s=dkim;
	t=1716298279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VSXVFigBxqcoL5zF+9uC5xYJITLyTy1DfQ2qX3P0T48=;
	b=dA40V/lQNXLGkZXF3CXYXESo8kDoc+q0SGsXue28Uo79zLLXnRMtINypi0nsT6gUQYVNNs
	C38BxxhcmIMF7+TUsy0mF1+I9Sf/0r42Ag4CxAWIz5yTTm+nFIS9pqlfgIXuJ3l0Yrhf2G
	eoeZt8IFNZ5MN+CWEMtdWwhLp9m9ImZCX2jRxBt8Y9uJ9nvX8H0COdeiuRaHkkeRHwUy4i
	7NGGfeEjzuvMbHWCSDcnMchIh7VmcspZ2XDp/PkWIBumf+IzPGAUOOB19zEfzT6WDCCy6S
	mJ+7DvHRcKUalnzPKnMlqj8XU/8Gpt4ICXBNtjrIgAYN4ovYw2We8GHOyUsdew==
Message-ID: <0111018f9b597531-d4643a7e-c27a-46f9-9e25-90530d648d65-000000@us-west-1.amazonses.com>
Date: Tue, 21 May 2024 13:31:22 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: Framework Laptop 16 i2c-hid Based Touchpad Sometimes Fails
 To Initialize Properly On Early Boot
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-input@vger.kernel.org
References: <0111018f7508efb1-1206661a-d4b5-4bd1-b54f-ccb8504b8b4a-000000@us-west-1.amazonses.com>
 <f0dd90aa-78b0-4253-96b0-3241e8b2a11b@leemhuis.info>
Content-Language: en-US
From: Arazil Songweaver <arazil@arazil.net>
In-Reply-To: <f0dd90aa-78b0-4253-96b0-3241e8b2a11b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: ::1.us-west-1.+ToUlskFmoAr0tQOMQW4CAabIYpBdjD9BBfO15fkT3E=:AmazonSES
X-SES-Outgoing: 2024.05.21-23.251.242.11

I was able to reproduce bug again with: Linux version 
6.9.0-1-git-10323-g8f6a15f095a6 (linux-git@archlinux) (gcc (GCC) 14.1.1 
20240507, GNU ld (GNU Binutils) 2.42.0) #1 SMP PREEMPT_DYNAMIC Tue, 21 
May 2024 11:58:24 +0000 (not an official Arch Linux package)

The relevant I2C_HID module needs to be built in to the kernel for the 
bug to trigger on a consistent basis. Arch Linux and mkinitcpio is 
currently getting around this issue by building I2C_HID as a module and 
delaying the load of that module until the part when autoprobe starts 
loading relevant kernel modules. The bug became (more) visible on Arch 
Linux after an update to mkinitcpio moved the I2C_HID module up to the 
beginning of the boot process.

This is not a recent regression. In my testing, I was able to reproduce 
this issue as far back as version 6.8. I did not test 6.7 or earlier 
revisions yet.

Thanks for the follow up.

-Arazil

On 5/21/24 5:57 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 14.05.24 04:57, Arazil Songweaver wrote:
>> We are experiencing an issue where the touch pad on the Framework Laptop
>> 16 fails to initialize properly when the "i2c-hid" is loaded early in
>> the boot process. This issue is especially prominent when "i2c-hid" is
>> built directly into the kernel. When the "i2c-hid" module is built in,
>> the issue occurs roughly 50% of the time.
>> (https://community.frame.work/t/touchpad-not-working-since-update-archlinux/50304) Moving the module load to later in the boot process appears to resolve this issue by making initialization more likely to succeed. (https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio/-/releases/v39.1)
>>
>> Kernel version: Linux artemis 6.9.0-1-git-01560-ga7c840ba5fa7 #1 SMP
>> PREEMPT_DYNAMIC Tue, 14 May 2024 01:49:25 +0000 x86_64 GNU/Linux
>>
>> I'm using the standard Arch Linux AUR "linux-git" package with the
>> following kernel configuration changes:
>>
>> CONFIG_I2C_DEBUG_CORE=y
>> CONFIG_I2C_DEBUG_ALGO=y
>> CONFIG_I2C_DEBUG_BUS=y
>> CONFIG_I2C_HID=y
>> CONFIG_I2C_HID_ACPI=y
>> CONFIG_I2C_HID_OF=y
>> CONFIG_I2C_HID_CORE=y
>>
>> We tried reverting the following patches without any behavior impact
>> (good or bad):
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=fb49deec375aa5beca4a5d71d7a74ec951872f28
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=418c5575d56410c6e186ab727bf32ae32447d497
>>
>> Impacted devices seem to include: "PIXA3854:00" and "i2c_designware
>> AMDI0010:03"
> Any news on this? If this is still unresolved I'll bring this to the
> attention of the right developer, if this is a recent regressions (it
> sounds like it, but it's not exactly clear; and from the first link
> above it sounds like it's partly due to a change in arch's approach to
> the initramfs).
>
> Ciao, Thorsten


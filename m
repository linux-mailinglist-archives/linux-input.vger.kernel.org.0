Return-Path: <linux-input+bounces-3775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041B8CC596
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 19:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B869E1F23058
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 17:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E826A1422CD;
	Wed, 22 May 2024 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b="jUXcTD82";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="ZooWzCmF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b="FAMb4T9x"
X-Original-To: linux-input@vger.kernel.org
Received: from e242-7.smtp-out.us-west-1.amazonses.com (e242-7.smtp-out.us-west-1.amazonses.com [23.251.242.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0861422CC;
	Wed, 22 May 2024 17:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399251; cv=none; b=nUYvO7PAXVWqlx47pUToxa4qxXzM13e7XJrBoT0OxNat4ku6UQCMmPX91u4yzDRLI0t9vDD9DBcp5XEbWVE4o2I3CHH76nQS+h+Fxacf1v3XdGO2v9/0tJ7ELE5Ytt5ohKkcPUP0DIcaZFR0dt9VofHuQjt/qsYLs1LS5AUNI4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399251; c=relaxed/simple;
	bh=ULAb8/9pi6UVw9/SLxk5ToOGGLtV/jJYlYEMNTbfDeM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=I7kAM4uHF4p1D3I0pbfZuMjp342/7tB3GRQrE64eCUFc8cicZuN0kX5Cu3nCDl3BkBWqMR0qwcRIBmaPypyQL8cqHiE40MW8opVNliQLi6R8Om7PG9DRGtfHNY8Ix+gX1YT4hdJIP2MqCcKUrmeE4BQaBq1Wk6V2keuWJh5M8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arazil.net; spf=pass smtp.mailfrom=us-west-1.amazonses.com; dkim=pass (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b=jUXcTD82; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=ZooWzCmF; dkim=fail (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b=FAMb4T9x reason="signature verification failed"; arc=none smtp.client-ip=23.251.242.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arazil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=qo5nb3djytn6yyi2uek5wqamxnq536po; d=arazil.net; t=1716399249;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ULAb8/9pi6UVw9/SLxk5ToOGGLtV/jJYlYEMNTbfDeM=;
	b=jUXcTD82HoGioBcpYEk+FGLLt//vVTW2nU6IBMYpM8smcPY51cjZZWEfy/iJiw3P
	dJPhNWBou3BriaZ8ovfN1GJx8yWCzPouyk8FORzXxAN7uXL+NImDYhPSyVam0PnjV8i
	7cVxfAnlQ0icB8Wrgplz+5YnyomN5Dj5ReM5Zk1Cf8w/BHQBLNcMGlinAxHexeqOIEM
	54IToXZzRfdQS4wDwDsNZ7EVVit4z1NCREEKKYlX+3Pg04+ZWAo4JxHrHR0TVyMSDwU
	WQ+f8rMQMen2y8QduOS6vk6G6BuG5pNchu70ycZfsadHp2Jf0tkrA+EZbQfLTOAv396
	DK9CWzW6Wg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iek43urnex4zqv5t3opageoatkmhcael; d=amazonses.com; t=1716399249;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=ULAb8/9pi6UVw9/SLxk5ToOGGLtV/jJYlYEMNTbfDeM=;
	b=ZooWzCmFHgCcC003idSV3afMtF1+NYr2u+XH/T9y0aUMFPspa5dmh5IbQ3zhPfK5
	8sU7gHj8/WB2c+Zn1/j/GoL/UPfIHRpYbNVf9nnqYGLR988nmCD7BNDtaU1JctTc3mn
	JBQlGCsg0Xz6DXF51OWKum/sdQHwEWkbTYC3CuGc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arazil.net; s=dkim;
	t=1716399245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cRRsR5tht/nJMoM8bJ+NxRWUOFh/4oc0H0Hq3mUHnEE=;
	b=FAMb4T9xvaZnXWCmwTQJobef+/IrGWmBMxQhHSAcqCTJPDoBgchvH4aoDxelARNlpP6TXE
	QF4Xyiu8SCcIY1hIIMY7Drxk5dYKUJLaYlS78ksr+ca1o+c+l38ecIwleCAuqvkLpaxb96
	sVIPtR3h3PyT8T/Sb0KTEHdhfyowKqMt7AnUmRqzPQ0Z11oQrskEWOoRxu9T5vXibnzIZ5
	y6ukDd6g13UiUe/BOwEn0dZEw6o22KIQI1NNnzheF40LxI6D/j9FAROdCF8gBvVEnKCbJv
	5avIbik4gytVskfa2lasuuHi2zB39SkKNDKiIUpjv8HZti1uwcrQlU6mPELYNA==
Message-ID: <0111018fa15e16c0-838d5fbe-fa3c-468c-97bc-e3889a50f893-000000@us-west-1.amazonses.com>
Date: Wed, 22 May 2024 17:34:09 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arazil Songweaver <arazil@arazil.net>
Subject: Re: BUG: Framework Laptop 16 i2c-hid Based Touchpad Sometimes Fails
 To Initialize Properly On Early Boot
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
References: <0111018f7508efb1-1206661a-d4b5-4bd1-b54f-ccb8504b8b4a-000000@us-west-1.amazonses.com>
 <f0dd90aa-78b0-4253-96b0-3241e8b2a11b@leemhuis.info>
 <0111018f9b597531-d4643a7e-c27a-46f9-9e25-90530d648d65-000000@us-west-1.amazonses.com>
 <75053193-92db-40ad-9658-3cdeb0f553be@leemhuis.info>
Content-Language: en-US
In-Reply-To: <75053193-92db-40ad-9658-3cdeb0f553be@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: ::1.us-west-1.+ToUlskFmoAr0tQOMQW4CAabIYpBdjD9BBfO15fkT3E=:AmazonSES
X-SES-Outgoing: 2024.05.22-23.251.242.7

I was able to reproduce this bug on kernel 6.6.0 which should rule out a 
recent regression. Kernel 6.5.0 refused to start with a modules error. 
Going earlier than that is probably pointless given that we are talking 
about hardware first released in January 2024.

This issue is also on the kernel.org Bugzilla at: 218836

-Arazil

On 5/21/24 8:44 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 21.05.24 15:31, Arazil Songweaver wrote:
>> I was able to reproduce bug again with: Linux version
>> 6.9.0-1-git-10323-g8f6a15f095a6 (linux-git@archlinux) (gcc (GCC) 14.1.1
>> 20240507, GNU ld (GNU Binutils) 2.42.0) #1 SMP PREEMPT_DYNAMIC Tue, 21
>> May 2024 11:58:24 +0000 (not an official Arch Linux package)
>>
>> The relevant I2C_HID module needs to be built in to the kernel for the
>> bug to trigger on a consistent basis. Arch Linux and mkinitcpio is
>> currently getting around this issue by building I2C_HID as a module and
>> delaying the load of that module until the part when autoprobe starts
>> loading relevant kernel modules. The bug became (more) visible on Arch
>> Linux after an update to mkinitcpio moved the I2C_HID module up to the
>> beginning of the boot process.
>>
>> This is not a recent regression. In my testing, I was able to reproduce
>> this issue as far back as version 6.8. I did not test 6.7 or earlier
>> revisions yet.
> Okay, then I won't track this as a regression; might still be worth
> trying a few older kernels in a spare minute to see if it was introduced
> in the last 12 or 18 months and can be bisected.
>
> CCed Jiri and Benjamin nevertheless in case they missed this report on
> the lists.
>
> Ciao, Thorsten
>
>> On 5/21/24 5:57 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 14.05.24 04:57, Arazil Songweaver wrote:
>>>> We are experiencing an issue where the touch pad on the Framework Laptop
>>>> 16 fails to initialize properly when the "i2c-hid" is loaded early in
>>>> the boot process. This issue is especially prominent when "i2c-hid" is
>>>> built directly into the kernel. When the "i2c-hid" module is built in,
>>>> the issue occurs roughly 50% of the time.
>>>> (https://community.frame.work/t/touchpad-not-working-since-update-archlinux/50304) Moving the module load to later in the boot process appears to resolve this issue by making initialization more likely to succeed. (https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio/-/releases/v39.1)
>>>>
>>>> Kernel version: Linux artemis 6.9.0-1-git-01560-ga7c840ba5fa7 #1 SMP
>>>> PREEMPT_DYNAMIC Tue, 14 May 2024 01:49:25 +0000 x86_64 GNU/Linux
>>>>
>>>> I'm using the standard Arch Linux AUR "linux-git" package with the
>>>> following kernel configuration changes:
>>>>
>>>> CONFIG_I2C_DEBUG_CORE=y
>>>> CONFIG_I2C_DEBUG_ALGO=y
>>>> CONFIG_I2C_DEBUG_BUS=y
>>>> CONFIG_I2C_HID=y
>>>> CONFIG_I2C_HID_ACPI=y
>>>> CONFIG_I2C_HID_OF=y
>>>> CONFIG_I2C_HID_CORE=y
>>>>
>>>> We tried reverting the following patches without any behavior impact
>>>> (good or bad):
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=fb49deec375aa5beca4a5d71d7a74ec951872f28
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=418c5575d56410c6e186ab727bf32ae32447d497
>>>>
>>>> Impacted devices seem to include: "PIXA3854:00" and "i2c_designware
>>>> AMDI0010:03"
>>> Any news on this? If this is still unresolved I'll bring this to the
>>> attention of the right developer, if this is a recent regressions (it
>>> sounds like it, but it's not exactly clear; and from the first link
>>> above it sounds like it's partly due to a change in arch's approach to
>>> the initramfs).
>>>
>>> Ciao, Thorsten


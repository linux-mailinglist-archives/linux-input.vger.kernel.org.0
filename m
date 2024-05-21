Return-Path: <linux-input+bounces-3758-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE38CAF98
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 15:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B82F2B21910
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 13:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1C47EF08;
	Tue, 21 May 2024 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="zIkjlHMh"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6B971B48;
	Tue, 21 May 2024 13:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716299074; cv=none; b=HR83lD+8u/UFF4CxEtV5oXwmbHFJni/Cmbg2EPNhZKa30mLVSYtt49P1HG8oZIMjKYQaT93a1sFbjPboe+ZNB994WqqY/W54XHepWwMjLckJ170wjFYqXGnWs9fCtx1Qe7Q5FtNW4q6GU5qPFxZn2nzxmhZ0aLP1Ir4XBHOuYpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716299074; c=relaxed/simple;
	bh=avfaquBLiabJK+NWspAcIo7IYcWZcY1k597OcwfKryE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qclc9ojmDyiUtajb5kR4F50ksHCIdFF242NtKL7g6OWeK0MK2Va/XwVtxRGe3SoZX6RGnPQr1lgrwGzaafACEhLnovxiH83j2ZsK7MPjR6Mto3jNUR6zt3fJpFtm8M3DSP6sHSGOdqeXXiqNJmoeZG2yyYnqFPVK+LFWXclGPw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=zIkjlHMh; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=GgRuBOpasoNF/joUeeZUqQr+iEJyi6OYHgdAIIl1wqU=;
	t=1716299072; x=1716731072; b=zIkjlHMhM15RFb+9GHqQaC9aZzLdbBqHyUT+oP2MMMXQLAM
	FK061lij+lz9t/b8nmoerD4JYCYKLEU07ysZTY9Tc52m4W6n5BN6lFet2gvODF0nBHs+shCZyeOPQ
	xdVG3aPbIRGW/Z+/KGLxxQ6mtLDn7IdtEIOgS4QFZykNQTFSW/427PM95rHl54kELLBsVbZ2gyN3E
	ALVjyw2vi45VNYS77rk30MQXNJctCbrPMN8715zEb2/ui78JNK5tPvQSdlVuESC69b3y1hGZ2dG7G
	cIdJVswphX/Rj1g7lSQW7XIvP/xaDmdC8gVEIxKdgp8aN8nyvUjO2/rPdiNfHDzA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s9Pn3-0005Nd-IX; Tue, 21 May 2024 15:44:29 +0200
Message-ID: <75053193-92db-40ad-9658-3cdeb0f553be@leemhuis.info>
Date: Tue, 21 May 2024 15:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: Framework Laptop 16 i2c-hid Based Touchpad Sometimes Fails
 To Initialize Properly On Early Boot
To: Arazil Songweaver <arazil@arazil.net>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Benjamin Tissoires <bentiss@kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <0111018f7508efb1-1206661a-d4b5-4bd1-b54f-ccb8504b8b4a-000000@us-west-1.amazonses.com>
 <f0dd90aa-78b0-4253-96b0-3241e8b2a11b@leemhuis.info>
 <0111018f9b597531-d4643a7e-c27a-46f9-9e25-90530d648d65-000000@us-west-1.amazonses.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <0111018f9b597531-d4643a7e-c27a-46f9-9e25-90530d648d65-000000@us-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716299072;0ac60004;
X-HE-SMSGID: 1s9Pn3-0005Nd-IX

On 21.05.24 15:31, Arazil Songweaver wrote:
> I was able to reproduce bug again with: Linux version
> 6.9.0-1-git-10323-g8f6a15f095a6 (linux-git@archlinux) (gcc (GCC) 14.1.1
> 20240507, GNU ld (GNU Binutils) 2.42.0) #1 SMP PREEMPT_DYNAMIC Tue, 21
> May 2024 11:58:24 +0000 (not an official Arch Linux package)
> 
> The relevant I2C_HID module needs to be built in to the kernel for the
> bug to trigger on a consistent basis. Arch Linux and mkinitcpio is
> currently getting around this issue by building I2C_HID as a module and
> delaying the load of that module until the part when autoprobe starts
> loading relevant kernel modules. The bug became (more) visible on Arch
> Linux after an update to mkinitcpio moved the I2C_HID module up to the
> beginning of the boot process.
> 
> This is not a recent regression. In my testing, I was able to reproduce
> this issue as far back as version 6.8. I did not test 6.7 or earlier
> revisions yet.

Okay, then I won't track this as a regression; might still be worth
trying a few older kernels in a spare minute to see if it was introduced
in the last 12 or 18 months and can be bisected.

CCed Jiri and Benjamin nevertheless in case they missed this report on
the lists.

Ciao, Thorsten

> On 5/21/24 5:57 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 14.05.24 04:57, Arazil Songweaver wrote:
>>> We are experiencing an issue where the touch pad on the Framework Laptop
>>> 16 fails to initialize properly when the "i2c-hid" is loaded early in
>>> the boot process. This issue is especially prominent when "i2c-hid" is
>>> built directly into the kernel. When the "i2c-hid" module is built in,
>>> the issue occurs roughly 50% of the time.
>>> (https://community.frame.work/t/touchpad-not-working-since-update-archlinux/50304) Moving the module load to later in the boot process appears to resolve this issue by making initialization more likely to succeed. (https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio/-/releases/v39.1)
>>>
>>> Kernel version: Linux artemis 6.9.0-1-git-01560-ga7c840ba5fa7 #1 SMP
>>> PREEMPT_DYNAMIC Tue, 14 May 2024 01:49:25 +0000 x86_64 GNU/Linux
>>>
>>> I'm using the standard Arch Linux AUR "linux-git" package with the
>>> following kernel configuration changes:
>>>
>>> CONFIG_I2C_DEBUG_CORE=y
>>> CONFIG_I2C_DEBUG_ALGO=y
>>> CONFIG_I2C_DEBUG_BUS=y
>>> CONFIG_I2C_HID=y
>>> CONFIG_I2C_HID_ACPI=y
>>> CONFIG_I2C_HID_OF=y
>>> CONFIG_I2C_HID_CORE=y
>>>
>>> We tried reverting the following patches without any behavior impact
>>> (good or bad):
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=fb49deec375aa5beca4a5d71d7a74ec951872f28
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=418c5575d56410c6e186ab727bf32ae32447d497
>>>
>>> Impacted devices seem to include: "PIXA3854:00" and "i2c_designware
>>> AMDI0010:03"
>> Any news on this? If this is still unresolved I'll bring this to the
>> attention of the right developer, if this is a recent regressions (it
>> sounds like it, but it's not exactly clear; and from the first link
>> above it sounds like it's partly due to a change in arch's approach to
>> the initramfs).
>>
>> Ciao, Thorsten
> 
> 


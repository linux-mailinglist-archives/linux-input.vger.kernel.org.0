Return-Path: <linux-input+bounces-6988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C43598C7AD
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 23:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DC9F1F2384A
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 21:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132E71CB32B;
	Tue,  1 Oct 2024 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hixontech.com header.i=linux-kernel-bugs@hixontech.com header.b="KGcQiKuW"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302219ABC3;
	Tue,  1 Oct 2024 21:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727818848; cv=pass; b=me1wFWPyc71B0UXJ82DjpIeZb3j7MVr38IB7JpHYJJqqJJV5pMqKh3hJY9wTMNSeNlebl4+ij8q6XQ+ttanewWLlNQqGtltcNx0tFTN2G9AlDU7xtA9a18+6EDLxm7yR2jTE/rNaSbc2RwXtL3zFdeHjeQ9HMpHZTCDv62X8rEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727818848; c=relaxed/simple;
	bh=MzJ8qhwT3kSg1s+pVaKWDpq54/s5R7KtaLgqFPe0GQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2nt+TOq+Th91um5VK7g691NJTekkMIPPY1i0T0yTDPJu88CTbSXRyAchUWbJtIyhzWXgtMLOVaVTKweSpzkbl8Jl4kTMbJnGXdB0Dt4XZEi6o5EBIa2fnYOq5xQ/PkPB0VvSt73HF6w+lDv68AatNn+fY6do66l6mzFwIbsIbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hixontech.com; spf=pass smtp.mailfrom=hixontech.com; dkim=pass (1024-bit key) header.d=hixontech.com header.i=linux-kernel-bugs@hixontech.com header.b=KGcQiKuW; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hixontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hixontech.com
ARC-Seal: i=1; a=rsa-sha256; t=1727818824; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hEk8Ta013EaZvEVqSKMImqPj1/lNR7Q3Y0CIYx1YpfqGmKE9dRtJ5ZGxAeh8YzF9XkiH1C6OqIKw5QX1qbzvPcSEUk8TZZ8OzPRKDxz/NjCPHFLER6d2rXZRFVloJfQJTMBTC2mEytzyZ99JgWeII2CisDbDJaE6HkF9zuHD6dQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727818824; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Reply-To:References:Subject:Subject:To:To:Message-Id; 
	bh=948TLcLIlzmX3XN0IywjhoOqIMbEWESrAYXWsnKc2/k=; 
	b=ns6hVj7uM91gIcUYnla7sdODYyXz8WX1eTrM88KIWqKrfVK1Q4aqWile1yszEjZOOEl0Fmf+N70toWQBX01P6tlnDL3NbgOEUBDOUfz/qPgHD0hAgg4Uasurg4R3Sxa/4/o7XvsNhDwtcMXNQwF3kO7GB19cyaefTZBMlHGM6+g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=hixontech.com;
	spf=pass  smtp.mailfrom=linux-kernel-bugs@hixontech.com;
	dmarc=pass header.from=<linux-kernel-bugs@hixontech.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727818824;
	s=zoho; d=hixontech.com; i=linux-kernel-bugs@hixontech.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:Reply-To:Reply-To:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id;
	bh=948TLcLIlzmX3XN0IywjhoOqIMbEWESrAYXWsnKc2/k=;
	b=KGcQiKuWPGHHpruqFGocMtXZSkIlBzhPXqm1Y59RLBbbIAc12H6+Rvl0/VidDNrG
	Q8SY9c6diA0RiEiTG3WEbMWilWvvSpMgdsiTYSKxWFGk9Cf2VIXIWbBqWLUgefmWAZe
	gtnxJuQ8aY+rc+wbhjJAcpyNFrRZWFIHWrz2RfuA=
Received: by mx.zohomail.com with SMTPS id 1727818821728782.7594162079346;
	Tue, 1 Oct 2024 14:40:21 -0700 (PDT)
Message-ID: <3a9b2925-57fb-4139-8cf5-a761209c03cc@hixontech.com>
Date: Tue, 1 Oct 2024 15:40:19 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [regression] AMD SFH Driver Causes Memory Errors / Page Faults /
 btrfs going read-only
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Jiri Kosina <jkosina@suse.com>, linux-input@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 akshata.mukundshetty@amd.com, Chris Hixon <linux-kernel-bugs@hixontech.com>,
 LKML <linux-kernel@vger.kernel.org>, Skyler <skpu@pm.me>
References: <90f6ee64-df5e-43b2-ad04-fa3a35efc1d5@leemhuis.info>
From: Chris Hixon <linux-kernel-bugs@hixontech.com>
Content-Language: en-US
Reply-To: linux-kernel-bugs@hixontech.com
In-Reply-To: <90f6ee64-df5e-43b2-ad04-fa3a35efc1d5@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/1/2024, 12:56:49 PM, "Linux regression tracking (Thorsten Leemhuis)" wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> Basavaraj Natikar, I noticed a report about a regression in
> bugzilla.kernel.org that appears to be caused by a change of yours:
> 
> 2105e8e00da467 ("HID: amd_sfh: Improve boot time when SFH is available")
> [v6.9-rc1]
> 
> As many (most?) kernel developers don't keep an eye on the bug tracker,
> I decided to write this mail. To quote from
> https://bugzilla.kernel.org/show_bug.cgi?id=219331 :
> 
>> I am getting bad page map errors on kernel version 6.9 or newer.
>> They always appear within a few minutes of the system being on, if
>> not immediately upon booting. My system is a Dell Inspiron 7405.
>>
>> This occurs with kernel 6.9.x, 6.10.x and 6.11. I tested a handful
>> of versions from 6.2.x to 6.8.x as well as 5.15 and they don't have
>> the same behavior. In addition to compiling from kernel.org, I tried
>> to install some major distros (Fedora, CentOS, Debian, Mint, Ubuntu)
>> to double check that it was not a mistake I was making with
>> compilation. They were consistent with my kernel.org results.
>>
>> Kernel version from /proc/verison of the earliest affected release I
>> could identify: Linux version 6.9.0 (skyler@nobara-pc) (gcc (GCC)
>> 14.2.1 20240912 (Red Hat 14.2.1-3), GNU ld version 2.41-37.fc40) #1
>> SMP PREEMPT_DYNAMIC Sat Sep 28 11:17:40 EDT 2024
>>
>> Please let me know if there is any other information or testing that
>> could help debug this. This is my first time making a bug report or
>> even compiling the kernel from source so I may be missing something
>> obvious. Thank you!
>>
>> Attached is a full dmesg log. Below I will paste a few other dmesg
>> snippets and some environment information.>
>> dmesg sample #1:
>>
>> [   23.234632] systemd-journald[611]: File /var/log/journal/a4e3170bc5be4f52a2080fb7b9f93cf0/user-1000.journal corrupted or uncleanly shut down, renaming and replacing.
>> [   23.580724] rfkill: input handler enabled
>> [   25.652067] rfkill: input handler disabled

>> [   34.222362] pcie_mp2_amd 0000:03:00.7: Failed to discover, sensors not enabled is 0
>> [   34.222379] pcie_mp2_amd 0000:03:00.7: amd_sfh_hid_client_init failed err -95

No sensors detected - do we all have that in common?

>> [   34.680264] BUG: unable to handle page fault for address: 00000002ffffffe3
>> [   34.680272] #PF: supervisor read access in kernel mode
>> [   34.680274] #PF: error_code(0x0000) - not-present page
>> [   34.680275] PGD 0 P4D 0 
>> [   34.680278] Oops: 0000 [#1] PREEMPT SMP NOPTI
>> [   34.680280] CPU: 3 PID: 3252 Comm: Chroot Helper Not tainted 6.9.0 #1
>> [   34.680282] Hardware name: Dell Inc. Inspiron 7405 2n1/0XMJN6, BIOS 1.19.0 07/10/2024
>> [   34.680284] RIP: 0010:unlink_anon_vmas+0x97/0x1e0
>> [   34.680288] Code: 83 c0 22 49 89 47 18 e8 a7 19 02 00 48 8b 43 10 4c 8d 63 10 49 89 df 48 83 e8 10 4d 39 ec 74 48 48 89 c3 4d 8b 77 08 48 89 ef <49> 8b 2e 48 39 fd 74 12 48 85 ff 0f 85 06 01 00 00 48 8d 7d 08 e8
>> [   34.680290] RSP: 0018:ffffb41842c2f918 EFLAGS: 00010246
>> [   34.680292] RAX: 0000000080000000 RBX: ffff98528ab2cb00 RCX: 0000000000000000
>> [   34.680293] RDX: ffff98528ab2cb10 RSI: ffff98528862b008 RDI: 0000000000000000
>> [   34.680294] RBP: 0000000000000000 R08: 000000000000000f R09: 0000000000000060
>> [   34.680296] R10: 0000000000400030 R11: 0000000000000004 R12: ffff98528ab2c010
>> [   34.680297] R13: ffff98525ce97060 R14: 00000002ffffffe3 R15: ffff98528ab2c000
>> [   34.680298] FS:  0000000000000000(0000) GS:ffff98553f780000(0000) knlGS:0000000000000000
>> [   34.680300] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   34.680301] CR2: 00000002ffffffe3 CR3: 000000014c630000 CR4: 0000000000350ef0
>> [   34.680302] Call Trace:
>> [...]
> 
> See the ticket for more details and the bisection result. Skyler, the
> reporter (CCed), later also added:
> 
>> Occasionally I will not get the usual bad page map error, but
>> instead some BTRFS  errors followed by the file system going read-only.
> 
> Note, we had and earlier regression caused by this change reported by
> Chris Hixon that maybe was not solved completely:
> https://lore.kernel.org/all/3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com/
> 

This looks like the same issue I reported.

> Chris Hixon: do you still encounter errors, or was your issue
> resolved/vanished somehow?

I still encounter errors with every kernel/patch I've tested. I've blacklisted 
the amd_sfh module as a workaround, but when the module is inserted, a crash
similar to those reported will happen soon after the (45 second?) 
detection/initialization timeout. It seems to affect whatever part of the
kernel next becomes active. I've had disk corruption as well, when BTRFS is
affected by the memory corruption, so I've ended up testing on a USB stick I
can reformat if necessary. I haven't tested new patches/kernels in a while
though. I'll get back to you after I've tried the latest mainline. Also note
that I've tried Fedora Rawhide's debug kernel, which has a ton of debugging
options including KASAN, but nothing seems to point the finger at something
originating in amd_sfh code. Is it possible the hardware itself (the mp2/sfh
chip) is corrupting memory somehow after some misstep in
initialization/de-initialization? Also if you look at my report, you'll see I
have no devices/sensors detected by amd_sfh - I wonder if other reporters all
have this in common? (noted in dmesg output above from another user)   

> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> P.S.: let me use this mail to also add the report to the list of tracked
> regressions to ensure it's doesn't fall through the cracks:
> 
> #regzbot introduced: 2105e8e00d
> #regzbot title: HID: amd_sfh: Memory Errors / Page Faults / btrfs going
> read-only
> #regzbot from: Skyler <skpu@pm.me>
> #regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=219331
> #regzbot ignore-activity
> 



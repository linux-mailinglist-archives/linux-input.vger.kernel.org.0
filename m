Return-Path: <linux-input+bounces-6983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C698C5BB
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 20:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA9FA1C2321B
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 18:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587B61CCB51;
	Tue,  1 Oct 2024 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="zfMs1f25"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2BB1C2DB7;
	Tue,  1 Oct 2024 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727809015; cv=none; b=CwxYamN8kD7rzL//XZGWCl14T41yKgv3fyNJR+l1WBpxDHVpZ+mHiBwGFACHS8j3FudgvDBexRkdfTZAyI4uyx+bTJiEvBWjVAMw9PK/8wrFm2X93YBjeYTxsA3FfR9a0on/CTiWIY+G9XXSgmpgw5Q0jGQQdBcepKAifM4jz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727809015; c=relaxed/simple;
	bh=JwPxLrTRzoX+uJUpZ6kXpFBXJd5I6oAafFs3HtwYLtE=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=QS5dEiV0HP8jAdVwRJPWqf7S7hYDx7u6r6FEXPFjRePsZVfh+9y1bgDE1ZlCJHPg/zlZlIpxXyXIj48C57O7CK2JSNijEo/7652KX5MfC+Vt9nV3RRJJ5Jlk86Z/MWU3nTxKpZxuuV1mU/Go0FQ4/BvXmcJHjYNpEC2rZ/oYWHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=zfMs1f25; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:Subject:Cc:To:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To
	:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=B0Kn9Y2iX/UXSPXh6gUir+sw8fthLf1UT6Nq8KHhHU0=; t=1727809013;
	x=1728241013; b=zfMs1f25fmHwQz5kHqNZLmXY/Wjcu3eCx2ByDmXAN/8+GPKrY3kYlIoHZVSDO
	U1hHUptw4k961QOw3bgOdFteg8KzhYHf2htlOm+dSWcbqljjVBPbbOmiqlQBVo9jgkFjKt9L4yLew
	bWA8TGTwOIeO6QLbrrxE/j7hFoUTwSwfQQv2sE1rs5TCtscyB7zAvA7FwzF/lMpBSYxnsQprM0ZN+
	G7UVApwx9NT5N5Jo1N0hL3MjYM/4mhdnaXYW4ggfaZhYvHxHNT845VIH2TUmf0ZPpPSo9bbNJSqmR
	/6jDPdn/noTU8BEGnG3iO7C5TtYAym5sNLpiBJmDNJN0A3pnFg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1svi3G-00087j-H4; Tue, 01 Oct 2024 20:56:50 +0200
Message-ID: <90f6ee64-df5e-43b2-ad04-fa3a35efc1d5@leemhuis.info>
Date: Tue, 1 Oct 2024 20:56:49 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Jiri Kosina <jkosina@suse.com>, linux-input@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 akshata.mukundshetty@amd.com, Chris Hixon <linux-kernel-bugs@hixontech.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Skyler <skpu@pm.me>
Subject: [regression] AMD SFH Driver Causes Memory Errors / Page Faults /
 btrfs going read-only
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727809013;0a383021;
X-HE-SMSGID: 1svi3G-00087j-H4

Hi, Thorsten here, the Linux kernel's regression tracker.

Basavaraj Natikar, I noticed a report about a regression in
bugzilla.kernel.org that appears to be caused by a change of yours:

2105e8e00da467 ("HID: amd_sfh: Improve boot time when SFH is available")
[v6.9-rc1]

As many (most?) kernel developers don't keep an eye on the bug tracker,
I decided to write this mail. To quote from
https://bugzilla.kernel.org/show_bug.cgi?id=219331 :

> I am getting bad page map errors on kernel version 6.9 or newer.
> They always appear within a few minutes of the system being on, if
> not immediately upon booting. My system is a Dell Inspiron 7405.
> 
> This occurs with kernel 6.9.x, 6.10.x and 6.11. I tested a handful
> of versions from 6.2.x to 6.8.x as well as 5.15 and they don't have
> the same behavior. In addition to compiling from kernel.org, I tried
> to install some major distros (Fedora, CentOS, Debian, Mint, Ubuntu)
> to double check that it was not a mistake I was making with
> compilation. They were consistent with my kernel.org results.
> 
> Kernel version from /proc/verison of the earliest affected release I
> could identify: Linux version 6.9.0 (skyler@nobara-pc) (gcc (GCC)
> 14.2.1 20240912 (Red Hat 14.2.1-3), GNU ld version 2.41-37.fc40) #1
> SMP PREEMPT_DYNAMIC Sat Sep 28 11:17:40 EDT 2024
> 
> Please let me know if there is any other information or testing that
> could help debug this. This is my first time making a bug report or
> even compiling the kernel from source so I may be missing something
> obvious. Thank you!
> 
> Attached is a full dmesg log. Below I will paste a few other dmesg
> snippets and some environment information.>
> dmesg sample #1:
> 
> [   23.234632] systemd-journald[611]: File /var/log/journal/a4e3170bc5be4f52a2080fb7b9f93cf0/user-1000.journal corrupted or uncleanly shut down, renaming and replacing.
> [   23.580724] rfkill: input handler enabled
> [   25.652067] rfkill: input handler disabled
> [   34.222362] pcie_mp2_amd 0000:03:00.7: Failed to discover, sensors not enabled is 0
> [   34.222379] pcie_mp2_amd 0000:03:00.7: amd_sfh_hid_client_init failed err -95
> [   34.680264] BUG: unable to handle page fault for address: 00000002ffffffe3
> [   34.680272] #PF: supervisor read access in kernel mode
> [   34.680274] #PF: error_code(0x0000) - not-present page
> [   34.680275] PGD 0 P4D 0 
> [   34.680278] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   34.680280] CPU: 3 PID: 3252 Comm: Chroot Helper Not tainted 6.9.0 #1
> [   34.680282] Hardware name: Dell Inc. Inspiron 7405 2n1/0XMJN6, BIOS 1.19.0 07/10/2024
> [   34.680284] RIP: 0010:unlink_anon_vmas+0x97/0x1e0
> [   34.680288] Code: 83 c0 22 49 89 47 18 e8 a7 19 02 00 48 8b 43 10 4c 8d 63 10 49 89 df 48 83 e8 10 4d 39 ec 74 48 48 89 c3 4d 8b 77 08 48 89 ef <49> 8b 2e 48 39 fd 74 12 48 85 ff 0f 85 06 01 00 00 48 8d 7d 08 e8
> [   34.680290] RSP: 0018:ffffb41842c2f918 EFLAGS: 00010246
> [   34.680292] RAX: 0000000080000000 RBX: ffff98528ab2cb00 RCX: 0000000000000000
> [   34.680293] RDX: ffff98528ab2cb10 RSI: ffff98528862b008 RDI: 0000000000000000
> [   34.680294] RBP: 0000000000000000 R08: 000000000000000f R09: 0000000000000060
> [   34.680296] R10: 0000000000400030 R11: 0000000000000004 R12: ffff98528ab2c010
> [   34.680297] R13: ffff98525ce97060 R14: 00000002ffffffe3 R15: ffff98528ab2c000
> [   34.680298] FS:  0000000000000000(0000) GS:ffff98553f780000(0000) knlGS:0000000000000000
> [   34.680300] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   34.680301] CR2: 00000002ffffffe3 CR3: 000000014c630000 CR4: 0000000000350ef0
> [   34.680302] Call Trace:
> [...]

See the ticket for more details and the bisection result. Skyler, the
reporter (CCed), later also added:

> Occasionally I will not get the usual bad page map error, but
> instead some BTRFS  errors followed by the file system going read-only.

Note, we had and earlier regression caused by this change reported by
Chris Hixon that maybe was not solved completely:
https://lore.kernel.org/all/3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com/


Chris Hixon: do you still encounter errors, or was your issue
resolved/vanished somehow?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

P.S.: let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: 2105e8e00d
#regzbot title: HID: amd_sfh: Memory Errors / Page Faults / btrfs going
read-only
#regzbot from: Skyler <skpu@pm.me>
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=219331
#regzbot ignore-activity


Return-Path: <linux-input+bounces-5069-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C756933C20
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 13:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E43B1F21F52
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 11:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C472E64A;
	Wed, 17 Jul 2024 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="2DFLvslO"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C959B38385;
	Wed, 17 Jul 2024 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721215281; cv=none; b=GVlJIQxJsnSCWUlN4UxhWceHiXD/xfE6FmY9tbme+5PKSrZ4qYeI9pA8/8lKqpJZcTvj1agy6qRnTxFdoEsdcNHdKLxf2pSRVAVeIWhlodwHy1LhegzLaJ1Sb3d9NUvyQzJabxuFIF1JnHhn62oId4u0E3kEBgotP4fXp/C7XYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721215281; c=relaxed/simple;
	bh=d1KXfcBQN0agpka6/PWyLmlfLfAeyk7ZEdT5xSeADSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=MVJX+tjMsfjeNfzsNbuc0VEhlQIsTvHjVWl5uAy6cP5zmCDYQyNdZzDZ++YEt70y/1opxiMSNnxCg9Y/xB3Gk3X/ChEJAaCQUxFYplOGNL7B1r1AFxDMkzEyi8lsyIIA4tYQTCwxBsglzJfCILKS/+dxuJsYTnZ30VU0VzANjQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=2DFLvslO; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=2nYI4bBxYXi13quVm2uGOxgPUFicjhWQUweSg4nZk4Y=;
	t=1721215278; x=1721647278; b=2DFLvslOI+/fHo3nl7V/Ru5gyaMc948o/oOPnAzJHydbzhK
	RGeWG6VKiJCQQts5Bh/+itfdk8fnMF9FlsWW7KsEQYljp1vUln78XTYJCaq7ZMFKT+GQiX2RgJAG3
	UgW/a/Afrft+sBrJTaIo0txi8VKXALoxiIF1wFmr6b+jP5n2yzTt3hXrKAQjVZQa288+7+JTiDqs7
	SPheBgkxlgT/NjrDUG8nC7LNlEJoZBUtKDKFa9ziu9FiTCglRYj7D8V1bc70g2r0dB5H9BIN5uAU2
	pk65FtbwDPye7K21BaAxKA+Ji9rwua9m7J99o4devFplhOLcaBx7lcxrxDX0Hc9g==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sU2ic-0006oY-De; Wed, 17 Jul 2024 13:21:10 +0200
Message-ID: <ade43b5b-9b93-40a8-acbf-99df944b45f9@leemhuis.info>
Date: Wed, 17 Jul 2024 13:21:09 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] HID: amd_sfh (drivers/hid/amd-sfh-hid/): memory/page
 corruption
To: Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires <bentiss@kernel.org>
References: <3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Li Ma <li.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 yifan1.zhang@amd.com, linux-kernel-bugs@hixontech.com,
 linux-input@vger.kernel.org, Basavaraj Natikar <basavaraj.natikar@amd.com>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1721215278;a41decca;
X-HE-SMSGID: 1sU2ic-0006oY-De

On 15.07.24 06:39, Chris Hixon wrote:
> System: HP ENVY x360 Convertible 15-ds1xxx; AMD Ryzen 7 4700U with
> Radeon Graphics
> 
> Problem commits (introduced in v6.9-rc1):
> 6296562f30b1 HID: amd_sfh: Extend MP2 register access to SFH
> 2105e8e00da4 HID: amd_sfh: Improve boot time when SFH is available
>> It appears amd_sfh commits 6296562f30b1 and 2105e8e00da4 correlate with
> some form of memory/page corruption. 

Hi! From a quick search on lore it looks like Basavaraj Natikar who
authored those two commits is inactive since a few days. This is totally
fine, but given the nature of the problem slightly unfortunate. That's
why I'm trying to raise awareness to this report by adding the
subsystems maintainers, a few lists, and a few people to the list of
recipients that were involved in the submission of those two patches.
With a bit of luck somebody might be able to help out. Ciao, Thorsten

> On my system, this typically
> presents itself as a page dump followed by BTRFS errors, usually
> involving "corrupt leaf" (see dmesg output below); often the BTRFS
> filesystem becomes read-only afterwards. Note that the underlying NVME
> disk seems fine, and the BTRFS filesystem does not actually appear to be
> corrupt when booted/checked from kernels without this bug (no BTRFS
> errors or I/O errors reported on non-problem kernels).
> 
> I have no problems when I blacklist the amd_sfh module (any kernel
> version), or revert both commits 6296562f30b1 and 2105e8e00da4 (on
> stable, linux-6.9.y). I have no problems on any recent linux-mainline
> (v6.10{,-rc*}) when reverting these two commits (in addition to
> reverting 7902ec988a9a and 6856f079cd45 to successfully build the
> kernel). I have had no problems with any 6.6.y, v6.7.y, or v6.8.y version.
> 
> It is curious BTRFS always seems involved, but problems go away with
> these amd_sfh commits reverted (or amd_afh disabled).
> 
> Further notes:
> 
> I have not specifically used the amd_sfh module for anything. As far
> I've been able to determine, my system has the "Sensor Fusion Hub" mp2
> chip, but has no supported sensors/sub-devices (or I need to do
> something to enable them), (or there is an error while detecting
> sensors?). All logs I've checked contain something like:
> 
> Jul 09 04:14:37 arch kernel: pcie_mp2_amd 0000:04:00.7: enabling device
> (0000 -> 0002)
> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7: Failed to
> discover, sensors not enabled is 0
> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7:
> amd_sfh_hid_client_init failed err -95
> 
> Excerpt from lshw:
>            *-generic:1 UNCLAIMED
>                 description: Signal processing controller
>                 product: Sensor Fusion Hub
>                 vendor: Advanced Micro Devices, Inc. [AMD]
>                 physical id: 0.7
>                 bus info: pci@0000:04:00.7
>                 version: 00
>                 width: 32 bits
>                 clock: 33MHz
>                 capabilities: pm pciexpress msi msix cap_list
>                 configuration: latency=0
>                 resources: memory:fe000000-fe0fffff
> memory:fe4cc000-fe4cdfff
> 
> How I tracked down the problem commits:
> 
> I was not able to successfully "git bisect" this bug - I seemed to run
> into a mess of unrelated problems/errors that sent me down a rabbit hole
> chasing who knows what. I had already manually narrowed down the bug to
> amd_sfh by blacklisting modules, so I reverted each
> drivers/hid/amd-sfh-hid commit on the stable linux-6.9.y branch (v6.9.8
> known "bad"), back to v6.6 (known "good"), and then manually bisected
> the revert commits, landing on "HID: amd_sfh: Improve boot time when SFH
> is available" (2105e8e00da4) as the first "bad" commit.
> 
> I wanted to be able to test with only the "bad" commit(s) removed; it
> turns out 6296562f30b1 ("HID: amd_sfh: Extend MP2 register access to
> SFH") needs to be reverted to do that. Everything seems fine with these
> two commits reverted (again, this in on the stable linux-6.9.y branch).
> 
> When testing, "bad" commits usually quickly display some variation of
> the page dump/BTRFS errors, similar to the dmesg output below. I
> consider commits "good" if the system survives "stress-ng --all 2
> --vm-bytes 50% --minimize --syslog --status 10 -t 5m" (run as a non-root
> user), which was usually followed by building the next test kernel. The
> "bad" commits often show errors before I even get to the stress test.
> 
> Examples of error messages from dmesg:
> 
> [  653.364343] page: refcount:4 mapcount:0 mapping:00000000b159289f
> index:0x585a7cec pfn:0x10b5c1
> [  653.364353] memcg:ffff8f2600918000
> [  653.364354] aops:btree_aops ino:1
> [  653.364358] flags:
> 0x17ffffd000802a(uptodate|lru|private|writeback|node=0|zone=2|lastcpupid=0x1fffff)
> [  653.364361] page_type: 0xffffffff()
> [  653.364363] raw: 0017ffffd000802a fffff1da87ee3288 fffff1da842d70c8
> ffff8f260c719458
> [  653.364365] raw: 00000000585a7cec ffff8f26cd09e0f0 00000004ffffffff
> ffff8f2600918000
> [  653.364366] page dumped because: eb page dump
> [  653.364367] BTRFS critical (device dm-0): corrupt leaf: root=7
> block=6071604133888 slot=159, unexpected item end, have 2768254010
> expect 13379
> [  653.364371] BTRFS info (device dm-0): leaf 6071604133888 gen 679995
> total ptrs 353 free space 322 owner 7
> [  653.364373]     item 0 key (18446744073709551606 128 1062871883776)
> itemoff 16271 itemsize 12
> [  653.364375]     item 1 key (18446744073709551606 128 1062871896064)
> itemoff 16263 itemsize 8
> [  653.364376]     item 2 key (18446744073709551606 128 1062871904256)
> itemoff 16255 itemsize 8
> ...
> [  653.364762]     item 350 key (18446744073709551606 128 1062879260672)
> itemoff 9227 itemsize 12
> [  653.364763]     item 351 key (18446744073709551606 128 1062879272960)
> itemoff 9223 itemsize 4
> [  653.364764]     item 352 key (18446744073709551606 128 1062879277056)
> itemoff 9147 itemsize 76
> [  653.364766] BTRFS error (device dm-0): block=6071604133888 write time
> tree block corruption detected
> [  653.375440] BTRFS: error (device dm-0) in
> btrfs_commit_transaction:2511: errno=-5 IO failure (Error while writing
> out transaction)
> [  653.375453] BTRFS info (device dm-0 state E): forced readonly
> [  653.375458] BTRFS warning (device dm-0 state E): Skipping commit of
> aborted transaction.
> [  653.375461] BTRFS error (device dm-0 state EA): Transaction aborted
> (error -5)
> [  653.375465] BTRFS: error (device dm-0 state EA) in
> cleanup_transaction:2005: errno=-5 IO failure
> [  653.375582] BTRFS warning (device dm-0 state EA): Skipping commit of
> aborted transaction.
> [  653.375586] BTRFS: error (device dm-0 state EA) in
> cleanup_transaction:2005: errno=-5 IO failure
> 
> Another example:
> 
> [ 5478.134046] page: refcount:4 mapcount:0 mapping:0000000010080c01
> index:0x5459ff30 pfn:0x168c7f
> [ 5478.134054] memcg:ffff89c240988000
> [ 5478.134056] aops:btree_aops ino:1
> [ 5478.134061] flags:
> 0x17ffffd800802a(uptodate|lru|private|writeback|node=0|zone=2|lastcpupid=0x1fffff)
> [ 5478.134064] page_type: 0xffffffff()
> [ 5478.134066] raw: 0017ffffd800802a ffffcc5d043e2bc8 ffffcc5d05a08c88
> ffff89c249968338
> [ 5478.134068] raw: 000000005459ff30 ffff89c246fa22d0 00000004ffffffff
> ffff89c240988000
> [ 5478.134069] page dumped because: eb page dump
> [ 5478.134071] BTRFS critical (device dm-0): corrupt leaf: root=2161
> block=5796594384896 slot=84 ino=2434728, invalid inode generation: has
> 72057594122450740 expect (0, 664473]
> [ 5478.134075] BTRFS info (device dm-0): leaf 5796594384896 gen 664472
> total ptrs 120 free space 1223 owner 2161
> [ 5478.134077]  item 0 key (2434713 24 3817753667) itemoff 16210
> itemsize 73
> [ 5478.134078]  item 1 key (2434713 108 0) itemoff 15359 itemsize 851
> [ 5478.134080]          inline extent data size 830
> [ 5478.134081]  item 2 key (2434714 1 0) itemoff 15199 itemsize 160
> [ 5478.134082]          inode generation 636724 size 758 mode 100644
> [ 5478.134083]  item 3 key (2434714 12 2348495) itemoff 15181 itemsize 18
>   ...
> [ 5478.134242]  item 117 key (2434733 108 0) itemoff 4398 itemsize 329
> [ 5478.134243]          inline extent data size 308
> [ 5478.134244]  item 118 key (2434734 1 0) itemoff 4238 itemsize 160
> [ 5478.134245]          inode generation 636724 size 30 mode 40755
> [ 5478.134245]  item 119 key (2434734 12 2434375) itemoff 4223 itemsize 15
> [ 5478.134247] BTRFS error (device dm-0): block=5796594384896 write time
> tree block corruption detected
> [ 5478.263726] BTRFS: error (device dm-0) in
> btrfs_commit_transaction:2511: errno=-5 IO failure (Error while writing
> out transaction)
> [ 5478.263733] BTRFS info (device dm-0 state E): forced readonly
> [ 5478.263736] BTRFS warning (device dm-0 state E): Skipping commit of
> aborted transaction.
> [ 5478.263737] BTRFS error (device dm-0 state EA): Transaction aborted
> (error -5)
> [ 5478.263739] BTRFS: error (device dm-0 state EA) in
> cleanup_transaction:2005: errno=-5 IO failure
> [ 5478.264582] BTRFS warning (device dm-0 state EA): Skipping commit of
> aborted transaction.
> [ 5478.264595] BTRFS: error (device dm-0 state EA) in
> cleanup_transaction:2005: errno=-5 IO failure

#regzbot ^introduced: 6296562f30b1
#regzbot summary: hid: amd_sfh: memory/page corruption correlated with
6296562f30b1 or 2105e8e00da4
#regzbot ignore-activity


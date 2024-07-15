Return-Path: <linux-input+bounces-5031-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B19930D4C
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 06:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49BA51C20A08
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 04:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5F41843;
	Mon, 15 Jul 2024 04:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hixontech.com header.i=linux-kernel-bugs@hixontech.com header.b="fw7T3VDV"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C50A2D
	for <linux-input@vger.kernel.org>; Mon, 15 Jul 2024 04:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721018368; cv=pass; b=cKXpCG8w1O2vzkAhunngzK/OyCG4ToV6FavBlTLvNvHyWjHpuuT16TvAuDLBCDUOVMi7diV5Uwi/MNhfHBuWm3iiFmdlpgC0ZCjlB5GdHAW/Wtn86U/xH6Bkr+7TTaHbfaARtvtjZONm6lwdYwSz1AEd3XT9BRMr+INl3B7iqEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721018368; c=relaxed/simple;
	bh=mihUd6WauvrQsAoAjUpwI3+n7omvme7QXWKXGZJGboM=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=HCWp9v2YWx84fKjUaq8AMPT4drbYFtrnGZRZmDhBzRZ+JPjeti6M8dhhH+obIYg0vJPNmNS8G6CqlrL1oTfWWb9fFc0MyI4TTwEjEnkrcRacWkCdisWBY5QzcM8vApEr8VjSPuvt5pOUTl/5SmtsKQNNURhE2Tu/Kkd4fo8iD8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hixontech.com; spf=pass smtp.mailfrom=hixontech.com; dkim=pass (1024-bit key) header.d=hixontech.com header.i=linux-kernel-bugs@hixontech.com header.b=fw7T3VDV; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hixontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hixontech.com
ARC-Seal: i=1; a=rsa-sha256; t=1721018362; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ARoZFaNPwMlYTZwuWNceAzfg1U8uqQHCsvDVjWBU3IUWYi94wkUYYtX0u5kD1Bomt5suB72yZVCCgDoRLpIKhu1J6XjPfFuahc7l0mKiPTIZGxV2BItBJyTi46nb2PMstnUDpxBechJLpGRZGFNKBSjiZUJwVU+MMza8B9m0cF0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721018362; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=mihUd6WauvrQsAoAjUpwI3+n7omvme7QXWKXGZJGboM=; 
	b=NWiNd7eYUyLtZ9ztjY7ub7vUINAfzMAP50itBMOH5s6mDePHvwtTEKr7E2vVXKOFZTckVSFerdaroJA8af5RbKjjmsMhzOdcvut2KkMM3pyskc27FJHh8ncDbxGsWMrmpZRhnjDBpXrtKo8rMCfQUaTQDivys4zHueezsZSo5Bk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=hixontech.com;
	spf=pass  smtp.mailfrom=linux-kernel-bugs@hixontech.com;
	dmarc=pass header.from=<linux-kernel-bugs@hixontech.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721018362;
	s=zoho; d=hixontech.com; i=linux-kernel-bugs@hixontech.com;
	h=Message-ID:Date:Date:MIME-Version:Reply-To:Reply-To:From:From:To:To:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Cc;
	bh=mihUd6WauvrQsAoAjUpwI3+n7omvme7QXWKXGZJGboM=;
	b=fw7T3VDV18RoXnjde9dTktXiUKT7d1Ol+udeAnuQTj8lV7vjnd5Z6s/nw6HnEOhO
	Z+Fc5LeJvCdb05eQmqziTD6wtAnHFNlJvvDKGEg6bsi0WjVeQZZeOPs3QKcjwjM7aRP
	ZSxITSdobBVQN2d7aPY/1u1cEtWtK7ILEIP882ok=
Received: by mx.zohomail.com with SMTPS id 1721018360022865.3104933400648;
	Sun, 14 Jul 2024 21:39:20 -0700 (PDT)
Message-ID: <3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com>
Date: Sun, 14 Jul 2024 22:39:18 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
Reply-To: linux-kernel-bugs@hixontech.com
From: Chris Hixon <linux-kernel-bugs@hixontech.com>
To: linux-input@vger.kernel.org, Basavaraj Natikar <basavaraj.natikar@amd.com>
Subject: [BUG] HID: amd_sfh (drivers/hid/amd-sfh-hid/): memory/page corruption
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

System: HP ENVY x360 Convertible 15-ds1xxx; AMD Ryzen 7 4700U with=20
Radeon Graphics

Problem commits (introduced in v6.9-rc1):
6296562f30b1 HID: amd_sfh: Extend MP2 register access to SFH
2105e8e00da4 HID: amd_sfh: Improve boot time when SFH is available

It appears amd_sfh commits 6296562f30b1 and 2105e8e00da4 correlate with=20
some form of memory/page corruption. On my system, this typically=20
presents itself as a page dump followed by BTRFS errors, usually=20
involving "corrupt leaf" (see dmesg output below); often the BTRFS=20
filesystem becomes read-only afterwards. Note that the underlying NVME=20
disk seems fine, and the BTRFS filesystem does not actually appear to be=20
corrupt when booted/checked from kernels without this bug (no BTRFS=20
errors or I/O errors reported on non-problem kernels).

I have no problems when I blacklist the amd_sfh module (any kernel=20
version), or revert both commits 6296562f30b1 and 2105e8e00da4 (on=20
stable, linux-6.9.y). I have no problems on any recent linux-mainline=20
(v6.10{,-rc*}) when reverting these two commits (in addition to=20
reverting 7902ec988a9a and 6856f079cd45 to successfully build the=20
kernel). I have had no problems with any 6.6.y, v6.7.y, or v6.8.y version=
.

It is curious BTRFS always seems involved, but problems go away with=20
these amd_sfh commits reverted (or amd_afh disabled).

Further notes:

I have not specifically used the amd_sfh module for anything. As far=20
I've been able to determine, my system has the "Sensor Fusion Hub" mp2=20
chip, but has no supported sensors/sub-devices (or I need to do=20
something to enable them), (or there is an error while detecting=20
sensors?). All logs I've checked contain something like:

Jul 09 04:14:37 arch kernel: pcie_mp2_amd 0000:04:00.7: enabling device=20
(0000 -> 0002)
Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7: Failed to=20
discover, sensors not enabled is 0
Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7:=20
amd_sfh_hid_client_init failed err -95

Excerpt from lshw:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *-generic:1=
 UNCLAIMED
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 description: Signal processing controller
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 product: Sensor Fusion Hub
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 vendor: Advanced Micro Devices, Inc. [AMD]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 physical id: 0.7
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 bus info: pci@0000:04:00.7
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 version: 00
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 width: 32 bits
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 clock: 33MHz
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 capabilities: pm pciexpress msi msix cap_list
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 configuration: latency=3D0
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 resources: memory:fe000000-fe0fffff=20
memory:fe4cc000-fe4cdfff

How I tracked down the problem commits:

I was not able to successfully "git bisect" this bug - I seemed to run=20
into a mess of unrelated problems/errors that sent me down a rabbit hole=20
chasing who knows what. I had already manually narrowed down the bug to=20
amd_sfh by blacklisting modules, so I reverted each=20
drivers/hid/amd-sfh-hid commit on the stable linux-6.9.y branch (v6.9.8=20
known "bad"), back to v6.6 (known "good"), and then manually bisected=20
the revert commits, landing on "HID: amd_sfh: Improve boot time when SFH=20
is available" (2105e8e00da4) as the first "bad" commit.

I wanted to be able to test with only the "bad" commit(s) removed; it=20
turns out 6296562f30b1 ("HID: amd_sfh: Extend MP2 register access to=20
SFH") needs to be reverted to do that. Everything seems fine with these=20
two commits reverted (again, this in on the stable linux-6.9.y branch).

When testing, "bad" commits usually quickly display some variation of=20
the page dump/BTRFS errors, similar to the dmesg output below. I=20
consider commits "good" if the system survives "stress-ng --all 2=20
--vm-bytes 50% --minimize --syslog --status 10 -t 5m" (run as a non-root=20
user), which was usually followed by building the next test kernel. The=20
"bad" commits often show errors before I even get to the stress test.

Examples of error messages from dmesg:

[=C2=A0 653.364343] page: refcount:4 mapcount:0 mapping:00000000b159289f=20
index:0x585a7cec pfn:0x10b5c1
[=C2=A0 653.364353] memcg:ffff8f2600918000
[=C2=A0 653.364354] aops:btree_aops ino:1
[=C2=A0 653.364358] flags:=20
0x17ffffd000802a(uptodate|lru|private|writeback|node=3D0|zone=3D2|lastcpu=
pid=3D0x1fffff)
[=C2=A0 653.364361] page_type: 0xffffffff()
[=C2=A0 653.364363] raw: 0017ffffd000802a fffff1da87ee3288 fffff1da842d70=
c8=20
ffff8f260c719458
[=C2=A0 653.364365] raw: 00000000585a7cec ffff8f26cd09e0f0 00000004ffffff=
ff=20
ffff8f2600918000
[=C2=A0 653.364366] page dumped because: eb page dump
[=C2=A0 653.364367] BTRFS critical (device dm-0): corrupt leaf: root=3D7=20
block=3D6071604133888 slot=3D159, unexpected item end, have 2768254010=20
expect 13379
[=C2=A0 653.364371] BTRFS info (device dm-0): leaf 6071604133888 gen 6799=
95=20
total ptrs 353 free space 322 owner 7
[=C2=A0 653.364373]=C2=A0=C2=A0=C2=A0=C2=A0 item 0 key (18446744073709551=
606 128 1062871883776)=20
itemoff 16271 itemsize 12
[=C2=A0 653.364375]=C2=A0=C2=A0=C2=A0=C2=A0 item 1 key (18446744073709551=
606 128 1062871896064)=20
itemoff 16263 itemsize 8
[=C2=A0 653.364376]=C2=A0=C2=A0=C2=A0=C2=A0 item 2 key (18446744073709551=
606 128 1062871904256)=20
itemoff 16255 itemsize 8
...
[=C2=A0 653.364762]=C2=A0=C2=A0=C2=A0=C2=A0 item 350 key (184467440737095=
51606 128 1062879260672)=20
itemoff 9227 itemsize 12
[=C2=A0 653.364763]=C2=A0=C2=A0=C2=A0=C2=A0 item 351 key (184467440737095=
51606 128 1062879272960)=20
itemoff 9223 itemsize 4
[=C2=A0 653.364764]=C2=A0=C2=A0=C2=A0=C2=A0 item 352 key (184467440737095=
51606 128 1062879277056)=20
itemoff 9147 itemsize 76
[=C2=A0 653.364766] BTRFS error (device dm-0): block=3D6071604133888 writ=
e time=20
tree block corruption detected
[=C2=A0 653.375440] BTRFS: error (device dm-0) in=20
btrfs_commit_transaction:2511: errno=3D-5 IO failure (Error while writing=
=20
out transaction)
[=C2=A0 653.375453] BTRFS info (device dm-0 state E): forced readonly
[=C2=A0 653.375458] BTRFS warning (device dm-0 state E): Skipping commit =
of=20
aborted transaction.
[=C2=A0 653.375461] BTRFS error (device dm-0 state EA): Transaction abort=
ed=20
(error -5)
[=C2=A0 653.375465] BTRFS: error (device dm-0 state EA) in=20
cleanup_transaction:2005: errno=3D-5 IO failure
[=C2=A0 653.375582] BTRFS warning (device dm-0 state EA): Skipping commit=
 of=20
aborted transaction.
[=C2=A0 653.375586] BTRFS: error (device dm-0 state EA) in=20
cleanup_transaction:2005: errno=3D-5 IO failure

Another example:

[ 5478.134046] page: refcount:4 mapcount:0 mapping:0000000010080c01=20
index:0x5459ff30 pfn:0x168c7f
[ 5478.134054] memcg:ffff89c240988000
[ 5478.134056] aops:btree_aops ino:1
[ 5478.134061] flags:=20
0x17ffffd800802a(uptodate|lru|private|writeback|node=3D0|zone=3D2|lastcpu=
pid=3D0x1fffff)
[ 5478.134064] page_type: 0xffffffff()
[ 5478.134066] raw: 0017ffffd800802a ffffcc5d043e2bc8 ffffcc5d05a08c88=20
ffff89c249968338
[ 5478.134068] raw: 000000005459ff30 ffff89c246fa22d0 00000004ffffffff=20
ffff89c240988000
[ 5478.134069] page dumped because: eb page dump
[ 5478.134071] BTRFS critical (device dm-0): corrupt leaf: root=3D2161=20
block=3D5796594384896 slot=3D84 ino=3D2434728, invalid inode generation: =
has=20
72057594122450740 expect (0, 664473]
[ 5478.134075] BTRFS info (device dm-0): leaf 5796594384896 gen 664472=20
total ptrs 120 free space 1223 owner 2161
[ 5478.134077]=C2=A0 item 0 key (2434713 24 3817753667) itemoff 16210 ite=
msize 73
[ 5478.134078]=C2=A0 item 1 key (2434713 108 0) itemoff 15359 itemsize 85=
1
[ 5478.134080]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inli=
ne extent data size 830
[ 5478.134081]=C2=A0 item 2 key (2434714 1 0) itemoff 15199 itemsize 160
[ 5478.134082]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inod=
e generation 636724 size 758 mode 100644
[ 5478.134083]=C2=A0 item 3 key (2434714 12 2348495) itemoff 15181 itemsi=
ze 18
 =C2=A0 ...
[ 5478.134242]=C2=A0 item 117 key (2434733 108 0) itemoff 4398 itemsize 3=
29
[ 5478.134243]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inli=
ne extent data size 308
[ 5478.134244]=C2=A0 item 118 key (2434734 1 0) itemoff 4238 itemsize 160
[ 5478.134245]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inod=
e generation 636724 size 30 mode 40755
[ 5478.134245]=C2=A0 item 119 key (2434734 12 2434375) itemoff 4223 items=
ize 15
[ 5478.134247] BTRFS error (device dm-0): block=3D5796594384896 write tim=
e=20
tree block corruption detected
[ 5478.263726] BTRFS: error (device dm-0) in=20
btrfs_commit_transaction:2511: errno=3D-5 IO failure (Error while writing=
=20
out transaction)
[ 5478.263733] BTRFS info (device dm-0 state E): forced readonly
[ 5478.263736] BTRFS warning (device dm-0 state E): Skipping commit of=20
aborted transaction.
[ 5478.263737] BTRFS error (device dm-0 state EA): Transaction aborted=20
(error -5)
[ 5478.263739] BTRFS: error (device dm-0 state EA) in=20
cleanup_transaction:2005: errno=3D-5 IO failure
[ 5478.264582] BTRFS warning (device dm-0 state EA): Skipping commit of=20
aborted transaction.
[ 5478.264595] BTRFS: error (device dm-0 state EA) in=20
cleanup_transaction:2005: errno=3D-5 IO failure



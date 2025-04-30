Return-Path: <linux-input+bounces-12088-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03BAA5504
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 21:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88FB39C0497
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 19:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1FC20E32B;
	Wed, 30 Apr 2025 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hboeck.de header.i=@hboeck.de header.b="FuoljF3/"
X-Original-To: linux-input@vger.kernel.org
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DB01E9B3A;
	Wed, 30 Apr 2025 19:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.68.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042512; cv=none; b=LMP6NzmmoNqnNbihitvcpfJedSVpsEyjqEM8XFbHB3Ji/C4d8v6AQs8k2QTRhl3Q1plVByy2EF2A9VfgQsbirKmQfIePWs0z+ZkXrdIpIFVTIdY1uY5oHZAZ7ciy9czt+ErbIRskBMI4cP9H/brXg1cIsH8WGlmqDoJoFKWivtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042512; c=relaxed/simple;
	bh=vIXBsceJywR8lxkQXHTvqCxXPpEsE5ob+i7eM7Lw1wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZKc6VDzCwQIu7cYyQJnsr84tFtcKsVxGnTCYD4ye6/pltMVgz6F0vNpoDJqEadtiGNDih5yE59as3MqNDnR+5Tp45rdqJtX4VAmnXzctkaDTi00snjK8d9HUgPo+sKUhDvpH2FlKedkf/OruFsF2OcDi5TCyFAiSeCZCOIRQrOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hboeck.de; spf=pass smtp.mailfrom=hboeck.de; dkim=pass (2048-bit key) header.d=hboeck.de header.i=@hboeck.de header.b=FuoljF3/; arc=none smtp.client-ip=178.63.68.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hboeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hboeck.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hboeck.de; s=key1;
	t=1746041898; bh=eTaDm98D/en97YYrn4m0socY7fqhyB9xFUhKJAjwdrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=FuoljF3/nr41SJmTdH9DXOPKNJuSIdOJyK9ph8FX2zWZA8f65y1fEZuqcPiXK2aUL
	 wqdU0H+ZTStw8O6MyghFuCgzy1SUQlSiTJ3hrW9n7TH9brrmsQzZj+bbPG6tVD/e7B
	 ooR1fN91LH/ocj6dpTgY5pGO8D/2yD9M8pbZrt9tlrcXcQIc2JRTC2W3pN1IId7+F9
	 nT1uuT4243ELAdXHBVzsDMVGfu3yoUfkwvpiau7U2a34Hi8WVOUMUgGdnX7uvuIDvi
	 CN/KczyOnp9cKkX/+bLUDdNS3ztnT6DTD/rs+37toRWqlxqaIXV+KwkhHMaIDagdt6
	 dmuZJWgw/mEGw==
Original-Subject: linux/rmi4 driver: "BUG: kernel NULL pointer dereference" when
 accessing update_fw_status or bootloader_id
Author: Hanno =?UTF-8?B?QsO2Y2s=?= <hanno@hboeck.de>
Original-Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz
Date: Wed, 30 Apr 2025 21:38:16 +0200
From: Hanno =?UTF-8?B?QsO2Y2s=?= <hanno@hboeck.de>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
  david@ixit.cz
Subject: linux/rmi4 driver: "BUG: kernel NULL pointer dereference" when
 accessing update_fw_status or bootloader_id
Message-ID: <20250430213816.7527e190@hboeck.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed that trying to read some sysfs entries created by the rmi4
driver cause a kernel oops (BUG: kernel NULL pointer dereference).

This can be triggered simply by running cat on these files, also as a
user. Tested on a current vanilla kernel (6.14.4).
It happens when trying to read from one of these files (exact path
likely will differ depending on system):
/sys/devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/update_fw_status
/sys/devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/bootloader_id

This is on a Lenovo X1 Carbon 2018 edition, lsusb lists the touchpad as:
Bus 001 Device 010: ID 06cb:009a Synaptics, Inc. Metallica MIS Touch
Fingerprint Reader

The dmesg output for an access to bootloader_id:
[   68.184846] BUG: kernel NULL pointer dereference, address: 0000000000000=
008
[   68.184866] #PF: supervisor read access in kernel mode
[   68.184875] #PF: error_code(0x0000) - not-present page
[   68.184882] PGD 0 P4D 0=20
[   68.184892] Oops: Oops: 0000 [#1] SMP
[   68.184902] CPU: 6 UID: 1000 PID: 4704 Comm: cat Tainted: G     U       =
      6.14.4 #2
[   68.184915] Tainted: [U]=3DUSER
[   68.184919] Hardware name: LENOVO 20KHCTO1WW/20KHCTO1WW, BIOS N23ET90W (=
1.65 ) 11/07/2024
[   68.184926] RIP: 0010:rmi_driver_bootloader_id_show+0x1d/0x60
[   68.184964] Code: 98 c3 66 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 =
d7 48 8b 40 78 48 8b 50 20 31 c0 48 85 d2 74 3f 55 48 8b 82 90 00 00 00 <80=
> 78 08 05 0f b6 70 09 0f b6 50 0a 48 89 e5 74 12 89 f1 48 c7 c6
[   68.184973] RSP: 0018:ffffac4e419ebc28 EFLAGS: 00010286
[   68.184982] RAX: 0000000000000000 RBX: ffffffffb6d78700 RCX: 00000000000=
00000
[   68.184989] RDX: ffffa31782c28000 RSI: ffffffffb6d78700 RDI: ffffa317841=
50000
[   68.184995] RBP: ffffac4e419ebc48 R08: ffffa31782c22400 R09: ffffa317841=
50000
[   68.185000] R10: 0000000000001000 R11: ffffffffb56f8b0b R12: ffffffffb67=
2c590
[   68.185006] R13: ffffac4e419ebd30 R14: 0000000000000001 R15: ffffa317852=
11348
[   68.185013] FS:  00007f75e3a5a740(0000) GS:ffffa31ac2780000(0000) knlGS:=
0000000000000000
[   68.185021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   68.185028] CR2: 0000000000000008 CR3: 00000001a0448006 CR4: 00000000003=
726f0
[   68.185034] Call Trace:
[   68.185039]  <TASK>
[   68.185044]  ? dev_attr_show+0x15/0x40
[   68.185054]  sysfs_kf_seq_show+0x9c/0xe0
[   68.185065]  kernfs_seq_show+0x1c/0x20
[   68.185073]  seq_read_iter+0xf8/0x410
[   68.185082]  kernfs_fop_read_iter+0x12b/0x180
[   68.185091]  vfs_read+0x236/0x300
[   68.185102]  ksys_read+0x56/0xc0
[   68.185112]  __x64_sys_read+0x14/0x20
[   68.185122]  x64_sys_call+0x9f2/0xa00
[   68.185129]  do_syscall_64+0x63/0xf0
[   68.185141]  ? __count_memcg_events+0x49/0xe0
[   68.185152]  ? handle_mm_fault+0x1b1/0x2d0
[   68.185162]  ? irqentry_exit+0x19/0x30
[   68.185169]  ? exc_page_fault+0x190/0x5b0
[   68.185181]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   68.185189] RIP: 0033:0x7f75e3aeaad7
[   68.185196] Code: 20 49 89 d0 48 89 fa 4c 89 df e8 24 b4 00 00 8b 93 08 =
03 00 00 59 5e 48 83 f8 fc 74 16 5b c3 0f 1f 40 00 48 8b 44 24 10 0f 05 <5b=
> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 e2 e8 23 ff ff ff
[   68.185204] RSP: 002b:00007ffe9e258720 EFLAGS: 00000202 ORIG_RAX: 000000=
0000000000
[   68.185213] RAX: ffffffffffffffda RBX: 00007f75e3a5a740 RCX: 00007f75e3a=
eaad7
[   68.185220] RDX: 0000000000040000 RSI: 00007f75e36d0000 RDI: 00000000000=
00003
[   68.185226] RBP: 0000000000040000 R08: 0000000000000000 R09: 00000000000=
00000
[   68.185231] R10: 0000000000000000 R11: 0000000000000202 R12: 00007f75e36=
d0000
[   68.185237] R13: 0000000000000003 R14: 00007f75e3cb1000 R15: 00000000000=
00000
[   68.185244]  </TASK>
[   68.185248] Modules linked in: iwlmvm iwlwifi
[   68.185261] CR2: 0000000000000008
[   68.185267] ---[ end trace 0000000000000000 ]---
[   68.199705] pstore: backend (efi_pstore) writing error (-28)
[   68.199709] RIP: 0010:rmi_driver_bootloader_id_show+0x1d/0x60
[   68.199715] Code: 98 c3 66 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 =
d7 48 8b 40 78 48 8b 50 20 31 c0 48 85 d2 74 3f 55 48 8b 82 90 00 00 00 <80=
> 78 08 05 0f b6 70 09 0f b6 50 0a 48 89 e5 74 12 89 f1 48 c7 c6
[   68.199718] RSP: 0018:ffffac4e419ebc28 EFLAGS: 00010286
[   68.199721] RAX: 0000000000000000 RBX: ffffffffb6d78700 RCX: 00000000000=
00000
[   68.199723] RDX: ffffa31782c28000 RSI: ffffffffb6d78700 RDI: ffffa317841=
50000
[   68.199724] RBP: ffffac4e419ebc48 R08: ffffa31782c22400 R09: ffffa317841=
50000
[   68.199726] R10: 0000000000001000 R11: ffffffffb56f8b0b R12: ffffffffb67=
2c590
[   68.199727] R13: ffffac4e419ebd30 R14: 0000000000000001 R15: ffffa317852=
11348
[   68.199729] FS:  00007f75e3a5a740(0000) GS:ffffa31ac2780000(0000) knlGS:=
0000000000000000
[   68.199731] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   68.199733] CR2: 0000000000000008 CR3: 00000001a0448006 CR4: 00000000003=
726f0
[   68.199735] note: cat[4704] exited with irqs disabled


--=20
Hanno B=C3=B6ck
https://hboeck.de/


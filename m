Return-Path: <linux-input+bounces-14248-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB50B30286
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 20:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C4ABB62DB5
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 18:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB88A1F7569;
	Thu, 21 Aug 2025 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J5ziz2Gh"
X-Original-To: linux-input@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB0341658
	for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755802727; cv=none; b=H4iFCPus5kDdceCDRstz3/TzMyDgF/ISHokUgN+gxgWpDb0/No3EAA3+oShgZO8oV1alacJC/6jOE1/l79gKp2oK4uob4G3B5lMd7q5W+M3kUsVzqrK14cqlV8l5Xmxm5m+xl8/kqz5wW0+hLj45xS/3J/OVwU8VdzJwGLShcaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755802727; c=relaxed/simple;
	bh=1cPxiT1QgTT0XYuefHfZDg+z+FFI6OLAgUGcOoq9XT8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=N+znS94V30zgbBtvg8h5oFyHsWUzTORO8RuaADS55m83yUIFiIBkxup6mjt/VVKxfDMCVjxt2koAzAOkAzEOT4fp7n7JYoE78mdbwxQGaqXIX1Qlvp/nVoWug8Jzwcxr38zpwK95NhsG1Si43Cuo/WnYTnCuJ8PT5rNqOA/XgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J5ziz2Gh; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <a21abca5-4268-449d-95f1-bdd7a25894a5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755802721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nIHBXerXvxLlWBY42Ez5wa5DSjMfghdJoNp6IJ+jxkI=;
	b=J5ziz2GhuceJfXSoI2UR8yl6GCfoV7hdYig1JzHrpGQxihHKcue6M5hP+e8S+Rtvudm+Pf
	HZI/F6bbawdlk8fOcPhsQWKxAtlWqalAQG9J+bUu9uwbd9wUgPJDpNtEnLTq38x+bq4fLT
	bW5lU4FlHegxsj6i83FvtKv/2iyWi8M=
Date: Thu, 21 Aug 2025 11:58:35 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com
Cc: mario.limonciello@amd.com, linux-input@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [BUG] Kernel panic in amd_sfh on Lenovo Legion Go
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hello,

While using my Lenovo Legion Go handheld device on SteamOS, I have had many instances of warnings and occasional kernel panics in amd_sfh_work on their 6.15.8 kernel. Using kdumpst, I was able to get some logs for the most recent kernel panic:

<4>[  662.713733] ------------[ cut here ]------------
<4>[  662.713738] list_del corruption. prev->next should be ffff8ccc66a51e88, but was ffff8ccc5fc5d0e8. (prev=ffff8ccc41425280)
<4>[  662.713754] WARNING: CPU: 11 PID: 164 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0xfa/0x10a
<4>[  662.714204] CPU: 11 UID: 0 PID: 164 Comm: kworker/11:1 Tainted: G        W           6.15.8-valve1-2-neptune-615-g49248f4e2ad1 #1 PREEMPT(full)  64605a591817db76b46b95d73e86c4364b25c841
<4>[  662.714214] Tainted: [W]=WARN
<4>[  662.714218] Hardware name: LENOVO 83E1/LNVNB161216, BIOS N3CN37WW 12/06/2024
<4>[  662.714223] Workqueue: events amd_sfh_work [amd_sfh]
<4>[  662.714236] RIP: 0010:__list_del_entry_valid_or_report+0xfa/0x10a
<4>[  662.714245] Code: e8 cb 4a 0f 00 0f 0b e9 77 ff ff ff 4c 89 e7 e8 dc 0c 3b 00 49 8b 14 24 4c 89 e1 48 89 de 48 c7 c7 28 c7 13 b0 e8 a6 4a 0f 00 <0f> 0b e9 52 ff ff ff 5b 5d 41 5c e9 91 c6 eb ff 48 89 df e8 1e fe
<4>[  662.714250] RSP: 0018:ffffd12c806e3df8 EFLAGS: 00010246
<4>[  662.714257] RAX: 0000000000000000 RBX: ffff8ccc66a51e88 RCX: 0000000000000027
<4>[  662.714262] RDX: ffff8ccf0fedbd08 RSI: 0000000000000001 RDI: ffff8ccf0fedbd00
<4>[  662.714266] RBP: ffff8ccc41425280 R08: 0000000000000000 R09: 00000000fffdffff
<4>[  662.714270] R10: ffffffffb16d0120 R11: ffffd12c806e3c88 R12: ffff8ccc41425280
<4>[  662.714274] R13: ffff8ccc66a51e88 R14: 0000000000000000 R15: ffff8ccc66a51e80
<4>[  662.714278] FS:  0000000000000000(0000) GS:ffff8ccf5e88a000(0000) knlGS:0000000000000000
<4>[  662.714283] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  662.714287] CR2: 00000000c4f52010 CR3: 0000000164de1000 CR4: 0000000000f50ef0
<4>[  662.714292] PKRU: 55555554
<4>[  662.714296] Call Trace:
<4>[  662.714301]  <TASK>
<4>[  662.714310]  amd_sfh_work.cold+0x1c/0x21 [amd_sfh 590e26be9da743ed9c42d4473ff11e552461cd54]
<4>[  662.714323]  ? srso_alias_return_thunk+0x5/0xfbef5
<4>[  662.714333]  process_one_work+0x190/0x350
<4>[  662.714344]  worker_thread+0x2d7/0x410
<4>[  662.714353]  ? __pfx_worker_thread+0x10/0x10
<4>[  662.714360]  kthread+0xf9/0x240
<4>[  662.714370]  ? __pfx_kthread+0x10/0x10
<4>[  662.714378]  ret_from_fork+0x31/0x50
<4>[  662.714388]  ? __pfx_kthread+0x10/0x10
<4>[  662.714396]  ret_from_fork_asm+0x1a/0x30
<4>[  662.714411]  </TASK>
<4>[  662.714415] ---[ end trace 0000000000000000 ]---
<4>[  662.714577] Oops: general protection fault, probably for non-canonical address 0x32e31c55d8aa0687: 0000 [#1] SMP NOPTI
<4>[  662.714590] CPU: 4 UID: 0 PID: 162 Comm: kworker/4:1 Tainted: G        W           6.15.8-valve1-2-neptune-615-g49248f4e2ad1 #1 PREEMPT(full)  64605a591817db76b46b95d73e86c4364b25c841
<4>[  662.714601] Tainted: [W]=WARN
<4>[  662.714605] Hardware name: LENOVO 83E1/LNVNB161216, BIOS N3CN37WW 12/06/2024
<4>[  662.714609] Workqueue: events amd_sfh_work [amd_sfh]
<4>[  662.714622] RIP: 0010:amd_sfh_work+0x31/0x150 [amd_sfh]
<4>[  662.714631] Code: 00 00 41 57 41 56 41 55 41 54 55 53 48 89 fb 48 83 ec 08 4c 8b af c0 00 00 00 4c 8b 67 f8 49 8b 45 08 49 8b 4d 00 4d 8d 7d f8 <4c> 3b 28 0f 85 2b 3b 00 00 4c 3b 69 08 0f 85 21 3b 00 00 48 89 41
<4>[  662.714636] RSP: 0018:ffffd12c8068fe18 EFLAGS: 00010296
<4>[  662.714643] RAX: 32e31c55d8aa0687 RBX: ffff8ccc414251c8 RCX: dead000000000100
<4>[  662.714648] RDX: 0000000000000001 RSI: ffff8ccc42240ec6 RDI: ffff8ccc414251c8
<4>[  662.714652] RBP: ffff8ccc400b7800 R08: 8080808080808080 R09: 0000000000000000
<4>[  662.714656] R10: ffff8ccc400508c0 R11: fefefefefefefeff R12: ffff8ccc43ac4e58
<4>[  662.714659] R13: ffff8ccc66a51e88 R14: 0000000000000000 R15: ffff8ccc66a51e80
<4>[  662.714664] FS:  0000000000000000(0000) GS:ffff8ccf5e6ca000(0000) knlGS:0000000000000000
<4>[  662.714669] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  662.714673] CR2: 00007f7ccc5f9000 CR3: 0000000164de1000 CR4: 0000000000f50ef0
<4>[  662.714678] PKRU: 55555554
<4>[  662.714681] Call Trace:
<4>[  662.714687]  <TASK>
<4>[  662.714690]  ? srso_alias_return_thunk+0x5/0xfbef5
<4>[  662.714704]  process_one_work+0x190/0x350
<4>[  662.714715]  worker_thread+0x2d7/0x410
<4>[  662.714728]  ? __pfx_worker_thread+0x10/0x10
<4>[  662.714736]  kthread+0xf9/0x240
<4>[  662.714746]  ? __pfx_kthread+0x10/0x10
<4>[  662.714755]  ret_from_fork+0x31/0x50
<4>[  662.714763]  ? __pfx_kthread+0x10/0x10
<4>[  662.714772]  ret_from_fork_asm+0x1a/0x30
<4>[  662.714787]  </TASK>
<4>[  662.715218] ---[ end trace 0000000000000000 ]---

Full dmesg from pstore:

dmesg-pstore.202508210732-0: https://gist.github.com/matte-schwartz/f7d5fbc9eb6b47051fb5c3ea4d6ae32f
dmesg-pstore-202508210732-1: https://gist.github.com/matte-schwartz/a473354010a23ecb0b119024c960166d

Similar warnings in amd-sfh appeared intermittently earlier in my journal until eventually one triggered the kernel panic above.

The warnings appeared while I was leaving the device idle on Steam's GamepadUI home page while using gamescope. Because this bug is intermittent, I don't have a more reliable way to reproduce the issue other than leaving the device idle for extended periods of time.

Thanks,
Matthew


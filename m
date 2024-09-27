Return-Path: <linux-input+bounces-6816-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607198878D
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 16:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51A61283EB4
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 14:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948BE1C0DCD;
	Fri, 27 Sep 2024 14:52:35 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FA9158521
	for <linux-input@vger.kernel.org>; Fri, 27 Sep 2024 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727448755; cv=none; b=hdx8DgVgquY5566nGHZO6iH5M8omUa5BNkJbA6QPMxh0rFbOViYulIJemAq6Zd/8tl6/2N5nsx2DrrZg+44JnPTBAv2uHqwsXYE4SHYdZMwgKOkPmcmoiyFut7AQnA+hQyxjric+TMz5nE27M0zivW+xxnC4NBMwh6ejB8Nyvxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727448755; c=relaxed/simple;
	bh=Ld4ISu92u2NM7VzqIYcpy7U3ckIusrPOjhXV75ZLvp0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Clv0IC5LZuYeKwAhHbuQNMD0OWQTv0sqC3eoGAYzF8YZU2Yb7p5obPFju9/K/FCEUGUpP9Cx3InD1JXhDDgSjETenmomftAFOICneNE/Xfoh/5Uf8JnpHLDjGDcUQCT6dyWhFM6QEiUcFuH/EKp6d2/+JVZAnX65cLkZfBj4C0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a342620f50so19579985ab.3
        for <linux-input@vger.kernel.org>; Fri, 27 Sep 2024 07:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727448753; x=1728053553;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iPIbln5qr80FAIgYQB4BneGmDE5PaIYnAUCu7jqhOBs=;
        b=Uw9ipOzQ3NduUUpyoK7pFFb1hzAWL7y6WnyVJ2BGD6G/XRU8Lzpv/n9SYFUp44wBvn
         Tuu8lF/ZBMfhzFB8785/P88D52YFvstVB00Nxvusw8S2esjZrSwv0P4QyH9XYM0lKzP7
         KJTEZTWpv/XzFM0XYtASSAF+NFlqJPMZOVTAuwlKEQ8cWkIDwTqmAhJloQuy7CXFkqa7
         lVBaObx6UuKcs71qiRsNsXMEMmCsJ840SrenvE+Tun67QA4y8W08PbnAQFDgXh4Bu9dA
         EiKGBsHEvhkKKHMRoiDXTqXVgpt324fdCx57qrcbPZ1VAO+UCiiCX1OmBJvSar2cwFkD
         WEMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiVWAiph09WsA0scCGZPlzey8WUyvPhyVe3JobwEkhDLt0Fbqv14K5cn2NrATAWmTKqVSTKBo1S4btEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMIpj0pOLjW1eH3LaBnj4WpIbG4xbfdZE6/+UEm9Vn5iBCGv7U
	VZfm67Q34N+LG43pPASFM9Ia1jXiXJRP6av85mbsStnfUer1vS4c0zFJCxL9Zpj5kvL8mfG4x5i
	zH02r7N3kF0oygw1qiXbp+7TXdL9E9q/xz4jgYNjxDwMgRCe8s89cH2Y=
X-Google-Smtp-Source: AGHT+IFeA3bIZ7e4+1fSjQKbhGu4vNpDD111eDDZsZRTkIhC1K5vbzCO/DPGghsy9DPfF/HqSgwiPD3wdCGo2xWzf4f6aEjSDV9o
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca0c:0:b0:3a3:35f0:4c0c with SMTP id
 e9e14a558f8ab-3a3451b070dmr27211775ab.18.1727448752925; Fri, 27 Sep 2024
 07:52:32 -0700 (PDT)
Date: Fri, 27 Sep 2024 07:52:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66f6c6b0.050a0220.46d20.001b.GAE@google.com>
Subject: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in
 hiddev_disconnect (3)
From: syzbot <syzbot+b76a30cf04926010df03@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    baeb9a7d8b60 Merge tag 'sched-rt-2024-09-17' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10c7ae9f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d3981d50a2855c2
dashboard link: https://syzkaller.appspot.com/bug?extid=b76a30cf04926010df03
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-baeb9a7d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/02c319355ed9/vmlinux-baeb9a7d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/41f9f78e928c/bzImage-baeb9a7d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b76a30cf04926010df03@syzkaller.appspotmail.com

plantronics 0003:047F:FFFF.0008: hiddev0,hidraw1: USB HID v0.40 Device [HID 047f:ffff] on usb-dummy_hcd.0-1/input0
usb 5-1: USB disconnect, device number 15
==================================================================
BUG: KASAN: slab-use-after-free in debug_spin_lock_before kernel/locking/spinlock_debug.c:86 [inline]
BUG: KASAN: slab-use-after-free in do_raw_spin_lock+0x271/0x2c0 kernel/locking/spinlock_debug.c:115
Read of size 4 at addr ffff8880431f941c by task kworker/1:2/1449

CPU: 1 UID: 0 PID: 1449 Comm: kworker/1:2 Not tainted 6.11.0-syzkaller-07341-gbaeb9a7d8b60 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:119
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:488
 kasan_report+0xd9/0x110 mm/kasan/report.c:601
 debug_spin_lock_before kernel/locking/spinlock_debug.c:86 [inline]
 do_raw_spin_lock+0x271/0x2c0 kernel/locking/spinlock_debug.c:115
 __mutex_unlock_slowpath+0x197/0x650 kernel/locking/mutex.c:937
 hiddev_disconnect+0x15b/0x1c0 drivers/hid/usbhid/hiddev.c:940
 hid_disconnect+0xbb/0x1b0 drivers/hid/hid-core.c:2322
 hid_hw_stop drivers/hid/hid-core.c:2369 [inline]
 hid_device_remove+0x1a8/0x260 drivers/hid/hid-core.c:2757
 device_remove+0xc8/0x170 drivers/base/dd.c:566
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1295
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:574
 device_del+0x396/0x9f0 drivers/base/core.c:3871
 hid_remove_device drivers/hid/hid-core.c:2939 [inline]
 hid_destroy_device+0xe5/0x150 drivers/hid/hid-core.c:2959
 usbhid_disconnect+0xa0/0xe0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x1e8/0x970 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:568 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:560
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1295
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:574
 device_del+0x396/0x9f0 drivers/base/core.c:3871
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x1da5/0x4e10 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 1449:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:878 [inline]
 kzalloc_noprof include/linux/slab.h:1004 [inline]
 hiddev_connect+0x262/0x630 drivers/hid/usbhid/hiddev.c:893
 hid_connect+0x25e/0x18a0 drivers/hid/hid-core.c:2239
 hid_hw_start drivers/hid/hid-core.c:2349 [inline]
 hid_hw_start+0xaa/0x140 drivers/hid/hid-core.c:2340
 plantronics_probe+0x2f0/0x3f0 drivers/hid/hid-plantronics.c:191
 __hid_device_probe drivers/hid/hid-core.c:2699 [inline]
 hid_device_probe+0x2eb/0x490 drivers/hid/hid-core.c:2736
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3682
 hid_add_device+0x37f/0xa70 drivers/hid/hid-core.c:2882
 usbhid_probe+0xd3b/0x1410 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3682
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:294
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3682
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2d9a/0x4e10 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 8582:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:230 [inline]
 slab_free_hook mm/slub.c:2343 [inline]
 slab_free mm/slub.c:4580 [inline]
 kfree+0x158/0x4b0 mm/slub.c:4728
 hiddev_release+0x409/0x520 drivers/hid/usbhid/hiddev.c:232
 __fput+0x3f6/0xb60 fs/file_table.c:431
 task_work_run+0x14e/0x250 kernel/task_work.c:228
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880431f9400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 28 bytes inside of
 freed 512-byte region [ffff8880431f9400, ffff8880431f9600)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x431f8
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xfdffffff(slab)
raw: 00fff00000000040 ffff88801ac42c80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000001fdffffff 0000000000000000
head: 00fff00000000040 ffff88801ac42c80 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000001fdffffff 0000000000000000
head: 00fff00000000002 ffffea00010c7e01 ffffffffffffffff 0000000000000000
head: ffff888000000004 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 45, tgid 45 (kworker/u32:2), ts 69585986841, free_ts 69505160524
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1500
 prep_new_page mm/page_alloc.c:1508 [inline]
 get_page_from_freelist+0x1351/0x2e50 mm/page_alloc.c:3446
 __alloc_pages_noprof+0x22b/0x23f0 mm/page_alloc.c:4702
 alloc_pages_mpol_noprof+0x275/0x610 mm/mempolicy.c:2263
 alloc_slab_page mm/slub.c:2413 [inline]
 allocate_slab mm/slub.c:2579 [inline]
 new_slab+0x28c/0x3f0 mm/slub.c:2632
 ___slab_alloc+0xd7d/0x17a0 mm/slub.c:3819
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3909
 __slab_alloc_node mm/slub.c:3962 [inline]
 slab_alloc_node mm/slub.c:4123 [inline]
 __kmalloc_cache_noprof+0x2b4/0x300 mm/slub.c:4291
 kmalloc_noprof include/linux/slab.h:878 [inline]
 batadv_forw_packet_alloc+0x3ac/0x4e0 net/batman-adv/send.c:519
 batadv_iv_ogm_aggregate_new+0x132/0x4a0 net/batman-adv/bat_iv_ogm.c:562
 batadv_iv_ogm_queue_add net/batman-adv/bat_iv_ogm.c:670 [inline]
 batadv_iv_ogm_schedule_buff+0xe6d/0x14d0 net/batman-adv/bat_iv_ogm.c:849
 batadv_iv_ogm_schedule net/batman-adv/bat_iv_ogm.c:868 [inline]
 batadv_iv_ogm_schedule net/batman-adv/bat_iv_ogm.c:861 [inline]
 batadv_iv_send_outstanding_bat_ogm_packet+0x31e/0x8d0 net/batman-adv/bat_iv_ogm.c:1712
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
page last free pid 5348 tgid 5348 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1101 [inline]
 free_unref_page+0x64a/0xe40 mm/page_alloc.c:2619
 __put_partials+0x14c/0x170 mm/slub.c:3146
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x192/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:247 [inline]
 slab_post_alloc_hook mm/slub.c:4086 [inline]
 slab_alloc_node mm/slub.c:4135 [inline]
 kmem_cache_alloc_noprof+0x121/0x2f0 mm/slub.c:4142
 getname_flags.part.0+0x4c/0x550 fs/namei.c:139
 getname_flags+0x93/0xf0 include/linux/audit.h:322
 vfs_fstatat+0x86/0x160 fs/stat.c:340
 __do_sys_newfstatat+0xa2/0x130 fs/stat.c:505
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880431f9300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880431f9380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880431f9400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff8880431f9480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880431f9500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


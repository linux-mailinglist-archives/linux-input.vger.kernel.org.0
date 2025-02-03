Return-Path: <linux-input+bounces-9733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F52A26458
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 21:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AF2B188596D
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 20:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5CC20B202;
	Mon,  3 Feb 2025 20:21:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D731DC9B5
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 20:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614086; cv=none; b=PN7ipsLbCIW9rWN4T04G/d/DwxFm7tAZU+OQi20Ah584v5KBkBcX/yBOeExx+xSKrsGh/La80RYmgIIRlWD3rWJ+fmHfYKZUK1yMymOcNt6oDstX7Q2/0JX6BAGRCLt+ARt5Se7Eh4Hk8aRkWVXHbZio9RdYzTUcDX/TtGVVdAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614086; c=relaxed/simple;
	bh=Mpkrsj1Rd2Ia0KT2vQImUmmJOztQiu3o2kzfB7XziQk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Hr5gYFV3iUTnhz1C5GBz/jdlhLIHLezr7gOkEIITXxP0HARzAb/jjVtY/Qi9aruHKlq33+LSo90t4cltBzuh3vss1yb/JbdcTmGZgscHdsXrkMK5BI8HRoRpScrHl14aOU2DVIWeEAviVz/ofcTmuI45mN4xj7yYI9Rcp7fmpyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3cf6c83560fso32815675ab.2
        for <linux-input@vger.kernel.org>; Mon, 03 Feb 2025 12:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738614084; x=1739218884;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiALOgeYnE0pxHEavm4iQ/qD4hYrGbq8dvMqjz3AVzM=;
        b=W5nRcFUkclKKLUmdKwsDt0NwHT1dPj9qp2MNZ7n2So5NVDkG8pERAqWDLh0zdvy7o1
         tzhpEV2MT7S00jESF8LzlMbffJ1uHBVPz9T3B+pggtXRRGso6Ks/RXIHE0iZ710UGKtt
         Nzx9jR0g09heUhlyn9ytPD/56iWQ2qAZDcUXSVxc5GHLHHqyQvBVnbDMyd9vSnxTic9p
         C2Q5a60ysP7DUt9oC9UoqAPqCADxYB04VENqO9xL3APysFoI3lGqaeoyScy8CDWbsCMe
         HHvB0IVUxilTBPsenXkHmH1bYd0iz6tnxNE6WwQ2RFA8u0gobvPyNwy0MJ44X8uOLfvF
         p2lg==
X-Forwarded-Encrypted: i=1; AJvYcCUNJ9BQmrp4yqBLvgduyPyA4gYp2amCacj0P8kbp+rHiQ4bg5iUXhDi3coDCBHkPAJhlyvNnXahAifgig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwFfCSw49y4ixvbxqECaZfdK61E9iUSj6Bbyi4mRxnj1w4rFy+
	bMsXfOpLjDdTVqElwEhDj8VWeUNqwXqDRMGzCM14hGQIlMYZg/JZEGC4tpjeLGzSIsrlc+kRkGW
	WVIIpJq6JVVa9JKBk5kyQYKrKbcAR8B3yy+OKj/UCDoIPTgGxPjbptoE=
X-Google-Smtp-Source: AGHT+IFyYzasH0vqLmr+vxnnwX6eWWVibeXZIm2wKJYGAR+O9mjz/nejQFiNm4zZNK7nceWj2oczHSOKyhNh6zsMTOtlj62OwLqM
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b83:b0:3ce:80b8:7328 with SMTP id
 e9e14a558f8ab-3cffe3ffb5cmr216775165ab.3.1738614083798; Mon, 03 Feb 2025
 12:21:23 -0800 (PST)
Date: Mon, 03 Feb 2025 12:21:23 -0800
In-Reply-To: <6797bfe3.050a0220.ac840.01d2.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a12543.050a0220.d7c5a.00a9.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in corsair_void_status_work_handler
From: syzbot <syzbot+ac826dbeecf212c395a0@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    2014c95afece Linux 6.14-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=112775f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed7570f7f6046a71
dashboard link: https://syzkaller.appspot.com/bug?extid=ac826dbeecf212c395a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1251d724580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e26eb0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/42c6eb213b6c/disk-2014c95a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ebfd7f9e74fe/vmlinux-2014c95a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9fb92b6dc79f/bzImage-2014c95a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ac826dbeecf212c395a0@syzkaller.appspotmail.com

hid-corsair-void 0003:1B1C:1B25.0003: failed to request firmware (reason: -71)
==================================================================
BUG: KASAN: slab-use-after-free in corsair_void_status_work_handler+0xaa/0xb0 drivers/hid/hid-corsair-void.c:515
Read of size 8 at addr ffff8881187e6828 by task kworker/1:1/36

CPU: 1 UID: 0 PID: 36 Comm: kworker/1:1 Not tainted 6.14.0-rc1-syzkaller-g2014c95afece #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: events corsair_void_status_work_handler
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 corsair_void_status_work_handler+0xaa/0xb0 drivers/hid/hid-corsair-void.c:515
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 24:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4294 [inline]
 __kmalloc_node_track_caller_noprof+0x20b/0x4c0 mm/slub.c:4313
 alloc_dr drivers/base/devres.c:119 [inline]
 devm_kmalloc+0xa5/0x260 drivers/base/devres.c:843
 devm_kzalloc include/linux/device.h:328 [inline]
 corsair_void_probe+0x57/0xd70 drivers/hid/hid-corsair-void.c:637
 __hid_device_probe drivers/hid/hid-core.c:2713 [inline]
 hid_device_probe+0x349/0x700 drivers/hid/hid-core.c:2750
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 hid_add_device+0x374/0xa60 drivers/hid/hid-core.c:2896
 usbhid_probe+0xd32/0x1400 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_new_device+0xd09/0x1a20 drivers/usb/core/hub.c:2652
 hub_port_connect drivers/usb/core/hub.c:5523 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x2e58/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 2962:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x294/0x480 mm/slub.c:4757
 release_nodes+0x11e/0x240 drivers/base/devres.c:506
 devres_release_group+0x1be/0x2a0 drivers/base/devres.c:689
 hid_device_remove+0x107/0x260 drivers/hid/hid-core.c:2774
 device_remove+0xc8/0x170 drivers/base/dd.c:567
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:579
 device_del+0x396/0x9f0 drivers/base/core.c:3854
 hid_remove_device drivers/hid/hid-core.c:2953 [inline]
 hid_destroy_device+0x19c/0x240 drivers/hid/hid-core.c:2975
 usbhid_disconnect+0xa0/0xe0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x1e2/0x960 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:579
 device_del+0x396/0x9f0 drivers/base/core.c:3854
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2305
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Last potentially related work creation:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0x9b/0xb0 mm/kasan/generic.c:548
 insert_work+0x36/0x230 kernel/workqueue.c:2183
 __queue_work+0x97e/0x1080 kernel/workqueue.c:2339
 call_timer_fn+0x1a0/0x610 kernel/time/timer.c:1789
 expire_timers kernel/time/timer.c:1835 [inline]
 __run_timers+0x56a/0x930 kernel/time/timer.c:2414
 __run_timer_base kernel/time/timer.c:2426 [inline]
 __run_timer_base kernel/time/timer.c:2418 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2435
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2445
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:561
 __do_softirq kernel/softirq.c:595 [inline]
 invoke_softirq kernel/softirq.c:435 [inline]
 __irq_exit_rcu+0xfa/0x160 kernel/softirq.c:662
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:678
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1049
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

Second to last potentially related work creation:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0x9b/0xb0 mm/kasan/generic.c:548
 insert_work+0x36/0x230 kernel/workqueue.c:2183
 __queue_work+0x97e/0x1080 kernel/workqueue.c:2339
 call_timer_fn+0x1a0/0x610 kernel/time/timer.c:1789
 expire_timers kernel/time/timer.c:1835 [inline]
 __run_timers+0x56a/0x930 kernel/time/timer.c:2414
 __run_timer_base kernel/time/timer.c:2426 [inline]
 __run_timer_base kernel/time/timer.c:2418 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2435
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2445
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:561
 __do_softirq kernel/softirq.c:595 [inline]
 invoke_softirq kernel/softirq.c:435 [inline]
 __irq_exit_rcu+0xfa/0x160 kernel/softirq.c:662
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:678
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1049
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

The buggy address belongs to the object at ffff8881187e6800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 40 bytes inside of
 freed 1024-byte region [ffff8881187e6800, ffff8881187e6c00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1187e0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100041dc0 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 0200000000000040 ffff888100041dc0 dead000000000122 0000000000000000
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 0200000000000003 ffffea000461f801 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 2941, tgid 2941 (sshd), ts 41778561862, free_ts 36310136499
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x21c/0x2290 mm/page_alloc.c:4739
 alloc_pages_mpol+0xe7/0x410 mm/mempolicy.c:2270
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2587 [inline]
 new_slab+0x23d/0x330 mm/slub.c:2640
 ___slab_alloc+0xc41/0x1670 mm/slub.c:3826
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3916
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 __do_kmalloc_node mm/slub.c:4293 [inline]
 __kmalloc_noprof+0x154/0x4d0 mm/slub.c:4306
 kmalloc_noprof include/linux/slab.h:905 [inline]
 load_elf_phdrs+0x103/0x210 fs/binfmt_elf.c:532
 load_elf_binary+0x1f8/0x4f00 fs/binfmt_elf.c:861
 search_binary_handler fs/exec.c:1775 [inline]
 exec_binprm fs/exec.c:1807 [inline]
 bprm_execve fs/exec.c:1859 [inline]
 bprm_execve+0x8dd/0x1680 fs/exec.c:1835
 do_execveat_common.isra.0+0x4a2/0x610 fs/exec.c:1966
 do_execve fs/exec.c:2040 [inline]
 __do_sys_execve fs/exec.c:2116 [inline]
 __se_sys_execve fs/exec.c:2111 [inline]
 __x64_sys_execve+0x8c/0xb0 fs/exec.c:2111
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 2938 tgid 2938 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0x653/0xde0 mm/page_alloc.c:2660
 __put_partials+0x14c/0x170 mm/slub.c:3153
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x4e/0x70 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4115 [inline]
 slab_alloc_node mm/slub.c:4164 [inline]
 kmem_cache_alloc_noprof+0x154/0x3b0 mm/slub.c:4171
 anon_vma_chain_alloc mm/rmap.c:142 [inline]
 __anon_vma_prepare+0xae/0x5e0 mm/rmap.c:195
 __vmf_anon_prepare+0x11c/0x240 mm/memory.c:3389
 vmf_anon_prepare mm/internal.h:372 [inline]
 do_anonymous_page mm/memory.c:4875 [inline]
 do_pte_missing mm/memory.c:4045 [inline]
 handle_pte_fault mm/memory.c:5889 [inline]
 __handle_mm_fault+0x16a5/0x3450 mm/memory.c:6032
 handle_mm_fault+0x3fa/0xaa0 mm/memory.c:6201
 do_user_addr_fault+0x613/0x12c0 arch/x86/mm/fault.c:1337
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x5c/0xc0 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623

Memory state around the buggy address:
 ffff8881187e6700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8881187e6780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8881187e6800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff8881187e6880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881187e6900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


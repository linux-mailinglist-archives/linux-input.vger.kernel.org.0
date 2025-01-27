Return-Path: <linux-input+bounces-9587-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E1A1DB21
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2025 18:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 479097A2BD5
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2025 17:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6672B18A6A9;
	Mon, 27 Jan 2025 17:18:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB3189F56
	for <linux-input@vger.kernel.org>; Mon, 27 Jan 2025 17:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737998310; cv=none; b=gSxNkm8LmJ7Hei7AxaHofQgV0pSMJLp0t4cdDm7pWa1fL3arSlxnix8OCihvk1bel7SnXG73N6u88oM8vUNAYk6IZPz5qvfHDPcF/i9OQbwgPN08OH+7/q4PvrKXm7ZmCYm7WZLnohrh9QAuLFs4l5n6yuEE9WjDkX/CVla+a/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737998310; c=relaxed/simple;
	bh=ynEy1R0fH6Upjd453BQEgNq8sLMeF66g4mvZO9nwqOc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=K2/LpkJGDzPTvP3EdEd2Ji5mTsnmC9CVoCQk0y+gW+qO9BUw03wHXlrDWctOb/cq0lZxqt2kqYV5WS/LvI7bVFdECtZjqfEN4LRTCpgC0a7uVe9R6LDfeBxLGO9oOef1/sR7VTP0d3l72srhzei1eeMdyt9qdR6wRsPt1hNQXGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3cfc08132adso67962895ab.3
        for <linux-input@vger.kernel.org>; Mon, 27 Jan 2025 09:18:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737998307; x=1738603107;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2losYGmK8AnLJXLIXm21Cv9Gp4+aWEqhgjd2GfeScVM=;
        b=nKd6j8D4Sp6gLU6q8RMmbPYT9+cJyNclw5NYF0AZAuudpzk0gnXS7wFQ7+HwXK8FGF
         ylG64IFMlLcqHemMS/IpbnSIvfdQyMPjdPrd87z6X98uQvy1dNNOiSNOqRhdeqGZ5+Sz
         jO70oihjsNTy1X9rzcBYaKtfPymTNO2sKBgxavkydA6NUvcsAEFMG0yTxSl8KIsO6Qav
         xZNK5LvnCjIcb49rn4fcsJAVU2/punSBFMOoZVmB7TPfxZhbSCSvRRkJKcXHB5GKsZvh
         qcYlqoXN3h5JH8SNUy1FI13px3VlhIypJ9/5Lj3lUv4v+eyvbCi7ZhhAFfSDHw8HYG1z
         UjWA==
X-Forwarded-Encrypted: i=1; AJvYcCUSn94UP89nsdesftmlhaB7VPFjGzLb/7D6p3Dj2Z7XGshmH712MBa8QuLmhc8cOetPm5XlJj9hbZ/pGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO4wHj4Z3ys6crFIXve/C7l0fXMZbWeHGDrlvy/c+pEbOwr7i3
	ULdch2fu6i7SHbbd9fOw62HkGHedjKC2TBy4+4NCkQzzD6Jg45zile07QfdkE0aR3Rvy/dE9pk0
	mBP9G8BD+jzLVAOkQusynrXOoDaT6ErwH3eqrC4n6VJWFZakz9xcZrzo=
X-Google-Smtp-Source: AGHT+IEFQqnKzbZ6fDE4KdPBBR//mLDuKLy8Lxb2Lm6zcFU/nHX17D0FX7BZViRxpglXgXrm5+UqoPtoZR7ShJGleluPd14WhI4B
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca4:b0:3cf:ce7c:b8b7 with SMTP id
 e9e14a558f8ab-3cfce7cb987mr93305515ab.10.1737998307479; Mon, 27 Jan 2025
 09:18:27 -0800 (PST)
Date: Mon, 27 Jan 2025 09:18:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6797bfe3.050a0220.ac840.01d2.GAE@google.com>
Subject: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in corsair_void_status_work_handler
From: syzbot <syzbot+ac826dbeecf212c395a0@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    70cd0576aa39 usb: hcd: Bump local buffer size in rh_string()
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13e7f618580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8e4b3bd94cc7cf2d
dashboard link: https://syzkaller.appspot.com/bug?extid=ac826dbeecf212c395a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=123d5ab0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/612846dc004d/disk-70cd0576.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2adbdc698bbb/vmlinux-70cd0576.xz
kernel image: https://storage.googleapis.com/syzbot-assets/111a4615d3e0/bzImage-70cd0576.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ac826dbeecf212c395a0@syzkaller.appspotmail.com

hid-corsair-void 0003:1B1C:1B25.0009: failed to request firmware (reason: -19)
==================================================================
BUG: KASAN: slab-use-after-free in corsair_void_status_work_handler+0xaa/0xb0 drivers/hid/hid-corsair-void.c:515
Read of size 8 at addr ffff888112d97028 by task kworker/1:1/36

CPU: 1 UID: 0 PID: 36 Comm: kworker/1:1 Not tainted 6.13.0-rc7-syzkaller-g70cd0576aa39 #0
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
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 36:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4298 [inline]
 __kmalloc_node_track_caller_noprof+0x20b/0x4c0 mm/slub.c:4317
 alloc_dr drivers/base/devres.c:119 [inline]
 devm_kmalloc+0xa5/0x260 drivers/base/devres.c:830
 devm_kzalloc include/linux/device.h:328 [inline]
 corsair_void_probe+0x57/0xd70 drivers/hid/hid-corsair-void.c:637
 __hid_device_probe drivers/hid/hid-core.c:2718 [inline]
 hid_device_probe+0x349/0x700 drivers/hid/hid-core.c:2755
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 hid_add_device+0x374/0xa60 drivers/hid/hid-core.c:2901
 usbhid_probe+0xd32/0x1400 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_new_device+0xd09/0x1a20 drivers/usb/core/hub.c:2652
 hub_port_connect drivers/usb/core/hub.c:5523 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x2e58/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 5800:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x130/0x470 mm/slub.c:4761
 release_nodes+0x11e/0x240 drivers/base/devres.c:506
 devres_release_group+0x1be/0x2a0 drivers/base/devres.c:689
 hid_device_remove+0x107/0x260 drivers/hid/hid-core.c:2779
 device_remove+0xc8/0x170 drivers/base/dd.c:567
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
 device_del+0x396/0x9f0 drivers/base/core.c:3854
 hid_remove_device drivers/hid/hid-core.c:2958 [inline]
 hid_destroy_device+0x19c/0x240 drivers/hid/hid-core.c:2980
 usbhid_disconnect+0xa0/0xe0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x1e2/0x960 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
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
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Last potentially related work creation:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 __kasan_record_aux_stack+0x9b/0xb0 mm/kasan/generic.c:544
 insert_work+0x36/0x230 kernel/workqueue.c:2183
 __queue_work+0x97e/0x1080 kernel/workqueue.c:2339
 call_timer_fn+0x1a0/0x610 kernel/time/timer.c:1793
 expire_timers kernel/time/timer.c:1839 [inline]
 __run_timers+0x56a/0x930 kernel/time/timer.c:2418
 __run_timer_base kernel/time/timer.c:2430 [inline]
 __run_timer_base kernel/time/timer.c:2422 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2439
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2449
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
 __kasan_record_aux_stack+0x9b/0xb0 mm/kasan/generic.c:544
 insert_work+0x36/0x230 kernel/workqueue.c:2183
 __queue_work+0x97e/0x1080 kernel/workqueue.c:2339
 call_timer_fn+0x1a0/0x610 kernel/time/timer.c:1793
 expire_timers kernel/time/timer.c:1839 [inline]
 __run_timers+0x56a/0x930 kernel/time/timer.c:2418
 __run_timer_base kernel/time/timer.c:2430 [inline]
 __run_timer_base kernel/time/timer.c:2422 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2439
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2449
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:561
 __do_softirq kernel/softirq.c:595 [inline]
 invoke_softirq kernel/softirq.c:435 [inline]
 __irq_exit_rcu+0xfa/0x160 kernel/softirq.c:662
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:678
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1049
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

The buggy address belongs to the object at ffff888112d97000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 40 bytes inside of
 freed 1024-byte region [ffff888112d97000, ffff888112d97400)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x112d90
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100041dc0 ffffea0004681400 0000000000000002
raw: 0000000000000000 0000000000100010 00000001f5000000 0000000000000000
head: 0200000000000040 ffff888100041dc0 ffffea0004681400 0000000000000002
head: 0000000000000000 0000000000100010 00000001f5000000 0000000000000000
head: 0200000000000003 ffffea00044b6401 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 3373, tgid 3373 (kworker/u8:7), ts 99989568481, free_ts 99811505787
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3476
 __alloc_pages_noprof+0x21c/0x22a0 mm/page_alloc.c:4753
 alloc_pages_mpol_noprof+0xeb/0x400 mm/mempolicy.c:2269
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2589 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2642
 ___slab_alloc+0xd1d/0x16e0 mm/slub.c:3830
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3920
 __slab_alloc_node mm/slub.c:3995 [inline]
 slab_alloc_node mm/slub.c:4156 [inline]
 __do_kmalloc_node mm/slub.c:4297 [inline]
 __kmalloc_noprof+0x154/0x4d0 mm/slub.c:4310
 kmalloc_noprof include/linux/slab.h:905 [inline]
 load_elf_phdrs+0x103/0x210 fs/binfmt_elf.c:532
 load_elf_binary+0x14eb/0x4ec0 fs/binfmt_elf.c:961
 search_binary_handler fs/exec.c:1748 [inline]
 exec_binprm fs/exec.c:1790 [inline]
 bprm_execve fs/exec.c:1842 [inline]
 bprm_execve+0x703/0x19a0 fs/exec.c:1818
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2009
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:109
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
page last free pid 3364 tgid 3364 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0xe40 mm/page_alloc.c:2659
 __put_partials+0x14c/0x170 mm/slub.c:3157
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x4e/0x70 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4119 [inline]
 slab_alloc_node mm/slub.c:4168 [inline]
 kmem_cache_alloc_noprof+0x154/0x3b0 mm/slub.c:4175
 anon_vma_chain_alloc mm/rmap.c:142 [inline]
 __anon_vma_prepare+0xae/0x5e0 mm/rmap.c:195


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


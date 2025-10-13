Return-Path: <linux-input+bounces-15375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B7BD158E
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 06:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 814E74E3497
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 04:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03D535965;
	Mon, 13 Oct 2025 04:00:34 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11121CA84
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 04:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760328034; cv=none; b=GY6A+hhOrBJN9+Qe8Q249lZKhAYzD2PA/0lJQJCrX8X6oNRiE4iXR9FnYL56yW7NWiFEfH3GB1rwgDjPVifOz3N8B+K2Mv+9n2OFIhfq6lzz7yy1K7a5/VW1xJtZdU6+EXuv19c6baunLvQ9R705X6sMC6LgZcmSfObq27mD6xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760328034; c=relaxed/simple;
	bh=I33CF8fqmkWX6xdzUXMEoJt4pXkatza5YC6mr25BUJU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BmtHTYFMP5TMy+RI1mdv74nTN3u2DlypivPKKDGoxativqvghpF5i0Cv7eUE8JotRAJEDpVZiCKMLvQVDgQ7e2y9r44ljpe96gobhGoKb7HWahGS6lyR6g2bnHtpXTGkNN7m+ll/q+OZhoxNB7xbjxFcrFQ54fyKfU6YMtqGdC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-93e49401cb8so12225639f.2
        for <linux-input@vger.kernel.org>; Sun, 12 Oct 2025 21:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760328032; x=1760932832;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWYpsc/RBD21Lpv+U0MqAqFJnrtwZGajEDtLo12xJpY=;
        b=ZOk8noPhIzKcbLupdYmSF4i5CoPuoTHXKeFGL5CWu7O3d9Np4HOL1+J/Q7NHhHewGS
         Sduj1Ou8d+/4Y2Nl+L+pY3+S3XQFoDoorvcfn0EAnTyHn3BOdOag0W7gYhLobwCYXCt9
         LwgRGzww/Q93V+vHywuw18OP/X/3S593QarwiFGYfSO/TfnvduPTC73eM+dhlgQcowWS
         XAgLx5Ni9sg01A1dx5+fAPKjs9Xfh4L4Vbo3ir6RWnpAwPK68fZdLiK697NINKFMmoU7
         NcwqHeVGXHL6LXsjxPFQ5e/dVaz4fC3yHe0OM07Fsn1juRrX+mY+viBoGm28cAG1SPXq
         +lrw==
X-Forwarded-Encrypted: i=1; AJvYcCUi276STGa5VgHVk210DzIv9pKlkF56wuUQo9M184PBdLMs+sWwLK8UxGKahtFWEXBTpUOV91ihZK5U7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPf4JEjXkVzQSuEyGU7K7kxo/qDAUbU47yfdosM1+cRIGPba88
	gCkgUWMqhiLBSke/6qsuGu4lhdSnwghZ5aTACzPSvEdM3T4eW/KrPfQYGeb2o4QIHkAF7LUV2oP
	fj0ZGGu6lYgwsmTXD8s+oyiTZa77Tcr/LRc0fYGF58Gap41v3X6U+Vt4tpPo=
X-Google-Smtp-Source: AGHT+IHGgFMEUmfsMZylgIXCnY/O+4NW9gjIe+pXFc7I2oTAB1w8bsV8W1TkKcL9gHK8ZlxseUAbvIIhKzyq0ytWddFCorJzYFG0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12eb:b0:42f:8e77:6241 with SMTP id
 e9e14a558f8ab-42f8e7762c1mr159780255ab.20.1760328032049; Sun, 12 Oct 2025
 21:00:32 -0700 (PDT)
Date: Sun, 12 Oct 2025 21:00:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ec7960.a70a0220.b3ac9.0017.GAE@google.com>
Subject: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in
 mcp2221_raw_event (2)
From: syzbot <syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ec714e371f22 Merge tag 'perf-tools-for-v6.18-1-2025-10-08'..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15400dcd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61ab7fa743df0ec1
dashboard link: https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4067604ee40d/disk-ec714e37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6683059d243f/vmlinux-ec714e37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fcbc710a7633/bzImage-ec714e37.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in mcp2221_raw_event+0x106a/0x1240 drivers/hid/hid-mcp2221.c:948
Read of size 1 at addr ffff88806c49ffff by task kworker/1:4/5894

CPU: 1 UID: 0 PID: 5894 Comm: kworker/1:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <IRQ>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 mcp2221_raw_event+0x106a/0x1240 drivers/hid/hid-mcp2221.c:948
 __hid_input_report drivers/hid/hid-core.c:2139 [inline]
 hid_input_report+0x40a/0x520 drivers/hid/hid-core.c:2166
 hid_irq_in+0x47e/0x6d0 drivers/hid/usbhid/hid-core.c:286
 __usb_hcd_giveback_urb+0x373/0x540 drivers/usb/core/hcd.c:1661
 dummy_timer+0x85f/0x44c0 drivers/usb/gadget/udc/dummy_hcd.c:1995
 __run_hrtimer kernel/time/hrtimer.c:1777 [inline]
 __hrtimer_run_queues+0x52c/0xc60 kernel/time/hrtimer.c:1841
 hrtimer_run_softirq+0x187/0x2b0 kernel/time/hrtimer.c:1858
 handle_softirqs+0x283/0x870 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1052 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1052
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:orc_ip arch/x86/kernel/unwind_orc.c:80 [inline]
RIP: 0010:__orc_find arch/x86/kernel/unwind_orc.c:102 [inline]
RIP: 0010:orc_find arch/x86/kernel/unwind_orc.c:227 [inline]
RIP: 0010:unwind_next_frame+0x130e/0x2390 arch/x86/kernel/unwind_orc.c:494
Code: c1 e8 3f 48 01 c8 48 83 e0 fe 4c 8d 3c 45 00 00 00 00 49 01 ef 4c 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df 0f b6 04 08 <84> c0 75 27 49 63 07 4c 01 f8 49 8d 4f 04 4c 39 e0 48 0f 46 e9 49
RSP: 0018:ffffc9000450d6d8 EFLAGS: 00000a07
RAX: 0000000000000000 RBX: ffffffff8fe36e54 RCX: dffffc0000000000
RDX: ffffffff8fe36e54 RSI: ffffffff90773ada RDI: ffffffff8bc07480
RBP: ffffffff8fe36e54 R08: 0000000000000001 R09: ffffffff81731d25
R10: ffffc9000450d7f8 R11: ffffffff81abbce0 R12: ffffffff85ccc8e0
R13: ffffffff8fe36e54 R14: ffffc9000450d7a8 R15: ffffffff8fe36e54
 arch_stack_walk+0x11c/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:417
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __kmalloc_cache_noprof+0x3d5/0x6f0 mm/slub.c:5724
 kmalloc_noprof include/linux/slab.h:957 [inline]
 add_stack_record_to_list mm/page_owner.c:172 [inline]
 inc_stack_record_count mm/page_owner.c:214 [inline]
 __set_page_owner+0x25c/0x4a0 mm/page_owner.c:333
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x2365/0x2440 mm/page_alloc.c:3884
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5183
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3030 [inline]
 allocate_slab+0x96/0x3a0 mm/slub.c:3203
 new_slab mm/slub.c:3257 [inline]
 ___slab_alloc+0xe94/0x1920 mm/slub.c:4627
 __slab_alloc+0x65/0x100 mm/slub.c:4746
 __slab_alloc_node mm/slub.c:4822 [inline]
 slab_alloc_node mm/slub.c:5233 [inline]
 kmem_cache_alloc_noprof+0x3f9/0x6e0 mm/slub.c:5252
 __kernfs_new_node+0xd7/0x7e0 fs/kernfs/dir.c:637
 kernfs_new_node+0x102/0x210 fs/kernfs/dir.c:713
 __kernfs_create_file+0x4b/0x2e0 fs/kernfs/file.c:1057
 sysfs_add_file_mode_ns+0x238/0x300 fs/sysfs/file.c:313
 sysfs_create_file_ns+0x128/0x1a0 fs/sysfs/file.c:374
 device_add+0x5d2/0xb50 drivers/base/core.c:3655
 cdev_device_add+0x1d6/0x390 fs/char_dev.c:556
 i2cdev_attach_adapter+0x2ed/0x4e0 drivers/i2c/i2c-dev.c:691
 notifier_call_chain+0x1b6/0x3e0 kernel/notifier.c:85
 blocking_notifier_call_chain+0x6a/0x90 kernel/notifier.c:380
 bus_notify+0x143/0x180 drivers/base/bus.c:1001
 device_add+0x54d/0xb50 drivers/base/core.c:3669
 i2c_register_adapter+0x4f1/0x10f0 drivers/i2c/i2c-core-base.c:1573
 devm_i2c_add_adapter+0x1b/0x80 drivers/i2c/i2c-core-base.c:1845
 mcp2221_probe+0x404/0x880 drivers/hid/hid-mcp2221.c:1289
 __hid_device_probe drivers/hid/hid-core.c:2775 [inline]
 hid_device_probe+0x416/0x7a0 drivers/hid/hid-core.c:2812
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 hid_add_device+0x272/0x3e0 drivers/hid/hid-core.c:2951
 usbhid_probe+0xe13/0x12a0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x665/0xc30 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x2958/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6100:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 unpoison_slab_object mm/kasan/common.c:342 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:368
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4946 [inline]
 slab_alloc_node mm/slub.c:5245 [inline]
 kmem_cache_alloc_node_noprof+0x433/0x710 mm/slub.c:5297
 kmalloc_reserve+0xbd/0x290 net/core/skbuff.c:579
 __alloc_skb+0x142/0x2d0 net/core/skbuff.c:670
 alloc_skb include/linux/skbuff.h:1383 [inline]
 alloc_uevent_skb+0x7d/0x230 lib/kobject_uevent.c:289
 uevent_net_broadcast_tagged lib/kobject_uevent.c:352 [inline]
 kobject_uevent_net_broadcast+0x184/0x560 lib/kobject_uevent.c:413
 kobject_uevent_env+0x55b/0x8c0 lib/kobject_uevent.c:608
 __kobject_del+0xd2/0x300 lib/kobject.c:601
 kobject_cleanup lib/kobject.c:680 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x243/0x480 lib/kobject.c:737
 netdev_queue_update_kobjects+0x5db/0x6c0 net/core/net-sysfs.c:2073
 remove_queue_kobjects net/core/net-sysfs.c:2170 [inline]
 netdev_unregister_kobject+0x11f/0x450 net/core/net-sysfs.c:2325
 unregister_netdevice_many_notify+0x1a6b/0x1ff0 net/core/dev.c:12289
 unregister_netdevice_many net/core/dev.c:12317 [inline]
 unregister_netdevice_queue+0x33c/0x380 net/core/dev.c:12161
 unregister_netdevice include/linux/netdevice.h:3389 [inline]
 __tun_detach+0x6d9/0x15d0 drivers/net/tun.c:621
 tun_detach drivers/net/tun.c:637 [inline]
 tun_chr_close+0x10a/0x1c0 drivers/net/tun.c:3436
 __fput+0x44c/0xa70 fs/file_table.c:468
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xe9/0x130 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 __do_fast_syscall_32+0x1f4/0x2b0 arch/x86/entry/syscall_32.c:309
 do_fast_syscall_32+0x34/0x80 arch/x86/entry/syscall_32.c:331
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Freed by task 6100:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 __kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2514 [inline]
 slab_free mm/slub.c:6566 [inline]
 kmem_cache_free+0x19b/0x690 mm/slub.c:6676
 skb_release_data+0x62d/0x7c0 net/core/skbuff.c:1087
 skb_release_all net/core/skbuff.c:1152 [inline]
 __kfree_skb net/core/skbuff.c:1166 [inline]
 consume_skb+0x9e/0xf0 net/core/skbuff.c:1398
 netlink_broadcast_filtered+0xec7/0x1000 net/netlink/af_netlink.c:1537
 netlink_broadcast+0x37/0x50 net/netlink/af_netlink.c:1559
 uevent_net_broadcast_tagged lib/kobject_uevent.c:373 [inline]
 kobject_uevent_net_broadcast+0x4bc/0x560 lib/kobject_uevent.c:413
 kobject_uevent_env+0x55b/0x8c0 lib/kobject_uevent.c:608
 __kobject_del+0xd2/0x300 lib/kobject.c:601
 kobject_cleanup lib/kobject.c:680 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x243/0x480 lib/kobject.c:737
 netdev_queue_update_kobjects+0x5db/0x6c0 net/core/net-sysfs.c:2073
 remove_queue_kobjects net/core/net-sysfs.c:2170 [inline]
 netdev_unregister_kobject+0x11f/0x450 net/core/net-sysfs.c:2325
 unregister_netdevice_many_notify+0x1a6b/0x1ff0 net/core/dev.c:12289
 unregister_netdevice_many net/core/dev.c:12317 [inline]
 unregister_netdevice_queue+0x33c/0x380 net/core/dev.c:12161
 unregister_netdevice include/linux/netdevice.h:3389 [inline]
 __tun_detach+0x6d9/0x15d0 drivers/net/tun.c:621
 tun_detach drivers/net/tun.c:637 [inline]
 tun_chr_close+0x10a/0x1c0 drivers/net/tun.c:3436
 __fput+0x44c/0xa70 fs/file_table.c:468
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xe9/0x130 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 __do_fast_syscall_32+0x1f4/0x2b0 arch/x86/entry/syscall_32.c:309
 do_fast_syscall_32+0x34/0x80 arch/x86/entry/syscall_32.c:331
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

The buggy address belongs to the object at ffff88806c49fa80
 which belongs to the cache skbuff_small_head of size 704
The buggy address is located 703 bytes to the right of
 allocated 704-byte region [ffff88806c49fa80, ffff88806c49fd40)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x6c49c
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
ksm flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff8881416f6b40 ffffea0001b12500 0000000000000003
raw: 0000000000000000 0000000000130013 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff8881416f6b40 ffffea0001b12500 0000000000000003
head: 0000000000000000 0000000000130013 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea0001b12701 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 12, tgid 12 (kworker/u8:0), ts 104150033521, free_ts 94308046189
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x2365/0x2440 mm/page_alloc.c:3884
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5183
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3030 [inline]
 allocate_slab+0x96/0x3a0 mm/slub.c:3203
 new_slab mm/slub.c:3257 [inline]
 ___slab_alloc+0xe94/0x1920 mm/slub.c:4627
 __slab_alloc+0x65/0x100 mm/slub.c:4746
 __slab_alloc_node mm/slub.c:4822 [inline]
 slab_alloc_node mm/slub.c:5233 [inline]
 kmem_cache_alloc_node_noprof+0x4c5/0x710 mm/slub.c:5297
 kmalloc_reserve+0xbd/0x290 net/core/skbuff.c:579
 __alloc_skb+0x142/0x2d0 net/core/skbuff.c:670
 alloc_skb include/linux/skbuff.h:1383 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 inet6_rt_notify+0x170/0x470 net/ipv6/route.c:6345
 fib6_add_rt2node+0x1876/0x33a0 net/ipv6/ip6_fib.c:1275
 fib6_add+0x8da/0x18a0 net/ipv6/ip6_fib.c:1528
 __ip6_ins_rt net/ipv6/route.c:1351 [inline]
 ip6_ins_rt+0xc8/0x120 net/ipv6/route.c:1361
 __ipv6_ifa_notify+0x63f/0xac0 net/ipv6/addrconf.c:6283
 ipv6_ifa_notify net/ipv6/addrconf.c:6322 [inline]
 addrconf_dad_completed+0x180/0xd60 net/ipv6/addrconf.c:4320
page last free pid 5818 tgid 5818 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 free_unref_folios+0xdb3/0x14f0 mm/page_alloc.c:2963
 folios_put_refs+0x584/0x670 mm/swap.c:1002
 free_pages_and_swap_cache+0x277/0x520 mm/swap_state.c:355
 __tlb_batch_free_encoded_pages mm/mmu_gather.c:136 [inline]
 tlb_batch_pages_flush mm/mmu_gather.c:149 [inline]
 tlb_flush_mmu_free mm/mmu_gather.c:397 [inline]
 tlb_flush_mmu+0x3a0/0x680 mm/mmu_gather.c:404
 tlb_finish_mmu+0xc3/0x1d0 mm/mmu_gather.c:497
 vms_clear_ptes+0x42c/0x540 mm/vma.c:1235
 vms_complete_munmap_vmas+0x206/0x8a0 mm/vma.c:1277
 do_vmi_align_munmap+0x364/0x440 mm/vma.c:1536
 do_vmi_munmap+0x253/0x2e0 mm/vma.c:1584
 __vm_munmap+0x207/0x380 mm/vma.c:3156
 __do_sys_munmap mm/mmap.c:1080 [inline]
 __se_sys_munmap mm/mmap.c:1077 [inline]
 __ia32_sys_munmap+0x5f/0x70 mm/mmap.c:1077
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xb6/0x2b0 arch/x86/entry/syscall_32.c:306
 do_fast_syscall_32+0x34/0x80 arch/x86/entry/syscall_32.c:331
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Memory state around the buggy address:
 ffff88806c49fe80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88806c49ff00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88806c49ff80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                                ^
 ffff88806c4a0000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88806c4a0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	c1 e8 3f             	shr    $0x3f,%eax
   3:	48 01 c8             	add    %rcx,%rax
   6:	48 83 e0 fe          	and    $0xfffffffffffffffe,%rax
   a:	4c 8d 3c 45 00 00 00 	lea    0x0(,%rax,2),%r15
  11:	00
  12:	49 01 ef             	add    %rbp,%r15
  15:	4c 89 f8             	mov    %r15,%rax
  18:	48 c1 e8 03          	shr    $0x3,%rax
  1c:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  23:	fc ff df
  26:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
* 2a:	84 c0                	test   %al,%al <-- trapping instruction
  2c:	75 27                	jne    0x55
  2e:	49 63 07             	movslq (%r15),%rax
  31:	4c 01 f8             	add    %r15,%rax
  34:	49 8d 4f 04          	lea    0x4(%r15),%rcx
  38:	4c 39 e0             	cmp    %r12,%rax
  3b:	48 0f 46 e9          	cmovbe %rcx,%rbp
  3f:	49                   	rex.WB


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


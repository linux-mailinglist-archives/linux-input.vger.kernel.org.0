Return-Path: <linux-input+bounces-15501-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90EBDE833
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 14:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDB6B3C423E
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 12:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D1E182D2;
	Wed, 15 Oct 2025 12:40:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6B0450FE
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760532007; cv=none; b=l5wkLwntVs3+iBCqxtrb0r1GQwOwfXV0C4Yl19uMdkwUWkzDrRKcU6SS20q+pyMjbMRyGf69Q6Ac9ZVQ5q7aURv9SywoRJwxSLREfWSIEkltHtFMstJqWWAf/sMb/NI95EWXHX78WiERCPq9eNeiMjA0cNFJGClk6NsSddS7CTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760532007; c=relaxed/simple;
	bh=cQjL5EnjAiKT3a8zg/mHI7LNpQeJ2SkHTnlcvOjcb/I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kb4Tds6KHe98NZdikGRTamks3pHGih2jgR0nBwhLY48QV+omU5XrrppZwyqsxoPvAd3ZlsHd4dRXgizhob5TRaDYwxEL2rrhCI2hXCnB4zbgGXYlNFAcwqLGei9TAZO2Dw/AocYaE1ZP6jEXyGVoflXAvWTVK1Ml0FuL2VHV4+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-42f9b476ca8so211356805ab.3
        for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 05:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760532004; x=1761136804;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/798UwkdfWFloYoaeJGecOKLNhjh3hkrDAFZTenMLc=;
        b=h7YI/z50tEWzr1deASqC4AAx+kxoeHXVw8Y/mvF701pj6A8casAT/G3F1eoM62JGQ9
         t3qrHQe/QH4LY3pX+amE8lAnPiLyd1TS5A8Widn6JhDON98zeDD/1FWZk6yN9XnTk3WJ
         OWCTbTwfDY6/WMLzopjZE/8+zRH1vlNKt8KNTAzaZ0qiCjbWxONS3S+PSaNqKkJxFkzu
         3+FEzOGLLplMzO4j2LeL6OXr8+KKDl+0Ar5F8hUhTIbTazE1vZBTY1SmZ1O8ll71o8i/
         /8Hdbwy7qW955bqTPM7xBIifrWv2rMxkeg2ULG5mxJHSWZ7DO1qdc7tYB4pVfqrS2lMu
         UFMA==
X-Forwarded-Encrypted: i=1; AJvYcCUZMJ2LM/dHri9pBRDHtGI4ajLoi+pvHuRq8xabUY1C/sJNHvdE8bPfcYr8G78G6DIxnWommWmwxGtZPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfdunFOPu18sTRZiT8ZnuWo34izDK+kgoxshaIivYOCKwG/hkE
	KmfUClhTHUc1IvUTzW1dA46cLvFQpKFmtKN2CX1rEqg8njI441VW6eqQ3nCMxp3+jgDV8QgN0a9
	k5gpBG2eTTHuhqF4hOW1ElEf2W19K2nGaha5ys75USABT0RSl5bwpGh/Ycu8=
X-Google-Smtp-Source: AGHT+IHwQ8ayTleCIEcTqAe9yuCZCvcMJAruy950NeMOfnpOADxNN1Iqkd0jyFVyHzepz+cbnOhIJlyF+LDiUvoeMAdZqJbm6Ihw
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:23c3:b0:42f:8afa:326f with SMTP id
 e9e14a558f8ab-42f8afa34damr313201125ab.19.1760532003830; Wed, 15 Oct 2025
 05:40:03 -0700 (PDT)
Date: Wed, 15 Oct 2025 05:40:03 -0700
In-Reply-To: <35e0f3f4-def7-4a94-a982-549b6203c6e2@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ef9623.050a0220.1186a4.00e5.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in
 mcp2221_raw_event (2)
From: syzbot <syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-out-of-bounds Read in mcp2221_raw_event

==================================================================
BUG: KASAN: slab-out-of-bounds in mcp2221_raw_event+0x1276/0x12a0 drivers/hid/hid-mcp2221.c:977
Read of size 1 at addr ffff88805c577fff by task dhcpcd-run-hook/6714

CPU: 0 UID: 0 PID: 6714 Comm: dhcpcd-run-hook Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 mcp2221_raw_event+0x1276/0x12a0 drivers/hid/hid-mcp2221.c:977
 __hid_input_report.constprop.0+0x314/0x450 drivers/hid/hid-core.c:2139
 hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:286
 __usb_hcd_giveback_urb+0x38b/0x610 drivers/usb/core/hcd.c:1661
 usb_hcd_giveback_urb+0x39b/0x450 drivers/usb/core/hcd.c:1745
 dummy_timer+0x1809/0x3a00 drivers/usb/gadget/udc/dummy_hcd.c:1995
 __run_hrtimer kernel/time/hrtimer.c:1777 [inline]
 __hrtimer_run_queues+0x202/0xad0 kernel/time/hrtimer.c:1841
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1858
 handle_softirqs+0x219/0x8e0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x109/0x170 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1052 [inline]
 sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1052
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:mt_find+0x99a/0xa20 lib/maple_tree.c:6502
Code: e9 f4 fa ff ff 31 db e9 9c fd ff ff 4c 89 ff e8 dc 51 c6 f6 e9 d4 f8 ff ff e8 a2 51 c6 f6 e9 8f f8 ff ff e8 88 ca 5d f6 31 db <e8> 81 ca 5d f6 48 85 db 0f 85 80 f9 ff ff e9 df fc ff ff e8 6e ca
RSP: 0018:ffffc9000457fbc8 EFLAGS: 00000292
RAX: 0000000000000000 RBX: ffff88803166c8c0 RCX: ffffffff8b5f6970
RDX: ffff888033084900 RSI: ffffffff8b5f6e74 RDI: 0000000000000005
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
R13: ffffc9000457fd08 R14: 0000000000000300 R15: 0000000000000002
 find_vma+0xbf/0x140 mm/mmap.c:909
 lock_mm_and_find_vma+0x62/0x6e0 mm/mmap_lock.c:431
 do_user_addr_fault+0x2ac/0x1370 arch/x86/mm/fault.c:1359
 handle_page_fault arch/x86/mm/fault.c:1476 [inline]
 exc_page_fault+0x64/0xc0 arch/x86/mm/fault.c:1532
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:618
RIP: 0010:__put_user_4+0xd/0x20 arch/x86/lib/putuser.S:94
Code: 66 89 01 31 c9 0f 01 ca c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 48 89 cb 48 c1 fb 3f 48 09 d9 0f 01 cb <89> 01 31 c9 0f 01 ca c3 cc cc cc cc 0f 1f 80 00 00 00 00 90 90 90
RSP: 0018:ffffc9000457fef8 EFLAGS: 00050206
RAX: 0000000000001a3a RBX: 0000000000000000 RCX: 00007f8b8be0df50
RDX: dffffc0000000000 RSI: ffffffff8dadd91d RDI: ffff888033084fe0
RBP: ffffc9000457ff48 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffff88802b8fc900
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 schedule_tail+0xb0/0xe0 kernel/sched/core.c:5260
 ret_from_fork+0x25/0x7d0 arch/x86/kernel/process.c:154
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6476:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 unpoison_slab_object mm/kasan/common.c:342 [inline]
 __kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:368
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4955 [inline]
 slab_alloc_node mm/slub.c:5265 [inline]
 kmem_cache_alloc_node_noprof+0x28a/0x770 mm/slub.c:5317
 kmalloc_reserve+0x18b/0x2c0 net/core/skbuff.c:579
 __alloc_skb+0x166/0x380 net/core/skbuff.c:670
 alloc_skb include/linux/skbuff.h:1383 [inline]
 alloc_uevent_skb+0x7d/0x210 lib/kobject_uevent.c:289
 uevent_net_broadcast_untagged lib/kobject_uevent.c:326 [inline]
 kobject_uevent_net_broadcast lib/kobject_uevent.c:410 [inline]
 kobject_uevent_env+0xca4/0x1870 lib/kobject_uevent.c:608
 device_del+0x623/0x9f0 drivers/base/core.c:3896
 gpiochip_remove+0x5aa/0x6d0 drivers/gpio/gpiolib.c:1303
 release_nodes+0x116/0x240 drivers/base/devres.c:505
 devres_release_group+0x1c1/0x300 drivers/base/devres.c:692
 hid_device_remove+0x107/0x260 drivers/hid/hid-core.c:2836
 device_remove+0xcb/0x170 drivers/base/dd.c:569
 __device_release_driver drivers/base/dd.c:1274 [inline]
 device_release_driver_internal+0x44b/0x620 drivers/base/dd.c:1297
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:579
 device_del+0x396/0x9f0 drivers/base/core.c:3878
 hid_remove_device drivers/hid/hid-core.c:3008 [inline]
 hid_destroy_device+0x19c/0x240 drivers/hid/hid-core.c:3030
 usbhid_disconnect+0xa0/0xe0 drivers/hid/usbhid/hid-core.c:1462
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:571 [inline]
 device_remove+0x125/0x170 drivers/base/dd.c:563
 __device_release_driver drivers/base/dd.c:1274 [inline]
 device_release_driver_internal+0x44b/0x620 drivers/base/dd.c:1297
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:579
 device_del+0x396/0x9f0 drivers/base/core.c:3878
 usb_disable_device+0x355/0x7d0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x9c0 drivers/usb/core/hub.c:2344
 hub_port_connect drivers/usb/core/hub.c:5406 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x1c81/0x4fe0 drivers/usb/core/hub.c:5952
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3263
 process_scheduled_works kernel/workqueue.c:3346 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3427
 kthread+0x3c5/0x780 kernel/kthread.c:463
 ret_from_fork+0x675/0x7d0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5183:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 __kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2523 [inline]
 slab_free mm/slub.c:6611 [inline]
 kmem_cache_free+0x2d4/0x6c0 mm/slub.c:6721
 skb_kfree_head net/core/skbuff.c:1046 [inline]
 skb_kfree_head net/core/skbuff.c:1043 [inline]
 skb_free_head+0x1b7/0x210 net/core/skbuff.c:1060
 skb_release_data+0x795/0x9e0 net/core/skbuff.c:1087
 skb_release_all net/core/skbuff.c:1152 [inline]
 __kfree_skb net/core/skbuff.c:1166 [inline]
 consume_skb net/core/skbuff.c:1398 [inline]
 consume_skb+0xbf/0x100 net/core/skbuff.c:1392
 netlink_recvmsg+0x5b9/0xa90 net/netlink/af_netlink.c:1974
 sock_recvmsg_nosec net/socket.c:1078 [inline]
 sock_recvmsg+0x1f9/0x250 net/socket.c:1100
 ____sys_recvmsg+0x218/0x6b0 net/socket.c:2850
 ___sys_recvmsg+0x114/0x1a0 net/socket.c:2892
 __sys_recvmsg+0x16a/0x220 net/socket.c:2925
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88805c577a80
 which belongs to the cache skbuff_small_head of size 704
The buggy address is located 703 bytes to the right of
 allocated 704-byte region [ffff88805c577a80, ffff88805c577d40)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x5c574
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff888140edbb40 ffffea0001f37a00 dead000000000004
raw: 0000000000000000 0000000000130013 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff888140edbb40 ffffea0001f37a00 dead000000000004
head: 0000000000000000 0000000000130013 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea0001715d01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 6343, tgid 6343 (syz-executor), ts 113786247405, free_ts 94133356886
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x10a3/0x3a30 mm/page_alloc.c:3884
 __alloc_frozen_pages_noprof+0x25f/0x2470 mm/page_alloc.c:5183
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3039 [inline]
 allocate_slab mm/slub.c:3212 [inline]
 new_slab+0x24a/0x360 mm/slub.c:3266
 ___slab_alloc+0xdc4/0x1ae0 mm/slub.c:4636
 __slab_alloc.constprop.0+0x63/0x110 mm/slub.c:4755
 __slab_alloc_node mm/slub.c:4831 [inline]
 slab_alloc_node mm/slub.c:5253 [inline]
 kmem_cache_alloc_node_noprof+0x43c/0x770 mm/slub.c:5317
 kmalloc_reserve+0x18b/0x2c0 net/core/skbuff.c:579
 __alloc_skb+0x166/0x380 net/core/skbuff.c:670
 alloc_skb include/linux/skbuff.h:1383 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 mpls_netconf_notify_devconf+0x4a/0x110 net/mpls/af_mpls.c:1189
 mpls_dev_sysctl_register+0x1c9/0x2a0 net/mpls/af_mpls.c:1409
 mpls_add_dev net/mpls/af_mpls.c:1460 [inline]
 mpls_dev_notify+0x4ab/0xa20 net/mpls/af_mpls.c:1600
 notifier_call_chain+0xbc/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2229
 call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
 call_netdevice_notifiers net/core/dev.c:2281 [inline]
 register_netdevice+0x182e/0x2270 net/core/dev.c:11332
page last free pid 6136 tgid 6136 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0x7df/0x1160 mm/page_alloc.c:2906
 discard_slab mm/slub.c:3310 [inline]
 __put_partials+0x130/0x170 mm/slub.c:3857
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4d/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:352
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4955 [inline]
 slab_alloc_node mm/slub.c:5265 [inline]
 __do_kmalloc_node mm/slub.c:5626 [inline]
 __kmalloc_noprof+0x2e8/0x880 mm/slub.c:5639
 kmalloc_noprof include/linux/slab.h:961 [inline]
 tomoyo_realpath_from_path+0xc2/0x6e0 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x274/0x460 security/tomoyo/file.c:822
 security_inode_getattr+0x116/0x290 security/security.c:2416
 vfs_getattr fs/stat.c:259 [inline]
 vfs_fstat+0x4b/0xe0 fs/stat.c:281
 __do_sys_newfstat+0x87/0x100 fs/stat.c:555
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88805c577e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88805c577f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88805c577f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                                ^
 ffff88805c578000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88805c578080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	e9 f4 fa ff ff       	jmp    0xfffffaf9
   5:	31 db                	xor    %ebx,%ebx
   7:	e9 9c fd ff ff       	jmp    0xfffffda8
   c:	4c 89 ff             	mov    %r15,%rdi
   f:	e8 dc 51 c6 f6       	call   0xf6c651f0
  14:	e9 d4 f8 ff ff       	jmp    0xfffff8ed
  19:	e8 a2 51 c6 f6       	call   0xf6c651c0
  1e:	e9 8f f8 ff ff       	jmp    0xfffff8b2
  23:	e8 88 ca 5d f6       	call   0xf65dcab0
  28:	31 db                	xor    %ebx,%ebx
* 2a:	e8 81 ca 5d f6       	call   0xf65dcab0 <-- trapping instruction
  2f:	48 85 db             	test   %rbx,%rbx
  32:	0f 85 80 f9 ff ff    	jne    0xfffff9b8
  38:	e9 df fc ff ff       	jmp    0xfffffd1c
  3d:	e8                   	.byte 0xe8
  3e:	6e                   	outsb  %ds:(%rsi),(%dx)
  3f:	ca                   	.byte 0xca


Tested on:

commit:         3a866087 Linux 6.18-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1721d542580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
dashboard link: https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1004952f980000



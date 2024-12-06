Return-Path: <linux-input+bounces-8426-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12B9E79CB
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 21:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CB551887AD2
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 20:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E029204BA2;
	Fri,  6 Dec 2024 20:05:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16752204590
	for <linux-input@vger.kernel.org>; Fri,  6 Dec 2024 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733515527; cv=none; b=bLpVWXcNMlRZg4LrNWtgc3Poqyg4ACKm76Hl0d+/S9AUz2yFgGlJY3G2Av8ketGealqJz+wvNtnZxIbrmIIaAjB7nXq3egJHc5hItWuzT4zknpkC3IC80Cn7KFinkotzq18cY7EjkCLlJ9ueG+7+gTiVrLclTsXEfkwbkQnNmYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733515527; c=relaxed/simple;
	bh=gl2XIKOWCu9jIzjqTvgYFnUi7IdXDAYW3wepc0YsXbk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mGnxW85P5zoHs4Q/TnBfgly6f8p++A2395rGnQ5osCx5oGWUfIx7A5vpdlDqZKOI/BSmOlRI90E+I0+nncBj3W+erut8WCLo36UV57DFW5w0qtwCxy6dsgc708bop7yZ08wg5AXNa62hJqUEtS9dz26f/C+/XkZyJptjN5An4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a819a4e83dso4378055ab.1
        for <linux-input@vger.kernel.org>; Fri, 06 Dec 2024 12:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733515524; x=1734120324;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MtWavEK3DJIIVxuV/4z+GpAPOHFL2o6thVXfa7lzTZI=;
        b=Fzd9UGnVVSGC+r3HuaLSzkQGIXVC7DtYffId+RSVZzmqp6OexduI+yuADyLA4eJVYO
         oT1Dq9+mclH5l9VbRiqBY0F3+sdtKWLrgeVbwQuH6RLK/BvBot4re6CA8a/Mn/JE365V
         7/JPJhN69RYL+a/wDi6uCLVRM/e68qD6110dKVDU5ZWYGf+HMOnoJ+tRMVbX7Hfz+w0Q
         0HXyZ6Laz75Tjbhe9ocv7fzisqNoLVjzNjIEExfg4XjMmdDGPFM0gmrZ8RN9OyaNi1R0
         x82dEKUKC1fyTeb7nkr+28TF8pXDftvV1jY/qaHiPEmFgxu1k6SKaFtYnLKqZvd56bmp
         RQKA==
X-Forwarded-Encrypted: i=1; AJvYcCUBAkOmc/tz2b8uqBrm9EjhTWpORL+B3s4t+AJkRrQpiNNR3Eqlku42l67dW4BgNYAZiRtbGGfjne9bwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkeRNoDadrXki7l9u6cOS6WUYaHgYRLdvcGh/yLJI5mPePBi3o
	eN3cRsCpdWi/HrvvkOcHJ+QDvyyzWJashO5jvX3nOGOkHRlcKmdjWaUThlR/BOPzo4nErapKqrF
	ygcG7oElwvteu5LiJelSmv92JnBHfpIlZMpLk6tEgT5GPGwzWDJJBGKA=
X-Google-Smtp-Source: AGHT+IHRIZF/WJd0EXWisHDwPR9SYIYKEN8ZIsvT6MMagjFFp6+Legq9HkVdX757oS4PIf2Je2yvB75TTbZltFhSeEKs9cl5DvNX
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1605:b0:3a0:c820:c5f0 with SMTP id
 e9e14a558f8ab-3a811e4c7ebmr50626385ab.24.1733515524169; Fri, 06 Dec 2024
 12:05:24 -0800 (PST)
Date: Fri, 06 Dec 2024 12:05:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67535904.050a0220.2477f.0008.GAE@google.com>
Subject: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in mcp2221_raw_event
From: syzbot <syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d8d936c51388 usb: storage: add a macro for the upper limit..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=138e1de8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9666422a569a9b7d
dashboard link: https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b5f0fe63d6bf/disk-d8d936c5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/16c74d2e64c7/vmlinux-d8d936c5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/00ab13339c70/bzImage-d8d936c5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in mcp2221_raw_event+0xf98/0x1030 drivers/hid/hid-mcp2221.c:852
Read of size 1 at addr ffff888125653fff by task kworker/1:3/5238

CPU: 1 UID: 0 PID: 5238 Comm: kworker/1:3 Not tainted 6.13.0-rc1-syzkaller-gd8d936c51388 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: events legacy_dvb_usb_read_remote_control
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 mcp2221_raw_event+0xf98/0x1030 drivers/hid/hid-mcp2221.c:852
 __hid_input_report.constprop.0+0x312/0x440 drivers/hid/hid-core.c:2111
 hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
 __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x17f0/0x3930 drivers/usb/gadget/udc/dummy_hcd.c:1993
 __run_hrtimer kernel/time/hrtimer.c:1739 [inline]
 __hrtimer_run_queues+0x20a/0xae0 kernel/time/hrtimer.c:1803
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1820
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu+0xfa/0x160 kernel/softirq.c:655
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:671
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:console_flush_all+0x9a4/0xc60 kernel/printk/printk.c:3211
Code: 00 e8 90 de 27 00 9c 5b 81 e3 00 02 00 00 31 ff 48 89 de e8 1e 39 20 00 48 85 db 0f 85 55 01 00 00 e8 a0 36 20 00 fb 4c 89 e0 <48> c1 e8 03 42 80 3c 38 00 0f 84 11 ff ff ff 4c 89 e7 e8 25 41 7a
RSP: 0018:ffffc9000211f8b0 EFLAGS: 00000293
RAX: ffffffff893a7798 RBX: 0000000000000000 RCX: ffffffff813b1bb2
RDX: ffff88810dbe1d40 RSI: ffffffff813b1bc0 RDI: 0000000000000007
RBP: 0000000000000000 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000005 R12: ffffffff893a7798
R13: ffffffff893a7740 R14: ffffc9000211f940 R15: dffffc0000000000
 __console_flush_and_unlock kernel/printk/printk.c:3269 [inline]
 console_unlock+0xd9/0x210 kernel/printk/printk.c:3309
 vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2432
 vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:86
 _printk+0xc8/0x100 kernel/printk/printk.c:2457
 legacy_dvb_usb_read_remote_control+0x40d/0x500 drivers/media/usb/dvb-usb/dvb-usb-remote.c:124
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 18002:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x6e/0x70 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4104 [inline]
 slab_alloc_node mm/slub.c:4153 [inline]
 kmem_cache_alloc_noprof+0x154/0x3b0 mm/slub.c:4160
 vma_lock_alloc kernel/fork.c:446 [inline]
 vm_area_dup+0x51/0x160 kernel/fork.c:499
 dup_mmap kernel/fork.c:697 [inline]
 dup_mm kernel/fork.c:1695 [inline]
 copy_mm kernel/fork.c:1744 [inline]
 copy_process+0x76a1/0x8ba0 kernel/fork.c:2395
 kernel_clone+0xfd/0x960 kernel/fork.c:2807
 __do_sys_clone+0xba/0x100 kernel/fork.c:2950
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 20259:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2338 [inline]
 slab_free mm/slub.c:4598 [inline]
 kmem_cache_free+0x133/0x470 mm/slub.c:4700
 vma_lock_free kernel/fork.c:458 [inline]
 __vm_area_free+0x38/0x50 kernel/fork.c:514
 remove_vma+0x154/0x1b0 mm/vma.c:385
 exit_mmap+0x4e2/0xb20 mm/mmap.c:1691
 __mmput kernel/fork.c:1353 [inline]
 mmput+0xdb/0x430 kernel/fork.c:1375
 exit_mm kernel/exit.c:570 [inline]
 do_exit+0x9bf/0x2ce0 kernel/exit.c:925
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 get_signal+0x24ed/0x26c0 kernel/signal.c:3017
 arch_do_signal_or_restart+0x90/0x7e0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x147/0x260 kernel/entry/common.c:218
 do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888125653e58
 which belongs to the cache vma_lock of size 152
The buggy address is located 271 bytes to the right of
 allocated 152-byte region [ffff888125653e58, ffff888125653ef0)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x125653
memcg:ffff888112012101
flags: 0x200000000000000(node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000000 ffff888100ad6c80 ffffea000469ff40 dead000000000008
raw: 0000000000000000 0000000000120012 00000001f5000000 ffff888112012101
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 19443, tgid 19443 (modprobe), ts 1744528990053, free_ts 1582817727208
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1556
 prep_new_page mm/page_alloc.c:1564 [inline]
 get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3474
 __alloc_pages_noprof+0x21c/0x22a0 mm/page_alloc.c:4751
 alloc_pages_mpol_noprof+0xeb/0x400 mm/mempolicy.c:2265
 alloc_slab_page mm/slub.c:2408 [inline]
 allocate_slab mm/slub.c:2574 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2627
 ___slab_alloc+0xd45/0x1750 mm/slub.c:3815
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3905
 __slab_alloc_node mm/slub.c:3980 [inline]
 slab_alloc_node mm/slub.c:4141 [inline]
 kmem_cache_alloc_noprof+0x1fd/0x3b0 mm/slub.c:4160
 vma_lock_alloc kernel/fork.c:446 [inline]
 vm_area_alloc+0x107/0x1f0 kernel/fork.c:477
 __mmap_new_vma mm/vma.c:2340 [inline]
 __mmap_region+0xf13/0x24f0 mm/vma.c:2456
 mmap_region+0x127/0x320 mm/mmap.c:1347
 do_mmap+0xc00/0xfc0 mm/mmap.c:496
 vm_mmap_pgoff+0x1ba/0x350 mm/util.c:580
 ksys_mmap_pgoff+0x7d/0x5c0 mm/mmap.c:542
 __do_sys_mmap arch/x86/kernel/sys_x86_64.c:89 [inline]
 __se_sys_mmap arch/x86/kernel/sys_x86_64.c:82 [inline]
 __x64_sys_mmap+0x125/0x190 arch/x86/kernel/sys_x86_64.c:82
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
page last free pid 2961 tgid 2961 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0xe40 mm/page_alloc.c:2657
 vfree+0x17a/0x890 mm/vmalloc.c:3382
 kcov_put kernel/kcov.c:439 [inline]
 kcov_put+0x2a/0x40 kernel/kcov.c:435
 kcov_close+0xd/0x20 kernel/kcov.c:535
 __fput+0x3f8/0xb60 fs/file_table.c:450
 task_work_run+0x14e/0x250 kernel/task_work.c:239
 exit_task_work include/linux/task_work.h:43 [inline]
 do_exit+0xadd/0x2ce0 kernel/exit.c:938
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 get_signal+0x24ed/0x26c0 kernel/signal.c:3017
 arch_do_signal_or_restart+0x90/0x7e0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x147/0x260 kernel/entry/common.c:218
 do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888125653e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc
 ffff888125653f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888125653f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                                ^
 ffff888125654000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888125654080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	00 e8                	add    %ch,%al
   2:	90                   	nop
   3:	de 27                	fisubs (%rdi)
   5:	00 9c 5b 81 e3 00 02 	add    %bl,0x200e381(%rbx,%rbx,2)
   c:	00 00                	add    %al,(%rax)
   e:	31 ff                	xor    %edi,%edi
  10:	48 89 de             	mov    %rbx,%rsi
  13:	e8 1e 39 20 00       	call   0x203936
  18:	48 85 db             	test   %rbx,%rbx
  1b:	0f 85 55 01 00 00    	jne    0x176
  21:	e8 a0 36 20 00       	call   0x2036c6
  26:	fb                   	sti
  27:	4c 89 e0             	mov    %r12,%rax
* 2a:	48 c1 e8 03          	shr    $0x3,%rax <-- trapping instruction
  2e:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
  33:	0f 84 11 ff ff ff    	je     0xffffff4a
  39:	4c 89 e7             	mov    %r12,%rdi
  3c:	e8                   	.byte 0xe8
  3d:	25                   	.byte 0x25
  3e:	41                   	rex.B
  3f:	7a                   	.byte 0x7a


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


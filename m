Return-Path: <linux-input+bounces-15625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1CBBF4168
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 01:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB01E4E4B72
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 23:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0659333509D;
	Mon, 20 Oct 2025 23:57:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D4334C33
	for <linux-input@vger.kernel.org>; Mon, 20 Oct 2025 23:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761004625; cv=none; b=HN2suk1nEagnQlSO4FONDPWF0Zc3NchX2nELkTZqRzfX+YQVk2D5h2FAG91D4DuSwFB9E18kAvKG91LgmcPvr+lqxFFJ8jUpCNTRN3tdQyG8DLLAQ+zmi5/WeJkpK3YPtczNStERjC80nfsyTnif8cpCR9R1Tk2eWuuA/UP0cGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761004625; c=relaxed/simple;
	bh=qrVdyS5RY9nxSijoDiptbCB64hxhYMuPXeGFboVxI44=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GFwIhtPK5YBdtzKQj7DGRK4tW070tq4fW1O3udRUYo/xuN+YrdT2+qKssr38+nEbJuiYSaLHR58TLbsWS1DLBMhozo1WklCLiS0FfA6Xv/Ze7GWc/NE3fO0UdBLXVKi1WYvgt4s8wvxioiOfJcQVgVKj2+GDl59zrtbeYEJ4iB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-930db3a16c0so1286485139f.2
        for <linux-input@vger.kernel.org>; Mon, 20 Oct 2025 16:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761004622; x=1761609422;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taoqI0p4fM0CJMRt54O9WrYUn1PT5al2qIevTZCWw7o=;
        b=UknVlMOrF8gD79p0aoXFmc6FgRaiESsHINBo0kJjK6KeDkhA8LRMAtHrmHwHsO+f4c
         OxWTXmqb1pYJffkd4L7SsxqaG8MeOYZ5//uxyRCiNRbcDPV3rGizqFSn92P2SRWDgn1r
         XSjQcjffvivdABkcBln6a4S4yFWnGGJvYqBrNaTfWnSR5qnLeaQWYpLYn+T5HarxWO4Z
         z9TUbgUDG+wxsSvMJ7tkiMvgU9c++7Op+2Nth/PVUoIZgAW9bsjSZyUo0/1T8BJbPLu1
         B173qbTg+zvMnUS1Ln2Uh0M43tPC4bGzslJ2BTIW2s090zqp2FEE83gTuQ7qPCatkJZK
         /6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU0Ps0rjKzbzRDmJ1/etvdXJtHjEFd2KA7HSOcaXu3Ll1WKUs9JXb38ybcj79bbicQcwy1IWpyHEmZ8Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/qlsSWYeTDxbce+bBxI069mdsPsjF0oPeqO9HKNsWlNLP57yq
	HJcI8gjVdEKOomEWdbeUBX1L6XxSxi6d+Zh+sVRmcGqm9m4rwrK3NxlXRGsZ1Dw38sT7ZVAypkd
	yvJXLRjNdxIDtgs9E70DShVVGXY8o9gnVFcpJ5yGp7o6Q08gPbceC2w/4aoY=
X-Google-Smtp-Source: AGHT+IEPKmd+pFTYDu+RLZ1lifinnj8YESqoxKJu4jhIw3nvu0CCGQtX/6PeubxD2b3+p4DXjtRADmK9zhxZSZ7mU4csszc0eIIW
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c01:b0:920:865c:a8a9 with SMTP id
 ca18e2360f4ac-93e7643157cmr2471776239f.14.1761004622293; Mon, 20 Oct 2025
 16:57:02 -0700 (PDT)
Date: Mon, 20 Oct 2025 16:57:02 -0700
In-Reply-To: <ede00f12-5bdf-4387-9250-6e48b5700ad9@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68f6cc4e.050a0220.91a22.045a.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in
 mcp2221_raw_event (2)
From: syzbot <syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: use-after-free Read in mcp2221_raw_event

==================================================================
BUG: KASAN: use-after-free in mcp2221_raw_event+0x1276/0x12a0 drivers/hid/hid-mcp2221.c:977
Read of size 1 at addr ffff8880608fffff by task kworker/0:6/6472

CPU: 0 UID: 0 PID: 6472 Comm: kworker/0:6 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Workqueue: usb_hub_wq hub_event
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
RIP: 0010:unwind_next_frame+0x188/0x20a0 arch/x86/kernel/unwind_orc.c:494
Code: 7f 08 84 c0 0f 85 e4 09 00 00 48 89 e9 41 0f b6 45 35 48 ba 00 00 00 00 00 fc ff df 48 c1 e9 03 80 3c 11 00 0f 85 6b 17 00 00 <4d> 8b 7d 48 3c 01 49 83 df 00 4d 85 ff 0f 84 31 09 00 00 49 81 ff
RSP: 0018:ffffc900037f6778 EFLAGS: 00000246
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 1ffff920006fed06
RDX: dffffc0000000000 RSI: ffffffff8bf1e240 RDI: ffffffff8ddafee0
RBP: ffffc900037f6830 R08: 7f6452bb8444a4d6 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffffc900037f6838
R13: ffffc900037f67e8 R14: ffffc900037f681d R15: ffff888079bc8000
 arch_stack_walk+0x94/0x100 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:417
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __do_kmalloc_node mm/slub.c:5627 [inline]
 __kmalloc_node_track_caller_noprof+0x345/0x8a0 mm/slub.c:5736
 kmemdup_noprof+0x29/0x60 mm/util.c:138
 kmemdup_noprof include/linux/fortify-string.h:765 [inline]
 mcp_send_report drivers/hid/hid-mcp2221.c:156 [inline]
 mcp_send_data_req_status+0x56/0x170 drivers/hid/hid-mcp2221.c:182
 mcp_set_i2c_speed drivers/hid/hid-mcp2221.c:241 [inline]
 mcp2221_probe+0x38d/0xc50 drivers/hid/hid-mcp2221.c:1315
 __hid_device_probe drivers/hid/hid-core.c:2775 [inline]
 hid_device_probe+0x5ba/0x8d0 drivers/hid/hid-core.c:2812
 call_driver_probe drivers/base/dd.c:581 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:659
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:801
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:959
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1031
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1aa0 drivers/base/core.c:3689
 hid_add_device+0x31b/0x5c0 drivers/hid/hid-core.c:2951
 usbhid_probe+0xd38/0x13f0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x303/0xa40 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:581 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:659
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:801
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:959
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1031
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1aa0 drivers/base/core.c:3689
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:581 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:659
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:801
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:959
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1031
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1aa0 drivers/base/core.c:3689
 usb_new_device+0xd07/0x1a60 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x2f34/0x4fe0 drivers/usb/core/hub.c:5952
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3263
 process_scheduled_works kernel/workqueue.c:3346 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3427
 kthread+0x3c5/0x780 kernel/kthread.c:463
 ret_from_fork+0x675/0x7d0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x608ff
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 ffffea00017fc008 ffffea0001823f88 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_ZERO|__GFP_NOWARN), pid 6288, tgid 6288 (syz-executor), ts 112267604439, free_ts 114447335346
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x10a3/0x3a30 mm/page_alloc.c:3884
 __alloc_frozen_pages_noprof+0x25f/0x2470 mm/page_alloc.c:5183
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_frozen_pages_noprof mm/mempolicy.c:2487 [inline]
 alloc_pages_noprof+0x131/0x390 mm/mempolicy.c:2507
 vm_area_alloc_pages mm/vmalloc.c:3647 [inline]
 __vmalloc_area_node mm/vmalloc.c:3724 [inline]
 __vmalloc_node_range_noprof+0x6f8/0x1480 mm/vmalloc.c:3897
 vmalloc_user_noprof+0x9e/0xe0 mm/vmalloc.c:4050
 kcov_ioctl+0x4c/0x730 kernel/kcov.c:716
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 6299 tgid 6299 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0x7df/0x1160 mm/page_alloc.c:2906
 vfree+0x1fd/0xb50 mm/vmalloc.c:3440
 kcov_put kernel/kcov.c:439 [inline]
 kcov_put kernel/kcov.c:435 [inline]
 kcov_close+0x34/0x60 kernel/kcov.c:535
 __fput+0x402/0xb70 fs/file_table.c:468
 task_work_run+0x150/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x86f/0x2bf0 kernel/exit.c:966
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1107
 get_signal+0x2671/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7c0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x85/0x130 kernel/entry/common.c:40
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x426/0xfa0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880608ffe80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8880608fff00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff8880608fff80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                                                ^
 ffff888060900000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888060900080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	7f 08                	jg     0xa
   2:	84 c0                	test   %al,%al
   4:	0f 85 e4 09 00 00    	jne    0x9ee
   a:	48 89 e9             	mov    %rbp,%rcx
   d:	41 0f b6 45 35       	movzbl 0x35(%r13),%eax
  12:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  19:	fc ff df
  1c:	48 c1 e9 03          	shr    $0x3,%rcx
  20:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
  24:	0f 85 6b 17 00 00    	jne    0x1795
* 2a:	4d 8b 7d 48          	mov    0x48(%r13),%r15 <-- trapping instruction
  2e:	3c 01                	cmp    $0x1,%al
  30:	49 83 df 00          	sbb    $0x0,%r15
  34:	4d 85 ff             	test   %r15,%r15
  37:	0f 84 31 09 00 00    	je     0x96e
  3d:	49                   	rex.WB
  3e:	81                   	.byte 0x81
  3f:	ff                   	.byte 0xff


Tested on:

commit:         3a866087 Linux 6.18-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16300d2f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
dashboard link: https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13784d42580000



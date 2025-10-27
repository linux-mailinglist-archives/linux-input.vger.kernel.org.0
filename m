Return-Path: <linux-input+bounces-15761-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8AC11874
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 22:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDA71461C2E
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 21:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0647532ABF3;
	Mon, 27 Oct 2025 21:18:37 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B03D31B83D
	for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 21:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599916; cv=none; b=i/Pi2c92/Q40a8n15mN7jlpEAM7A53pJFcwicycGizcWojbA7fa1UKmKoIh2MKZVb9klP+7FDlWpF8i/OLuTiCaCiYnI1FbDyPQvVY+mhV/R1KDml+HpXSkEZe+hucXny/tsKZlkl5EKSIB4Go5P/1viDh13T18uGPmYo49rTjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599916; c=relaxed/simple;
	bh=Tg9BJVwG8e9CC3oFpeobMCdYU1Ju++yK6YUVbrqPToE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BT/OQjnGlv/k4r5jsIEnLR8hRZ1UAlSVw2TE0b3IIYG/rh/ewmjTcuMt4OYSHYQXCTfbLLMjv1tmko/ObCGyhAps2DWHcP6RBeeX9B4o7hw3QB5kIHS5hNPjM7iDObgBkK3pZ74uwTOSRZ6xyFiJChs8kdxLnTpE8vQmjiJuSOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-430ced58cd2so187596825ab.3
        for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 14:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761599912; x=1762204712;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gqfzDSFhMoTAT4Y8RVrEzjMVxNzfdEQqW7mnc4ZVd2k=;
        b=Dz2nZPwlMsZ5WLvVVJy2rXDRzs0R3nBSbU0od4tT2UjV4T+tf+JMfm69ziC1IH2ynO
         dMRGaXsFdkkVxgXYLTPXf1at+0L4PEtk95+/c1kUKXPZzSQELjEvJ03lI72Mso2X+dm2
         3XXhzHiAlLDSvIJrwnAzOtJ4B51NGXsE1ETTLbYqAoYyYvvH0vu5IRuu1cXY93PL26BN
         ASdZG0mm1Abztnd4ayQSyWH3nnsVpKzWIA/CleQazjxKzKuFdQWEdfloOmvHY+JLmAb0
         hVkHojFxHIRl05/S9qiY9w3xUKD4Mw7Wzz6UG1j9LgE5gdPLAzZyZKvpo9Q+m01AOW7T
         gk4g==
X-Forwarded-Encrypted: i=1; AJvYcCWm9PiaWiUQkZK987EnC0HlMI1ZZCjH+B7ZuGiZK5TlVHSs7LS4HosQxdMirNaD2FI7QgroQ7qUG934Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8teg9aemC3MDde5DAiACvOpGJWhZP34puTNNE0tpWwBP6HART
	H/4WLe69838DnONZBAh+2D6WIhKmfJmCHeQ2Xx02K4Bo7LHPeg5E3qU7S7EMh7dOQRh43/gVfE3
	vNgDSiOCUP3e2vTm9ZvhwDY1mgykNBn1hE+FSBYXVmRc+7/fkan6HIyNldHw=
X-Google-Smtp-Source: AGHT+IEcquB3c3TLAOB92QJjQbvwbMB5sYGUz10byyUBgk8hVE32Mq+ZPkhqfHRWJ9lIUEgIEx5dWwmeQKPiNdd16SPMKH0/dbEO
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1707:b0:430:cf18:e1e5 with SMTP id
 e9e14a558f8ab-4320f8696d9mr21911885ab.31.1761599912509; Mon, 27 Oct 2025
 14:18:32 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:18:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ffe1a8.050a0220.3344a1.03a2.GAE@google.com>
Subject: [syzbot] [lsm?] [input?] [usb?] INFO: rcu detected stall in
 sys_symlink (6)
From: syzbot <syzbot+e538d3da32f1c0337b01@syzkaller.appspotmail.com>
To: jmorris@namei.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-usb@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    72761a7e3122 Merge tag 'driver-core-6.18-rc3' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=157bcbe2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd5b960ad8a33100
dashboard link: https://syzkaller.appspot.com/bug?extid=e538d3da32f1c0337b01
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14052932580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13159d42580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/719de535e8ca/disk-72761a7e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9db2cd9e9853/vmlinux-72761a7e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3f2422cacb62/bzImage-72761a7e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e538d3da32f1c0337b01@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1):
 P5875/1:b..l
rcu: 	(detected by 1, t=10502 jiffies, g=9145, q=881 ncpus=2)
task:udevd           state:R
  running task     stack:25624 pid:5875  tgid:5875  ppid:5197   task_flags:0x400140 flags:0x00080001
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 preempt_schedule_irq+0xb5/0x150 kernel/sched/core.c:7256
 irqentry_exit+0x6f/0x90 kernel/entry/common.c:211
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:lock_release+0x2b5/0x3e0 kernel/locking/lockdep.c:5893
Code: 51 48 c7 44 24 20 00 00 00 00 9c 8f 44 24 20 f7 44 24 20 00 02 00 00 75 56 f7 c3 00 02 00 00 74 01 fb 65 48 8b 05 9b ba d0 10 <48> 3b 44 24 28 0f 85 8b 00 00 00 48 83 c4 30 5b 41 5c 41 5d 41 5e
RSP: 0018:ffffc90004207670 EFLAGS: 00000206

RAX: 12359ecc66e39e00 RBX: 0000000000000206 RCX: 12359ecc66e39e00
RDX: 0000000000000002 RSI: ffffffff8d8f29fa RDI: ffffffff8bbf05e0
RBP: ffff888032f30b80 R08: ffffc90004207bb8 R09: 0000000000000000
R10: ffffc900042077f8 R11: fffff52000840f01 R12: 0000000000000002
R13: 0000000000000002 R14: ffffffff8df3d2e0 R15: ffff888032f30000
 rcu_lock_release include/linux/rcupdate.h:341 [inline]
 rcu_read_unlock include/linux/rcupdate.h:897 [inline]
 class_rcu_destructor include/linux/rcupdate.h:1195 [inline]
 unwind_next_frame+0x19a9/0x2390 arch/x86/kernel/unwind_orc.c:680
 arch_stack_walk+0x11c/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 unpoison_slab_object mm/kasan/common.c:342 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:368
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4970 [inline]
 slab_alloc_node mm/slub.c:5280 [inline]
 kmem_cache_alloc_noprof+0x367/0x6e0 mm/slub.c:5287
 lsm_inode_alloc security/security.c:761 [inline]
 security_inode_alloc+0x39/0x330 security/security.c:1736
 inode_init_always_gfp+0x9ed/0xdc0 fs/inode.c:306
 inode_init_always include/linux/fs.h:3312 [inline]
 alloc_inode+0x82/0x1b0 fs/inode.c:353
 new_inode+0x22/0x170 fs/inode.c:1145
 __shmem_get_inode mm/shmem.c:3046 [inline]
 shmem_get_inode+0x346/0xe90 mm/shmem.c:3120
 shmem_symlink+0xa3/0x510 mm/shmem.c:4094
 vfs_symlink+0x143/0x2f0 fs/namei.c:4817
 do_symlinkat+0x1b1/0x3f0 fs/namei.c:4843
 __do_sys_symlink fs/namei.c:4864 [inline]
 __se_sys_symlink fs/namei.c:4862 [inline]
 __x64_sys_symlink+0x7a/0x90 fs/namei.c:4862
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f32be915527
RSP: 002b:00007ffe8a66d2b8 EFLAGS: 00000202
 ORIG_RAX: 0000000000000058
RAX: ffffffffffffffda RBX: 0000555d9b335010 RCX: 00007f32be915527
RDX: 0000000000000000 RSI: 0000555d9b335010 RDI: 00007ffe8a66d370
RBP: 0000555d9b33504e R08: 0000555d9b335010 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe8a66e40b
R13: 00007ffe8a66d370 R14: 0000555d8a13c6d7 R15: 00007ffe8a66e400
 </TASK>
rcu: rcu_preempt kthread starved for 10497 jiffies! g9145 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R
  running task     stack:27224 pid:16    tgid:16    ppid:2      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_timeout+0x12b/0x270 kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x301/0x1540 kernel/rcu/tree.c:2083
 rcu_gp_kthread+0x99/0x390 kernel/rcu/tree.c:2285
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
rcu: Stack dump where RCU GP kthread last ran:
Sending NMI from CPU 1 to CPUs 0:
 D
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 5890 Comm: kworker/0:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:get_current arch/x86/include/asm/current.h:25 [inline]
RIP: 0010:write_comp_data kernel/kcov.c:245 [inline]
RIP: 0010:__sanitizer_cov_trace_const_cmp4+0x8/0x90 kernel/kcov.c:314
Code: 48 89 44 11 20 c3 cc cc cc cc cc 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 8b 04 24 <65> 48 8b 14 25 08 20 6e 92 65 8b 0d d8 17 ae 10 81 e1 00 01 ff 00
RSP: 0018:ffffc90000006338 EFLAGS: 00000046
RAX: ffffffff8b4225a6 RBX: 0000000000000000 RCX: ffff88802dad9e40
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90000006460 R08: ffff88802dad9e40 R09: 0000000000000008
R10: 0000000000000007 R11: 0000000000000100 R12: 00000000ffff0a00
R13: ffffc90000006741 R14: ffffc90000006741 R15: 1ffff92000000c74
FS:  0000000000000000(0000) GS:ffff88812613e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe8a661608 CR3: 0000000074862000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 number+0xa6/0xf60 lib/vsprintf.c:472
 vsnprintf+0x91b/0xf00 lib/vsprintf.c:2890
 sprintf+0xd9/0x120 lib/vsprintf.c:3089
 print_time kernel/printk/printk.c:1354 [inline]
 info_print_prefix+0x155/0x310 kernel/printk/printk.c:1380
 record_print_text+0x154/0x420 kernel/printk/printk.c:1429
 printk_get_next_message+0x26d/0x7b0 kernel/printk/printk.c:2997
 console_emit_next_record kernel/printk/printk.c:3065 [inline]
 console_flush_all+0x4ca/0xb10 kernel/printk/printk.c:3199
 __console_flush_and_unlock kernel/printk/printk.c:3258 [inline]
 console_unlock+0xbb/0x190 kernel/printk/printk.c:3298
 vprintk_emit+0x4c5/0x590 kernel/printk/printk.c:2423
 _printk+0xcf/0x120 kernel/printk/printk.c:2448
 print_task kernel/sched/debug.c:732 [inline]
 print_rq kernel/sched/debug.c:792 [inline]
 print_cpu+0xeba/0x22b0 kernel/sched/debug.c:977
 sysrq_sched_debug_show+0x73/0x90 kernel/sched/debug.c:1061
 show_state_filter+0x23a/0x2b0 kernel/sched/core.c:7950
 kbd_keycode drivers/tty/vt/keyboard.c:1515 [inline]
 kbd_event+0x2b72/0x3f70 drivers/tty/vt/keyboard.c:1534
 input_handle_events_default+0xd4/0x1a0 drivers/input/input.c:2541
 input_pass_values+0x288/0x890 drivers/input/input.c:128
 input_event_dispose+0x3e5/0x6b0 drivers/input/input.c:353
 input_event+0x89/0xe0 drivers/input/input.c:396
 hidinput_hid_event+0x145e/0x1dd0 drivers/hid/hid-input.c:1730
 hid_process_event+0x4be/0x620 drivers/hid/hid-core.c:1565
 hid_input_array_field+0x41c/0x5f0 drivers/hid/hid-core.c:1677
 hid_process_report drivers/hid/hid-core.c:1719 [inline]
 hid_report_raw_event+0xdd9/0x16d0 drivers/hid/hid-core.c:2074
 __hid_input_report drivers/hid/hid-core.c:2144 [inline]
 hid_input_report+0x43e/0x520 drivers/hid/hid-core.c:2166
 hid_irq_in+0x47e/0x6d0 drivers/hid/usbhid/hid-core.c:286
 __usb_hcd_giveback_urb+0x376/0x540 drivers/usb/core/hcd.c:1661
 dummy_timer+0x85f/0x44c0 drivers/usb/gadget/udc/dummy_hcd.c:1995
 __run_hrtimer kernel/time/hrtimer.c:1777 [inline]
 __hrtimer_run_queues+0x52c/0xc60 kernel/time/hrtimer.c:1841
 hrtimer_run_softirq+0x187/0x2b0 kernel/time/hrtimer.c:1858
 handle_softirqs+0x286/0x870 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1052 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1052
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:lock_release+0x2b5/0x3e0 kernel/locking/lockdep.c:5893
Code: 51 48 c7 44 24 20 00 00 00 00 9c 8f 44 24 20 f7 44 24 20 00 02 00 00 75 56 f7 c3 00 02 00 00 74 01 fb 65 48 8b 05 9b ba d0 10 <48> 3b 44 24 28 0f 85 8b 00 00 00 48 83 c4 30 5b 41 5c 41 5d 41 5e
RSP: 0018:ffffc900042b63b0 EFLAGS: 00000206
RAX: cbe9a99dd6d1d300 RBX: 0000000000000206 RCX: cbe9a99dd6d1d300
RDX: 0000000000000006 RSI: ffffffff8d8f29fa RDI: ffffffff8bbf05e0
RBP: ffff88802dadaa60 R08: ffffc900042b6ab0 R09: 0000000000000000
R10: ffffc900042b6538 R11: fffff52000856ca9 R12: 0000000000000006
R13: 0000000000000006 R14: ffffffff8df3d2e0 R15: ffff88802dad9e40
 rcu_lock_release include/linux/rcupdate.h:341 [inline]
 rcu_read_unlock include/linux/rcupdate.h:897 [inline]
 class_rcu_destructor include/linux/rcupdate.h:1195 [inline]
 unwind_next_frame+0x19a9/0x2390 arch/x86/kernel/unwind_orc.c:680
 arch_stack_walk+0x11c/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 save_stack+0xf5/0x1f0 mm/page_owner.c:156
 __reset_page_owner+0x71/0x1f0 mm/page_owner.c:311
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0xbc4/0xd30 mm/page_alloc.c:2906
 vfree+0x25a/0x400 mm/vmalloc.c:3440
 hid_open_report+0xa51/0xee0 drivers/hid/hid-core.c:1365
 __hid_device_probe drivers/hid/hid-core.c:2777 [inline]
 hid_device_probe+0x4c2/0x7a0 drivers/hid/hid-core.c:2812
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 hid_add_device+0x272/0x3e0 drivers/hid/hid-core.c:2951
 usbhid_probe+0xe13/0x12a0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x668/0xc30 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
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
INFO: NMI handler (nmi_cpu_backtrace_handler) took too long to run: 4.902 msecs
     kworker/1:2   980     28637.211712   E       28638.275135           1.400000       217.185486       579     120         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-iscsi  1001      4968.009756   E        4968.025677           1.400000         0.038861         2     100         0.000000         0.000000         0.000000   0      0        /
 I    kworker/u8:5  1013     28639.875836   E       28641.063966           1.400000      1208.469023      1922     120         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-nvme-  1034      4983.113592   E        4983.129498           1.400000         0.087863         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-nvme_  1045      4986.892438   E        4986.908384           1.400000         0.065318         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-nvmet  1048      4987.469753   E        4987.485595           1.400000         0.051955         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-nvmet  1050      4988.679514   E        4988.695252           1.400000         0.093837         3     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-nvmet  1051      4990.680263   E        4990.696414           1.400000         0.026913         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-nvmet  1055      4995.921495   E        4995.937294           1.400000         0.054094         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-targe  1062      4998.575747   E        4998.591562           1.400000         0.050985         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-targe  1063      5001.509125   E        5001.524305           1.400000         0.106302         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-xcopy  1064      5008.362498   E        5008.378397           1.400000         0.259945         3     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-phy0-  1230      5287.600106   E        5287.616039           1.400000         0.040599         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-phy1-  1236      5295.340902   E        5295.356494           1.400000         0.084799         2     100         0.000000         0.000000         0.000000   0      0        /
 S       aoe_ktio0  1302      5380.797493   E        5380.924600           1.400000         0.245487         2     110         0.000000         0.000000         0.000000   0      0        /
 I   kworker/R-uas  1344      5398.590648   E        5398.606395           1.400000         0.273777         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-usbip  1912      6543.148287   E        6543.164110           1.400000         0.082930         2     100         0.000000         0.000000         0.000000   0      0        /
 S pvrusb2-context  2345      8306.127957   E        8307.434171           1.400000         0.150600         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2398      8398.695015   E        8399.919020           1.400000         0.226323         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2414      8407.197488   E        8408.586823           1.400000         0.060034         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-002-v  2429      8421.063249   E        8422.454123           1.400000         0.060025         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-003-v  2444      8550.951642   E        8552.333863           1.400000         0.076768         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2446      8551.366700   E        8552.748357           1.400000         0.072287         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-004-v  2461      8557.869780   E        8559.260712           1.400000         0.058492         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-005-v  2476      8686.825690   E        8688.213270           1.400000         0.078630         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2478      8687.289876   E        8688.671221           1.400000         0.070591         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-006-v  2493      8694.061381   E        8695.452517           1.400000         0.057133         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-007-v  2508      8823.869673   E        8825.243290           1.400000         0.078181         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2510      8824.454300   E        8825.842693           1.400000         0.066404         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-008-v  2525      8831.134697   E        8832.525851           1.400000         0.057360         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-009-v  2540      8960.839998   E        8962.221113           1.400000         0.082307         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2542      8961.257897   E        8962.638111           1.400000         0.074308         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-010-v  2557      8967.707078   E        8969.098015           1.400000         0.056403         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-011-v  2572      9100.067616   E        9101.457190           1.400000         0.067701         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2574      9100.475023   E        9101.864206           1.400000         0.057601         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-012-v  2589      9107.763047   E        9109.154094           1.400000         0.057702         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-013-v  2604      9238.213947   E        9239.596222           1.400000         0.082413         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2606      9238.667085   E        9239.303997           1.400000         0.063088         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-014-v  2620      9369.592351   E        9370.957183           1.400000         0.102758         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-014-v  2621      9369.671427   E        9371.054132           1.400000         0.079076         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2622      9369.739800   E        9371.122339           1.400000         0.068373         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-015-v  2636      9376.981571   E        9378.369933           1.400000         0.039362         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2638      9377.432131   E        9378.821229           1.400000         0.058051         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-016-v  2653      9385.142440   E        9386.533426           1.400000         0.061353         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-017-v  2668      9516.072728   E        9517.455187           1.400000         0.090841         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2670      9516.537326   E        9517.919254           1.400000         0.070127         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-018-v  2685      9523.267984   E        9524.658718           1.400000         0.060753         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-019-v  2700      9652.550752   E        9653.933383           1.400000         0.076002         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2702      9652.997639   E        9654.378752           1.400000         0.072145         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-020-v  2717      9659.858937   E        9661.249860           1.400000         0.060456         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-021-v  2732      9789.587923   E        9790.969013           1.400000         0.079855         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2734      9790.546704   E        9791.927731           1.400000         0.072902         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-022-v  2748      9912.549251   E        9913.929736           1.400000         0.085484         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2750      9912.829762   E        9914.210478           1.400000         0.079939         2     120         0.000000         0.000000         0.000000   0      0        /
 S cec-vivid-023-v  2764     10014.353002   E       10015.733883           1.400000         0.085634         2     120         0.000000         0.000000         0.000000   0      0        /
 S vivid_cec-vivid  2766     10014.639809   E       10016.020118           1.400000         0.082030         2     120         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-updat  2792     10072.148729   E       10072.164734           1.400000         0.060922         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-bcach  2812     10080.618535   E       10080.634519           1.400000         0.064175         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-kmpat  2816     10107.822154   E       10107.838139           1.400000         0.058241         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-kvub3  2836     10253.061159   E       10253.077126           1.400000         0.063148         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-kvub3  2838     10253.560778   E       10253.576785           1.400000         0.057918         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-kmems  2842     10254.736549   E       10254.752517           1.400000         0.053221         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-rdma_  2847     10256.570338   E       10256.586336           1.400000         0.057859         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-mlx4_  2852     10258.336949   E       10258.352936           1.400000         0.059482         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-srp_r  2853     10258.620555   E       10258.636358           1.400000         0.051547         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-qat_d  2870     10261.961690   E       10261.977681           1.400000         0.060914         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-adf_v  2872     10262.426048   E       10262.442040           1.400000         0.066704         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-ipv6_  3184     10564.059932   E       10564.075919           1.400000         0.062975         2     100         0.000000         0.000000         0.000000   0      0        /
 S        krfcommd  3390     10729.051948   E       10729.139726           1.400000         0.809398         2     110         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-kstrp  3396     10747.079897   E       10747.095890           1.400000         0.065332         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-rds_m  3398     10758.439383   E       10758.455363           1.400000         0.067471         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-ism_e  3399     10775.260023   E       10775.275997           1.400000         0.075831         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-bat_e  3409     10796.637309   E       10796.653293           1.400000         0.065555         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-zswap  5142     11902.212196   E       11902.228169           1.400000         0.073829         2     100         0.000000         0.000000         0.000000   0      0        /
 I kworker/R-kafs_  5145     12086.724225   E       12086.740126           1.400000         0.077600         2     100         0.000000         0.000000         0.000000   0      0        /
 I    kworker/u9:1  5148     27890.646867   E       27890.663018           1.400000         5.662948        18     100         0.000000         0.000000         0.000000   0      0        /
 S         syslogd  5179     28664.375862   E       28665.712447           1.400000       153.904170      1251     120         0.000000         0.000000         0.000000   0      0        /
 S           acpid  5182     76780.567269   E       76781.043576           1.400000        43.011033        39     120         0.000000         0.000000         0.000000   0      0        /
 R           crond  5570     76787.976909   E       76789.376909           1.400000        37.064482        20     120         0.000000         0.000000         0.000000   0      0        /
 S          dhcpcd  5628     22640.127866   E       22641.207530           1.400000        10.132755         9     120         0.000000         0.000000         0.000000   0      0        /
 S          dhcpcd  5630     22649.735315   E       22650.815408           1.400000         8.507845         8     120         0.000000         0.000000         0.000000   0      0        /
 S          dhcpcd  5632     22639.265788   E       22640.331395           1.400000         7.437987         8     120         0.000000         0.000000         0.000000   0      0        /
 S          dhcpcd  5642     20948.791395   E       20950.043413           1.400000         8.996956         4     120         0.000000         0.000000         0.000000   0      0        /
 S          dhcpcd  5648     20948.216172   E       20949.456013           1.400000         6.891531         4     120         0.000000         0.000000         0.000000   0      0        /
 S    sshd-session  5854     26582.016861   E       26583.416861           1.400000        56.288767         7     120         0.000000         0.000000         0.000000   0      0        /
 S syz-executor102  5859     27874.314739   E       27875.628941           1.400000         6.425185         2     120         0.000000         0.000000         0.000000   0      0        /
 S syz-executor102  5866     27876.370179   E       27877.721649           1.400000         3.752987         3     120         0.000000         0.000000         0.000000   0      0        /
 I    kworker/u9:2  5869     27888.971551   E       27888.977688           1.400000        61.642281        20     100         0.000000         0.000000         0.000000   0      0        /
 R           udevd  5873     76807.976909   E       76809.345069           1.400000     54046.873565        23     120         0.000000         0.000000         0.000000   0      0        /
 I    kworker/u9:4  5874     27903.100808   E       27903.116959           1.400000        41.774774        29     100         0.000000         0.000000         0.000000   0      0        /
 I    kworker/u9:6  5878     27891.196379   E       27891.211524           1.400000        42.501527        23     100         0.000000         0.000000         0.000000   0      0        /
 S           udevd  5881     28650.167544   E       28651.019431           1.400000        16.800421        15     120         0.000000         0.000000         0.000000   0      0        /
 S           udevd  5882     28671.686964   E       28672.733229           1.400000        28.493798        12     120         0.000000         0.000000         0.000000   0      0        /
 S           udevd  5883     76805.563438   E       76806.963438           1.400000        73.998062        60     120         0.000000         0.000000         0.000000   0      0        /
 S   krxrpcio/7001  5886     28127.642906   E       28127.658600           1.400000         0.092020         2     100         0.000000         0.000000         0.000000   0      0        /
 S   krxrpcio/7001  5887     28140.795188   E       28140.802710           1.400000         0.048007         2     100         0.000000         0.000000         0.000000   0      0        /
 S     kworker/1:3  5892     28660.912030   E       28662.095725           1.400000       101.577790        76     120         0.000000         0.000000         0.000000   0      0        /
>R syz-executor102  5893    129377.878069   N      129379.278069           1.400000     52600.863921        21     120         0.000000         0.000000         0.000000   0      0        /


Showing all locks held in the system:
5 locks held by kworker/u8:2/36:
11 locks held by kworker/1:2/980:
 #0: ffff88802028f148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff88802028f148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc90003b77ba0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc90003b77ba0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff888144f69198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #2: ffff888144f69198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a20 drivers/usb/core/hub.c:5898
 #3: ffff88801d7fa198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #3: ffff88801d7fa198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #4: ffff888032e7b160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #4: ffff888032e7b160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #5: ffff888079d79a20 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #5: ffff888079d79a20 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #6: ffffffff8ed58e68 (input_mutex){+.+.}-{4:4}, at: class_mutex_intr_constructor include/linux/mutex.h:230 [inline]
 #6: ffffffff8ed58e68 (input_mutex){+.+.}-{4:4}, at: input_register_device+0xa76/0x1140 drivers/input/input.c:2374
 #7: ffff888071cca300 (&led_cdev->led_access){+.+.}-{4:4}, at: led_classdev_register_ext+0x43d/0x930 drivers/leds/led-class.c:536
 #8: ffffffff8e696690 (triggers_list_lock){++++}-{4:4}, at: led_trigger_set_default+0x77/0x2a0 drivers/leds/led-triggers.c:297
 #9: ffff888071cca218 (&led_cdev->trigger_lock){+.+.}-{4:4}, at: led_trigger_set_default+0x87/0x2a0 drivers/leds/led-triggers.c:298
 #10: ffffffff8df42d78 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:311 [inline]
 #10: ffffffff8df42d78 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x2f6/0x730 kernel/rcu/tree_exp.h:957
7 locks held by kworker/0:2/983:
 #0: ffff88802028f148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff88802028f148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc90003b67ba0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc90003b67ba0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff888028499198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #2: ffff888028499198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a20 drivers/usb/core/hub.c:5898
 #3: ffff888033021198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #3: ffff888033021198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #4: ffff88807a888160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #4: ffff88807a888160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #5: ffff888078f49a20 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #5: ffff888078f49a20 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #6: ffffffff8ed58e68 (input_mutex){+.+.}-{4:4}, at: class_mutex_intr_constructor include/linux/mutex.h:230 [inline]
 #6: ffffffff8ed58e68 (input_mutex){+.+.}-{4:4}, at: input_register_device+0xa76/0x1140 drivers/input/input.c:2374
2 locks held by getty/5588:
 #0: ffff88814d1840a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
2 locks held by udevd/5873:
2 locks held by udevd/5875:
10 locks held by kworker/0:3/5890:
 #0: ffff88802028f148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff88802028f148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc900042b7ba0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc900042b7ba0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff888144fda198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #2: ffff888144fda198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a20 drivers/usb/core/hub.c:5898
 #3: ffff888033022198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #3: ffff888033022198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #4: ffff88807a88a160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #4: ffff88807a88a160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #5: ffff888076821a20 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #5: ffff888076821a20 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #6: ffff88807a88f230 (&dev->event_lock#2){..-.}-{3:3}, at: class_spinlock_irqsave_constructor include/linux/spinlock.h:585 [inline]
 #6: ffff88807a88f230 (&dev->event_lock#2){..-.}-{3:3}, at: input_event+0x76/0xe0 drivers/input/input.c:395
 #7: ffffffff8df3d2e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #7: ffffffff8df3d2e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #7: ffffffff8df3d2e0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructor include/linux/rcupdate.h:1195 [inline]
 #7: ffffffff8df3d2e0 (rcu_read_lock){....}-{1:3}, at: input_pass_values+0x8d/0x890 drivers/input/input.c:119
 #8: ffffffff8e759298 (kbd_event_lock){..-.}-{3:3}, at: spin_lock include/linux/spinlock.h:351 [inline]
 #8: ffffffff8e759298 (kbd_event_lock){..-.}-{3:3}, at: kbd_event+0xd2/0x3f70 drivers/tty/vt/keyboard.c:1528
 #9: ffffffff8df3d2e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #9: ffffffff8df3d2e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #9: ffffffff8df3d2e0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6775
2 locks held by syz-executor102/5891:
7 locks held by kworker/1:3/5892:
 #0: ffff88802028f148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff88802028f148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc900042d7ba0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc900042d7ba0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff888144f79198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #2: ffff888144f79198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a20 drivers/usb/core/hub.c:5898
 #3: ffff888033425198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #3: ffff888033425198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #4: ffff888024471160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #4: ffff888024471160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #5: ffff888031619a20 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:914 [inline]
 #5: ffff888031619a20 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1006
 #6: ffffffff8ed58e68 (input_mutex){+.+.}-{4:4}, at: class_mutex_intr_constructor include/linux/mutex.h:230 [inline]
 #6: ffffffff8ed58e68 (input_mutex){+.+.}-{4:4}, at: input_register_device+0xa76/0x1140 drivers/input/input.c:2374
1 lock held by syz-executor102/5893:

=============================================

task:init            state:S stack:18696 pid:1     tgid:1     ppid:0      task_flags:0x400100 flags:0x00080001
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 do_nanosleep+0x1c5/0x610 kernel/time/hrtimer.c:2116
 hrtimer_nanosleep+0x169/0x360 kernel/time/hrtimer.c:2163
 __do_sys_clock_nanosleep kernel/time/posix-timers.c:1398 [inline]
 __se_sys_clock_nanosleep+0x339/0x390 kernel/time/posix-timers.c:1375
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc4040d6407
RSP: 002b:00007ffe706b4460 EFLAGS: 00000202 ORIG_RAX: 00000000000000e6
RAX: ffffffffffffffda RBX: 00007fc403f86c80 RCX: 00007fc4040d6407
RDX: 00007ffe706b44a0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000016 R08: 0000000000000000 R09: 0000000000000000
R10: 00007ffe706b44a0 R11: 0000000000000202 R12: 00007fc4042f0490
R13: 00007ffe706b44dc R14: 00007fc404330000 R15: 000055e628cb4d98
 </TASK>
task:kthreadd        state:S stack:25912 pid:2     tgid:2     ppid:0      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 kthreadd+0x3e3/0x770 kernel/kthread.c:834
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:pool_workqueue_ state:S stack:28712 pid:3     tgid:3     ppid:2      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 kthread_worker_fn+0x4c2/0xb60 kernel/kthread.c:1017
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/R-rcu_g state:I stack:30088 pid:4     tgid:4     ppid:2      task_flags:0x4208060 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rescuer_thread+0xc69/0xdd0 kernel/workqueue.c:3577
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/R-sync_ state:I stack:30344 pid:5     tgid:5     ppid:2      task_flags:0x4208060 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rescuer_thread+0xc69/0xdd0 kernel/workqueue.c:3577
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/R-kvfre state:I stack:30344 pid:6     tgid:6     ppid:2      task_flags:0x4208060 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rescuer_thread+0xc69/0xdd0 kernel/workqueue.c:3577
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/R-slub_ state:I stack:30344 pid:7     tgid:7     ppid:2      task_flags:0x4208060 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rescuer_thread+0xc69/0xdd0 kernel/workqueue.c:3577
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/R-netns state:I stack:30344 pid:8     tgid:8     ppid:2      task_flags:0x4208060 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rescuer_thread+0xc69/0xdd0 kernel/workqueue.c:3577
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/0:0     state:I stack:24872 pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue:  0x0 (events)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 worker_thread+0xa82/0xda0 kernel/workqueue.c:3442
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/0:1     state:I stack:20424 pid:10    tgid:10    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue:  0x0 (events)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 worker_thread+0xa82/0xda0 kernel/workqueue.c:3442
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/0:0H    state:I stack:28648 pid:11    tgid:11    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue:  0x0 (events_highpri)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 worker_thread+0xa82/0xda0 kernel/workqueue.c:3442
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/u8:0    state:I stack:24552 pid:12    tgid:12    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue:  0x0 (events_unbound)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 worker_thread+0xa82/0xda0 kernel/workqueue.c:3442
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/u8:1    state:I stack:24168 pid:13    tgid:13    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue:  0x0 (events_unbound)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 worker_thread+0xa82/0xda0 kernel/workqueue.c:3442
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/R-mm_pe state:R  running task     stack:30488 pid:14    tgid:14    ppid:2      task_flags:0x4208060 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rescuer_thread+0xc69/0xdd0 kernel/workqueue.c:3577
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:ksoftirqd/0     state:S stack:24136 pid:15    tgid:15    ppid:2      task_flags:0x4208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 smpboot_thread_fn+0x5bd/0xa60 kernel/smpboot.c:156
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:rcu_preempt     state:I stack:27224 pid:16    tgid:16    ppid:2      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_timeout+0x12b/0x270 kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x301/0x1540 kernel/rcu/tree.c:2083
 rcu_gp_kthread+0x99/0x390 kernel/rcu/tree.c:2285
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:rcu_exp_par_gp_ state:S stack:30408 pid:17    tgid:17    ppid:2      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 kthread_worker_fn+0x4c2/0xb60 kernel/kthread.c:1017
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:rcu_exp_gp_kthr state:D stack:28040 pid:18    tgid:18    ppid:2      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_timeout+0x12b/0x270 kernel/time/sleep_timeout.c:99
 synchronize_rcu_expedited_wait_once kernel/rcu/tree_exp.h:545 [inline]
 synchronize_rcu_expedited_wait kernel/rcu/tree_exp.h:658 [inline]
 rcu_exp_wait_wake kernel/rcu/tree_exp.h:687 [inline]
 rcu_exp_sel_wait_wake+0x708/0xe20 kernel/rcu/tree_exp.h:721
 kthread_worker_fn+0x507/0xb60 kernel/kthread.c:1010
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:migration/0     state:S stack:28696 pid:19    tgid:19    ppid:2      task_flags:0x4208040 flags:0x00080000
Stopper: 0x0 <- 0x0
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 smpboot_thread_fn+0x5bd/0xa60 kernel/smpboot.c:156
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:cpuhp/0         state:S stack:25592 pid:20    tgid:20    ppid:2      task_flags:0x4208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 smpboot_thread_fn+0x5bd/0xa60 kernel/smpboot.c:156
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:cpuhp/1         state:S stack:26904 pid:21    tgid:21    ppid:2      task_flags:0x4208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 smpboot_thread_fn+0x5bd/0xa60 kernel/smpboot.c:156
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:migration/1     state:S stack:28808 pid:22    tgid:22    ppid:2      task_flags:0x4208040 flags:0x00080000
Stopper: 0x0 <- 0x0
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 smpboot_thread_fn+0x5bd/0xa60 kernel/smpboot.c:156
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:ksoftirqd/1     state:R  running task     stack:22216 pid:23    tgid:23    ppid:2      task_flags:0x4208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 smpboot_thread_fn+0x5bd/0xa60 kernel/smpboot.c:156
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/1:0     state:D stack:24168 pid:24    tgid:24    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue:  0x0 (events)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_timeout+0x9a/0x270 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common+0x3da/0x710 kernel/sched/completion.c:121
 wait_for_common kernel/sched/completion.c:132 [inline]
 wait_for_completion_killable+0x1f/0x40 kernel/sched/completion.c:259
 __kthread_create_on_node+0x2f9/0x3e0 kernel/kthread.c:535
 kthread_create_on_node+0xdd/0x130 kernel/kthread.c:587
 create_worker+0x299/0x720 kernel/workqueue.c:2802
 maybe_create_worker kernel/workqueue.c:3063 [inline]
 manage_workers kernel/workqueue.c:3140 [inline]
 worker_thread+0x33e/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/1:0H    state:I stack:27880 pid:25    tgid:25    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue:  0x0 (events_highpri)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 worker_thread+0xa82/0xda0 kernel/workqueue.c:3442
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kdevtmpfs       state:S stack:24712 pid:26    tgid:26    ppid:2      task_flags:0x208140 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 devtmpfs_work_loop+0xca7/0xce0 drivers/base/devtmpfs.c:409
 devtmpfsd+0x4d/0x50 drivers/base/devtmpfs.c:442
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/R-inet_ state:I stack:30440 pid:27    tgid:27    ppid:2      task_flags:0x4208060 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rescuer_thread+0xc69/0xdd0 kernel/workqueue.c:3577
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:rcu_tasks_kthre state:I stack:28552 pid:28    tgid:28    ppid:2      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rcu_tasks_one_gp+0x877/0xdf0 kernel/rcu/tasks.h:611
 rcu_tasks_kthread+0x195/0x1c0 kernel/rcu/tasks.h:658
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:rcu_tasks_trace state:I stack:27448 pid:29    tgid:29    ppid:2      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rcu_tasks_one_gp+0x877/0xdf0 kernel/rcu/tasks.h:611
 rcu_tasks_kthread+0x195/0x1c0 kernel/rcu/tasks.h:658
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kauditd         state:S stack:28744 pid:30    tgid:30    ppid:2      task_flags:0x200040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 kauditd_thread+0x894/0x9a0 kernel/audit.c:948
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:khungtaskd      state:R  running task     stack:29304 pid:31    tgid:31    ppid:2      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_timeout+0x12b/0x270 kernel/time/sleep_timeout.c:99
 watchdog+0x90/0xfa0 kernel/hung_task.c:499
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:oom_reaper      state:S stack:30248 pid:32    tgid:32    ppid:2      task_flags:0x200040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 oom_reaper+0x112/0xab0 mm/oom_kill.c:656
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/R-write state:I stack:30488 pid:33    tgid:33    ppid:2      task_flags:0x4208060 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 rescuer_thread+0xc69/0xdd0 kernel/workqueue.c:3577
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kcompactd0      state:R  running task     stack:27912 pid:34    tgid:34    ppid:2      task_flags:0x210040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_timeout+0x12b/0x270 kernel/time/sleep_timeout.c:99
 kcompactd+0x406/0x1290 mm/compaction.c:3187
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kcompactd1      state:R  running task     stack:27784 pid:35    tgid:35    ppid:2      task_flags:0x210040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_timeout+0x12b/0x270 kernel/time/sleep_timeout.c:99
 kcompactd+0x406/0x1290 mm/compaction.c:3187
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/u8:2    state:D stack:20712 pid:36    tgid:36    ppid:2      task_flags:0x4208160 flags:0x00080000
Workqueue: events_unbound idle_cull_fn
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_timeout+0x9a/0x270 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common kernel/sched/completion.c:121 [inline]
 wait_for_common kernel/sched/completion.c:132 [inline]
 wait_for_completion+0x2bf/0x5d0 kernel/sched/completion.c:153
 kthread_stop+0x193/0x5c0 kernel/kthread.c:790
 kthread_stop_put+0x1a/0xa0 kernel/kthread.c:811
 reap_dying_workers kernel/workqueue.c:2860 [inline]
 idle_cull_fn+0x662/0x730 kernel/workqueue.c:2982
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:ksmd            state:S stack:29736 pid:37    tgid:37    ppid:2      task_flags:0x200040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 ksm_scan_thread+0x38e/0x4b0 mm/ksm.c:2693
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:khugepaged      state:S stack:29288 pid:38    tgid:38    ppid:2      task_flags:0x200040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 khugepaged_wait_work mm/khugepaged.c:2598 [inline]
 khugepaged+0x13bb/0x16a0 mm/khugepaged.c:2610
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kworker/R-kbloc state:I stack:30344 pid:39    tgid:39    ppid:2      task_flags:0x4208060 flags:0x00080000
Call Trace:
 <TASK>


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


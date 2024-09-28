Return-Path: <linux-input+bounces-6852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F5C989203
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 01:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F08571F2347B
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 23:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD97187561;
	Sat, 28 Sep 2024 23:40:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A331865E6
	for <linux-input@vger.kernel.org>; Sat, 28 Sep 2024 23:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727566827; cv=none; b=b/kU612ZHrX3PHMsAhR5KIzygYpgh0LLhXmrZyCM8Kj4AfnEZ5N7C2Pu84/HYrpOn2vYD7OT2saPkxh0vjhPOjw8afJDWTrEjaePOaVRdiHksmdhivb+2ohLcWDwjmpH1se1MQKe8Z8Za15YPTPYBjRc3zYkT0HnUcigSvVZ1EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727566827; c=relaxed/simple;
	bh=ApGwPvBfwZGhS1TuPtRxXgE9EA44Q6n3Wo/v8ryid4U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JEpiVU7hkd5RHWvoJUNHY72ozxRqfAgnFUIkM0U+xXQ3/Fy2Oh1eoVZHgexAV5NOMspPnFnQGYwmXk50rk15JaR8oTg1bvYTWfO17wNdW3AgAHIMvvx/4ozVMv1eqp2RNgJO7YUEE/9++2o7HLqP8R5hVk8noxqFYdfFEtrPYFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a19665ed40so27134385ab.1
        for <linux-input@vger.kernel.org>; Sat, 28 Sep 2024 16:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727566823; x=1728171623;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFJmp6gLbnEepkX2h1Z6edBG4Cd1O5QDjKXRK11SBzY=;
        b=UQ71cIQwSu0CPLeL0ZAsyAOnMgQvbrIkncXKQWaf9biwqpiSucnmrU/rIav143pTOk
         CWpmd3f28kql10YrBV7+HOJDqhLtFXcIufYnwhl1AWmCBlr6Ap4UTpzvvre/2tcIPTey
         spEE6nWkTXlQH6bpXvM/YFa2kaPxO8LqhPy58CrI61gRLaJGdG1vIXqPPommDjvQvvo3
         JIAIYMYNtQMVx46T+ludhP8zmWdEaKAcu1Q6Sk9vEbH3TjPesZ8xaUArzfLqQI53Xwyx
         8hdF2H0cKkARro0K00f+IoWd6RazOPv9sSUYIdiCoFtjVuo3Puxq0eWu/4toREhPdvn+
         mLDw==
X-Forwarded-Encrypted: i=1; AJvYcCWEVAid+fu4XOWbauZryIm6sMY5xonYzBfqd+ndcxmDGv0cCYO9byNml751gfhugz2TvSwH9Ioqvfg/JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYoBSGMDqeMhUxDaYIwWB4fsK8h9uvvZtLcCShzlgAgrjrDBl
	/+RJ1p+NWD4HeOSuq9+mzTujTnZv38qBQluwNVj60DYALZ9wgSixwRJQJVly6jywa7FgKIksoX6
	cwN9YCU6qbFaQIDmpMA6oz1t6Khwvy4GgBp3e610/DKk/toQF0h+pkl4=
X-Google-Smtp-Source: AGHT+IHfU8CtEO0k/7ykl8ub2xbJsnByun44jQFnRY1e0O6mwNxi7QJgDnJLJvwqyBC/VarddPIt0I6QDUS1YCveds9t0JwHPYU+
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a8e:b0:3a2:762b:faf0 with SMTP id
 e9e14a558f8ab-3a34463f518mr52768385ab.11.1727566823509; Sat, 28 Sep 2024
 16:40:23 -0700 (PDT)
Date: Sat, 28 Sep 2024 16:40:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66f893e7.050a0220.4a974.0011.GAE@google.com>
Subject: [syzbot] [kernfs?] [input?] [usb?] INFO: rcu detected stall in
 kernfs_fop_read_iter (4)
From: syzbot <syzbot+c403e932e9c6662dd4f2@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    68d4209158f4 sub: cdns3: Use predefined PCI vendor ID cons..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13146a27980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb61872d4d8c5df9
dashboard link: https://syzkaller.appspot.com/bug?extid=c403e932e9c6662dd4f2
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15487107980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c69290425359/disk-68d42091.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/caf4f26a3e85/vmlinux-68d42091.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3acdec4b62e6/bzImage-68d42091.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c403e932e9c6662dd4f2@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
 0-...D
 } 2685 jiffies s: 1141 root: 0x1/.
rcu: blocking rcu_node structures (internal RCU debug):
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 7800 Comm: udevd Not tainted 6.11.0-rc7-syzkaller-00152-g68d4209158f4 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
RIP: 0010:io_serial_in+0x87/0xb0 drivers/tty/serial/8250/8250_port.c:407
Code: b4 b8 fe 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1a 66 03 5d 40 89 da ec <5b> 0f b6 c0 5d 41 5c c3 cc cc cc cc e8 a8 ec 0e ff eb a2 e8 31 ed
RSP: 0018:ffffc90000006fe8 EFLAGS: 00000006
RAX: dffffc0000000005 RBX: 00000000000003f9 RCX: 0000000000000000
RDX: 00000000000003f9 RSI: ffffffff829bdf80 RDI: ffffffff935cfbc0
RBP: ffffffff935cfb80 R08: 0000000000000001 R09: 000000000000001f
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffffffff935cfb80 R14: ffffffff935cfbd0 R15: 000000000000004f
FS:  00007f3a891dcc80(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555b96859dc8 CR3: 0000000119e40000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 serial_port_in include/linux/serial_core.h:674 [inline]
 serial8250_console_write+0x17d/0x1090 drivers/tty/serial/8250/8250_port.c:3357
 console_emit_next_record kernel/printk/printk.c:2983 [inline]
 console_flush_all+0x53c/0xd70 kernel/printk/printk.c:3049
 console_unlock+0xae/0x290 kernel/printk/printk.c:3118
 vprintk_emit+0x409/0x600 kernel/printk/printk.c:2348
 vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:45
 _printk+0xc8/0x100 kernel/printk/printk.c:2373
 printk_stack_address arch/x86/kernel/dumpstack.c:72 [inline]
 show_trace_log_lvl+0x211/0x500 arch/x86/kernel/dumpstack.c:285
 sched_show_task kernel/sched/core.c:7432 [inline]
 sched_show_task+0x42e/0x650 kernel/sched/core.c:7406
 show_state_filter+0xee/0x320 kernel/sched/core.c:7477
 k_spec drivers/tty/vt/keyboard.c:667 [inline]
 k_spec+0xed/0x150 drivers/tty/vt/keyboard.c:656
 kbd_keycode drivers/tty/vt/keyboard.c:1522 [inline]
 kbd_event+0xcbd/0x17a0 drivers/tty/vt/keyboard.c:1541
 input_handler_events_default+0x116/0x1b0 drivers/input/input.c:2552
 input_pass_values+0x777/0x8e0 drivers/input/input.c:126
 input_event_dispose drivers/input/input.c:352 [inline]
 input_handle_event+0xb30/0x14d0 drivers/input/input.c:369
 input_event drivers/input/input.c:398 [inline]
 input_event+0x83/0xa0 drivers/input/input.c:390
 hidinput_hid_event+0xa12/0x2410 drivers/hid/hid-input.c:1746
 hid_process_event+0x4b7/0x5e0 drivers/hid/hid-core.c:1540
 hid_input_array_field+0x330/0x710 drivers/hid/hid-core.c:1644
 hid_process_report drivers/hid/hid-core.c:1694 [inline]
 hid_report_raw_event+0xa02/0x11c0 drivers/hid/hid-core.c:2015
 __hid_input_report.constprop.0+0x341/0x440 drivers/hid/hid-core.c:2085
 hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
 __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x17c3/0x38d0 drivers/usb/gadget/udc/dummy_hcd.c:1988
 __run_hrtimer kernel/time/hrtimer.c:1689 [inline]
 __hrtimer_run_queues+0x20c/0xcc0 kernel/time/hrtimer.c:1753
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1770
 handle_softirqs+0x209/0x8e0 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0xac/0x110 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1043
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__sanitizer_cov_trace_switch+0x12/0x90 kernel/kcov.c:330
Code: 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 41 56 41 55 41 54 49 89 fc 55 48 89 f5 53 <48> 8b 46 08 48 83 f8 20 74 6b 77 48 48 83 f8 08 74 5b 48 83 f8 10
RSP: 0018:ffffc9000264f820 EFLAGS: 00000202
RAX: 0000000000000000 RBX: ffffc9000264f8d0 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff8725b3e0 RDI: 0000000000000001
RBP: ffffffff8725b3e0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000001
R13: ffffc9000264fe90 R14: 0000000000000001 R15: 0000000000000001
 unwind_next_frame+0xebe/0x23a0 arch/x86/kernel/unwind_orc.c:641
 arch_stack_walk+0x100/0x170 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x95/0xd0 kernel/stacktrace.c:122
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579
 poison_slab_object+0xf7/0x160 mm/kasan/common.c:240
 __kasan_slab_free+0x14/0x30 mm/kasan/common.c:256
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2256 [inline]
 slab_free mm/slub.c:4477 [inline]
 kfree+0x10b/0x380 mm/slub.c:4598
 kernfs_file_read_iter fs/kernfs/file.c:272 [inline]
 kernfs_fop_read_iter+0x3c7/0x590 fs/kernfs/file.c:280
 new_sync_read fs/read_write.c:395 [inline]
 vfs_read+0x869/0xbd0 fs/read_write.c:476
 ksys_read+0x12f/0x260 fs/read_write.c:619
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3a89307b6a
Code: 00 3d 00 00 41 00 75 0d 50 48 8d 3d 2d 08 0a 00 e8 ea 7d 01 00 31 c0 e9 07 ff ff ff 64 8b 04 25 18 00 00 00 85 c0 75 1b 0f 05 <48> 3d 00 f0 ff ff 76 6c 48 8b 15 8f a2 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007fffce011e78 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f3a89307b6a
RDX: 0000000000010011 RSI: 00007fffce011ea7 RDI: 0000000000000008
RBP: 0000000000000008 R08: 0000000000000000 R09: 2503b569d48cb172
R10: 0000000000000000 R11: 0000000000000246 R12: 0000555b9684da10
R13: 00007fffce022588 R14: 0000000000000003 R15: 00007fffce011ea7
 </TASK>
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 _cond_resched include/linux/sched.h:2007 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1db/0x270 kernel/sched/core.c:5319
 bprm_execve fs/exec.c:1913 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1896
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2087
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/u8:1    state:R  running task     stack:32568 pid:8382  tgid:8382  ppid:28     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25152 pid:8406  tgid:8406  ppid:2685   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ffa91e85a90
RSP: 002b:00007ffd8c869968 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ffa91f76860 RCX: 00007ffa91e85a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007ffa91f76860 R08: 0000000000000001 R09: bd21514f53bc1e18
R10: 00007ffd8c869820 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ffa91f7a658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8410  tgid:8410  ppid:1170   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:modprobe        state:R  running task     stack:25056 pid:8411  tgid:8411  ppid:2673   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 __schedule_loop kernel/sched/core.c:6606 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6621
 exit_to_user_mode_loop kernel/entry/common.c:102 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 irqentry_exit_to_user_mode+0xdb/0x240 kernel/entry/common.c:231
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0033:0x7f6652bf591f
RSP: 002b:00007ffe9c9bb5b8 EFLAGS: 00010287
RAX: ffffffffffffffda RBX: 00007f6652d60860 RCX: 00007f6652c6fa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f6652d60860 R08: 0000000000000001 R09: ec43923c57149391
R10: 00007ffe9c9bbb60 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f6652d64658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25056 pid:8413  tgid:8413  ppid:1170   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8415  tgid:8415  ppid:2673   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6517611a90
RSP: 002b:00007ffe6a7e88b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f6517702860 RCX: 00007f6517611a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f6517702860 R08: 0000000000000001 R09: 8e615c0050105d9d
R10: 00007ffe6a7e8770 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f6517706658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8419  tgid:8419  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8422  tgid:8422  ppid:53     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8425  tgid:8425  ppid:2685   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8429  tgid:8429  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5ec3f80a90
RSP: 002b:00007ffc1ddbac68 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f5ec4071860 RCX: 00007f5ec3f80a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f5ec4071860 R08: 0000000000000001 R09: 9b2625dcf69a597b
R10: 00007ffc1ddbab20 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f5ec4075658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8434  tgid:8434  ppid:2685   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8437  tgid:8437  ppid:53     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8440  tgid:8440  ppid:781    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe31edd1a90
RSP: 002b:00007ffcff2ffac8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fe31eec2860 RCX: 00007fe31edd1a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fe31eec2860 R08: 0000000000000001 R09: d5168af28b0b2b98
R10: 00007ffcff2ff980 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fe31eec6658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8445  tgid:8445  ppid:2685   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:0    state:R  running task     stack:28832 pid:8447  tgid:8447  ppid:2673   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 _cond_resched include/linux/sched.h:2007 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1db/0x270 kernel/sched/core.c:5319
 bprm_execve fs/exec.c:1913 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1896
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2087
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8453  tgid:8453  ppid:53     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25152 pid:8457  tgid:8457  ppid:781    flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:2    state:R  running task     stack:32568 pid:8462  tgid:8462  ppid:2685   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25152 pid:8463  tgid:8463  ppid:2673   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4f6b6fba90
RSP: 002b:00007fff141e27f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f4f6b7ec860 RCX: 00007f4f6b6fba90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f4f6b7ec860 R08: 0000000000000001 R09: e0616ea1e8f5239c
R10: 00007fff141e26b0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f4f6b7f0658 R15: 0000000000000001
 </TASK>
task:kworker/u8:0    state:R  running task     stack:32568 pid:8466  tgid:8466  ppid:2673   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8469  tgid:8469  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a9aed8a90
RSP: 002b:00007ffc8cf5e2b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f7a9afc9860 RCX: 00007f7a9aed8a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f7a9afc9860 R08: 0000000000000001 R09: 55e021ad30b7485d
R10: 00007ffc8cf5e170 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f7a9afcd658 R15: 0000000000000001
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8472  tgid:8472  ppid:53     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24640 pid:8475  tgid:8475  ppid:28     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8479  tgid:8479  ppid:2685   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:2    state:R  running task     stack:32568 pid:8483  tgid:8483  ppid:2685   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25056 pid:8485  tgid:8485  ppid:28     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0ea73ada90
RSP: 002b:00007fffa060f3f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f0ea749e860 RCX: 00007f0ea73ada90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f0ea749e860 R08: 0000000000000001 R09: c768e6ff46d04a00
R10: 00007fffa060f2b0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f0ea74a2658 R15: 0000000000000001
 </TASK>
task:kworker/u8:8    state:R  running task     stack:32568 pid:8487  tgid:8487  ppid:1170   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25056 pid:8491  tgid:8491  ppid:28     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8492  tgid:8492  ppid:53     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24640 pid:8497  tgid:8497  ppid:2685   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:1    state:R  running task     stack:28832 pid:8501  tgid:8501  ppid:28     flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 _cond_resched include/linux/sched.h:2007 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1db/0x270 kernel/sched/core.c:5319
 bprm_execve fs/exec.c:1913 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1896
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2087
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8506  tgid:8506  ppid:53     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25152 pid:8509  tgid:8509  ppid:781    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fac09c23a90
RSP: 002b:00007ffc2c817878 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fac09d14860 RCX: 00007fac09c23a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fac09d14860 R08: 0000000000000001 R09: 8b949914f98c1c64
R10: 00007ffc2c817730 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fac09d18658 R15: 0000000000000001
 </TASK>
task:kworker/u8:2    state:R  running task     stack:28832 pid:8511  tgid:8511  ppid:2685   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:8    state:R  running task     stack:32568 pid:8514  tgid:8514  ppid:1170   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:kworker/u8:0    state:R  running task     stack:28832 pid:8518  tgid:8518  ppid:2673   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 _cond_resched include/linux/sched.h:2007 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1db/0x270 kernel/sched/core.c:5319
 bprm_execve fs/exec.c:1913 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1896
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2087
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/u8:2    state:R  running task     stack:28832 pid:8526  tgid:8526  ppid:2685   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 _cond_resched include/linux/sched.h:2007 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1db/0x270 kernel/sched/core.c:5319
 bprm_execve fs/exec.c:1913 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1896
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2087
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8531  tgid:8531  ppid:53     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8533  tgid:8533  ppid:781    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4a9c560a90
RSP: 002b:00007ffdc257faa8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f4a9c651860 RCX: 00007f4a9c560a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f4a9c651860 R08: 0000000000000001 R09: 51420c78013f3458
R10: 00007ffdc257f960 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f4a9c655658 R15: 0000000000000001
 </TASK>
task:kworker/u8:5    state:R  running task     stack:32568 pid:8537  tgid:8537  ppid:781    flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8540  tgid:8540  ppid:2673   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1b1407aa90
RSP: 002b:00007fff5ca978c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f1b1416b860 RCX: 00007f1b1407aa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f1b1416b860 R08: 0000000000000001 R09: 47afac029e49e2c1
R10: 00007fff5ca97780 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f1b1416f658 R15: 0000000000000001
 </TASK>
task:kworker/u8:2    state:R  running task     stack:32568 pid:8541  tgid:8541  ppid:2685   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:kworker/u8:0    state:R  running task     stack:32568 pid:8546  tgid:8546  ppid:2673   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8547  tgid:8547  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd9903e9a90
RSP: 002b:00007ffd947080d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fd9904da860 RCX: 00007fd9903e9a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fd9904da860 R08: 0000000000000001 R09: 4a0f2b4bbe4322bb
R10: 00007ffd94707f90 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fd9904de658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24640 pid:8553  tgid:8553  ppid:1170   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:modprobe        state:R  running task     stack:25056 pid:8558  tgid:8558  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbb47047a90
RSP: 002b:00007ffd239e9ae8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fbb47138860 RCX: 00007fbb47047a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fbb47138860 R08: 0000000000000001 R09: 3d9f75680b1fbff6
R10: 00007ffd239e99a0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fbb4713c658 R15: 0000000000000001
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8561  tgid:8561  ppid:53     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:kworker/u8:5    state:R  running task     stack:32568 pid:8565  tgid:8565  ppid:781    flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8566  tgid:8566  ppid:2685   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:kworker/u8:0    state:R  running task     stack:32568 pid:8571  tgid:8571  ppid:2673   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8573  tgid:8573  ppid:1170   flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8574  tgid:8574  ppid:53     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8580  tgid:8580  ppid:1170   flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8581  tgid:8581  ppid:2685   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f355325da90
RSP: 002b:00007fff28c0f648 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f355334e860 RCX: 00007f355325da90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f355334e860 R08: 0000000000000001 R09: 0e51c794cb441848
R10: 00007fff28c0f500 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f3553352658 R15: 0000000000000001
 </TASK>
task:kworker/u8:0    state:R  running task     stack:28832 pid:8584  tgid:8584  ppid:2673   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 _cond_resched include/linux/sched.h:2007 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1db/0x270 kernel/sched/core.c:5319
 bprm_execve fs/exec.c:1913 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1896
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2087
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/u8:5    state:R  running task     stack:28832 pid:8593  tgid:8593  ppid:781    flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 _cond_resched include/linux/sched.h:2007 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1db/0x270 kernel/sched/core.c:5319
 bprm_execve fs/exec.c:1913 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1896
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2087
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:modprobe        state:R  running task     stack:25056 pid:8600  tgid:8600  ppid:1170   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 </TASK>
task:kworker/u8:8    state:R  running task     stack:32568 pid:8603  tgid:8603  ppid:1170   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24640 pid:8606  tgid:8606  ppid:2673   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f57b6699a90
RSP: 002b:00007ffc369c4ad8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f57b678a860 RCX: 00007f57b6699a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f57b678a860 R08: 0000000000000001 R09: 10dcad4d11d81622
R10: 00007ffc369c4990 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f57b678e658 R15: 0000000000000001
 </TASK>
task:kworker/u8:2    state:R  running task     stack:32568 pid:8608  tgid:8608  ppid:2685   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8611  tgid:8611  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:5    state:R  running task     stack:32568 pid:8616  tgid:8616  ppid:781    flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8618  tgid:8618  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:2    state:R  running task     stack:32568 pid:8623  tgid:8623  ppid:2685   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24528 pid:8625  tgid:8625  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:0    state:R  running task     stack:28832 pid:8628  tgid:8628  ppid:2673   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6708
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7041
 _cond_resched include/linux/sched.h:2007 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1db/0x270 kernel/sched/core.c:5319
 bprm_execve fs/exec.c:1913 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1896
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2087
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:modprobe        state:R  running task     stack:25152 pid:8636  tgid:8636  ppid:53     flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc7382a6a90
RSP: 002b:00007ffe3480b2d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fc738397860 RCX: 00007fc7382a6a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fc738397860 R08: 0000000000000001 R09: 6a9a1303a5952401
R10: 00007ffe3480b190 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fc73839b658 R15: 0000000000000001
 </TASK>
task:kworker/u8:5    state:R  running task     stack:32568 pid:8640  tgid:8640  ppid:781    flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25152 pid:8641  tgid:8641  ppid:1170   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8644  tgid:8644  ppid:53     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0f964daa90
RSP: 002b:00007ffe00f8f7e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f0f965cb860 RCX: 00007f0f964daa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f0f965cb860 R08: 0000000000000001 R09: e25139ac1609afb4
R10: 00007ffe00f8f6a0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f0f965cf658 R15: 0000000000000001
 </TASK>
task:kworker/u8:8    state:R  running task     stack:32568 pid:8645  tgid:8645  ppid:1170   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:kworker/u8:2    state:R  running task     stack:32568 pid:8650  tgid:8650  ppid:2685   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24544 pid:8652  tgid:8652  ppid:2673   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3b79463a90
RSP: 002b:00007ffe34c79a38 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f3b79554860 RCX: 00007f3b79463a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f3b79554860 R08: 0000000000000001 R09: f8573efe8f198aae
R10: 00007ffe34c798f0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f3b79558658 R15: 0000000000000001
 </TASK>
task:kworker/u8:5    state:R  running task     stack:32568 pid:8654  tgid:8654  ppid:781    flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8660  tgid:8660  ppid:1170   flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8661  tgid:8661  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6545
 do_exit+0x1d37/0x2b30 kernel/exit.c:933
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
 __do_sys_exit_group kernel/exit.c:1042 [inline]
 __se_sys_exit_group kernel/exit.c:1040 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1040
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5ff2f31a90
RSP: 002b:00007ffd3c7ba2b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f5ff3022860 RCX: 00007f5ff2f31a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f5ff3022860 R08: 0000000000000001 R09: 4cf41568dbe8e247
R10: 00007ffd3c7ba170 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f5ff3026658 R15: 0000000000000001
 </TASK>
task:kworker/u8:8    state:R  running task     stack:32568 pid:8666  tgid:8666  ppid:1170   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25776 pid:8667  tgid:8667  ppid:53     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0xcda/0x2f80 kernel/sched/core.c:6529
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8671  tgid:8671  ppid:53     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25056 pid:8674  tgid:8674  ppid:2673   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>


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


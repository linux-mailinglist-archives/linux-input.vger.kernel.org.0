Return-Path: <linux-input+bounces-7110-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE8992A59
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 13:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34F351C2281B
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 11:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8631D1F76;
	Mon,  7 Oct 2024 11:38:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC121AD401
	for <linux-input@vger.kernel.org>; Mon,  7 Oct 2024 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728301106; cv=none; b=qYvp1p/dM8ulSBd4DTRvKshjAFOkqTAdt2cyCbecriAoDwP2NGQmT4DfzxCJ9B8vdMOf6+vA8BYu4hMv6BTV8bDBsKb3k+cENCLoCjs77y5gePni4UAZPe3GMlhJWIMSgny1Udy+ip89cfOLXvg2aUY5DTaoHC1EcZYiPU1XK9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728301106; c=relaxed/simple;
	bh=lhoSMt8OY4M0fYICS1dJZwyEF7bobJRgee9cnXpzqY8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KLKXU50dXihY/DwrfBhq+/tkodv6utPGWNcWWzDmHbFMGrp4y1edj/rYs+FLtBcNunNpL59Q+tO7eoZXkHqEzHbeGP+VMVZqzb6ERDgnm6mnH3O9l/O21Td8xYyAuMC4HqFPrictyiSqe+vRK5GB9V36yucqFvYDLnL8wjATr10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a1a2af837dso43619765ab.1
        for <linux-input@vger.kernel.org>; Mon, 07 Oct 2024 04:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728301103; x=1728905903;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9d5KMMUhKni7tOCuEqU/4/ASXWj9H4VnvjRLnbX4CA=;
        b=dBbmPUBhjbSX7Odayu4Rt/NzYErDJouiORDsbPUCZkGNF2o3AXGVCYCGVabtVCFNjM
         3Q7g3LnSqJ0kOAjNw3Wz0A1K/lxXeVrMtNqDMSfZjKeE3U5bzqetCFZvmlF6JFJ51aMF
         flxOv1QKWAQKyORAtcC8hkrQ2d4M6oVR2uiB70L3ebFfabk/pdINa7YwjbyeA9Wb2kH8
         LGnqe0IbUKUh1nI83xP+/hFSsz1NU0u3QcUbGV/2ENWTTFJeCP2lzZpsJ53mHrSMoHlm
         lEL3IutqAasGE6VpXxNZsOgTa1Q+BmmYjtKIwJf/nIW9YcqUJz8G61wTHo6Au/FPhXgw
         I4sw==
X-Forwarded-Encrypted: i=1; AJvYcCUFWrUK8xF9LjBVeYGpK1lHZpv9W4oxNeU5xon688/dVKH/qawj/Ho/zVmkAp4szD8eE/pxLX4wJkvhLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmxK1FtJMJdRIEMYga/hbUT4AEyCoZWl3Z0N6bZiGJSbHMOQWl
	cokMF8uo+BwLij7b7o/g6LyfX0oWSSH2mg9e7dVY9EBomhIXJIMaDMDepkWguQbQ1La3ansN81m
	akafc6qO3o9lOwTHtRHjNbQnqA6gJLeaBMhlv0Wc5Rftv2Ym97Zndkfo=
X-Google-Smtp-Source: AGHT+IEMJplOp08+4xxaO/o5hSMvvS+acowDJhHM0emIkPG+KvnzU/hZI2zJJ6zNZ8baT+tsmaqCTjkSjHm6le7q4jm2T0/u7rV8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda7:0:b0:39d:3c87:1435 with SMTP id
 e9e14a558f8ab-3a36e20faddmr93931585ab.1.1728301103113; Mon, 07 Oct 2024
 04:38:23 -0700 (PDT)
Date: Mon, 07 Oct 2024 04:38:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6703c82f.050a0220.49194.0506.GAE@google.com>
Subject: [syzbot] [kernfs?] [input?] [usb?] INFO: rcu detected stall in statfs (3)
From: syzbot <syzbot+32474671840968fd1101@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9852d85ec9d4 Linux 6.12-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1321d927980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=32474671840968fd1101
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=149053d0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d44acbbed8bd/disk-9852d85e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8e54c80139e6/vmlinux-9852d85e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/35f22e8643ee/bzImage-9852d85e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+32474671840968fd1101@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
 0-...D
 } 2653 jiffies s: 985 root: 0x1/.
rcu: blocking rcu_node structures (internal RCU debug):
Sending NMI from CPU 1 to CPUs 0:
 might_resched include/linux/kernel.h:73 [inline]
 down_write+0x74/0x200 kernel/locking/rwsem.c:1576
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 6610 Comm: modprobe Not tainted 6.12.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:check_kcov_mode kernel/kcov.c:183 [inline]
RIP: 0010:write_comp_data+0x38/0x90 kernel/kcov.c:246
Code: de ad 7e 65 8b 05 50 de ad 7e a9 00 01 ff 00 74 1d f6 c4 01 74 67 a9 00 00 0f 00 75 60 a9 00 00 f0 00 75 59 8b 82 54 15 00 00 <85> c0 74 4f 8b 82 30 15 00 00 83 f8 03 75 44 48 8b 82 38 15 00 00
RSP: 0018:ffffc90000006ca0 EFLAGS: 00000046
RAX: 0000000000000000 RBX: ffffffff8728c700 RCX: ffffffff86e66c5f
RDX: ffff88811e8557c0 RSI: 0000000000000000 RDI: 0000000000000001
RBP: 000000000000005b R08: 0000000000000001 R09: 0000000000000000
R10: 000000000000005b R11: 000000000009e1e0 R12: ffffc90000006da8
R13: ffffffff8728c700 R14: ffffc90000006e40 R15: ffffc90000007008
FS:  00007f277e6dd380(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f277e74e723 CR3: 0000000118262000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 format_decode+0x13f/0xba0 lib/vsprintf.c:2537
 vsnprintf+0x13d/0x1880 lib/vsprintf.c:2755
 sprintf+0xcd/0x110 lib/vsprintf.c:3007
 print_time kernel/printk/printk.c:1362 [inline]
 info_print_prefix+0x25c/0x350 kernel/printk/printk.c:1388
 record_print_text+0x141/0x400 kernel/printk/printk.c:1437
 printk_get_next_message+0x2a6/0x670 kernel/printk/printk.c:2978
 console_emit_next_record kernel/printk/printk.c:3046 [inline]
 console_flush_all+0x6ec/0xc60 kernel/printk/printk.c:3180
 __console_flush_and_unlock kernel/printk/printk.c:3239 [inline]
 console_unlock+0xd9/0x210 kernel/printk/printk.c:3279
 vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2407
 vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:68
 _printk+0xc8/0x100 kernel/printk/printk.c:2432
 printk_stack_address arch/x86/kernel/dumpstack.c:72 [inline]
 show_trace_log_lvl+0x1b7/0x3d0 arch/x86/kernel/dumpstack.c:285
 sched_show_task kernel/sched/core.c:7582 [inline]
 sched_show_task+0x3f0/0x5f0 kernel/sched/core.c:7557
 show_state_filter+0xee/0x320 kernel/sched/core.c:7627
 k_spec drivers/tty/vt/keyboard.c:667 [inline]
 k_spec+0xed/0x150 drivers/tty/vt/keyboard.c:656
 kbd_keycode drivers/tty/vt/keyboard.c:1522 [inline]
 kbd_event+0xcbd/0x17a0 drivers/tty/vt/keyboard.c:1541
 input_handler_events_default+0x116/0x1b0 drivers/input/input.c:2549
 input_pass_values+0x777/0x8e0 drivers/input/input.c:126
 input_event_dispose drivers/input/input.c:341 [inline]
 input_handle_event+0xf0b/0x14d0 drivers/input/input.c:369
 input_event drivers/input/input.c:398 [inline]
 input_event+0x83/0xa0 drivers/input/input.c:390
 input_sync include/linux/input.h:451 [inline]
 hidinput_report_event+0xb2/0x100 drivers/hid/hid-input.c:1736
 hid_report_raw_event+0x274/0x11c0 drivers/hid/hid-core.c:2047
 __hid_input_report.constprop.0+0x341/0x440 drivers/hid/hid-core.c:2110
 hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
 __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x17c3/0x38d0 drivers/usb/gadget/udc/dummy_hcd.c:1988
 __run_hrtimer kernel/time/hrtimer.c:1691 [inline]
 __hrtimer_run_queues+0x20a/0xae0 kernel/time/hrtimer.c:1755
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1772
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0xac/0x110 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1037 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1037
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_is_held_type+0x107/0x150 kernel/locking/lockdep.c:5902
Code: 00 00 b8 ff ff ff ff 65 0f c1 05 6c 1b 14 79 83 f8 01 75 2d 9c 58 f6 c4 02 75 43 48 f7 04 24 00 02 00 00 74 01 fb 48 83 c4 08 <44> 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 45 31 ed eb
RSP: 0018:ffffc9000245f920 EFLAGS: 00000292
RAX: 0000000000000046 RBX: 1ffff9200048bf2d RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff8727f4a0 RDI: ffffffff8746ea80
RBP: ffffffff88ebb040 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88811e8557c0
R13: 0000000000000000 R14: 00000000ffffffff R15: 0000000000000000
 lock_is_held include/linux/lockdep.h:249 [inline]
 __might_resched+0x4ca/0x5e0 kernel/sched/core.c:8593
 down_read+0x73/0x330 kernel/locking/rwsem.c:1523
 kernfs_dop_revalidate+0xf0/0x5a0 fs/kernfs/dir.c:1159
 d_revalidate fs/namei.c:868 [inline]
 d_revalidate fs/namei.c:865 [inline]
 lookup_fast+0x239/0x540 fs/namei.c:1693
 walk_component+0x5b/0x5b0 fs/namei.c:2049
 lookup_last fs/namei.c:2556 [inline]
 path_lookupat+0x17f/0x770 fs/namei.c:2580
 filename_lookup+0x1e5/0x5b0 fs/namei.c:2609
 user_path_at+0x3a/0x60 fs/namei.c:3016
 user_statfs+0xa0/0x180 fs/statfs.c:103
 __do_sys_statfs+0x8a/0x100 fs/statfs.c:195
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f277e83168a
Code: c8 ff c3 b8 03 01 00 00 0f 05 48 3d 00 f0 ff ff 76 10 48 8b 15 8f a7 0d 00 f7 d8 64 89 02 48 83 c8 ff c3 b8 89 00 00 00 0f 05 <48> 3d 00 f0 ff ff 76 10 48 8b 15 6f a7 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007ffe6722d7f8 EFLAGS: 00000206 ORIG_RAX: 0000000000000089
RAX: ffffffffffffffda RBX: 00007f277e7564f8 RCX: 00007f277e83168a
RDX: 00007f277e75819c RSI: 00007ffe6722d808 RDI: 00007f277e74e723
RBP: 00007ffe6722d8a0 R08: 0000000000000000 R09: 000000000000000d
R10: 00007ffe6722d6c0 R11: 0000000000000206 R12: 00007ffe6722d808
R13: 00007ffe6722da88 R14: 00007ffe6722dab0 R15: 0000000000000000
 </TASK>
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:7801  tgid:7801  ppid:61     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7832  tgid:7832  ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7840  tgid:7840  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7842  tgid:7842  ppid:1321   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1036874a90
RSP: 002b:00007fff4bbd08d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f1036965860 RCX: 00007f1036874a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f1036965860 R08: 0000000000000000 R09: 2ba13118c6e30511
R10: 00007fff4bbd0790 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f1036969658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7848  tgid:7848  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7852  tgid:7852  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f27413a1a90
RSP: 002b:00007ffec33b8048 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f2741492860 RCX: 00007f27413a1a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f2741492860 R08: 0000000000000000 R09: 579af85e23a91b0e
R10: 00007ffec33b7f00 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f2741496658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:7859  tgid:7859  ppid:1321   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7867  tgid:7867  ppid:1321   flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff1b3f8ea90
RSP: 002b:00007fff0e60a418 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ff1b407f860 RCX: 00007ff1b3f8ea90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007ff1b407f860 R08: 0000000000000000 R09: 297f637b2cc12a19
R10: 00007fff0e60a2d0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ff1b4083658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7872  tgid:7872  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7876  tgid:7876  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6854
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7192
 might_resched include/linux/kernel.h:73 [inline]
 down_write+0x74/0x200 kernel/locking/rwsem.c:1576
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7881  tgid:7881  ppid:240    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff691c95a90
RSP: 002b:00007fff8cc863a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ff691d86860 RCX: 00007ff691c95a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007ff691d86860 R08: 0000000000000000 R09: 130b41a16503932e
R10: 00007fff8cc86260 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ff691d8a658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:7888  tgid:7888  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7895  tgid:7895  ppid:1321   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2ba3ab8a90
RSP: 002b:00007ffc593e6a08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f2ba3ba9860 RCX: 00007f2ba3ab8a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f2ba3ba9860 R08: 0000000000000000 R09: fbded4c6bbb14cc7
R10: 00007ffc593e68c0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f2ba3bad658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:7903  tgid:7903  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8f27fcca90
RSP: 002b:00007ffe5b255318 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f8f280bd860 RCX: 00007f8f27fcca90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f8f280bd860 R08: 0000000000000000 R09: f656a58ceb9b82a7
R10: 00007ffe5b2551d0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f8f280c1658 R15: 0000000000000001
 </TASK>
task:kworker/u8:5    state:R  running task     stack:32568 pid:7910  tgid:7910  ppid:240    flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:7912  tgid:7912  ppid:1321   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f91a8658a90
RSP: 002b:00007ffcdd011f18 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f91a8749860 RCX: 00007f91a8658a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f91a8749860 R08: 0000000000000000 R09: a714542541fce60e
R10: 00007ffcdd011dd0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f91a874d658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:7918  tgid:7918  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f502d1b8a90
RSP: 002b:00007ffe5111b178 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f502d2a9860 RCX: 00007f502d1b8a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f502d2a9860 R08: 0000000000000000 R09: 82d1dac90bc4340b
R10: 00007ffe5111b030 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f502d2ad658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7924  tgid:7924  ppid:240    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe66ee6aa90
RSP: 002b:00007ffe8fef5648 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fe66ef5b860 RCX: 00007fe66ee6aa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fe66ef5b860 R08: 0000000000000000 R09: c069033a8e2cd71f
R10: 00007ffe8fef5500 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fe66ef5f658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7929  tgid:7929  ppid:240    flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7939  tgid:7939  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:kworker/u8:5    state:R  running task     stack:28784 pid:7947  tgid:7947  ppid:240    flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:7952  tgid:7952  ppid:1321   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff367205a90
RSP: 002b:00007ffd24373458 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ff3672f6860 RCX: 00007ff367205a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007ff3672f6860 R08: 0000000000000000 R09: 8af58dd86e5fa3f2
R10: 00007ffd24373310 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ff3672fa658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7959  tgid:7959  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ffb5d1c1a90
RSP: 002b:00007ffca3b54828 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ffb5d2b2860 RCX: 00007ffb5d1c1a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007ffb5d2b2860 R08: 0000000000000000 R09: 2b7bc42f1f3fa7d8
R10: 00007ffca3b546e0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ffb5d2b6658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7966  tgid:7966  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:7967  tgid:7967  ppid:1321   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc915d29a90
RSP: 002b:00007ffe1f52fba8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fc915e1a860 RCX: 00007fc915d29a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fc915e1a860 R08: 0000000000000000 R09: 9020cdfac2fe8494
R10: 00007ffe1f52fa60 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fc915e1e658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7976  tgid:7976  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:7977  tgid:7977  ppid:61     flags:0x00004000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:23984 pid:7981  tgid:7981  ppid:1321   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6854
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7985  tgid:7985  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f611b70ca90
RSP: 002b:00007fff370431d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f611b7fd860 RCX: 00007f611b70ca90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f611b7fd860 R08: 0000000000000000 R09: c8dbcaff71132372
R10: 00007fff37043090 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f611b801658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:23984 pid:7991  tgid:7991  ppid:794    flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:kworker/u8:6    state:R  running task     stack:28784 pid:8005  tgid:8005  ppid:794    flags:0x00004000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:27168 pid:8009  tgid:8009  ppid:46     flags:0x00004000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:8023  tgid:8023  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f73ea212a90
RSP: 002b:00007fff78a8e658 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f73ea303860 RCX: 00007f73ea212a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f73ea303860 R08: 0000000000000000 R09: 18675c1ea5947e0c
R10: 00007fff78a8e510 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f73ea307658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25344 pid:8028  tgid:8028  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 rcu_is_watching_curr_cpu include/linux/context_tracking.h:128 [inline]
 rcu_is_watching+0x12/0xc0 kernel/rcu/tree.c:737
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:8036  tgid:8036  ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:8044  tgid:8044  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:8053  tgid:8053  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:8058  tgid:8058  ppid:61     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:8060  tgid:8060  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f699e03ea90
RSP: 002b:00007ffdaacc9b28 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f699e12f860 RCX: 00007f699e03ea90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f699e12f860 R08: 0000000000000000 R09: 847f2e504d5feb14
R10: 00007ffdaacc99e0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f699e133658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:8067  tgid:8067  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:8074  tgid:8074  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:8084  tgid:8084  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:8095  tgid:8095  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f04263cfa90
RSP: 002b:00007fff37ed15d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f04264c0860 RCX: 00007f04263cfa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f04264c0860 R08: 0000000000000000 R09: 37318c01a1a66803
R10: 00007fff37ed1490 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f04264c4658 R15: 0000000000000001
 </TASK>
task:kworker/u8:3    state:R  running task     stack:32568 pid:8102  tgid:8102  ppid:46     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:8104  tgid:8104  ppid:240    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9dded62a90
RSP: 002b:00007ffed3a7d1c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f9ddee53860 RCX: 00007f9dded62a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f9ddee53860 R08: 0000000000000000 R09: 31b450b9a2371b71
R10: 00007ffed3a7d080 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f9ddee57658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:8109  tgid:8109  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1e3f9a5a90
RSP: 002b:00007fff60a3d1a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f1e3fa96860 RCX: 00007f1e3f9a5a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f1e3fa96860 R08: 0000000000000000 R09: a41e3c210abed042
R10: 00007fff60a3d060 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f1e3fa9a658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:8116  tgid:8116  ppid:240    flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f225973da90
RSP: 002b:00007ffe39419598 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f225982e860 RCX: 00007f225973da90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f225982e860 R08: 0000000000000000 R09: 09cb7ffa7489453d
R10: 00007ffe39419450 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f2259832658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:8123  tgid:8123  ppid:1321   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:8133  tgid:8133  ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7efc02680a90
RSP: 002b:00007ffdf13beef8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007efc02771860 RCX: 00007efc02680a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007efc02771860 R08: 0000000000000000 R09: 051b21e884c43509
R10: 00007ffdf13bedb0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007efc02775658 R15: 0000000000000001
 </TASK>
task:kworker/u8:5    state:R  running task     stack:28784 pid:8139  tgid:8139  ppid:240    flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:8146  tgid:8146  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25344 pid:8152  tgid:8152  ppid:240    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:kworker/u8:6    state:R  running task     stack:32568 pid:8160  tgid:8160  ppid:794    flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:8161  tgid:8161  ppid:240    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:kworker/u8:5    state:R  running task     stack:32568 pid:8166  tgid:8166  ppid:240    flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:syz-executor    state:S stack:25568 pid:8172  tgid:8172  ppid:2654   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 do_wait+0x1dd/0x570 kernel/exit.c:1697
 kernel_wait4+0x16c/0x280 kernel/exit.c:1851
 __do_sys_wait4+0x15f/0x170 kernel/exit.c:1879
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0cf8d74213
RSP: 002b:00007ffde1a21988 EFLAGS: 00000202 ORIG_RAX: 000000000000003d
RAX: ffffffffffffffda RBX: 0000000000001fef RCX: 00007f0cf8d74213
RDX: 0000000040000000 RSI: 00007ffde1a2199c RDI: 00000000ffffffff
RBP: 00007ffde1a2199c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffde1a21a20
R13: 00007ffde1a21a28 R14: 0000000000000009 R15: 0000000000000000
 </TASK>
task:syz-executor    state:D stack:28112 pid:8175  tgid:8175  ppid:8172   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_timeout+0x258/0x2a0 kernel/time/timer.c:2591
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x3e1/0x600 kernel/sched/completion.c:116
 wait_for_common kernel/sched/completion.c:127 [inline]
 wait_for_completion_state+0x1c/0x40 kernel/sched/completion.c:264
 call_usermodehelper_exec+0x3c4/0x4d0 kernel/umh.c:442
 call_modprobe kernel/module/kmod.c:103 [inline]
 __request_module+0x3f6/0x6c0 kernel/module/kmod.c:173
 dev_load+0x221/0x240 net/core/dev_ioctl.c:643
 dev_ioctl+0x473/0x10c0 net/core/dev_ioctl.c:709
 sock_do_ioctl+0x19e/0x280 net/socket.c:1241
 sock_ioctl+0x228/0x6c0 net/socket.c:1346
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18f/0x220 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0cf8d7dbfb
RSP: 002b:00007ffde1a21710 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007f0cf8d7dbfb
RDX: 00007ffde1a21770 RSI: 0000000000008933 RDI: 0000000000000005
RBP: 00007ffde1a21770 R08: 000000000000000a R09: 0000000000000004
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffde1a217fc
R13: 00007ffde1a21880 R14: 00007ffde1a21870 R15: 0000000000000003
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:8195  tgid:8195  ppid:61     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:8200  tgid:8200  ppid:794    flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ffb8c1f4a90
RSP: 002b:00007ffc09e452b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ffb8c2e5860 RCX: 00007ffb8c1f4a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007ffb8c2e5860 R08: 0000000000000000 R09: 2decbd0e34dbaef1
R10: 00007ffc09e45170 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ffb8c2e9658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:27168 pid:8206  tgid:8206  ppid:794    flags:0x00000000
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


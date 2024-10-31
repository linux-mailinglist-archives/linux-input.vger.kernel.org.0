Return-Path: <linux-input+bounces-7807-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC09B7F92
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 17:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03A9D282066
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 16:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107A6199FB8;
	Thu, 31 Oct 2024 16:03:31 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3F137905
	for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730390610; cv=none; b=dSKVP/j8xc7y+v1S8EDxU4AhX8DjSqutthmwsRj0JLasnbmC9aUXjTS6XToFQjblYcNUXVCuFucVQBMdYPR3X/RHLlbPaZ2rf4M/wYuY6qLmFrYy7mbpalrc9pShSUFCwOre3t+6oMmKnQCM/aM1ygaOhPbZ/b9tdw7csaWTRY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730390610; c=relaxed/simple;
	bh=YSrv74QK+pqXazfmz16kIr0iHEjJOSz5Mb+gYoJaqwc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AjGbK73ZOHAYIXEJP5N16fnqHrqI26whamQXFVP4lFvwXFEd8rceY/TBlPVApEgj7J1113Em4TBBmhyBiInpmaf4gMvboPImjLm/Ykf+QccQ1CUHkcRIRVZjX3UIAV/Y20hzT2yIyNic65yVZzlispHEstpWM98RFCBLnOZL3Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a3a6afd01eso9710085ab.3
        for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 09:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730390605; x=1730995405;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GsiQ4pVBYoFfkxKOK+wCSMhO8DzCMj0T2d3kUXcRRwg=;
        b=d7hwFpD+pRSJ9ZWDBAcKPQXcYL+OHhC3A9QP4qw8H0bO19uMlKb3XQKmhjOQtyo5KD
         GRaW9VaHhOiQhOqGKw2Rovo0PLkYGoeRAUCk5NzlVm6njTabqzcaHL6PO5dSpcP0w+Vc
         r3Ac6cUq0cXGwfQBgYJGdwnXjDLtlA+vMTyJD0Q8j5IeMbvdriCo8xexNMfWMjvRgNfw
         dI17SB+jcYFXJLDZeJU3DoK9TxpHT3MWFH0rLa8wZkqjLPxQ864+jZp9kQLvdo6oMKfW
         OXsMcQsud2zPEFpAlqTF6s9SoezlJ8UclADa2smQ8nWgJs7WDo0Y/Uxhauw3CXGheJgC
         mN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIrN0o6/dXqQOyQa0GLztCopXRvf73LflHfWSLQN+aqMe4d6tAWdisQUTdlsLZ3dWt6sjwmM5K50rf0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwImI+Eh8/kgCoEvaMXLhJuVyDlGenEtJFdahPMhl9IpJnHJrR3
	lxh7rdIL7o/7ylr+W+9PmHJDnQavnVhAkI3zgiZVcxtpkMWXwy/fGU8O0RG3FmRKMGSHM1dGpgv
	AgCrXIV7lNwJzZq/FaGjJaeFiJoIugLvXSi3yxfIU/zBkbi7zn4NwI54=
X-Google-Smtp-Source: AGHT+IGbWMGcLqnGSi9IwdYRtXEqtKKLkZaQt1LpCMg+xW/cXRbwA6HTo08sV4Bj5GrDv+Y2KY2VnJS6QrlLlzsKEJJxoEmR2O/Z
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca4f:0:b0:3a6:ac17:13d5 with SMTP id
 e9e14a558f8ab-3a6ac1717c6mr19541515ab.11.1730390605271; Thu, 31 Oct 2024
 09:03:25 -0700 (PDT)
Date: Thu, 31 Oct 2024 09:03:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6723aa4d.050a0220.35b515.0161.GAE@google.com>
Subject: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in brk (2)
From: syzbot <syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c6d9e43954bf Merge 6.12-rc4 into usb-next
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=175cbe5f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5aceb1f10131390c
dashboard link: https://syzkaller.appspot.com/bug?extid=7402e6c8042635c93ead
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17b3cca7980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fe53e83da4bf/disk-c6d9e439.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a9135a278859/vmlinux-c6d9e439.xz
kernel image: https://storage.googleapis.com/syzbot-assets/72fb7499fd06/bzImage-c6d9e439.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
 1-...D } 2636 jiffies s: 1593 root: 0x2/.
rcu: blocking rcu_node structures (internal RCU debug):

Sending NMI from CPU 0 to CPUs 1:
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 10933 Comm: modprobe Not tainted 6.12.0-rc4-syzkaller-00052-gc6d9e43954bf #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:io_serial_in+0x87/0xb0 drivers/tty/serial/8250/8250_port.c:407
Code: 68 b5 fe 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1a 66 03 5d 40 89 da ec <5b> 0f b6 c0 5d 41 5c c3 cc cc cc cc e8 78 ef 0d ff eb a2 e8 01 f0
RSP: 0018:ffffc900001b80a8 EFLAGS: 00000002
RAX: dffffc0000000060 RBX: 00000000000003fd RCX: 0000000000000000
RDX: 00000000000003fd RSI: ffffffff82a08a30 RDI: ffffffff93637660
RBP: ffffffff93637620 R08: 0000000000000001 R09: 000000000000001f
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000020 R14: fffffbfff26c6f1e R15: dffffc0000000000
FS:  00007f1b331b7380(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1b3323219c CR3: 0000000119252000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 serial_in drivers/tty/serial/8250/8250.h:137 [inline]
 serial_lsr_in drivers/tty/serial/8250/8250.h:159 [inline]
 wait_for_lsr+0xda/0x180 drivers/tty/serial/8250/8250_port.c:2068
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3315 [inline]
 serial8250_console_write+0xf5a/0x17c0 drivers/tty/serial/8250/8250_port.c:3393
 console_emit_next_record kernel/printk/printk.c:3092 [inline]
 console_flush_all+0x800/0xc60 kernel/printk/printk.c:3180
 __console_flush_and_unlock kernel/printk/printk.c:3239 [inline]
 console_unlock+0xd9/0x210 kernel/printk/printk.c:3279
 vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2407
 vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:68
 _printk+0xc8/0x100 kernel/printk/printk.c:2432
 printk_stack_address arch/x86/kernel/dumpstack.c:72 [inline]
 show_trace_log_lvl+0x21f/0x3d0 arch/x86/kernel/dumpstack.c:285
 sched_show_task kernel/sched/core.c:7604 [inline]
 sched_show_task+0x3f0/0x5f0 kernel/sched/core.c:7579
 show_state_filter+0xee/0x320 kernel/sched/core.c:7649
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
 dummy_timer+0x17f0/0x3930 drivers/usb/gadget/udc/dummy_hcd.c:1993
 __run_hrtimer kernel/time/hrtimer.c:1691 [inline]
 __hrtimer_run_queues+0x20a/0xae0 kernel/time/hrtimer.c:1755
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1772
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0xac/0x110 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__sanitizer_cov_trace_pc+0x66/0x70 kernel/kcov.c:235
Code: 82 30 15 00 00 83 f8 02 75 20 48 8b 8a 38 15 00 00 8b 92 34 15 00 00 48 8b 01 48 83 c0 01 48 39 d0 73 07 48 89 01 48 89 34 c1 <c3> cc cc cc cc 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90002dc7a50 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 0000000000000001 RCX: dffffc0000000000
RDX: ffff88810fed9d40 RSI: ffffffff86e3ce73 RDI: 0000000000000005
RBP: ffff888124e21e00 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff88811972fe00
R13: ffffc90002dc7b88 R14: ffff88811ad2a540 R15: ffffc90002dc7bc5
 mas_next_slot+0x12d3/0x21b0 lib/maple_tree.c:4693
 mas_find+0x2c6/0x530 lib/maple_tree.c:6059
 vma_next include/linux/mm.h:1007 [inline]
 validate_mm+0xeb/0x4d0 mm/vma.c:535
 do_brk_flags+0x943/0x1260 mm/mmap.c:1781
 __do_sys_brk+0x68e/0xa20 mm/mmap.c:197
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1b3330fc7c
Code: 1a 64 c7 03 01 00 00 00 eb 11 64 44 89 23 31 f6 5b 31 ff 5d 41 5c e9 41 ff ff ff 5b 83 c8 ff 5d 41 5c c3 b8 0c 00 00 00 0f 05 <48> 8b 15 d5 61 0d 00 45 31 c0 48 89 02 48 39 c7 76 12 48 8b 05 73
RSP: 002b:00007ffd9efad018 EFLAGS: 00000206 ORIG_RAX: 000000000000000c
RAX: ffffffffffffffda RBX: 0000000000021000 RCX: 00007f1b3330fc7c
RDX: 00007f1b333ee1b8 RSI: 00007f1b333e6b00 RDI: 00005562a3991000
RBP: 00007f1b333e6aa0 R08: 0000000000000000 R09: 00007f1b333e6d80
R10: 0000000000000037 R11: 0000000000000206 R12: 00005562a3970000
R13: 0000000000000290 R14: 0000000000001000 R15: 0000000000000000
 </TASK>
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2087884a90
RSP: 002b:00007ffe718808c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f2087975860 RCX: 00007f2087884a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f2087975860 R08: 0000000000000001 R09: eb9e03d0b6065ae7
R10: 00007ffe71880780 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f2087979658 R15: 0000000000000001
 </TASK>
task:kworker/u8:3    state:R  running task     stack:32568 pid:11825 tgid:11825 ppid:3004   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:11826 tgid:11826 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11828 tgid:11828 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:11832 tgid:11832 ppid:3551   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11834 tgid:11834 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:11836 tgid:11836 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25344 pid:11837 tgid:11837 ppid:3004   flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f596b783a90
RSP: 002b:00007ffdaec1f738 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f596b874860 RCX: 00007f596b783a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f596b874860 R08: 0000000000000001 R09: d427ab9054769841
R10: 00007ffdaec1f5f0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f596b878658 R15: 0000000000000001
 </TASK>
task:kworker/u8:3    state:R  running task     stack:28656 pid:11839 tgid:11839 ppid:3004   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6869
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7214
 _cond_resched include/linux/sched.h:2031 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11843 tgid:11843 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:kworker/u8:6    state:R  running task     stack:32568 pid:11845 tgid:11845 ppid:1106   flags:0x00004000
Call Trace:
 <TASK>
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:11846 tgid:11846 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f62ec5faa90
RSP: 002b:00007ffc77d2c6e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f62ec6eb860 RCX: 00007f62ec5faa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f62ec6eb860 R08: 0000000000000001 R09: 73127a7182c281c0
R10: 00007ffc77d2c5a0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f62ec6ef658 R15: 0000000000000001
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:11849 tgid:11849 ppid:3551   flags:0x00004000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11858 tgid:11858 ppid:2989   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:11860 tgid:11860 ppid:3551   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11864 tgid:11864 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:11865 tgid:11865 ppid:2989   flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe85a408a90
RSP: 002b:00007ffe6d728978 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fe85a4f9860 RCX: 00007fe85a408a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fe85a4f9860 R08: 0000000000000001 R09: 0d6f8889d938ef07
R10: 00007ffe6d728830 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fe85a4fd658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24000 pid:11870 tgid:11870 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:11874 tgid:11874 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9ab6225a90
RSP: 002b:00007ffd2d084458 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f9ab6316860 RCX: 00007f9ab6225a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f9ab6316860 R08: 0000000000000001 R09: 213f27e3772f6406
R10: 00007ffd2d084310 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f9ab631a658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24000 pid:11879 tgid:11879 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 __pfx_lock_release+0x10/0x10 kernel/locking/lockdep.c:5346
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:11882 tgid:11882 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd1e055da90
RSP: 002b:00007ffc2fdba8d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fd1e064e860 RCX: 00007fd1e055da90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fd1e064e860 R08: 0000000000000001 R09: 44bb0356e4044352
R10: 00007ffc2fdba790 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fd1e0652658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11888 tgid:11888 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:11890 tgid:11890 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fed39e3ca90
RSP: 002b:00007ffcaabe57b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fed39f2d860 RCX: 00007fed39e3ca90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fed39f2d860 R08: 0000000000000001 R09: 751a872febfbe0c2
R10: 00007ffcaabe5670 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fed39f31658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11896 tgid:11896 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11905 tgid:11905 ppid:3004   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:11908 tgid:11908 ppid:3004   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:11909 tgid:11909 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f91c01d1a90
RSP: 002b:00007fff59a721a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f91c02c2860 RCX: 00007f91c01d1a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f91c02c2860 R08: 0000000000000001 R09: 174dcf661f33f894
R10: 00007fff59a72060 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f91c02c6658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11915 tgid:11915 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11918 tgid:11918 ppid:3551   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:11920 tgid:11920 ppid:3004   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f22572aea90
RSP: 002b:00007fff9570b928 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f225739f860 RCX: 00007f22572aea90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f225739f860 R08: 0000000000000001 R09: 1d598a15939cff95
R10: 00007fff9570b7e0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f22573a3658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:11924 tgid:11924 ppid:3551   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:11929 tgid:11929 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11933 tgid:11933 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0644958a90
RSP: 002b:00007fff8866c018 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f0644a49860 RCX: 00007f0644958a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f0644a49860 R08: 0000000000000001 R09: 6c69b7350d6b595d
R10: 00007fff8866bed0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f0644a4d658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11939 tgid:11939 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11951 tgid:11951 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24000 pid:11959 tgid:11959 ppid:3551   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11963 tgid:11963 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f58d02e0a90
RSP: 002b:00007ffc6626d778 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f58d03d1860 RCX: 00007f58d02e0a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f58d03d1860 R08: 0000000000000001 R09: 7e2759f2076a714e
R10: 00007ffc6626d630 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f58d03d5658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11967 tgid:11967 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1d0649da90
RSP: 002b:00007ffd773ed488 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f1d0658e860 RCX: 00007f1d0649da90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f1d0658e860 R08: 0000000000000001 R09: dbfdc4bed4c4ff8f
R10: 00007ffd773ed340 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f1d06592658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:11973 tgid:11973 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11976 tgid:11976 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:11984 tgid:11984 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1385ec8a90
RSP: 002b:00007ffcf976a3e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f1385fb9860 RCX: 00007f1385ec8a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f1385fb9860 R08: 0000000000000001 R09: fd48b3f27557a6a1
R10: 00007ffcf976a2a0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f1385fbd658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:11990 tgid:11990 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25344 pid:12000 tgid:12000 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f622c1a5a90
RSP: 002b:00007ffc7eb2d618 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f622c296860 RCX: 00007f622c1a5a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f622c296860 R08: 0000000000000001 R09: fb6da14796518947
R10: 00007ffc7eb2d4d0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f622c29a658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:12005 tgid:12005 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12008 tgid:12008 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12010 tgid:12010 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd9cbf9aa90
RSP: 002b:00007ffddace9658 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fd9cc08b860 RCX: 00007fd9cbf9aa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fd9cc08b860 R08: 0000000000000001 R09: 742256a4a252f6b4
R10: 00007ffddace9510 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fd9cc08f658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:12015 tgid:12015 ppid:2989   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 __pfx_lock_release+0x10/0x10 kernel/locking/lockdep.c:5346
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:12018 tgid:12018 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4008cfda90
RSP: 002b:00007fffd5753b88 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f4008dee860 RCX: 00007f4008cfda90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f4008dee860 R08: 0000000000000001 R09: 57a0791dac7bd80f
R10: 00007fffd5753a40 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f4008df2658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:12023 tgid:12023 ppid:2989   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12029 tgid:12029 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24000 pid:12037 tgid:12037 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3539f25a90
RSP: 002b:00007ffdd9a78498 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f353a016860 RCX: 00007f3539f25a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f353a016860 R08: 0000000000000001 R09: 517fac0adb2b96eb
R10: 00007ffdd9a78350 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f353a01a658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:12042 tgid:12042 ppid:3004   flags:0x00000002
Call Trace:
 <TASK>
 prep_new_page mm/page_alloc.c:1545 [inline]
 get_page_from_freelist+0xd5c/0x2630 mm/page_alloc.c:3457
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12049 tgid:12049 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12060 tgid:12060 ppid:2989   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1c22cefa90
RSP: 002b:00007fff7a4ca7f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f1c22de0860 RCX: 00007f1c22cefa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f1c22de0860 R08: 0000000000000001 R09: a9976d4a22f06c8e
R10: 00007fff7a4ca6b0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f1c22de4658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:12065 tgid:12065 ppid:3551   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f40d09ada90
RSP: 002b:00007ffe44700508 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f40d0a9e860 RCX: 00007f40d09ada90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f40d0a9e860 R08: 0000000000000001 R09: f1aa9b16a9cef104
R10: 00007ffe447003c0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f40d0aa2658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12070 tgid:12070 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:12076 tgid:12076 ppid:1106   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 __pfx_lock_release+0x10/0x10 kernel/locking/lockdep.c:5346
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12079 tgid:12079 ppid:1106   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12084 tgid:12084 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 prepare_lock_switch kernel/sched/core.c:5066 [inline]
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x102c/0x34b0 kernel/sched/core.c:6690
 __pfx_lock_release+0x10/0x10 kernel/locking/lockdep.c:5346
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12087 tgid:12087 ppid:2989   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fedf6344a90
RSP: 002b:00007ffdd18ea6b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fedf6435860 RCX: 00007fedf6344a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fedf6435860 R08: 0000000000000001 R09: e0e65f21ab61f0e5
R10: 00007ffdd18ea570 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fedf6439658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12092 tgid:12092 ppid:3551   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:12098 tgid:12098 ppid:2989   flags:0x00000002
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


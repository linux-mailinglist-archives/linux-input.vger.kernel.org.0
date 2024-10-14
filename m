Return-Path: <linux-input+bounces-7392-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEAD99D8B7
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 23:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE52B1C21403
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 21:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479731D26F7;
	Mon, 14 Oct 2024 21:04:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E831D14F3
	for <linux-input@vger.kernel.org>; Mon, 14 Oct 2024 21:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728939862; cv=none; b=YEHGcR9XrSUqB7aXTEs8kEbG5CJ/0IrKcb2uH8r3DnouSLmLd3HlDkBIwAWhW9YracZlZ4HvHr/230eytHKf35HvjGbBEWx1GSO9WXE5x/kl/GoQPFgN/ur65Fa1muN7BnRv3VKGpv2l7W01Pttj8pDXHcDDiL0AE03CXM1lVnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728939862; c=relaxed/simple;
	bh=xA13InwbyzOZYmg4vwB5X4W2258du1K3Gr6EjB+iunA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ur9SQmuykc8Z0NRdZYASNE6tDbWwNEiycvAhZ1HXZk/5j3fk+rkVwDILYSeZ8C+Vu1xWxxeodzALe3u04qDVeSoYv9g4jvPT6pdxqrGIxFdCJOchDDWvUgkEoSFuwWbgs2vfzXf9OzWesJVVbKYnVCDOCHuhYMPNjoTammtGgGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3c24f3111so16303885ab.1
        for <linux-input@vger.kernel.org>; Mon, 14 Oct 2024 14:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728939858; x=1729544658;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTuStqAKtNINPmKhIH086lTeVbtmu0DplKUbQJRLhbE=;
        b=RMijh7/1Ee4b3mjMQy0RbQ2+YzYMRokFE00Kz5c/Xi4KUWSVEWovqASyvKUX8wUh4Z
         Nxc3rl3Vicz86vU/sZ5JHnfSfHcD4VyWjRBk9B0AW8nh3TzRi+38jWz2W52ySl3IXpdb
         miUBchOZNCD739Zp05uCzvtyzpNbqBE1P2X7n9AKNLlCsz/RtxWMfMJtJaDdAjW7h+Hy
         BxQTEAjfhZvOjXWiN0/N6fZb3KyaLx58s+nO0KMmsbjB+Lu2Pqc8amTqMNCidadxNOdp
         rSDiKwpKdGHiuicFvif4MStDfTuy+rPxNy+nGID4W0asf0hmVVuyQEOviBE0179lxphE
         yUfw==
X-Gm-Message-State: AOJu0Yz3blpzr12pkwZtaIZ4uNpGxkOZ7Q5A9xPvwtAjhlQdmnZbQ9/r
	BSzPxyNrKU7Qn1JV/QHF6mg4Ofx8GhlYTrW19U+XBIiqFgVbeskVEBB9B7gU6dyxShelbwPFYLK
	e73XlREeJNaUs2rf/1cg6duC8bUKvf4MLntULLnfbdTxRoQ3+yLNDBMw=
X-Google-Smtp-Source: AGHT+IHurmahiUrscpOGppQgJ8NCI1+CeyXbB9kexhrPP7BaXUNDY8X0G4kG/0gO7fTHS74P6Lxei7oH60TbCkpZto77xpuAhmAc
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:168e:b0:3a0:451b:ade3 with SMTP id
 e9e14a558f8ab-3a3b5f6b26bmr106327105ab.10.1728939858567; Mon, 14 Oct 2024
 14:04:18 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:04:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670d8752.050a0220.3798c8.012f.GAE@google.com>
Subject: [syzbot] [input?] [usb?] INFO: rcu detected stall in
 sys_rt_sigprocmask (2)
From: syzbot <syzbot+702ae87d7174a3a4d759@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, luto@kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4a9fe2a8ac53 dt-bindings: usb: dwc3-imx8mp: add compatible..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13f3805f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=702ae87d7174a3a4d759
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10542f07980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/883c5319cb52/disk-4a9fe2a8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/caf4421ed2ef/vmlinux-4a9fe2a8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d8e3beb01d49/bzImage-4a9fe2a8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+702ae87d7174a3a4d759@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
 1-...D } 2685 jiffies s: 1333 root: 0x2/.
rcu: blocking rcu_node structures (internal RCU debug):
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 2533 Comm: acpid Not tainted 6.12.0-rc1-syzkaller-00027-g4a9fe2a8ac53 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:io_serial_out+0x8f/0xb0 drivers/tty/serial/8250/8250_port.c:413
Code: 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1c 66 03 5d 40 44 89 e8 89 da ee <5b> 5d 41 5c 41 5d c3 cc cc cc cc e8 f1 eb 0d ff eb a0 e8 7a ec 0d
RSP: 0018:ffffc900001b80e8 EFLAGS: 00000006
RAX: 0000000000000000 RBX: 00000000000003f9 RCX: 0000000000000000
RDX: 00000000000003f9 RSI: ffffffff82a076c5 RDI: ffffffff936356a0
RBP: ffffffff93635660 R08: 0000000000000001 R09: 000000000000001f
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffffffff936356b0 R15: 000000000000001f
FS:  00007f7d8d393740(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbcf1d1d4b8 CR3: 00000001159ac000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 serial_out drivers/tty/serial/8250/8250.h:142 [inline]
 serial8250_clear_IER+0x9b/0xc0 drivers/tty/serial/8250/8250_port.c:699
 serial8250_console_write+0x243/0x17c0 drivers/tty/serial/8250/8250_port.c:3358
 console_emit_next_record kernel/printk/printk.c:3092 [inline]
 console_flush_all+0x800/0xc60 kernel/printk/printk.c:3180
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
RIP: 0010:__raw_spin_unlock_irq include/linux/spinlock_api_smp.h:160 [inline]
RIP: 0010:_raw_spin_unlock_irq+0x29/0x50 kernel/locking/spinlock.c:202
Code: 90 f3 0f 1e fa 53 48 8b 74 24 08 48 89 fb 48 83 c7 18 e8 8a 91 42 fa 48 89 df e8 a2 0e 43 fa e8 ed d0 6c fa fb bf 01 00 00 00 <e8> 62 51 37 fa 65 8b 05 23 0e 13 79 85 c0 74 06 5b c3 cc cc cc cc
RSP: 0018:ffffc900016dfdc8 EFLAGS: 00000206
RAX: 000000000000f47b RBX: ffff888115950940 RCX: 1ffffffff14ac111
RDX: 0000000000000000 RSI: ffffffff8727f1c0 RDI: 0000000000000001
RBP: ffff88811591ba80 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8a56418f R11: 0000000000000000 R12: 1ffff920002dbfbb
R13: 0000000000000000 R14: ffff88811591ba80 R15: dffffc0000000000
 spin_unlock_irq include/linux/spinlock.h:401 [inline]
 __set_current_blocked kernel/signal.c:3107 [inline]
 sigprocmask+0x230/0x330 kernel/signal.c:3141
 __do_sys_rt_sigprocmask kernel/signal.c:3218 [inline]
 __se_sys_rt_sigprocmask kernel/signal.c:3201 [inline]
 __x64_sys_rt_sigprocmask+0x1a6/0x290 kernel/signal.c:3201
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7d8d409773
Code: 00 f3 a5 48 8d 74 24 88 48 b9 ff ff ff 7f fe ff ff ff 48 21 c8 48 89 44 24 88 41 ba 08 00 00 00 44 89 c7 b8 0e 00 00 00 0f 05 <45> 31 c0 3d 00 f0 ff ff 76 06 41 89 c0 41 f7 d8 44 89 c0 5a c3 41
RSP: 002b:00007ffc81e982e0 EFLAGS: 00000246 ORIG_RAX: 000000000000000e
RAX: ffffffffffffffda RBX: 000055fc54c9c906 RCX: 00007f7d8d409773
RDX: 0000000000000000 RSI: 000055fc54ca2480 RDI: 0000000000000000
RBP: 0000000000000007 R08: 0000000000000000 R09: 0000000000000001
R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffc81e983e8
R13: 000055fc54c9c178 R14: 0000000000000001 R15: 000000000000000a
 </TASK>
 </TASK>
task:kworker/u8:0    state:R  running task     stack:28784 pid:9774  tgid:9774  ppid:11     flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9795  tgid:9795  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:9796  tgid:9796  ppid:37     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:kworker/u8:0    state:R  running task     stack:32568 pid:9802  tgid:9802  ppid:11     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:9807  tgid:9807  ppid:1325   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9811  tgid:9811  ppid:1325   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9817  tgid:9817  ppid:11     flags:0x00000002
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
RIP: 0033:0x7f955142fa90
RSP: 002b:00007ffea44d9828 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f9551520860 RCX: 00007f955142fa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f9551520860 R08: 0000000000000001 R09: 7bc75a20ba26ebb1
R10: 00007ffea44d96e0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f9551524658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:9822  tgid:9822  ppid:37     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9831  tgid:9831  ppid:37     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9832  tgid:9832  ppid:11     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9834  tgid:9834  ppid:37     flags:0x00000002
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
RIP: 0033:0x7ff6c0cc4a90
RSP: 002b:00007ffc5ea12c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ff6c0db5860 RCX: 00007ff6c0cc4a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007ff6c0db5860 R08: 0000000000000001 R09: 8129a6e5919db952
R10: 00007ffc5ea12b30 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ff6c0db9658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9840  tgid:9840  ppid:37     flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:Z  running task     stack:24704 pid:9841  tgid:9841  ppid:1325   flags:0x00000002
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
RIP: 0033:0x7f51094d4a90
RSP: 002b:00007ffd99d87b68 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f51095c5860 RCX: 00007f51094d4a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f51095c5860 R08: 0000000000000001 R09: 5945d8a9bcb3a755
R10: 00007ffd99d87a20 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f51095c9658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9846  tgid:9846  ppid:1325   flags:0x00000002
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
RIP: 0033:0x7fa62c104a90
RSP: 002b:00007ffc644b68c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fa62c1f5860 RCX: 00007fa62c104a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fa62c1f5860 R08: 0000000000000001 R09: 8f093f03e5abc1f1
R10: 00007ffc644b6780 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fa62c1f9658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9851  tgid:9851  ppid:11     flags:0x00004002
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
RIP: 0033:0x7f3796f60a90
RSP: 002b:00007ffc4962f2e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f3797051860 RCX: 00007f3796f60a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f3797051860 R08: 0000000000000001 R09: df19dfcc35aaad5c
R10: 00007ffc4962f1a0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f3797055658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9856  tgid:9856  ppid:1325   flags:0x00000002
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
RIP: 0033:0x7f9e02b77a90
RSP: 002b:00007ffd6d2f1278 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f9e02c68860 RCX: 00007f9e02b77a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f9e02c68860 R08: 0000000000000001 R09: 01538452257bb23f
R10: 00007ffd6d2f1130 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f9e02c6c658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9862  tgid:9862  ppid:1325   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9865  tgid:9865  ppid:1325   flags:0x00000002
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
RIP: 0033:0x7f87bf69da90
RSP: 002b:00007ffd16a9bee8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f87bf78e860 RCX: 00007f87bf69da90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f87bf78e860 R08: 0000000000000001 R09: 49fa25bab3fd9255
R10: 00007ffd16a9bda0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f87bf792658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9872  tgid:9872  ppid:1325   flags:0x00000000
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
RIP: 0033:0x7f190d742a90
RSP: 002b:00007fff15f87e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f190d833860 RCX: 00007f190d742a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f190d833860 R08: 0000000000000001 R09: abe120035995b0ac
R10: 00007fff15f87d20 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f190d837658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:9877  tgid:9877  ppid:1325   flags:0x00000002
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
RIP: 0033:0x7f6034cd3a90
RSP: 002b:00007ffe2d69ac18 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f6034dc4860 RCX: 00007f6034cd3a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f6034dc4860 R08: 0000000000000001 R09: 11de2efcc8ed89d5
R10: 00007ffe2d69aad0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f6034dc8658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9883  tgid:9883  ppid:11     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9889  tgid:9889  ppid:37     flags:0x00000000
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
RIP: 0033:0x7fc8e8cd6a90
RSP: 002b:00007ffe95b30038 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fc8e8dc7860 RCX: 00007fc8e8cd6a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fc8e8dc7860 R08: 0000000000000001 R09: fb27cddea10e562b
R10: 00007ffe95b2fef0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fc8e8dcb658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:9895  tgid:9895  ppid:37     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9896  tgid:9896  ppid:11     flags:0x00000000
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
RIP: 0033:0x7f7fa6392a90
RSP: 002b:00007ffd3f8d2e98 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f7fa6483860 RCX: 00007f7fa6392a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f7fa6483860 R08: 0000000000000001 R09: ec26742ef1324bc5
R10: 00007ffd3f8d2d50 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f7fa6487658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:9902  tgid:9902  ppid:11     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:9904  tgid:9904  ppid:37     flags:0x00000002
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
RIP: 0033:0x7f865aea4a90
RSP: 002b:00007ffdbafcc1a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f865af95860 RCX: 00007f865aea4a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f865af95860 R08: 0000000000000001 R09: 6519921b7d932ea4
R10: 00007ffdbafcc060 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f865af99658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9910  tgid:9910  ppid:11     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9912  tgid:9912  ppid:1325   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:9916  tgid:9916  ppid:11     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:26144 pid:9922  tgid:9922  ppid:11     flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:27088 pid:9928  tgid:9928  ppid:11     flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 exit_to_user_mode_loop kernel/entry/common.c:102 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xec/0x260 kernel/entry/common.c:218
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9929  tgid:9929  ppid:46     flags:0x00000002
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
RIP: 0033:0x7f3790ee9a90
RSP: 002b:00007ffd6af0bb58 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f3790fda860 RCX: 00007f3790ee9a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f3790fda860 R08: 0000000000000001 R09: e230ef76183efab5
R10: 00007ffd6af0ba10 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f3790fde658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9934  tgid:9934  ppid:11     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 </TASK>
task:modprobe        state:R  running task     stack:25952 pid:9937  tgid:9937  ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:9943  tgid:9943  ppid:11     flags:0x00004002
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
RIP: 0033:0x7f6f934a7a90
RSP: 002b:00007ffd406a7828 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f6f93598860 RCX: 00007f6f934a7a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f6f93598860 R08: 0000000000000001 R09: 96be0cbae33c7ca9
R10: 00007ffd406a76e0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f6f9359c658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9949  tgid:9949  ppid:11     flags:0x00000002
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
RIP: 0033:0x7fee521cda90
RSP: 002b:00007fffcefe6ec8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fee522be860 RCX: 00007fee521cda90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fee522be860 R08: 0000000000000001 R09: 17ed4309c950e542
R10: 00007fffcefe6d80 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fee522c2658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9955  tgid:9955  ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9958  tgid:9958  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9959  tgid:9959  ppid:1325   flags:0x00000002
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
RIP: 0033:0x7f0131c60a90
RSP: 002b:00007ffc4499f548 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f0131d51860 RCX: 00007f0131c60a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f0131d51860 R08: 0000000000000001 R09: a68ea4d3eed0dfeb
R10: 00007ffc4499f400 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f0131d55658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9965  tgid:9965  ppid:1325   flags:0x00000000
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
RIP: 0033:0x7f82fc758a90
RSP: 002b:00007ffe9e392c98 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f82fc849860 RCX: 00007f82fc758a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f82fc849860 R08: 0000000000000001 R09: 36cf7fe4c3043a73
R10: 00007ffe9e392b50 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f82fc84d658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:9970  tgid:9970  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:9972  tgid:9972  ppid:11     flags:0x00000002
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
RIP: 0033:0x7f958683ca90
RSP: 002b:00007fffb78714d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f958692d860 RCX: 00007f958683ca90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f958692d860 R08: 0000000000000001 R09: f39a6e51b3f16eac
R10: 00007fffb7871390 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f9586931658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9976  tgid:9976  ppid:46     flags:0x00000002
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
RIP: 0033:0x7f200dea2a90
RSP: 002b:00007fff07ade368 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f200df93860 RCX: 00007f200dea2a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f200df93860 R08: 0000000000000001 R09: 5b1cf2d2011f693e
R10: 00007fff07ade220 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f200df97658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9982  tgid:9982  ppid:1325   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9985  tgid:9985  ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:9993  tgid:9993  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:10000 tgid:10000 ppid:46     flags:0x00000000
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
RIP: 0033:0x7f9881536a90
RSP: 002b:00007fff40012198 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f9881627860 RCX: 00007f9881536a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f9881627860 R08: 0000000000000001 R09: dd436b2e179cb5d0
R10: 00007fff40012050 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f988162b658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:10006 tgid:10006 ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:23984 pid:10013 tgid:10013 ppid:46     flags:0x00000002
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
RIP: 0033:0x7f20c23d6a90
RSP: 002b:00007fffae80cb98 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f20c24c7860 RCX: 00007f20c23d6a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f20c24c7860 R08: 0000000000000001 R09: ca35b3432b44a533
R10: 00007fffae80ca50 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f20c24cb658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:10019 tgid:10019 ppid:11     flags:0x00000002
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
RIP: 0033:0x7f3cf0dc1a90
RSP: 002b:00007ffe227e87d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f3cf0eb2860 RCX: 00007f3cf0dc1a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f3cf0eb2860 R08: 0000000000000001 R09: 301bff6f62b389bf
R10: 00007ffe227e8690 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f3cf0eb6658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:10025 tgid:10025 ppid:1325   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/0:1H/295:
 #0: ffff8881026e7d48 ((wq_completion)kblockd){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc900016efd80 ((work_completion)(&q->timeout_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffffffff88ec6a78 (rcu_state.exp_mutex){+.+.}-{3:3}, at: exp_funnel_lock+0x1a4/0x3b0 kernel/rcu/tree_exp.h:329
4 locks held by acpid/2533:
 #0: ffff88811ee7f230 (&dev->event_lock){..-.}-{2:2}, at: input_event drivers/input/input.c:397 [inline]
 #0: ffff88811ee7f230 (&dev->event_lock){..-.}-{2:2}, at: input_event+0x70/0xa0 drivers/input/input.c:390
 #1: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #1: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: input_pass_values+0x8b/0x8e0 drivers/input/input.c:118
 #2: ffffffff89387ad8 (kbd_event_lock){..-.}-{2:2}, at: spin_lock include/linux/spinlock.h:351 [inline]
 #2: ffffffff89387ad8 (kbd_event_lock){..-.}-{2:2}, at: kbd_event+0x8a/0x17a0 drivers/tty/vt/keyboard.c:1535
 #3: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #3: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #3: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x7f/0x390 kernel/locking/lockdep.c:6720
2 locks held by getty/2608:
 #0: ffff888113e500a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000432f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0xfba/0x1480 drivers/tty/n_tty.c:2211
3 locks held by syz-executor/8254:
 #0: ffff888113f9c3f8 (sb_writers#5){.+.+}-{0:0}, at: filename_create+0x10d/0x530 fs/namei.c:4019
 #1: ffff88811807c8a8 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:850 [inline]
 #1: ffff88811807c8a8 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: filename_create+0x1c2/0x530 fs/namei.c:4026
 #2: ffff888113fa0958 (jbd2_handle){++++}-{0:0}, at: start_this_handle+0xf6c/0x1430 fs/jbd2/transaction.c:448
3 locks held by syz-executor/8257:
 #0: ffff888113f9c3f8 (sb_writers#5){.+.+}-{0:0}, at: filename_create+0x10d/0x530 fs/namei.c:4019
 #1: ffff88811807dc48 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:850 [inline]
 #1: ffff88811807dc48 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: filename_create+0x1c2/0x530 fs/namei.c:4026
 #2: ffff888113fa0958 (jbd2_handle){++++}-{0:0}, at: start_this_handle+0xf6c/0x1430 fs/jbd2/transaction.c:448
1 lock held by syz-executor/8261:
 #0: ffffffff88ec6a78 (rcu_state.exp_mutex){+.+.}-{3:3}, at: exp_funnel_lock+0x282/0x3b0 kernel/rcu/tree_exp.h:297
3 locks held by modprobe/10042:

=============================================



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


Return-Path: <linux-input+bounces-7375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BBD99B225
	for <lists+linux-input@lfdr.de>; Sat, 12 Oct 2024 10:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E271CB21823
	for <lists+linux-input@lfdr.de>; Sat, 12 Oct 2024 08:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AD41474BC;
	Sat, 12 Oct 2024 08:34:31 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C93833F7
	for <linux-input@vger.kernel.org>; Sat, 12 Oct 2024 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728722071; cv=none; b=PnsZyuMiFKJqe7ASS8FuQFI5+cIlGWoSMbBnsSdlQUEKowAMOT/QV5XTFDZWdHyVqcKHX9vyFPMw7gfvZzpwKZZ/wN5QQfLH6sNuH6WhDiimzYxoB8olygnxTeq/iwRGA8wTPZNWSj46hsNAehFMETUGWUVr6dgJv/R+trpvkhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728722071; c=relaxed/simple;
	bh=rv49wGh1/QmFtAnrQkZY3p/SBA8pmnfmdfa2mLg5lS8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dMZlcCLOZUYaQpfaIHQbrsyauVbVM9wbBSm2nNMKbw4QzZYdDbS9OVNwutGWogPWelNcm7fHh8b5JtsNAciVZIiQnva8tNCUzZA6jNBLIBxhmB9DdqAh7r1QI+wYcGqw4Zhm92YfKJ+TBAOov5lfa50ASoWbkVVYRUBguA0zx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-835470703c9so304177239f.1
        for <linux-input@vger.kernel.org>; Sat, 12 Oct 2024 01:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728722068; x=1729326868;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yuHTE3FluW7u+rC3Obg26prCVyoJThK5guIvMwTLac0=;
        b=oj4nnqQx5u33GV0cIfmvDR27WN7O5ozyxMPRpRKRpC6mSWxzMHvVXmlKoqAS2oMro5
         jMsAeIo1G3UbLbsYYBCZIX5imv6LDl9EL219l0APBANmzcr0MpWCsl7Uu8VJmHHOmNVb
         lt8u4fwY7o7tmh+Y+vqFTyBu88ISwXSYFZfTU4FmSlzJdCtZE3eiGZBCM5IqHNFzUK1N
         gzFpyuw/ESZoOrNBhiF1jIbgHHhBhycayZ8NC5xuPJvORzFTrV5Nb/NQEFswUOA6ONsb
         XGRfXQnYpsyQRzHdx6pKhCxpm6ceeZ9Uc+hBYYyEK2DMmNcFmXpDhXaDO52P3DJEKdKT
         oXSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrECv+AD0JC2OUTthmlIIrQqhjJDx6mhMzKVD93Jdv3P5WoWg+u5u1epPbgDRmCN+QU8BlfbpWtY8fUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJSw2njZcZbwrBlHGd0q2IsQesjJAwvkhC3d7JDkkqQaoaz1b
	dNJ+cyJV2WESDvzl7wfQ7b6vo+o3GGRmR/eDBMp6Q0yT2MIAUO6vy7DyTy5refCHwWS0zZBs5nl
	YPJXFaRegnYU/g7dfghwjaIZymoVZVDzG62HrN7KcTH1tkqIagUHOpPw=
X-Google-Smtp-Source: AGHT+IFcbLbZYObyJ4gR2M6vTJ1UPob+aAXFJNJUXba008fSrukhTdwhY2jFem+Jao07tkNYNxkqC406Rfz0yG9OfEjEjbV12bV9
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1653:b0:835:42ce:933d with SMTP id
 ca18e2360f4ac-8379202d4cdmr465156339f.1.1728722067744; Sat, 12 Oct 2024
 01:34:27 -0700 (PDT)
Date: Sat, 12 Oct 2024 01:34:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670a3493.050a0220.3e960.0022.GAE@google.com>
Subject: [syzbot] [input?] [usb?] INFO: rcu detected stall in do_syscall_64
From: syzbot <syzbot+a3bc6ce74afdd295fe4b@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4a9fe2a8ac53 dt-bindings: usb: dwc3-imx8mp: add compatible..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1385a327980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=a3bc6ce74afdd295fe4b
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14936707980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/883c5319cb52/disk-4a9fe2a8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/caf4421ed2ef/vmlinux-4a9fe2a8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d8e3beb01d49/bzImage-4a9fe2a8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a3bc6ce74afdd295fe4b@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 0-...D
 } 2669 jiffies s: 1049 root: 0x1/.
rcu: blocking rcu_node structures (internal RCU debug):

Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 2532 Comm: acpid Not tainted 6.12.0-rc1-syzkaller-00027-g4a9fe2a8ac53 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:io_serial_out+0x8f/0xb0 drivers/tty/serial/8250/8250_port.c:413
Code: 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1c 66 03 5d 40 44 89 e8 89 da ee <5b> 5d 41 5c 41 5d c3 cc cc cc cc e8 f1 eb 0d ff eb a0 e8 7a ec 0d
RSP: 0018:ffffc90000006f60 EFLAGS: 00000002
RAX: 0000000000000033 RBX: 00000000000003f8 RCX: 0000000000000000
RDX: 00000000000003f8 RSI: ffffffff82a076c5 RDI: ffffffff936356a0
RBP: ffffffff93635660 R08: 0000000000000001 R09: 000000000000001f
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000033 R14: ffffffff82a07660 R15: 0000000000000000
FS:  00007f7aac918740(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff922a80068 CR3: 0000000115d2e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 serial_out drivers/tty/serial/8250/8250.h:142 [inline]
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3322 [inline]
 serial8250_console_write+0xf9e/0x17c0 drivers/tty/serial/8250/8250_port.c:3393
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
 input_event_dispose drivers/input/input.c:352 [inline]
 input_handle_event+0xb30/0x14d0 drivers/input/input.c:369
 input_event drivers/input/input.c:398 [inline]
 input_event+0x83/0xa0 drivers/input/input.c:390
 hidinput_hid_event+0xa12/0x2410 drivers/hid/hid-input.c:1719
 hid_process_event+0x4b7/0x5e0 drivers/hid/hid-core.c:1540
 hid_input_array_field+0x535/0x710 drivers/hid/hid-core.c:1652
 hid_process_report drivers/hid/hid-core.c:1694 [inline]
 hid_report_raw_event+0xa02/0x11c0 drivers/hid/hid-core.c:2040
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
RIP: 0010:syscall_enter_from_user_mode_work include/linux/entry-common.h:165 [inline]
RIP: 0010:syscall_enter_from_user_mode include/linux/entry-common.h:198 [inline]
RIP: 0010:do_syscall_64+0x9a/0x250 arch/x86/entry/common.c:79
Code: 00 48 8b 7d 08 e8 26 46 00 00 0f 1f 44 00 00 0f 1f 44 00 00 90 e8 f6 54 6f fa 90 90 e8 cf 52 6f fa fb 65 48 8b 05 06 90 15 79 <48> 8b 50 08 f6 c2 3f 0f 85 3c 01 00 00 90 90 41 81 fc ce 01 00 00
RSP: 0018:ffffc90001abff28 EFLAGS: 00000206
RAX: ffff888115b59d40 RBX: ffffc90001abff58 RCX: 1ffffffff14ac111
RDX: 0000000000000000 RSI: ffffffff8727f1c0 RDI: ffffffff8746eac0
RBP: ffffc90001abff48 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8a56418f R11: 0000000000000000 R12: 000000000000010e
R13: 000000000000010e R14: 0000000000000000 R15: 0000000000000000
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7aac9e7591
Code: 89 44 24 20 4c 8d 64 24 20 48 89 54 24 28 64 8b 04 25 18 00 00 00 85 c0 75 2d 45 31 c9 4d 89 e0 4c 89 f2 b8 0e 01 00 00 0f 05 <48> 89 c3 48 3d 00 f0 ff ff 76 69 48 8b 05 65 58 0d 00 f7 db 64 89
RSP: 002b:00007fffa0c34210 EFLAGS: 00000246 ORIG_RAX: 000000000000010e
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f7aac9e7591
RDX: 0000000000000000 RSI: 00007fffa0c34308 RDI: 000000000000000b
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000560d1cee5178 R14: 0000000000000000 R15: 000000000000000a
 </TASK>
 </TASK>
task:kworker/u8:7    state:R  running task     stack:32568 pid:7398  tgid:7398  ppid:2692   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7402  tgid:7402  ppid:37     flags:0x00004002
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
RIP: 0033:0x7f2034997a90
RSP: 002b:00007ffd4dee5738 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f2034a88860 RCX: 00007f2034997a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f2034a88860 R08: 0000000000000001 R09: aa7250b017b69c93
R10: 00007ffd4dee55f0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f2034a8c658 R15: 0000000000000001
 </TASK>
task:kworker/u8:3    state:R  running task     stack:28656 pid:7403  tgid:7403  ppid:46     flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6854
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7192
 _cond_resched include/linux/sched.h:2031 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1dc/0x270 kernel/sched/core.c:5446
 bprm_execve fs/exec.c:1838 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1821
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2012
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:7414  tgid:7414  ppid:51     flags:0x00000002
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
RIP: 0033:0x7fa3eccaba90
RSP: 002b:00007fff3243bb08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fa3ecd9c860 RCX: 00007fa3eccaba90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fa3ecd9c860 R08: 0000000000000001 R09: 80d8236fd4dd26f2
R10: 00007fff3243b9c0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fa3ecda0658 R15: 0000000000000001
 </TASK>
task:kworker/u8:6    state:R  running task     stack:32568 pid:7415  tgid:7415  ppid:1489   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:kworker/u8:7    state:R  running task     stack:32568 pid:7419  tgid:7419  ppid:2692   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7421  tgid:7421  ppid:37     flags:0x00000008
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:kworker/u8:2    state:R  running task     stack:28784 pid:7424  tgid:7424  ppid:37     flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6854
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7192
 _cond_resched include/linux/sched.h:2031 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1dc/0x270 kernel/sched/core.c:5446
 </TASK>
task:kworker/u8:6    state:R  running task     stack:32568 pid:7429  tgid:7429  ppid:1489   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:kworker/u8:7    state:R  running task     stack:28656 pid:7433  tgid:7433  ppid:2692   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6854
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7192
 _cond_resched include/linux/sched.h:2031 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1dc/0x270 kernel/sched/core.c:5446
 bprm_execve fs/exec.c:1838 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1821
 kernel_execve+0x2ef/0x3b0 fs/exec.c:2012
 call_usermodehelper_exec_async+0x255/0x4c0 kernel/umh.c:110
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7440  tgid:7440  ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 </TASK>
task:modprobe        state:R  running task     stack:25344 pid:7442  tgid:7442  ppid:51     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7444  tgid:7444  ppid:37     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:7445  tgid:7445  ppid:51     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:23984 pid:7454  tgid:7454  ppid:46     flags:0x00000000
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
RIP: 0033:0x7f9fcc43ba90
RSP: 002b:00007ffe8d8a77b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f9fcc52c860 RCX: 00007f9fcc43ba90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f9fcc52c860 R08: 0000000000000001 R09: 3076a9a1f07aef27
R10: 00007ffe8d8a7670 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f9fcc530658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7462  tgid:7462  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7473  tgid:7473  ppid:2692   flags:0x00000002
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
RIP: 0033:0x7f8ff4594a90
RSP: 002b:00007ffe4f12e748 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f8ff4685860 RCX: 00007f8ff4594a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f8ff4685860 R08: 0000000000000001 R09: a679481a8b3ca446
R10: 00007ffe4f12e600 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f8ff4689658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7481  tgid:7481  ppid:2692   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:7482  tgid:7482  ppid:1489   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 </TASK>
task:modprobe        state:R  running task     stack:23984 pid:7485  tgid:7485  ppid:2692   flags:0x00000002
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
RIP: 0033:0x7fe8fb2efa90
RSP: 002b:00007ffc4af6bb08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fe8fb3e0860 RCX: 00007fe8fb2efa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fe8fb3e0860 R08: 0000000000000001 R09: 82b62935d707582e
R10: 00007ffc4af6b9c0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fe8fb3e4658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7492  tgid:7492  ppid:37     flags:0x00000002
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
RIP: 0033:0x7fa0156dca90
RSP: 002b:00007ffe729c7668 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fa0157cd860 RCX: 00007fa0156dca90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fa0157cd860 R08: 0000000000000001 R09: 3d8632c9608ef0f4
R10: 00007ffe729c7520 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fa0157d1658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7499  tgid:7499  ppid:46     flags:0x00000002
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
RIP: 0033:0x7fecfa6a9a90
RSP: 002b:00007fff833256d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fecfa79a860 RCX: 00007fecfa6a9a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fecfa79a860 R08: 0000000000000001 R09: 970988f50c2afe23
R10: 00007fff83325590 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fecfa79e658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7506  tgid:7506  ppid:2692   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:kworker/u8:6    state:R  running task     stack:32568 pid:7508  tgid:7508  ppid:1489   flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:7515  tgid:7515  ppid:2692   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7521  tgid:7521  ppid:37     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:7525  tgid:7525  ppid:37     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7537  tgid:7537  ppid:46     flags:0x00000002
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
RIP: 0033:0x7f4806810a90
RSP: 002b:00007fff9aa13d08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f4806901860 RCX: 00007f4806810a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f4806901860 R08: 0000000000000001 R09: b3a15a0de2c1b27b
R10: 00007fff9aa13bc0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f4806905658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7544  tgid:7544  ppid:2692   flags:0x00000002
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
RIP: 0033:0x7f417757aa90
RSP: 002b:00007fff35597f98 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f417766b860 RCX: 00007f417757aa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f417766b860 R08: 0000000000000001 R09: d6e29ef7cba51477
R10: 00007fff35597e50 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f417766f658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7551  tgid:7551  ppid:51     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:23984 pid:7559  tgid:7559  ppid:51     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7565  tgid:7565  ppid:37     flags:0x00000002
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
RIP: 0033:0x7f0d44de5a90
RSP: 002b:00007ffc77475048 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f0d44ed6860 RCX: 00007f0d44de5a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f0d44ed6860 R08: 0000000000000001 R09: 09f99504fd216a3e
R10: 00007ffc77474f00 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f0d44eda658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7571  tgid:7571  ppid:51     flags:0x00000002
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
RIP: 0033:0x7f5137ee5a90
RSP: 002b:00007ffe7b16d2f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f5137fd6860 RCX: 00007f5137ee5a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f5137fd6860 R08: 0000000000000001 R09: 39f2e79377276fcd
R10: 00007ffe7b16d1b0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f5137fda658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7579  tgid:7579  ppid:51     flags:0x00000000
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
RIP: 0033:0x7f2e9aff3a90
RSP: 002b:00007fff752231d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f2e9b0e4860 RCX: 00007f2e9aff3a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f2e9b0e4860 R08: 0000000000000001 R09: c71f2d5dd6629748
R10: 00007fff75223090 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f2e9b0e8658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:7585  tgid:7585  ppid:37     flags:0x00000002
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
RIP: 0033:0x7fe8f2539a90
RSP: 002b:00007ffd45f4b5a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fe8f262a860 RCX: 00007fe8f2539a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fe8f262a860 R08: 0000000000000001 R09: afbf0fa71a8c0678
R10: 00007ffd45f4b460 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fe8f262e658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25344 pid:7592  tgid:7592  ppid:51     flags:0x00000002
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
RIP: 0033:0x7f0106c7ca90
RSP: 002b:00007ffe1498d728 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f0106d6d860 RCX: 00007f0106c7ca90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f0106d6d860 R08: 0000000000000001 R09: 353918f062f66546
R10: 00007ffe1498d5e0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f0106d71658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:7594  tgid:7594  ppid:2692   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7605  tgid:7605  ppid:1489   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7612  tgid:7612  ppid:1489   flags:0x00000000
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
RIP: 0033:0x7f3fa77efa90
RSP: 002b:00007ffe57825798 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f3fa78e0860 RCX: 00007f3fa77efa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f3fa78e0860 R08: 0000000000000001 R09: 9cdd8f821dd9d0a3
R10: 00007ffe57825650 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f3fa78e4658 R15: 0000000000000001
 </TASK>
task:kworker/u8:6    state:R  running task     stack:32568 pid:7619  tgid:7619  ppid:1489   flags:0x00004000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7623  tgid:7623  ppid:51     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7632  tgid:7632  ppid:2692   flags:0x00004002
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
RIP: 0033:0x7f4083162a90
RSP: 002b:00007ffd085d5df8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f4083253860 RCX: 00007f4083162a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f4083253860 R08: 0000000000000001 R09: 8afaf3669ee4b4d5
R10: 00007ffd085d5cb0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f4083257658 R15: 0000000000000001
 </TASK>
task:kworker/u8:2    state:R  running task     stack:32568 pid:7639  tgid:7639  ppid:37     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7641  tgid:7641  ppid:1489   flags:0x00004002
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
RIP: 0033:0x7f8b97a56a90
RSP: 002b:00007ffe1ad71498 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f8b97b47860 RCX: 00007f8b97a56a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f8b97b47860 R08: 0000000000000001 R09: e3c1353c4b4c05fa
R10: 00007ffe1ad71350 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f8b97b4b658 R15: 0000000000000001
 </TASK>
task:kworker/u8:4    state:R  running task     stack:32568 pid:7646  tgid:7646  ppid:51     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7649  tgid:7649  ppid:2692   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:23984 pid:7659  tgid:7659  ppid:51     flags:0x00000002
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
RIP: 0033:0x7fb87cea7a90
RSP: 002b:00007ffead957488 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fb87cf98860 RCX: 00007fb87cea7a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fb87cf98860 R08: 0000000000000001 R09: 008e9db68798e101
R10: 00007ffead957340 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fb87cf9c658 R15: 0000000000000001
 </TASK>
task:kworker/u8:2    state:R  running task     stack:32568 pid:7662  tgid:7662  ppid:37     flags:0x00004000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7668  tgid:7668  ppid:51     flags:0x00004002
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
RIP: 0033:0x7f282d7baa90
RSP: 002b:00007ffce0371718 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f282d8ab860 RCX: 00007f282d7baa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f282d8ab860 R08: 0000000000000001 R09: f5b88b55439439fc
R10: 00007ffce03715d0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f282d8af658 R15: 0000000000000001
 </TASK>
task:kworker/u8:4    state:R  running task     stack:28784 pid:7674  tgid:7674  ppid:51     flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5318 [inline]
 __schedule+0x1067/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:26144 pid:7682  tgid:7682  ppid:51     flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:7700  tgid:7700  ppid:37     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7707  tgid:7707  ppid:2692   flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:kworker/u8:6    state:R  running task     stack:28784 pid:7709  tgid:7709  ppid:1489   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7717  tgid:7717  ppid:1489   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:kworker/u8:4    state:R  running task     stack:28784 pid:7720  tgid:7720  ppid:51     flags:0x00004000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:26144 pid:7732  tgid:7732  ppid:37     flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24704 pid:7747  tgid:7747  ppid:2692   flags:0x00000002
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
RIP: 0033:0x7f724bebea90
RSP: 002b:00007fffd8d26b08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f724bfaf860 RCX: 00007f724bebea90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f724bfaf860 R08: 0000000000000001 R09: bca1ddf9b70ed6c7
R10: 00007fffd8d269c0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f724bfb3658 R15: 0000000000000001
 </TASK>
task:kworker/u8:2    state:R  running task     stack:32568 pid:7755  tgid:7755  ppid:37     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:7756  tgid:7756  ppid:2692   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7762  tgid:7762  ppid:2692   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:kworker/u8:7    state:R  running task     stack:32568 pid:7772  tgid:7772  ppid:2692   flags:0x00004000
Call Trace:
 <TASK>
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:modprobe        state:R  running task     stack:25952 pid:7776  tgid:7776  ppid:51     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6854
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7192
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 </TASK>
task:modprobe        state:R  running task     stack:25408 pid:7784  tgid:7784  ppid:37     flags:0x00000002
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
RIP: 0033:0x7f677e186a90
RSP: 002b:00007fff375d3ef8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f677e277860 RCX: 00007f677e186a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f677e277860 R08: 0000000000000001 R09: 5e270266d015c889
R10: 00007fff375d3db0 R11: 0000000000000246 R12: 0000000000000000


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


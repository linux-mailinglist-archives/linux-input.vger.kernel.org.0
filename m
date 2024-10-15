Return-Path: <linux-input+bounces-7436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C2599F812
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 22:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52B85287A37
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 20:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0598A1F818E;
	Tue, 15 Oct 2024 20:27:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1731F585D
	for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729024026; cv=none; b=QTk6C71kHnKIi7YlEkhhnRKJCKk+GbOQLx05sC3blosVzsAek3Ag2ThNd6DYUkHZevA/ZTs1IZ32hYRl6uVE2isOSjlBy1Ncoqeo72YuEo6G30qcSvACriq8mk/p1ZBFvj5QUXn/3YDgoJillZUQUBXI5nVNNiK+YIH6h8nxiBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729024026; c=relaxed/simple;
	bh=uGhWZB+3XTC15zM9up6AzSu3HyGQC0fLUJ1DHZ5Xb04=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Eleuj5Cye7QJDdATRx5ypYtNkTTqGQNsii7m5qB2XXx0+Xie4S3iQWGP0KjLdknPS2itmaT/fc+lkdJLy6NBzcRYWyawozc/Ycd5CvDYL+Ok4yVYVGosgUdG5ftGxqmTwPytLsvT6e/Dtol0K7JZqULgYY4RCHzrcb8Qqh2TGL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a3b4395dedso48438565ab.1
        for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 13:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729024023; x=1729628823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+7nifHMBOTp4MWFQ4dtgBzhtmn5rZon5e33Nrvdq1M=;
        b=gEGT+lxUB96V1uxeznRsvYpAcjqWHYNzE/VDuqQzm0vHcFCuTGxWAAs27r0NkqGI3K
         Mo/f0EFEH/OxCP9HHB56E9wtl4JsrWXB0xTroI5c/o1EHhOOFlIk8n44kJBZm/t2iGFs
         bB91rY8kWoHwCGDx8K+qpW8wrCQVQcEgKvXiiHuiWt9V7B139zgV7xFfpmQlNgZd4Ws0
         jbxVhINrLPSc+t4DnHgcf1SCUmOFyXSc3z235tS3tPMY2ULXdvPm6Fh70V+oADid1moX
         6vqI+mjxhKMmb6ZidrwXtnu4krgmKRUWK8kbaR0CamivKL+MtDLWR3KLCGgcvR+bMtoE
         ntbA==
X-Forwarded-Encrypted: i=1; AJvYcCXi1MNGzNVhyrLdLZOwjhSEnbGpU9V7vyvXD3ZvoAadx23rqKA4gOAlM/IHf9x3Z9y2fcSsjK+79QV5gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU2TtkMcDwPgK7LA+CFG6P59P1A67kf9BhmcvV7SQVQ3yVGHZp
	w7GuBNPfrjFodRVe7KNkCnMLsTGVSCKBJlPFsbFf9wDHy0XuikBc1rsy1sYLTjFvilzFlBuqfm3
	VWvcl/1vNL1mVPf8i6wZb5gWwUTOyVOaT6ykalsSLCi67infC+bml1TE=
X-Google-Smtp-Source: AGHT+IEGrNk3r9CdMYEKf5UZI7bsLbODGR6xw8SytpDZKTFW8cP5uADSoZbootCy+ucKQGyNAQK5f64EgC6FtNOQSiR/qbWzX6tu
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cf:b0:3a0:8edc:d133 with SMTP id
 e9e14a558f8ab-3a3b5f94601mr145632625ab.9.1729024023361; Tue, 15 Oct 2024
 13:27:03 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:27:03 -0700
In-Reply-To: <ji3zt22xdnr2wieepeudioxg6uqthwxtbut6w2ec55lmnnzghv@c4jwoow5u2gg>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670ed017.050a0220.d9b66.0156.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] [mm?] INFO: rcu detected stall in vma_link_file
From: syzbot <syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, liam.howlett@oracle.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: rcu detected stall in corrupted

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
 0-...D } 2647 jiffies s: 1489 root: 0x1/.
rcu: blocking rcu_node structures (internal RCU debug):

Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 2536 Comm: acpid Not tainted 6.12.0-rc3-syzkaller-00033-g80bf308c69a9 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:format_decode+0x94d/0xba0 lib/vsprintf.c:2571
Code: 41 bd 4c 00 00 00 48 89 5c 24 38 e9 fb fa ff ff e8 68 6a 6f fa 31 f6 31 ff e8 3f 6c 6f fa e8 5a 6a 6f fa 31 db e9 82 f9 ff ff <e8> 4e 6a 6f fa 48 8d 7c 24 38 e8 24 d5 ff ff 48 8b 6c 24 38 0f b6
RSP: 0000:ffffc900016aea48 EFLAGS: 00000097
RAX: 0000000000000000 RBX: ffffffff8728c721 RCX: ffffffff86e6726f
RDX: ffff888115f1ba80 RSI: 0000000000000009 RDI: 0000000000000005
RBP: ffffffff8728c722 R08: 0000000000000005 R09: 0000000000000009
R10: 0000000000000005 R11: 0000000000040348 R12: ffffc900016aeb48
R13: ffffffff8728c721 R14: 0000000000000035 R15: 0000000000000005
FS:  00007fe77c367740(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557a1e480818 CR3: 0000000115f98000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <TASK>
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
 sched_show_task kernel/sched/core.c:7589 [inline]
 sched_show_task+0x3f0/0x5f0 kernel/sched/core.c:7564
 show_state_filter+0xee/0x320 kernel/sched/core.c:7634
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
 sysvec_apic_timer_interrupt+0x43/0xb0 arch/x86/kernel/apic/apic.c:1037
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0033:0x7fe77c3dd773
Code: 00 f3 a5 48 8d 74 24 88 48 b9 ff ff ff 7f fe ff ff ff 48 21 c8 48 89 44 24 88 41 ba 08 00 00 00 44 89 c7 b8 0e 00 00 00 0f 05 <45> 31 c0 3d 00 f0 ff ff 76 06 41 89 c0 41 f7 d8 44 89 c0 5a c3 41
RSP: 002b:00007ffcef9c0fa0 EFLAGS: 00000246
RAX: 0000000000000000 RBX: 000055591f199906 RCX: 00007fe77c3dd773
RDX: 0000000000000000 RSI: 000055591f19f480 RDI: 0000000000000000
RBP: 0000000000000007 R08: 0000000000000000 R09: 0000000000000001
R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffcef9c10a8
R13: 000055591f199178 R14: 0000000000000001 R15: 000000000000000a
 </TASK>
 </TASK>
task:kworker/u8:1    state:R  running task     stack:32568 pid:9565  tgid:9565  ppid:28     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9568  tgid:9568  ppid:1114   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:kworker/u8:9    state:R  running task     stack:28784 pid:9576  tgid:9576  ppid:1148   flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6861
 __cond_resched+0x1b/0x30 kernel/sched/core.c:7199
 _cond_resched include/linux/sched.h:2031 [inline]
 stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
 sched_exec+0x1dc/0x270 kernel/sched/core.c:5453
 bprm_execve fs/exec.c:1838 [inline]
 bprm_execve+0x46c/0x1950 fs/exec.c:1821
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9585  tgid:9585  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9599  tgid:9599  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9608  tgid:9608  ppid:1148   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f51cee31a90
RSP: 002b:00007ffd78235dd8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f51cef22860 RCX: 00007f51cee31a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f51cef22860 R08: 0000000000000001 R09: d9f10af76f91c837
R10: 00007ffd78235c90 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f51cef26658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:9615  tgid:9615  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7febdbac2a90
RSP: 002b:00007ffdc4cdeff8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007febdbbb3860 RCX: 00007febdbac2a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007febdbbb3860 R08: 0000000000000001 R09: 9c513921461b8e44
R10: 00007ffdc4cdeeb0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007febdbbb7658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9621  tgid:9621  ppid:11     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f439b8b7a90
RSP: 002b:00007fffe0ac2d68 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f439b9a8860 RCX: 00007f439b8b7a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f439b9a8860 R08: 0000000000000001 R09: ff9d4db23f41e35a
R10: 00007fffe0ac2c20 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f439b9ac658 R15: 0000000000000001
 </TASK>
task:modprobe        state:D stack:25424 pid:9627  tgid:9627  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9640  tgid:9640  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:modprobe        state:R  running task     stack:24416 pid:9649  tgid:9649  ppid:11     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9ff0b0ba90
RSP: 002b:00007ffcc7ed1848 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f9ff0bfc860 RCX: 00007f9ff0b0ba90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f9ff0bfc860 R08: 0000000000000001 R09: 53b7f4bb0ff00e10
R10: 00007ffcc7ed1700 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f9ff0c00658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9656  tgid:9656  ppid:1114   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 __pfx___lock_acquire+0x10/0x10 kernel/locking/lockdep.c:4387
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9664  tgid:9664  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f260c278a90
RSP: 002b:00007ffca8cbcb18 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f260c369860 RCX: 00007f260c278a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f260c369860 R08: 0000000000000001 R09: ec1b067fce940b65
R10: 00007ffca8cbc9d0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f260c36d658 R15: 0000000000000001
 </TASK>
task:kworker/u8:0    state:R  running task     stack:32568 pid:9671  tgid:9671  ppid:11     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9672  tgid:9672  ppid:1114   flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f395cc9ea90
RSP: 002b:00007ffff1d03df8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f395cd8f860 RCX: 00007f395cc9ea90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f395cd8f860 R08: 0000000000000001 R09: 0c83ee7b55e5651c
R10: 00007ffff1d03cb0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f395cd93658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:9678  tgid:9678  ppid:28     flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4fb9369a90
RSP: 002b:00007ffde76a6918 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f4fb945a860 RCX: 00007f4fb9369a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f4fb945a860 R08: 0000000000000001 R09: 56a7058e5d32bb87
R10: 00007ffde76a67d0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f4fb945e658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9684  tgid:9684  ppid:1148   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9694  tgid:9694  ppid:28     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f306776fa90
RSP: 002b:00007ffe0ff593a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f3067860860 RCX: 00007f306776fa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f3067860860 R08: 0000000000000001 R09: 7fe3f123c3d90a52
R10: 00007ffe0ff59260 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f3067864658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:9701  tgid:9701  ppid:1148   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:modprobe        state:R  running task     stack:25344 pid:9710  tgid:9710  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:modprobe        state:R  running task     stack:24000 pid:9714  tgid:9714  ppid:1114   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe83ca73a90
RSP: 002b:00007fff91de4128 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fe83cb64860 RCX: 00007fe83ca73a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fe83cb64860 R08: 0000000000000001 R09: 0380a4352b815b7d
R10: 00007fff91de3fe0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fe83cb68658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9719  tgid:9719  ppid:28     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9726  tgid:9726  ppid:28     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9734  tgid:9734  ppid:28     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f880ede0a90
RSP: 002b:00007ffca15eb9f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f880eed1860 RCX: 00007f880ede0a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f880eed1860 R08: 0000000000000001 R09: 6855b1290ac23e74
R10: 00007ffca15eb8b0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f880eed5658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:9737  tgid:9737  ppid:1148   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd1ff7caa90
RSP: 002b:00007fff7f497088 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fd1ff8bb860 RCX: 00007fd1ff7caa90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fd1ff8bb860 R08: 0000000000000001 R09: 93c7e6092e4e8d94
R10: 00007fff7f496f40 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fd1ff8bf658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9741  tgid:9741  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3b768dca90
RSP: 002b:00007ffed6373f08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f3b769cd860 RCX: 00007f3b768dca90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f3b769cd860 R08: 0000000000000001 R09: cbb88f32d31ba940
R10: 00007ffed6373dc0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f3b769d1658 R15: 0000000000000001
 </TASK>
task:kworker/u8:1    state:R  running task     stack:32568 pid:9750  tgid:9750  ppid:28     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9752  tgid:9752  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:kworker/u8:7    state:R  running task     stack:32568 pid:9755  tgid:9755  ppid:1114   flags:0x00004000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9760  tgid:9760  ppid:1148   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:kworker/u8:1    state:R  running task     stack:32568 pid:9762  tgid:9762  ppid:28     flags:0x00004000
Call Trace:
 <TASK>
 __switch_to_asm+0x70/0x70
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9766  tgid:9766  ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9772  tgid:9772  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f42d3bdba90
RSP: 002b:00007fffe30e2e08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f42d3ccc860 RCX: 00007f42d3bdba90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f42d3ccc860 R08: 0000000000000001 R09: 4e69d63dc7a7fcc0
R10: 00007fffe30e2cc0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f42d3cd0658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9778  tgid:9778  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9786  tgid:9786  ppid:11     flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9796  tgid:9796  ppid:1114   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f68f99e1a90
RSP: 002b:00007ffe63673f58 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f68f9ad2860 RCX: 00007f68f99e1a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f68f9ad2860 R08: 0000000000000001 R09: f47c3fb77550af2e
R10: 00007ffe63673e10 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f68f9ad6658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9801  tgid:9801  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb781c83a90
RSP: 002b:00007ffd60d9ea28 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fb781d74860 RCX: 00007fb781c83a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fb781d74860 R08: 0000000000000001 R09: 215fd20ce0e6152e
R10: 00007ffd60d9e8e0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fb781d78658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9809  tgid:9809  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:modprobe        state:R  running task     stack:24000 pid:9818  tgid:9818  ppid:11     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9722143a90
RSP: 002b:00007ffe05d6de28 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f9722234860 RCX: 00007f9722143a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f9722234860 R08: 0000000000000001 R09: 6b4b8080cd93a00c
R10: 00007ffe05d6dce0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f9722238658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:9825  tgid:9825  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9835  tgid:9835  ppid:11     flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9845  tgid:9845  ppid:1114   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdda0a27a90
RSP: 002b:00007ffe05bd09d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fdda0b18860 RCX: 00007fdda0a27a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fdda0b18860 R08: 0000000000000001 R09: ff36ed7236d48a13
R10: 00007ffe05bd0890 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fdda0b1c658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24000 pid:9851  tgid:9851  ppid:11     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe833113a90
RSP: 002b:00007fff2a01fc28 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fe833204860 RCX: 00007fe833113a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fe833204860 R08: 0000000000000001 R09: 35ed84c02d71e9d4
R10: 00007fff2a01fae0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fe833208658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9857  tgid:9857  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3964397a90
RSP: 002b:00007ffd9166d4b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f3964488860 RCX: 00007f3964397a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f3964488860 R08: 0000000000000001 R09: 8f528e78319cc9bc
R10: 00007ffd9166d370 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f396448c658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9865  tgid:9865  ppid:11     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 </TASK>
task:modprobe        state:R  running task     stack:25344 pid:9874  tgid:9874  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff415499a90
RSP: 002b:00007ffc31aa1ed8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ff41558a860 RCX: 00007ff415499a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007ff41558a860 R08: 0000000000000001 R09: bec4dee6b5bd8695
R10: 00007ffc31aa1d90 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ff41558e658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9880  tgid:9880  ppid:46     flags:0x00000000
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9882  tgid:9882  ppid:1148   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6775f63a90
RSP: 002b:00007ffc48cbf6e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f6776054860 RCX: 00007f6775f63a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007f6776054860 R08: 0000000000000001 R09: 2978e367673e3d81
R10: 00007ffc48cbf5a0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f6776058658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25136 pid:9888  tgid:9888  ppid:46     flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa6ea053a90
RSP: 002b:00007ffca5ca66d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fa6ea144860 RCX: 00007fa6ea053a90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007fa6ea144860 R08: 0000000000000001 R09: e7a3475f3e0f6286
R10: 00007ffca5ca6590 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fa6ea148658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:24000 pid:9895  tgid:9895  ppid:1148   flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
 do_exit+0x1de7/0x2ce0 kernel/exit.c:990
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
 __do_sys_exit_group kernel/exit.c:1099 [inline]
 __se_sys_exit_group kernel/exit.c:1097 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
 x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff086b4da90
RSP: 002b:00007ffc358ac5f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ff086c3e860 RCX: 00007ff086b4da90
RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
RBP: 00007ff086c3e860 R08: 0000000000000001 R09: 29caad31773cb941
R10: 00007ffc358ac4b0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ff086c42658 R15: 0000000000000001
 </TASK>
task:modprobe        state:R  running task     stack:25424 pid:9901  tgid:9901  ppid:1114   flags:0x00000002
Call Trace:
 <TASK>
 </TASK>
task:modprobe        state:R  running task     stack:24720 pid:9911  tgid:9911  ppid:1148   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
 do_task_dead+0xd6/0x110 kernel/sched/core.c:6698


Tested on:

commit:         80bf308c mm/mglru: only clear kswapd_failures if recla..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
console output: https://syzkaller.appspot.com/x/log.txt?x=1600445f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9878fe11046ea2c6
dashboard link: https://syzkaller.appspot.com/bug?extid=ce483fd06e2061f44f5d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.


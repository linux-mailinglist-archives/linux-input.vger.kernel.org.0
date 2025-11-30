Return-Path: <linux-input+bounces-16404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D56C955AF
	for <lists+linux-input@lfdr.de>; Sun, 30 Nov 2025 23:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A09A3A1D71
	for <lists+linux-input@lfdr.de>; Sun, 30 Nov 2025 22:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5D32475D0;
	Sun, 30 Nov 2025 22:59:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4050522576E
	for <linux-input@vger.kernel.org>; Sun, 30 Nov 2025 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764543566; cv=none; b=lHz/Mkg5eqAzHWH65OWVUVds+nlSxln0kHB3/rBRHuDL0yml8gnTSe7bKX2FiA1x2rW8MHoGSiwrM1X4jOnk7WaxVqJzsGZOe7dKJnZYcmTd5TFEFgoByShrSFNYXNoFiMsQcuW0u6E1y0WMJ2nG6yFz1Nnm0dnfDCbjwZqNuoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764543566; c=relaxed/simple;
	bh=G6/rKgm60d+pWNh6kz+EPALqHQ5oAnwR27uxa8+87xc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CGerofUzF7+S0CMAlFo4yaGueD2C50953ERkDkalQDWHVpta/NqI0z3K1ZRwMct5WdRtHZ28hKA/yZEWYsrE1XWL8vcSAUZ+cc4d1nKy4nz23oDGvSTx2yjbpEroet+/RSdnMKd1tb93y5xKJtUWLQJ+kDjSJtn7OqWzcdJsF5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-43323ffc26bso24996375ab.0
        for <linux-input@vger.kernel.org>; Sun, 30 Nov 2025 14:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764543564; x=1765148364;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1bVu02Ri5Q6hECoyUQn61sUejeKwciH+qikOpjzZc3A=;
        b=BKqQvpecnnVi2wlkEa+lFsYkjWkEWxh1l+U6mb3p57P90s5FSiBkeoEgte3Hxn6zlY
         URLtgTrfV7+BNdTvYikUjtClAS8GvhcFE+ibvpc1MTf/wBBWhIE+O51s3a4eGhrc0yXl
         oOi2cjFJv+DaBumGPhC21D8IpTVyk5SkU5Wt6b9glTeTOiefUatbu72ZTJ1qeTf6REgt
         NAX0cGG1MQn5YYE7z0m+VrCHSNrk52YVMI4EikLZiQ96/LhjMb/I+aAydhSPgUJEOKxn
         PmATEhrl/mtRXT677KSS1/ZACQ3Ue4znoGrwTw7rGH0vQeiWBjfD4gXLXAMkxg/jAXxJ
         /nvA==
X-Forwarded-Encrypted: i=1; AJvYcCWRFeJ4FTkEh/XoilUv+8ZSknCrs5k6vsRYw54QqiQ7wvL3DWBBaXnFORdtGBFpqRVhEEPjL7dsFEOYMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCE5GQTXi51+NlbquLn6qisUJcJ3XIvEoGyFGAQzbWJcmw4XKZ
	xm4ikH4ehFEftIDPZMRSKmkxTGxZ3Ndl9xkym2naqbVL1MmmF/IVrqEF8CiEmhfMbWgqjI6/+j/
	ff3uV1Sc+J32NwBuu95sVFDXFtb8AgJ1nR4MDKAuz+TOHAH83zl9bXA/aG/I=
X-Google-Smtp-Source: AGHT+IHi/oPdbwffPz93toY8g52FUJrvUkHwgPtjJvvhwILpX4SzLnN26zbEpZtWd6KaJdYQ7o7341T+g9ixpczquw22D4+fmUI0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a87:b0:434:70bd:8b47 with SMTP id
 e9e14a558f8ab-435b985b419mr298167025ab.11.1764543564273; Sun, 30 Nov 2025
 14:59:24 -0800 (PST)
Date: Sun, 30 Nov 2025 14:59:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <692ccc4c.a70a0220.d98e3.0175.GAE@google.com>
Subject: [syzbot] [input?] [usb?] WARNING in cm109_urb_irq_callback
From: syzbot <syzbot+c708736c2ec142a386fd@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    663d0d1af3fa Add linux-next specific files for 20251126
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14c584b4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c8705ffbbff9235f
dashboard link: https://syzkaller.appspot.com/bug?extid=c708736c2ec142a386fd
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10746f42580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1456de12580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bccd41a8a8ce/disk-663d0d1a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/21ebce6fa0f2/vmlinux-663d0d1a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/441ffa7b502f/bzImage-663d0d1a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c708736c2ec142a386fd@syzkaller.appspotmail.com

cm109 1-1:0.8: cm109_urb_irq_callback: urb status -71
------------[ cut here ]------------
URB ffff8880269d7000 submitted while active
WARNING: drivers/usb/core/urb.c:380 at 0x0, CPU#1: syz.0.17/6058
Modules linked in:
CPU: 1 UID: 0 PID: 6058 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:usb_submit_urb+0x7e/0x18d0 drivers/usb/core/urb.c:380
Code: 89 f0 48 c1 e8 03 42 80 3c 38 00 74 08 4c 89 f7 e8 67 4e 21 fb 49 83 3e 00 74 40 e8 bc fe ba fa 48 8d 3d 75 5b c5 08 48 89 de <67> 48 0f b9 3a b8 f0 ff ff ff eb 11 e8 a1 fe ba fa eb 05 e8 9a fe
RSP: 0018:ffffc90000a08878 EFLAGS: 00010046
RAX: ffffffff8706e144 RBX: ffff8880269d7000 RCX: ffff88802503bd00
RDX: 0000000000000100 RSI: ffff8880269d7000 RDI: ffffffff8fcc3cc0
RBP: 000000000000000f R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52000141100 R12: 0000000000000820
R13: ffff88807b288030 R14: ffff8880269d7008 R15: dffffc0000000000
FS:  0000555591d77500(0000) GS:ffff888125b3e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2160730e9c CR3: 000000007837a000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 cm109_submit_ctl drivers/input/misc/cm109.c:380 [inline]
 cm109_urb_irq_callback+0x709/0xcd0 drivers/input/misc/cm109.c:431
 __usb_hcd_giveback_urb+0x376/0x540 drivers/usb/core/hcd.c:1661
 dummy_timer+0x85f/0x45b0 drivers/usb/gadget/udc/dummy_hcd.c:1995
 __run_hrtimer kernel/time/hrtimer.c:1777 [inline]
 __hrtimer_run_queues+0x51c/0xc30 kernel/time/hrtimer.c:1841
 hrtimer_run_softirq+0x187/0x2b0 kernel/time/hrtimer.c:1858
 handle_softirqs+0x27d/0x850 kernel/softirq.c:626
 __do_softirq kernel/softirq.c:660 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:727
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:743
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1056
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0xa8/0x110 kernel/locking/spinlock.c:194
Code: 74 05 e8 eb f6 64 f6 48 c7 44 24 20 00 00 00 00 9c 8f 44 24 20 f6 44 24 21 02 75 4f f7 c3 00 02 00 00 74 01 fb bf 01 00 00 00 <e8> a3 7f 2c f6 65 8b 05 2c 61 59 07 85 c0 74 40 48 c7 04 24 0e 36
RSP: 0018:ffffc90003b7faa0 EFLAGS: 00000206
RAX: ea11a46cfad79300 RBX: 0000000000000a02 RCX: ea11a46cfad79300
RDX: 0000000000000006 RSI: ffffffff8da6f16a RDI: 0000000000000001
RBP: ffffc90003b7fb28 R08: ffffffff8fbf8277 R09: 1ffffffff1f7f04e
R10: dffffc0000000000 R11: fffffbfff1f7f04f R12: dffffc0000000000
R13: 1ffff1102887017f R14: ffff888144380000 R15: 1ffff9200076ff54
 spin_unlock_irqrestore include/linux/spinlock.h:406 [inline]
 dummy_pullup+0x18c/0x200 drivers/usb/gadget/udc/dummy_hcd.c:926
 usb_gadget_disconnect_locked+0x143/0x490 drivers/usb/gadget/udc/core.c:780
 gadget_unbind_driver+0xc7/0x460 drivers/usb/gadget/udc/core.c:1685
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1274 [inline]
 device_release_driver_internal+0x46f/0x800 drivers/base/dd.c:1297
 driver_detach+0x1f3/0x2d0 drivers/base/dd.c:1360
 bus_remove_driver+0x226/0x320 drivers/base/bus.c:785
 usb_gadget_unregister_driver+0x4e/0x70 drivers/usb/gadget/udc/core.c:1751
 raw_release+0xd7/0x260 drivers/usb/gadget/legacy/raw_gadget.c:463
 __fput+0x44c/0xa70 fs/file_table.c:468
 task_work_run+0x1d4/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:44 [inline]
 exit_to_user_mode_loop+0xff/0x4f0 kernel/entry/common.c:75
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:159 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:194 [inline]
 do_syscall_64+0x2e3/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff71818f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc6614e5d8 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 000000000001fed9 RCX: 00007ff71818f749
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000001 R09: 000000056614e8cf
R10: 0000001b31f20000 R11: 0000000000000246 R12: 00007ff7183e5fac
R13: 00007ff7183e5fa0 R14: ffffffffffffffff R15: 0000000000000003
 </TASK>
----------------
Code disassembly (best guess):
   0:	89 f0                	mov    %esi,%eax
   2:	48 c1 e8 03          	shr    $0x3,%rax
   6:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
   b:	74 08                	je     0x15
   d:	4c 89 f7             	mov    %r14,%rdi
  10:	e8 67 4e 21 fb       	call   0xfb214e7c
  15:	49 83 3e 00          	cmpq   $0x0,(%r14)
  19:	74 40                	je     0x5b
  1b:	e8 bc fe ba fa       	call   0xfabafedc
  20:	48 8d 3d 75 5b c5 08 	lea    0x8c55b75(%rip),%rdi        # 0x8c55b9c
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  34:	eb 11                	jmp    0x47
  36:	e8 a1 fe ba fa       	call   0xfabafedc
  3b:	eb 05                	jmp    0x42
  3d:	e8                   	.byte 0xe8
  3e:	9a                   	(bad)
  3f:	fe                   	.byte 0xfe


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


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B8B2E75E6
	for <lists+linux-input@lfdr.de>; Wed, 30 Dec 2020 04:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgL3D64 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 22:58:56 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:45244 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgL3D6z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 22:58:55 -0500
Received: by mail-io1-f69.google.com with SMTP id x7so6786192ion.12
        for <linux-input@vger.kernel.org>; Tue, 29 Dec 2020 19:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=4ruNbphtL7FG8o2SqTv5MJgFopamXQNnHwkYlbnNSW4=;
        b=Su5NvZ0PKPncpq8HXve7PAuYAvDrJBNKxFbHEl078BMZe0RTQ2z0g21g4pA+i7aOQl
         R50CWLxH3O/3mD24RrKfbByRX1z13E1YasUEPqo/zYEFCpU3FqcroC086KIEczp7O9VU
         U3Sy/IVsl/eaOTMqgMvDuSR2GOuToiUh9NX6ug60uivt+JORNgnzV34ALhkOYuhQvyUr
         I3F5uURpVWyHF/zdkz2CVHUYk/IUHY/CUuKx8qedAHzZA9UYd+zNV+11OK4Yy/JxqQex
         OKQrY+3ygm1HHKxuiu2lesgT4t97p31NXE5+XsuzcQ9uhoZZPil3swHHbyivqZ3pZWAQ
         8HPg==
X-Gm-Message-State: AOAM531/GVyQl+tXVDBVc4ixCAoJ8p+uPiqNU93E6vQdfdWIo2A8TX2h
        Nk/sK8XZtVFXPeDqsHsBRViHhwmlbi+uZvcQ8Ai2Hs/r/0ry
X-Google-Smtp-Source: ABdhPJwgXM+7TDKj/A9wDo49wFzj2pOPkOJAA/AbHuIWFAq/HPNTSI+WpdwecNe9VodaSAEDeR6DNeqOP7FxnkREtIGeyV5PdOAU
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:e45:: with SMTP id l5mr49838740ilk.294.1609300694489;
 Tue, 29 Dec 2020 19:58:14 -0800 (PST)
Date:   Tue, 29 Dec 2020 19:58:14 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003b5ed705b7a684ad@google.com>
Subject: WARNING in cm109_urb_irq_callback/usb_submit_urb
From:   syzbot <syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        vulab@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    5814bc2d Merge tag 'perf-tools-2020-12-24' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12f074db500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf519e1e96191576
dashboard link: https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com

cm109 2-1:0.0: cm109_urb_irq_callback: urb status -71
------------[ cut here ]------------
URB 0000000096f203b6 submitted while active
WARNING: CPU: 0 PID: 18262 at drivers/usb/core/urb.c:378 usb_submit_urb+0x128e/0x1560 drivers/usb/core/urb.c:378
Modules linked in:
CPU: 0 PID: 18262 Comm: syz-executor.5 Not tainted 5.10.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:usb_submit_urb+0x128e/0x1560 drivers/usb/core/urb.c:378
Code: 89 de e8 55 99 31 fc 84 db 0f 85 74 f4 ff ff e8 68 91 31 fc 4c 89 fe 48 c7 c7 a0 c6 02 8a c6 05 4b 89 28 08 01 e8 f6 1c 89 03 <0f> 0b e9 52 f4 ff ff c7 44 24 14 01 00 00 00 e9 09 f5 ff ff 41 be
RSP: 0018:ffffc900000079e8 EFLAGS: 00010082
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000040000 RSI: ffffffff815b94d5 RDI: fffff52000000f2f
RBP: ffff88802517c4c0 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff815b792b R11: 0000000000000000 R12: 0000000000000012
R13: ffff88801e060058 R14: 00000000fffffff0 R15: ffff88801f2b6500
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2f62d000 CR3: 000000002aba6000 CR4: 00000000001526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 cm109_urb_irq_callback+0x44f/0xaa0 drivers/input/misc/cm109.c:422
 __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x38c/0x430 drivers/usb/core/hcd.c:1728
 dummy_timer+0x11f4/0x32a0 drivers/usb/gadget/udc/dummy_hcd.c:1971
 call_timer_fn+0x1a5/0x710 kernel/time/timer.c:1417
 expire_timers kernel/time/timer.c:1462 [inline]
 __run_timers.part.0+0x692/0xa80 kernel/time/timer.c:1731
 __run_timers kernel/time/timer.c:1712 [inline]
 run_timer_softirq+0xb3/0x1d0 kernel/time/timer.c:1744
 __do_softirq+0x2bc/0xa77 kernel/softirq.c:343
 asm_call_irq_on_stack+0xf/0x20
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:26 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:77 [inline]
 do_softirq_own_stack+0xaa/0xd0 arch/x86/kernel/irq_64.c:77
 invoke_softirq kernel/softirq.c:226 [inline]
 __irq_exit_rcu+0x17f/0x200 kernel/softirq.c:420
 irq_exit_rcu+0x5/0x20 kernel/softirq.c:432
 sysvec_apic_timer_interrupt+0x4d/0x100 arch/x86/kernel/apic/apic.c:1096
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:628
RIP: 0010:check_kcov_mode+0x2c/0x40 kernel/kcov.c:174
Code: 05 09 a8 8e 7e 89 c2 81 e2 00 01 00 00 a9 00 01 ff 00 74 10 31 c0 85 d2 74 15 8b 96 cc 14 00 00 85 d2 74 0b 8b 86 a8 14 00 00 <39> f8 0f 94 c0 c3 0f 1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 31 c0
RSP: 0018:ffffc90014ebf628 EFLAGS: 00000246
RAX: 0000000000000000 RBX: 00000000000001fe RCX: 00000000000000aa
RDX: 0000000000000000 RSI: ffff888066450280 RDI: 0000000000000003
RBP: ffffea00004ca500 R08: 00000000000001fe R09: 00000000004ca500
R10: ffffffff819a63e0 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88802d906560 R14: 00000000000000aa R15: dffffc0000000000
 write_comp_data kernel/kcov.c:218 [inline]
 __sanitizer_cov_trace_cmp4+0x1c/0x70 kernel/kcov.c:258
 release_pages+0x6f0/0x1d60 mm/swap.c:864
 tlb_batch_pages_flush mm/mmu_gather.c:49 [inline]
 tlb_flush_mmu_free mm/mmu_gather.c:242 [inline]
 tlb_flush_mmu+0xe9/0x6b0 mm/mmu_gather.c:249
 zap_pte_range mm/memory.c:1330 [inline]
 zap_pmd_range mm/memory.c:1368 [inline]
 zap_pud_range mm/memory.c:1397 [inline]
 zap_p4d_range mm/memory.c:1418 [inline]
 unmap_page_range+0x1a75/0x2640 mm/memory.c:1439
 unmap_single_vma+0x198/0x300 mm/memory.c:1484
 unmap_vmas+0x168/0x2e0 mm/memory.c:1516
 exit_mmap+0x2b1/0x5a0 mm/mmap.c:3220
 __mmput+0x122/0x470 kernel/fork.c:1083
 mmput+0x53/0x60 kernel/fork.c:1104
 exit_mm kernel/exit.c:500 [inline]
 do_exit+0xa97/0x2a00 kernel/exit.c:810
 do_group_exit+0x125/0x310 kernel/exit.c:920
 get_signal+0x3e9/0x2160 kernel/signal.c:2770
 arch_do_signal_or_restart+0x2a8/0x1eb0 arch/x86/kernel/signal.c:811
 handle_signal_work kernel/entry/common.c:147 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
 exit_to_user_mode_prepare+0x124/0x200 kernel/entry/common.c:201
 __syscall_exit_to_user_mode_work kernel/entry/common.c:291 [inline]
 syscall_exit_to_user_mode+0x19/0x50 kernel/entry/common.c:302
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45e229
Code: Unable to access opcode bytes at RIP 0x45e1ff.
RSP: 002b:00007f2f8ae53cf8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: 0000000000000001 RBX: 000000000119c030 RCX: 000000000045e229
RDX: 00000000000f4240 RSI: 0000000000000081 RDI: 000000000119c034
RBP: 000000000119c028 R08: 000000000000000e R09: 0000000000000000
R10: 0000000000000040 R11: 0000000000000246 R12: 000000000119c034
R13: 00007fffb9d4ee7f R14: 00007f2f8ae549c0 R15: 000000000119c034


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

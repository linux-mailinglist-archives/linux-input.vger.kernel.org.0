Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 701FE17C34F
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 17:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCFQzN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 11:55:13 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:32995 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgCFQzN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 11:55:13 -0500
Received: by mail-io1-f69.google.com with SMTP id a23so1866314ioa.0
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 08:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=HzL7QU7DANWgD4MgzyDPRHVQ+C6++sSLYZjWnM4LCQM=;
        b=ezgIl1d+a98Rgf9+IiQyp07NM2tbFnkoX9z94KibJo7JHNU6om9QVGDXRhNX/5gG7C
         qHcNhfJ7NQ6tYP+L6+vcIbr2Mqv5TNGQMEh3BSWx+gQIifWePn5OB0Tp/V4fDNc/yp2i
         lQDH0SwAFt0Ne/c9/cWUpGdAXiLFcMzvyWI8IAU5fLFsGgb//K6a7lMOpZYQ1aa9oJpw
         UzSfD5e8IsW9Nh2Ifb6HdHJCnSybRcQ+3yecy6C1h3XwCEEiDaHhViWu5PagJRKZWW7t
         6a/WxnfXG6YCKgZDNyAK4DGPIlXCd1DEGc6klTo5yfRI5/f3Pze49aB5TjWqQhWu7FNk
         jUGg==
X-Gm-Message-State: ANhLgQ3Ttcn5NKxZkNX28YS3djlCD7nSjgDji5MpR+FEMajcX7Cygfqe
        OTxWpm4hn0C7ryajcf+O6LzCSkUsix+VJjTeIzsYIsCMaVxi
X-Google-Smtp-Source: ADFU+vu2N21lrsqBQER3DinpW2Fq9TmJ/aiLYSgwZ7urGAJXw3IhvnFjnfBbym4gu0f4qnD+7UW0EyD72qbX2aaMERvRvM1MSflQ
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:791:: with SMTP id q17mr4211822ils.242.1583513712507;
 Fri, 06 Mar 2020 08:55:12 -0800 (PST)
Date:   Fri, 06 Mar 2020 08:55:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000054c0d105a0328487@google.com>
Subject: INFO: trying to register non-static key in uhid_dev_destroy
From:   syzbot <syzbot+0c601d7fbb8122d39093@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, dh.herrmann@googlemail.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    c99b17ac Add linux-next specific files for 20200225
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1652870de00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b7ebe4bd0931c45
dashboard link: https://syzkaller.appspot.com/bug?extid=0c601d7fbb8122d39093
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13abdfa1e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d4670de00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+0c601d7fbb8122d39093@syzkaller.appspotmail.com

INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 0 PID: 23022 Comm: syz-executor318 Not tainted 5.6.0-rc3-next-20200225-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 assign_lock_key kernel/locking/lockdep.c:881 [inline]
 register_lock_class+0x179e/0x1850 kernel/locking/lockdep.c:1193
 __lock_acquire+0xf4/0x6320 kernel/locking/lockdep.c:4072
 lock_acquire+0x190/0x410 kernel/locking/lockdep.c:4720
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x95/0xcd kernel/locking/spinlock.c:159
 __wake_up_common_lock+0xc8/0x150 kernel/sched/wait.c:122
 __wake_up+0xe/0x10 kernel/sched/wait.c:142
 uhid_dev_destroy+0x74/0x110 drivers/hid/uhid.c:563
 uhid_char_release+0x54/0xc0 drivers/hid/uhid.c:642
 __fput+0x2ff/0x890 fs/file_table.c:280
 ____fput+0x16/0x20 fs/file_table.c:313
 task_work_run+0x145/0x1c0 kernel/task_work.c:113
 exit_task_work include/linux/task_work.h:22 [inline]
 do_exit+0xbcb/0x3030 kernel/exit.c:802
 do_group_exit+0x135/0x360 kernel/exit.c:900
 get_signal+0x47c/0x24f0 kernel/signal.c:2734
 do_signal+0x87/0x1700 arch/x86/kernel/signal.c:813
 exit_to_usermode_loop+0x286/0x380 arch/x86/entry/common.c:161
 prepare_exit_to_usermode arch/x86/entry/common.c:196 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:279 [inline]
 do_syscall_64+0x676/0x790 arch/x86/entry/common.c:305
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x446ed9
Code: e8 dc e6 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 2b 06 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ff94dd97cf8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00000000006ddc28 RCX: 0000000000446ed9
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00000000006ddc28
RBP: 00000000006ddc20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006ddc2c
R13: 00007fff9853c74f R14: 00007ff94dd989c0 R15: 0000000000000000
general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 23022 Comm: syz-executor318 Not tainted 5.6.0-rc3-next-20200225-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__wake_up_common+0xdf/0x610 kernel/sched/wait.c:86
Code: 05 00 00 4c 8b 43 38 49 83 e8 18 49 8d 78 18 48 39 7d d0 0f 84 64 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 f9 48 c1 e9 03 <80> 3c 01 00 0f 85 0d 05 00 00 49 8b 40 18 89 55 b0 31 db 49 bc 00
RSP: 0018:ffffc900072df898 EFLAGS: 00010046
RAX: dffffc0000000000 RBX: ffff8880997493c8 RCX: 0000000000000000
RDX: 0000000000000001 RSI: 1ffffffff154c73a RDI: 0000000000000000
RBP: ffffc900072df8f0 R08: ffffffffffffffe8 R09: ffffc900072df940
R10: fffff52000e5bf0c R11: 0000000000000003 R12: 0000000000000001
R13: 0000000000000286 R14: 0000000000000000 R15: 0000000000000001
FS:  00007ff94dd98700(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5d2798b1a0 CR3: 00000000a2813000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __wake_up_common_lock+0xea/0x150 kernel/sched/wait.c:123
 __wake_up+0xe/0x10 kernel/sched/wait.c:142
 uhid_dev_destroy+0x74/0x110 drivers/hid/uhid.c:563
 uhid_char_release+0x54/0xc0 drivers/hid/uhid.c:642
 __fput+0x2ff/0x890 fs/file_table.c:280
 ____fput+0x16/0x20 fs/file_table.c:313
 task_work_run+0x145/0x1c0 kernel/task_work.c:113
 exit_task_work include/linux/task_work.h:22 [inline]
 do_exit+0xbcb/0x3030 kernel/exit.c:802
 do_group_exit+0x135/0x360 kernel/exit.c:900
 get_signal+0x47c/0x24f0 kernel/signal.c:2734
 do_signal+0x87/0x1700 arch/x86/kernel/signal.c:813
 exit_to_usermode_loop+0x286/0x380 arch/x86/entry/common.c:161
 prepare_exit_to_usermode arch/x86/entry/common.c:196 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:279 [inline]
 do_syscall_64+0x676/0x790 arch/x86/entry/common.c:305
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x446ed9
Code: e8 dc e6 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 2b 06 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ff94dd97cf8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00000000006ddc28 RCX: 0000000000446ed9
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00000000006ddc28
RBP: 00000000006ddc20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006ddc2c
R13: 00007fff9853c74f R14: 00007ff94dd989c0 R15: 0000000000000000
Modules linked in:
---[ end trace a0edf4c2b9ab3a41 ]---
RIP: 0010:__wake_up_common+0xdf/0x610 kernel/sched/wait.c:86
Code: 05 00 00 4c 8b 43 38 49 83 e8 18 49 8d 78 18 48 39 7d d0 0f 84 64 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 f9 48 c1 e9 03 <80> 3c 01 00 0f 85 0d 05 00 00 49 8b 40 18 89 55 b0 31 db 49 bc 00
RSP: 0018:ffffc900072df898 EFLAGS: 00010046
RAX: dffffc0000000000 RBX: ffff8880997493c8 RCX: 0000000000000000
RDX: 0000000000000001 RSI: 1ffffffff154c73a RDI: 0000000000000000
RBP: ffffc900072df8f0 R08: ffffffffffffffe8 R09: ffffc900072df940
R10: fffff52000e5bf0c R11: 0000000000000003 R12: 0000000000000001
R13: 0000000000000286 R14: 0000000000000000 R15: 0000000000000001
FS:  00007ff94dd98700(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5d2798b1a0 CR3: 00000000a2813000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

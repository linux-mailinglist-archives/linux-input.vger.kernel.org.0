Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12C2917CB68
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 04:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgCGDFO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 22:05:14 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:37069 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgCGDFN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 22:05:13 -0500
Received: by mail-io1-f71.google.com with SMTP id p4so2819069ioo.4
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 19:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=YYl6JExefSfOEbggY6HfaOvFYm0l87zuFjeztMviPFc=;
        b=oP/LUCTimYLcdW3wrS8Rmyxk8dyO5Pb28Y8z+MFW5ZJNDjVnxIr1RmnjPYu+jGIkkQ
         Ch8dQtBObmHtpNhLTiUTMXgDT9NSeYe/fhbmApDvmKSgKFIo+MlupRYeDt2o/MfAQW27
         dMv9cGXoC3de87cQdPQBJLqGR9h8+knuUetJ7zwDHOKWHLPj4S/AlEC+vbt00YPvG0bl
         UypY6GlBz8gH5y/pQFnymMpK6DTtrr/zcj5kqe0PSZXMkCAHu9f+Bl4vIipV3pcetXtK
         HxbI8AvNoJH4VAp3lv7CVDEZw/xKf9GbDBezbwxzpLE7YvAoU6h4XE+Qcj9tY9S20W8e
         fvdA==
X-Gm-Message-State: ANhLgQ04MRYNSE/CnuzqphMem6/ZfSn1DRW6GsvUnFLkcbq6nbTiTUvq
        tjANt5reXnUAuQetvxYih8qtAoZ15fFvZoVqbintnZxl8dHb
X-Google-Smtp-Source: ADFU+vsj2Biqb2M2UCTaQAg5SpHHDHvNwBUAEDzCSC8MOa3dosXjBDEB+jwJsE4VqcCyc2KugV9COIrQUWKFR9g8T7thzQnNVpUQ
MIME-Version: 1.0
X-Received: by 2002:a92:4e:: with SMTP id 75mr5932841ila.276.1583550311597;
 Fri, 06 Mar 2020 19:05:11 -0800 (PST)
Date:   Fri, 06 Mar 2020 19:05:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ce8d2305a03b0988@google.com>
Subject: INFO: trying to register non-static key in uhid_char_release
From:   syzbot <syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com>
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

HEAD commit:    fb279f4e Merge branch 'i2c/for-current-fixed' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16bc5181e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b13b05f0e61d957
dashboard link: https://syzkaller.appspot.com/bug?extid=8357fbef0d7bb602de45
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com

INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 0 PID: 9870 Comm: syz-executor.1 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1e9/0x30e lib/dump_stack.c:118
 register_lock_class+0x6f4/0xec0 kernel/locking/lockdep.c:443
 __lock_acquire+0x116/0x1bc0 kernel/locking/lockdep.c:3836
 lock_acquire+0x154/0x250 kernel/locking/lockdep.c:4484
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x9e/0xc0 kernel/locking/spinlock.c:159
 __wake_up_common_lock kernel/sched/wait.c:122 [inline]
 __wake_up+0xb8/0x150 kernel/sched/wait.c:142
 uhid_dev_destroy drivers/hid/uhid.c:563 [inline]
 uhid_char_release+0x99/0x600 drivers/hid/uhid.c:642
 __fput+0x2d8/0x730 fs/file_table.c:280
 task_work_run+0x176/0x1b0 kernel/task_work.c:113
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop arch/x86/entry/common.c:164 [inline]
 prepare_exit_to_usermode+0x48a/0x5c0 arch/x86/entry/common.c:195
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x416041
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48 83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48 89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffd2649c0a0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000416041
RDX: 0000001b2f820000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00000000a5a41883 R09: 00000000a5a41887
R10: 00007ffd2649c180 R11: 0000000000000293 R12: 000000000076bf20
R13: 00000000007715a0 R14: 000000000003bd20 R15: 000000000076bf2c
general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 9870 Comm: syz-executor.1 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__wake_up_common+0x297/0x4d0 kernel/sched/wait.c:86
Code: fb 01 00 00 45 31 f6 eb 13 66 2e 0f 1f 84 00 00 00 00 00 4d 39 fc 0f 84 e3 01 00 00 4c 89 fb 49 8d 6f e8 4c 89 f8 48 c1 e8 03 <80> 3c 10 00 74 12 48 89 df e8 eb 48 59 00 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc900049a7d20 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000001 RDI: ffff888048e513c8
RBP: ffffffffffffffe8 R08: 0000000000000000 R09: ffffc900049a7d88
R10: fffff52000934fa4 R11: 0000000000000000 R12: ffff888048e51400
R13: 1ffff92000934fb1 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000ed3940(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2f822000 CR3: 0000000098f9a000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __wake_up_common_lock kernel/sched/wait.c:123 [inline]
 __wake_up+0xd4/0x150 kernel/sched/wait.c:142
 uhid_dev_destroy drivers/hid/uhid.c:563 [inline]
 uhid_char_release+0x99/0x600 drivers/hid/uhid.c:642
 __fput+0x2d8/0x730 fs/file_table.c:280
 task_work_run+0x176/0x1b0 kernel/task_work.c:113
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop arch/x86/entry/common.c:164 [inline]
 prepare_exit_to_usermode+0x48a/0x5c0 arch/x86/entry/common.c:195
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x416041
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48 83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48 89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffd2649c0a0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000416041
RDX: 0000001b2f820000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00000000a5a41883 R09: 00000000a5a41887
R10: 00007ffd2649c180 R11: 0000000000000293 R12: 000000000076bf20
R13: 00000000007715a0 R14: 000000000003bd20 R15: 000000000076bf2c
Modules linked in:
---[ end trace bb22508a82bfb9e5 ]---
RIP: 0010:__wake_up_common+0x297/0x4d0 kernel/sched/wait.c:86
Code: fb 01 00 00 45 31 f6 eb 13 66 2e 0f 1f 84 00 00 00 00 00 4d 39 fc 0f 84 e3 01 00 00 4c 89 fb 49 8d 6f e8 4c 89 f8 48 c1 e8 03 <80> 3c 10 00 74 12 48 89 df e8 eb 48 59 00 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc900049a7d20 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000001 RDI: ffff888048e513c8
RBP: ffffffffffffffe8 R08: 0000000000000000 R09: ffffc900049a7d88
R10: fffff52000934fa4 R11: 0000000000000000 R12: ffff888048e51400
R13: 1ffff92000934fb1 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000ed3940(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2f822000 CR3: 0000000098f9a000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

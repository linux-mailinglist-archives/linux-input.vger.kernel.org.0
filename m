Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E06917E38F
	for <lists+linux-input@lfdr.de>; Mon,  9 Mar 2020 16:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgCIP0L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Mar 2020 11:26:11 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:54486 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgCIP0L (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Mar 2020 11:26:11 -0400
Received: by mail-il1-f198.google.com with SMTP id l10so7587844ilo.21
        for <linux-input@vger.kernel.org>; Mon, 09 Mar 2020 08:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=0ZrYWFYrYRIyPuZCV9HfvTWtZxwXcc5YwAN9ehMm70k=;
        b=a3DyUnxAufFpHgIcfWn5Whqyjm10UEZP2brFlKZ27ZyN4atFVIGMszLrO2h8Clzcuu
         d1REJkggAOV7aEOiR/DdrKUIVCAQX/jW4etdJ/RcKjF4KNcGKOB6HN93mTwAH39f2krx
         06yWgZhevgsVAuwf6Yu+hJTrEtbQE9+AbQWCECO4hUa2Rpe8ZwU6CvVWYQKzWGk4KYyM
         oM9A/ySpFmCkv8IHaK46oNUoI66TdlICZrw8ItoOL7/FZ0pyFiQx6jTJr0AtaDzhQ+lM
         soIRno4+UYS6GF6OzTCZfHCjBii3/HJSrW6xFlN1nDoXaCuj0+2p8RN6JSRlykOK9cao
         3eoQ==
X-Gm-Message-State: ANhLgQ1PmxIAe/9PAvzGyRCB1Un2DB/NM9chbyLbk0TlS2lELrN+WPTc
        XxwYgdV3QmjFYliYdi4M5EMMKpXlRq1ngqT/ee9CWUcoAZE/
X-Google-Smtp-Source: ADFU+vvgz4vvj3MnlsLc9ljKcBGX9T9MhWOau0Vn9c9duGBBgKV0CGQKjIQ8OYDWLWaJ6huKxlZv0ADVODVzcMXwLkY6g3oDGg4O
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:10c6:: with SMTP id s6mr10043517ilj.9.1583767570846;
 Mon, 09 Mar 2020 08:26:10 -0700 (PDT)
Date:   Mon, 09 Mar 2020 08:26:10 -0700
In-Reply-To: <000000000000ce8d2305a03b0988@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007799d505a06d9f81@google.com>
Subject: Re: INFO: trying to register non-static key in uhid_char_release
From:   syzbot <syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, dh.herrmann@googlemail.com,
        ebiggers@kernel.org, hdanton@sina.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    2c523b34 Linux 5.6-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150bce55e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5295e161cd85b82
dashboard link: https://syzkaller.appspot.com/bug?extid=8357fbef0d7bb602de45
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b439c3e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16dc6fb5e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com

INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 0 PID: 10346 Comm: syz-executor364 Not tainted 5.6.0-rc5-syzkaller #0
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
 exit_task_work include/linux/task_work.h:22 [inline]
 do_exit+0x5ef/0x1f80 kernel/exit.c:801
 do_group_exit+0x15e/0x2c0 kernel/exit.c:899
 __do_sys_exit_group+0x13/0x20 kernel/exit.c:910
 __se_sys_exit_group+0x10/0x10 kernel/exit.c:908
 __x64_sys_exit_group+0x37/0x40 kernel/exit.c:908
 do_syscall_64+0xf3/0x1b0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4403d8
Code: 00 00 be 3c 00 00 00 eb 19 66 0f 1f 84 00 00 00 00 00 48 89 d7 89 f0 0f 05 48 3d 00 f0 ff ff 77 21 f4 48 89 d7 44 89 c0 0f 05 <48> 3d 00 f0 ff ff 76 e0 f7 d8 64 41 89 01 eb d8 0f 1f 84 00 00 00
RSP: 002b:00007ffd67f7d928 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004403d8
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004c0d90 R08: 00000000000000e7 R09: ffffffffffffffd4
R10: 0000000000402570 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d3180 R14: 0000000000000000 R15: 0000000000000000
general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 10346 Comm: syz-executor364 Not tainted 5.6.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__wake_up_common+0x297/0x4d0 kernel/sched/wait.c:86
Code: fb 01 00 00 45 31 f6 eb 13 66 2e 0f 1f 84 00 00 00 00 00 4d 39 fc 0f 84 e3 01 00 00 4c 89 fb 49 8d 6f e8 4c 89 f8 48 c1 e8 03 <80> 3c 10 00 74 12 48 89 df e8 eb 4e 59 00 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc90001687c10 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000001 RDI: ffff888091fe13c8
RBP: ffffffffffffffe8 R08: 0000000000000000 R09: ffffc90001687c78
R10: fffff520002d0f82 R11: 0000000000000000 R12: ffff888091fe1400
R13: 1ffff920002d0f8f R14: 0000000000000000 R15: 0000000000000000
FS:  00000000023ec940(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000088 CR3: 0000000096b74000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __wake_up_common_lock kernel/sched/wait.c:123 [inline]
 __wake_up+0xd4/0x150 kernel/sched/wait.c:142
 uhid_dev_destroy drivers/hid/uhid.c:563 [inline]
 uhid_char_release+0x99/0x600 drivers/hid/uhid.c:642
 __fput+0x2d8/0x730 fs/file_table.c:280
 task_work_run+0x176/0x1b0 kernel/task_work.c:113
 exit_task_work include/linux/task_work.h:22 [inline]
 do_exit+0x5ef/0x1f80 kernel/exit.c:801
 do_group_exit+0x15e/0x2c0 kernel/exit.c:899
 __do_sys_exit_group+0x13/0x20 kernel/exit.c:910
 __se_sys_exit_group+0x10/0x10 kernel/exit.c:908
 __x64_sys_exit_group+0x37/0x40 kernel/exit.c:908
 do_syscall_64+0xf3/0x1b0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4403d8
Code: 00 00 be 3c 00 00 00 eb 19 66 0f 1f 84 00 00 00 00 00 48 89 d7 89 f0 0f 05 48 3d 00 f0 ff ff 77 21 f4 48 89 d7 44 89 c0 0f 05 <48> 3d 00 f0 ff ff 76 e0 f7 d8 64 41 89 01 eb d8 0f 1f 84 00 00 00
RSP: 002b:00007ffd67f7d928 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004403d8
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004c0d90 R08: 00000000000000e7 R09: ffffffffffffffd4
R10: 0000000000402570 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d3180 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace 6b49c4c2b7708f14 ]---
RIP: 0010:__wake_up_common+0x297/0x4d0 kernel/sched/wait.c:86
Code: fb 01 00 00 45 31 f6 eb 13 66 2e 0f 1f 84 00 00 00 00 00 4d 39 fc 0f 84 e3 01 00 00 4c 89 fb 49 8d 6f e8 4c 89 f8 48 c1 e8 03 <80> 3c 10 00 74 12 48 89 df e8 eb 4e 59 00 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc90001687c10 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000001 RDI: ffff888091fe13c8
RBP: ffffffffffffffe8 R08: 0000000000000000 R09: ffffc90001687c78
R10: fffff520002d0f82 R11: 0000000000000000 R12: ffff888091fe1400
R13: 1ffff920002d0f8f R14: 0000000000000000 R15: 0000000000000000
FS:  00000000023ec940(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000088 CR3: 0000000096b74000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


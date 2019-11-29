Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A46D10D45A
	for <lists+linux-input@lfdr.de>; Fri, 29 Nov 2019 11:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfK2KpI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Nov 2019 05:45:08 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:56104 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2KpI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Nov 2019 05:45:08 -0500
Received: by mail-il1-f198.google.com with SMTP id p21so16970843ilk.22
        for <linux-input@vger.kernel.org>; Fri, 29 Nov 2019 02:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Bw33hhNzZEtxI5gaN0FGG4Keg1bv9uMPlinqIyGbtFw=;
        b=FShM7HpzQET6wWhMJ+s/LQ4T7Hh1VvAGFJt0Y5CWopzq9qydMpLfx2D4hUjJFH8Arj
         ocStec6qh5Oylm2+jES8v35Zqm3epL/bQ045dkRnHvfDaSrCUykf0vF4Hnc9pTsskL3q
         vprdJmG5wTn5J70WGLuK4lOdd2zSeAYkmrT7E0E7dOi2QOxVnucWRSc0T3fJfm09W9hA
         KKoQ5hmrQtyQ3BjfMmAzfFJKNFvNSSnRWA4IuIKj/NPko64ESV/yL7rB9bbG7ADS97yc
         KjCybPoYjA3xjuwXiwPmcZDiqRNZ+1jw2agvPUzNqyEla5a5V2AzXW9MKJlg/dDBLmec
         GI6Q==
X-Gm-Message-State: APjAAAXruzuoYSwQIbdpjs0THfMp1vm4wncY14Wk4HJ6xT7hfNMBD5uD
        ATCxLrKSCd12hHJVGE06OxnWyu0B6luzIzoUSp9or5V9cXPz
X-Google-Smtp-Source: APXvYqzdXhARdHUXX+6Lh4o76WapDekObV1V0y7Not6A1Zwb11zfXS/Q7Qhfzur3k2GD9C9hlWQpP7WtQr3FTKcisTjDADpSgZ7e
MIME-Version: 1.0
X-Received: by 2002:a92:601:: with SMTP id x1mr15052392ilg.35.1575024307211;
 Fri, 29 Nov 2019 02:45:07 -0800 (PST)
Date:   Fri, 29 Nov 2019 02:45:07 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000581524059879ecad@google.com>
Subject: general protection fault in timer_is_static_object
From:   syzbot <syzbot+76f3a30e88d256644c78@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    da06441b usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=150eedeee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
dashboard link: https://syzkaller.appspot.com/bug?extid=76f3a30e88d256644c78
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1205c8a2e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1107b76ae00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+76f3a30e88d256644c78@syzkaller.appspotmail.com

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 0 PID: 1713 Comm: syz-executor493 Not tainted 5.4.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:timer_is_static_object+0x20/0x90 kernel/time/timer.c:612
Code: 66 2e 0f 1f 84 00 00 00 00 00 41 54 53 48 89 fb e8 b5 50 0f 00 48 8d  
7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75  
4f 45 31 e4 48 83 7b 08 00 74 0c e8 8b 50 0f 00 44
RSP: 0018:ffff8881d0397af8 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: 0000000000004060 RCX: 0000000000000000
RDX: 000000000000080d RSI: ffffffff812ed5ab RDI: 0000000000004068
RBP: ffff8881d0397c00 R08: ffff8881d1bdc800 R09: fffffbfff1230886
R10: fffffbfff1230885 R11: ffffffff8918442b R12: 0000000000000003
R13: dffffc0000000000 R14: 1ffff1103a072f66 R15: 0000000000004060
FS:  0000000001020880(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000043ff90 CR3: 00000001d1ac0000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  debug_object_assert_init lib/debugobjects.c:862 [inline]
  debug_object_assert_init+0x1f9/0x2f0 lib/debugobjects.c:837
  debug_timer_assert_init kernel/time/timer.c:729 [inline]
  debug_assert_init kernel/time/timer.c:774 [inline]
  del_timer+0x6d/0x100 kernel/time/timer.c:1196
  try_to_grab_pending+0x67/0x7b0 kernel/workqueue.c:1251
  __cancel_work_timer+0xa6/0x460 kernel/workqueue.c:3086
  input_close_device+0xd2/0x1a0 drivers/input/input.c:679
  evdev_close_device drivers/input/evdev.c:428 [inline]
  evdev_release+0x188/0x1c0 drivers/input/evdev.c:466
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4022c0
Code: 01 f0 ff ff 0f 83 40 0d 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f  
44 00 00 83 3d 6d aa 2d 00 00 75 14 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 14 0d 00 00 c3 48 83 ec 08 e8 7a 02 00 00
RSP: 002b:00007ffc860c7068 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000005 RCX: 00000000004022c0
RDX: 00000000200000c0 RSI: 0000000040284504 RDI: 0000000000000004
RBP: 00007ffc860c7090 R08: 7d03000000008300 R09: 0000000000000000
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000004 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace cf0e86e9ac328099 ]---
RIP: 0010:timer_is_static_object+0x20/0x90 kernel/time/timer.c:612
Code: 66 2e 0f 1f 84 00 00 00 00 00 41 54 53 48 89 fb e8 b5 50 0f 00 48 8d  
7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75  
4f 45 31 e4 48 83 7b 08 00 74 0c e8 8b 50 0f 00 44
RSP: 0018:ffff8881d0397af8 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: 0000000000004060 RCX: 0000000000000000
RDX: 000000000000080d RSI: ffffffff812ed5ab RDI: 0000000000004068
RBP: ffff8881d0397c00 R08: ffff8881d1bdc800 R09: fffffbfff1230886
R10: fffffbfff1230885 R11: ffffffff8918442b R12: 0000000000000003
R13: dffffc0000000000 R14: 1ffff1103a072f66 R15: 0000000000004060
FS:  0000000001020880(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000043ff90 CR3: 00000001d1ac0000 CR4: 00000000001406f0
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

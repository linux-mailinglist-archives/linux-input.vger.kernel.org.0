Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1599979121
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 18:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbfG2QiH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 12:38:07 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:43914 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfG2QiH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 12:38:07 -0400
Received: by mail-io1-f72.google.com with SMTP id q26so68061098ioi.10
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2019 09:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=wGtsh4LHVqfKGzY145InjKGz5bNHgbf3FLGwAMZ6gLQ=;
        b=BiJr7jO0mxL+uUFWryAMY8bMYG2dy2Es0ddG7rtzEANB4z1yASf1T3mKaRWALQ1EAR
         h1yzAwsMkB3BI6I+jl5QsaL8M9Bkys1Fptsy95GvQB5X79ZYL7RLA7Oyg6NJKsTeJ+Eh
         vCROhXr1uWUmcoEgzzZM7ra0hNx4ZREDsN5HKb5qeRQFnzWLl7Z4329OVabqSHgOa5le
         /Rn5SSmwMyEzkaZ1nKqU4wX3Pw0RS/afjI3fZMM2EsrGCBhcNbDv2z1Tq/rXjud/JwzE
         fkfwufribseD/n5mdYTt23COT8VY/feOzHc10HbCdgpYK9tmlk+T6kLyvVeDsAHxkwIl
         iW2w==
X-Gm-Message-State: APjAAAXFinQd2Ru2c5yvS60zgZ/cS9RXQqDRLLslvwIEQuiRaEpyVIns
        PtuLrM4C0NgXX3Aw9Ve857ggLzquzk2EaYNUXCCjshBgx16Q
X-Google-Smtp-Source: APXvYqwxx3vJ6RmdfNcXCsQ3loSDEEjsGDpw2kG0TqsxPvnMbEdFJV4h/UsG+b1nZf4yl9FpYvgEEbT/7CHEw2g3WQRYJ6bxEeEl
MIME-Version: 1.0
X-Received: by 2002:a5d:87c6:: with SMTP id q6mr32794880ios.115.1564418286108;
 Mon, 29 Jul 2019 09:38:06 -0700 (PDT)
Date:   Mon, 29 Jul 2019 09:38:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000394df0058ed48487@google.com>
Subject: WARNING in usbtouch_open
From:   syzbot <syzbot+199ea16c7f26418b4365@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        kstewart@linuxfoundation.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mpe@ellerman.id.au, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1503f4ec600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
dashboard link: https://syzkaller.appspot.com/bug?extid=199ea16c7f26418b4365
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=173e4442600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115482b2600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+199ea16c7f26418b4365@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 1724 at kernel/locking/mutex.c:912 __mutex_lock_common  
kernel/locking/mutex.c:912 [inline]
WARNING: CPU: 0 PID: 1724 at kernel/locking/mutex.c:912  
__mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 1724 Comm: syz-executor025 Not tainted 5.3.0-rc2+ #23
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x2a3/0x6da kernel/panic.c:219
  __warn.cold+0x20/0x4a kernel/panic.c:576
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:912 [inline]
RIP: 0010:__mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
Code: d2 0f 85 f6 05 00 00 44 8b 05 bb 99 0a 02 45 85 c0 0f 85 0a f4 ff ff  
48 c7 c6 00 87 a6 85 48 c7 c7 a0 84 a6 85 e8 f4 24 b8 fb <0f> 0b e9 f0 f3  
ff ff 65 48 8b 1c 25 00 ef 01 00 be 08 00 00 00 48
RSP: 0018:ffff8881d29cf740 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff812830fd RDI: ffffed103a539eda
RBP: ffff8881d29cf8b0 R08: ffff8881d3e84800 R09: fffffbfff0d5eb25
R10: fffffbfff0d5eb24 R11: ffffffff86af5923 R12: 0000000000000000
R13: dffffc0000000000 R14: ffff8881d33cdbc8 R15: ffff8881d3e97140
  usbtouch_open+0x101/0x310 drivers/input/touchscreen/usbtouchscreen.c:1537
  input_open_device+0x170/0x280 drivers/input/input.c:607
  evdev_open_device drivers/input/evdev.c:433 [inline]
  evdev_open+0x3fe/0x510 drivers/input/evdev.c:518
  chrdev_open+0x219/0x5c0 fs/char_dev.c:414
  do_dentry_open+0x494/0x1120 fs/open.c:797
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3f50 fs/namei.c:3533
  do_filp_open+0x1a1/0x280 fs/namei.c:3563
  do_sys_open+0x3c0/0x580 fs/open.c:1089
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4011f0
Code: 01 f0 ff ff 0f 83 00 0b 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f  
44 00 00 83 3d 9d 4b 2d 00 00 75 14 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 d4 0a 00 00 c3 48 83 ec 08 e8 3a 00 00 00
RSP: 002b:00007ffc88d90d38 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 0000000000000124 RCX: 00000000004011f0
RDX: 0000000000000000 RSI: 0000000000020000 RDI: 00007ffc88d90d40
RBP: 6666666666666667 R08: 000000000000000f R09: 0000000000000023
R10: 0000000000000075 R11: 0000000000000246 R12: 0000000000402150
R13: 00000000004021e0 R14: 0000000000000000 R15: 0000000000000000
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

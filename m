Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7096F1008FD
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2019 17:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKRQPL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Nov 2019 11:15:11 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:38417 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbfKRQPK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Nov 2019 11:15:10 -0500
Received: by mail-il1-f198.google.com with SMTP id f6so16721338ilg.5
        for <linux-input@vger.kernel.org>; Mon, 18 Nov 2019 08:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=lsUFo3ehvZYNop+yjFrOvo2a1EkwfkjExK3zYnbPyCU=;
        b=XE1NlsOhNsd2pdmhlAYNRgUZRkG6HyIo+zBAPPvnw8AW2YgMYQJ9n2QTFTxYo5OhTf
         v4c5KtZGx6jv1Tx2PwXgHuVLAPMx0Il3P6egNb2rQGYU6DR364biKcrgDiu8FqJ+Th4u
         YUoKy7Z8NvBb5qHfNARMkBdI/GCufTpZjv/H73sRopI5X88m7UVZjcylXQ1e1cfQSejL
         uTZRHGjpmw+Si/WDYUXaldF5U9/kPZdQ00yIV0WOCCTliZ1R+Lk/gcYYG0hq3yYr5pTC
         orgG0PkxeIQTt9K8hilFLCUkABJBFjnWzCcobAsIPxM/85WPJiwK0HzbXLK9X29cBUoZ
         9x3Q==
X-Gm-Message-State: APjAAAXFBpby02f0wfL4K7M3HI7+a5f2OS1uJ1t5hDeL26MhzDiZhRyi
        rf6TvY3sBtT4HOqPgM6Nhfj64vyO3h3zhJGIIDsmvHBQQxQP
X-Google-Smtp-Source: APXvYqwDt/8aI9wREsziYf0WUt5rhKjTWo66At9tvjk9LwhclVgnnlFz1Peva2f1fnO38yIf730an+1+T6KwWCLiSBBiciF9WmSV
MIME-Version: 1.0
X-Received: by 2002:a02:1ac5:: with SMTP id 188mr13958088jai.77.1574093710011;
 Mon, 18 Nov 2019 08:15:10 -0800 (PST)
Date:   Mon, 18 Nov 2019 08:15:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006db5bf0597a14058@google.com>
Subject: BUG: spinlock already unlocked in input_set_keycode
From:   syzbot <syzbot+c769968809f9359b07aa@syzkaller.appspotmail.com>
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

HEAD commit:    46178223 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=144b2c6ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
dashboard link: https://syzkaller.appspot.com/bug?extid=c769968809f9359b07aa
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15162dc2e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11976abae00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c769968809f9359b07aa@syzkaller.appspotmail.com

BUG: spinlock already unlocked on CPU#0, syz-executor217/1716
  lock: 0xffff8881cfeb5210, .magic: dead4ead, .owner:  
syz-executor217/1716, .owner_cpu: 0
CPU: 0 PID: 1716 Comm: syz-executor217 Not tainted 5.4.0-rc6+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  spin_bug kernel/locking/spinlock_debug.c:75 [inline]
  debug_spin_unlock kernel/locking/spinlock_debug.c:98 [inline]
  do_raw_spin_unlock+0x163/0x220 kernel/locking/spinlock_debug.c:138
  __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:159 [inline]
  _raw_spin_unlock_irqrestore+0x23/0x50 kernel/locking/spinlock.c:191
  spin_unlock_irqrestore include/linux/spinlock.h:393 [inline]
  input_set_keycode+0x125/0x320 drivers/input/input.c:958
  evdev_handle_set_keycode_v2+0xc4/0x120 drivers/input/evdev.c:882
  evdev_do_ioctl drivers/input/evdev.c:1150 [inline]
  evdev_ioctl_handler+0xd49/0x19f0 drivers/input/evdev.c:1284
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x444ca9
Code: e8 bc af 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 1b d8 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffc61f97448 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000444ca9
RDX: 0000000020000140 RSI: 0000000040284504 RDI: 0000000000000004
RBP: 00000000006cf018 R08: 090b000000008300 R09: 00000000004002e0
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000402950
R13: 00000000004029e0 R14: 0000000000000000 R15: 0000000000000000
------------[ cut here ]------------
pvqspinlock: lock 0xffff8881cfeb5210 has corrupted value 0x0!
WARNING: CPU: 0 PID: 1716 at kernel/locking/qspinlock_paravirt.h:498  
__pv_queued_spin_unlock_slowpath+0x1c0/0x220  
kernel/locking/qspinlock_paravirt.h:498


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

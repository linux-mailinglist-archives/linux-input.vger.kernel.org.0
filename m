Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092B88328A
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 15:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfHFNSK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Aug 2019 09:18:10 -0400
Received: from mail-oi1-f197.google.com ([209.85.167.197]:44765 "EHLO
        mail-oi1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731580AbfHFNSK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Aug 2019 09:18:10 -0400
Received: by mail-oi1-f197.google.com with SMTP id b124so34811457oii.11
        for <linux-input@vger.kernel.org>; Tue, 06 Aug 2019 06:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=zIP/7/kBh5cwARWCpWI2PG/2mjoUMpPazLjAdGSlZso=;
        b=KN6PSLdFPaASU681f3dP1lwK3YJbdEwMzbqCMm1A5jUiBzNliZMAtN4FLxVhm/R/RU
         MS/jJdiFMVeU8r3SEUPRTNGqFxTXwapbNWOjulppqNlgraF+VheLizV/EmWfqyHvyqWk
         Kebs47vUZUCF9xXZPlwkWMPMZADbLKprlT6s03EvOTvB0uy0BA+BuzoJP3k3NlPL4hCg
         vu1h4nVh7Z6pXRDKnV3BbH2HPkKJNgzIQr1cO6bjes0Uprdv8I5z04USfKuPEXpXp00q
         pr59xomXs/wpdZhVTtuu8Tw5aVnX/EL2nb5Cg7+VOBJAXe4nE8mbyEE7Ptjokj7rWqEK
         Lg3g==
X-Gm-Message-State: APjAAAUnGwE7R71hhnJAsCRkHBXRuUJI1KAYf7uJhQLUcQ5TMUQQS/2r
        jpmd431IpfrSwxBDYSXgMtxhmpgaYPEyWLzDQJ1DGw7AUHuL
X-Google-Smtp-Source: APXvYqzdLq3LQvJtdWMYJwfRGfH7c3xB94MmSJPy5e1Nxac/pFzKwoYo3Sii3ayuyfbdOkhU3K9E4vCM1d2Brcp7rFQd4JVHyuUR
MIME-Version: 1.0
X-Received: by 2002:a02:a703:: with SMTP id k3mr4112789jam.12.1565097488423;
 Tue, 06 Aug 2019 06:18:08 -0700 (PDT)
Date:   Tue, 06 Aug 2019 06:18:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d6225c058f72a7df@google.com>
Subject: KASAN: slab-out-of-bounds Read in usbhid_close
From:   syzbot <syzbot+3268ee512f866a903602@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=117a9f42600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=3268ee512f866a903602
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+3268ee512f866a903602@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in __lock_acquire+0x302a/0x3b50  
kernel/locking/lockdep.c:3753
Read of size 8 at addr ffff8881ceab68a0 by task syz-executor.0/3352

CPU: 1 PID: 3352 Comm: syz-executor.0 Not tainted 5.3.0-rc2+ #25
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  __lock_acquire+0x302a/0x3b50 kernel/locking/lockdep.c:3753
  lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
  __raw_spin_lock_irq include/linux/spinlock_api_smp.h:128 [inline]
  _raw_spin_lock_irq+0x2d/0x40 kernel/locking/spinlock.c:167
  spin_lock_irq include/linux/spinlock.h:363 [inline]
  usbhid_close+0x51/0x210 drivers/hid/usbhid/hid-core.c:740
  hid_hw_close+0xa8/0xd0 drivers/hid/hid-core.c:2046
  drop_ref.part.0+0x32/0xe0 drivers/hid/hidraw.c:337
  drop_ref drivers/hid/hidraw.c:360 [inline]
  hidraw_release+0x34f/0x440 drivers/hid/hidraw.c:356
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  exit_task_work include/linux/task_work.h:22 [inline]
  do_exit+0x8ef/0x2c50 kernel/exit.c:878
  do_group_exit+0x125/0x340 kernel/exit.c:982
  get_signal+0x466/0x23d0 kernel/signal.c:2728
  do_signal+0x88/0x14e0 arch/x86/kernel/signal.c:815
  exit_to_usermode_loop+0x1a2/0x200 arch/x86/entry/common.c:159
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459829
Code: Bad RIP value.
RSP: 002b:00007f123439dcf8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 000000000075bf28 RCX: 0000000000459829
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 000000000075bf28
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000075bf2c
R13: 00007ffe9281699f R14: 00007f123439e9c0 R15: 000000000075bf2c

Allocated by task 0:
(stack is not available)

Freed by task 0:
(stack is not available)

The buggy address belongs to the object at ffff8881ceab6880
  which belongs to the cache shmem_inode_cache of size 1168
The buggy address is located 32 bytes inside of
  1168-byte region [ffff8881ceab6880, ffff8881ceab6d10)
The buggy address belongs to the page:
page:ffffea00073aad00 refcount:1 mapcount:0 mapping:ffff8881da115180  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da115180
raw: 0000000000000000 00000000800c000c 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881ceab6780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881ceab6800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8881ceab6880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                ^
  ffff8881ceab6900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881ceab6980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

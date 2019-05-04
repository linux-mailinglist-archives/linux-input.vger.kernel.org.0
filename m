Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2628613B84
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2019 20:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfEDSQH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 May 2019 14:16:07 -0400
Received: from mail-it1-f199.google.com ([209.85.166.199]:54619 "EHLO
        mail-it1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfEDSQH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 May 2019 14:16:07 -0400
Received: by mail-it1-f199.google.com with SMTP id w1so7788949itk.4
        for <linux-input@vger.kernel.org>; Sat, 04 May 2019 11:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=S/cnjDOSGsn0l4dMWgo5uRG7LAxhakwmbLjY1wCcSl4=;
        b=HdGxV+uBid0bOG9xHWu6m9YrDjEXRCyu9S1zBO6EdZZA6qe9H7xenEaJx9AkCCQSdY
         Yrh6cYQ65EL8bJNPCrxH2oGWRaFo9UneDsQwPZPxZhKQ+y2rimb+rCruFUhvuTI/vIAd
         F59VICf1M3C4swkg90xeSKhmF+V9jtWL7wDi5i/9aMeKhEf+FZa/VeVvXPaOfOZVu6ld
         8McXhKlqmKHZcYuONuN1CdImd3oO7wgL0bXYNt/bBq71lMfrBlVMa5j82x6LGkMrAr7n
         7Pp56e2bF590uDQ/CetqClradniFe9K3QHsWs/gdSTKSfhdIdaNZj8QtAmlA4JWa3tYf
         qEnw==
X-Gm-Message-State: APjAAAWbbvnqHjqQNhndKIm3hzGyneofJhElizgCaL4G/PUDSVV04BhF
        nrPtBc9Hgubw5itvHMNdK9PxtRU8/9bYob3GaV2+KPDnnb5p
X-Google-Smtp-Source: APXvYqxwqatkJqjSR71+7EO657g/8jPkW5m2EBcPxsqns1o+wos/AQj+wiLTFhOl9jzoBt+AyIzSxGVj5TBX7YJ1RIIVMVu7UgcZ
MIME-Version: 1.0
X-Received: by 2002:a02:6411:: with SMTP id t17mr12603884jac.90.1556993765902;
 Sat, 04 May 2019 11:16:05 -0700 (PDT)
Date:   Sat, 04 May 2019 11:16:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000559435058813dc8d@google.com>
Subject: KASAN: use-after-free Read in add_uevent_var
From:   syzbot <syzbot+6da9575ba2db4da91831@syzkaller.appspotmail.com>
To:     airlied@linux.ie, dmitry.torokhov@gmail.com,
        dri-devel@lists.freedesktop.org, hpa@zytor.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, patrik.r.jakobsson@gmail.com,
        rydberg@bitmath.org, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, wsa@the-dreams.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    a4ccb5f9 Merge tag 'drm-fixes-2019-05-03' of git://anongit..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1205d570a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2bd0da4b8de0b004
dashboard link: https://syzkaller.appspot.com/bug?extid=6da9575ba2db4da91831
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1769f62ca00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=167ae984a00000

The bug was bisected to:

commit 0a1c7959acd9674a0e4e59f911f3e5fbf25fd693
Author: Wolfram Sang <wsa@the-dreams.de>
Date:   Wed May 17 15:22:18 2017 +0000

     gpu: drm: tc35876x: move header file out of I2C realm

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=138fe12ca00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=104fe12ca00000
console output: https://syzkaller.appspot.com/x/log.txt?x=178fe12ca00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6da9575ba2db4da91831@syzkaller.appspotmail.com
Fixes: 0a1c7959acd9 ("gpu: drm: tc35876x: move header file out of I2C  
realm")

RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000005502
RDX: 0000000000000000 RSI: 00000000080daf20 RDI: 00000000080f0f84
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
==================================================================
BUG: KASAN: use-after-free in string+0x208/0x230 lib/vsprintf.c:606
Read of size 1 at addr ffff8880a55aa200 by task syz-executor222/7839

CPU: 1 PID: 7839 Comm: syz-executor222 Not tainted 5.1.0-rc7+ #98
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  print_address_description.cold+0x7c/0x20d mm/kasan/report.c:187
  kasan_report.cold+0x1b/0x40 mm/kasan/report.c:317
  __asan_report_load1_noabort+0x14/0x20 mm/kasan/generic_report.c:129
  string+0x208/0x230 lib/vsprintf.c:606
  vsnprintf+0xbfc/0x1af0 lib/vsprintf.c:2396
  add_uevent_var+0x14d/0x310 lib/kobject_uevent.c:661
  input_dev_uevent+0x163/0x890 drivers/input/input.c:1594
  dev_uevent+0x312/0x580 drivers/base/core.c:1180
  kobject_uevent_env+0x487/0x1030 lib/kobject_uevent.c:549
  kobject_uevent+0x20/0x26 lib/kobject_uevent.c:638
  kobject_cleanup lib/kobject.c:649 [inline]
  kobject_release lib/kobject.c:691 [inline]
  kref_put include/linux/kref.h:67 [inline]
  kobject_put.cold+0x177/0x2ec lib/kobject.c:708
  put_device+0x20/0x30 drivers/base/core.c:2205
  input_put_device include/linux/input.h:349 [inline]
  evdev_free+0x51/0x70 drivers/input/evdev.c:369
  device_release+0x7d/0x210 drivers/base/core.c:1064
  kobject_cleanup lib/kobject.c:662 [inline]
  kobject_release lib/kobject.c:691 [inline]
  kref_put include/linux/kref.h:67 [inline]
  kobject_put.cold+0x28f/0x2ec lib/kobject.c:708
  cdev_default_release+0x41/0x50 fs/char_dev.c:607
  kobject_cleanup lib/kobject.c:662 [inline]
  kobject_release lib/kobject.c:691 [inline]
  kref_put include/linux/kref.h:67 [inline]
  kobject_put.cold+0x28f/0x2ec lib/kobject.c:708
  cdev_put.part.0+0x39/0x50 fs/char_dev.c:368
  cdev_put+0x20/0x30 fs/char_dev.c:366
  __fput+0x6df/0x8d0 fs/file_table.c:281
  ____fput+0x16/0x20 fs/file_table.c:309
  task_work_run+0x14a/0x1c0 kernel/task_work.c:113
  exit_task_work include/linux/task_work.h:22 [inline]
  do_exit+0x90a/0x2fa0 kernel/exit.c:876
  do_group_exit+0x135/0x370 kernel/exit.c:980
  __do_sys_exit_group kernel/exit.c:991 [inline]
  __se_sys_exit_group kernel/exit.c:989 [inline]
  __ia32_sys_exit_group+0x44/0x50 kernel/exit.c:989
  do_syscall_32_irqs_on arch/x86/entry/common.c:326 [inline]
  do_fast_syscall_32+0x281/0xc98 arch/x86/entry/common.c:397
  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
RIP: 0023:0xf7ff7849
Code: 85 d2 74 02 89 0a 5b 5d c3 8b 04 24 c3 8b 14 24 c3 8b 3c 24 c3 90 90  
90 90 90 90 90 90 90 90 90 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90  
90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000fff2db8c EFLAGS: 00000292 ORIG_RAX: 00000000000000fc
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000080f1298
RDX: 0000000000000000 RSI: 00000000080daf1c RDI: 00000000080f12a0
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 7839:
  save_stack+0x45/0xd0 mm/kasan/common.c:75
  set_track mm/kasan/common.c:87 [inline]
  __kasan_kmalloc mm/kasan/common.c:497 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:470
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:511
  __do_kmalloc mm/slab.c:3727 [inline]
  __kmalloc_track_caller+0x158/0x740 mm/slab.c:3742
  kstrndup+0x5f/0xf0 mm/util.c:96
  uinput_dev_setup+0x1d4/0x310 drivers/input/misc/uinput.c:475
  uinput_ioctl_handler.isra.0+0x12b8/0x1cc0 drivers/input/misc/uinput.c:886
  uinput_compat_ioctl+0x70/0x90 drivers/input/misc/uinput.c:1062
  __do_compat_sys_ioctl fs/compat_ioctl.c:1052 [inline]
  __se_compat_sys_ioctl fs/compat_ioctl.c:998 [inline]
  __ia32_compat_sys_ioctl+0x197/0x620 fs/compat_ioctl.c:998
  do_syscall_32_irqs_on arch/x86/entry/common.c:326 [inline]
  do_fast_syscall_32+0x281/0xc98 arch/x86/entry/common.c:397
  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139

Freed by task 7839:
  save_stack+0x45/0xd0 mm/kasan/common.c:75
  set_track mm/kasan/common.c:87 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:459
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:467
  __cache_free mm/slab.c:3499 [inline]
  kfree+0xcf/0x230 mm/slab.c:3822
  uinput_destroy_device+0xf8/0x250 drivers/input/misc/uinput.c:311
  uinput_ioctl_handler.isra.0+0x886/0x1cc0 drivers/input/misc/uinput.c:882
  uinput_compat_ioctl+0x70/0x90 drivers/input/misc/uinput.c:1062
  __do_compat_sys_ioctl fs/compat_ioctl.c:1052 [inline]
  __se_compat_sys_ioctl fs/compat_ioctl.c:998 [inline]
  __ia32_compat_sys_ioctl+0x197/0x620 fs/compat_ioctl.c:998
  do_syscall_32_irqs_on arch/x86/entry/common.c:326 [inline]
  do_fast_syscall_32+0x281/0xc98 arch/x86/entry/common.c:397
  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139

The buggy address belongs to the object at ffff8880a55aa200
  which belongs to the cache kmalloc-32 of size 32
The buggy address is located 0 bytes inside of
  32-byte region [ffff8880a55aa200, ffff8880a55aa220)
The buggy address belongs to the page:
page:ffffea0002956a80 count:1 mapcount:0 mapping:ffff8880aa4001c0  
index:0xffff8880a55aafc1
flags: 0x1fffc0000000200(slab)
raw: 01fffc0000000200 ffffea0002949e88 ffffea00029482c8 ffff8880aa4001c0
raw: ffff8880a55aafc1 ffff8880a55aa000 0000000100000039 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8880a55aa100: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
  ffff8880a55aa180: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
> ffff8880a55aa200: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
                    ^
  ffff8880a55aa280: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
  ffff8880a55aa300: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

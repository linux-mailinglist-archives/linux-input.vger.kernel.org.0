Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E5C1DFE52
	for <lists+linux-input@lfdr.de>; Sun, 24 May 2020 12:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729362AbgEXKYP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 May 2020 06:24:15 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:52545 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728984AbgEXKYO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 May 2020 06:24:14 -0400
Received: by mail-il1-f199.google.com with SMTP id m7so12844503ill.19
        for <linux-input@vger.kernel.org>; Sun, 24 May 2020 03:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=aQ2R90lcBZ5pzqo7KH+THps7IFll5Sr+F8zeDKtgZJM=;
        b=i+rFjk9g0FNNcBxLwii2EWQDv7QAtFIS25bEs0zOa4eaxRlha7Drv8AdoKiQ0+sd/N
         ULWsckDGN3L/AVJItJcqzvMSwnXxXskIcGTQVD7XIUIImXZr4MJNMbo9Qb9A2O9aSFAC
         cx7m2bHgK6608HX7JZgfd5rWDpB4MEcwjyF4Rhof6xslgGv43DWrr3ZL3qsowF0ti0/1
         b1K5ly3zGJNfY7d+b10ENs8t0+npEzaOYxF0pGHejCQsbESXoOnEZwc7nQNr4RcoAU9g
         9AaeAs2hY0ZIB9MTXozxG+2VCBHtkgCyUurrWN2vUKyqs8OalM9iAh4XMao2rmrT/6pu
         deUQ==
X-Gm-Message-State: AOAM532KsRHAjwoEoxVgsA/M9osKzGTodGn1avZBPhCfDM/BjeJaj3Ac
        OlcBHv02RhhLu0pbr0b/Np6AEL9mXBYTUqecuc4Q1naev8CA
X-Google-Smtp-Source: ABdhPJySFHH59iBm+iOPcUtJl+p87aJm++qydSvRgFrddy4gCSv4A+y2Y/Wsb07YprMzwYjiSGPEjxlNkeOoq/gGGwDObWbBBF7N
MIME-Version: 1.0
X-Received: by 2002:a02:2708:: with SMTP id g8mr15615078jaa.52.1590315852684;
 Sun, 24 May 2020 03:24:12 -0700 (PDT)
Date:   Sun, 24 May 2020 03:24:12 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007ae41505a66243fb@google.com>
Subject: KASAN: use-after-free Read in evdev_cleanup
From:   syzbot <syzbot+20458a5eab138777efc9@syzkaller.appspotmail.com>
To:     brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael.j.wysocki@intel.com, rdunlap@infradead.org,
        rydberg@bitmath.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    c11d28ab Add linux-next specific files for 20200522
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14f54441100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6dbdea4159fb66
dashboard link: https://syzkaller.appspot.com/bug?extid=20458a5eab138777efc9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133e254a100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15dbf016100000

The bug was bisected to:

commit 4ef12f7198023c09ad6d25b652bd8748c965c7fa
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Wed May 13 15:18:40 2020 +0000

    kobject: Make sure the parent does not get released before its children

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16763f06100000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=15763f06100000
console output: https://syzkaller.appspot.com/x/log.txt?x=11763f06100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+20458a5eab138777efc9@syzkaller.appspotmail.com
Fixes: 4ef12f719802 ("kobject: Make sure the parent does not get released before its children")

input: syz1 as /devices/virtual/input/input5
==================================================================
BUG: KASAN: use-after-free in __mutex_lock_common kernel/locking/mutex.c:938 [inline]
BUG: KASAN: use-after-free in __mutex_lock+0x1033/0x13c0 kernel/locking/mutex.c:1103
Read of size 8 at addr ffff8880a019f158 by task syz-executor054/6791

CPU: 0 PID: 6791 Comm: syz-executor054 Not tainted 5.7.0-rc6-next-20200522-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x413 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 __mutex_lock_common kernel/locking/mutex.c:938 [inline]
 __mutex_lock+0x1033/0x13c0 kernel/locking/mutex.c:1103
 evdev_mark_dead drivers/input/evdev.c:1314 [inline]
 evdev_cleanup+0x21/0x190 drivers/input/evdev.c:1323
 evdev_disconnect+0x45/0xb0 drivers/input/evdev.c:1408
 __input_unregister_device+0x1b0/0x430 drivers/input/input.c:2091
 input_unregister_device+0xb4/0xf0 drivers/input/input.c:2273
 uinput_destroy_device+0x1e2/0x240 drivers/input/misc/uinput.c:298
 uinput_release+0x37/0x50 drivers/input/misc/uinput.c:710
 __fput+0x33e/0x880 fs/file_table.c:281
 task_work_run+0xf4/0x1b0 kernel/task_work.c:123
 exit_task_work include/linux/task_work.h:22 [inline]
 do_exit+0xb5e/0x2e10 kernel/exit.c:805
 do_group_exit+0x125/0x340 kernel/exit.c:903
 __do_sys_exit_group kernel/exit.c:914 [inline]
 __se_sys_exit_group kernel/exit.c:912 [inline]
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:912
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3
RIP: 0033:0x43f9e8
Code: Bad RIP value.
RSP: 002b:00007ffd043eeff8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000000000043f9e8
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004bf228 R08: 00000000000000e7 R09: ffffffffffffffd0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d1180 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 6791:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc mm/kasan/common.c:494 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:467
 kmem_cache_alloc_trace+0x153/0x7d0 mm/slab.c:3551
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 evdev_connect+0x80/0x4d0 drivers/input/evdev.c:1352
 input_attach_handler+0x194/0x200 drivers/input/input.c:1031
 input_register_device.cold+0xf5/0x246 drivers/input/input.c:2229
 uinput_create_device drivers/input/misc/uinput.c:364 [inline]
 uinput_ioctl_handler.isra.0+0x1210/0x1d80 drivers/input/misc/uinput.c:870
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl fs/ioctl.c:760 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

Freed by task 6791:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 kasan_set_free_info mm/kasan/common.c:316 [inline]
 __kasan_slab_free+0xf7/0x140 mm/kasan/common.c:455
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x109/0x2b0 mm/slab.c:3757
 device_release+0x71/0x200 drivers/base/core.c:1541
 kobject_cleanup lib/kobject.c:701 [inline]
 kobject_release lib/kobject.c:732 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1c8/0x2f0 lib/kobject.c:749
 cdev_device_del+0x69/0x80 fs/char_dev.c:575
 evdev_disconnect+0x3d/0xb0 drivers/input/evdev.c:1407
 __input_unregister_device+0x1b0/0x430 drivers/input/input.c:2091
 input_unregister_device+0xb4/0xf0 drivers/input/input.c:2273
 uinput_destroy_device+0x1e2/0x240 drivers/input/misc/uinput.c:298
 uinput_release+0x37/0x50 drivers/input/misc/uinput.c:710
 __fput+0x33e/0x880 fs/file_table.c:281
 task_work_run+0xf4/0x1b0 kernel/task_work.c:123
 exit_task_work include/linux/task_work.h:22 [inline]
 do_exit+0xb5e/0x2e10 kernel/exit.c:805
 do_group_exit+0x125/0x340 kernel/exit.c:903
 __do_sys_exit_group kernel/exit.c:914 [inline]
 __se_sys_exit_group kernel/exit.c:912 [inline]
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:912
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

The buggy address belongs to the object at ffff8880a019f000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 344 bytes inside of
 2048-byte region [ffff8880a019f000, ffff8880a019f800)
The buggy address belongs to the page:
page:ffffea00028067c0 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea00029b4348 ffff8880aa001950 ffff8880aa000e00
raw: 0000000000000000 ffff8880a019f000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880a019f000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880a019f080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880a019f100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                    ^
 ffff8880a019f180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880a019f200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

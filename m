Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5689FFB080
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 13:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfKMMfK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 07:35:10 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:47700 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfKMMfK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 07:35:10 -0500
Received: by mail-io1-f72.google.com with SMTP id y16so1382121ior.14
        for <linux-input@vger.kernel.org>; Wed, 13 Nov 2019 04:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=xqdtXvTTTPONhkciR3w2Bj2gsEfbK8zDLMwxMbhN7qQ=;
        b=KitMYFZZZOalQFpdldoFYlKcfrXhbX7cfH3FIDVHeQvmwyfkDPTWblK7o3YDZcloXw
         ltWLBTKDvCP87ks+qjKlR0y0mx+PWhPa2oyZDAbR/X+9B11x/0NBwoACwbzTT+H370vA
         YdBDYjJFvYKVTZi6F60ipRJP+WLjw5IbJawIEwsOKxz2r4E7+3yilVAS7HEJQlQDRXRo
         +pHVXV0PoWYS6ReXEj4baaUOfa5415bgOKR2gDvRlpe1HfIgWWAsdiMvJjTDJUAI3VYT
         PJfr5xspQK68LmNDBCSf5w+ETMACAcDw07qaujtaoLIWkmy4rXYLg97kEFhKXvB5MnSI
         hOBg==
X-Gm-Message-State: APjAAAV5l1YU+vyMDH342AinyO/gJi9EtzSY6yWa+FdhOvD9WdFxZJNx
        hrKQGz9pBas/QCScjIvFQ4mvrQbyG4m+YzYMXT5vEFGgy1uM
X-Google-Smtp-Source: APXvYqzV719ubIVLLBjHHvyaILknSra81LMnKSp0gzKvIu5mmmKxABzzgmMAP5h8AfT72XFCtiw9zFcggP8gQ8B2lDp3WXqdv0Ds
MIME-Version: 1.0
X-Received: by 2002:a02:b48:: with SMTP id 69mr2602942jad.25.1573648508835;
 Wed, 13 Nov 2019 04:35:08 -0800 (PST)
Date:   Wed, 13 Nov 2019 04:35:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005ee2a10597399876@google.com>
Subject: WARNING: ODEBUG bug in input_ff_destroy
From:   syzbot <syzbot+b6c55daa701fc389e286@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    3183c037 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=17cf5e72e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=b6c55daa701fc389e286
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b4e53ae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1173fe72e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+b6c55daa701fc389e286@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object type: timer_list hint:  
ml_effect_timer+0x0/0x70 drivers/input/ff-memless.c:421
WARNING: CPU: 0 PID: 1918 at lib/debugobjects.c:481  
debug_print_object+0x160/0x250 lib/debugobjects.c:481
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 1918 Comm: syz-executor941 Not tainted 5.4.0-rc6+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x2aa/0x6e1 kernel/panic.c:221
  __warn.cold+0x2f/0x33 kernel/panic.c:582
  report_bug+0x27b/0x2f0 lib/bug.c:195
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:debug_print_object+0x160/0x250 lib/debugobjects.c:481
Code: dd 00 c8 da 85 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 bf 00 00 00 48  
8b 14 dd 00 c8 da 85 48 c7 c7 a0 bd da 85 e8 25 15 30 ff <0f> 0b 83 05 9b  
bd a2 05 01 48 83 c4 20 5b 5d 41 5c 41 5d c3 48 89
RSP: 0018:ffff8881d731f738 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128c9cd RDI: ffffed103ae63ed9
RBP: 0000000000000001 R08: ffff8881d23bc800 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff86d0b500
R13: ffffffff812ed560 R14: ffff8881cfb18310 R15: ffff8881ca291d90
  __debug_check_no_obj_freed lib/debugobjects.c:963 [inline]
  debug_check_no_obj_freed+0x2df/0x443 lib/debugobjects.c:994
  slab_free_hook mm/slub.c:1421 [inline]
  slab_free_freelist_hook mm/slub.c:1475 [inline]
  slab_free mm/slub.c:3025 [inline]
  kfree+0x20b/0x320 mm/slub.c:3977
  input_ff_destroy+0xb9/0x150 drivers/input/ff-core.c:373
  input_dev_release+0x19/0xd0 drivers/input/input.c:1537
  device_release+0x71/0x200 drivers/base/core.c:1101
  kobject_cleanup lib/kobject.c:693 [inline]
  kobject_release lib/kobject.c:722 [inline]
  kref_put include/linux/kref.h:65 [inline]
  kobject_put+0x171/0x280 lib/kobject.c:739
  put_device+0x1b/0x30 drivers/base/core.c:2301
  input_put_device include/linux/input.h:363 [inline]
  evdev_free+0x4c/0x70 drivers/input/evdev.c:347
  device_release+0x71/0x200 drivers/base/core.c:1101
  kobject_cleanup lib/kobject.c:693 [inline]
  kobject_release lib/kobject.c:722 [inline]
  kref_put include/linux/kref.h:65 [inline]
  kobject_put+0x171/0x280 lib/kobject.c:739
  kobject_cleanup lib/kobject.c:693 [inline]
  kobject_release lib/kobject.c:722 [inline]
  kref_put include/linux/kref.h:65 [inline]
  kobject_put+0x171/0x280 lib/kobject.c:739
  cdev_put.part.0+0x32/0x50 fs/char_dev.c:365
  cdev_put fs/char_dev.c:363 [inline]
  chrdev_open+0x296/0x5c0 fs/char_dev.c:422
  do_dentry_open+0x494/0x1120 fs/open.c:797
  do_last fs/namei.c:3408 [inline]
  path_openat+0x1430/0x3ff0 fs/namei.c:3525
  do_filp_open+0x1a1/0x280 fs/namei.c:3555
  do_sys_open+0x3c0/0x580 fs/open.c:1097
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x402000
Code: 01 f0 ff ff 0f 83 40 0e 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f  
44 00 00 83 3d 6d 84 2d 00 00 75 14 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 14 0e 00 00 c3 48 83 ec 08 e8 7a 03 00 00
RSP: 002b:00007ffff4b02e58 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 6666666666666667 RCX: 0000000000402000
RDX: 0000000000000000 RSI: 000000000000107d RDI: 00007ffff4b02f00
RBP: 000000000000d9d1 R08: 00007ffff4b02e60 R09: 000000000000d9d1
R10: 00007ffff4b02e60 R11: 0000000000000246 R12: 00000000004032a0
R13: 0000000000403330 R14: 0000000000000000 R15: 0000000000000000
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

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB9877A86E
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 14:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbfG3M2I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 08:28:08 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:35565 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbfG3M2H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 08:28:07 -0400
Received: by mail-io1-f71.google.com with SMTP id w17so71308480iom.2
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2019 05:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=UF+ZT7hkzsQOSIm9ZfReLBGT0sRMnBnJ9BkNk0fgMtk=;
        b=pzOK+AlVslOq3FrUovEq8ec4l4Tk5Z08TAZGUAdo2S4TJf8wiJgWgPUuahKFm6iFDA
         VSjuSY5vEDunYmzFnOh96drkIBmx+MpajBiVyjd7O6pDlRiupgsGFMRYIpv+16g2QLAa
         69qIqSZupYbKLqwC5Ui7zUF7fLmx7bWmgKjm2qXCZH03GxRIQhqQfbEUyZam6SXYPDjI
         KK7gM+klwufnPLLXc9JDSbms7IVXJzH2z6ERTy4x4Y9pMJXQiS5e2N8zgiq8D6u7+Qgn
         nlw9d7JkK4oQObKxUmz84syXuzRDK39r5pKLJDUvCHtsGbi3bwNGIJb8/ynrTTELnwVn
         GOFg==
X-Gm-Message-State: APjAAAUPP0j5bp8gRoU1BXVe83xzUi+ocOMcu/5LhbSuOaNtIXHvWvh2
        wnpVKOxj5aH548T4k6PGooZdfahW+mP9/+IvtJqPUoJfLJQa
X-Google-Smtp-Source: APXvYqwylNdmLYou55ilmwLxDi//dWkQA/2GdAbuEf8sWkR2fpjRhH0kg4zKEtf78oXPD6M0flpqNynFwWxuxZd0tmIROr31LSch
MIME-Version: 1.0
X-Received: by 2002:a02:aa1d:: with SMTP id r29mr48117747jam.127.1564489687097;
 Tue, 30 Jul 2019 05:28:07 -0700 (PDT)
Date:   Tue, 30 Jul 2019 05:28:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000de921058ee524e1@google.com>
Subject: KASAN: user-memory-access Read in hidraw_ioctl
From:   syzbot <syzbot+5a8c44432a51154ff6d5@syzkaller.appspotmail.com>
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

HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=13c21ab4600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
dashboard link: https://syzkaller.appspot.com/bug?extid=5a8c44432a51154ff6d5
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+5a8c44432a51154ff6d5@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: user-memory-access in _copy_to_user+0x124/0x150  
lib/usercopy.c:27
Read of size 148 at addr 0000100000000000 by task syz-executor.2/19576

CPU: 1 PID: 19576 Comm: syz-executor.2 Not tainted 5.3.0-rc2+ #23
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  __kasan_report.cold+0x5/0x33 mm/kasan/report.c:486
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  _copy_to_user+0x124/0x150 lib/usercopy.c:27
  copy_to_user include/linux/uaccess.h:152 [inline]
  hidraw_ioctl+0x39c/0xae0 drivers/hid/hidraw.c:392
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459829
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f6587cfbc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
RDX: 0000000020005640 RSI: 0000000090044802 RDI: 0000000000000004
RBP: 000000000075c070 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f6587cfc6d4
R13: 00000000004c21db R14: 00000000004d5540 R15: 00000000ffffffff
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

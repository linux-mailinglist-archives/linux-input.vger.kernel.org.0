Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21682A682D
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 14:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbfICMIg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 08:08:36 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:47051 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbfICMIN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 08:08:13 -0400
Received: by mail-io1-f70.google.com with SMTP id o3so8640671iom.13
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2019 05:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=/18hoELIwFfWayuMe37bW650zrx3Am+Qg6CVpoIp8nE=;
        b=K668fyB6/Ji6A8RLadi6gwjWqjzUzxMbiP9kW9gwXhPZ05S0Jrlfuq/S558MgyUDlL
         cb/c29s6GhmVT/2bK4+MxqHUsQqKuR6v0vWflnxKOG2B601RBPGVWUcoua3AuATw3YYp
         7IjifaEU93RxjPVwbOTc4BQm9WtA4FuZuMdM+J29p7tMbypdpWPxPvQWGJxpNnv0OPKh
         HnKl2BPMBUpyXZjQBSMtk8AmNq9QRvv2vJAVFtTQjC59utpmAeeIUsJy2KY5kFHf3ox7
         61V3TRC7ZN96n92TBaIGL7TSsI4M9RV/efkQk8J0GkG2B3aPOpG6bpWHzGC0dno578xM
         mVGw==
X-Gm-Message-State: APjAAAXxH5lIOHczwy7HIONuWlZByFDsfaeEvWDHlpkBK8ehd4ChTPgq
        YbCx63zhiPJEtk1tO9rlzRYBFmIBxsnvg6bI80blXqAlbo0D
X-Google-Smtp-Source: APXvYqwqoWdMtAMj2/32maVkwo5FLKv+YZnJEB8f40gwMON8QPkcqYkWLn8KD2nmlC/P+lJsVa1UkjzobwBgy/ko8H7iQWeWuL3B
MIME-Version: 1.0
X-Received: by 2002:a5d:804f:: with SMTP id b15mr7650166ior.92.1567512491967;
 Tue, 03 Sep 2019 05:08:11 -0700 (PDT)
Date:   Tue, 03 Sep 2019 05:08:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000043c9390591a4f14b@google.com>
Subject: KASAN: use-after-free Write in usbhid_open
From:   syzbot <syzbot+058e326a87dbb54f2426@syzkaller.appspotmail.com>
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

HEAD commit:    eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=16ab9982600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=058e326a87dbb54f2426
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+058e326a87dbb54f2426@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in clear_bit  
include/asm-generic/bitops-instrumented.h:56 [inline]
BUG: KASAN: use-after-free in usbhid_open+0x263/0x390  
drivers/hid/usbhid/hid-core.c:727
Write of size 8 at addr ffff8881c89228c0 by task syz-executor.1/10380

CPU: 0 PID: 10380 Comm: syz-executor.1 Not tainted 5.3.0-rc5+ #28
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  clear_bit include/asm-generic/bitops-instrumented.h:56 [inline]
  usbhid_open+0x263/0x390 drivers/hid/usbhid/hid-core.c:727
  hid_hw_open+0xd2/0x160 drivers/hid/hid-core.c:2023
  hidraw_open+0x256/0x740 drivers/hid/hidraw.c:288
  chrdev_open+0x219/0x5c0 fs/char_dev.c:414
  do_dentry_open+0x494/0x1120 fs/open.c:797
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3f50 fs/namei.c:3533
  do_filp_open+0x1a1/0x280 fs/namei.c:3563
  do_sys_open+0x3c0/0x580 fs/open.c:1089
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413761
Code: 75 14 b8 02 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 19 00 00 c3 48  
83 ec 08 e8 0a fa ff ff 48 89 04 24 b8 02 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fa ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007f50d4f077a0 EFLAGS: 00000293 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 6666666666666667 RCX: 0000000000413761
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007f50d4f07850
RBP: 000000000075bf20 R08: 000000000000000f R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 00007f50d4f086d4
R13: 00000000004c8c86 R14: 00000000004dfc10 R15: 00000000ffffffff

The buggy address belongs to the page:
page:ffffea0007224880 refcount:0 mapcount:0 mapping:0000000000000000  
index:0x0
flags: 0x200000000000000()
raw: 0200000000000000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881c8922780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  ffff8881c8922800: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ffff8881c8922880: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                            ^
  ffff8881c8922900: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  ffff8881c8922980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

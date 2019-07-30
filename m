Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA8A7A86D
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 14:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbfG3M2I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 08:28:08 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:50538 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbfG3M2H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 08:28:07 -0400
Received: by mail-io1-f71.google.com with SMTP id m26so71284659ioh.17
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2019 05:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=hZMo4mC2RIyBYAfOxySX5UABZRRMH2Q/dZ4zcgNImT8=;
        b=R59/8ONQ0yDVv2SK81IrSbhMuK3yz18QYhsWrb21OkPbwpDgVYu+DxdD3mtfgvN4tm
         kZclOBCF8+08zqvGHZ8Oe7JgGc9z8jEgKo6OvY3J6rBJlXhuLsE4/ZH9D0wLSWd9Lkdl
         H74qpVDl0F+CHLhtIXDlfJt+/Qkxm6AfGQAGdXhcmf+8CbcNg0N1sN9q5nRu+f6mF1f9
         b74fpp4UnN3guQlIV1i8rfuXF0AzWbcatIKmyEd0SjaUXPAk7NsYrCW88SJL7df3tkee
         xr5kbq1lcpiD+mANKz5m9FFTYJnturkVjwkQrOOw3/SVIqyRR/gFIpS+pFuSn+XNcAf4
         5ajg==
X-Gm-Message-State: APjAAAURMiNJaxGL3CoZoDZLzCEmiWX6ZA3aTOYvN2bfNZC/nXD3f44t
        7O/wIkSswqU+7rUXO2xrtS6NutNiu84Bos5vGTe81w12Hte/
X-Google-Smtp-Source: APXvYqz9DN92bNusuAriRi22SyjDQxEx6rnZguhdzOOVXYpum2QebL80O/zC1jM1YPGv5w4HsMU3xQqZxOd+TwmYrgIkwg9N2DQI
MIME-Version: 1.0
X-Received: by 2002:a05:6602:114:: with SMTP id s20mr62738414iot.122.1564489686756;
 Tue, 30 Jul 2019 05:28:06 -0700 (PDT)
Date:   Tue, 30 Jul 2019 05:28:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000008b8c6058ee52407@google.com>
Subject: KASAN: slab-out-of-bounds Read in hidraw_ioctl
From:   syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=15e293c8600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
dashboard link: https://syzkaller.appspot.com/bug?extid=5a6c4ec678a0c6ee84ba
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in strlen+0x79/0x90 lib/string.c:525
Read of size 1 at addr ffff8881ca981f10 by task syz-executor.4/7644

CPU: 1 PID: 7644 Comm: syz-executor.4 Not tainted 5.3.0-rc2+ #23
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  strlen+0x79/0x90 lib/string.c:525
  strlen include/linux/string.h:281 [inline]
  hidraw_ioctl+0x245/0xae0 drivers/hid/hidraw.c:446
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
RSP: 002b:00007fed5bb22c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
RDX: 0000000020000180 RSI: 0000000080404805 RDI: 0000000000000003
RBP: 000000000075bfc8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fed5bb236d4
R13: 00000000004c21c6 R14: 00000000004d5528 R15: 00000000ffffffff

Allocated by task 1607:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  kmalloc include/linux/slab.h:552 [inline]
  syslog_print kernel/printk/printk.c:1346 [inline]
  do_syslog kernel/printk/printk.c:1519 [inline]
  do_syslog+0x540/0x1380 kernel/printk/printk.c:1493
  kmsg_read+0x8a/0xb0 fs/proc/kmsg.c:40
  proc_reg_read+0x1c1/0x280 fs/proc/inode.c:223
  __vfs_read+0x76/0x100 fs/read_write.c:425
  vfs_read+0x1ea/0x430 fs/read_write.c:461
  ksys_read+0x127/0x250 fs/read_write.c:587
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 1607:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1470 [inline]
  slab_free mm/slub.c:3012 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3953
  syslog_print kernel/printk/printk.c:1405 [inline]
  do_syslog kernel/printk/printk.c:1519 [inline]
  do_syslog+0x1098/0x1380 kernel/printk/printk.c:1493
  kmsg_read+0x8a/0xb0 fs/proc/kmsg.c:40
  proc_reg_read+0x1c1/0x280 fs/proc/inode.c:223
  __vfs_read+0x76/0x100 fs/read_write.c:425
  vfs_read+0x1ea/0x430 fs/read_write.c:461
  ksys_read+0x127/0x250 fs/read_write.c:587
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881ca981b00
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 16 bytes to the right of
  1024-byte region [ffff8881ca981b00, ffff8881ca981f00)
The buggy address belongs to the page:
page:ffffea00072a6000 refcount:1 mapcount:0 mapping:ffff8881da002280  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da002280
raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881ca981e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881ca981e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881ca981f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                          ^
  ffff8881ca981f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881ca982000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

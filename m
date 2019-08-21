Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6579E97D98
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 16:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbfHUOvB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 10:51:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:34695 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbfHUOvB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 10:51:01 -0400
Received: by mail-io1-f70.google.com with SMTP id u84so2882597iod.1
        for <linux-input@vger.kernel.org>; Wed, 21 Aug 2019 07:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ur0GU125O5vKfJPk2szrhYPDiT+ra22kn9R2T022qQI=;
        b=cE54WfA9BdCNx2+uRmBuq+koD3m4AnUzkzuozHSdJIfU9vW5L3rDSa7eGjtXvVEW+5
         Zs24Mu5zcmaoZlDNJPAMPYm/JTF6Hjppu5z2DOMi5uEHcaEyIOUFhTljNMSS5xalivNS
         M9236eYF/eZbSphDhdjHkvm3pDPMZ5999ebYX/x4+TeqULRZv5jOL5e1/vP9/NxPhh5F
         kRZiHjjwdiYpZMTetcub/N5+KGSe9nXEuo4S/JNbSQhAN/6O47w9nltfYwTyForaR8pr
         H0mPuGoM7092EJyGGTWFROucf1QGTlGDzO+771WB7vezYxQcqNQPStmqZv16EkKZImFW
         tibw==
X-Gm-Message-State: APjAAAWbxlQtuEAZ7vsp4T5gGGUg+n1/fqvr4hgacPVfBEe83bDDVa9v
        gO6DsUJsn7BleXBLMwC+dngYcHkbqdcd5WlR4HoVXr4B4VRo
X-Google-Smtp-Source: APXvYqyFZQaCRKs4lycapzjdE9w9p5nnRZC+tqCvEKLiyqz4hNXuOoW1WdaPF2GdwCHU2trRuRjLzzoWQvOUtsEw2cNN1KXMciZO
MIME-Version: 1.0
X-Received: by 2002:a5e:c00e:: with SMTP id u14mr6695479iol.196.1566399060509;
 Wed, 21 Aug 2019 07:51:00 -0700 (PDT)
Date:   Wed, 21 Aug 2019 07:51:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1908211038300.1816-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000940ec30590a1b35e@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
From:   syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
KASAN: slab-out-of-bounds Read in hidraw_ioctl

==================================================================
BUG: KASAN: slab-out-of-bounds in strlen+0x79/0x90 lib/string.c:525
Read of size 1 at addr ffff8881d619df38 by task syz-executor.5/2984

CPU: 0 PID: 2984 Comm: syz-executor.5 Not tainted 5.3.0-rc2+ #1
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
RSP: 002b:00007f19881acc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
RDX: 0000000000000000 RSI: 0000000080404805 RDI: 0000000000000004
RBP: 000000000075bfc8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f19881ad6d4
R13: 00000000004c21de R14: 00000000004d5620 R15: 00000000ffffffff

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

The buggy address belongs to the object at ffff8881d619db00
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 56 bytes to the right of
  1024-byte region [ffff8881d619db00, ffff8881d619df00)
The buggy address belongs to the page:
page:ffffea0007586700 refcount:1 mapcount:0 mapping:ffff8881da002280  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da002280
raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d619de00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d619de80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881d619df00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                         ^
  ffff8881d619df80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d619e000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1138542e600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1197b996600000


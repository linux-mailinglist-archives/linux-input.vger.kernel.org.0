Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E349180C26
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2019 21:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfHDTWH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Aug 2019 15:22:07 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:46660 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbfHDTWH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Aug 2019 15:22:07 -0400
Received: by mail-io1-f72.google.com with SMTP id s83so89827808iod.13
        for <linux-input@vger.kernel.org>; Sun, 04 Aug 2019 12:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=K2bVT6ZOOjGyOLIQG171mN/PwJP9OKv/BhNIfDVNcCk=;
        b=O7kUH9m1NlFJQxogHzBR4KFhJ6VwfHz4s+srj8SE8dcPa88ypmlWXaYsFqTpDK3SNi
         Qoi9JEaQ2yqJcmT6ihuBRGwYKpy79DmCRJYMs8s/LdEskOtrTfwI6bkanl7wAdZg7PRI
         0lan2uahq/ccW0EBYVqT54TI6LxDQlxLjEEMzCDskrUvYNxBd13D9I4VHsENOpjkYa3n
         41WTet+gWZvMhdjp/b2BmYBIW89mOoJ1cMA/p3qsZAgOOLnujK2eTm31IL3wmJJw5vsR
         GuXUSrKx0NWOBPvq0V4kiP0kjHAkeItANoWWhrZHzRW2h+B3WZW+cB9ig/4yfIOwRFKe
         zVCA==
X-Gm-Message-State: APjAAAVN6F8Ql4HJsY+F4Iz3Z2iMW75jOW9095Th8QgsrCGsXBX1Bpsf
        ObdF9czKBZW1Xdk5PA4skc82bVJnFJz6oN07Om6pN1HVekrQ
X-Google-Smtp-Source: APXvYqzGqhkkjXSUI8RwOm5HArT3svauh5bcbgoBZIYieqX9CivgXfkdNgixm/CpzILB0LF/+QUR35jH48+ccdClMpKfKG9pqH1L
MIME-Version: 1.0
X-Received: by 2002:a05:6602:114:: with SMTP id s20mr14096981iot.122.1564946526539;
 Sun, 04 Aug 2019 12:22:06 -0700 (PDT)
Date:   Sun, 04 Aug 2019 12:22:06 -0700
In-Reply-To: <00000000000091efa6058f0fe3d9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ce99fb058f4f81bc@google.com>
Subject: Re: KASAN: use-after-free Read in hiddev_release
From:   syzbot <syzbot+62a1e04fd3ec2abf099e@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=16f6f53a600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=62a1e04fd3ec2abf099e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15394cfc600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16f0da8a600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+62a1e04fd3ec2abf099e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __lock_acquire+0x302a/0x3b50  
kernel/locking/lockdep.c:3753
Read of size 8 at addr ffff8881d60d1c88 by task syz-executor289/2034

CPU: 0 PID: 2034 Comm: syz-executor289 Not tainted 5.3.0-rc2+ #25
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
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0x32/0x50 kernel/locking/spinlock.c:159
  hiddev_release+0x82/0x520 drivers/hid/usbhid/hiddev.c:221
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  exit_task_work include/linux/task_work.h:22 [inline]
  do_exit+0x8ef/0x2c50 kernel/exit.c:878
  do_group_exit+0x125/0x340 kernel/exit.c:982
  __do_sys_exit_group kernel/exit.c:993 [inline]
  __se_sys_exit_group kernel/exit.c:991 [inline]
  __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:991
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x444618
Code: Bad RIP value.
RSP: 002b:00007ffd1e60a0d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000444618
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004c4270 R08: 00000000000000e7 R09: ffffffffffffffd0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d6180 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 21:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  hiddev_connect+0x242/0x5b0 drivers/hid/usbhid/hiddev.c:900
  hid_connect+0x239/0xbb0 drivers/hid/hid-core.c:1882
  hid_hw_start drivers/hid/hid-core.c:1981 [inline]
  hid_hw_start+0xa2/0x130 drivers/hid/hid-core.c:1972
  appleir_probe+0x13e/0x1a0 drivers/hid/hid-appleir.c:308
  hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2209
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  hid_add_device+0x33c/0x990 drivers/hid/hid-core.c:2365
  usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 21:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1470 [inline]
  slab_free mm/slub.c:3012 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3953
  hiddev_connect.cold+0x45/0x5c drivers/hid/usbhid/hiddev.c:914
  hid_connect+0x239/0xbb0 drivers/hid/hid-core.c:1882
  hid_hw_start drivers/hid/hid-core.c:1981 [inline]
  hid_hw_start+0xa2/0x130 drivers/hid/hid-core.c:1972
  appleir_probe+0x13e/0x1a0 drivers/hid/hid-appleir.c:308
  hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2209
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  hid_add_device+0x33c/0x990 drivers/hid/hid-core.c:2365
  usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d60d1b80
  which belongs to the cache kmalloc-512 of size 512
The buggy address is located 264 bytes inside of
  512-byte region [ffff8881d60d1b80, ffff8881d60d1d80)
The buggy address belongs to the page:
page:ffffea0007583400 refcount:1 mapcount:0 mapping:ffff8881da002500  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 ffffea000765a980 0000000800000008 ffff8881da002500
raw: 0000000000000000 00000000000c000c 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d60d1b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d60d1c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881d60d1c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                       ^
  ffff8881d60d1d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d60d1d80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAB4114FEF
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2019 12:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfLFLpJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Dec 2019 06:45:09 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:35795 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfLFLpJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Dec 2019 06:45:09 -0500
Received: by mail-il1-f198.google.com with SMTP id t15so5050514ilh.2
        for <linux-input@vger.kernel.org>; Fri, 06 Dec 2019 03:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=WwcMHlZvXL6UgIvTRk3+yp2b9NSnw3Ab998ZqH2qKIY=;
        b=T39Bo9LP8zz3LyyiPcBKSvEvFG3EwSgSKLF+wkl1p/+MpONCTr+jtgH0wVrpuKQH0o
         VYcanLW1WtRSEWbxzdDaIMAaQWFC7ZcrF+UpwUyNmqJZLYgb2uAbKXyEPgEYBL40C+7P
         cVu32nMEk0GLtzGLBK2qcgIka4wFBGv5foVQrN+vZQDaevr2/P2T9GCJaGU36NcuRxcZ
         Ys+OOgxxY3WtVcd3Hreg4eM19LmmLBR5DUzT8+HenKLZLTniVlM8YowI+gh602QwSg/G
         U9Lj2bJI86KcTtbiKN6simSQGe+tLMybx0yRWrvI5FRTLLV4YEHc5FvKthy/Su7Vcl6u
         8Y8w==
X-Gm-Message-State: APjAAAX9DQHpbDgVwOjlvbBZYElWEMpP8J9kpzTeUaz3vOgEQJsPkZon
        KFbYJa9EcYPelwwKPbdIv9pVZciCqV2uhkbghyzr6SylgxV2
X-Google-Smtp-Source: APXvYqzgll03aE8X9bFCGOT20brtJScO4ej/ot6L53zHSm0cdOyTfQoEBT/Rm1Yhmg0NbYtPqkdGCdtvJ8qw0mogLxB9luxXcxQL
MIME-Version: 1.0
X-Received: by 2002:a02:13c2:: with SMTP id 185mr6769712jaz.0.1575632708138;
 Fri, 06 Dec 2019 03:45:08 -0800 (PST)
Date:   Fri, 06 Dec 2019 03:45:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dd7e7e05990793c1@google.com>
Subject: KASAN: slab-out-of-bounds Read in hid_field_extract
From:   syzbot <syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com>
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

HEAD commit:    1f22d15c usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=11d12861e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
dashboard link: https://syzkaller.appspot.com/bug?extid=09ef48aa58261464b621
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101a781ee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d71c2ae00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in __extract drivers/hid/hid-core.c:1345  
[inline]
BUG: KASAN: slab-out-of-bounds in hid_field_extract+0x150/0x170  
drivers/hid/hid-core.c:1365
Read of size 1 at addr ffff8881cf50f000 by task swapper/0/0

CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.4.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xef/0x16e lib/dump_stack.c:118
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:638
  __extract drivers/hid/hid-core.c:1345 [inline]
  hid_field_extract+0x150/0x170 drivers/hid/hid-core.c:1365
  hid_input_field drivers/hid/hid-core.c:1537 [inline]
  hid_report_raw_event+0x448/0xed0 drivers/hid/hid-core.c:1757
  hid_input_report+0x315/0x3f0 drivers/hid/hid-core.c:1824
  hid_irq_in+0x50e/0x690 drivers/hid/usbhid/hid-core.c:284
  __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1648
  usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1713
  dummy_timer+0x123d/0x2fdb drivers/usb/gadget/udc/dummy_hcd.c:1966
  call_timer_fn+0x179/0x650 kernel/time/timer.c:1404
  expire_timers kernel/time/timer.c:1449 [inline]
  __run_timers kernel/time/timer.c:1773 [inline]
  __run_timers kernel/time/timer.c:1740 [inline]
  run_timer_softirq+0x5e3/0x1490 kernel/time/timer.c:1786
  __do_softirq+0x221/0x912 kernel/softirq.c:292
  invoke_softirq kernel/softirq.c:373 [inline]
  irq_exit+0x178/0x1a0 kernel/softirq.c:413
  exiting_irq arch/x86/include/asm/apic.h:536 [inline]
  smp_apic_timer_interrupt+0x12f/0x500 arch/x86/kernel/apic/apic.c:1137
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
  </IRQ>
RIP: 0010:default_idle+0x28/0x2e0 arch/x86/kernel/process.c:700
Code: cc cc 41 56 41 55 65 44 8b 2d 1c e6 89 7a 41 54 55 53 0f 1f 44 00 00  
e8 76 ed cb fb e9 07 00 00 00 0f 00 2d 2a 6c 4a 00 fb f4 <65> 44 8b 2d f8  
e5 89 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
RSP: 0018:ffffffff86c07da8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: ffffffff86c2b240 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffffffff86c2ba8c
RBP: fffffbfff0d85648 R08: ffffffff86c2b240 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
  cpuidle_idle_call kernel/sched/idle.c:154 [inline]
  do_idle+0x3c3/0x4e0 kernel/sched/idle.c:269
  cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:361
  start_kernel+0x82a/0x864 init/main.c:784
  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:242

Allocated by task 12:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:512 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:485
  kmalloc include/linux/slab.h:561 [inline]
  hcd_buffer_alloc+0x1ed/0x290 drivers/usb/core/buffer.c:132
  usb_alloc_coherent+0x5d/0x80 drivers/usb/core/usb.c:910
  hid_alloc_buffers drivers/hid/usbhid/hid-core.c:846 [inline]
  usbhid_start+0x60b/0x22f0 drivers/hid/usbhid/hid-core.c:1075
  hid_hw_start+0x5d/0x130 drivers/hid/hid-core.c:2022
  ms_probe+0x159/0x4d0 drivers/hid/hid-microsoft.c:394
  hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2255
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0x1480/0x1c20 drivers/base/core.c:2487
  hid_add_device drivers/hid/hid-core.c:2411 [inline]
  hid_add_device+0x33c/0x9a0 drivers/hid/hid-core.c:2360
  usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0x1480/0x1c20 drivers/base/core.c:2487
  usb_set_configuration+0xe67/0x1740 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0x1480/0x1c20 drivers/base/core.c:2487
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2537
  hub_port_connect drivers/usb/core/hub.c:5184 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1e59/0x3860 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2264
  worker_thread+0x96/0xe20 kernel/workqueue.c:2410
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 238:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  kasan_set_free_info mm/kasan/common.c:334 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:473
  slab_free_hook mm/slub.c:1425 [inline]
  slab_free_freelist_hook mm/slub.c:1458 [inline]
  slab_free mm/slub.c:3005 [inline]
  kfree+0xdc/0x310 mm/slub.c:3957
  uevent_show+0x2b9/0x360 drivers/base/core.c:1529
  dev_attr_show+0x4b/0x90 drivers/base/core.c:1225
  sysfs_kf_seq_show+0x1f8/0x410 fs/sysfs/file.c:60
  seq_read+0x4b9/0x10f0 fs/seq_file.c:229
  kernfs_fop_read+0xe9/0x560 fs/kernfs/file.c:251
  __vfs_read+0x76/0x100 fs/read_write.c:425
  vfs_read+0x1ea/0x430 fs/read_write.c:461
  ksys_read+0x127/0x250 fs/read_write.c:587
  do_syscall_64+0xb7/0x5b0 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881cf50e000
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes to the right of
  4096-byte region [ffff8881cf50e000, ffff8881cf50f000)
The buggy address belongs to the page:
page:ffffea00073d4200 refcount:1 mapcount:0 mapping:ffff8881da40c280  
index:0x0 compound_mapcount: 0
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da40c280
raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cf50ef00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881cf50ef80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881cf50f000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                    ^
  ffff8881cf50f080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881cf50f100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

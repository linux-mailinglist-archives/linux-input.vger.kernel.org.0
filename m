Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1553A8D39
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2019 21:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731967AbfIDQiJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Sep 2019 12:38:09 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:50911 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731478AbfIDQiJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Sep 2019 12:38:09 -0400
Received: by mail-io1-f72.google.com with SMTP id 15so28075230ioo.17
        for <linux-input@vger.kernel.org>; Wed, 04 Sep 2019 09:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=ktZ6f+BEWQXzgwrGrVhrktTDtnSZnfyfeKVtS2UOANM=;
        b=XOJHFeWl/SN0uqWPf3Rh3O0TC5fi0niDzozv3qZeR3ida6+Nac7TcPp56RSrJ4vwLP
         iTSRZCHSZO8e52fwDSOkepB5PEfzywQ15xjHmMIFhhz2LT2GySY70QVv8IE8hmqHPKFC
         VhYr9Jr2JtRrA2M/Fz/lc9w+HPkCjz+P392lrkPtWBQMfpu+5H2fJqFBe5GNvYz4mfdT
         qlC6udgn1G25xDS6onq21Op0fDdRy5iHqMkyecOosTFmatEP9KJervo3j2bcNGUjwb5q
         0KR16x95do2x+JWum4EKgjx9Ejn13z/l21/bHY2RnCC3CaWhJdQvvpoTXwYGMdPcKNuv
         n55Q==
X-Gm-Message-State: APjAAAVW1gl8p5An05B3d58mu0GVZlrEOY0qof/+TSoeB4CxOgT1oy2p
        5PbOtTDa1JObiiYnYSbfOKBJ2Gu3mi6b2LJUS/5ctfitj1wK
X-Google-Smtp-Source: APXvYqxQjbNSKUtrDPUlnw35YUvkAjKv282t92aIllSkumfM4qfafK1b1mYXOPBq99RV2sG0cq3CVwxTIsy+vqEaWAlxolbvsr87
MIME-Version: 1.0
X-Received: by 2002:a02:a516:: with SMTP id e22mr29922385jam.77.1567615087833;
 Wed, 04 Sep 2019 09:38:07 -0700 (PDT)
Date:   Wed, 04 Sep 2019 09:38:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000747bcf0591bcd434@google.com>
Subject: KASAN: slab-out-of-bounds Write in hid_report_raw_event
From:   syzbot <syzbot+54323a55a37ec53f8045@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=152148a2600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=54323a55a37ec53f8045
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=112238a2600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b92412600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+54323a55a37ec53f8045@syzkaller.appspotmail.com

logitech-djreceiver 0003:046D:C71C.0001: Unexpected input report number 82
==================================================================
BUG: KASAN: slab-out-of-bounds in memset include/linux/string.h:344 [inline]
BUG: KASAN: slab-out-of-bounds in hid_report_raw_event+0x13a/0xed0  
drivers/hid/hid-core.c:1698
Write of size 3980 at addr ffff8881d76da275 by task swapper/1/0

CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.3.0-rc5+ #28
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  memset+0x20/0x40 mm/kasan/common.c:105
  memset include/linux/string.h:344 [inline]
  hid_report_raw_event+0x13a/0xed0 drivers/hid/hid-core.c:1698
  hid_input_report+0x315/0x3f0 drivers/hid/hid-core.c:1778
  hid_irq_in+0x50e/0x690 drivers/hid/usbhid/hid-core.c:284
  __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1657
  usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1722
  dummy_timer+0x120f/0x2fa2 drivers/usb/gadget/udc/dummy_hcd.c:1965
  call_timer_fn+0x179/0x650 kernel/time/timer.c:1322
  expire_timers kernel/time/timer.c:1366 [inline]
  __run_timers kernel/time/timer.c:1685 [inline]
  __run_timers kernel/time/timer.c:1653 [inline]
  run_timer_softirq+0x5cc/0x14b0 kernel/time/timer.c:1698
  __do_softirq+0x221/0x912 kernel/softirq.c:292
  invoke_softirq kernel/softirq.c:373 [inline]
  irq_exit+0x178/0x1a0 kernel/softirq.c:413
  exiting_irq arch/x86/include/asm/apic.h:537 [inline]
  smp_apic_timer_interrupt+0x12f/0x500 arch/x86/kernel/apic/apic.c:1095
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:830
  </IRQ>
RIP: 0010:default_idle+0x28/0x2e0 arch/x86/kernel/process.c:581
Code: 90 90 41 56 41 55 65 44 8b 2d 64 fa 93 7a 41 54 55 53 0f 1f 44 00 00  
e8 96 6a d5 fb e9 07 00 00 00 0f 00 2d 3a a0 54 00 fb f4 <65> 44 8b 2d 40  
fa 93 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
RSP: 0018:ffff8881da217dc8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: ffff8881da1fb000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881da1fb844
RBP: ffffed103b43f600 R08: ffff8881da1fb000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
  cpuidle_idle_call kernel/sched/idle.c:154 [inline]
  do_idle+0x3c2/0x4f0 kernel/sched/idle.c:263
  cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:354
  start_secondary+0x297/0x340 arch/x86/kernel/smpboot.c:264
  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:241

Allocated by task 21:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  kmalloc include/linux/slab.h:557 [inline]
  hcd_buffer_alloc+0x1bf/0x260 drivers/usb/core/buffer.c:132
  usb_alloc_coherent+0x5d/0x80 drivers/usb/core/usb.c:910
  hid_alloc_buffers drivers/hid/usbhid/hid-core.c:846 [inline]
  usbhid_start+0x60b/0x22f0 drivers/hid/usbhid/hid-core.c:1075
  hid_hw_start+0x5d/0x130 drivers/hid/hid-core.c:1976
  logi_dj_probe+0x808/0xcd7 drivers/hid/hid-logitech-dj.c:1703
  hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2209
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  hid_add_device+0x33c/0x990 drivers/hid/hid-core.c:2365
  usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 1:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1474 [inline]
  slab_free mm/slub.c:3016 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3957
  kobject_uevent_env+0x29e/0x1160 lib/kobject_uevent.c:625
  device_add+0xade/0x16f0 drivers/base/core.c:2164
  scsi_add_host_with_dma.cold+0x41e/0x7ad drivers/scsi/hosts.c:256
  scsi_add_host include/scsi/scsi_host.h:741 [inline]
  virtscsi_probe+0x7e2/0xbb5 drivers/scsi/virtio_scsi.c:838
  virtio_dev_probe+0x463/0x710 drivers/virtio/virtio.c:248
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  device_driver_attach+0x108/0x140 drivers/base/dd.c:995
  __driver_attach+0xda/0x240 drivers/base/dd.c:1072
  bus_for_each_dev+0x14b/0x1d0 drivers/base/bus.c:304
  bus_add_driver+0x457/0x5a0 drivers/base/bus.c:645
  driver_register+0x1c4/0x330 drivers/base/driver.c:170
  __write_once_size include/linux/compiler.h:226 [inline]
  INIT_LIST_HEAD include/linux/list.h:28 [inline]
  init+0xa1/0x115 drivers/char/virtio_console.c:2251
  do_one_initcall+0xf0/0x614 init/main.c:939
  do_initcall_level init/main.c:1007 [inline]
  do_initcalls init/main.c:1015 [inline]
  do_basic_setup init/main.c:1032 [inline]
  kernel_init_freeable+0x4a9/0x596 init/main.c:1192
  kernel_init+0xd/0x1bf init/main.c:1110
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d76da200
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 117 bytes inside of
  4096-byte region [ffff8881d76da200, ffff8881d76db200)
The buggy address belongs to the page:
page:ffffea00075db600 refcount:1 mapcount:0 mapping:ffff8881da00c280  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c280
raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d76db100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881d76db180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881d76db200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                    ^
  ffff8881d76db280: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881d76db300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

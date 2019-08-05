Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDCD81972
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 14:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbfHEMiI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 08:38:08 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:35979 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfHEMiI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Aug 2019 08:38:08 -0400
Received: by mail-io1-f72.google.com with SMTP id k21so92113553ioj.3
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2019 05:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=lUBKmETtf0Ze6PAhIT1SVwO5KKpxge00CVK1/gtGagY=;
        b=E4yrh3FI621vIvfG8xYGmkVykUvpM1WH4+GQyf7964MxNwssxhUqz5m9FoogJMRtFM
         E1EHd3LA6ob9Bazsmrsa44MnkC0XtVcTYdjs0jjX+VcnFnXHQviqN+CvSEn1z/OGepg+
         piSgmKGy4WZjnL+tM2XACgS3ttbCSR0LRIowQBAfXoQC/iBtEL7C2TD6vw0v89ldpzsW
         f4iYb+kS1o3mMFkNnPmWbghFYJxHMLKaP1dFcnZumUa/F7fn0K13T6PBYmtxRM/19QB8
         mKf/3Zlj/fwH5ErsEDPHDJ51pqob9iZ7FlkzZ8I/yBmKohhaovN+oi4Zb7LMRy/dDJR+
         s0ow==
X-Gm-Message-State: APjAAAWXt/K1xKJvr3S5HRKJZChvCCKgsazVc8M/SOoSbgfKJCoJXZaM
        yEsHNFKCq+bTD3ZrZMyxW11Ndk+yZowPD2bYSlUOlmpvHE9i
X-Google-Smtp-Source: APXvYqyO/N4F8W54SWvkyjNKd1YVHe7viWFIZ8pUrmpSo/Ozc2VC1FDyuLEXxT5AHQTXgONLLCl49FoTciOKuH3pwOXdEGlkoZeP
MIME-Version: 1.0
X-Received: by 2002:a5d:940b:: with SMTP id v11mr66472275ion.69.1565008687621;
 Mon, 05 Aug 2019 05:38:07 -0700 (PDT)
Date:   Mon, 05 Aug 2019 05:38:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e5742c058f5dfaef@google.com>
Subject: KASAN: slab-out-of-bounds Write in lg4ff_init
From:   syzbot <syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com>
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

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=144c21dc600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=94e2b9e9c7d1dd332345
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169e8542600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ec8262600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com

usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor,  
different from the interface descriptor's value: 9
usb 1-1: New USB device found, idVendor=046d, idProduct=c298, bcdDevice=  
0.00
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
logitech 0003:046D:C298.0001: unknown main item tag 0x0
logitech 0003:046D:C298.0001: unknown main item tag 0x0
logitech 0003:046D:C298.0001: hidraw0: USB HID v0.00 Device [HID 046d:c298]  
on usb-dummy_hcd.0-1/input0
==================================================================
BUG: KASAN: slab-out-of-bounds in set_bit  
include/asm-generic/bitops-instrumented.h:28 [inline]
BUG: KASAN: slab-out-of-bounds in lg4ff_init+0x89c/0x1800  
drivers/hid/hid-lg4ff.c:1331
Write of size 8 at addr ffff8881d81fe9c0 by task kworker/1:2/83

CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.3.0-rc2+ #25
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  set_bit include/asm-generic/bitops-instrumented.h:28 [inline]
  lg4ff_init+0x89c/0x1800 drivers/hid/hid-lg4ff.c:1331
  lg_probe+0x3b3/0x890 drivers/hid/hid-lg.c:850
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
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 83:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  hidraw_connect+0x4b/0x3e0 drivers/hid/hidraw.c:513
  hid_connect+0x5c7/0xbb0 drivers/hid/hid-core.c:1885
  hid_hw_start drivers/hid/hid-core.c:1981 [inline]
  hid_hw_start+0xa2/0x130 drivers/hid/hid-core.c:1972
  lg_probe+0x2a4/0x890 drivers/hid/hid-lg.c:806
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
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 12:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1470 [inline]
  slab_free mm/slub.c:3012 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3953
  blk_free_flush_queue+0x3f/0x4c block/blk-flush.c:500
  blk_mq_hw_sysfs_release+0x98/0x160 block/blk-mq-sysfs.c:43
  kobject_cleanup lib/kobject.c:693 [inline]
  kobject_release lib/kobject.c:722 [inline]
  kref_put include/linux/kref.h:65 [inline]
  kobject_put+0x171/0x280 lib/kobject.c:739
  blk_mq_release+0x258/0x3f0 block/blk-mq.c:2677
  __blk_release_queue+0x1ba/0x320 block/blk-sysfs.c:900
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d81fe900
  which belongs to the cache kmalloc-192 of size 192
The buggy address is located 0 bytes to the right of
  192-byte region [ffff8881d81fe900, ffff8881d81fe9c0)
The buggy address belongs to the page:
page:ffffea0007607f80 refcount:1 mapcount:0 mapping:ffff8881da002a00  
index:0x0
flags: 0x200000000000200(slab)
raw: 0200000000000200 ffffea000760f000 0000000400000004 ffff8881da002a00
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d81fe880: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
  ffff8881d81fe900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881d81fe980: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
                                            ^
  ffff8881d81fea00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881d81fea80: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B8489DE9
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 14:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbfHLMSQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 08:18:16 -0400
Received: from mail-ot1-f72.google.com ([209.85.210.72]:39962 "EHLO
        mail-ot1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbfHLMSJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 08:18:09 -0400
Received: by mail-ot1-f72.google.com with SMTP id o21so16115014otj.7
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 05:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=16nlEC3QFlYZITeCA3s8HQKUm1gstTHuAZye6YbZr2o=;
        b=Ddt13PronibOWKvZYPzHOTXbyg6R549iUaHITGQxkhNbSSJBR0i8RQ0HlpnAX8mn7f
         8sd1LfiTTlLFODvs1kf9iFoV6a46GpSfcfNiSP7WNY+iTmvo/BHmLrI5L1yM6vjCy/2i
         pjzjd1vxec88P5h8jNvSPsygsEdKMgW5vkjvzhCyVElvmb+FYsJotu/XKnRAjd6ytOO4
         gKMjFD/KB7MCRIUpV7JwbS/B8V+2Rx0AiyhQwZpB/9Wn4L5Znyy4TJSZLEblGw69fYMS
         dsBW94VKXfiawULW43Gn3gUXBy5TiXCyuGnTq8DU/BNfE/tPugX62aQhbsoIgtQlGkMw
         gRCw==
X-Gm-Message-State: APjAAAVjDoo8dJWu6yd5FlH+Xpz8xNPT/dc0VHTGTasuTe6V2gaDWYxb
        8IUrrmuHFFvJdGdDDXi68p39cjMkbyOW+TpWoq3CyuJtE2fY
X-Google-Smtp-Source: APXvYqwisqh1JQ1tosJkyER/kqUErOqivFyJexKys7FNLhpL87dkfYFzlQtH/8CJ+437Q+buKr1EDWVkT6I7VHJDV0TIdpYzBkeB
MIME-Version: 1.0
X-Received: by 2002:a5e:8308:: with SMTP id x8mr1903202iom.220.1565612287461;
 Mon, 12 Aug 2019 05:18:07 -0700 (PDT)
Date:   Mon, 12 Aug 2019 05:18:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000040184c058fea8467@google.com>
Subject: KASAN: slab-out-of-bounds Write in ax_probe
From:   syzbot <syzbot+1e86e2ccce227cca899b@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=15356402600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=1e86e2ccce227cca899b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1564a0a6600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=149a199a600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+1e86e2ccce227cca899b@syzkaller.appspotmail.com

usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor,  
different from the interface descriptor's value: 9
usb 1-1: New USB device found, idVendor=1a34, idProduct=f705, bcdDevice=  
0.40
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
acrux 0003:1A34:F705.0001: hidraw0: USB HID v0.00 Device [HID 1a34:f705] on  
usb-dummy_hcd.0-1/input0
==================================================================
BUG: KASAN: slab-out-of-bounds in set_bit  
include/asm-generic/bitops-instrumented.h:28 [inline]
BUG: KASAN: slab-out-of-bounds in axff_init drivers/hid/hid-axff.c:96  
[inline]
BUG: KASAN: slab-out-of-bounds in ax_probe+0x369/0x540  
drivers/hid/hid-axff.c:138
Write of size 8 at addr ffff8881d5749bc0 by task kworker/0:1/12

CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc2+ #25
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
  axff_init drivers/hid/hid-axff.c:96 [inline]
  ax_probe+0x369/0x540 drivers/hid/hid-axff.c:138
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

Allocated by task 12:
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
  ax_probe+0x52/0x540 drivers/hid/hid-axff.c:132
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

Freed by task 1:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1470 [inline]
  slab_free mm/slub.c:3012 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3953
  urb_destroy drivers/usb/core/urb.c:26 [inline]
  kref_put include/linux/kref.h:65 [inline]
  usb_free_urb.part.0+0x7a/0xc0 drivers/usb/core/urb.c:95
  usb_free_urb+0x1b/0x30 drivers/usb/core/urb.c:94
  usb_start_wait_urb+0x1e5/0x2b0 drivers/usb/core/message.c:79
  usb_internal_control_msg drivers/usb/core/message.c:101 [inline]
  usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:152
  set_port_feature+0x69/0x90 drivers/usb/core/hub.c:428
  hub_power_on+0xca/0x280 drivers/usb/core/hub.c:913
  hub_activate+0xfb7/0x1570 drivers/usb/core/hub.c:1068
  hub_configure drivers/usb/core/hub.c:1671 [inline]
  hub_probe.cold+0x21f8/0x2201 drivers/usb/core/hub.c:1864
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
  register_root_hub drivers/usb/core/hcd.c:1108 [inline]
  usb_add_hcd.cold+0x10d5/0x15c5 drivers/usb/core/hcd.c:2893
  vhci_hcd_probe+0xf6/0x230 drivers/usb/usbip/vhci_hcd.c:1340
  platform_drv_probe+0xce/0x1a0 drivers/base/platform.c:616
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  platform_device_add+0x34d/0x6c0 drivers/base/platform.c:453
  vhci_hcd_init+0x344/0x488 drivers/usb/usbip/vhci_hcd.c:1524
  do_one_initcall+0xf0/0x614 init/main.c:939
  do_initcall_level init/main.c:1007 [inline]
  do_initcalls init/main.c:1015 [inline]
  do_basic_setup init/main.c:1032 [inline]
  kernel_init_freeable+0x4a9/0x596 init/main.c:1192
  kernel_init+0xd/0x1bf init/main.c:1110
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d5749b00
  which belongs to the cache kmalloc-192 of size 192
The buggy address is located 0 bytes to the right of
  192-byte region [ffff8881d5749b00, ffff8881d5749bc0)
The buggy address belongs to the page:
page:ffffea000755d240 refcount:1 mapcount:0 mapping:ffff8881da002a00  
index:0x0
flags: 0x200000000000200(slab)
raw: 0200000000000200 ffffea000755c3c0 0000000400000004 ffff8881da002a00
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d5749a80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
  ffff8881d5749b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881d5749b80: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
                                            ^
  ffff8881d5749c00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881d5749c80: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
====


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

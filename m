Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA0A683003
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 12:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbfHFKtC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Aug 2019 06:49:02 -0400
Received: from mail-ot1-f72.google.com ([209.85.210.72]:35265 "EHLO
        mail-ot1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730868AbfHFKtC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Aug 2019 06:49:02 -0400
Received: by mail-ot1-f72.google.com with SMTP id d14so9211982otf.2
        for <linux-input@vger.kernel.org>; Tue, 06 Aug 2019 03:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=jKt6YZTF7JktFvmS7yZ+0+6rkzczBZACVIit96ilDro=;
        b=owXvV69W3A2ILIZUdncgPUndbOk/dlydLFoeYf9EmMbnJ0y7RyhjAhIJDIj/KPAXix
         lyOPNglRe/FjvMKYg186AQxoFwuLTYN2AKMBziC42dDLy6i1SfCnQSewioFa1v2qcxTE
         EjsK/dTjSmhLLk87dd5t/7P/pFuUGtiWQJdztGhc7o8h+SYZIQB1bpl3kf00wwYJbc+V
         8bY/QfbcL9fdTrvTFq43qeCuzR82N60V9T7b3BHd9VVZGOwEUKR1SdTuOUGJTxk9NI91
         YMds7Ll0gVJa7a4Y6aCrQoLf02iKbOcJbQCX3sPj+QfQRh8QJi6hs9VYQvMrwCTCVUZJ
         Sqfw==
X-Gm-Message-State: APjAAAXEbGX6JMPLuboSdCK2oXxCFd7/G2KOjlMvoWYQtGH5veUcMN+p
        2Om+Eqx/At5PME72/hRQZuie7xf9OaMJsT4ClPlPGJSkdYaN
X-Google-Smtp-Source: APXvYqz5jLFGvfOv5pWZcak5EeBXEMn63Fd2EbLyU290puvfnCMu0tOEp/RrioNuJlO5J7TZn687hwRz5OL+M7eeLpzrG/6nPv+V
MIME-Version: 1.0
X-Received: by 2002:a6b:3b89:: with SMTP id i131mr2717312ioa.33.1565088540780;
 Tue, 06 Aug 2019 03:49:00 -0700 (PDT)
Date:   Tue, 06 Aug 2019 03:49:00 -0700
In-Reply-To: <1565087891.8136.11.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000083ef3d058f7092c0@google.com>
Subject: Re: KASAN: slab-out-of-bounds Write in lg4ff_init
From:   syzbot <syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
KASAN: slab-out-of-bounds Write in lg4ff_init

logitech 0003:046D:C298.0001: unknown main item tag 0x0
logitech 0003:046D:C298.0001: unknown main item tag 0x0
logitech 0003:046D:C298.0001: hidraw0: USB HID v0.00 Device [HID 046d:c298]  
on usb-dummy_hcd.2-1/input0
==================================================================
BUG: KASAN: slab-out-of-bounds in set_bit  
include/asm-generic/bitops-instrumented.h:28 [inline]
BUG: KASAN: slab-out-of-bounds in lg4ff_init+0x878/0x1800  
drivers/hid/hid-lg4ff.c:1333
Write of size 8 at addr ffff8881d5d81dc0 by task kworker/0:0/5

CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.3.0-rc2+ #1
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
  lg4ff_init+0x878/0x1800 drivers/hid/hid-lg4ff.c:1333
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

Allocated by task 5:
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

Freed by task 0:
(stack is not available)

The buggy address belongs to the object at ffff8881d5d81d00
  which belongs to the cache kmalloc-192 of size 192
The buggy address is located 0 bytes to the right of
  192-byte region [ffff8881d5d81d00, ffff8881d5d81dc0)
The buggy address belongs to the page:
page:ffffea0007576040 refcount:1 mapcount:0 mapping:ffff8881da002a00  
index:0x0
flags: 0x200000000000200(slab)
raw: 0200000000000200 dead000000000100 dead000000000122 ffff8881da002a00
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d5d81c80: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
  ffff8881d5d81d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881d5d81d80: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
                                            ^
  ffff8881d5d81e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881d5d81e80: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10ccc0c2600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17409626600000


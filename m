Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 167B311753F
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 20:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfLITMC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 14:12:02 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:49966 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbfLITMB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 14:12:01 -0500
Received: by mail-il1-f198.google.com with SMTP id t13so12399383ilk.16
        for <linux-input@vger.kernel.org>; Mon, 09 Dec 2019 11:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=39ozbRqXY5L/QU9Grgb7zpA1Lrtvana18AVQ3mRM5Ic=;
        b=cwfJtRuoEjN7F2lP/mXnKbII84pdP2AK83ctFKEAG7zz0qOXX2CNjknAg1KdJVVEW0
         eqvWVH8ICPi305wFuqtLZ6fznIYbTBgAKFYu3fRiUxx86R2SbjdtrehWSmd0/0IQW94z
         HkGh90tfemBgmkMlNaycqai6ujquvQHRuLeqQ/lEEovfpXtBgirn3IEz5aZRZUH2v3EK
         bgbjwDI1onm3bTJNshe3NVh8pmx73dZGWnRuJDrouOu2xrqOY5T0oFgMm+kxQlzCi4nE
         F6ePutGNQ70ozLOZkThLnShCuPtVKenc1riFmKVdgTtOdBuRUbTJR5BF8pP7Vu5n+1ky
         elyA==
X-Gm-Message-State: APjAAAW3Rnlh0UtfsZOuxViNLcE8qME6tCPbCOji0m7Z16XH+5KQpdEu
        wr1FE4QCCBnrz2ddUMoZWgwSyGF11+lt7vBLanHnlJtWvogZ
X-Google-Smtp-Source: APXvYqyW/yxTLLXJrg6WTdDdp9CywagXpbmfGiKcIEo1/Y0L3RSwVr8C7h5CZteOE2SGLo7ljrZbrr9iNa6oOU21M20tef6bRsGh
MIME-Version: 1.0
X-Received: by 2002:a92:58ca:: with SMTP id z71mr28157382ilf.5.1575918720952;
 Mon, 09 Dec 2019 11:12:00 -0800 (PST)
Date:   Mon, 09 Dec 2019 11:12:00 -0800
In-Reply-To: <Pine.LNX.4.44L0.1912091337050.1462-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008eb2c605994a2b38@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hid_field_extract
From:   syzbot <syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com>
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
KASAN: slab-out-of-bounds Read in hid_field_extract

microsoft 0003:045E:07DA.0001: Report rsize 4096 csize 1
microsoft 0003:045E:07DA.0001: Field offset 0 size 12 count 4899
==================================================================
BUG: KASAN: slab-out-of-bounds in __extract drivers/hid/hid-core.c:1345  
[inline]
BUG: KASAN: slab-out-of-bounds in hid_field_extract+0x150/0x170  
drivers/hid/hid-core.c:1365
Read of size 1 at addr ffff8881cc759000 by task swapper/1/0

CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.0-syzkaller #0
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
  hid_input_field drivers/hid/hid-core.c:1538 [inline]
  hid_report_raw_event.cold+0x6c9/0xbad drivers/hid/hid-core.c:1759
  hid_input_report+0x315/0x3f0 drivers/hid/hid-core.c:1826
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
RSP: 0018:ffff8881da62fdc8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: ffff8881da613100 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881da61394c
RBP: ffffed103b4c2620 R08: ffff8881da613100 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
  cpuidle_idle_call kernel/sched/idle.c:154 [inline]
  do_idle+0x3c3/0x4e0 kernel/sched/idle.c:269
  cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:361
  start_secondary+0x27d/0x330 arch/x86/kernel/smpboot.c:264
  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:242

Allocated by task 17:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:512 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:485
  kmalloc include/linux/slab.h:561 [inline]
  hcd_buffer_alloc+0x1ed/0x290 drivers/usb/core/buffer.c:132
  usb_alloc_coherent+0x5d/0x80 drivers/usb/core/usb.c:910
  hid_alloc_buffers drivers/hid/usbhid/hid-core.c:846 [inline]
  usbhid_start+0x60b/0x22f0 drivers/hid/usbhid/hid-core.c:1075
  hid_hw_start+0x5d/0x130 drivers/hid/hid-core.c:2024
  ms_probe+0x159/0x4d0 drivers/hid/hid-microsoft.c:394
  hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2257
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0x1480/0x1c20 drivers/base/core.c:2487
  hid_add_device drivers/hid/hid-core.c:2413 [inline]
  hid_add_device+0x33c/0x9a0 drivers/hid/hid-core.c:2362
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

Freed by task 0:
(stack is not available)

The buggy address belongs to the object at ffff8881cc758000
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes to the right of
  4096-byte region [ffff8881cc758000, ffff8881cc759000)
The buggy address belongs to the page:
page:ffffea000731d600 refcount:1 mapcount:0 mapping:ffff8881da40c280  
index:0x0 compound_mapcount: 0
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da40c280
raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cc758f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881cc758f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881cc759000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                    ^
  ffff8881cc759080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881cc759100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         1f22d15c usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13b9f446e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
dashboard link: https://syzkaller.appspot.com/bug?extid=09ef48aa58261464b621
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=137641dae00000


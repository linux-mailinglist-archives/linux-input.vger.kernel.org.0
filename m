Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CBF10E9B3
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 12:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfLBLoI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 06:44:08 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:35924 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfLBLoH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 06:44:07 -0500
Received: by mail-io1-f72.google.com with SMTP id 202so13409003iou.3
        for <linux-input@vger.kernel.org>; Mon, 02 Dec 2019 03:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=N4kkmVojLzuzJ1vnplvM18tQkD7dJflaELwvFOc7XzE=;
        b=TSM73DRurKb0gQxHzZO+0G2wySMuF/J7sZOnfAolD2RFzv5f6AdXhDAk8oWqY/eaLX
         FcHm5kgSvzR1keXASRm9XhYPxzIMZXI40aF6FEk+0gKWIdX1rCUDkOOtUOlB1j1TmAet
         vCl0IkXg9lHySLhuwUHk1Rqt6unMLiuMZBP94E8fZDvwZFzPLjzVACZiuKhclv9VPX3x
         5R3I45ROquoK2I1p3DIAgXHvGsGyelUcACtibqztSPxt8D0QEA/mh3LMNzrTBxLZbITe
         n74fGwW2lr4feHT2JWo4zZWtZTG2gz/9WvJjSOS6cTY5MRAfL9pIHleBdL95RAEeobL9
         ebmA==
X-Gm-Message-State: APjAAAWpxwmkSbJmJpIPq1glQtyYPOgfPFk4HkfNXKmMiSCz0VCQudV+
        uTjNtaskVcvXJy8R0Z/YLUfUNk8bmPHXNOYQ6oupp6gXpGRf
X-Google-Smtp-Source: APXvYqzG9s9+C9Z5/Rs0aVasS+wiPsGoQHtbyyd0JP142rzPvc86aBKTjdWef6c5QtnwMdBqUlruLd8e6R1u8HNCGS0NxW5DccX/
MIME-Version: 1.0
X-Received: by 2002:a02:742:: with SMTP id f63mr13470407jaf.138.1575287046605;
 Mon, 02 Dec 2019 03:44:06 -0800 (PST)
Date:   Mon, 02 Dec 2019 03:44:06 -0800
In-Reply-To: <0000000000005365ff0593394532@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d517330598b71866@google.com>
Subject: Re: KASAN: use-after-free Read in xpad_play_effect
From:   syzbot <syzbot+bea56e0be9fb9106bcf3@syzkaller.appspotmail.com>
To:     aicommander@gmail.com, allison@lohutok.net, andreyknvl@google.com,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, ramzeto@gmail.com, rfontana@redhat.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        tom@steelseries.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    32b5e2b2 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1670902ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d88612251f7691bd
dashboard link: https://syzkaller.appspot.com/bug?extid=bea56e0be9fb9106bcf3
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=140fae9ce00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+bea56e0be9fb9106bcf3@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __lock_acquire+0x31af/0x3b60  
kernel/locking/lockdep.c:3828
Read of size 8 at addr ffff8881c1609910 by task swapper/1/0

CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xef/0x16e lib/dump_stack.c:118
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:634
  __lock_acquire+0x31af/0x3b60 kernel/locking/lockdep.c:3828
  lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4485
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0x32/0x50 kernel/locking/spinlock.c:159
  xpad_play_effect+0xfe/0xc50 drivers/input/joystick/xpad.c:1225
  ml_play_effects+0x817/0x1270 drivers/input/ff-memless.c:398
  ml_effect_timer+0x4e/0x70 drivers/input/ff-memless.c:412
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
Code: cc cc 41 56 41 55 65 44 8b 2d 6c ab 8b 7a 41 54 55 53 0f 1f 44 00 00  
e8 46 a8 cd fb e9 07 00 00 00 0f 00 2d ba 30 4c 00 fb f4 <65> 44 8b 2d 48  
ab 8b 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
RSP: 0018:ffff8881da22fdc8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: ffff8881da213100 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881da21394c
RBP: ffffed103b442620 R08: ffff8881da213100 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
  cpuidle_idle_call kernel/sched/idle.c:154 [inline]
  do_idle+0x3c3/0x4e0 kernel/sched/idle.c:269
  cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:361
  start_secondary+0x27d/0x330 arch/x86/kernel/smpboot.c:264
  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:242

Allocated by task 101:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
  kmalloc include/linux/slab.h:556 [inline]
  kzalloc include/linux/slab.h:690 [inline]
  xpad_probe+0x24b/0x1b20 drivers/input/joystick/xpad.c:1717
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

Freed by task 101:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
  slab_free_hook mm/slub.c:1424 [inline]
  slab_free_freelist_hook mm/slub.c:1457 [inline]
  slab_free mm/slub.c:3004 [inline]
  kfree+0xdc/0x310 mm/slub.c:3956
  xpad_disconnect+0x1cb/0x4a3 drivers/input/joystick/xpad.c:1865
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1134 [inline]
  device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
  device_del+0x481/0xd30 drivers/base/core.c:2664
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
  hub_port_connect drivers/usb/core/hub.c:5035 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1753/0x3860 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2264
  worker_thread+0x96/0xe20 kernel/workqueue.c:2410
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881c1609800
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 272 bytes inside of
  1024-byte region [ffff8881c1609800, ffff8881c1609c00)
The buggy address belongs to the page:
page:ffffea0007058200 refcount:1 mapcount:0 mapping:ffff8881da002280  
index:0x0 compound_mapcount: 0
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da002280
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881c1609800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881c1609880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881c1609900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                          ^
  ffff8881c1609980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881c1609a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


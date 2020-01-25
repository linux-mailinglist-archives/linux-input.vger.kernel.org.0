Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71DAE1497FD
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2020 22:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgAYVnK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Jan 2020 16:43:10 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:49572 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgAYVnK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Jan 2020 16:43:10 -0500
Received: by mail-il1-f197.google.com with SMTP id p67so4500034ill.16
        for <linux-input@vger.kernel.org>; Sat, 25 Jan 2020 13:43:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=u3/Yz28tXHYoh4c/oG4L1nydzRq40saQZL681g9cEOg=;
        b=Yk6nnQTvLqEOD2ml5BvqOuWxAkY1ohRiVIRCAP3JNM4PXI/yh/x1XC153L/3xjQ4c3
         fGX8l5KiZBRT/iHfHKrNsc+p9MWoBTUVjAH3wc6dHC/krW6RCECvzPn9NSzA1rkffZFK
         j7xwYrITMpZYjEXYcmJLSjhIJn1a2tPOEixTMRFlLMjzoKhqPxYLY7zUA5v+tmWBB+Hd
         bp1VpPEKxW3nClRYtGQljNpdkT4cUHjcDAk4pol/dr1o57WJ8IiPUyVK+YcFtvRe3T3n
         2aOwLWmFe5M77nW0GwT25Gq9K/VxYdHnZpgsYE61cRsD9cG2hOo2GjlPl+d/7H6fDDe9
         IfKg==
X-Gm-Message-State: APjAAAVa3m2QGaZp1sbBioCoAlIrgnZfu0h+VAqGolDpjjgKmo7XELJo
        AWHBzuOFNbiMdQ/Bl1oC7TmoLqzUUJYTpQQZX2oUY2dNAco8
X-Google-Smtp-Source: APXvYqwnvKbnT826GpUqsGVufjTNkZk/5Yg5YxtLpXcLHdX5Dh0Z3X303ir3zR5nuZ7qhPwxv+PPzKJfW76GQBRlKFPmenE1rjM6
MIME-Version: 1.0
X-Received: by 2002:a5e:8e4b:: with SMTP id r11mr7531521ioo.167.1579988589308;
 Sat, 25 Jan 2020 13:43:09 -0800 (PST)
Date:   Sat, 25 Jan 2020 13:43:09 -0800
In-Reply-To: <0000000000004dbaf2059c193a36@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009d7036059cfdc2be@google.com>
Subject: Re: KASAN: use-after-free Read in hiddev_disconnect
From:   syzbot <syzbot+106b378813251e52fc5e@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    cd234325 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=176dd6bee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bb745005307bc641
dashboard link: https://syzkaller.appspot.com/bug?extid=106b378813251e52fc5e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14c6f9c9e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=170766bee00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+106b378813251e52fc5e@syzkaller.appspotmail.com

usb 3-1: USB disconnect, device number 4
==================================================================
BUG: KASAN: use-after-free in __lock_acquire+0x31af/0x3b60 kernel/locking/lockdep.c:3827
Read of size 8 at addr ffff8881cb1974a8 by task kworker/0:1/12

CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.5.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
 __kasan_report.cold+0x37/0x85 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:639
 __lock_acquire+0x31af/0x3b60 kernel/locking/lockdep.c:3827
 lock_acquire+0x130/0x340 kernel/locking/lockdep.c:4484
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x32/0x50 kernel/locking/spinlock.c:159
 __wake_up_common_lock+0xb4/0x130 kernel/sched/wait.c:122
 hiddev_disconnect+0x154/0x1b4 drivers/hid/usbhid/hiddev.c:937
 hid_disconnect+0xb4/0x1a0 drivers/hid/hid-core.c:2008
 hid_hw_stop+0x12/0x70 drivers/hid/hid-core.c:2053
 cmhid_remove+0x38/0x50 drivers/hid/hid-cmedia.c:140
 hid_device_remove+0xed/0x240 drivers/hid/hid-core.c:2294
 __device_release_driver drivers/base/dd.c:1132 [inline]
 device_release_driver_internal+0x231/0x500 drivers/base/dd.c:1165
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:532
 device_del+0x481/0xd30 drivers/base/core.c:2664
 hid_remove_device drivers/hid/hid-core.c:2465 [inline]
 hid_destroy_device+0xe1/0x150 drivers/hid/hid-core.c:2484
 usbhid_disconnect+0x9f/0xe0 drivers/hid/usbhid/hid-core.c:1413
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
 __device_release_driver drivers/base/dd.c:1134 [inline]
 device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:532
 device_del+0x481/0xd30 drivers/base/core.c:2664
 usb_disable_device+0x23d/0x790 drivers/usb/core/message.c:1237
 usb_disconnect+0x293/0x900 drivers/usb/core/hub.c:2201
 hub_port_connect drivers/usb/core/hub.c:5036 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5325 [inline]
 port_event drivers/usb/core/hub.c:5471 [inline]
 hub_event+0x1a1d/0x4300 drivers/usb/core/hub.c:5553
 process_one_work+0x945/0x15c0 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 12:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:513 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:486
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:670 [inline]
 hiddev_connect+0x242/0x5b0 drivers/hid/usbhid/hiddev.c:890
 hid_connect+0x239/0xbb0 drivers/hid/hid-core.c:1934
 hid_hw_start drivers/hid/hid-core.c:2033 [inline]
 hid_hw_start+0xa2/0x130 drivers/hid/hid-core.c:2024
 cmhid_probe+0x104/0x160 drivers/hid/hid-cmedia.c:123
 hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2261
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 hid_add_device drivers/hid/hid-core.c:2417 [inline]
 hid_add_device+0x33c/0x9a0 drivers/hid/hid-core.c:2366
 usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:361
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
 usb_probe_device+0xaf/0x140 drivers/usb/core/driver.c:266
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2538
 hub_port_connect drivers/usb/core/hub.c:5185 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5325 [inline]
 port_event drivers/usb/core/hub.c:5471 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5553
 process_one_work+0x945/0x15c0 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 1853:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:335 [inline]
 __kasan_slab_free+0x117/0x160 mm/kasan/common.c:474
 slab_free_hook mm/slub.c:1425 [inline]
 slab_free_freelist_hook mm/slub.c:1458 [inline]
 slab_free mm/slub.c:3005 [inline]
 kfree+0xd5/0x300 mm/slub.c:3957
 hiddev_release+0x402/0x520 drivers/hid/usbhid/hiddev.c:232
 __fput+0x2d7/0x840 fs/file_table.c:280
 task_work_run+0x13f/0x1c0 kernel/task_work.c:113
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:164
 prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
 do_syscall_64+0x4e0/0x5a0 arch/x86/entry/common.c:304
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881cb197400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 168 bytes inside of
 512-byte region [ffff8881cb197400, ffff8881cb197600)
The buggy address belongs to the page:
page:ffffea00072c6500 refcount:1 mapcount:0 mapping:ffff8881da002500 index:0x0 compound_mapcount: 0
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da002500
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881cb197380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8881cb197400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8881cb197480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff8881cb197500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881cb197580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


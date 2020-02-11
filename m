Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C211587CB
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2020 02:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbgBKBQN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Feb 2020 20:16:13 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:48425 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbgBKBQN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Feb 2020 20:16:13 -0500
Received: by mail-io1-f71.google.com with SMTP id e15so5950774ioh.15
        for <linux-input@vger.kernel.org>; Mon, 10 Feb 2020 17:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=C4ZSySAadciP/qy5lHe+8m4JJ/rKCTer5ZGKdDebbL0=;
        b=D5sZz2vMZ2p69Nt/Y1Pve35ySSx2bLU91xo76F0tcO+dU1RYU8gTkcnmanQgYDu4d0
         2BfIrd76z36RSaAdfNZ51/AD21vAJ1HyU3MyTabvzgn81BtLH9/PNM8zYjnBM+nDxYmR
         1GIbYSo+2oBcQve9luLy5aV3Iwah4pqwaO7XOKDkQIIgPblxA2TXCSZPFhNw6abdpy2E
         1bRziY92YddUb7/cHtO3tp7wqRfvPcKBI4/wE/Si6HkAxXS2h5FYBlzOZENvO0eB8e88
         PZEIoxpLxjSYdvzChnJ8hXKdQt0qJssQyGqyAB6+vHqcXhbWgo+/giWPSbEKix3QFEfa
         g8nQ==
X-Gm-Message-State: APjAAAWVaAxz7VRqGmq/oWReqyLag86yPrt8znOl/mr2ch0by0tHlKTG
        g7fd1Z0PYmKG0Q6gZSRrVPe08Tdj0V1Xbgba/O60WWagbzYZ
X-Google-Smtp-Source: APXvYqwsOT/OwXGXrX7P8JU//4vXFQ8QPjqEYzAvGCMjyLsMo6zisZL5EM4kfxLU0VJ/pqwzmXj/HXZ1oJjwLVRKdrIhVcb4VKKJ
MIME-Version: 1.0
X-Received: by 2002:a6b:b206:: with SMTP id b6mr11661758iof.299.1581383772669;
 Mon, 10 Feb 2020 17:16:12 -0800 (PST)
Date:   Mon, 10 Feb 2020 17:16:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000610eb059e429abd@google.com>
Subject: KASAN: slab-out-of-bounds Write in betop_probe
From:   syzbot <syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e5cd56e9 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1517fed9e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8cff427cc8996115
dashboard link: https://syzkaller.appspot.com/bug?extid=07efed3bc5a1407bd742
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147026b5e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1683b6b5e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com

betop 0003:20BC:5500.0001: unknown main item tag 0x0
betop 0003:20BC:5500.0001: hidraw0: USB HID v0.00 Device [HID 20bc:5500] on usb-dummy_hcd.0-1/input0
==================================================================
BUG: KASAN: slab-out-of-bounds in set_bit include/asm-generic/bitops/instrumented-atomic.h:28 [inline]
BUG: KASAN: slab-out-of-bounds in betopff_init drivers/hid/hid-betopff.c:99 [inline]
BUG: KASAN: slab-out-of-bounds in betop_probe+0x396/0x570 drivers/hid/hid-betopff.c:134
Write of size 8 at addr ffff8881d4f43ac0 by task kworker/1:2/94

CPU: 1 PID: 94 Comm: kworker/1:2 Not tainted 5.5.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
 __kasan_report.cold+0x37/0x77 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:641
 check_memory_region_inline mm/kasan/generic.c:185 [inline]
 check_memory_region+0x152/0x1c0 mm/kasan/generic.c:192
 set_bit include/asm-generic/bitops/instrumented-atomic.h:28 [inline]
 betopff_init drivers/hid/hid-betopff.c:99 [inline]
 betop_probe+0x396/0x570 drivers/hid/hid-betopff.c:134
 hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2261
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 hid_add_device drivers/hid/hid-core.c:2417 [inline]
 hid_add_device+0x33c/0x9a0 drivers/hid/hid-core.c:2366
 usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:361
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
 usb_probe_device+0xaf/0x140 drivers/usb/core/driver.c:266
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2538
 hub_port_connect drivers/usb/core/hub.c:5185 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5325 [inline]
 port_event drivers/usb/core/hub.c:5471 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5553
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 94:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:515 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:488
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:670 [inline]
 hidraw_connect+0x4b/0x3e0 drivers/hid/hidraw.c:521
 hid_connect+0x5c7/0xbb0 drivers/hid/hid-core.c:1937
 hid_hw_start drivers/hid/hid-core.c:2033 [inline]
 hid_hw_start+0xa2/0x130 drivers/hid/hid-core.c:2024
 betop_probe+0xbc/0x570 drivers/hid/hid-betopff.c:128
 hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2261
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 hid_add_device drivers/hid/hid-core.c:2417 [inline]
 hid_add_device+0x33c/0x9a0 drivers/hid/hid-core.c:2366
 usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:361
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
 usb_probe_device+0xaf/0x140 drivers/usb/core/driver.c:266
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2538
 hub_port_connect drivers/usb/core/hub.c:5185 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5325 [inline]
 port_event drivers/usb/core/hub.c:5471 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5553
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 12:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:337 [inline]
 __kasan_slab_free+0x117/0x160 mm/kasan/common.c:476
 slab_free_hook mm/slub.c:1444 [inline]
 slab_free_freelist_hook mm/slub.c:1477 [inline]
 slab_free mm/slub.c:3024 [inline]
 kfree+0xd5/0x300 mm/slub.c:3976
 urb_destroy drivers/usb/core/urb.c:26 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_free_urb.part.0+0xaf/0x110 drivers/usb/core/urb.c:96
 usb_free_urb+0x1b/0x30 drivers/usb/core/urb.c:95
 usb_start_wait_urb+0x1e8/0x4c0 drivers/usb/core/message.c:79
 usb_internal_control_msg drivers/usb/core/message.c:101 [inline]
 usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:152
 get_port_status drivers/usb/core/hub.c:570 [inline]
 hub_ext_port_status+0x125/0x460 drivers/usb/core/hub.c:587
 hub_port_status drivers/usb/core/hub.c:609 [inline]
 hub_activate+0x51f/0x17c0 drivers/usb/core/hub.c:1112
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d4f43a00
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 0 bytes to the right of
 192-byte region [ffff8881d4f43a00, ffff8881d4f43ac0)
The buggy address belongs to the page:
page:ffffea000753d0c0 refcount:1 mapcount:0 mapping:ffff8881da002a00 index:0x0
flags: 0x200000000000200(slab)
raw: 0200000000000200 ffffea0007567200 0000000300000003 ffff8881da002a00
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881d4f43980: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff8881d4f43a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff8881d4f43a80: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
                                           ^
 ffff8881d4f43b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8881d4f43b80: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

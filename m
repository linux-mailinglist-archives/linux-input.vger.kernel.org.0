Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0BA11DFE50
	for <lists+linux-input@lfdr.de>; Sun, 24 May 2020 12:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbgEXKYP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 May 2020 06:24:15 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:56229 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729038AbgEXKYO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 May 2020 06:24:14 -0400
Received: by mail-io1-f71.google.com with SMTP id o21so10613688ioo.22
        for <linux-input@vger.kernel.org>; Sun, 24 May 2020 03:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=4ztkW3nZY9NqmAIxIJOO4Lax93tu9+93O6Ykads7RWQ=;
        b=meLYkpEQCWOeGtEeKWxoutJQoVNtR9WXD7yArSFKQf7lwq1aU6KMKBF5BEBrWJHGIE
         nznM/wQv8deZMlRMhJcnjiJzGqjRQ8XM7HWwf7gyrDeXVxvQTrIbdImnqQe7gF7j9hGN
         aeIiBRU2/me1IwiP7JFYSwua5B1v4Q3Z7dULV55pbgZTyjjb3AU8RiTEn+8XRu9RzveZ
         BFDpm4SsSAaCHteJMgFUBvozPkW3nCUjVaR0YB5t1NZTBPrflzM2brYNiYt8Yvlc0UTo
         YnZhNbKiLcUyCbKz4SuDo353hjV0IU5cTuSMOoiJLuZP1U6KNALMlmEYYewiS8vYpDVI
         7MWA==
X-Gm-Message-State: AOAM530RNdtY3HUZL9xG2Wwb4/fFX7yyRtUmWSwKpyNcz3YAY9ydgEbz
        Yk/oE35tCQqEKSLYW2V1Vt3Ry1PiplrHsqlJ4W00qkiYIG7E
X-Google-Smtp-Source: ABdhPJyajMESZ23qxRjGS0UBza0mwdABItH2dJweJbCNxica3g5/qpltVjmGwh6MJlEzBga9DVfexrAnSKMf05emg4FzSbZ/3kz9
MIME-Version: 1.0
X-Received: by 2002:a6b:6414:: with SMTP id t20mr9606717iog.32.1590315852954;
 Sun, 24 May 2020 03:24:12 -0700 (PDT)
Date:   Sun, 24 May 2020 03:24:12 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007f040505a6624308@google.com>
Subject: KASAN: use-after-free Read in joydev_cleanup
From:   syzbot <syzbot+833ac95f0a2451d63a9f@syzkaller.appspotmail.com>
To:     brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael.j.wysocki@intel.com, rdunlap@infradead.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    c11d28ab Add linux-next specific files for 20200522
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1587269a100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6dbdea4159fb66
dashboard link: https://syzkaller.appspot.com/bug?extid=833ac95f0a2451d63a9f
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1114d626100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c4da9a100000

The bug was bisected to:

commit 4ef12f7198023c09ad6d25b652bd8748c965c7fa
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Wed May 13 15:18:40 2020 +0000

    kobject: Make sure the parent does not get released before its children

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14714f06100000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=16714f06100000
console output: https://syzkaller.appspot.com/x/log.txt?x=12714f06100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+833ac95f0a2451d63a9f@syzkaller.appspotmail.com
Fixes: 4ef12f719802 ("kobject: Make sure the parent does not get released before its children")

usb 1-1: USB disconnect, device number 2
==================================================================
BUG: KASAN: use-after-free in __mutex_lock_common kernel/locking/mutex.c:938 [inline]
BUG: KASAN: use-after-free in __mutex_lock+0x1033/0x13c0 kernel/locking/mutex.c:1103
Read of size 8 at addr ffff888094878150 by task kworker/0:1/12

CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.7.0-rc6-next-20200522-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x413 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 __mutex_lock_common kernel/locking/mutex.c:938 [inline]
 __mutex_lock+0x1033/0x13c0 kernel/locking/mutex.c:1103
 joydev_mark_dead drivers/input/joydev.c:729 [inline]
 joydev_cleanup+0x21/0x190 drivers/input/joydev.c:738
 joydev_disconnect+0x45/0xb0 drivers/input/joydev.c:1010
 __input_unregister_device+0x1b0/0x430 drivers/input/input.c:2091
 input_unregister_device+0xb4/0xf0 drivers/input/input.c:2273
 hidinput_disconnect+0x15e/0x3d0 drivers/hid/hid-input.c:1968
 hid_disconnect+0x13f/0x1a0 drivers/hid/hid-core.c:2008
 hid_hw_stop+0x12/0x70 drivers/hid/hid-core.c:2055
 hid_device_remove+0xed/0x240 drivers/hid/hid-core.c:2296
 __device_release_driver drivers/base/dd.c:1111 [inline]
 device_release_driver_internal+0x231/0x500 drivers/base/dd.c:1144
 bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2839
 hid_remove_device drivers/hid/hid-core.c:2467 [inline]
 hid_destroy_device+0xe1/0x150 drivers/hid/hid-core.c:2486
 usbhid_disconnect+0x9f/0xe0 drivers/hid/usbhid/hid-core.c:1434
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
 __device_release_driver drivers/base/dd.c:1113 [inline]
 device_release_driver_internal+0x432/0x500 drivers/base/dd.c:1144
 bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2839
 usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1245
 usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2217
 hub_port_connect drivers/usb/core/hub.c:5059 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x17ca/0x38f0 drivers/usb/core/hub.c:5576
 process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
 worker_thread+0x96/0xe20 kernel/workqueue.c:2414
 kthread+0x3b5/0x4a0 kernel/kthread.c:291
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351

Allocated by task 17:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc mm/kasan/common.c:494 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:467
 kmem_cache_alloc_trace+0x153/0x7d0 mm/slab.c:3551
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 joydev_connect+0x83/0xd2f drivers/input/joydev.c:913
 input_attach_handler+0x194/0x200 drivers/input/input.c:1031
 input_register_device.cold+0xf5/0x246 drivers/input/input.c:2229
 hidinput_connect+0x4f8f/0xdb30 drivers/hid/hid-input.c:1935
 hid_connect+0x96b/0xbc0 drivers/hid/hid-core.c:1931
 hid_hw_start drivers/hid/hid-core.c:2035 [inline]
 hid_hw_start+0xa2/0x130 drivers/hid/hid-core.c:2026
 sony_probe+0x214/0x2d0 drivers/hid/hid-sony.c:2868
 hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2263
 really_probe+0x281/0x6d0 drivers/base/dd.c:525
 driver_probe_device+0xfe/0x1d0 drivers/base/dd.c:701
 __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:807
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x21a/0x360 drivers/base/dd.c:873
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xaf1/0x1900 drivers/base/core.c:2662
 hid_add_device drivers/hid/hid-core.c:2419 [inline]
 hid_add_device+0x33c/0x9a0 drivers/hid/hid-core.c:2368
 usbhid_probe+0xac8/0xff0 drivers/hid/usbhid/hid-core.c:1407
 usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:374
 really_probe+0x281/0x6d0 drivers/base/dd.c:525
 driver_probe_device+0xfe/0x1d0 drivers/base/dd.c:701
 __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:807
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x21a/0x360 drivers/base/dd.c:873
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xaf1/0x1900 drivers/base/core.c:2662
 usb_set_configuration+0xec5/0x1740 drivers/usb/core/message.c:2032
 usb_generic_driver_probe+0x9d/0xe0 drivers/usb/core/generic.c:241
 usb_probe_device+0xc6/0x1f0 drivers/usb/core/driver.c:272
 really_probe+0x281/0x6d0 drivers/base/dd.c:525
 driver_probe_device+0xfe/0x1d0 drivers/base/dd.c:701
 __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:807
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x21a/0x360 drivers/base/dd.c:873
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xaf1/0x1900 drivers/base/core.c:2662
 usb_new_device.cold+0x753/0x103d drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5208 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x1eca/0x38f0 drivers/usb/core/hub.c:5576
 process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
 worker_thread+0x96/0xe20 kernel/workqueue.c:2414
 kthread+0x3b5/0x4a0 kernel/kthread.c:291
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351

Freed by task 12:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 kasan_set_free_info mm/kasan/common.c:316 [inline]
 __kasan_slab_free+0xf7/0x140 mm/kasan/common.c:455
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x109/0x2b0 mm/slab.c:3757
 device_release+0x71/0x200 drivers/base/core.c:1541
 kobject_cleanup lib/kobject.c:701 [inline]
 kobject_release lib/kobject.c:732 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1c8/0x2f0 lib/kobject.c:749
 cdev_device_del+0x69/0x80 fs/char_dev.c:575
 joydev_disconnect+0x3d/0xb0 drivers/input/joydev.c:1009
 __input_unregister_device+0x1b0/0x430 drivers/input/input.c:2091
 input_unregister_device+0xb4/0xf0 drivers/input/input.c:2273
 hidinput_disconnect+0x15e/0x3d0 drivers/hid/hid-input.c:1968
 hid_disconnect+0x13f/0x1a0 drivers/hid/hid-core.c:2008
 hid_hw_stop+0x12/0x70 drivers/hid/hid-core.c:2055
 hid_device_remove+0xed/0x240 drivers/hid/hid-core.c:2296
 __device_release_driver drivers/base/dd.c:1111 [inline]
 device_release_driver_internal+0x231/0x500 drivers/base/dd.c:1144
 bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2839
 hid_remove_device drivers/hid/hid-core.c:2467 [inline]
 hid_destroy_device+0xe1/0x150 drivers/hid/hid-core.c:2486
 usbhid_disconnect+0x9f/0xe0 drivers/hid/usbhid/hid-core.c:1434
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
 __device_release_driver drivers/base/dd.c:1113 [inline]
 device_release_driver_internal+0x432/0x500 drivers/base/dd.c:1144
 bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2839
 usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1245
 usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2217
 hub_port_connect drivers/usb/core/hub.c:5059 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x17ca/0x38f0 drivers/usb/core/hub.c:5576
 process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
 worker_thread+0x96/0xe20 kernel/workqueue.c:2414
 kthread+0x3b5/0x4a0 kernel/kthread.c:291
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351

The buggy address belongs to the object at ffff888094878000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 336 bytes inside of
 8192-byte region [ffff888094878000, ffff88809487a000)
The buggy address belongs to the page:
page:ffffea0002521e00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 head:ffffea0002521e00 order:2 compound_mapcount:0 compound_pincount:0
flags: 0xfffe0000010200(slab|head)
raw: 00fffe0000010200 ffffea00025d3b08 ffff8880aa001b50 ffff8880aa0021c0
raw: 0000000000000000 ffff888094878000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888094878000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888094878080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888094878100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff888094878180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888094878200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

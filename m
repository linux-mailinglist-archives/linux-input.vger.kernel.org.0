Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE9BB116BB2
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 12:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLILFK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 06:05:10 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:40079 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbfLILFK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 06:05:10 -0500
Received: by mail-il1-f199.google.com with SMTP id s10so11308774ilh.7
        for <linux-input@vger.kernel.org>; Mon, 09 Dec 2019 03:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=xM5VP4PpCu1ndTXZ/Sfzh9qHLEM9aOg4KzWtzZmLLg0=;
        b=SYm1ZfQ6Crsw+252+Ki9vZH7UpHjy9idDtOIhEfRby3BhHu51Agdb0cuO7OTAxFfa2
         68w64gIRYjVeZDpFIgxjiZKU/sDXQANkWAPa8XZlvXfUYfxjUKzPVnWo4EeoG4q5qjy1
         vJvUdbg/rQCzmOro0pvaKvEqjzVK0IllYU53CPDguyyNQUQwAEYXC2X4THg55HxabqZz
         81WejmEOGKZEsfTMDXR5LFR9obvF6bzpy8qkpxIsRKnD6RzdoBMOFx1hWOKkhy3bYq56
         JzBch5QGZiVu4p5k4YqEyYNGnPUcotdWdZAh6SLdvG5hV5zCvTUcGhOZJzN8OPm6SW/S
         QQaQ==
X-Gm-Message-State: APjAAAVhkZXKr46rbOgdd8nuzT2xwx+3CN/TbFxiaIZtutZQa3PlAr8R
        0U0wOTwvFtP9a9wnfHXHbyEt23Ezjpr8r5hqPuN6d2N4KQh5
X-Google-Smtp-Source: APXvYqwJKyhBY6fvxrYABN0tOrXmGfhukYlUZ1WxNbV3wtseGBlncv05zIfjOEgrMPkqHG/w93JOwb4Iz7tpqJrWgv/RV4/o6Ygd
MIME-Version: 1.0
X-Received: by 2002:a5d:96c6:: with SMTP id r6mr6639913iol.236.1575889509728;
 Mon, 09 Dec 2019 03:05:09 -0800 (PST)
Date:   Mon, 09 Dec 2019 03:05:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006eca960599435e76@google.com>
Subject: KASAN: slab-out-of-bounds Write in hidinput_setkeycode
From:   syzbot <syzbot+aed9115d05783f14777a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        rydberg@bitmath.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    1f22d15c usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=13c9bb7ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
dashboard link: https://syzkaller.appspot.com/bug?extid=aed9115d05783f14777a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13145c2ee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17dca1eae00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+aed9115d05783f14777a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in clear_bit  
include/asm-generic/bitops-instrumented.h:56 [inline]
BUG: KASAN: slab-out-of-bounds in hidinput_setkeycode+0x16e/0x390  
drivers/hid/hid-input.c:165
Write of size 8 at addr ffff8881cf9649e8 by task syz-executor105/1717

CPU: 1 PID: 1717 Comm: syz-executor105 Not tainted 5.4.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xef/0x16e lib/dump_stack.c:118
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:638
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  clear_bit include/asm-generic/bitops-instrumented.h:56 [inline]
  hidinput_setkeycode+0x16e/0x390 drivers/hid/hid-input.c:165
  input_set_keycode+0x104/0x320 drivers/input/input.c:935
  evdev_handle_set_keycode_v2+0xc4/0x120 drivers/input/evdev.c:882
  evdev_do_ioctl drivers/input/evdev.c:1150 [inline]
  evdev_ioctl_handler+0xd49/0x19f0 drivers/input/evdev.c:1284
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:539 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:726
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:743
  __do_sys_ioctl fs/ioctl.c:750 [inline]
  __se_sys_ioctl fs/ioctl.c:748 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:748
  do_syscall_64+0xb7/0x5b0 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x446d59
Code: e8 2c ae 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 1b d8 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffd75eec118 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffd75eec120 RCX: 0000000000446d59
RDX: 0000000020000080 RSI: 0000000040284504 RDI: 0000000000000005
RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000004029f0
R10: 00007ffd75eebc70 R11: 0000000000000246 R12: 0000000000404a00
R13: 0000000000404a90 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 12:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:512 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:485
  kmalloc include/linux/slab.h:556 [inline]
  kzalloc include/linux/slab.h:670 [inline]
  input_allocate_device+0x3e/0x260 drivers/input/input.c:1810
  hidinput_allocate drivers/hid/hid-input.c:1654 [inline]
  hidinput_connect+0x3cab/0xdb90 drivers/hid/hid-input.c:1899
  hid_connect+0x965/0xbb0 drivers/hid/hid-core.c:1923
  hid_hw_start drivers/hid/hid-core.c:2027 [inline]
  hid_hw_start+0xa2/0x130 drivers/hid/hid-core.c:2018
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
  process_scheduled_works kernel/workqueue.c:2326 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2412
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 0:
(stack is not available)

The buggy address belongs to the object at ffff8881cf964000
  which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 488 bytes to the right of
  2048-byte region [ffff8881cf964000, ffff8881cf964800)
The buggy address belongs to the page:
page:ffffea00073e5800 refcount:1 mapcount:0 mapping:ffff8881da40c000  
index:0x0 compound_mapcount: 0
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da40c000
raw: 0000000000000000 0000000000080008 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cf964880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881cf964900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8881cf964980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                           ^
  ffff8881cf964a00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881cf964a80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

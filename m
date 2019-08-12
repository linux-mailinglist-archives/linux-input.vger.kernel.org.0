Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B63189A67
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 11:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbfHLJuC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 05:50:02 -0400
Received: from mail-ot1-f72.google.com ([209.85.210.72]:52541 "EHLO
        mail-ot1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfHLJuC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 05:50:02 -0400
Received: by mail-ot1-f72.google.com with SMTP id 88so4336400otc.19
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 02:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+gJ6vT0eRzHl6Kefc3x6OXPPp9+GyuRZ/8pQ2kcNNpE=;
        b=EGz9CyB9Zzr7qFwx8m/JadAk68uTcm++URG3PUV72fNkxfjyF/RO7pqp5wg5+ni1wA
         YRYzPn6StoMoo4lXMUUUQUuoWX/MGDDJ7N0qYeAYbk2n9lhxpkYzgSkp9i+VU5c22ntz
         oXPG3XGWJvXwHvOHpP9c+n5N3wFexCtnJwC12wJgq0ZwuFJvEafSxyz0/pOFgiuEFkTo
         dZinhnzPC4LQdpSRqyu0SBVzkVlXAvNpofSPIprR6H3otKL2kPTTDHiCsPdSrRCdtOUw
         n38Y7PQRap68FDNtYbS+eZDhDxW4V8eJlmPpWA3JN3PQZgW2kcs28Q5BmY8gQ7ZsZYb/
         Cxpw==
X-Gm-Message-State: APjAAAVljxh9dD7iTU5yqg02dyF3WU5QKAk4K/naFcrr/DYxHFQtk6jj
        5FdKUMwM3adTsSqX7sLVUOGSPqRBeVIrMLimasbDbAaEd6Vy
X-Google-Smtp-Source: APXvYqzmCcPpAOBdNuD9Ev1pqPdV19MSSMdBj0L/pBv6PPj9f2Tfbbyx1IkifM/VxR8c/6dmTyzBT3m7EUYjHqo6Wft5+wVWKH76
MIME-Version: 1.0
X-Received: by 2002:a02:a1c7:: with SMTP id o7mr37620966jah.26.1565603401135;
 Mon, 12 Aug 2019 02:50:01 -0700 (PDT)
Date:   Mon, 12 Aug 2019 02:50:01 -0700
In-Reply-To: <1565602332.14671.5.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009587b8058fe87274@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
From:   syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>
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
KASAN: slab-out-of-bounds Read in hidraw_ioctl

==================================================================
BUG: KASAN: slab-out-of-bounds in strnlen+0x75/0x80 lib/string.c:542
Read of size 1 at addr ffff8881d6a51f38 by task syz-executor.2/2785

CPU: 1 PID: 2785 Comm: syz-executor.2 Not tainted 5.3.0-rc2+ #1
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  strnlen+0x75/0x80 lib/string.c:542
  strnlen include/linux/string.h:292 [inline]
  hidraw_ioctl+0x247/0xaa0 drivers/hid/hidraw.c:446
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459829
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fc7df1d0c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
RDX: 0000000000000000 RSI: 0000000080404805 RDI: 0000000000000004
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fc7df1d16d4
R13: 00000000004c21de R14: 00000000004d5620 R15: 00000000ffffffff

Allocated by task 2868:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  slab_post_alloc_hook mm/slab.h:520 [inline]
  slab_alloc_node mm/slub.c:2766 [inline]
  __kmalloc_node_track_caller+0xd0/0x230 mm/slub.c:4361
  __kmalloc_reserve.isra.0+0x39/0xe0 net/core/skbuff.c:141
  __alloc_skb+0xef/0x5a0 net/core/skbuff.c:209
  alloc_skb include/linux/skbuff.h:1055 [inline]
  alloc_uevent_skb+0x7b/0x210 lib/kobject_uevent.c:289
  uevent_net_broadcast_untagged lib/kobject_uevent.c:325 [inline]
  kobject_uevent_net_broadcast lib/kobject_uevent.c:408 [inline]
  kobject_uevent_env+0x8ee/0x1160 lib/kobject_uevent.c:592
  device_add+0xade/0x16f0 drivers/base/core.c:2113
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

Freed by task 238:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1470 [inline]
  slab_free mm/slub.c:3012 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3953
  skb_free_head+0x8b/0xa0 net/core/skbuff.c:591
  skb_release_data+0x41f/0x7c0 net/core/skbuff.c:611
  skb_release_all+0x46/0x60 net/core/skbuff.c:665
  __kfree_skb net/core/skbuff.c:679 [inline]
  consume_skb net/core/skbuff.c:838 [inline]
  consume_skb+0xd9/0x320 net/core/skbuff.c:832
  skb_free_datagram+0x16/0xf0 net/core/datagram.c:328
  netlink_recvmsg+0x65e/0xee0 net/netlink/af_netlink.c:1996
  sock_recvmsg_nosec net/socket.c:871 [inline]
  sock_recvmsg net/socket.c:889 [inline]
  sock_recvmsg+0xca/0x110 net/socket.c:885
  ___sys_recvmsg+0x271/0x5a0 net/socket.c:2480
  __sys_recvmsg+0xe9/0x1b0 net/socket.c:2537
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881d6a51b00
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 56 bytes to the right of
  1024-byte region [ffff8881d6a51b00, ffff8881d6a51f00)
The buggy address belongs to the page:
page:ffffea00075a9400 refcount:1 mapcount:0 mapping:ffff8881da002280  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da002280
raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d6a51e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d6a51e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881d6a51f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                         ^
  ffff8881d6a51f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d6a52000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1183deee600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1603c7c2600000


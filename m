Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B04281892
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 13:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbfHEL6J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 07:58:09 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:44143 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbfHEL6I (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Aug 2019 07:58:08 -0400
Received: by mail-io1-f69.google.com with SMTP id s9so91960674iob.11
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2019 04:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Ixk43eItqra8h9Wa45X6I4lrUFoe5aJLAFw3T1SdFyY=;
        b=eDdLjf1Sq3PCS3LFhCoPMiKM+J6WCSoJboeW+tJmuSTrlyxCEJVL5Vxa+nfG5g5oz2
         Wi9mtIT+TUPERkodfVavyo+s3jhsoITcKw6kf3tWJAgoKN+jFkqpyAxkKrOna2PH1Bge
         PlPxJOi7cvcWLkOapZl69XpIcMAMLcHcKMmHJuREojl8e/gUcQapbfQvgC8YWKUf2lGu
         KOjabg3TbbS/OyH+gBR4ldywSVbJFpVLM0zXsBio/3yd7L6neeTLHeUfqFbtTvL5K9M2
         UoTsHLT9Q4a8bObokXs/6ZbF9GO4lDceOYcuKQpRcTOK2lJKbUu94Fqw/sA8xaNSkxbE
         d9Og==
X-Gm-Message-State: APjAAAVKq7ms4j8yb13+QZUdSMEweo3kvAY8RgYFFDGJ9ZQkqTHE61UF
        EmPyW90qvDTJb64XIR/5ZFQFl4ZoCztWl1kSSQaflATpiTwM
X-Google-Smtp-Source: APXvYqxp8W6uhnxexfwFmcf1UA7J8RGhrxx7u0CBUm42X1wrvNOuVp5t0YWQMI2U3hQVN5cyS3Gw8fR98IKdDKspIPXr+twCiE6y
MIME-Version: 1.0
X-Received: by 2002:a02:3f0a:: with SMTP id d10mr80696447jaa.23.1565006287430;
 Mon, 05 Aug 2019 04:58:07 -0700 (PDT)
Date:   Mon, 05 Aug 2019 04:58:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d56d4c058f5d6b2b@google.com>
Subject: KASAN: use-after-free Read in usbhid_wait_io
From:   syzbot <syzbot+cff772ea5b2812d504a9@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=136bed1a600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
dashboard link: https://syzkaller.appspot.com/bug?extid=cff772ea5b2812d504a9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+cff772ea5b2812d504a9@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in test_bit  
include/asm-generic/bitops-instrumented.h:237 [inline]
BUG: KASAN: use-after-free in usbhid_wait_io+0xc9/0x3a0  
drivers/hid/usbhid/hid-core.c:646
Read of size 8 at addr ffff8881c84068c0 by task syz-executor.2/3548

CPU: 1 PID: 3548 Comm: syz-executor.2 Not tainted 5.3.0-rc2+ #24
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  test_bit include/asm-generic/bitops-instrumented.h:237 [inline]
  usbhid_wait_io+0xc9/0x3a0 drivers/hid/usbhid/hid-core.c:646
  usbhid_init_reports+0x119/0x320 drivers/hid/usbhid/hid-core.c:774
  hiddev_ioctl+0x10ed/0x1550 drivers/hid/usbhid/hiddev.c:792
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
RSP: 002b:00007fb23788ec78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
RDX: 0000000020005700 RSI: 0000000040184810 RDI: 0000000000000008
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fb23788f6d4
R13: 00000000004c2104 R14: 00000000004d5490 R15: 00000000ffffffff

Allocated by task 12:
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
  __device_release_driver drivers/base/dd.c:1140 [inline]
  device_release_driver_internal+0x3c4/0x4c0 drivers/base/dd.c:1151
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x420/0xb10 drivers/base/core.c:2288
  usb_disconnect+0x4c3/0x8d0 drivers/usb/core/hub.c:2225
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 240:
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

The buggy address belongs to the object at ffff8881c8406880
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 64 bytes inside of
  1024-byte region [ffff8881c8406880, ffff8881c8406c80)
The buggy address belongs to the page:
page:ffffea0007210100 refcount:1 mapcount:0 mapping:ffff8881da002280  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da002280
raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881c8406780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881c8406800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8881c8406880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                            ^
  ffff8881c8406900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881c8406980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

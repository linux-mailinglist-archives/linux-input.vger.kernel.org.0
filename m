Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC1C99EB7
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 20:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388743AbfHVS0H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 14:26:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44562 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387825AbfHVS0H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 14:26:07 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so4129092pgl.11
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 11:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sPOcZvyt5560YLpls6xYCHM5iPvDmcR/m/6WRTCGwaM=;
        b=ic1w5rlU7kEEo9qtBmsPjGtKIcrD9L9kjG8TxOwHibz6jP2wiFUD5fVh01OROnyN9o
         lFrax7WHKMPXWv0j3s8b+GwCJiJ44nsAYUy0WrinaJ0BuQuz2yL9YqLqrKJOmeMC2HNV
         usw5Wz5e8Js2XTICTfRI5SX67Ftm2cuiYa5AJQBe5goF0iYGfygN4YqyzkvaDo6Rf8i5
         FlWXdvjESdupf9ogNzZAcUs+eV+kcJRtHp9VnL/aka8KAs3Myzbzp31JZP4j15L5bHhR
         D69DMx6w5Il7UujHcUE0Z4wYe1I45iSODXOE2ygrlkiYG8yO/gW4E43ZCA7MWD+uQh8M
         Z3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sPOcZvyt5560YLpls6xYCHM5iPvDmcR/m/6WRTCGwaM=;
        b=tNwQFfjx9itCVG0Siw2cPG4VCU+bc6tLaw5yQaH7UwbcXQz2GeOBiwViX1ZVmrsz86
         4zwEzFFoxi8Fz6PMN0K2rg9DCsZI4b8rWrAmd+DlircJvN/hhm8XA4+AYBRCS0/7lzru
         vAuidZ7jZVhYyF6CGQMT2huxsamYb/Vsen0tlI4+ekgwoLbfWV3E03WSesQHjXDG2C3I
         Hdq/3iJTipJlrST7exk4odyUzKcMtJpSd8N21IDDuRcriusJ2qquyJzDib0kw1Mi002r
         nLZvF0llKRG87D5PxEScCiKEo/Gu+BiRxfOoiuKTiG00pG2XZOGySxrgjLVmGDAQcVAg
         0YBQ==
X-Gm-Message-State: APjAAAUmTVV4mcQkpxlqkWhcx3KpoFY3N8HYA5CS7JjQXPNhxNhAFGU0
        lXJpNO/nXCMCF5zfYTWIEur/AaeeXg+1015GVKAwWg==
X-Google-Smtp-Source: APXvYqyv01mpK5dP/XaCVqYtX9loZsklelG6kWBsErQa0kmcf8aArVIZw7+qwDTDp60C0yBLd2cavut4iJpiwun+FLs=
X-Received: by 2002:a17:90a:858a:: with SMTP id m10mr1006917pjn.129.1566498365655;
 Thu, 22 Aug 2019 11:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+zarjL9AWcOTMMfMgE7+vk8W2HQTvjR1x3n6H6QPYC1aQ@mail.gmail.com>
 <Pine.LNX.4.44L0.1908221253180.1311-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908221253180.1311-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 22 Aug 2019 20:25:54 +0200
Message-ID: <CAAeHK+yt=YMvEpvuj2KfA4vnN=ZRFesRCEQJ6450M5JYmFWuDA@mail.gmail.com>
Subject: Re: [PATCH] HID: USB: Fix general protection fault caused by Logitech driver
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hillf Danton <hdanton@sina.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-input@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 22, 2019 at 7:11 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, 22 Aug 2019, Andrey Konovalov wrote:
>
> > Hi Alan,
> >
> > I've ran the fuzzer with your patches applied overnight and noticed
> > another fallout of similar bugs. I think they are caused by a similar
> > issue in the sony HID driver. There's no hid_hw_stop() call in the "if
> > (!(hdev->claimed & HID_CLAIMED_INPUT))" case in sony_probe(). Does it
> > look like a bug to you?
>
> It looks like the relevant hid_hw_stop() call is the one at the end of
> sony_configure_input().  But I can't tell if doing that way is valid or
> not -- in practice the code would end up calling hid_disconnect() while
> hid_connect() was still running, which doesn't seem like a good idea.
>
> There's a comment about this near the end of sony_probe().  I suspect
> it would be better to call hid_hw_stop() in the conditional code
> following that comment rather than in sony_configure_input().
>
> Either way, these are all things Jiri should know about or check up on.
>
> Have you gotten any test results from syzbot exercising these pathways?
> You ought to be able to tell which HID driver is involved by looking
> through the console output.

Yes, a typical crash is below, that's why I thought it's the sony
driver. Adding hid_hw_stop() in sony_probe() stops the issue from
happening, but I don't know whether it's the right fix.

usb 1-1: new high-speed USB device number 3 using dummy_hcd
usb 1-1: Using ep0 maxpacket: 8
usb 1-1: config 0 interface 0 altsetting 0 endpoint 0x81 has an
invalid bInterval 0, changing7
usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor,
different from the inte9
usb 1-1: New USB device found, idVendor=054c, idProduct=024b, bcdDevice= 0.00
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
sony 0003:054C:024B.0002: unknown main item tag 0x0
sony 0003:054C:024B.0002: unknown main item tag 0x2
sony 0003:054C:024B.0002: unknown main item tag 0x0
sony 0003:054C:024B.0002: unknown main item tag 0x0
...
sony 0003:054C:024B.0002: unknown main item tag 0x0
==================================================================
BUG: KASAN: use-after-free in usbhid_power+0xca/0xe0
Read of size 8 at addr ffff88805d590008 by task syz-executor/1808

CPU: 1 PID: 1808 Comm: syz-executor Not tainted 5.3.0-rc5+ #203
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77
 dump_stack+0xca/0x13e lib/dump_stack.c:113
 print_address_description+0x6a/0x32c mm/kasan/report.c:351
 __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
 kasan_report+0xe/0x12 mm/kasan/common.c:612
 usbhid_power+0xca/0xe0 drivers/hid/usbhid/hid-core.c:1234
 hid_hw_power ./include/linux/hid.h:1038
 hidraw_open+0x20d/0x740 drivers/hid/hidraw.c:282
 chrdev_open+0x219/0x5c0 fs/char_dev.c:414
 do_dentry_open+0x494/0x1120 fs/open.c:797
 do_last fs/namei.c:3416
 path_openat+0x1430/0x3f50 fs/namei.c:3533
 do_filp_open+0x1a1/0x280 fs/namei.c:3563
 do_sys_open+0x3c0/0x580 fs/open.c:1089
 do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
 entry_SYSCALL_64_after_hwframe+0x49/0xbe arch/x86/entry/entry_64.S:175
RIP: 0033:0x413a0e
Code: 89 54 24 08 e8 a3 f9 ff ff 8b 74 24 0c 48 8b 3c 24 41 89 c0 44
8b 54 24 08 b8 01 01 00 4
RSP: 002b:00007f7bf0a66730 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 6666666666666667 RCX: 0000000000413a0e
RDX: 0000000000000200 RSI: 00007f7bf0a66840 RDI: 00000000ffffff9c
RBP: 00007f7bf0a66840 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 00000000004a521c
R13: 00000000004ef7d0 R14: 00000000004ae881 R15: 00007f7bf0a676bc

Allocated by task 78:
 save_stack+0x1b/0x80 mm/kasan/common.c:69
 set_track mm/kasan/common.c:77
 __kasan_kmalloc mm/kasan/common.c:487
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
 slab_post_alloc_hook mm/slab.h:520
 slab_alloc_node mm/slub.c:2770
 __kmalloc_node_track_caller+0xfc/0x380 mm/slub.c:4365
 __kmalloc_reserve.isra.0+0x39/0xe0 net/core/skbuff.c:141
 __alloc_skb+0xef/0x5a0 net/core/skbuff.c:209
 alloc_skb ./include/linux/skbuff.h:1055
 alloc_uevent_skb+0x7b/0x210 lib/kobject_uevent.c:289
 uevent_net_broadcast_untagged lib/kobject_uevent.c:325
 kobject_uevent_net_broadcast lib/kobject_uevent.c:408
 kobject_uevent_env+0x8ee/0x1160 lib/kobject_uevent.c:592
 device_del+0x6b2/0xb10 drivers/base/core.c:2349
 usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
 usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
 hub_port_connect drivers/usb/core/hub.c:4949
 hub_port_connect_change drivers/usb/core/hub.c:5213
 port_event drivers/usb/core/hub.c:5359
 hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
 process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
 worker_thread+0x96/0xe20 kernel/workqueue.c:2415
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 242:
 save_stack+0x1b/0x80 mm/kasan/common.c:69
 set_track mm/kasan/common.c:77
 __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
 slab_free_hook mm/slub.c:1423
 slab_free_freelist_hook mm/slub.c:1474
 slab_free mm/slub.c:3016
 kfree+0xe4/0x2f0 mm/slub.c:3957
 skb_free_head+0x8b/0xa0 net/core/skbuff.c:591
 skb_release_data+0x41f/0x7c0 net/core/skbuff.c:611
 skb_release_all+0x46/0x60 net/core/skbuff.c:665
 __kfree_skb net/core/skbuff.c:679
 consume_skb net/core/skbuff.c:838
 consume_skb+0xd9/0x320 net/core/skbuff.c:832
 skb_free_datagram+0x16/0xf0 net/core/datagram.c:328
 netlink_recvmsg+0x65e/0xee0 net/netlink/af_netlink.c:1996
 sock_recvmsg_nosec net/socket.c:871
 sock_recvmsg net/socket.c:889
 sock_recvmsg+0xca/0x110 net/socket.c:885
 ___sys_recvmsg+0x271/0x5a0 net/socket.c:2480
 __sys_recvmsg+0xe9/0x1b0 net/socket.c:2537
 do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
 entry_SYSCALL_64_after_hwframe+0x49/0xbe arch/x86/entry/entry_64.S:175

The buggy address belongs to the object at ffff88805d590000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 8 bytes inside of
 1024-byte region [ffff88805d590000, ffff88805d590400)
The buggy address belongs to the page:
page:ffffea0001756400 refcount:1 mapcount:0 mapping:ffff88806c402280
index:0x0 compound_mapco0
flags: 0x100000000010200(slab|head)
raw: 0100000000010200 dead000000000100 dead000000000122 ffff88806c402280
raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88805d58ff00: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
 ffff88805d58ff80: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
>ffff88805d590000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff88805d590080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88805d590100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

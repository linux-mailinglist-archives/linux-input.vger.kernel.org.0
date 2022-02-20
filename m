Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A56184BCF56
	for <lists+linux-input@lfdr.de>; Sun, 20 Feb 2022 16:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239756AbiBTP1t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Feb 2022 10:27:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237306AbiBTP1s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Feb 2022 10:27:48 -0500
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13562DE6
        for <linux-input@vger.kernel.org>; Sun, 20 Feb 2022 07:27:26 -0800 (PST)
Received: by mail-il1-f199.google.com with SMTP id v13-20020a927a0d000000b002c1ecbb3a5dso1598087ilc.7
        for <linux-input@vger.kernel.org>; Sun, 20 Feb 2022 07:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Pwl3SHuPOjt3dJz5xQRtE1ITjaBluSoyaa2Ww+NNZAY=;
        b=Hj8sVNQNrCX8DM1g77BaA6+8ijueTchUAgKUv/QvjrNfNr6Xz7y84dedSs5XH/zmPR
         DTcKdSayNaTaQ3OvsrCSR5xrSaZe7/eSohFIYbmoUm1uxU1UnMOYG9ASzgSUxyOaaEhM
         93OCIFcXUSxaS4BJ+ABh4m1od/b3FVbn5tUI4Xn+0ESH4oobY0/xUZQ/jWua3HBokg4U
         4KJ1mPWe8fI2eAEv3jlCrfEKrkCXG9Lfeci0u67wHdYrwMS4Xp82RQGzOdV6VfjPDd6I
         tyzlbl+T8lndcyQrOpBlN6vdmTwu4nXBSQ40eermLhL2oJWgXQvuMsXflFNY7MI0vziP
         YzGA==
X-Gm-Message-State: AOAM530sHGgg1hNocOWjEW/+2OU7Ox4FsbUZOvx2l4mM5MNfLMat/3wo
        IMWuazW0pOx/sptWp3N5TPoSNCqUUNyLEGbxQ63hU0IxyYBe
X-Google-Smtp-Source: ABdhPJztQDA5YMGyif4OKk0aEviQe579QU5VrA4mkHX7LOCfHzBdWS+DI3BRT2Y6rEuz0mB9WbJfjRg8WuNRShYIJYogvjRKOkMC
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a21:b0:2c1:a7ea:5600 with SMTP id
 g1-20020a056e021a2100b002c1a7ea5600mr9616223ile.261.1645370846311; Sun, 20
 Feb 2022 07:27:26 -0800 (PST)
Date:   Sun, 20 Feb 2022 07:27:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d181a205d874c066@google.com>
Subject: [syzbot] KASAN: slab-out-of-bounds Read in thrustmaster_probe
From:   syzbot <syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com>
To:     alexandre.torgue@foss.st.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    c5d9ae265b10 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14ccc65c700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a78b064590b9f912
dashboard link: https://syzkaller.appspot.com/bug?extid=35eebd505e97d315d01c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175ecbf2700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=109973f2700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com

usb 1-1: config 0 interface 0 altsetting 0 endpoint 0x81 has invalid wMaxPacketSize 0
usb 1-1: New USB device found, idVendor=044f, idProduct=b65d, bcdDevice= 0.40
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
hid-thrustmaster 0003:044F:B65D.0001: unknown main item tag 0x0
hid-thrustmaster 0003:044F:B65D.0001: hidraw0: USB HID v0.00 Device [HID 044f:b65d] on usb-dummy_hcd.0-1/input0
==================================================================
BUG: KASAN: slab-out-of-bounds in thrustmaster_interrupts drivers/hid/hid-thrustmaster.c:162 [inline]
BUG: KASAN: slab-out-of-bounds in thrustmaster_probe+0x8d5/0xb50 drivers/hid/hid-thrustmaster.c:330
Read of size 1 at addr ffff88807f1a59d2 by task kworker/1:1/35

CPU: 1 PID: 35 Comm: kworker/1:1 Not tainted 5.17.0-rc4-syzkaller-00051-gc5d9ae265b10 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0x8d/0x336 mm/kasan/report.c:255
 __kasan_report mm/kasan/report.c:442 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:459
 thrustmaster_interrupts drivers/hid/hid-thrustmaster.c:162 [inline]
 thrustmaster_probe+0x8d5/0xb50 drivers/hid/hid-thrustmaster.c:330
 hid_device_probe+0x2bd/0x3f0 drivers/hid/hid-core.c:2380
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:752
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:782
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:899
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:970
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
 hid_add_device+0x344/0x9d0 drivers/hid/hid-core.c:2530
 usbhid_probe+0xbf4/0x1070 drivers/hid/usbhid/hid-core.c:1424
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:752
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:782
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:899
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:970
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
 usb_set_configuration+0x101e/0x1900 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:752
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:782
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:899
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:970
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
 usb_new_device.cold+0x63f/0x108e drivers/usb/core/hub.c:2566
 hub_port_connect drivers/usb/core/hub.c:5358 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
 port_event drivers/usb/core/hub.c:5660 [inline]
 hub_event+0x2585/0x44d0 drivers/usb/core/hub.c:5742
 process_one_work+0x9ac/0x1650 kernel/workqueue.c:2307
 worker_thread+0x657/0x1110 kernel/workqueue.c:2454
 kthread+0x2e9/0x3a0 kernel/kthread.c:377
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>

Allocated by task 35:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:436 [inline]
 ____kasan_kmalloc mm/kasan/common.c:515 [inline]
 ____kasan_kmalloc mm/kasan/common.c:474 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:524
 kmalloc include/linux/slab.h:586 [inline]
 kzalloc include/linux/slab.h:715 [inline]
 usb_parse_interface drivers/usb/core/config.c:571 [inline]
 usb_parse_configuration drivers/usb/core/config.c:795 [inline]
 usb_get_configuration+0x1394/0x3b30 drivers/usb/core/config.c:944
 usb_enumerate_device drivers/usb/core/hub.c:2398 [inline]
 usb_new_device+0x583/0x7d0 drivers/usb/core/hub.c:2536
 hub_port_connect drivers/usb/core/hub.c:5358 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
 port_event drivers/usb/core/hub.c:5660 [inline]
 hub_event+0x2585/0x44d0 drivers/usb/core/hub.c:5742
 process_one_work+0x9ac/0x1650 kernel/workqueue.c:2307
 worker_thread+0x657/0x1110 kernel/workqueue.c:2454
 kthread+0x2e9/0x3a0 kernel/kthread.c:377
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

The buggy address belongs to the object at ffff88807f1a5980
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 82 bytes inside of
 96-byte region [ffff88807f1a5980, ffff88807f1a59e0)
The buggy address belongs to the page:
page:ffffea0001fc6940 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7f1a5
flags: 0xfff00000000200(slab|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000200 ffffea0000702fc0 dead000000000007 ffff888010c41780
raw: 0000000000000000 0000000080200020 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY), pid 2966, ts 25259400428, free_ts 25234590946
 prep_new_page mm/page_alloc.c:2434 [inline]
 get_page_from_freelist+0xa72/0x2f50 mm/page_alloc.c:4165
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5389
 alloc_pages+0x1aa/0x310 mm/mempolicy.c:2271
 alloc_slab_page mm/slub.c:1799 [inline]
 allocate_slab+0x27f/0x3c0 mm/slub.c:1944
 new_slab mm/slub.c:2004 [inline]
 ___slab_alloc+0xbe1/0x12b0 mm/slub.c:3018
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3105
 slab_alloc_node mm/slub.c:3196 [inline]
 slab_alloc mm/slub.c:3238 [inline]
 __kmalloc+0x372/0x450 mm/slub.c:4420
 kmalloc include/linux/slab.h:586 [inline]
 kzalloc include/linux/slab.h:715 [inline]
 tomoyo_encode2.part.0+0xe9/0x3a0 security/tomoyo/realpath.c:45
 tomoyo_encode2 security/tomoyo/realpath.c:31 [inline]
 tomoyo_encode+0x28/0x50 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x186/0x620 security/tomoyo/realpath.c:288
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x272/0x380 security/tomoyo/file.c:771
 tomoyo_file_open security/tomoyo/tomoyo.c:311 [inline]
 tomoyo_file_open+0xa3/0xd0 security/tomoyo/tomoyo.c:306
 security_file_open+0x45/0xb0 security/security.c:1638
 do_dentry_open+0x358/0x1250 fs/open.c:811
 do_open fs/namei.c:3476 [inline]
 path_openat+0x1c9e/0x2940 fs/namei.c:3609
 do_filp_open+0x1aa/0x400 fs/namei.c:3636
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1352 [inline]
 free_pcp_prepare+0x374/0x870 mm/page_alloc.c:1404
 free_unref_page_prepare mm/page_alloc.c:3325 [inline]
 free_unref_page+0x19/0x690 mm/page_alloc.c:3404
 qlink_free mm/kasan/quarantine.c:157 [inline]
 qlist_free_all+0x6d/0x160 mm/kasan/quarantine.c:176
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:283
 __kasan_slab_alloc+0xa2/0xc0 mm/kasan/common.c:446
 kasan_slab_alloc include/linux/kasan.h:260 [inline]
 slab_post_alloc_hook mm/slab.h:732 [inline]
 slab_alloc_node mm/slub.c:3230 [inline]
 slab_alloc mm/slub.c:3238 [inline]
 kmem_cache_alloc+0x271/0x4b0 mm/slub.c:3243
 getname_flags.part.0+0x50/0x4f0 fs/namei.c:138
 getname_flags include/linux/audit.h:323 [inline]
 getname+0x8e/0xd0 fs/namei.c:217
 do_sys_openat2+0xf5/0x4d0 fs/open.c:1208
 do_sys_open fs/open.c:1230 [inline]
 __do_sys_openat fs/open.c:1246 [inline]
 __se_sys_openat fs/open.c:1241 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1241
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Memory state around the buggy address:
 ffff88807f1a5880: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
 ffff88807f1a5900: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
>ffff88807f1a5980: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
                                                 ^
 ffff88807f1a5a00: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
 ffff88807f1a5a80: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
==================================================================
Disabling 


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

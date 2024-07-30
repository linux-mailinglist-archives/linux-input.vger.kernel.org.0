Return-Path: <linux-input+bounces-5214-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFCB9421B8
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 22:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1AD283988
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 20:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C5618E03F;
	Tue, 30 Jul 2024 20:40:28 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA01418DF8B
	for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 20:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722372028; cv=none; b=Etj4ZzngOhR4jBvTQH8VCIhqdPA1P1t2QYv9Lp//bnvc6Wz3UHXHX96wPaGYiMxNU5cYAU16NpaYBjwzDuQb8brqTsth204WCY4gRV2ODPRGjObWaiiC2eNzIdeL6zpIl2LTemvGHaS7nhmlSyRk2iuR/mVWSpF3Jwl4FzMSrwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722372028; c=relaxed/simple;
	bh=bnvK+8ZQ/kfnx62ANKz9knGFT4N9PUGnAB5gtvTxyH4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Iqro2GdPcm53SrKxeqhzTkPel8hxOgLCYuPCABhPXz3WsJOyMf1/NJ3cZp70axv35KkEdiassKo/YjHrzlpvkaciwrg1m2x9dGsV/PSjIfkEf+CiJdBpFHKf39I1sJIKbdLg0qtnx8rvxkofUDkUNk8dYgSNl0S/bZC9BTkA97g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-397a99d76baso87309375ab.1
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 13:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722372026; x=1722976826;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gaa4kNEwbZ4Ttaq1s1EfSe+XcCtx+K9EUayL7rg0k74=;
        b=M1kxTdypQNsAcKlfo0//UiK8AkRFboT2g7fjMIxdqxiPR30RFdKgncIS/2nz/ZiGXl
         /f08BRHu+i8limB+I/LNVgbg6a5AiiNlxDm8XR8Fo3eD98f/KWEj1mh2l/hauvphPog0
         NINi85uRcTR+PnbUp6QU+rNKDldPHSzJSmIx44NDr/xdt9lpHgE3ncPhrZgMl8W/CBwu
         8+qNemyyeJbq1v9ENfw8UsLGbytB/bA04GtSfXzqBvu7541uElOWwSPcWdtz/l/xpHRe
         xsN3262TMpnkLqT0iSRP0mGuqXo0xsbCRGsyf6sJnsX0YPr3VvDat8FBNXYh5S10E+t6
         M3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJj9bz2T69Z0lor8+80CLMhnXQQnYuLEmMcGYQf8fieaVVuF80JKlME8t3y/LPBwNFulhlSdkK4w5wykdQ7mZzl0nxXDpJQoWbiyY=
X-Gm-Message-State: AOJu0YwHg8k+a+6QhbkFZDSdh/tFZ2vdBWe6BnlXOTa8ZTWKt0aXg/Kt
	CgFwVp9KbeOpqzMTxXu6PEtCF2umI83uCi51xnYkYU27VVBwYJjnmTKtJnyvHgPoxRuT08pt5Lu
	gW5x0sKjc6RmK22RrvybBKUJ4FPd8vOtY7Z9tfJymp35fIUgK8K1JUhk=
X-Google-Smtp-Source: AGHT+IGTZ3g08BWa4CatDZhUnU2l7Aq0ge7IsP5JGtZNMNWkaFNCzSKlKYvfcDgqMs2oBtQR9iUsh8NMI8Md3UBw7SHojGYX+usZ
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2146:b0:381:7075:6911 with SMTP id
 e9e14a558f8ab-39aec2a611emr4623355ab.1.1722372026117; Tue, 30 Jul 2024
 13:40:26 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:40:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c9ff1f061e7cfc05@google.com>
Subject: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in cougar_report_fixup
From: syzbot <syzbot+24c0361074799d02c452@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1722389b0d86 Merge tag 'net-6.11-rc1' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=153cbebd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3044dca4d5f6dbe
dashboard link: https://syzkaller.appspot.com/bug?extid=24c0361074799d02c452
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10aef9a1980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d32623980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/78a5695ed7e2/disk-1722389b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1507b4c5000d/vmlinux-1722389b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/449aa9e94d6b/bzImage-1722389b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+24c0361074799d02c452@syzkaller.appspotmail.com

usb 1-1: config 0 interface 0 altsetting 0 endpoint 0x81 has invalid wMaxPacketSize 0
usb 1-1: New USB device found, idVendor=060b, idProduct=700a, bcdDevice= 0.00
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
==================================================================
BUG: KASAN: slab-out-of-bounds in cougar_report_fixup+0x1a1/0x1e0 drivers/hid/hid-cougar.c:109
Read of size 1 at addr ffff88810e2895e2 by task kworker/0:1/9

CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.10.0-syzkaller-g1722389b0d86 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:119
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:488
 kasan_report+0xd9/0x110 mm/kasan/report.c:601
 cougar_report_fixup+0x1a1/0x1e0 drivers/hid/hid-cougar.c:109
 hid_open_report+0x1b3/0x7c0 drivers/hid/hid-core.c:1235
 hid_parse include/linux/hid.h:1118 [inline]
 cougar_probe+0x78/0x840 drivers/hid/hid-cougar.c:206
 __hid_device_probe drivers/hid/hid-core.c:2674 [inline]
 hid_device_probe+0x2eb/0x490 drivers/hid/hid-core.c:2711
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 hid_add_device+0x37f/0xa70 drivers/hid/hid-core.c:2857
 usbhid_probe+0xd3b/0x1410 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:294
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2e66/0x4f50 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 9:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:370 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:387
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 __do_kmalloc_node mm/slub.c:4158 [inline]
 __kmalloc_node_track_caller_noprof+0x1ff/0x3e0 mm/slub.c:4177
 kmemdup_noprof+0x29/0x60 mm/util.c:133
 kmemdup_noprof include/linux/fortify-string.h:753 [inline]
 hid_open_report+0x133/0x7c0 drivers/hid/hid-core.c:1230
 hid_parse include/linux/hid.h:1118 [inline]
 cougar_probe+0x78/0x840 drivers/hid/hid-cougar.c:206
 __hid_device_probe drivers/hid/hid-core.c:2674 [inline]
 hid_device_probe+0x2eb/0x490 drivers/hid/hid-core.c:2711
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 hid_add_device+0x37f/0xa70 drivers/hid/hid-core.c:2857
 usbhid_probe+0xd3b/0x1410 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:294
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2e66/0x4f50 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff88810e2895e0
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 1 bytes to the right of
 allocated 1-byte region [ffff88810e2895e0, ffff88810e2895e1)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10e289
flags: 0x200000000000000(node=0|zone=2)
page_type: 0xfdffffff(slab)
raw: 0200000000000000 ffff888100041500 ffffea000439a880 0000000000000002
raw: 0000000000000000 0000000080800080 00000001fdffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 6939675028, free_ts 6856482901
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1493
 prep_new_page mm/page_alloc.c:1501 [inline]
 get_page_from_freelist+0x1311/0x25f0 mm/page_alloc.c:3438
 __alloc_pages_noprof+0x21e/0x2290 mm/page_alloc.c:4696
 __alloc_pages_node_noprof include/linux/gfp.h:269 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:296 [inline]
 alloc_slab_page+0x4e/0xf0 mm/slub.c:2321
 allocate_slab mm/slub.c:2484 [inline]
 new_slab+0x84/0x260 mm/slub.c:2537
 ___slab_alloc+0xdac/0x1870 mm/slub.c:3723
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3813
 __slab_alloc_node mm/slub.c:3866 [inline]
 slab_alloc_node mm/slub.c:4025 [inline]
 __do_kmalloc_node mm/slub.c:4157 [inline]
 __kmalloc_node_track_caller_noprof+0x14e/0x3e0 mm/slub.c:4177
 kvasprintf+0xbd/0x160 lib/kasprintf.c:25
 kvasprintf_const+0x66/0x1a0 lib/kasprintf.c:49
 kobject_set_name_vargs+0x5a/0x140 lib/kobject.c:274
 dev_set_name+0xc8/0x100 drivers/base/core.c:3482
 usb_alloc_dev+0xb4c/0xdc0 drivers/usb/core/usb.c:696
 usb_add_hcd+0x477/0x16a0 drivers/usb/core/hcd.c:2863
 dummy_hcd_probe+0x15c/0x380 drivers/usb/gadget/udc/dummy_hcd.c:2682
 platform_probe+0xff/0x1f0 drivers/base/platform.c:1404
page last free pid 36 tgid 36 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1094 [inline]
 free_unref_page+0x698/0xce0 mm/page_alloc.c:2608
 vfree+0x181/0x7a0 mm/vmalloc.c:3364
 delayed_vfree_work+0x56/0x70 mm/vmalloc.c:3285
 process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff88810e289480: fa fc fc fc 00 fc fc fc fa fc fc fc 00 fc fc fc
 ffff88810e289500: 00 fc fc fc 00 fc fc fc 00 fc fc fc 00 fc fc fc
>ffff88810e289580: fa fc fc fc 00 fc fc fc 01 fc fc fc 01 fc fc fc
                                                       ^
 ffff88810e289600: fa fc fc fc fa fc fc fc 06 fc fc fc 06 fc fc fc
 ffff88810e289680: fa fc fc fc 06 fc fc fc 06 fc fc fc 00 fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


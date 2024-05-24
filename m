Return-Path: <linux-input+bounces-3830-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1858CEA98
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 22:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2D901C20E3D
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 20:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF3885C41;
	Fri, 24 May 2024 20:00:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A61980603
	for <linux-input@vger.kernel.org>; Fri, 24 May 2024 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716580833; cv=none; b=GCRLTcHuSNTM8vQ/KU4Y0lQRFrc9+A92YDtG0f2E24wFTeZIQNzCh1fJWdnNgFjRvT0MJexD5dLBSSYKYidOvDPUjxTsuz2SiS7eTl8+ScEzQmA6hsB4KN38x5dOUjeWc9KSfly6huyZwFX0Y1w+JMJf5VzStYV+i4ks6UboYKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716580833; c=relaxed/simple;
	bh=wVDZh6phI1T2bTBeHy1Rv0YTeM5wglTq90Trs6RQpjM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LY68kz26Jz4lS/guXoZchBWVQkLlGaPXsisJHu2uxRprhd5z6BNjCyiIzEioq51cj3pgQXfrl/4OHv+w8Vl8pxKNjEPGXRUHJnSkqSF7b5ShHyLHlRXT8diyJzyWYXeP4S/d0wS0/A5vXOeI4PFAUBkycfTD0MctXPjd+wFUeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-7e6e4a83282so387169739f.2
        for <linux-input@vger.kernel.org>; Fri, 24 May 2024 13:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716580830; x=1717185630;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GG3Gjue+jDE8bsgIGYFFcuOJ9uIMLCh4JDJlNG85qJc=;
        b=ltyj+OuaE4xDkNEB+0Jgos+ct8h22tcLnFdRbLmlprUCxDjCnCuAzgQJ+ntks9194i
         2eDzHnR4GYmV1EuQNaOrE6X1dyhAvm8rPPsVH7tnYePKL0zwNKNBf0WX2Uah0Xujf+Uq
         DglGekdn+VMJ9pEFA2HocpzQaeG0YlOsXXnyE0YwyAEaKgoH7nnuQdCJuoll2Ocrmo5w
         rGYlbfYUmvCjRXD12JrdeIQfHkGRTTCub1vYTuQtD/W4ULgnRfeMlvY1wLNPgN9bgLOO
         VrBLSBNI3g6LdbsnDTInah5ss51CAm6qS7mm24QG1gamESyqPlf7qUp9g2cp/3KxFkhm
         gnZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqmpldPUu9XuIiFA6nhV0IY9iDVXnIpgT5cadz8J7YpTbxFNk2WR28RPkPeBwO+rWClbOhh1gAGO+Ow9TVv0/hSF2/9QNSEnLQUN4=
X-Gm-Message-State: AOJu0Yw/luijm+KXecwWPHJKEN+TIGC/YM044XDeslARMAGPQnhCZKbe
	1pt6ajsDzKaTWNavC+fUHd8kpT+7vRUlpv1AUzl3ysGWU4nWhV8i21XKPpss1fyrRtLiiUkZoGU
	rQ1YRtOPgheapVM/W17Ig009VwBhrmkHpH8iZMllksV1bpptSQr7zgt8=
X-Google-Smtp-Source: AGHT+IGLrHsin0/bX8K09en21o2LJyJDgZWe7CpIvSXLRgzuMGwexHgMwUu6kimGIAao5y9YGao1vYuvNG9uO4049Jj9koKuv6o7
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a02:b713:0:b0:488:96c4:9caf with SMTP id
 8926c6da1cb9f-4b03fcd18f9mr96641173.6.1716580829448; Fri, 24 May 2024
 13:00:29 -0700 (PDT)
Date: Fri, 24 May 2024 13:00:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000915d550619389e8a@google.com>
Subject: [syzbot] [input?] [usb?] KMSAN: uninit-value in asus_report_fixup
From: syzbot <syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com>
To: benjamin.tissoires@redhat.com, bentiss@kernel.org, jikos@kernel.org, 
	jkosina@suse.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, luke@ljones.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    70ec81c2e2b4 Merge tag 'linux_kselftest-next-6.10-rc1-fixe..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1477c6dc980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=48a63c58ee55467e
dashboard link: https://syzkaller.appspot.com/bug?extid=07762f019fd03d01f04c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1609f92a980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15b85ca4980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6f3592f38ad8/disk-70ec81c2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5987dcdede63/vmlinux-70ec81c2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f31717c1621a/bzImage-70ec81c2.xz

The issue was bisected to:

commit 59d2f5b7392e988a391e6924e177c1a68d50223d
Author: Luke D. Jones <luke@ljones.dev>
Date:   Tue Apr 16 09:03:59 2024 +0000

    HID: asus: fix more n-key report descriptors if n-key quirked

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=154fd644980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=174fd644980000
console output: https://syzkaller.appspot.com/x/log.txt?x=134fd644980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com
Fixes: 59d2f5b7392e ("HID: asus: fix more n-key report descriptors if n-key quirked")

usb 1-1: config 0 descriptor??
==================================================================
BUG: KASAN: slab-out-of-bounds in asus_report_fixup+0x857/0xed0 drivers/hid/hid-asus.c:1210
Read of size 1 at addr ffff88802472ad45 by task kworker/0:1/9

CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.9.0-syzkaller-10219-g70ec81c2e2b4 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 asus_report_fixup+0x857/0xed0 drivers/hid/hid-asus.c:1210
 hid_open_report+0x1ba/0x14a0 drivers/hid/hid-core.c:1235
 hid_parse include/linux/hid.h:1118 [inline]
 asus_probe+0x82e/0xc90 drivers/hid/hid-asus.c:1065
 __hid_device_probe drivers/hid/hid-core.c:2633 [inline]
 hid_device_probe+0x26e/0x4f0 drivers/hid/hid-core.c:2670
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3720
 hid_add_device+0x3b6/0x520 drivers/hid/hid-core.c:2816
 usbhid_probe+0xb38/0xea0 drivers/hid/usbhid/hid-core.c:1429
 usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3720
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:294
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3720
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2652
 hub_port_connect drivers/usb/core/hub.c:5522 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5662 [inline]
 port_event drivers/usb/core/hub.c:5822 [inline]
 hub_event+0x2d6a/0x5150 drivers/usb/core/hub.c:5904
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3393
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 9:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:370 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:387
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 __do_kmalloc_node mm/slub.c:4121 [inline]
 kmalloc_node_track_caller_noprof+0x22a/0x450 mm/slub.c:4141
 kmemdup_noprof+0x2a/0x60 mm/util.c:131
 hid_open_report+0x156/0x14a0 drivers/hid/hid-core.c:1230
 hid_parse include/linux/hid.h:1118 [inline]
 asus_probe+0x82e/0xc90 drivers/hid/hid-asus.c:1065
 __hid_device_probe drivers/hid/hid-core.c:2633 [inline]
 hid_device_probe+0x26e/0x4f0 drivers/hid/hid-core.c:2670
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3720
 hid_add_device+0x3b6/0x520 drivers/hid/hid-core.c:2816
 usbhid_probe+0xb38/0xea0 drivers/hid/usbhid/hid-core.c:1429
 usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3720
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:294
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3720
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2652
 hub_port_connect drivers/usb/core/hub.c:5522 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5662 [inline]
 port_event drivers/usb/core/hub.c:5822 [inline]
 hub_event+0x2d6a/0x5150 drivers/usb/core/hub.c:5904
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3393
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff88802472ad40
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes to the right of
 allocated 5-byte region [ffff88802472ad40, ffff88802472ad45)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2472a
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffefff(slab)
raw: 00fff00000000000 ffff888015041500 dead000000000100 dead000000000122
raw: 0000000000000000 0000000080800080 00000001ffffefff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52c00(GFP_NOIO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 12879192655, free_ts 12811137824
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1468
 prep_new_page mm/page_alloc.c:1476 [inline]
 get_page_from_freelist+0x2e2d/0x2ee0 mm/page_alloc.c:3402
 __alloc_pages_noprof+0x256/0x6c0 mm/page_alloc.c:4660
 __alloc_pages_node_noprof include/linux/gfp.h:244 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:271 [inline]
 alloc_slab_page+0x5f/0x120 mm/slub.c:2264
 allocate_slab+0x5a/0x2e0 mm/slub.c:2427
 new_slab mm/slub.c:2480 [inline]
 ___slab_alloc+0xcd1/0x14b0 mm/slub.c:3666
 __slab_alloc+0x58/0xa0 mm/slub.c:3756
 __slab_alloc_node mm/slub.c:3809 [inline]
 slab_alloc_node mm/slub.c:3988 [inline]
 kmalloc_trace_noprof+0x1d5/0x2c0 mm/slub.c:4147
 kmalloc_noprof include/linux/slab.h:660 [inline]
 usb_control_msg+0xbb/0x4c0 drivers/usb/core/message.c:144
 hub_power_on+0x1de/0x460
 hub_activate+0x3cd/0x1c70 drivers/usb/core/hub.c:1135
 hub_configure drivers/usb/core/hub.c:1742 [inline]
 hub_probe+0x274f/0x3640 drivers/usb/core/hub.c:1965
 usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
page last free pid 785 tgid 785 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1088 [inline]
 free_unref_page+0xd22/0xea0 mm/page_alloc.c:2565
 vfree+0x186/0x2e0 mm/vmalloc.c:3346
 delayed_vfree_work+0x56/0x80 mm/vmalloc.c:3267
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3393
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff88802472ac00: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
 ffff88802472ac80: 06 fc fc fc 06 fc fc fc fa fc fc fc fa fc fc fc
>ffff88802472ad00: fa fc fc fc fa fc fc fc 05 fc fc fc 05 fc fc fc
                                           ^
 ffff88802472ad80: fa fc fc fc fa fc fc fc 06 fc fc fc 06 fc fc fc
 ffff88802472ae00: 07 fc fc fc 06 fc fc fc fa fc fc fc 00 fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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


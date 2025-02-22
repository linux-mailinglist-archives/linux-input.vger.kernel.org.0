Return-Path: <linux-input+bounces-10235-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14DA40C1E
	for <lists+linux-input@lfdr.de>; Sun, 23 Feb 2025 00:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEFA6189E341
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 23:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58DF20468B;
	Sat, 22 Feb 2025 23:33:31 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810CE149DF4
	for <linux-input@vger.kernel.org>; Sat, 22 Feb 2025 23:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740267211; cv=none; b=AVuLGU7oZRSTm7Zej74NbO7SUsl56s9nXR5o5pd/vPC/g2ldjOt90Uys81T25rdDO1bpfgHc8YYA50lG25DFtW2aQ/Dw6ZcTPuvjlOjl2cn4ugoQplokAGALGEbkdphoHV0T0qWt+jzPkrF17gpgibJfEPwUds0TfS6OcCLL4bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740267211; c=relaxed/simple;
	bh=n3+j4UoL/y/wLInGG6erS3YGOafOarlTbyUTibO+5zA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VNHICDJpIFrjJOc+lFBFwskEMy7iasvZB1xvpG0X2+wC9SHNnwC0IJHOx2ZjT/3QUMuquzLVFa4H+LR4b5XjZaK12Vh1Nr/Rt5XO/AE9j05YacCkfi7KPvm8Uhz0sCtKwn1PFDHzir3irubOWiy8aaCd8W4djomU292UGjWcRps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so67058345ab.0
        for <linux-input@vger.kernel.org>; Sat, 22 Feb 2025 15:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740267208; x=1740872008;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9u6OQsz6OlQPDduG0FR4a6c19MUCTuF25Azuz6qSUjc=;
        b=JiL/Ltv7wvpXd0+e5EbLPPCrgPjzl5z2jXpTj5GQet6VqWKXCQFoQFxbRCjEYjRDX/
         xcmNnF4gm0qdV9gE40Of/8fsEBxkpmkVO9nZpiZJbYUsjVDESW73Fh35l5H/QfbaCVYe
         D3ksCsC4p0LvVKR/K6Mx2kh9MHIdffkwDuGKpml3dObSmuuUUB0AILnLDo0voFMQbvtX
         V4aAOtDwxUCSa4cry5yhJeAwd5vr3Hlz5GnGGNddnGqZYbj06/+fhD/fId7MxMj+HBqo
         u6AR5rZh68SbeuJaf6UoFF2eiL8MCGqc62KTQx45JTpPMi9+8Vuah2evthi6LAlplqOk
         WE0g==
X-Forwarded-Encrypted: i=1; AJvYcCUQeu+rFUIhqAgus0zMhHdA1BCTO5x9sx7jrV3a3IVqiIbHMg6XnpMXM956HxwEHXZgkDMH0p0mKCom1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YybqiScZsXaGBmnX28mN9Bgrpp3WksEuOC6Gz1hHo7O7JhqkL/h
	eoDCmNQKrZt9hVTsns1h0ORsTKW9eudDxyREUM9Q5MD1+oznPU85UyE1yse4ctSz4DGh615MPFW
	+xozwVW2HfO0WKSOUdwMHzWXkCOh0W4adout0EGOz0lkw6xt8z1/2p5Q=
X-Google-Smtp-Source: AGHT+IEN5ScvX/5vxiS5l6kqeA2J6gXRxnBHqDcIOHeK2RiXLm3dwd12TDeq0atNWBY6p79omdMFoaOYPVpxT/TrdZx/pIwyon+D
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:320d:b0:3d2:b66b:94cd with SMTP id
 e9e14a558f8ab-3d2cb43252amr87843715ab.3.1740267208629; Sat, 22 Feb 2025
 15:33:28 -0800 (PST)
Date: Sat, 22 Feb 2025 15:33:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ba5ec8.050a0220.bbfd1.0003.GAE@google.com>
Subject: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Write in steam_input_register
From: syzbot <syzbot+8d1e36bdac78c72d4750@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    27eddbf34490 Merge tag 'net-6.14-rc4' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11413ae4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b7bde34acd8f53b1
dashboard link: https://syzkaller.appspot.com/bug?extid=8d1e36bdac78c72d4750
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5b45f2cc8823/disk-27eddbf3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/eeb252f1032b/vmlinux-27eddbf3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/488c85cad468/bzImage-27eddbf3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8d1e36bdac78c72d4750@syzkaller.appspotmail.com

input: failed to attach handler joydev to device input6, error: -2
kobject: kobject_add_internal failed for event4 (error: -2 parent: input6)
input: failed to attach handler evdev to device input6, error: -2
==================================================================
BUG: KASAN: slab-use-after-free in steam_input_register+0xe75/0x1140 drivers/hid/hid-steam.c:832
Write of size 8 at addr ffff8880591a0920 by task kworker/1:1/51

CPU: 1 UID: 0 PID: 51 Comm: kworker/1:1 Not tainted 6.14.0-rc3-syzkaller-00137-g27eddbf34490 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: events steam_work_unregister_cb
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0x16e/0x5b0 mm/kasan/report.c:521
 kasan_report+0x143/0x180 mm/kasan/report.c:634
 steam_input_register+0xe75/0x1140 drivers/hid/hid-steam.c:832
 steam_work_unregister_cb+0xf7/0x130 drivers/hid/hid-steam.c:1095
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xabe/0x18e0 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 5890:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4294 [inline]
 __kmalloc_node_track_caller_noprof+0x28b/0x4c0 mm/slub.c:4313
 alloc_dr drivers/base/devres.c:119 [inline]
 devm_kmalloc+0x88/0x310 drivers/base/devres.c:843
 devm_kzalloc include/linux/device.h:328 [inline]
 steam_probe+0xc5/0xd70 drivers/hid/hid-steam.c:1241
 __hid_device_probe drivers/hid/hid-core.c:2713 [inline]
 hid_device_probe+0x3bf/0x710 drivers/hid/hid-core.c:2750
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:537
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 hid_add_device+0x3b6/0x520 drivers/hid/hid-core.c:2896
 usbhid_probe+0xd87/0x1270 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x641/0xbb0 drivers/usb/core/driver.c:396
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:537
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:250
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:291
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:537
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5533 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5673 [inline]
 port_event drivers/usb/core/hub.c:5833 [inline]
 hub_event+0x2d6d/0x5150 drivers/usb/core/hub.c:5915
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xabe/0x18e0 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 977:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x196/0x430 mm/slub.c:4757
 release_nodes drivers/base/devres.c:506 [inline]
 devres_release_group+0x328/0x350 drivers/base/devres.c:689
 hid_device_remove+0x250/0x370 drivers/hid/hid-core.c:2774
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x4a9/0x7c0 drivers/base/dd.c:1296
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:579
 device_del+0x57a/0x9b0 drivers/base/core.c:3854
 hid_remove_device drivers/hid/hid-core.c:2953 [inline]
 hid_destroy_device+0x6a/0x1b0 drivers/hid/hid-core.c:2975
 usbhid_disconnect+0x9e/0xc0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x25b/0x940 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x503/0x7c0 drivers/base/dd.c:1296
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:579
 device_del+0x57a/0x9b0 drivers/base/core.c:3854
 usb_disable_device+0x3bf/0x850 drivers/usb/core/message.c:1418
 usb_disconnect+0x340/0x950 drivers/usb/core/hub.c:2316
 hub_port_connect drivers/usb/core/hub.c:5373 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5673 [inline]
 port_event drivers/usb/core/hub.c:5833 [inline]
 hub_event+0x1ebc/0x5150 drivers/usb/core/hub.c:5915
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xabe/0x18e0 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Last potentially related work creation:
 kasan_save_stack+0x3f/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xaa/0xc0 mm/kasan/generic.c:548
 insert_work+0x3e/0x330 kernel/workqueue.c:2183
 __queue_work+0xc8b/0xf50 kernel/workqueue.c:2339
 queue_work_on+0x1c2/0x380 kernel/workqueue.c:2390
 hid_hw_close+0xac/0xe0 drivers/hid/hid-core.c:2415
 drop_ref+0x98/0x360 drivers/hid/hidraw.c:346
 hidraw_disconnect+0x4f/0x60 drivers/hid/hidraw.c:642
 hid_disconnect drivers/hid/hid-core.c:2325 [inline]
 hid_hw_stop+0x100/0x1e0 drivers/hid/hid-core.c:2370
 hid_device_remove+0x225/0x370
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x4a9/0x7c0 drivers/base/dd.c:1296
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:579
 device_del+0x57a/0x9b0 drivers/base/core.c:3854
 hid_remove_device drivers/hid/hid-core.c:2953 [inline]
 hid_destroy_device+0x6a/0x1b0 drivers/hid/hid-core.c:2975
 steam_remove+0xe3/0x1b0 drivers/hid/hid-steam.c:1334
 hid_device_remove+0x225/0x370
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x4a9/0x7c0 drivers/base/dd.c:1296
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:579
 device_del+0x57a/0x9b0 drivers/base/core.c:3854
 hid_remove_device drivers/hid/hid-core.c:2953 [inline]
 hid_destroy_device+0x6a/0x1b0 drivers/hid/hid-core.c:2975
 usbhid_disconnect+0x9e/0xc0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x25b/0x940 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x503/0x7c0 drivers/base/dd.c:1296
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:579
 device_del+0x57a/0x9b0 drivers/base/core.c:3854
 usb_disable_device+0x3bf/0x850 drivers/usb/core/message.c:1418
 usb_disconnect+0x340/0x950 drivers/usb/core/hub.c:2316
 hub_port_connect drivers/usb/core/hub.c:5373 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5673 [inline]
 port_event drivers/usb/core/hub.c:5833 [inline]
 hub_event+0x1ebc/0x5150 drivers/usb/core/hub.c:5915
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xabe/0x18e0 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Second to last potentially related work creation:
 kasan_save_stack+0x3f/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xaa/0xc0 mm/kasan/generic.c:548
 insert_work+0x3e/0x330 kernel/workqueue.c:2183
 __queue_work+0xc8b/0xf50 kernel/workqueue.c:2339
 queue_work_on+0x1c2/0x380 kernel/workqueue.c:2390
 queue_work include/linux/workqueue.h:662 [inline]
 schedule_work include/linux/workqueue.h:723 [inline]
 steam_client_ll_open+0xb1/0xc0 drivers/hid/hid-steam.c:1146
 hid_hw_open+0xe3/0x170 drivers/hid/hid-core.c:2392
 hidraw_open+0x298/0x8e0 drivers/hid/hidraw.c:308
 chrdev_open+0x521/0x600 fs/char_dev.c:414
 do_dentry_open+0xdec/0x1960 fs/open.c:956
 vfs_open+0x3b/0x370 fs/open.c:1086
 do_open fs/namei.c:3830 [inline]
 path_openat+0x2c81/0x3590 fs/namei.c:3989
 do_filp_open+0x27f/0x4e0 fs/namei.c:4016
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1428
 do_sys_open fs/open.c:1443 [inline]
 __do_sys_openat fs/open.c:1459 [inline]
 __se_sys_openat fs/open.c:1454 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1454
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880591a0800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 288 bytes inside of
 freed 1024-byte region [ffff8880591a0800, ffff8880591a0c00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x591a0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b041dc0 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b041dc0 dead000000000122 0000000000000000
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0001646801 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 52, tgid 52 (kworker/u8:3), ts 76343947834, free_ts 75474515354
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x292/0x710 mm/page_alloc.c:4739
 alloc_pages_mpol+0x311/0x660 mm/mempolicy.c:2270
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab+0x8f/0x3a0 mm/slub.c:2587
 new_slab mm/slub.c:2640 [inline]
 ___slab_alloc+0xc27/0x14a0 mm/slub.c:3826
 __slab_alloc+0x58/0xa0 mm/slub.c:3916
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 __do_kmalloc_node mm/slub.c:4293 [inline]
 __kmalloc_noprof+0x2e6/0x4c0 mm/slub.c:4306
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 neigh_alloc net/core/neighbour.c:473 [inline]
 ___neigh_create+0x6c3/0x2360 net/core/neighbour.c:607
 ip6_finish_output2+0xb70/0x17c0 net/ipv6/ip6_output.c:132
 ip6_finish_output+0x41e/0x840 net/ipv6/ip6_output.c:226
 NF_HOOK include/linux/netfilter.h:314 [inline]
 ndisc_send_skb+0xb52/0x1530 net/ipv6/ndisc.c:513
 addrconf_dad_completed+0x76c/0xcd0 net/ipv6/addrconf.c:4356
 addrconf_dad_work+0xdbc/0x16a0
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xabe/0x18e0 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
page last free pid 63 tgid 63 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_folios+0xe40/0x18b0 mm/page_alloc.c:2707
 folios_put_refs+0x76c/0x860 mm/swap.c:994
 release_pages+0x5c0/0x690 mm/swap.c:1034
 io_free_region+0xb7/0x260 io_uring/memmap.c:101
 io_rings_free io_uring/io_uring.c:2636 [inline]
 io_ring_ctx_free+0x329/0x530 io_uring/io_uring.c:2725
 io_ring_exit_work+0x813/0x8a0 io_uring/io_uring.c:2939
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xabe/0x18e0 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff8880591a0800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880591a0880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880591a0900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                               ^
 ffff8880591a0980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880591a0a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


Return-Path: <linux-input+bounces-10004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD674A32C23
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 17:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 748221889129
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 16:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0290924C663;
	Wed, 12 Feb 2025 16:43:38 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F3221D8B
	for <linux-input@vger.kernel.org>; Wed, 12 Feb 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378617; cv=none; b=e+oQ1J/SP34jTuWyoQ6p5zTAOp9FARoR/maoddHnQ0r4BXqb57rrLpMZIYdmzk/wKf8ZN1NMjYLnY56jZbjRd+y8F0KGrmRxC0fGblRnLL+6tm6E8L2bS+nugNZcSQWXfiVWHm9qjBAV4VS0sMNqIHaqXckevV+eaH9IxflqR6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378617; c=relaxed/simple;
	bh=iE+iOxjLhV2pk21APmjgVc/QJ6QMFwk4PE+738WNzrE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=keUoEXmAVgVm86Y1faGLwuPAyrl41yPUiPGgdEYsrXIJtRqSBX88PHj1+sH3fYNGnSyj+FvOWuxWoauwvU756yF6B6wxwxlZqWs2+nhBi3RpiQvoJ+Uqx6NSDh/hIWG7WeanJaBuyqYfsTFuSfPUhVIsO6usCMB6s2E7oENNLeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d1804d8807so5597335ab.2
        for <linux-input@vger.kernel.org>; Wed, 12 Feb 2025 08:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378615; x=1739983415;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bl2J2cvKspLOnGtm3C+QjRbWkxNhfdbc7MB/4019BTg=;
        b=r1KNJGdfPExLv+zGNaQIf7tgAP8nu1n5txzBwRsaEIdbdyK5zH/O8lyZSPKOPI6L0S
         1AX39hzs7PKT0qnfej8VtXD6wQipIW61G2HQq22IpAU8XkBxTajh/g+oSpJMnQ7HnPpm
         +4unL+SLXe1+JIlgvjMO7RXHZPmR/q8GDDb5s8ZS98bxaivQeZFVucG26nCcxn9j4FhV
         VmPDQFLxpBW7eah9V6524qY7jBxcniTXZ04JaJo894aqEDGv6Msk5l65IPBLg4+3HtdA
         xTNmE2MKwPIpPaqjl0DptqDradpBbQd/8DEg8KQjgMVHr7Sma5HWotS/wH3QNX1wZYmC
         DloQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKA9TG5Ea6aLMrsHx/5IDqAjAXTkijCJZHW8rfVvT/upzkY+bJakNrBKNF4vsWpU3dGcNqxldiGcEitA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTvUL2t8Qp7i5+nL+7BR2vlh5pjysIulF5srQzFv1OTKTcAvRv
	F9JCUTv1Xg/o9WG0sICH5qlqiD0nIvjeCMP+NveUsrnUNSDFrWUFNxl4IazvnduSTtk/uDmA4g1
	1qMcsItZXto8yAsaIGu+y/H4M32yXsE6nW5Qjq68Ts4S92bjAd4DlTlw=
X-Google-Smtp-Source: AGHT+IH7QkDafZjNH1cestLwT88alJw61E0xitWsyLWLL9tjeH8ysPzci/EoZKtPrSeDCTSxVs2zTva/b6K36HCEN8JG1UtDeoSd
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2168:b0:3cf:fa94:c7d with SMTP id
 e9e14a558f8ab-3d17bf29b13mr30844905ab.9.1739378615156; Wed, 12 Feb 2025
 08:43:35 -0800 (PST)
Date: Wed, 12 Feb 2025 08:43:35 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67accfb7.050a0220.110943.0051.GAE@google.com>
Subject: [syzbot] [input?] [usb?] KASAN: use-after-free Read in hid_hw_raw_request
From: syzbot <syzbot+8dc0131372a3ab5bde94@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9682c35ff6ec usb: typec: thunderbolt: Remove IS_ERR check ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=149b89b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed7570f7f6046a71
dashboard link: https://syzkaller.appspot.com/bug?extid=8dc0131372a3ab5bde94
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3c194e311f90/disk-9682c35f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/daad45c8e7c8/vmlinux-9682c35f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8a4e74467d7e/bzImage-9682c35f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8dc0131372a3ab5bde94@syzkaller.appspotmail.com

hid-corsair-void 0003:1B1C:1B25.032E: failed to request firmware (reason: -19)
==================================================================
BUG: KASAN: use-after-free in __hid_hw_raw_request drivers/hid/hid-core.c:2446 [inline]
BUG: KASAN: use-after-free in hid_hw_raw_request+0x13f/0x150 drivers/hid/hid-core.c:2479
Read of size 8 at addr ffff88811b3a9da8 by task kworker/1:1/23455

CPU: 1 UID: 0 PID: 23455 Comm: kworker/1:1 Not tainted 6.14.0-rc1-syzkaller-g9682c35ff6ec #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: events corsair_void_status_work_handler
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 __hid_hw_raw_request drivers/hid/hid-core.c:2446 [inline]
 hid_hw_raw_request+0x13f/0x150 drivers/hid/hid-core.c:2479
 corsair_void_request_status+0xc3/0x130 drivers/hid/hid-corsair-void.c:493
 corsair_void_status_work_handler+0x3f/0xb0 drivers/hid/hid-corsair-void.c:512
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x4 pfn:0x11b3a9
flags: 0x200000000000000(node=0|zone=2)
raw: 0200000000000000 0000000000000000 ffffffffffffffff 0000000000000000
raw: 0000000000000004 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), pid 13954, tgid 13954 (kworker/1:5), ts 2728575621149, free_ts 2729304616876
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x21c/0x2290 mm/page_alloc.c:4739
 __alloc_pages_noprof+0xb/0x1b0 mm/page_alloc.c:4773
 __alloc_pages_node_noprof include/linux/gfp.h:265 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:292 [inline]
 ___kmalloc_large_node+0x84/0x1b0 mm/slub.c:4239
 __kmalloc_large_noprof+0x1c/0x70 mm/slub.c:4256
 kmalloc_noprof include/linux/slab.h:898 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 hid_allocate_device+0x1c/0x4b0 drivers/hid/hid-core.c:2920
 usbhid_probe+0x203/0x1400 drivers/hid/usbhid/hid-core.c:1364
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
page last free pid 13954 tgid 13954 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0x653/0xde0 mm/page_alloc.c:2660
 __folio_put+0x1e8/0x2d0 mm/swap.c:112
 hiddev_free drivers/hid/hid-core.c:755 [inline]
 kref_put include/linux/kref.h:65 [inline]
 hid_device_release+0x133/0x190 drivers/hid/hid-core.c:762
 device_release+0xa1/0x240 drivers/base/core.c:2567
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3773
 usbhid_disconnect+0xa0/0xe0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x1e2/0x960 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:579
 device_del+0x396/0x9f0 drivers/base/core.c:3854
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2305
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236

Memory state around the buggy address:
 ffff88811b3a9c80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88811b3a9d00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff88811b3a9d80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                  ^
 ffff88811b3a9e00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88811b3a9e80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
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


Return-Path: <linux-input+bounces-9589-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F0CA206FD
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 10:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74653164523
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 09:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F971DFE32;
	Tue, 28 Jan 2025 09:16:28 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D126F1DF757
	for <linux-input@vger.kernel.org>; Tue, 28 Jan 2025 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738055788; cv=none; b=It1BaND9Mjb7oszE3S5aLuJt8lU7jkWjhSrLtXCDTLoVZuiX8CpSTnhHkxrE8qpfpb0nPkamKaipvoLIaC4UJmgH7AEPqsCMwztj29tF4xD1/+/RTciakpR0LsbCenLqVMyo2YFNKQnCQIIsda+32O2YM5MNQ/AvSHN4NaeMLkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738055788; c=relaxed/simple;
	bh=PCSwfZ0jw0Sj4fW/VOXF9WfiCFec2iRa4Yxx/5LVh+8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nEBjUqrTs2KPmdqWDQolw+xeYlUSUMCWmu4faMw+5urL6DfqRybD09uUhQ7TZuy2T5lHC/PwB4DTMjRY2FuFsQWCSu6gmbZtG3d5L/jXW+uKLlwci+jouUjJnGoW8rx6rFjm0vhio29+p7tM4LzoMwSTtiZzMGEeqRuH4vdVGWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ac98b49e4dso39766565ab.1
        for <linux-input@vger.kernel.org>; Tue, 28 Jan 2025 01:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738055786; x=1738660586;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlF78NgqleC9guHEfdMN8eDkXX/Q3E2nIz2iQYILDMw=;
        b=QEu8hIR3rEccgSuf7QCPm3WjVaS8xf81xgs46kzZJeFLbc8+3Aq9D3Azc6cwYgJ3tS
         zIe7Zg73KZ8vaxcikh+/LMgYlWC71ats6N+kn2I9IWLTSg3etUFgWX/9YWZAXVCmG+sW
         PeD5nrJvLlrE6tjJBLDpt7G/LBc6EvxjoSmXlx8qvOsSSWJUuPQsnS9CIZqzXlL+L9OE
         3cVCxPn/ap8qldaz50CtF3RmNExstALOlJuOEqpqYG3eDo5SMJBW+QL0Qdjid0QwGkJL
         ZHXT72mNGG5BiZRevmHvTlPqqsFui0PhOWE6JLb5dV40qLahcuRiyThRiHc6I/tm4HKU
         88eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm/OBY5kRBEWwXSPgSMsPZqA8cxZz8H1fo9iGXQnH4kLSu4M7gy4fvd1IyJwGpDu8IqrGgX1AJNPbItQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRkIKaFueyWpUj9kYWZ0dj+xRQuKOxNGT+uUyZPwptrTZIWuwH
	0ahgvmv1zxl4iNffzKwyOutpbKuWrLulYhwiXftlfZ8dDkdxsMxA7TlN6ODLlqzljNL/qqgJxZe
	J+ok0LvZdTOmDJLEWpRt7HJg5U3AC3ezk1QjoX9hsk/yoFSvZEbAj31o=
X-Google-Smtp-Source: AGHT+IEJnHKt2XdubAjXKHGZrNvM5u9TqwRDuiX8p1oaRzQRxp3W/QWY5dRXwuTniCV8rUOQ5sb+lA1zDFiO6s5znnfvWK74GBnO
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:310c:b0:3ce:61a3:8647 with SMTP id
 e9e14a558f8ab-3cf74419cefmr321778545ab.11.1738055785989; Tue, 28 Jan 2025
 01:16:25 -0800 (PST)
Date: Tue, 28 Jan 2025 01:16:25 -0800
In-Reply-To: <6797072e.050a0220.2eae65.003f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6798a069.050a0220.ac840.0244.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: stack-out-of-bounds Read in usb_check_int_endpoints
From: syzbot <syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, jikos@kernel.org, karprzy7@gmail.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    6d61a53dd6f5 Merge tag 'f2fs-for-6.14-rc1' of git://git.ke..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13786e24580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4ddc212efe12f88
dashboard link: https://syzkaller.appspot.com/bug?extid=9c9179ac46169c56c1ad
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1514cddf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143c85f8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/65684dc6d116/disk-6d61a53d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/aa2e2ce680d3/vmlinux-6d61a53d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ebbf8bd929a6/bzImage-6d61a53d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com

usb 1-1: config 0 interface 0 has no altsetting 0
usb 1-1: New USB device found, idVendor=044f, idProduct=b65d, bcdDevice= 0.00
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
hid-thrustmaster 0003:044F:B65D.0001: hidraw0: USB HID v0.00 Device [HID 044f:b65d] on usb-dummy_hcd.0-1/input0
==================================================================
BUG: KASAN: stack-out-of-bounds in usb_check_int_endpoints+0x247/0x270 drivers/usb/core/usb.c:277
Read of size 1 at addr ffffc9000009ebb9 by task kworker/0:1/9

CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.13.0-syzkaller-09030-g6d61a53dd6f5 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 usb_check_int_endpoints+0x247/0x270 drivers/usb/core/usb.c:277
 thrustmaster_interrupts drivers/hid/hid-thrustmaster.c:176 [inline]
 thrustmaster_probe drivers/hid/hid-thrustmaster.c:347 [inline]
 thrustmaster_probe+0x499/0xe10 drivers/hid/hid-thrustmaster.c:289
 __hid_device_probe drivers/hid/hid-core.c:2713 [inline]
 hid_device_probe+0x349/0x700 drivers/hid/hid-core.c:2750
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 hid_add_device+0x374/0xa60 drivers/hid/hid-core.c:2896
 usbhid_probe+0xd32/0x1400 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_new_device+0xd09/0x1a20 drivers/usb/core/hub.c:2652
 hub_port_connect drivers/usb/core/hub.c:5523 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x2e58/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

The buggy address belongs to stack of task kworker/0:1/9
 and is located at offset 65 in frame:
 thrustmaster_probe+0x0/0xe10 drivers/hid/hid-thrustmaster.c:203

This frame has 2 objects:
 [48, 52) 'trans'
 [64, 65) 'ep_addr'

The buggy address belongs to the virtual mapping at
 [ffffc90000098000, ffffc900000a1000) created by:
 kernel_clone+0xfd/0x960 kernel/fork.c:2804

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1016f1
flags: 0x200000000000000(node=0|zone=2)
raw: 0200000000000000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_NOWARN|__GFP_ZERO), pid 2, tgid 2 (kthreadd), ts 2826831682, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x21c/0x2290 mm/page_alloc.c:4739
 __alloc_pages_noprof+0xb/0x1b0 mm/page_alloc.c:4773
 __alloc_pages_node_noprof include/linux/gfp.h:265 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:292 [inline]
 vm_area_alloc_pages mm/vmalloc.c:3593 [inline]
 __vmalloc_area_node mm/vmalloc.c:3669 [inline]
 __vmalloc_node_range_noprof+0x63d/0x1530 mm/vmalloc.c:3846
 alloc_thread_stack_node kernel/fork.c:314 [inline]
 dup_task_struct kernel/fork.c:1116 [inline]
 copy_process+0x2e42/0x8c60 kernel/fork.c:2222
 kernel_clone+0xfd/0x960 kernel/fork.c:2804
 kernel_thread+0xc0/0x100 kernel/fork.c:2866
 create_kthread kernel/kthread.c:487 [inline]
 kthreadd+0x4ef/0x7d0 kernel/kthread.c:847
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
page_owner free stack trace missing

Memory state around the buggy address:
 ffffc9000009ea80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000009eb00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f1
>ffffc9000009eb80: f1 f1 f1 f1 f1 04 f2 01 f3 f3 f3 00 00 00 00 00
                                        ^
 ffffc9000009ec00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000009ec80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


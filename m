Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 363BD97D4F
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 16:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbfHUOkF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 10:40:05 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:53428 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729110AbfHUOkF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 10:40:05 -0400
Received: (qmail 3710 invoked by uid 2102); 21 Aug 2019 10:40:04 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Aug 2019 10:40:04 -0400
Date:   Wed, 21 Aug 2019 10:40:04 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <benjamin.tissoires@redhat.com>,
        <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
In-Reply-To: <000000000000ed58060590a0aa30@google.com>
Message-ID: <Pine.LNX.4.44L0.1908211038300.1816-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 21 Aug 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> KASAN: slab-out-of-bounds Read in hidraw_ioctl
> 
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in strlen+0x79/0x90 lib/string.c:525
> Read of size 1 at addr ffff8881c8035f38 by task syz-executor.4/2833
> 
> CPU: 1 PID: 2833 Comm: syz-executor.4 Not tainted 5.3.0-rc2+ #1
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>   kasan_report+0xe/0x12 mm/kasan/common.c:612
>   strlen+0x79/0x90 lib/string.c:525
>   strlen include/linux/string.h:281 [inline]
>   hidraw_ioctl+0x245/0xae0 drivers/hid/hidraw.c:446
>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
>   ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x459829
> Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
> ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f7a68f6dc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
> RDX: 0000000000000000 RSI: 0000000080404805 RDI: 0000000000000004
> RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f7a68f6e6d4
> R13: 00000000004c21de R14: 00000000004d5620 R15: 00000000ffffffff
> 
> Allocated by task 0:
> (stack is not available)
> 
> Freed by task 0:
> (stack is not available)
> 
> The buggy address belongs to the object at ffff8881c8035e60
>   which belongs to the cache shmem_inode_cache of size 1168
> The buggy address is located 216 bytes inside of
>   1168-byte region [ffff8881c8035e60, ffff8881c80362f0)
> The buggy address belongs to the page:
> page:ffffea0007200d00 refcount:1 mapcount:0 mapping:ffff8881da115180  
> index:0x0 compound_mapcount: 0
> flags: 0x200000000010200(slab|head)
> raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da115180
> raw: 0000000000000000 00000000800c000c 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>   ffff8881c8035e00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ffff8881c8035e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > ffff8881c8035f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>                                          ^
>   ffff8881c8035f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ffff8881c8036000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================
> 
> 
> Tested on:
> 
> commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=14f14a1e600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=171cd95a600000

Get some debugging info:

#syz test: https://github.com/google/kasan.git e96407b4

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -1973,6 +1973,8 @@ int hid_hw_start(struct hid_device *hdev
 {
 	int error;
 
+	dev_info(&hdev->dev, "In hid_hw_start for %p\n", hdev);
+	dump_stack();
 	error = hdev->ll_driver->start(hdev);
 	if (error)
 		return error;
@@ -1998,6 +2000,7 @@ EXPORT_SYMBOL_GPL(hid_hw_start);
  */
 void hid_hw_stop(struct hid_device *hdev)
 {
+	dev_info(&hdev->dev, "In hid_hw_stop for %p\n", hdev);
 	hid_disconnect(hdev);
 	hdev->ll_driver->stop(hdev);
 }


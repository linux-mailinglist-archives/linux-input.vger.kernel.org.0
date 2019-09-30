Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5502C29B7
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 00:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730096AbfI3WjS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 18:39:18 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:50826 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729356AbfI3WjQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 18:39:16 -0400
Received: by mail-io1-f71.google.com with SMTP id f5so33299447iob.17
        for <linux-input@vger.kernel.org>; Mon, 30 Sep 2019 15:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=L9tM9S8tLO/aPET/ricl0OlLf/wXv3oRaqGwqXFjXX8=;
        b=B5zWfoZB+3eGpKfH5JJaJ5vogOUG9VrS8qHL/OD1VCy7dCPEJV039jcQa5fRxtDedN
         Yx5RwfP7qWSl9UKJEbILpQdI5J6catU2E3OoDAppgWfRa/lD68J4kJ0EAZ0KgJJMkm4d
         hRcJGHybCyN91CuxLjO1W/7PbE0ZQRNxLsOJZ5nJYkGtz6QbZFSjzC1vgkv4aid4V9xI
         uODJHYOnH8W0r9oxER5GIhd0uutPleHhcNH1TNu0MBZ8wSmjYE4KwYVJBo8P3PKeODEb
         811h9dKfaPcWeNRYgIuM682QssI8UF8z89W+rvJQHbOkRxj/0Qawm9P3w2NLrmg75VMw
         R5jg==
X-Gm-Message-State: APjAAAUkhGzmjNApneQh8C+osIGcr9ia7K151v36KkVdtck4NEIh7CIH
        ihkTLBzYuP9w7SxF560Ap8Lm/89YpT3mBUIUrrl03QExg8Up
X-Google-Smtp-Source: APXvYqy8jEwSgPKZ/BRyeNDuJqnsOcPJXJpDIutX8qkjtsBvCDFO3ulOKUpK2ufqSzu9eis2I7lb6gkzjrxYXmo0qjeKStz76uR3
MIME-Version: 1.0
X-Received: by 2002:a92:9fdb:: with SMTP id z88mr24219433ilk.38.1569883155347;
 Mon, 30 Sep 2019 15:39:15 -0700 (PDT)
Date:   Mon, 30 Sep 2019 15:39:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d043690593cce730@google.com>
Subject: KASAN: slab-out-of-bounds Read in hiddev_ioctl_usage
From:   syzbot <syzbot+a3f4c2f4f8cde2ff797b@syzkaller.appspotmail.com>
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

HEAD commit:    2994c077 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=15170f6d600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=69ddefac6929256a
dashboard link: https://syzkaller.appspot.com/bug?extid=a3f4c2f4f8cde2ff797b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a1a55b600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=107c47bd600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a3f4c2f4f8cde2ff797b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in hiddev_ioctl_usage.isra.0+0x12d0/0x13b0  
drivers/hid/usbhid/hiddev.c:535
Read of size 4 at addr ffff8881d3fc81dc by task syz-executor894/1724

CPU: 0 PID: 1724 Comm: syz-executor894 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x12 mm/kasan/common.c:634
  hiddev_ioctl_usage.isra.0+0x12d0/0x13b0 drivers/hid/usbhid/hiddev.c:535
  hiddev_ioctl+0x7a1/0x1550 drivers/hid/usbhid/hiddev.c:807
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x444969
Code: e8 bc af 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 1b d8 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffff4d72ed8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000444969
RDX: 0000000020000100 RSI: 00000000c018480b RDI: 0000000000000004
RBP: 00000000006cf018 R08: 8fce4d9635172f21 R09: 00000000004002e0
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000402610
R13: 00000000004026a0 R14: 0000000000000000 R15: 0000000000000000

The buggy address belongs to the page:
page:ffffea00074fe000 refcount:1 mapcount:0 mapping:0000000000000000  
index:0x0 compound_mapcount: 0
flags: 0x200000000010000(head)
raw: 0200000000010000 dead000000000100 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d3fc8080: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
  ffff8881d3fc8100: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
> ffff8881d3fc8180: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
                                                     ^
  ffff8881d3fc8200: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
  ffff8881d3fc8280: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0747C382898
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 11:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236146AbhEQJne (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 05:43:34 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:44784 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236075AbhEQJnd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 05:43:33 -0400
Received: by mail-il1-f199.google.com with SMTP id p6-20020a92d6860000b02901bb4be9e3c1so5883455iln.11
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 02:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=mq/JV9mVZjAk0mH8ng+q0dW3P9Vxyd3kxyOwfR9eQr0=;
        b=duluB9EZq2HwqTV892913LknpA6j3lOH0D6n16auXweFR5lcNPHMHwNP2tkjR6U4k/
         Mztbt4Lrq1u+PjY3rZNnjoS8/GBcQrb0Z8URkWk90fYehJkEKGAlPE2UlcwwBnvXyurM
         07dRv+0Gbjfzv1kE/4isaUNamXdZbKXnemrwPURoEzlJbtxc2LJFREJQoN/OzxtQqHLx
         9TAWu28798B/S9P/GBjnf7Hah16IBkYRsSaXACPCDLc+cq+a2wDDUPuyUJN9bgVE2Qwo
         9BOjqXBAadmgD3ouILaq2FS8/1GsFgvX0gbYvgwzwlJq9rPwAuLLFwGLVoVzqm7C/DAo
         C/Cw==
X-Gm-Message-State: AOAM530hfl1AAsrz5rw5iCAVPXS86ULA8mRQx/3vWxwSDde4IMkdROk7
        5O2jSE48ojw5bw6zfMgopJKbj/DCQZ2j9H7MiEvVb83DhjA6
X-Google-Smtp-Source: ABdhPJzrjHprlvUHNR9oKqZ4tIczWX+GUbba8Bh9j8ie8tqa8paxlsC9yAH2ehLAWedeURheOLDw3pL6FJ7crJvz1/Q+JO02K8lJ
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1809:: with SMTP id a9mr52247566ilv.184.1621244536789;
 Mon, 17 May 2021 02:42:16 -0700 (PDT)
Date:   Mon, 17 May 2021 02:42:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b5a0af05c28368b4@google.com>
Subject: [syzbot] general protection fault in magicmouse_remove
From:   syzbot <syzbot+ee6f6e2e68886ca256a8@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    d665ea6e Merge tag 'for-linus-5.13-rc1' of git://git.kerne..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=11afac45d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f635d6ce17da8a68
dashboard link: https://syzkaller.appspot.com/bug?extid=ee6f6e2e68886ca256a8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d48069d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12023fa9d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ee6f6e2e68886ca256a8@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=05ac, idProduct=0265, bcdDevice= 0.40
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
usb 1-1: USB disconnect, device number 2
general protection fault, probably for non-canonical address 0xdffffc000000002b: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000158-0x000000000000015f]
CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.12.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:timer_is_static_object+0x20/0x90 kernel/time/timer.c:625
Code: 84 00 00 00 00 00 0f 1f 40 00 41 54 53 48 89 fb e8 d5 86 10 00 48 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75 4f 45 31 e4 48 83 7b 08 00 74 0c e8 ab 86 10 00 44
RSP: 0018:ffffc9000007f330 EFLAGS: 00010006
RAX: dffffc0000000000 RBX: 0000000000000150 RCX: 0000000000000000
RDX: 000000000000002b RSI: ffffffff8130663b RDI: 0000000000000158
RBP: 0000000000000002 R08: 0000000000000000 R09: ffffffff8a5c35ab
R10: fffffbfff14b86b5 R11: 0000000000000000 R12: dffffc0000000000
R13: ffffffff86090c00 R14: 0000000000000150 R15: 1ffff9200000fe6b
FS:  0000000000000000(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004ba438 CR3: 00000001097bb000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 debug_object_assert_init lib/debugobjects.c:886 [inline]
 debug_object_assert_init+0x1df/0x2e0 lib/debugobjects.c:861
 debug_timer_assert_init kernel/time/timer.c:737 [inline]
 debug_assert_init kernel/time/timer.c:782 [inline]
 del_timer+0x6d/0x110 kernel/time/timer.c:1202
 try_to_grab_pending+0x6d/0xd0 kernel/workqueue.c:1252
 __cancel_work_timer+0xa6/0x570 kernel/workqueue.c:3098
 magicmouse_remove+0x3a/0x50 drivers/hid/hid-magicmouse.c:782
 hid_device_remove+0xed/0x240 drivers/hid/hid-core.c:2317
 __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1181
 device_release_driver_internal drivers/base/dd.c:1212 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1235
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xd40 drivers/base/core.c:3507
 hid_remove_device drivers/hid/hid-core.c:2488 [inline]
 hid_destroy_device+0xe1/0x150 drivers/hid/hid-core.c:2507
 usbhid_disconnect+0x9f/0xe0 drivers/hid/usbhid/hid-core.c:1436
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
 __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1181
 device_release_driver_internal drivers/base/dd.c:1212 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1235
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xd40 drivers/base/core.c:3507
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1413
 usb_disconnect.cold+0x27d/0x791 drivers/usb/core/hub.c:2219
 hub_port_connect drivers/usb/core/hub.c:5127 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5416 [inline]
 port_event drivers/usb/core/hub.c:5562 [inline]
 hub_event+0x1c9c/0x4320 drivers/usb/core/hub.c:5644
 process_one_work+0x98d/0x1580 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x38c/0x460 kernel/kthread.c:313
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
Modules linked in:
---[ end trace 3f2c8ec737b57211 ]---
RIP: 0010:timer_is_static_object+0x20/0x90 kernel/time/timer.c:625
Code: 84 00 00 00 00 00 0f 1f 40 00 41 54 53 48 89 fb e8 d5 86 10 00 48 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75 4f 45 31 e4 48 83 7b 08 00 74 0c e8 ab 86 10 00 44
RSP: 0018:ffffc9000007f330 EFLAGS: 00010006
RAX: dffffc0000000000 RBX: 0000000000000150 RCX: 0000000000000000
RDX: 000000000000002b RSI: ffffffff8130663b RDI: 0000000000000158
RBP: 0000000000000002 R08: 0000000000000000 R09: ffffffff8a5c35ab
R10: fffffbfff14b86b5 R11: 0000000000000000 R12: dffffc0000000000
R13: ffffffff86090c00 R14: 0000000000000150 R15: 1ffff9200000fe6b
FS:  0000000000000000(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004ba438 CR3: 00000001097bb000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

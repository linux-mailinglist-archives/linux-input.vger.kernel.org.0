Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29638B4094
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 20:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731564AbfIPSt3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 14:49:29 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:42012 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390540AbfIPStM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 14:49:12 -0400
Received: by mail-io1-f71.google.com with SMTP id x9so1133404ior.9
        for <linux-input@vger.kernel.org>; Mon, 16 Sep 2019 11:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=lsjoWdb29H1URgbvvIQ/akyCyj3dPalRUxcjRdE+WJI=;
        b=XrBRUbG3vQQiO9Ys0gssVAj7HWosf6dumDZ4RbzCQ1N8vlH74keVUrgzKGj51q6uc1
         kym8rIqpxbcEi/UwpxkvoM1S0ae2Rr+7P7rCveRYoFFVGC7wS2iNvhuPLqjLkOnH6AxK
         sk2QpwffOVnjJpTQpNPxzQ7NAhgQYMlvB1S92cR1eXVhaYB8qxJediY1jjm6ob9Fvcd6
         QrjA5Il2e8lDu24cN8XqIQGZSIOF4hfyJKW6934VvS+B5+vPvrByJo13huWUeiPSuxBQ
         JTGmNSoqRF7YSKV3C0i+G3tIzyQqAhbkdrL66Bg99/E4pCqZ6QPfKyfYtOSG6mrwer5V
         HyfQ==
X-Gm-Message-State: APjAAAVcMtsNAXmrMsUS3SBDPAkeVUL5NUazgdvO279FRrR2y8scQpOh
        QCWYgpNJA8MG1/ywIpV2Bo23O9g0THCPn7jNVlQzYX45IDBo
X-Google-Smtp-Source: APXvYqx1UYU5N0W/RNEBgs0Cch57LChMYV1Z8DTow0KuDWXjhamCR1KvF8xqIbScKKolvajXRI7SO66tQqU4w0hi/L0MTA5NnrpC
MIME-Version: 1.0
X-Received: by 2002:a5d:91c8:: with SMTP id k8mr84730ior.232.1568659751875;
 Mon, 16 Sep 2019 11:49:11 -0700 (PDT)
Date:   Mon, 16 Sep 2019 11:49:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000048baec0592b00f00@google.com>
Subject: WARNING: ODEBUG bug in usbhid_probe
From:   syzbot <syzbot+d534bb48eb6d94062cfa@syzkaller.appspotmail.com>
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

HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=14982e6e600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=d534bb48eb6d94062cfa
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d534bb48eb6d94062cfa@syzkaller.appspotmail.com

usbhid 5-1:1.0: can't add hid device: -71
------------[ cut here ]------------
ODEBUG: free active (active state 0) object type: timer_list hint:  
hid_retry_timeout+0x0/0xd0 drivers/hid/usbhid/hid-core.c:712
WARNING: CPU: 0 PID: 12 at lib/debugobjects.c:481  
debug_print_object+0x160/0x250 lib/debugobjects.c:481
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x2a3/0x6da kernel/panic.c:219
  __warn.cold+0x20/0x4a kernel/panic.c:576
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:debug_print_object+0x160/0x250 lib/debugobjects.c:481
Code: dd 40 f6 da 85 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 bf 00 00 00 48  
8b 14 dd 40 f6 da 85 48 c7 c7 80 eb da 85 e8 25 c5 31 ff <0f> 0b 83 05 0b  
fc a7 05 01 48 83 c4 20 5b 5d 41 5c 41 5d c3 48 89
RSP: 0018:ffff8881da20f178 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000040000 RSI: ffffffff81288ddd RDI: ffffed103b441e21
RBP: 0000000000000001 R08: ffff8881da1f9800 R09: ffffed103b645d58
R10: ffffed103b645d57 R11: ffff8881db22eabf R12: ffffffff86d0dd60
R13: ffffffff812e7c20 R14: ffff8881cfebe8c8 R15: ffff8881d412fa80
  __debug_check_no_obj_freed lib/debugobjects.c:963 [inline]
  debug_check_no_obj_freed+0x2df/0x443 lib/debugobjects.c:994
  free_pages_prepare mm/page_alloc.c:1174 [inline]
  __free_pages_ok+0x222/0x1d70 mm/page_alloc.c:1420
  usbhid_probe+0xcd1/0xfa0 drivers/hid/usbhid/hid-core.c:1395
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

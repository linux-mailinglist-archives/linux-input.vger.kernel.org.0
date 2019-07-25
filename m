Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5EF74DC5
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 14:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfGYMIP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 08:08:15 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:42128 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbfGYMIH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 08:08:07 -0400
Received: by mail-io1-f70.google.com with SMTP id f22so54651786ioj.9
        for <linux-input@vger.kernel.org>; Thu, 25 Jul 2019 05:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=6e+QqFryDcGWihWGuKSCVPYu/CjTy/Tj+YmlKPGZ1UM=;
        b=XxvVoRlwBagsingwE6X3MQOefVLITBYlu2XZn2IfmktXs7UIavCbrbNk+SqNJizpKi
         pdukszeA7oSetK0nITpSHrRJvY5x7Ka/aWhAMz9CTQXbTzQV4PxRjKZTydopMGfDsEvM
         UTGtlYEdAxEo3Df86b94hsAa8cNPq2AEUID5N31cI/yvPVzfFxZnpglaWXoV75w50+1S
         gp+k8c8Ulb/jVId6eODDRWlD448VMrqKfgPWL2O43C4d5FhY7GFZSuAzGPwc/Xme55bB
         788+yBeHrvYyTKl7qwZoFEYy9BqYm6TlP3X+ZWqNNkoSjfeTZ861Muit7lbTr1huGD2L
         S2WA==
X-Gm-Message-State: APjAAAXiLVqKXX0hpqPqsRww2Q1q+Gb5GjRFmdSrjYD+YHAT9yKS/wRH
        V/wOO3TIRgPAHU4TIuM8H6JxqkIDSDQyBk37y6EwN1BU+8/0
X-Google-Smtp-Source: APXvYqwsDwd3U1KN4MdIaVRUXfzIAQ3a63VwAewt1ikeaU01fK6AZFsQszjqONjZTjZzVtRjtcqs3wDl57P2v6mno1n84vq+jypy
MIME-Version: 1.0
X-Received: by 2002:a02:b812:: with SMTP id o18mr85319462jam.64.1564056486479;
 Thu, 25 Jul 2019 05:08:06 -0700 (PDT)
Date:   Thu, 25 Jul 2019 05:08:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000490d4c058e8047e6@google.com>
Subject: WARNING: ODEBUG bug in __free_pages_ok
From:   syzbot <syzbot+6ff9bba63b987471b8be@syzkaller.appspotmail.com>
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

HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=10d72ef0600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
dashboard link: https://syzkaller.appspot.com/bug?extid=6ff9bba63b987471b8be
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144edb68600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14cd0e64600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6ff9bba63b987471b8be@syzkaller.appspotmail.com

usb 1-1: USB disconnect, device number 2
------------[ cut here ]------------
ODEBUG: free active (active state 0) object type: timer_list hint:  
hid_retry_timeout+0x0/0xd0 drivers/hid/usbhid/hid-core.c:716
WARNING: CPU: 1 PID: 21 at lib/debugobjects.c:325  
debug_print_object+0x160/0x250 lib/debugobjects.c:325
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 21 Comm: kworker/1:1 Not tainted 5.2.0-rc6+ #15
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x292/0x6c9 kernel/panic.c:219
  __warn.cold+0x20/0x4b kernel/panic.c:576
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:986
RIP: 0010:debug_print_object+0x160/0x250 lib/debugobjects.c:325
Code: dd e0 16 ba 85 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 bf 00 00 00 48  
8b 14 dd e0 16 ba 85 48 c7 c7 c0 0c ba 85 e8 db c7 33 ff <0f> 0b 83 05 03  
6e 86 05 01 48 83 c4 20 5b 5d 41 5c 41 5d c3 48 89
RSP: 0018:ffff8881d9eff710 EFLAGS: 00010086
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8127ef3d RDI: ffffed103b3dfed4
RBP: 0000000000000001 R08: ffff8881d9e36000 R09: ffffed103b663ed7
R10: ffffed103b663ed6 R11: ffff8881db31f6b7 R12: ffffffff86b04760
R13: ffffffff812db3c0 R14: ffffffff88f4bae8 R15: ffff8881d0e1a8c8
  __debug_check_no_obj_freed lib/debugobjects.c:785 [inline]
  debug_check_no_obj_freed+0x2a3/0x42e lib/debugobjects.c:817
  free_pages_prepare mm/page_alloc.c:1140 [inline]
  __free_pages_ok+0x215/0x1bb0 mm/page_alloc.c:1366
  usbhid_disconnect+0x98/0xd0 drivers/hid/usbhid/hid-core.c:1414
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1081 [inline]
  device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x460/0xb80 drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 drivers/usb/core/hub.c:2199
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x13bd/0x3550 drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

======================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

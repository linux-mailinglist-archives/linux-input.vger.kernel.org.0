Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1BD381890
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 13:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbfHEL6I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 07:58:08 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:36836 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbfHEL6H (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Aug 2019 07:58:07 -0400
Received: by mail-io1-f70.google.com with SMTP id k21so91998874ioj.3
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2019 04:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Q45b86lNMk/ackMVfZQ0OhqLDALygn4H6DlW9QRBpRA=;
        b=JJtj7g7HgQ5X/TorEmPDizFJlffJzozR6qy9Ib5SAmojc9fbp481R22cLqInmlGgra
         Cq4bPBBWL4FOqTpP3wrNHWqnx0F05beyWka4W7SHUhzP9tqRaDs+iDdPRkulz8Z2PL9J
         twO9hGD0thQ26mK7+b4EHYy8MYCxWX09yjQGj8ud3slAxNDWjLUOErmeb/b0hP++D9Ki
         npGZiWgeB9wDR8nv8Zj7MqA2d9U4cVehnz/gE6Jg0eOOJ0r3Z7DJgRdONWvWg/YoIKaY
         oif6iumIjeJZUH3gGdvJ0NvSmwgAQ8WKa2yqo8xA7Mj9m0KsuUdGdjpBBFekU8UGcIPH
         r68w==
X-Gm-Message-State: APjAAAXAdxzmBIobHwFoVsa+I2n23KOdeVhP7fD4IJHs1S8hqZ9DRi3m
        x3y1wq9/ICpRHQzc3CrOTA3lHFz8+ueTVn6HJmLx/PoXhFud
X-Google-Smtp-Source: APXvYqxWzRJsYur4i5e8jrqLN8uyPVtZeooFu2rlzyao3vA47td6Noah9r3a8/VG6QaSYqL76yo/jRYRkcjw5tWOql7J1585Sl4k
MIME-Version: 1.0
X-Received: by 2002:a02:c916:: with SMTP id t22mr15405656jao.24.1565006286599;
 Mon, 05 Aug 2019 04:58:06 -0700 (PDT)
Date:   Mon, 05 Aug 2019 04:58:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c8bea1058f5d6bf6@google.com>
Subject: WARNING in usbtouch_reset_resume
From:   syzbot <syzbot+91f7bbcce580376d784e@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        kstewart@linuxfoundation.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mpe@ellerman.id.au, rfontana@redhat.com, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1104baf8600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=91f7bbcce580376d784e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14199a62600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17d94aaa600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+91f7bbcce580376d784e@syzkaller.appspotmail.com

input: USB Touchscreen 0eef:0002 as  
/devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.180/input/input5
usb 1-1: reset high-speed USB device number 2 using dummy_hcd
usb 1-1: Using ep0 maxpacket: 32
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:912 __mutex_lock_common  
kernel/locking/mutex.c:912 [inline]
WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:912  
__mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc2+ #25
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
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:912 [inline]
RIP: 0010:__mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
Code: d2 0f 85 f6 05 00 00 44 8b 05 7b de 1c 02 45 85 c0 0f 85 0a f4 ff ff  
48 c7 c6 c0 92 c6 85 48 c7 c7 60 90 c6 85 e8 f4 c4 a6 fb <0f> 0b e9 f0 f3  
ff ff 65 48 8b 1c 25 00 ef 01 00 be 08 00 00 00 48
RSP: 0018:ffff8881da20f6b0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128a0fd RDI: ffffed103b441ec8
RBP: ffff8881da20f820 R08: ffff8881da1f9800 R09: fffffbfff0d9ee35
R10: fffffbfff0d9ee34 R11: ffffffff86cf71a3 R12: 0000000000000000
R13: dffffc0000000000 R14: ffff8881d2e291c8 R15: ffff8881d2fba228
  usbtouch_reset_resume+0xb1/0x170  
drivers/input/touchscreen/usbtouchscreen.c:1611
  usb_resume_interface drivers/usb/core/driver.c:1242 [inline]
  usb_resume_interface.isra.0+0x184/0x390 drivers/usb/core/driver.c:1210
  usb_resume_both+0x26a/0x7b0 drivers/usb/core/driver.c:1412
  __rpm_callback+0x27e/0x3c0 drivers/base/power/runtime.c:355
  rpm_callback+0x18f/0x230 drivers/base/power/runtime.c:485
  rpm_resume+0x10f7/0x1870 drivers/base/power/runtime.c:849
  __pm_runtime_resume+0x103/0x180 drivers/base/power/runtime.c:1076
  pm_runtime_get_sync include/linux/pm_runtime.h:226 [inline]
  usb_autoresume_device+0x1e/0x60 drivers/usb/core/driver.c:1599
  usb_remote_wakeup+0x7b/0xb0 drivers/usb/core/hub.c:3603
  hub_port_connect_change drivers/usb/core/hub.c:5199 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x246c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
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
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

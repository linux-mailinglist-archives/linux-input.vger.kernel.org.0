Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2E4A683F
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 14:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbfICMJF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 08:09:05 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:42846 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728995AbfICMIK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 08:08:10 -0400
Received: by mail-io1-f71.google.com with SMTP id x9so22825501ior.9
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2019 05:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=aX4G0iDqPx+MweGp7YMY5V/3PPLadE9WmDWOVG4Z+nc=;
        b=k24XQKfmKkETf4m/JDro0cRWtZro6EFirz7Mc5k9hMq+ZpFKb0AaF6voKd01NB57Gw
         GxwaEqO7XXvAgtSstqivZkE8qh1alScPIuS8WiWWqVL+tEjRTsvlX5gvOEKkmKLPlQfz
         4XmCyv9RYlLKNV6DZ2K0Wl39+MqDLIaLTpoMg2OBHIs0ONNvxMVb2MoU5+KfRmhUZ0iO
         R01aZrcExWQdcqgcVcStYPpM43kpMdgh1lf5zFq59Zxb8uL/boM5usmjWn7vJ8ggx+gQ
         PjLJgTYxwZvYbKggdsHhGEd8g8pSRK2PdL8gnI3mEQzFtUAkZcbxVKpzO+2CW52LJEPE
         gYSQ==
X-Gm-Message-State: APjAAAXnkrIp22vZjvoX9taKPYj7dPj58jLilm70p8UPfijXSf5vmnnN
        MrC3fu0LjK9iogiXdFFp4m8dV4jUqIUtOnBnkNQIyssoXaaI
X-Google-Smtp-Source: APXvYqzJ8UukIHJyCYHiMvGaItBRCKLR13k6V9qAbiaot38Gz3camB4GoeBD26AhIWOCUTf+bC5Dx1KcX49tS/7YmKtM9JYU7wIu
MIME-Version: 1.0
X-Received: by 2002:a5d:96cb:: with SMTP id r11mr41808403iol.200.1567512489310;
 Tue, 03 Sep 2019 05:08:09 -0700 (PDT)
Date:   Tue, 03 Sep 2019 05:08:09 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001b41900591a4f149@google.com>
Subject: WARNING: ODEBUG bug in usbhid_disconnect (2)
From:   syzbot <syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com>
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

HEAD commit:    eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=173983ac600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=14b53bfeb17f2b210eb7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d36aca600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178e208e600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object type: timer_list hint:  
hid_retry_timeout+0x0/0xd0 drivers/hid/usbhid/hid-core.c:712
WARNING: CPU: 1 PID: 17 at lib/debugobjects.c:481  
debug_print_object+0x160/0x250 lib/debugobjects.c:481
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.0-rc5+ #28
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
Code: dd 80 ef da 85 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 bf 00 00 00 48  
8b 14 dd 80 ef da 85 48 c7 c7 c0 e4 da 85 e8 e5 dd 31 ff <0f> 0b 83 05 4b  
0f a8 05 01 48 83 c4 20 5b 5d 41 5c 41 5d c3 48 89
RSP: 0018:ffff8881da24f718 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81288cfd RDI: ffffed103b449ed5
RBP: 0000000000000001 R08: ffff8881da233000 R09: fffffbfff11ad79a
R10: fffffbfff11ad799 R11: ffffffff88d6bccf R12: ffffffff86d0dc60
R13: ffffffff812e7b70 R14: ffff8881c9d5a8c8 R15: ffff8881cf8943f0
  __debug_check_no_obj_freed lib/debugobjects.c:963 [inline]
  debug_check_no_obj_freed+0x2df/0x443 lib/debugobjects.c:994
  free_pages_prepare mm/page_alloc.c:1174 [inline]
  __free_pages_ok+0x222/0x1d70 mm/page_alloc.c:1420
  usbhid_disconnect+0xab/0xd0 drivers/hid/usbhid/hid-core.c:1414
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1134 [inline]
  device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x420/0xb10 drivers/base/core.c:2339
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
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
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF48337FE7B
	for <lists+linux-input@lfdr.de>; Thu, 13 May 2021 21:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhEMT7i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 May 2021 15:59:38 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:51948 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbhEMT7h (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 May 2021 15:59:37 -0400
Received: by mail-io1-f71.google.com with SMTP id h7-20020a5d9e070000b029041a1f6bccc8so18699154ioh.18
        for <linux-input@vger.kernel.org>; Thu, 13 May 2021 12:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=zbr4GK6k9zt5lq+LmpSbl3z7Nt3WRggB3cvlykyJ2RY=;
        b=ipOhujNBebKQNGC9SiDmZz1JlSUSnwgezPDsm0Sc5GL3CztgbXldkBJR709mfG66Sz
         oChsUR+GSwrXB1f0zAikYtN8LfjgKplZD4C80iCabwtTbQUUj9Yr2KCW8yebygfp1xS6
         iALZK8yK+Qg9T6oNxjO7FW85sM624jtvrSfRDsdUx0e/3NvBuOUF0gMdD375niFkjmlL
         OGsmfedWMkQRS0uibKTic8LIPAyu5CTLCbPOST4nLiFSfZGCNWLEb7uIU1pDl3vp1vBO
         /MN9Y8l5IprsKqQu0JlD2tKSpq8enHFQj0tiT2VZGbA9Zdneb8LF3DUm0xItSy7rXgK5
         6s8Q==
X-Gm-Message-State: AOAM531S2o/Dx1+VJRZpkyHuUPeZyPCRm+z3S+Oql8UW1y9m45F2Oe+J
        BjEICkrMK00cbvhUH6THiZF1bzs3rO68H4QdtfaXPgTDddDN
X-Google-Smtp-Source: ABdhPJxTpTE/WllSfWcwQEImwUJBGzq5dl2f2WnpKA9+RhvH+zoSMp6d7Szvu34Zpb4AmVQA2tecAbzXeNVAykMEDK/yHf80CwqX
MIME-Version: 1.0
X-Received: by 2002:a5d:87c4:: with SMTP id q4mr30358861ios.141.1620935904670;
 Thu, 13 May 2021 12:58:24 -0700 (PDT)
Date:   Thu, 13 May 2021 12:58:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cd379f05c23b8c98@google.com>
Subject: [syzbot] WARNING in cm109_input_open/usb_submit_urb
From:   syzbot <syzbot+d2ecf8b4cf94672e38a0@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        vulab@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    dbb5afad ptrace: make ptrace() fail if the tracee changed ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120cf41dd00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91ff0467ce169bc
dashboard link: https://syzkaller.appspot.com/bug?extid=d2ecf8b4cf94672e38a0
compiler:       Debian clang version 11.0.1-2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145312add00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d2ecf8b4cf94672e38a0@syzkaller.appspotmail.com

------------[ cut here ]------------
URB 0000000042c435ee submitted while active
WARNING: CPU: 0 PID: 4812 at drivers/usb/core/urb.c:378 usb_submit_urb+0xf7f/0x1550 drivers/usb/core/urb.c:378
Modules linked in:
CPU: 0 PID: 4812 Comm: kworker/0:3 Not tainted 5.13.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xf7f/0x1550 drivers/usb/core/urb.c:378
Code: 5c 41 5d 41 5e 41 5f 5d e9 ae 57 ff ff e8 79 e7 c3 fb c6 05 82 cd 69 08 01 48 c7 c7 60 81 e1 8a 4c 89 e6 31 c0 e8 41 35 90 fb <0f> 0b e9 f8 f0 ff ff e8 55 e7 c3 fb eb 05 e8 4e e7 c3 fb bb a6 ff
RSP: 0018:ffffc9000a44e898 EFLAGS: 00010246
RAX: bb99830218d5f900 RBX: ffff888018da6308 RCX: ffff88802993d4c0
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: 0000000000000cc0 R08: ffffffff81654e72 R09: ffffed1017343f24
R10: ffffed1017343f24 R11: 0000000000000000 R12: ffff888018da6300
R13: dffffc0000000000 R14: ffff888013de7850 R15: ffff888013de7810
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055fe941736a7 CR3: 000000001e8f1000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 cm109_input_open+0x1eb/0x460 drivers/input/misc/cm109.c:572
 input_open_device+0x184/0x2d0 drivers/input/input.c:629
 kbd_connect+0xe5/0x120 drivers/tty/vt/keyboard.c:1581
 input_attach_handler drivers/input/input.c:1035 [inline]
 input_register_device+0xe25/0x1350 drivers/input/input.c:2335
 cm109_usb_probe+0x11bf/0x16c0 drivers/input/misc/cm109.c:806
 usb_probe_interface+0x632/0xb30 drivers/usb/core/driver.c:396
 really_probe+0x3cb/0x1020 drivers/base/dd.c:580
 driver_probe_device+0x178/0x350 drivers/base/dd.c:763
 bus_for_each_drv+0x16a/0x1f0 drivers/base/bus.c:431
 __device_attach+0x301/0x560 drivers/base/dd.c:938
 bus_probe_device+0xb8/0x1f0 drivers/base/bus.c:491
 device_add+0x11fc/0x1670 drivers/base/core.c:3319
 usb_set_configuration+0x1a86/0x2100 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x83/0x140 drivers/usb/core/generic.c:238
 usb_probe_device+0x13a/0x260 drivers/usb/core/driver.c:293
 really_probe+0x3cb/0x1020 drivers/base/dd.c:580
 driver_probe_device+0x178/0x350 drivers/base/dd.c:763
 bus_for_each_drv+0x16a/0x1f0 drivers/base/bus.c:431
 __device_attach+0x301/0x560 drivers/base/dd.c:938
 bus_probe_device+0xb8/0x1f0 drivers/base/bus.c:491
 device_add+0x11fc/0x1670 drivers/base/core.c:3319
 usb_new_device+0xd45/0x1790 drivers/usb/core/hub.c:2556
 hub_port_connect+0x1055/0x27a0 drivers/usb/core/hub.c:5276
 hub_port_connect_change+0x5d0/0xbf0 drivers/usb/core/hub.c:5416
 port_event+0xaee/0x1140 drivers/usb/core/hub.c:5562
 hub_event+0x48d/0xd90 drivers/usb/core/hub.c:5644
 process_one_work+0x833/0x10c0 kernel/workqueue.c:2275
 worker_thread+0xac1/0x1300 kernel/workqueue.c:2421
 kthread+0x39a/0x3c0 kernel/kthread.c:313
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

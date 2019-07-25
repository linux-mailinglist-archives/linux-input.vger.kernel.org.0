Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 283B574DBF
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 14:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfGYMIH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 08:08:07 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:45529 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfGYMIH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 08:08:07 -0400
Received: by mail-io1-f72.google.com with SMTP id e20so54306966ioe.12
        for <linux-input@vger.kernel.org>; Thu, 25 Jul 2019 05:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=P3zakTim0o/92942Qn+47VXCBatg5fpoe0zlX85bt+o=;
        b=V72rVEsJyTgR/RyzKYoNgyNnbXJSU3sJYrKkom1/RqDGOAP0+1pqTBJ387JzIwd793
         vVupNc4RYpupzRGHHsa3WKZqa15DyfiFDqGZjUgpcrxUwJLAngsKaskGipiIFS13iWz2
         Eqb20PIVGJ7s8VObN2lASYFz018MPfP+8Njve2HIr/byaHshZW891XgEHoX9FPDvAzCw
         aFVgBdzzrYPM5YqCHeQkIYCkIFU1HpOXm8adwxpDLbTjf2U4OixQuW4+3c22QbeRGAGA
         qyxYyz10AWAwKKyKdn5nSUsV/o86GbFnHGjiR5svZwQwSB1oagMOnFOHcbzhA+pAzgDC
         cjyQ==
X-Gm-Message-State: APjAAAXBYuDxEBJYV24wQTULHoe81fMQ4ScRzhclCv9gdeKMPkJ/EC4W
        ptzkvNtJYCa4AWpgkUbIDQfNUIuXF7FW2FMsiBjqxMPFVndz
X-Google-Smtp-Source: APXvYqwyVzoOp3uv82a3oLNcEi2ls4DHAb+hAVdoO2K/8JhUZXvO+XjDqzMESz0hmiILk74c7uYXnqA4LwilTIECgu+dBq20F9fQ
MIME-Version: 1.0
X-Received: by 2002:a02:c95a:: with SMTP id u26mr87244306jao.15.1564056485936;
 Thu, 25 Jul 2019 05:08:05 -0700 (PDT)
Date:   Thu, 25 Jul 2019 05:08:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000040d299058e8047c2@google.com>
Subject: general protection fault in holtek_kbd_input_event
From:   syzbot <syzbot+965152643a75a56737be@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=14e6d3d0600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
dashboard link: https://syzkaller.appspot.com/bug?extid=965152643a75a56737be
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1663f8cc600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=145f2978600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+965152643a75a56737be@syzkaller.appspotmail.com

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 0 PID: 9738 Comm: syz-executor849 Not tainted 5.2.0-rc6+ #15
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:usb_get_intfdata include/linux/usb.h:265 [inline]
RIP: 0010:holtek_kbd_input_event+0xb7/0x1a0 drivers/hid/hid-holtek-kbd.c:127
Code: 48 8b 7b 40 31 f6 48 81 ef a0 00 00 00 e8 c1 7b ee fe 48 ba 00 00 00  
00 00 fc ff df 48 8d b8 a8 00 00 00 48 89 f9 48 c1 e9 03 <80> 3c 11 00 0f  
85 ab 00 00 00 48 8b 98 a8 00 00 00 48 b8 00 00 00
RSP: 0018:ffff8881ce297af8 EFLAGS: 00010002
RAX: 0000000000000000 RBX: ffff8881d530bbb0 RCX: 0000000000000015
RDX: dffffc0000000000 RSI: ffffffff8345640b RDI: 00000000000000a8
RBP: 0000000000000014 R08: ffff8881d1be1800 R09: ffffed103b646748
R10: ffffed103b646747 R11: ffff8881db233a3b R12: 0000000000000000
R13: 0000000000000004 R14: ffffffff8456e680 R15: 0000000000000003
FS:  00007f9ebaadb700(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f646c43c000 CR3: 00000001ce2a8000 CR4: 00000000001406f0
Call Trace:
  input_handle_event+0x6a9/0x11c0 drivers/input/input.c:374
  input_inject_event+0x270/0x304 drivers/input/input.c:462
  evdev_do_ioctl drivers/input/evdev.c:1102 [inline]
  evdev_ioctl_handler+0x6c4/0x19b0 drivers/input/evdev.c:1303
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xcda/0x12e0 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x44e599
Code: e8 3c e6 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb ca fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f9ebaadace8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000006e0c28 RCX: 000000000044e599
RDX: 0000000020000040 RSI: 0000000040084503 RDI: 0000000000000004
RBP: 00000000006e0c20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006e0c2c
R13: 00007ffe21581f9f R14: 00007f9ebaadb9c0 R15: 0000000000000000
Modules linked in:
---[ end trace 48abaec9fafcd397 ]---
RIP: 0010:usb_get_intfdata include/linux/usb.h:265 [inline]
RIP: 0010:holtek_kbd_input_event+0xb7/0x1a0 drivers/hid/hid-holtek-kbd.c:127
Code: 48 8b 7b 40 31 f6 48 81 ef a0 00 00 00 e8 c1 7b ee fe 48 ba 00 00 00  
00 00 fc ff df 48 8d b8 a8 00 00 00 48 89 f9 48 c1 e9 03 <80> 3c 11 00 0f  
85 ab 00 00 00 48 8b 98 a8 00 00 00 48 b8 00 00 00
RSP: 0018:ffff8881ce297af8 EFLAGS: 00010002
RAX: 0000000000000000 RBX: ffff8881d530bbb0 RCX: 0000000000000015
RDX: dffffc0000000000 RSI: ffffffff8345640b RDI: 00000000000000a8
RBP: 0000000000000014 R08: ffff8881d1be1800 R09: ffffed103b646748
R10: ffffed103b646747 R11: ffff8881db233a3b R12: 0000000000000000
R13: 0000000000000004 R14: ffffffff8456e680 R15: 0000000000000003
FS:  00007f9ebaadb700(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f646c43c000 CR3: 00000001ce2a8000 CR4: 00000000001406f0


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A14C3CC9C8
	for <lists+linux-input@lfdr.de>; Sun, 18 Jul 2021 17:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbhGRPtU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Jul 2021 11:49:20 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:54061 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234042AbhGRPtS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Jul 2021 11:49:18 -0400
Received: by mail-io1-f69.google.com with SMTP id c18-20020a5d9a920000b0290515fa57d24aso10403372iom.20
        for <linux-input@vger.kernel.org>; Sun, 18 Jul 2021 08:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=3BTWT7hOTOoutziemX0GlZm4ft3GIKdnYK170YdXmDk=;
        b=CbTbp3GFf8xbrU+0Yi/8K5X6vGMuwHzVgrTny3YPxaMHzk/cq3KpdwnFUsOSNfG97h
         dNleGSX7G5L9vou2iA/J0mepkOGFZIcFFfCZYuRB5be/KxLcq7gQszrUqxd1HiDIedpW
         UIS5ib4PIR+XdjHJFpNMSPElNm2WjI+xB9Lo2xWKZbyaeiiXNba66WJKQvj0o9NQioZ9
         Q4f5FQuxcJBLrKZp7Ur+pmWnq2Yx+gRLZf46IU1s72AJtnYUvnTrmcX6o111vYTYpowv
         yHsi9IBVAZKKSoCO/GK8L+zzytaPkmVTuyubYSCefAl8uUlng6MY1t96ob/+ACqMojge
         WBJQ==
X-Gm-Message-State: AOAM530MFsuLBlC0w/Guw6m5EUaNDlyJSPCHBRAhHw4TQG9O1ubM4oqu
        Ojxgh6k653XZGyYphuMQ+SJJ0gnkeXS5n9LoxbtRmyVXIRVV
X-Google-Smtp-Source: ABdhPJxxjcNkJfLc/19iCekAmSQTCZ0At/ztzraN5OxSKXhe6pIuPgcfxEjJ+pVXWIYItwRnUKm2DmNLtBmfiKy3YWaMVI60jNjn
MIME-Version: 1.0
X-Received: by 2002:a92:cf48:: with SMTP id c8mr4985606ilr.237.1626623180239;
 Sun, 18 Jul 2021 08:46:20 -0700 (PDT)
Date:   Sun, 18 Jul 2021 08:46:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d77b6505c767b8f8@google.com>
Subject: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
From:   syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    dd9c7df94c1b Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a9f66a300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f1b998c1afc13578
dashboard link: https://syzkaller.appspot.com/bug?extid=9b57a46bf1801ce2a2ca
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 7-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType a1
WARNING: CPU: 0 PID: 15508 at drivers/usb/core/urb.c:410 usb_submit_urb+0x149d/0x18a0 drivers/usb/core/urb.c:410
Modules linked in:
CPU: 0 PID: 15508 Comm: syz-executor.2 Not tainted 5.14.0-rc1-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:usb_submit_urb+0x149d/0x18a0 drivers/usb/core/urb.c:410
Code: 7c 24 40 e8 a5 e9 1f fc 48 8b 7c 24 40 e8 db 25 0c ff 45 89 e8 44 89 f1 4c 89 e2 48 89 c6 48 c7 c7 60 96 27 8a e8 e4 b2 91 03 <0f> 0b e9 a5 ee ff ff e8 77 e9 1f fc 0f b6 1d 37 2e 02 08 31 ff 41
RSP: 0018:ffffc900021cfb88 EFLAGS: 00010082
RAX: 0000000000000000 RBX: ffff8880786df058 RCX: 0000000000000000
RDX: 0000000000040000 RSI: ffffffff815d6855 RDI: fffff52000439f63
RBP: ffff88804a27bbe0 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff815d068e R11: 0000000000000000 R12: ffff8880168a42a8
R13: 00000000000000a1 R14: 0000000080000280 R15: ffff888029c86f00
FS:  0000000000000000(0000) GS:ffff88802ca00000(0063) knlGS:00000000f558cb40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f5580db0 CR3: 0000000077c36000 CR4: 0000000000150ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 hid_submit_ctrl+0x6ec/0xd80 drivers/hid/usbhid/hid-core.c:416
 usbhid_restart_ctrl_queue.isra.0+0x244/0x3a0 drivers/hid/usbhid/hid-core.c:258
 __usbhid_submit_report+0x6f0/0xd50 drivers/hid/usbhid/hid-core.c:603
 usbhid_submit_report drivers/hid/usbhid/hid-core.c:640 [inline]
 usbhid_init_reports+0x16e/0x3b0 drivers/hid/usbhid/hid-core.c:784
 hiddev_ioctl+0x10d4/0x1630 drivers/hid/usbhid/hiddev.c:794
 compat_ptr_ioctl+0x67/0x90 fs/ioctl.c:1105
 __do_compat_sys_ioctl+0x1c7/0x290 fs/ioctl.c:1167
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7fb3549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000f558c5fc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c018480d
RDX: 0000000020000080 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

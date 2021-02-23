Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302493226E1
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 09:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhBWIIE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 03:08:04 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:34518 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbhBWIHC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 03:07:02 -0500
Received: by mail-il1-f197.google.com with SMTP id c16so9747565ile.1
        for <linux-input@vger.kernel.org>; Tue, 23 Feb 2021 00:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=rxBR84xC/Grx3NTiVuFqSuYOWTtyniQJeb3oKST6QEU=;
        b=rXo3mmD4l4YGXM+gvUfMORYBpo5ozvfD9l8oRboDXugRuwMb7q0L/jVkjNauDkTqyq
         h6+H4Nto2ZKXFOtKOfexXMGSeEEnEM2sRWPj5+uwloVOTNnm3bqAyAcRgSo5yhz+K7Bl
         ZlMIeS7+Ae3eE2C8FYTHkT+rhGgSbZAtR/hqe1g0NYNCI/ifIe1OVIvstnK/6pbaQ0Nd
         UiZsvXbrgJKusziYsiFGsO051CcXTg8Ywtp+/gSEy1GQWiZdSbgIspRPS5PwZmQXkpKp
         rMinERzAnu3HR/Pk2tpY/21R6Y1VjhNErxBaM4ChC1FmEmTlmTsrC9r8ZXledcvWx7E8
         3DAg==
X-Gm-Message-State: AOAM531NLVBALnNGqKiZ3cUqITmBT9gWzQu40uJg66vlXAN1/xsD1UeX
        IDQENbYynkS1ZjnHsYMOTlyXTAvCdqKMTR3w0cYM3c31tZig
X-Google-Smtp-Source: ABdhPJyKdWEzRtf8vcujXc4zjsSrPkGUbJLDL738yZkU3rXcRz8RM+y0rKlXZ3n+cY0Ig63Esd1vHcK1Fze6JVcFNmBAr6h3ABfG
MIME-Version: 1.0
X-Received: by 2002:a5d:9689:: with SMTP id m9mr18586440ion.165.1614067581845;
 Tue, 23 Feb 2021 00:06:21 -0800 (PST)
Date:   Tue, 23 Feb 2021 00:06:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dc095b05bbfc6421@google.com>
Subject: WARNING in hid_alloc_report_buf
From:   syzbot <syzbot+ab02336a647181a886a6@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    f40ddce8 Linux 5.11
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12c5a17f500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4b919ebed7b4902
dashboard link: https://syzkaller.appspot.com/bug?extid=ab02336a647181a886a6
compiler:       Debian clang version 11.0.1-2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138bde22d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13b82c12d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ab02336a647181a886a6@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 8428 at mm/page_alloc.c:4979 __alloc_pages_nodemask+0x44e/0x500 mm/page_alloc.c:5023
Modules linked in:
CPU: 1 PID: 8428 Comm: syz-executor094 Not tainted 5.11.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__alloc_pages_nodemask+0x44e/0x500 mm/page_alloc.c:5023
Code: 00 48 ba 00 00 00 00 00 fc ff df e9 fb fd ff ff 89 f9 80 e1 07 80 c1 03 38 c1 0f 8c 06 fe ff ff e8 c7 53 09 00 e9 fc fd ff ff <0f> 0b e9 15 fe ff ff 44 89 ed a9 00 00 08 00 75 11 81 e5 7f ff ff
RSP: 0018:ffffc90001ad7c40 EFLAGS: 00010046
RAX: ffffc90001ad7c48 RBX: ffffc90001ad7c74 RCX: 0000000000000000
RDX: 0000000000000028 RSI: 0000000000000000 RDI: ffffc90001ad7c70
RBP: 0000000000000000 R08: dffffc0000000000 R09: ffffc90001ad7c48
R10: fffff5200035af8e R11: 0000000000000000 R12: 0000000020000007
R13: 0000000000040a20 R14: 1ffff9200035af8e R15: 0000000000000012
FS:  0000000001255300(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005573bf3240c0 CR3: 0000000013416000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 alloc_pages include/linux/gfp.h:547 [inline]
 kmalloc_order+0x40/0x130 mm/slab_common.c:837
 kmalloc_order_trace+0x15/0x70 mm/slab_common.c:853
 kmalloc_large include/linux/slab.h:481 [inline]
 __kmalloc+0x257/0x330 mm/slub.c:3974
 kmalloc include/linux/slab.h:557 [inline]
 hid_alloc_report_buf+0x70/0xa0 drivers/hid/hid-core.c:1648
 __usbhid_submit_report drivers/hid/usbhid/hid-core.c:590 [inline]
 usbhid_submit_report+0x3c6/0xa10 drivers/hid/usbhid/hid-core.c:640
 hid_hw_request include/linux/hid.h:1072 [inline]
 hiddev_ioctl+0x196c/0x2780 drivers/hid/usbhid/hiddev.c:726
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x444659
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 21 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff05ace6d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004004a0 RCX: 0000000000444659
RDX: 0000000020000080 RSI: 00000000400c4808 RDI: 0000000000000004
RBP: 0000000000403ee0 R08: 0000000000000001 R09: 00000000004004a0
R10: 000000000000001f R11: 0000000000000246 R12: 0000000000403f70
R13: 0000000000000000 R14: 00000000004b2018 R15: 00000000004004a0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

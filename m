Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E4F35747F
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 20:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355389AbhDGSoY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 14:44:24 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:52636 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355388AbhDGSoY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 14:44:24 -0400
Received: by mail-il1-f197.google.com with SMTP id e16so14535980ile.19
        for <linux-input@vger.kernel.org>; Wed, 07 Apr 2021 11:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=WZzzFkpmiW176aahvKciVtV3sCmstmJQcX68So36xaU=;
        b=r8PQ8HpwTCBEug45GRaFFJ+mj23kBKiZ9Eqk78Ebyhy6SD/7OdadozgmqmNdOGdgBM
         VByQA2VRKtYGC4jeC7tqDFrIKcccCxuPRl8bYgj9kbO2/+emm+YgG25dxEjL7YTqw1TJ
         5pidJ9u/oRqO+ZXuUvpT/mleBJAyd3Z/QsIm6UnYNc4wQZjeWX0relB1IXvDPw0+5REp
         LfQWwnKssvkHMp495MT6cFDjVMXajudU6RbpWgpA6Qs0UOCCCd9yBW5dTlxTGbF80OPG
         PJ9CgIj10AafmQZgvcCybIj9BhNKa9LzcaFmG0dJuwjFmReTAaiE2AAOaqfRVhdTr+5G
         xIqA==
X-Gm-Message-State: AOAM530MBqLJn8bx664XxIZJ0eHDp3Uv41mQ2ZO68MHLObH227bkt+9V
        0oKmFwQFt1hlmIk1ZhKhnuXsqiGtAE6wBT7WN3bMKtdv4r0a
X-Google-Smtp-Source: ABdhPJzE1euTssib50Yvv1PsTaxNkShaiVXc4NA2O+lzEmv/0vfy+VPcQktUAELTvGHODOoDASQsRBrt/TZGjehqeFq3BnmAHooY
MIME-Version: 1.0
X-Received: by 2002:a6b:e509:: with SMTP id y9mr3699249ioc.191.1617821054119;
 Wed, 07 Apr 2021 11:44:14 -0700 (PDT)
Date:   Wed, 07 Apr 2021 11:44:14 -0700
In-Reply-To: <0000000000003b5ed705b7a684ad@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003db20f05bf665167@google.com>
Subject: Re: [syzbot] WARNING in cm109_urb_irq_callback/usb_submit_urb
From:   syzbot <syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        hdanton@sina.com, isabel@tglworldwide.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, vulab@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    2d743660 Merge branch 'fixes' of git://git.kernel.org/pub/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1548f46ad00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f91155ccddaf919c
dashboard link: https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
compiler:       Debian clang version 11.0.1-2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d6cc96d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142de07ed00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com

cm109 3-1:0.0: cm109_urb_irq_callback: urb status -71
------------[ cut here ]------------
URB 000000003185a218 submitted while active
WARNING: CPU: 0 PID: 8764 at drivers/usb/core/urb.c:378 usb_submit_urb+0xf7f/0x1550 drivers/usb/core/urb.c:378
Modules linked in:
CPU: 0 PID: 8764 Comm: systemd-udevd Not tainted 5.12.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:usb_submit_urb+0xf7f/0x1550 drivers/usb/core/urb.c:378
Code: 5c 41 5d 41 5e 41 5f 5d e9 4e 5b ff ff e8 39 a0 fc fb c6 05 b4 45 25 08 01 48 c7 c7 e0 6e 5f 8a 4c 89 e6 31 c0 e8 81 84 cb fb <0f> 0b e9 f8 f0 ff ff e8 15 a0 fc fb eb 05 e8 0e a0 fc fb bb a6 ff
RSP: 0018:ffffc900000079a8 EFLAGS: 00010046
RAX: 300ec5186f788100 RBX: ffff888020ad2508 RCX: ffff88803054d4c0
RDX: 0000000000000101 RSI: 0000000000000101 RDI: 0000000000000000
RBP: 0000000000000a20 R08: ffffffff8160b632 R09: ffffed1017383f1c
R10: ffffed1017383f1c R11: 0000000000000000 R12: ffff888020ad2500
R13: dffffc0000000000 R14: dffffc0000000000 R15: 0000000000000082
FS:  00007f65b13318c0(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffda12b4ff8 CR3: 0000000020ed4000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 cm109_urb_irq_callback+0x693/0xbf0 drivers/input/misc/cm109.c:422
 __usb_hcd_giveback_urb+0x375/0x520 drivers/usb/core/hcd.c:1656
 dummy_timer+0xa22/0x2e70 drivers/usb/gadget/udc/dummy_hcd.c:1971
 call_timer_fn+0x91/0x160 kernel/time/timer.c:1431
 expire_timers kernel/time/timer.c:1476 [inline]
 __run_timers+0x6c0/0x8a0 kernel/time/timer.c:1745
 run_timer_softirq+0x63/0xf0 kernel/time/timer.c:1758
 __do_softirq+0x318/0x714 kernel/softirq.c:345
 invoke_softirq kernel/softirq.c:221 [inline]
 __irq_exit_rcu+0x1d8/0x200 kernel/softirq.c:422
 irq_exit_rcu+0x5/0x20 kernel/softirq.c:434
 sysvec_apic_timer_interrupt+0x91/0xb0 arch/x86/kernel/apic/apic.c:1100
 </IRQ>
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:632
RIP: 0010:tomoyo_check_acl+0xb1/0x430 security/tomoyo/domain.c:173
Code: 85 05 03 00 00 48 8b 1c 24 4c 8b 23 49 39 dc 0f 84 14 02 00 00 0f 1f 40 00 49 8d 6c 24 18 48 89 e8 48 c1 e8 03 42 0f b6 04 28 <84> c0 0f 85 1d 01 00 00 0f b6 6d 00 31 ff 89 ee e8 4a df d8 fd 85
RSP: 0018:ffffc9000276fbb8 EFLAGS: 00000a02
RAX: 0000000000000000 RBX: ffff888011bcec90 RCX: ffff88803054d4c0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
RBP: ffff888013c51118 R08: ffffffff83a03cb6 R09: ffffffff83a09b20
R10: 0000000000000003 R11: ffff88803054d4c0 R12: ffff888013c51100
R13: dffffc0000000000 R14: ffff888011bcec80 R15: 0000000000000000
 tomoyo_path_permission+0x1af/0x370 security/tomoyo/file.c:586
 tomoyo_path_perm+0x32f/0x570 security/tomoyo/file.c:838
 security_inode_getattr+0xc0/0x140 security/security.c:1288
 vfs_getattr fs/stat.c:131 [inline]
 vfs_statx+0xe8/0x320 fs/stat.c:199
 vfs_fstatat fs/stat.c:217 [inline]
 vfs_lstat include/linux/fs.h:3240 [inline]
 __do_sys_newlstat fs/stat.c:372 [inline]
 __se_sys_newlstat fs/stat.c:366 [inline]
 __x64_sys_newlstat+0x81/0xd0 fs/stat.c:366
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f65b01a3335
Code: 69 db 2b 00 64 c7 00 16 00 00 00 b8 ff ff ff ff c3 0f 1f 40 00 83 ff 01 48 89 f0 77 30 48 89 c7 48 89 d6 b8 06 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 03 f3 c3 90 48 8b 15 31 db 2b 00 f7 d8 64 89
RSP: 002b:00007ffda12b2c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000006
RAX: ffffffffffffffda RBX: 000055b4a2eaa170 RCX: 00007f65b01a3335
RDX: 00007ffda12b2cb0 RSI: 00007ffda12b2cb0 RDI: 000055b4a2ea9170
RBP: 00007ffda12b2d70 R08: 00007f65b0462218 R09: 0000000000001010
R10: 00000000000001a0 R11: 0000000000000246 R12: 000055b4a2ea9170
R13: 000055b4a2ea9191 R14: 000055b4a2eb1fd6 R15: 000055b4a2eb1fe1


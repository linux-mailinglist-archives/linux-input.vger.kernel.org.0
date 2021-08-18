Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7753F0C7C
	for <lists+linux-input@lfdr.de>; Wed, 18 Aug 2021 22:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhHRUNm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Aug 2021 16:13:42 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:40489 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbhHRUNl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Aug 2021 16:13:41 -0400
Received: by mail-io1-f69.google.com with SMTP id c14-20020a6bfd0e0000b02905b2d3028604so1887537ioi.7
        for <linux-input@vger.kernel.org>; Wed, 18 Aug 2021 13:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=5Yk/eiQ6KrFu/vHlR0f2hOKUDdwbHPflHULMacmR8bo=;
        b=Hx5cd3mGgdCvbTqW5bovLaZX+Ac35Y5/+mKGIdiNZY+4XyyVDHM7fkd4tHUff/OsuV
         KKeM6WVkvAkwrwYQoVM8JvoXVDk1D8sAetoG+aw6D7PnxkwafUlliFWRvTwi5wEQnwrs
         nnNJL92dhqbpZWr8zKcb3dYfsYmEGnI06HJwrI34jSD3BLccjprySwZvoRcs4hto/5fY
         y7Aq0Tbap+91aNC5m84z75ykknt4AuxrXRY011H+f8N1q2SEhFDBEOh8Bqq4f/fnEGnq
         qyFXRzNZJJw+8r6vesa435mC8Y4zDraMJEqBg1KZKCDrENU5relbEuRmbS3h2HZNg70i
         WLvg==
X-Gm-Message-State: AOAM531oz9DcIND7AZ/NsrI2t90TckP7Xyms39CNIpvh3ajFlrEDwKcZ
        cShqze6P/s1VvlIzCqll0WXsKiJ7UQVSeEz7Nt825My0htRY
X-Google-Smtp-Source: ABdhPJy0qr44PsK++dTzPpRCSLNNVfh6l63Dc89uxnPCmHyKkP0kc0S/LQswtNBUAU7+5vg6R5jwNA9YLcGjSCYoz0Y/+n5knkva
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1905:: with SMTP id p5mr9581118jal.25.1629317586462;
 Wed, 18 Aug 2021 13:13:06 -0700 (PDT)
Date:   Wed, 18 Aug 2021 13:13:06 -0700
In-Reply-To: <20210818184927.GD197200@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f7ab1005c9db0f8e@google.com>
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
From:   syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mkubecek@suse.cz,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in hid_submit_ctrl/usb_submit_urb

------------[ cut here ]------------
usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType a1
WARNING: CPU: 1 PID: 10180 at drivers/usb/core/urb.c:410 usb_submit_urb+0x149d/0x18a0 drivers/usb/core/urb.c:410
Modules linked in:
CPU: 1 PID: 10180 Comm: syz-executor.0 Not tainted 5.14.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:usb_submit_urb+0x149d/0x18a0 drivers/usb/core/urb.c:410
Code: 7c 24 40 e8 45 64 1f fc 48 8b 7c 24 40 e8 4b fc 0b ff 45 89 e8 44 89 f1 4c 89 e2 48 89 c6 48 c7 c7 e0 b2 27 8a e8 01 fc 91 03 <0f> 0b e9 a5 ee ff ff e8 17 64 1f fc 0f b6 1d 19 ca 01 08 31 ff 41
RSP: 0018:ffffc9000a68fbd0 EFLAGS: 00010082
RAX: 0000000000000000 RBX: ffff88802e22d058 RCX: 0000000000000000
RDX: ffff88801b2a1c40 RSI: ffffffff815d85c5 RDI: fffff520014d1f6c
RBP: ffff888018fcd910 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff815d23fe R11: 0000000000000000 R12: ffff8880155fb9d8
R13: 00000000000000a1 R14: 0000000080000280 R15: ffff88801c247600
FS:  00007fdbff87b700(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000050eab0 CR3: 000000003d108000 CR4: 0000000000350ee0
Call Trace:
 hid_submit_ctrl+0x6ff/0xde0 drivers/hid/usbhid/hid-core.c:415
 usbhid_restart_ctrl_queue.isra.0+0x244/0x3a0 drivers/hid/usbhid/hid-core.c:258
 __usbhid_submit_report+0x6f0/0xd50 drivers/hid/usbhid/hid-core.c:602
 usbhid_submit_report drivers/hid/usbhid/hid-core.c:639 [inline]
 usbhid_init_reports+0xd7/0x3b0 drivers/hid/usbhid/hid-core.c:779
 hiddev_ioctl+0xb27/0x1630 drivers/hid/usbhid/hiddev.c:689
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:1069 [inline]
 __se_sys_ioctl fs/ioctl.c:1055 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:1055
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4665e9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fdbff87b188 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000056bf80 RCX: 00000000004665e9
RDX: 0000000000000000 RSI: 0000000000004805 RDI: 0000000000000004
RBP: 00000000004bfcc4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000056bf80
R13: 00007ffddbcdc2ff R14: 00007fdbff87b300 R15: 0000000000022000
----------------
Code disassembly (best guess):
   0:	7c 24                	jl     0x26
   2:	40 e8 45 64 1f fc    	rex callq 0xfc1f644d
   8:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   d:	e8 4b fc 0b ff       	callq  0xff0bfc5d
  12:	45 89 e8             	mov    %r13d,%r8d
  15:	44 89 f1             	mov    %r14d,%ecx
  18:	4c 89 e2             	mov    %r12,%rdx
  1b:	48 89 c6             	mov    %rax,%rsi
  1e:	48 c7 c7 e0 b2 27 8a 	mov    $0xffffffff8a27b2e0,%rdi
  25:	e8 01 fc 91 03       	callq  0x391fc2b
  2a:	0f 0b                	ud2     <-- trapping instruction
  2c:	e9 a5 ee ff ff       	jmpq   0xffffeed6
  31:	e8 17 64 1f fc       	callq  0xfc1f644d
  36:	0f b6 1d 19 ca 01 08 	movzbl 0x801ca19(%rip),%ebx        # 0x801ca56
  3d:	31 ff                	xor    %edi,%edi
  3f:	41                   	rex.B


Tested on:

commit:         794c7931 Merge branch 'linus' of git://git.kernel.org/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=126c1765300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=96f0602203250753
dashboard link: https://syzkaller.appspot.com/bug?extid=9b57a46bf1801ce2a2ca
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
patch:          https://syzkaller.appspot.com/x/patch.diff?x=152c3561300000


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39F04380FF
	for <lists+linux-input@lfdr.de>; Sat, 23 Oct 2021 02:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhJWAko (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Oct 2021 20:40:44 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:45816 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbhJWAko (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Oct 2021 20:40:44 -0400
Received: by mail-io1-f71.google.com with SMTP id k9-20020a5d91c9000000b005dc4a740599so4295752ior.12
        for <linux-input@vger.kernel.org>; Fri, 22 Oct 2021 17:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=cfQzqlVWZTzR2tttQMXeICjvGad2we4h+IFW+rkzHtE=;
        b=GO8AX/HkK6IE3I+JN3eC6Mc3jZqiGGvAK6QLDknbGgFKOrYIUu/yr1fn/y0pSYmroN
         uLwmxRTwqHbWhqnHM27c9GpUFP9CkkO5FXWWQzRyOQ14dKJXWZDHdE7CYrv/lZpbNScs
         lQ3epDRmsw/WZe12VGLcd63Zcef0bq+GOveZ/aDxu5yVsI28E3Zq8jVjpyOjm30C8c01
         SFAV8q3RTvqEUqkskbU9r1tQ1x4YjeZLAMyxhBamSAVYY+uPa8HIlWuEZfNGBtAiEFRv
         AJbS8VzsPmoFgwK6J4LG/KSvsVMHpns7/AmMLHm8NT2ugCB9dShgolP6Pym6UXCzNCbq
         sIMA==
X-Gm-Message-State: AOAM531te62fnCpu4y2WTaaihuvbpqe9Xak1bGqBXD0Y/3oPTM77z6tW
        j50iAdAPVzI2tzq4AH2CEPqyAGkdXAMs56tIAKwRmfITWboY
X-Google-Smtp-Source: ABdhPJxGQaYHUyeLTYqZdhU5hCu/xJl3b9WgFDtTwH2QJaoaO3mx7ITTLk5CiKWWakbnaP7ZWz8xG30BsS91i7SaBxzbCBN/1ZSy
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c89:: with SMTP id w9mr1826772ill.237.1634949506147;
 Fri, 22 Oct 2021 17:38:26 -0700 (PDT)
Date:   Fri, 22 Oct 2021 17:38:26 -0700
In-Reply-To: <000000000000be49b905cd677b9a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008a2cd605cefa5841@google.com>
Subject: Re: [syzbot] WARNING in atp_close (3)
From:   syzbot <syzbot+b88c5eae27386b252bbd@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, fgheet255t@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    c26f1c109d21 usb: gadget: configfs: change config attribut..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=16cdc5f0b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e163c2f9cde7dc45
dashboard link: https://syzkaller.appspot.com/bug?extid=b88c5eae27386b252bbd
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a36864b00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1159b7b4b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b88c5eae27386b252bbd@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 1152 at kernel/workqueue.c:3074 __flush_work+0x93f/0xb20 kernel/workqueue.c:3074
Modules linked in:
CPU: 1 PID: 1152 Comm: acpid Not tainted 5.15.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__flush_work+0x93f/0xb20 kernel/workqueue.c:3074
Code: ff 41 89 c4 89 8d 88 fe ff ff e8 4c 9d 55 00 48 0f ba 2b 03 e9 55 fa ff ff e8 7d 62 26 00 0f 0b e9 4c fc ff ff e8 71 62 26 00 <0f> 0b 45 31 f6 e9 3d fc ff ff e8 a2 99 55 00 e9 25 fb ff ff e8 58
RSP: 0018:ffffc90000287b38 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88811b42e290 RCX: 0000000000000000
RDX: ffff888110543680 RSI: ffffffff811b65af RDI: 0000000000000003
RBP: ffffc90000287cd0 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff811b5d15 R11: 0000000000000000 R12: dffffc0000000000
R13: 1ffff92000050f9d R14: 0000000000000001 R15: ffff88811b42e2a8
FS:  00007f81838cb740(0000) GS:ffff8881f6900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f894189201d CR3: 000000010d04e000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __cancel_work_timer+0x3f9/0x570 kernel/workqueue.c:3170
 atp_close+0x5e/0xa0 drivers/input/mouse/appletouch.c:812
 input_close_device+0x156/0x1f0 drivers/input/input.c:687
 evdev_close_device drivers/input/evdev.c:414 [inline]
 evdev_release+0x34c/0x410 drivers/input/evdev.c:456
 __fput+0x288/0x9f0 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x215/0x220 kernel/entry/common.c:207
 __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f81839b3fc3
Code: 48 ff ff ff b8 ff ff ff ff e9 3e ff ff ff 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8
RSP: 002b:00007ffe5cb7c8f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 00007ffe5cb7cb68 RCX: 00007f81839b3fc3
RDX: 0000000000000000 RSI: 000000000000001e RDI: 000000000000000a
RBP: 000000000000000a R08: 00007ffe5cb7cb7c R09: 00007ffe5cb7ca68
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe5cb7ca68
R13: 00007ffe5cb7cb68 R14: 0000000000000020 R15: 0000000000000000


Return-Path: <linux-input+bounces-5507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9E394E1C2
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 17:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26C2EB20DFD
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 15:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67C6149C55;
	Sun, 11 Aug 2024 15:16:20 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA1B4503C
	for <linux-input@vger.kernel.org>; Sun, 11 Aug 2024 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723389380; cv=none; b=OoRVjK15nt0vSNHqwMguHrc3ctzlIxKzjkBHAWhUNJqlNPt3dLyMARTOiGRIqQARPWniqAK+f5UYsmrIpr3FAV1M7wXaD1uOvm9kLnd5YN8pEK3fmWGhwsrRmPvHBdsxZZ3+Bbzz3FIlt8iyDousiY9+lxMxoeGJCgBPeU4eO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723389380; c=relaxed/simple;
	bh=PX2Qyk2sj2YaPRE4vAlMIG+yD1O2x+23AfU91/Rmmzc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JuAUeUZXq/itfqLE1bH0KNjXK7QEPmsyEMBuV8vfrc9Mwb1hJ903KHzKXLr8KVbsRsu74tFDXDgRpkaJkSrafGw0Pm/jPrC+XQpPPDZQhNAiFTQ5HSeeEPxLFkWa4c6xnqboakTCPntXrnmFELw2VGcoTjmvBNDzSr1XzCzu1ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-39b3dc8cd61so50120135ab.3
        for <linux-input@vger.kernel.org>; Sun, 11 Aug 2024 08:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723389378; x=1723994178;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GpqsDr7Fcpr/7oyJ3XUVZU4wjeRME0LvNsxEkl7xmII=;
        b=QT2xAE0r/qZbq0SBKaDXZNSdQgTvGWF6Mi6xNkh/grgVzcoj76thcPt61+1ZkMcv9m
         U819CBhqwrAxtgaJ+5n76YSYPaga02oH4zNWt9taHz7QE52FqC2+eq02pso1NKC56hGf
         sLmOMpOPcdOE8NzScGJ0cBEocpl96+kUpnNOJcex3EuerLOCU4te2GwLcLY2vh0Y7gQ8
         xdkdRxL2DsWweZNi/w33FZL0mG3GkGA8C10lkOhljKyhIHKqWC3q5433b9vh6L4q5Z0y
         Y2L6RbV/hG+2Nt/BSvyoLop2Cq4Bod2pTCzbxz8uQNn7F22pLrP15LYTgUx3dwgXpsei
         tueQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ99zE56SGAaN44eOYURkRGJ1CTHUdlZZeYF4wawuUXKm+26IDfvz0mQrUCs//3kPc+b4iWvVRTNnN+I1ynIBzlOrINzpqnAip5SQ=
X-Gm-Message-State: AOJu0YzHZBKQ9fuKkfZluGbmP0CSTlD4T4MPEIZKDXy0fNcdqIDO+F3/
	brs8zqvrRe5VQRJqLYR4dwHWJYvOoalraUmu3E5hMQWUNGpGCYks9+6W817rK0Hzk03sl9WW/kh
	g1cMKlrC2H2Gdyz7FtIZgJswJepIjALMK/zdGTDLJCb3Mb2KCHW9Rn/k=
X-Google-Smtp-Source: AGHT+IHmHGGs5LmOfUwYNaTLMuPRKQUdmKFj6p7TiMr30uCvMxNr/7J2hDeOgjBG80mju7GweKZbi5GIsEczl83tezpx/VIYPVhV
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24a:0:b0:397:ca8e:d377 with SMTP id
 e9e14a558f8ab-39b6c11b447mr6284165ab.0.1723389378217; Sun, 11 Aug 2024
 08:16:18 -0700 (PDT)
Date: Sun, 11 Aug 2024 08:16:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b2d765061f69db06@google.com>
Subject: [syzbot] [input?] possible deadlock in __input_unregister_device
From: syzbot <syzbot+3f4bf5c599ee9b16d704@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    25f51b76f90f xhci-pci: Make xhci-pci-renesas a proper modu..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=11831703980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=10d86428d89226d6
dashboard link: https://syzkaller.appspot.com/bug?extid=3f4bf5c599ee9b16d704
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c1824302a322/disk-25f51b76.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9f387ec15c0a/vmlinux-25f51b76.xz
kernel image: https://storage.googleapis.com/syzbot-assets/58ba53ce9979/bzImage-25f51b76.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3f4bf5c599ee9b16d704@syzkaller.appspotmail.com

UDC core: USB Raw Gadget: couldn't find an available UDC or it's busy
misc raw-gadget: fail, usb_gadget_register_driver returned -16
UDC core: USB Raw Gadget: couldn't find an available UDC or it's busy
misc raw-gadget: fail, usb_gadget_register_driver returned -16
======================================================
WARNING: possible circular locking dependency detected
6.11.0-rc1-syzkaller-00033-g25f51b76f90f #0 Not tainted
------------------------------------------------------
syz.2.38/5056 is trying to acquire lock:
ffff8881177d42c0 (&dev->mutex#2){+.+.}-{3:3}, at: input_disconnect_device drivers/input/input.c:724 [inline]
ffff8881177d42c0 (&dev->mutex#2){+.+.}-{3:3}, at: __input_unregister_device+0x24/0x450 drivers/input/input.c:2273

but task is already holding lock:
ffff8881131b5e20 (&hdev->ll_open_lock){+.+.}-{3:3}, at: hid_hw_open+0x25/0x170 drivers/hid/hid-core.c:2361

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&hdev->ll_open_lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __mutex_lock+0x175/0x9c0 kernel/locking/mutex.c:752
       hid_hw_open+0x25/0x170 drivers/hid/hid-core.c:2361
       input_open_device+0x1c9/0x320 drivers/input/input.c:617
       evdev_open_device drivers/input/evdev.c:391 [inline]
       evdev_open+0x533/0x6a0 drivers/input/evdev.c:478
       chrdev_open+0x26d/0x6f0 fs/char_dev.c:414
       do_dentry_open+0x957/0x1490 fs/open.c:959
       vfs_open+0x82/0x3f0 fs/open.c:1089
       do_open fs/namei.c:3727 [inline]
       path_openat+0x2141/0x2d20 fs/namei.c:3886
       do_filp_open+0x1dc/0x430 fs/namei.c:3913
       do_sys_openat2+0x17a/0x1e0 fs/open.c:1416
       do_sys_open fs/open.c:1431 [inline]
       __do_sys_openat fs/open.c:1447 [inline]
       __se_sys_openat fs/open.c:1442 [inline]
       __x64_sys_openat+0x175/0x210 fs/open.c:1442
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&dev->mutex#2){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3133 [inline]
       check_prevs_add kernel/locking/lockdep.c:3252 [inline]
       validate_chain kernel/locking/lockdep.c:3868 [inline]
       __lock_acquire+0x24ed/0x3cb0 kernel/locking/lockdep.c:5142
       lock_acquire kernel/locking/lockdep.c:5759 [inline]
       lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __mutex_lock+0x175/0x9c0 kernel/locking/mutex.c:752
       input_disconnect_device drivers/input/input.c:724 [inline]
       __input_unregister_device+0x24/0x450 drivers/input/input.c:2273
       input_unregister_device+0xb9/0x100 drivers/input/input.c:2514
       steam_input_unregister+0x10c/0x2c0 drivers/hid/hid-steam.c:917
       steam_client_ll_open+0xc9/0x100 drivers/hid/hid-steam.c:1121
       hid_hw_open+0xe2/0x170 drivers/hid/hid-core.c:2366
       hidraw_open+0x274/0x7e0 drivers/hid/hidraw.c:296
       chrdev_open+0x26d/0x6f0 fs/char_dev.c:414
       do_dentry_open+0x957/0x1490 fs/open.c:959
       vfs_open+0x82/0x3f0 fs/open.c:1089
       do_open fs/namei.c:3727 [inline]
       path_openat+0x2141/0x2d20 fs/namei.c:3886
       do_filp_open+0x1dc/0x430 fs/namei.c:3913
       do_sys_openat2+0x17a/0x1e0 fs/open.c:1416
       do_sys_open fs/open.c:1431 [inline]
       __do_sys_openat fs/open.c:1447 [inline]
       __se_sys_openat fs/open.c:1442 [inline]
       __x64_sys_openat+0x175/0x210 fs/open.c:1442
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&hdev->ll_open_lock);
                               lock(&dev->mutex#2);
                               lock(&hdev->ll_open_lock);
  lock(&dev->mutex#2);

 *** DEADLOCK ***

2 locks held by syz.2.38/5056:
 #0: ffffffff89d34790 (minors_rwsem){+.+.}-{3:3}, at: hidraw_open+0xa6/0x7e0 drivers/hid/hidraw.c:282
 #1: ffff8881131b5e20 (&hdev->ll_open_lock){+.+.}-{3:3}, at: hid_hw_open+0x25/0x170 drivers/hid/hid-core.c:2361

stack backtrace:
CPU: 1 UID: 0 PID: 5056 Comm: syz.2.38 Not tainted 6.11.0-rc1-syzkaller-00033-g25f51b76f90f #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:119
 check_noncircular+0x31a/0x400 kernel/locking/lockdep.c:2186
 check_prev_add kernel/locking/lockdep.c:3133 [inline]
 check_prevs_add kernel/locking/lockdep.c:3252 [inline]
 validate_chain kernel/locking/lockdep.c:3868 [inline]
 __lock_acquire+0x24ed/0x3cb0 kernel/locking/lockdep.c:5142
 lock_acquire kernel/locking/lockdep.c:5759 [inline]
 lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
 __mutex_lock_common kernel/locking/mutex.c:608 [inline]
 __mutex_lock+0x175/0x9c0 kernel/locking/mutex.c:752
 input_disconnect_device drivers/input/input.c:724 [inline]
 __input_unregister_device+0x24/0x450 drivers/input/input.c:2273
 input_unregister_device+0xb9/0x100 drivers/input/input.c:2514
 steam_input_unregister+0x10c/0x2c0 drivers/hid/hid-steam.c:917
 steam_client_ll_open+0xc9/0x100 drivers/hid/hid-steam.c:1121
 hid_hw_open+0xe2/0x170 drivers/hid/hid-core.c:2366
 hidraw_open+0x274/0x7e0 drivers/hid/hidraw.c:296
 chrdev_open+0x26d/0x6f0 fs/char_dev.c:414
 do_dentry_open+0x957/0x1490 fs/open.c:959
 vfs_open+0x82/0x3f0 fs/open.c:1089
 do_open fs/namei.c:3727 [inline]
 path_openat+0x2141/0x2d20 fs/namei.c:3886
 do_filp_open+0x1dc/0x430 fs/namei.c:3913
 do_sys_openat2+0x17a/0x1e0 fs/open.c:1416
 do_sys_open fs/open.c:1431 [inline]
 __do_sys_openat fs/open.c:1447 [inline]
 __se_sys_openat fs/open.c:1442 [inline]
 __x64_sys_openat+0x175/0x210 fs/open.c:1442
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4c34136390
Code: 48 89 44 24 20 75 93 44 89 54 24 0c e8 19 8e 02 00 44 8b 54 24 0c 89 da 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 89 44 24 0c e8 6c 8e 02 00 8b 44
RSP: 002b:00007f4c32db6b70 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 000000000014a042 RCX: 00007f4c34136390
RDX: 000000000014a042 RSI: 00007f4c32db6c10 RDI: 00000000ffffff9c
RBP: 00007f4c32db6c10 R08: 0000000000000000 R09: 0023776172646968
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f4c342c5f80 R15: 00007ffd273fd598
 </TASK>
UDC core: USB Raw Gadget: couldn't find an available UDC or it's busy
misc raw-gadget: fail, usb_gadget_register_driver returned -16
UDC core: USB Raw Gadget: couldn't find an available UDC or it's busy
misc raw-gadget: fail, usb_gadget_register_driver returned -16


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


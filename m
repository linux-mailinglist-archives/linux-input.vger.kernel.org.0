Return-Path: <linux-input+bounces-8891-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EFFA01965
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 13:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77361883135
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 12:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EA113C3F6;
	Sun,  5 Jan 2025 12:40:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB52AD27
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 12:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736080822; cv=none; b=GSze0gU9M2P7nxkOoGvUBk605Vff9WPSORnHZupMjD3+Ck37ayqOHcSmRndDqE8vg1XvMpIyb2w1lXL/fxS2xsDnh/ZieFgUMUDZXl3Yzc1RjLVY9rC0qtH6SBfCxChiFH+5cuQAoxAC0GMRMgle2Np/JGQO/41wMvpcfngJjFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736080822; c=relaxed/simple;
	bh=UzG2HPxEfUqU9cnB7q4bF5uMtyBjsXvIxK7DFi5yC/M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FEHly/jiagyEAlYAUU24XEdqOWTor/NqpGZai+w9xf3LaolOIFO4kMfbWKDJSichglArNkYXhx+lCUOHV9NXjGWYkLP6tr7P9SSwEnpfopr5g5xrwgM3GDw3bzksg3Xlee0Zf8QyeQDuuXvgIoR4hAkjunBy0iL4sAdb+bUS+sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3a814bfb77bso134362935ab.0
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 04:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736080819; x=1736685619;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+SBxe9EO4z1cLIGlM0EXmcsc0sgWyKdlZ4kqLBF+rk0=;
        b=XJYLcR6xLyp86KOq7xmI4Ag7YjKRJvM9E9WfLIZ+l85YYKcNZhJDC1Q7AYxjhcjbzk
         N5gAZa3ZhuAkD5amjkUXJww86DUU13Zh1qZ8ZKSwE54kwCQy4SDWZQVkiL8ThgXwi5WF
         2KcmuasCkfVSbfMjk4p+9ECHCkxwSPNXxOfx6sLBKC1PG+OdtyWhohReIXyM/M+gCr9R
         kmuL5ACUBhR3UFE8k+h7Rew+EsuRt6sZVFHY9JQQOdltkabOP5DskvIcOquL6y68FRpV
         U+EckU7l+Sf8KLgh7DhXIBcr3Oj4PEau23saHdBJ0HB5aahjpecDxBZoEptI3R4Lwnix
         h/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzx3TaOo0deLZP9sBpluBNhSwNewx2fBtXc0JiRnibt9wiQZcJ6ZPJRSuwJjeDrr9DBNsGaMH2FSFnTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWlWXwsfuVWAj32h/+kLWaOJADY4GeFtdOCYH8/3qSmCaQXn2O
	Mm+zkFtXpA47lNbFXN4uYASG+hGmVxKjA3wwENPzHYmlqdTbkXpG+cN9SJ+p8NEOWKmK/7w7mbl
	iIXBeo5x/nKdelmKJsdcKnb28mTz38/HYJW+4uWuTu71bTgwqq9USQJ4=
X-Google-Smtp-Source: AGHT+IEWHVsawQp5BzleadBfS3ilr+IncQsje8KhdWNoE8McbIN5Ky5jxBrZgQ4BiQeOjJqGtMIUwmpvZOtb7dFglsclN7Vh4r1t
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d1a:b0:3a7:e069:95e0 with SMTP id
 e9e14a558f8ab-3c2fe53a7d5mr385778905ab.1.1736080819366; Sun, 05 Jan 2025
 04:40:19 -0800 (PST)
Date: Sun, 05 Jan 2025 04:40:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <677a7db3.050a0220.380ff0.0012.GAE@google.com>
Subject: [syzbot] [input?] possible deadlock in input_ff_flush
From: syzbot <syzbot+ed7c6209f62eba1565aa@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ccb98ccef0e5 Merge tag 'platform-drivers-x86-v6.13-4' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1613fac4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dc863cc90857c683
dashboard link: https://syzkaller.appspot.com/bug?extid=ed7c6209f62eba1565aa
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17bd56df980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-ccb98cce.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1f85617cae1e/vmlinux-ccb98cce.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0dc4d6c6c931/bzImage-ccb98cce.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ed7c6209f62eba1565aa@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.13.0-rc5-syzkaller-00004-gccb98ccef0e5 #0 Not tainted
------------------------------------------------------
udevd/5941 is trying to acquire lock:
ffff8880293600b0 (&ff->mutex){+.+.}-{4:4}, at: input_ff_flush+0x63/0x170 drivers/input/ff-core.c:242

but task is already holding lock:
ffff88804d45b2c0 (&dev->mutex#2){+.+.}-{4:4}, at: input_flush_device+0x4b/0xd0 drivers/input/input.c:647

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&dev->mutex#2){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
       input_register_handle+0xca/0x5e0 drivers/input/input.c:2725
       kbd_connect+0xca/0x160 drivers/tty/vt/keyboard.c:1587
       input_attach_handler.isra.0+0x181/0x260 drivers/input/input.c:1032
       input_register_device+0xa84/0x1110 drivers/input/input.c:2475
       acpi_button_add+0x57a/0xb70 drivers/acpi/button.c:615
       acpi_device_probe+0xc6/0x330 drivers/acpi/bus.c:1076
       call_driver_probe drivers/base/dd.c:579 [inline]
       really_probe+0x23e/0xa90 drivers/base/dd.c:658
       __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
       driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
       __driver_attach+0x283/0x580 drivers/base/dd.c:1216
       bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:370
       bus_add_driver+0x2e9/0x690 drivers/base/bus.c:675
       driver_register+0x15c/0x4b0 drivers/base/driver.c:246
       __acpi_bus_register_driver+0xdf/0x130 drivers/acpi/bus.c:1027
       acpi_button_register_driver drivers/acpi/button.c:745 [inline]
       acpi_button_driver_init+0x82/0x110 drivers/acpi/button.c:754
       do_one_initcall+0x128/0x700 init/main.c:1266
       do_initcall_level init/main.c:1328 [inline]
       do_initcalls init/main.c:1344 [inline]
       do_basic_setup init/main.c:1363 [inline]
       kernel_init_freeable+0x5c7/0x900 init/main.c:1577
       kernel_init+0x1c/0x2b0 init/main.c:1466
       ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #2 (input_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
       input_register_device+0x98a/0x1110 drivers/input/input.c:2468
       uinput_create_device drivers/input/misc/uinput.c:365 [inline]
       uinput_ioctl_handler.isra.0+0x130c/0x1d70 drivers/input/misc/uinput.c:918
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&newdev->mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
       uinput_request_send drivers/input/misc/uinput.c:151 [inline]
       uinput_request_submit.part.0+0x25/0x2e0 drivers/input/misc/uinput.c:182
       uinput_request_submit drivers/input/misc/uinput.c:179 [inline]
       uinput_dev_upload_effect+0x175/0x1f0 drivers/input/misc/uinput.c:257
       input_ff_upload+0x55b/0xbf0 drivers/input/ff-core.c:152
       evdev_do_ioctl+0xf45/0x1ae0 drivers/input/evdev.c:1181
       evdev_ioctl_handler drivers/input/evdev.c:1270 [inline]
       evdev_ioctl+0x16a/0x1a0 drivers/input/evdev.c:1279
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&ff->mutex){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain kernel/locking/lockdep.c:3904 [inline]
       __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5226
       lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5849
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
       input_ff_flush+0x63/0x170 drivers/input/ff-core.c:242
       uinput_dev_flush+0x2a/0x40 drivers/input/misc/uinput.c:283
       input_flush_device+0x97/0xd0 drivers/input/input.c:652
       evdev_release+0x33d/0x400 drivers/input/evdev.c:435
       __fput+0x3f8/0xb60 fs/file_table.c:450
       __fput_sync+0xa1/0xc0 fs/file_table.c:535
       __do_sys_close fs/open.c:1554 [inline]
       __se_sys_close fs/open.c:1539 [inline]
       __x64_sys_close+0x86/0x100 fs/open.c:1539
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &ff->mutex --> input_mutex --> &dev->mutex#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&dev->mutex#2);
                               lock(input_mutex);
                               lock(&dev->mutex#2);
  lock(&ff->mutex);

 *** DEADLOCK ***

2 locks held by udevd/5941:
 #0: ffff888024d58118 (&evdev->mutex){+.+.}-{4:4}, at: evdev_release+0x77/0x400 drivers/input/evdev.c:432
 #1: ffff88804d45b2c0 (&dev->mutex#2){+.+.}-{4:4}, at: input_flush_device+0x4b/0xd0 drivers/input/input.c:647

stack backtrace:
CPU: 2 UID: 0 PID: 5941 Comm: udevd Not tainted 6.13.0-rc5-syzkaller-00004-gccb98ccef0e5 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x419/0x5d0 kernel/locking/lockdep.c:2074
 check_noncircular+0x31a/0x400 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain kernel/locking/lockdep.c:3904 [inline]
 __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5226
 lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5849
 __mutex_lock_common kernel/locking/mutex.c:585 [inline]
 __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
 input_ff_flush+0x63/0x170 drivers/input/ff-core.c:242
 uinput_dev_flush+0x2a/0x40 drivers/input/misc/uinput.c:283
 input_flush_device+0x97/0xd0 drivers/input/input.c:652
 evdev_release+0x33d/0x400 drivers/input/evdev.c:435
 __fput+0x3f8/0xb60 fs/file_table.c:450
 __fput_sync+0xa1/0xc0 fs/file_table.c:535
 __do_sys_close fs/open.c:1554 [inline]
 __se_sys_close fs/open.c:1539 [inline]
 __x64_sys_close+0x86/0x100 fs/open.c:1539
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1d757850a8
Code: 48 8b 05 83 9d 0d 00 64 c7 00 16 00 00 00 83 c8 ff 48 83 c4 20 5b c3 64 8b 04 25 18 00 00 00 85 c0 75 20 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 76 5b 48 8b 15 51 9d 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007fffb61bcef8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007f1d756b10e0 RCX: 00007f1d757850a8
RDX: fffffffffffffe60 RSI: 0000000080184540 RDI: 0000000000000008
RBP: 00005620d7ea5160 R08: 00000000ffffffff R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000016
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


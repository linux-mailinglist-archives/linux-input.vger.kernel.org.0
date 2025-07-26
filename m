Return-Path: <linux-input+bounces-13688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BEEB12BEF
	for <lists+linux-input@lfdr.de>; Sat, 26 Jul 2025 20:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EC5C189FF47
	for <lists+linux-input@lfdr.de>; Sat, 26 Jul 2025 18:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F5E1C4A2D;
	Sat, 26 Jul 2025 18:46:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688186A33B
	for <linux-input@vger.kernel.org>; Sat, 26 Jul 2025 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753555593; cv=none; b=DUP+3tGWObla2sVFc6bgTd3u2f5WfGaf3PnYj5bT2mMnq3bpPXS+9pI0iN3AYJmY8p/SKeDzr4GK+DkudZefLnHXDK36u+Wo8CmHVDxnQ165uEovotXuvK+GHMKOKlaY468du4KElYaFelAo7DIXo30m5Z5zmYOPiCgz8Rnrhvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753555593; c=relaxed/simple;
	bh=C3shIj9FtAJKECCFG6dfofezUox7uKejB85XMMk+xoA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pFWmao/q3RpXGwOlHCptqbE/12tnAAUWJDy3NBgsZaRp7i3iPQVcJTydeuioXt4jIRe2AyH0RslwtP2Fwt/01KIRawO7Pil1h5x653hMOy+5/gbkKluUpmc5UZJ7pzjy/lCy3Ko8+Fay/F7TzkV+T+gdifPv7cslhk4GgJeogOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3e2a16160adso62063215ab.3
        for <linux-input@vger.kernel.org>; Sat, 26 Jul 2025 11:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753555590; x=1754160390;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f89Z9JxgzKObjKxomvhi4ULJBI78/OlZwjUTZvEOxHM=;
        b=jK62lEICuEC5FOFWNUcdkmnQIuuiddjkxuSqvKLzT3pFy+pXAOEngkLGFFuMmmzZ6N
         SPk1RPoJWRSSoeOE3amqUwShZWbc4Z4T8CFSKma6JQSCyn+j04MVzJr20ILLjaOJgdPe
         Xta7Ty1i+kmMu45t5PKNMvLH8ZLJcj0lzRzcjBSxjQ0TPxYUcZMHRqgxmgenI7vCFBmR
         RnKrZEnSydfrbxBeN8Pz/FVAzx1i3ZOTHC8xemzvuwXYlC2i/7TPbMx/XraBaHsP8euS
         LRZ+C3nlQgGXFgQe/M9jY+xUczuGOLTsXYok9Tz6jEbu+vGqmPiZ3ARyKfnGa/On88oH
         pBJA==
X-Forwarded-Encrypted: i=1; AJvYcCXVGbr1F4kZqdWJ2R3APqTTiw65mGRSoKML8KMVgjnG5zAegmqtju7IuPyWKOtindwztJGJNHncGdmC8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGZfR8dIRzKRK82oKrwoWu4KlQyGw/XssGTGmi6yY3NRVOs7a
	njTQv8ZkkvlP4Y1h+CqmAMHQR0nTEP/RTjSTTQOuniBAcoUNppUJomssxKCi+my3825fzA4QWGk
	O0Ed/cVGrXhVZDzwWMRsSPRRStLYm+LfGPEEJ6vndUo6gzo5HUmQMcdVzTBE=
X-Google-Smtp-Source: AGHT+IERBz5/SAXPLK07mywPxTpLkllBt33wEYbVMvhSynylcmv3WbwdFlH3x2ted7+qAex+9u9tREAV6lnI2qWmj1UwmZLsvRnP
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:300a:b0:3dd:be49:9278 with SMTP id
 e9e14a558f8ab-3e3c5110919mr93478265ab.0.1753555590494; Sat, 26 Jul 2025
 11:46:30 -0700 (PDT)
Date: Sat, 26 Jul 2025 11:46:30 -0700
In-Reply-To: <677a7db3.050a0220.380ff0.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68852286.a00a0220.b12ec.0028.GAE@google.com>
Subject: Re: [syzbot] [input?] possible deadlock in input_ff_flush
From: syzbot <syzbot+ed7c6209f62eba1565aa@syzkaller.appspotmail.com>
To: boqun.feng@gmail.com, dmitry.torokhov@gmail.com, hdanton@sina.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	penguin-kernel@i-love.sakura.ne.jp, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    5f33ebd2018c Merge tag 'drm-fixes-2025-07-26' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=130d4034580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9f175a9275d2cdd7
dashboard link: https://syzkaller.appspot.com/bug?extid=ed7c6209f62eba1565aa
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108d4034580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148d4034580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/744f4180f939/disk-5f33ebd2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/473dde4ed605/vmlinux-5f33ebd2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8a27e8b2b834/bzImage-5f33ebd2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ed7c6209f62eba1565aa@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc7-syzkaller-00120-g5f33ebd2018c #0 Not tainted
------------------------------------------------------
udevd/5831 is trying to acquire lock:
ffff8880259b80b0 (&ff->mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:225 [inline]
ffff8880259b80b0 (&ff->mutex){+.+.}-{4:4}, at: input_ff_flush+0x63/0x180 drivers/input/ff-core.c:231

but task is already holding lock:
ffff8880268022c0 (&dev->mutex#2){+.+.}-{4:4}, at: class_mutex_intr_constructor include/linux/mutex.h:227 [inline]
ffff8880268022c0 (&dev->mutex#2){+.+.}-{4:4}, at: input_flush_device+0x55/0x110 drivers/input/input.c:625

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&dev->mutex#2){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
       class_mutex_intr_constructor include/linux/mutex.h:227 [inline]
       input_register_handle+0xdc/0x620 drivers/input/input.c:2653
       kbd_connect+0xca/0x160 drivers/tty/vt/keyboard.c:1580
       input_attach_handler.isra.0+0x184/0x260 drivers/input/input.c:993
       input_register_device+0xa84/0x1130 drivers/input/input.c:2412
       acpi_button_add+0x582/0xb70 drivers/acpi/button.c:621
       acpi_device_probe+0xc6/0x330 drivers/acpi/bus.c:1076
       call_driver_probe drivers/base/dd.c:579 [inline]
       really_probe+0x23e/0xa90 drivers/base/dd.c:657
       __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
       driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
       __driver_attach+0x283/0x580 drivers/base/dd.c:1215
       bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:370
       bus_add_driver+0x2e9/0x690 drivers/base/bus.c:678
       driver_register+0x15c/0x4b0 drivers/base/driver.c:249
       __acpi_bus_register_driver+0xdf/0x130 drivers/acpi/bus.c:1027
       acpi_button_register_driver drivers/acpi/button.c:751 [inline]
       acpi_button_driver_init+0x82/0x110 drivers/acpi/button.c:760
       do_one_initcall+0x120/0x6e0 init/main.c:1274
       do_initcall_level init/main.c:1336 [inline]
       do_initcalls init/main.c:1352 [inline]
       do_basic_setup init/main.c:1371 [inline]
       kernel_init_freeable+0x5c2/0x900 init/main.c:1584
       kernel_init+0x1c/0x2b0 init/main.c:1474
       ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 (input_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
       class_mutex_intr_constructor include/linux/mutex.h:227 [inline]
       input_register_device+0x98a/0x1130 drivers/input/input.c:2408
       uinput_create_device drivers/input/misc/uinput.c:365 [inline]
       uinput_ioctl_handler.isra.0+0x1357/0x1df0 drivers/input/misc/uinput.c:918
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl fs/ioctl.c:893 [inline]
       __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&newdev->mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
       uinput_request_send drivers/input/misc/uinput.c:151 [inline]
       uinput_request_submit.part.0+0x25/0x2e0 drivers/input/misc/uinput.c:182
       uinput_request_submit drivers/input/misc/uinput.c:179 [inline]
       uinput_dev_upload_effect+0x174/0x1f0 drivers/input/misc/uinput.c:257
       input_ff_upload+0x568/0xc10 drivers/input/ff-core.c:148
       evdev_do_ioctl+0xf40/0x1b30 drivers/input/evdev.c:1181
       evdev_ioctl_handler drivers/input/evdev.c:1270 [inline]
       evdev_ioctl+0x16f/0x1a0 drivers/input/evdev.c:1279
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl fs/ioctl.c:893 [inline]
       __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&ff->mutex){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain kernel/locking/lockdep.c:3911 [inline]
       __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5240
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
       class_mutex_constructor include/linux/mutex.h:225 [inline]
       input_ff_flush+0x63/0x180 drivers/input/ff-core.c:231
       uinput_dev_flush+0x2a/0x40 drivers/input/misc/uinput.c:283
       input_flush_device+0xa1/0x110 drivers/input/input.c:627
       evdev_release+0x344/0x420 drivers/input/evdev.c:435
       __fput+0x3ff/0xb70 fs/file_table.c:465
       fput_close_sync+0x118/0x260 fs/file_table.c:570
       __do_sys_close fs/open.c:1589 [inline]
       __se_sys_close fs/open.c:1574 [inline]
       __x64_sys_close+0x8b/0x120 fs/open.c:1574
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
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

2 locks held by udevd/5831:
 #0: ffff888026803118 (&evdev->mutex){+.+.}-{4:4}, at: evdev_release+0x79/0x420 drivers/input/evdev.c:432
 #1: ffff8880268022c0 (&dev->mutex#2){+.+.}-{4:4}, at: class_mutex_intr_constructor include/linux/mutex.h:227 [inline]
 #1: ffff8880268022c0 (&dev->mutex#2){+.+.}-{4:4}, at: input_flush_device+0x55/0x110 drivers/input/input.c:625

stack backtrace:
CPU: 0 UID: 0 PID: 5831 Comm: udevd Not tainted 6.16.0-rc7-syzkaller-00120-g5f33ebd2018c #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x275/0x350 kernel/locking/lockdep.c:2046
 check_noncircular+0x14c/0x170 kernel/locking/lockdep.c:2178
 check_prev_add kernel/locking/lockdep.c:3168 [inline]
 check_prevs_add kernel/locking/lockdep.c:3287 [inline]
 validate_chain kernel/locking/lockdep.c:3911 [inline]
 __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5240
 lock_acquire kernel/locking/lockdep.c:5871 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
 __mutex_lock_common kernel/locking/mutex.c:602 [inline]
 __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
 class_mutex_constructor include/linux/mutex.h:225 [inline]
 input_ff_flush+0x63/0x180 drivers/input/ff-core.c:231
 uinput_dev_flush+0x2a/0x40 drivers/input/misc/uinput.c:283
 input_flush_device+0xa1/0x110 drivers/input/input.c:627
 evdev_release+0x344/0x420 drivers/input/evdev.c:435
 __fput+0x3ff/0xb70 fs/file_table.c:465
 fput_close_sync+0x118/0x260 fs/file_table.c:570
 __do_sys_close fs/open.c:1589 [inline]
 __se_sys_close fs/open.c:1574 [inline]
 __x64_sys_close+0x8b/0x120 fs/open.c:1574
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7c2f2a7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fff6a7623b0 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007f7c2fa12880 RCX: 00007f7c2f2a7407
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000008
RBP: 00007f7c2fa126e8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000016
R13: 00007fff6a7624c0 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


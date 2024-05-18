Return-Path: <linux-input+bounces-3734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 423728C916B
	for <lists+linux-input@lfdr.de>; Sat, 18 May 2024 16:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6599B1C20C0E
	for <lists+linux-input@lfdr.de>; Sat, 18 May 2024 14:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2A33EA72;
	Sat, 18 May 2024 14:18:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF33BBE1
	for <linux-input@vger.kernel.org>; Sat, 18 May 2024 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716041919; cv=none; b=Rq4h03MbAkvImdq9MxHb0ilF3mUCJMx9C0GDUmXhYNq16VQ73I0Yx9+H0GaMyvjxfmEi7Sn52hHd+kODUDZHQmWF9oHBvxU8zcFrpsmP6DBDY0LYNlgizTv0kdzUzTALqscyYEeRcOJD+nI+mtspbj+wvqIpOkyPQwPgMj3prac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716041919; c=relaxed/simple;
	bh=bkOtlhAGwGu5qV1jeigsH45EaGJCKIRA44rktLHO/0E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZT6S/Jtr6806wm7K8KkP51GIaO3ebxhqOa06XEynWs9WcZ1ce/fEWFkH6T8ABL4V79xjisDGnSKV9fgdeR2HcFt7yjeW0Z9YpT5dX0Ca4lv5h9wxhejWWgMWDr7EepOJjOe4MYaxa5qNc/phzGusBloRSa/+XQ8NNbhv6YJOZSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-36c510983e2so69630305ab.0
        for <linux-input@vger.kernel.org>; Sat, 18 May 2024 07:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716041916; x=1716646716;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Td8n7eAsFg5U1JlLsiDY9FO/9R6VpwwWeYUXdaRq1kU=;
        b=ubrfRrdJI/wwVep6oJ79VTYKOhw2Ghvmx1rR6BP3ff+wJdpGGE4rEZ5eOHkFQtxBv1
         VjuqSKXe5X3vpBTON0eFvTJVoQ7PM/q5y9HYdtH3PwUTCB2418baJfKOZlsOUPclcEjw
         QIbfm6nnRpoZlIiVwWLN1O8m5XISh7eZ6XPjGl4cFO3aReSpWSQSAjd2fC4Sz9kzeDa/
         +239MfpfMxJQqAn6X3WesUCmbyH2vHUJfRofvssoqrtCAN4lZWBj6qDI+oEz5yPscUyS
         jY8XcKj+upt54sFcWBVZ9e9y6tlYDStEFqb/VeKnoSCnfM3qTx2jzg5JmjlLM32fG1uU
         gidQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPmKe2hhPEEWIl0kZ7B3cKCwATofZ4sG/Vcu9FsO6p96aDhQ3Tzo5WZeM7OPcFWSQx5r+aCQxkKnf1PwWsu9jtDiYiv0s/Z7+csQY=
X-Gm-Message-State: AOJu0YzSx2i7WNJw/9F4+L8Ir+7xwAbTUf104SjM7fi1Qgw6bMWwnymp
	kpIDrvrhLw4mg3qPK8ZluwqZqrDs+mGbWyUJeUY9yV21JvJTRc4Z/VYTjdfjCx027Z58u/wH5N/
	b5YRWqmxignOs0tHczA0ar1n648nBdGe5fpX3Uxg7pufJ9QFUlPBOXFM=
X-Google-Smtp-Source: AGHT+IEqcBdOsLYXbAyX0XV4aY9pAgMxg2QKn4hAmvYKfRkwpWT6VyomsrjiuKoIpV5IZKepQ/Gj3S3wUdSjF4MCowXo1TkaB68y
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13c3:b0:36d:b197:70c1 with SMTP id
 e9e14a558f8ab-36dd09a5911mr410415ab.0.1716041916750; Sat, 18 May 2024
 07:18:36 -0700 (PDT)
Date: Sat, 18 May 2024 07:18:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000de2ee50618bb2490@google.com>
Subject: [syzbot] [input?] possible deadlock in evdev_cleanup (2)
From: syzbot <syzbot+77a2ec57108df22d5c63@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fda5695d692c Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=14de17c0980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95dc1de8407c7270
dashboard link: https://syzkaller.appspot.com/bug?extid=77a2ec57108df22d5c63
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10298620980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134d3182980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/07f3214ff0d9/disk-fda5695d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/70e2e2c864e8/vmlinux-fda5695d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b259942a16dc/Image-fda5695d.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+77a2ec57108df22d5c63@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.9.0-rc7-syzkaller-gfda5695d692c #0 Not tainted
------------------------------------------------------
syz-executor144/6248 is trying to acquire lock:
ffff0000d6b65110 (&evdev->mutex){+.+.}-{3:3}, at: evdev_mark_dead drivers/input/evdev.c:1314 [inline]
ffff0000d6b65110 (&evdev->mutex){+.+.}-{3:3}, at: evdev_cleanup+0x38/0x16c drivers/input/evdev.c:1323

but task is already holding lock:
ffff800090ffb888 (input_mutex){+.+.}-{3:3}, at: __input_unregister_device+0x2a4/0x5c0 drivers/input/input.c:2219

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (input_mutex){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_interruptible_nested+0x2c/0x38 kernel/locking/mutex.c:826
       input_register_device+0x8dc/0xde8 drivers/input/input.c:2389
       uinput_create_device+0x360/0x528 drivers/input/misc/uinput.c:365
       uinput_ioctl_handler+0x8b0/0x16c0 drivers/input/misc/uinput.c:904
       uinput_ioctl+0x38/0x4c drivers/input/misc/uinput.c:1075
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:904 [inline]
       __se_sys_ioctl fs/ioctl.c:890 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:890
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

-> #2 (&newdev->mutex){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_interruptible_nested+0x2c/0x38 kernel/locking/mutex.c:826
       uinput_request_send drivers/input/misc/uinput.c:151 [inline]
       uinput_request_submit+0x188/0x654 drivers/input/misc/uinput.c:182
       uinput_dev_upload_effect+0x170/0x218 drivers/input/misc/uinput.c:257
       input_ff_upload+0x49c/0x834 drivers/input/ff-core.c:150
       evdev_do_ioctl drivers/input/evdev.c:1183 [inline]
       evdev_ioctl_handler+0x1fd0/0x2d58 drivers/input/evdev.c:1272
       evdev_ioctl+0x38/0x4c drivers/input/evdev.c:1281
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:904 [inline]
       __se_sys_ioctl fs/ioctl.c:890 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:890
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

-> #1 (&ff->mutex){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       input_ff_upload+0x31c/0x834 drivers/input/ff-core.c:120
       evdev_do_ioctl drivers/input/evdev.c:1183 [inline]
       evdev_ioctl_handler+0x1fd0/0x2d58 drivers/input/evdev.c:1272
       evdev_ioctl+0x38/0x4c drivers/input/evdev.c:1281
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:904 [inline]
       __se_sys_ioctl fs/ioctl.c:890 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:890
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

-> #0 (&evdev->mutex){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3134 [inline]
       check_prevs_add kernel/locking/lockdep.c:3253 [inline]
       validate_chain kernel/locking/lockdep.c:3869 [inline]
       __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
       lock_acquire+0x248/0x73c kernel/locking/lockdep.c:5754
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       evdev_mark_dead drivers/input/evdev.c:1314 [inline]
       evdev_cleanup+0x38/0x16c drivers/input/evdev.c:1323
       evdev_disconnect+0x58/0xc0 drivers/input/evdev.c:1407
       __input_unregister_device+0x31c/0x5c0 drivers/input/input.c:2222
       input_unregister_device+0xb0/0xfc drivers/input/input.c:2440
       uinput_destroy_device+0x5a4/0x79c drivers/input/misc/uinput.c:299
       uinput_release+0x44/0x60 drivers/input/misc/uinput.c:744
       __fput+0x30c/0x738 fs/file_table.c:422
       ____fput+0x20/0x30 fs/file_table.c:450
       task_work_run+0x230/0x2e0 kernel/task_work.c:180
       exit_task_work include/linux/task_work.h:38 [inline]
       do_exit+0x4e4/0x1ac8 kernel/exit.c:878
       do_group_exit+0x194/0x22c kernel/exit.c:1027
       __do_sys_exit_group kernel/exit.c:1038 [inline]
       __se_sys_exit_group kernel/exit.c:1036 [inline]
       pid_child_should_wake+0x0/0x1dc kernel/exit.c:1036
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

other info that might help us debug this:

Chain exists of:
  &evdev->mutex --> &newdev->mutex --> input_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(input_mutex);
                               lock(&newdev->mutex);
                               lock(input_mutex);
  lock(&evdev->mutex);

 *** DEADLOCK ***

1 lock held by syz-executor144/6248:
 #0: ffff800090ffb888 (input_mutex){+.+.}-{3:3}, at: __input_unregister_device+0x2a4/0x5c0 drivers/input/input.c:2219

stack backtrace:
CPU: 0 PID: 6248 Comm: syz-executor144 Not tainted 6.9.0-rc7-syzkaller-gfda5695d692c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:317
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:324
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:114
 dump_stack+0x1c/0x28 lib/dump_stack.c:123
 print_circular_bug+0x150/0x1b8 kernel/locking/lockdep.c:2060
 check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2187
 check_prev_add kernel/locking/lockdep.c:3134 [inline]
 check_prevs_add kernel/locking/lockdep.c:3253 [inline]
 validate_chain kernel/locking/lockdep.c:3869 [inline]
 __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
 lock_acquire+0x248/0x73c kernel/locking/lockdep.c:5754
 __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
 __mutex_lock kernel/locking/mutex.c:752 [inline]
 mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
 evdev_mark_dead drivers/input/evdev.c:1314 [inline]
 evdev_cleanup+0x38/0x16c drivers/input/evdev.c:1323
 evdev_disconnect+0x58/0xc0 drivers/input/evdev.c:1407
 __input_unregister_device+0x31c/0x5c0 drivers/input/input.c:2222
 input_unregister_device+0xb0/0xfc drivers/input/input.c:2440
 uinput_destroy_device+0x5a4/0x79c drivers/input/misc/uinput.c:299
 uinput_release+0x44/0x60 drivers/input/misc/uinput.c:744
 __fput+0x30c/0x738 fs/file_table.c:422
 ____fput+0x20/0x30 fs/file_table.c:450
 task_work_run+0x230/0x2e0 kernel/task_work.c:180
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x4e4/0x1ac8 kernel/exit.c:878
 do_group_exit+0x194/0x22c kernel/exit.c:1027
 __do_sys_exit_group kernel/exit.c:1038 [inline]
 __se_sys_exit_group kernel/exit.c:1036 [inline]
 pid_child_should_wake+0x0/0x1dc kernel/exit.c:1036
 __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598


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


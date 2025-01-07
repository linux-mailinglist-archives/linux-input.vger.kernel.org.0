Return-Path: <linux-input+bounces-8991-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75800A03CC4
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 11:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E529218819EB
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 10:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FA91E47BD;
	Tue,  7 Jan 2025 10:45:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail115-118.sinamail.sina.com.cn (mail115-118.sinamail.sina.com.cn [218.30.115.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B79C1E9B1A
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246729; cv=none; b=DOF67y2XktgbrzX3UnVFM4llI4K2RRfj037hOfbEaLvzfciffdqsTF/3oEiKOPFXvhTDVhUnrvhobxuaBlWdK+XJkiKh0sCFiEXaZhjZ3C9SFgQHJnE6+n/Hgu9Lpf20z5Zsd6pSGKJ78h2/pKxa4VwvzVwwcKJLUWG0Sfp2zUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246729; c=relaxed/simple;
	bh=A1Rt3Ie4slTBr+84Eciqv1WwMD9wkt5/o5IFyDD1ocw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XF/mt5/rsa7rG41cESJelTwLJbuWGvUtgMuVqbxCuaneZNoaXl7+7QafyYh7KpI08SDOaiU4BtbgrRNBDyt8TjWKE6wG+PUJEjFRqFrkwZKv1ytA+k4qvapR2RivtjzHqSH0LjmOtWU9cdM4L+BApuuHsC0apRuDAajgzDNvXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.50.47])
	by sina.com (10.185.250.24) with ESMTP
	id 677D05B8000027A1; Tue, 7 Jan 2025 18:45:15 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 22468010748410
X-SMAIL-UIID: 9F14BC1528BB46968F841D4DA8792171-20250107-184515-1
From: Hillf Danton <hdanton@sina.com>
To: dmitry.torokhov@gmail.com,
	Boqun Feng <boqun.feng@gmail.com>
Cc: syzbot <syzbot+ed7c6209f62eba1565aa@syzkaller.appspotmail.com>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] possible deadlock in input_ff_flush
Date: Tue,  7 Jan 2025 18:45:01 +0800
Message-ID: <20250107104504.1486-1-hdanton@sina.com>
In-Reply-To: <677a7db3.050a0220.380ff0.0012.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 05 Jan 2025 04:40:19 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    ccb98ccef0e5 Merge tag 'platform-drivers-x86-v6.13-4' of g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1613fac4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=dc863cc90857c683
> dashboard link: https://syzkaller.appspot.com/bug?extid=ed7c6209f62eba1565aa
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17bd56df980000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-ccb98cce.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/1f85617cae1e/vmlinux-ccb98cce.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/0dc4d6c6c931/bzImage-ccb98cce.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ed7c6209f62eba1565aa@syzkaller.appspotmail.com
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.13.0-rc5-syzkaller-00004-gccb98ccef0e5 #0 Not tainted
> ------------------------------------------------------
> udevd/5941 is trying to acquire lock:
> ffff8880293600b0 (&ff->mutex){+.+.}-{4:4}, at: input_ff_flush+0x63/0x170 drivers/input/ff-core.c:242
> 
> but task is already holding lock:
> ffff88804d45b2c0 (&dev->mutex#2){+.+.}-{4:4}, at: input_flush_device+0x4b/0xd0 drivers/input/input.c:647
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #3 (&dev->mutex#2){+.+.}-{4:4}:
>        __mutex_lock_common kernel/locking/mutex.c:585 [inline]
>        __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
>        input_register_handle+0xca/0x5e0 drivers/input/input.c:2725
>        kbd_connect+0xca/0x160 drivers/tty/vt/keyboard.c:1587
>        input_attach_handler.isra.0+0x181/0x260 drivers/input/input.c:1032
>        input_register_device+0xa84/0x1110 drivers/input/input.c:2475
>        acpi_button_add+0x57a/0xb70 drivers/acpi/button.c:615
>        acpi_device_probe+0xc6/0x330 drivers/acpi/bus.c:1076
>        call_driver_probe drivers/base/dd.c:579 [inline]
>        really_probe+0x23e/0xa90 drivers/base/dd.c:658
>        __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
>        driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
>        __driver_attach+0x283/0x580 drivers/base/dd.c:1216
>        bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:370
>        bus_add_driver+0x2e9/0x690 drivers/base/bus.c:675
>        driver_register+0x15c/0x4b0 drivers/base/driver.c:246
>        __acpi_bus_register_driver+0xdf/0x130 drivers/acpi/bus.c:1027
>        acpi_button_register_driver drivers/acpi/button.c:745 [inline]
>        acpi_button_driver_init+0x82/0x110 drivers/acpi/button.c:754
>        do_one_initcall+0x128/0x700 init/main.c:1266
>        do_initcall_level init/main.c:1328 [inline]
>        do_initcalls init/main.c:1344 [inline]
>        do_basic_setup init/main.c:1363 [inline]
>        kernel_init_freeable+0x5c7/0x900 init/main.c:1577
>        kernel_init+0x1c/0x2b0 init/main.c:1466
>        ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> -> #2 (input_mutex){+.+.}-{4:4}:
>        __mutex_lock_common kernel/locking/mutex.c:585 [inline]
>        __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
>        input_register_device+0x98a/0x1110 drivers/input/input.c:2468
>        uinput_create_device drivers/input/misc/uinput.c:365 [inline]

The upload callback is set [1] before registering the input device.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/misc/uinput.c?id=ccb98ccef0e5#n348

>        uinput_ioctl_handler.isra.0+0x130c/0x1d70 drivers/input/misc/uinput.c:918
>        vfs_ioctl fs/ioctl.c:51 [inline]
>        __do_sys_ioctl fs/ioctl.c:906 [inline]
>        __se_sys_ioctl fs/ioctl.c:892 [inline]
>        __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
>        do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>        do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> -> #1 (&newdev->mutex){+.+.}-{4:4}:
>        __mutex_lock_common kernel/locking/mutex.c:585 [inline]
>        __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
>        uinput_request_send drivers/input/misc/uinput.c:151 [inline]
>        uinput_request_submit.part.0+0x25/0x2e0 drivers/input/misc/uinput.c:182
>        uinput_request_submit drivers/input/misc/uinput.c:179 [inline]
>        uinput_dev_upload_effect+0x175/0x1f0 drivers/input/misc/uinput.c:257
>        input_ff_upload+0x55b/0xbf0 drivers/input/ff-core.c:152

The dependence of #1 on #2 does not exist from the functional POV as
the upload callback can not be invoked before it is inited. So this
report is false positive.

>        evdev_do_ioctl+0xf45/0x1ae0 drivers/input/evdev.c:1181
>        evdev_ioctl_handler drivers/input/evdev.c:1270 [inline]
>        evdev_ioctl+0x16a/0x1a0 drivers/input/evdev.c:1279
>        vfs_ioctl fs/ioctl.c:51 [inline]
>        __do_sys_ioctl fs/ioctl.c:906 [inline]
>        __se_sys_ioctl fs/ioctl.c:892 [inline]
>        __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
>        do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>        do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> -> #0 (&ff->mutex){+.+.}-{4:4}:
>        check_prev_add kernel/locking/lockdep.c:3161 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3280 [inline]
>        validate_chain kernel/locking/lockdep.c:3904 [inline]
>        __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5226
>        lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5849
>        __mutex_lock_common kernel/locking/mutex.c:585 [inline]
>        __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
>        input_ff_flush+0x63/0x170 drivers/input/ff-core.c:242
>        uinput_dev_flush+0x2a/0x40 drivers/input/misc/uinput.c:283
>        input_flush_device+0x97/0xd0 drivers/input/input.c:652
>        evdev_release+0x33d/0x400 drivers/input/evdev.c:435
>        __fput+0x3f8/0xb60 fs/file_table.c:450
>        __fput_sync+0xa1/0xc0 fs/file_table.c:535
>        __do_sys_close fs/open.c:1554 [inline]
>        __se_sys_close fs/open.c:1539 [inline]
>        __x64_sys_close+0x86/0x100 fs/open.c:1539
>        do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>        do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> other info that might help us debug this:
> 
> Chain exists of:
>   &ff->mutex --> input_mutex --> &dev->mutex#2
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(&dev->mutex#2);
>                                lock(input_mutex);
>                                lock(&dev->mutex#2);
>   lock(&ff->mutex);
> 
>  *** DEADLOCK ***
> 
> 2 locks held by udevd/5941:
>  #0: ffff888024d58118 (&evdev->mutex){+.+.}-{4:4}, at: evdev_release+0x77/0x400 drivers/input/evdev.c:432
>  #1: ffff88804d45b2c0 (&dev->mutex#2){+.+.}-{4:4}, at: input_flush_device+0x4b/0xd0 drivers/input/input.c:647
> 
> stack backtrace:
> CPU: 2 UID: 0 PID: 5941 Comm: udevd Not tainted 6.13.0-rc5-syzkaller-00004-gccb98ccef0e5 #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>  print_circular_bug+0x419/0x5d0 kernel/locking/lockdep.c:2074
>  check_noncircular+0x31a/0x400 kernel/locking/lockdep.c:2206
>  check_prev_add kernel/locking/lockdep.c:3161 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3280 [inline]
>  validate_chain kernel/locking/lockdep.c:3904 [inline]
>  __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5226
>  lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5849
>  __mutex_lock_common kernel/locking/mutex.c:585 [inline]
>  __mutex_lock+0x19b/0xa60 kernel/locking/mutex.c:735
>  input_ff_flush+0x63/0x170 drivers/input/ff-core.c:242
>  uinput_dev_flush+0x2a/0x40 drivers/input/misc/uinput.c:283
>  input_flush_device+0x97/0xd0 drivers/input/input.c:652
>  evdev_release+0x33d/0x400 drivers/input/evdev.c:435
>  __fput+0x3f8/0xb60 fs/file_table.c:450
>  __fput_sync+0xa1/0xc0 fs/file_table.c:535
>  __do_sys_close fs/open.c:1554 [inline]
>  __se_sys_close fs/open.c:1539 [inline]
>  __x64_sys_close+0x86/0x100 fs/open.c:1539
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f1d757850a8
> Code: 48 8b 05 83 9d 0d 00 64 c7 00 16 00 00 00 83 c8 ff 48 83 c4 20 5b c3 64 8b 04 25 18 00 00 00 85 c0 75 20 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 76 5b 48 8b 15 51 9d 0d 00 f7 d8 64 89 02 48 83
> RSP: 002b:00007fffb61bcef8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> RAX: ffffffffffffffda RBX: 00007f1d756b10e0 RCX: 00007f1d757850a8
> RDX: fffffffffffffe60 RSI: 0000000080184540 RDI: 0000000000000008
> RBP: 00005620d7ea5160 R08: 00000000ffffffff R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000016
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 


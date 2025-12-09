Return-Path: <linux-input+bounces-16512-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F228ACB0893
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 17:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5DEC300E79E
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 16:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B252BEFE7;
	Tue,  9 Dec 2025 16:19:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC125B311
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 16:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765297165; cv=none; b=mNd8KzeQBCT7+HVV6bqCHTcoRfUOctuTVTKAxwJBI20mKZC+bUE9Md6wsjUBEdbqjzTUAdN311BIvWhgErki/mFTjW8ZDAlthSJPIDWv7LWcCMs3BYlRhH7mULEFgfL5lahSyT7G7wCwkJhvOljyT/rHFYGNTRYaWtI5EqUSPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765297165; c=relaxed/simple;
	bh=8V6XhDTMqJIJKOM6EQ26uuW5sXv+/F7h2RxcyWrBlKQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oC8NCEbO/0XUKH4PNnO+QJrru1C/dm1j8waqNcAx0eP8ziAhHPqw36kc2uUYN3cb18Jn4FKgJgGONyig+Iuk485A3XthZmNt2i9o3R0ysRzLL5lSIZoYwiF7rko6SluoEX+EkVegL9mGbm3P425I61KMmGJc/0q4me2b+lwfL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7c7028db074so11001794a34.1
        for <linux-input@vger.kernel.org>; Tue, 09 Dec 2025 08:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765297162; x=1765901962;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4EUorLPmo37ZI4i7iwcm03RhIF5UkQIooywjmOuWr8=;
        b=CZXJeleG6KriqC8oYd+gKXRKs0DhSG74JrKT5Mnf8zJ0G8JfYho3W0MDhHLDQHIK5a
         XX3awDe4UashnoQ9vwuQJBIXVo+F71tC1g0EHbj/YyAdZHOuJxrMRpf81v1f1MHV2T0K
         bvuHHVXsob3ce2Fzj8bed4NLIM07/+k1XPKlgwx/REaUZZye3cdQrzfa/o8J5K7QtM8C
         QPTCDfWpk14R+7cW3S1yhjzk9RMV5vaRK+88uWiSeu4bS0QpZtqxTtE9CoP+LVMUzgC3
         AJje+1SEAHLA7kA/vTRRtcAHgw3XdgA0EP/0neuc835T5fRzFFOjteg4uMMN396g72f4
         4RRw==
X-Forwarded-Encrypted: i=1; AJvYcCXkfkd+9fejwpH75EcmBB6/BVG519h6xyq/AESyqzAe1ymakXakkePgZBRTr/uh8qPWlnKP67QFCKelhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6BQh9ldvBW4DhbY0jmW0Tc9HE/MJ6jvL/Z2uDlmgBEBGNTKQA
	L7lN6MhfiBay7p73zDQ66JIWlhJfgmd3VeU/q5ist27AiByui6kNiI98U4mTYyGvwhxj2sCfI3L
	ZhSMhvhjas5KG2WCP/0V+G/E5QCPfYnPIpiKsrHZqt+8dXpv/0zN6q8vmyYM=
X-Google-Smtp-Source: AGHT+IF5BOhPb3BDEv1j+XnhBpT29dMMnWJslQB64Cy+rJkZAsRH7Dk6d25l76wZREKzMESIvP0dwWq2jwzPt3Q/jZKx91bES7hV
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ae4:b0:659:9a49:8f0c with SMTP id
 006d021491bc7-6599a8d5bfamr5041982eaf.29.1765297162672; Tue, 09 Dec 2025
 08:19:22 -0800 (PST)
Date: Tue, 09 Dec 2025 08:19:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69384c0a.050a0220.1ff09b.0009.GAE@google.com>
Subject: [syzbot] [input?] possible deadlock in tasklet_action_common
From: syzbot <syzbot+16c5be44e508252dc97a@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c2f2b01b74be Merge tag 'i3c/for-6.19' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d46eb4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8750900a7c493a0b
dashboard link: https://syzkaller.appspot.com/bug?extid=16c5be44e508252dc97a
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ec5bc719b709/disk-c2f2b01b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e6d5ede51c70/vmlinux-c2f2b01b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fcdbd10e4015/bzImage-c2f2b01b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+16c5be44e508252dc97a@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.0.3170/17035 is trying to acquire lock:
ffff8880b8824358 (tasklet_sync_callback.cb_lock){+...}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
ffff8880b8824358 (tasklet_sync_callback.cb_lock){+...}-{3:3}, at: tasklet_lock_callback kernel/softirq.c:864 [inline]
ffff8880b8824358 (tasklet_sync_callback.cb_lock){+...}-{3:3}, at: tasklet_action_common+0x130/0x650 kernel/softirq.c:914

but task is already holding lock:
ffff88805f738270 (&dev->event_lock#2){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
ffff88805f738270 (&dev->event_lock#2){+.+.}-{3:3}, at: class_spinlock_irqsave_constructor include/linux/spinlock.h:585 [inline]
ffff88805f738270 (&dev->event_lock#2){+.+.}-{3:3}, at: input_inject_event+0xa5/0x330 drivers/input/input.c:419

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&dev->event_lock#2){+.+.}-{3:3}:
       rt_spin_lock+0x88/0x3e0 kernel/locking/spinlock_rt.c:56
       spin_lock include/linux/spinlock_rt.h:44 [inline]
       class_spinlock_irqsave_constructor include/linux/spinlock.h:585 [inline]
       input_inject_event+0xa5/0x330 drivers/input/input.c:419
       led_trigger_event+0x13b/0x220 drivers/leds/led-triggers.c:420
       kbd_propagate_led_state drivers/tty/vt/keyboard.c:1065 [inline]
       kbd_bh+0x1ec/0x300 drivers/tty/vt/keyboard.c:1244
       tasklet_action_common+0x36b/0x650 kernel/softirq.c:925
       handle_softirqs+0x226/0x6d0 kernel/softirq.c:622
       __do_softirq kernel/softirq.c:656 [inline]
       run_ktimerd+0xcf/0x190 kernel/softirq.c:1138
       smpboot_thread_fn+0x542/0xa60 kernel/smpboot.c:160
       kthread+0x711/0x8a0 kernel/kthread.c:463
       ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

-> #0 (tasklet_sync_callback.cb_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x15a6/0x2cf0 kernel/locking/lockdep.c:5237
       lock_acquire+0x117/0x340 kernel/locking/lockdep.c:5868
       rt_spin_lock+0x88/0x3e0 kernel/locking/spinlock_rt.c:56
       spin_lock include/linux/spinlock_rt.h:44 [inline]
       tasklet_lock_callback kernel/softirq.c:864 [inline]
       tasklet_action_common+0x130/0x650 kernel/softirq.c:914
       handle_softirqs+0x226/0x6d0 kernel/softirq.c:622
       __do_softirq kernel/softirq.c:656 [inline]
       __local_bh_enable_ip+0x1a0/0x2e0 kernel/softirq.c:302
       local_bh_enable include/linux/bottom_half.h:33 [inline]
       __alloc_skb+0x224/0x430 net/core/skbuff.c:674
       alloc_skb include/linux/skbuff.h:1383 [inline]
       hidp_send_message+0xb5/0x230 net/bluetooth/hidp/core.c:111
       hidp_send_intr_message net/bluetooth/hidp/core.c:143 [inline]
       hidp_input_event+0x290/0x370 net/bluetooth/hidp/core.c:175
       input_event_dispose+0x80/0x6b0 drivers/input/input.c:322
       input_inject_event+0x1d8/0x330 drivers/input/input.c:424
       kbd_led_trigger_activate+0xbc/0x100 drivers/tty/vt/keyboard.c:1021
       led_trigger_set+0x533/0x950 drivers/leds/led-triggers.c:220
       led_match_default_trigger drivers/leds/led-triggers.c:277 [inline]
       led_trigger_set_default+0x266/0x2a0 drivers/leds/led-triggers.c:300
       led_classdev_register_ext+0x73d/0x960 drivers/leds/led-class.c:578
       led_classdev_register include/linux/leds.h:274 [inline]
       input_leds_connect+0x517/0x790 drivers/input/input-leds.c:145
       input_attach_handler drivers/input/input.c:994 [inline]
       input_register_device+0xd00/0x1170 drivers/input/input.c:2378
       hidp_session_dev_add net/bluetooth/hidp/core.c:861 [inline]
       hidp_session_probe+0x1a8/0x8a0 net/bluetooth/hidp/core.c:1116
       l2cap_register_user+0xf4/0x200 net/bluetooth/l2cap_core.c:1712
       hidp_connection_add+0x158b/0x1a20 net/bluetooth/hidp/core.c:1378
       do_hidp_sock_ioctl net/bluetooth/hidp/sock.c:81 [inline]
       hidp_sock_ioctl+0x3a8/0x5c0 net/bluetooth/hidp/sock.c:128
       sock_do_ioctl+0xdc/0x300 net/socket.c:1254
       sock_ioctl+0x579/0x790 net/socket.c:1375
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&dev->event_lock#2);
                               lock(tasklet_sync_callback.cb_lock);
                               lock(&dev->event_lock#2);
  lock(tasklet_sync_callback.cb_lock);

 *** DEADLOCK ***

10 locks held by syz.0.3170/17035:
 #0: ffff8880582340b0 (&hdev->lock){+.+.}-{4:4}, at: l2cap_register_user+0x67/0x200 net/bluetooth/l2cap_core.c:1699
 #1: ffffffff8ea34f80 (hidp_session_sem){++++}-{4:4}, at: hidp_session_probe+0x99/0x8a0 net/bluetooth/hidp/core.c:1106
 #2: ffffffff8e31c658 (input_mutex){+.+.}-{4:4}, at: class_mutex_intr_constructor include/linux/mutex.h:255 [inline]
 #2: ffffffff8e31c658 (input_mutex){+.+.}-{4:4}, at: input_register_device+0xa76/0x1170 drivers/input/input.c:2374
 #3: ffff888059fee860 (&led_cdev->led_access){+.+.}-{4:4}, at: led_classdev_register_ext+0x43d/0x960 drivers/leds/led-class.c:536
 #4: ffffffff8dd08160 (triggers_list_lock){++++}-{4:4}, at: led_trigger_set_default+0x77/0x2a0 drivers/leds/led-triggers.c:297
 #5: ffff888059fee788 (&led_cdev->trigger_lock){+.+.}-{4:4}, at: led_trigger_set_default+0x87/0x2a0 drivers/leds/led-triggers.c:298
 #6: ffff88805f738270 (&dev->event_lock#2){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
 #6: ffff88805f738270 (&dev->event_lock#2){+.+.}-{3:3}, at: class_spinlock_irqsave_constructor include/linux/spinlock.h:585 [inline]
 #6: ffff88805f738270 (&dev->event_lock#2){+.+.}-{3:3}, at: input_inject_event+0xa5/0x330 drivers/input/input.c:419
 #7: ffffffff8d5ae880 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #7: ffffffff8d5ae880 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #7: ffffffff8d5ae880 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kernel/locking/spinlock_rt.c:50 [inline]
 #7: ffffffff8d5ae880 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1c1/0x3e0 kernel/locking/spinlock_rt.c:57
 #8: ffffffff8d5ae880 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #8: ffffffff8d5ae880 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #8: ffffffff8d5ae880 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructor include/linux/rcupdate.h:1195 [inline]
 #8: ffffffff8d5ae880 (rcu_read_lock){....}-{1:3}, at: input_inject_event+0xb1/0x330 drivers/input/input.c:420
 #9: ffffffff8d5ae880 (rcu_read_lock){....}-{1:3}, at: __local_bh_disable_ip+0xa1/0x530 kernel/softirq.c:163

stack backtrace:
CPU: 0 UID: 0 PID: 17035 Comm: syz.0.3170 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2e2/0x300 kernel/locking/lockdep.c:2043
 check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x15a6/0x2cf0 kernel/locking/lockdep.c:5237
 lock_acquire+0x117/0x340 kernel/locking/lockdep.c:5868
 rt_spin_lock+0x88/0x3e0 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:44 [inline]
 tasklet_lock_callback kernel/softirq.c:864 [inline]
 tasklet_action_common+0x130/0x650 kernel/softirq.c:914
 handle_softirqs+0x226/0x6d0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 __local_bh_enable_ip+0x1a0/0x2e0 kernel/softirq.c:302
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 __alloc_skb+0x224/0x430 net/core/skbuff.c:674
 alloc_skb include/linux/skbuff.h:1383 [inline]
 hidp_send_message+0xb5/0x230 net/bluetooth/hidp/core.c:111
 hidp_send_intr_message net/bluetooth/hidp/core.c:143 [inline]
 hidp_input_event+0x290/0x370 net/bluetooth/hidp/core.c:175
 input_event_dispose+0x80/0x6b0 drivers/input/input.c:322
 input_inject_event+0x1d8/0x330 drivers/input/input.c:424
 kbd_led_trigger_activate+0xbc/0x100 drivers/tty/vt/keyboard.c:1021
 led_trigger_set+0x533/0x950 drivers/leds/led-triggers.c:220
 led_match_default_trigger drivers/leds/led-triggers.c:277 [inline]
 led_trigger_set_default+0x266/0x2a0 drivers/leds/led-triggers.c:300
 led_classdev_register_ext+0x73d/0x960 drivers/leds/led-class.c:578
 led_classdev_register include/linux/leds.h:274 [inline]
 input_leds_connect+0x517/0x790 drivers/input/input-leds.c:145
 input_attach_handler drivers/input/input.c:994 [inline]
 input_register_device+0xd00/0x1170 drivers/input/input.c:2378
 hidp_session_dev_add net/bluetooth/hidp/core.c:861 [inline]
 hidp_session_probe+0x1a8/0x8a0 net/bluetooth/hidp/core.c:1116
 l2cap_register_user+0xf4/0x200 net/bluetooth/l2cap_core.c:1712
 hidp_connection_add+0x158b/0x1a20 net/bluetooth/hidp/core.c:1378
 do_hidp_sock_ioctl net/bluetooth/hidp/sock.c:81 [inline]
 hidp_sock_ioctl+0x3a8/0x5c0 net/bluetooth/hidp/sock.c:128
 sock_do_ioctl+0xdc/0x300 net/socket.c:1254
 sock_ioctl+0x579/0x790 net/socket.c:1375
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6b7032f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6b6e554038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f6b70586180 RCX: 00007f6b7032f749
RDX: 0000200000000280 RSI: 00000000400448c8 RDI: 000000000000000a
RBP: 00007f6b703b3f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f6b70586218 R14: 00007f6b70586180 R15: 00007ffdc2f85848
 </TASK>


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


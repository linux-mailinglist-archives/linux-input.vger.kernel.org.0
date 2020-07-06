Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C028215A64
	for <lists+linux-input@lfdr.de>; Mon,  6 Jul 2020 17:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbgGFPMs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 11:12:48 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:39504 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729313AbgGFPMZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 11:12:25 -0400
Received: by mail-io1-f70.google.com with SMTP id r19so23723831iod.6
        for <linux-input@vger.kernel.org>; Mon, 06 Jul 2020 08:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=t5YQZMq4RXwOnISwhUUAYFoOJYk5C4DlwBLzNYjbHzo=;
        b=tpxQ49x/FyndxHK73oWbzqkAfA3U+Rc+RRiMKuzm9end9OsNn1KhekdrJgnZ4PdHKt
         aJHK8Ra6Uo7JxC8e3QT0u0B30TdELJ2A3jWvm8BS0h6gUglpqxO49I2ZSOS1/oU4015s
         nvAKlkh7AiVCsJHIY1lBP/kIgIYWjF9v0yZKJ7BaYi+EQ3WubKcb76r9usauTTufwhHq
         9kBnqhw1zgzRWugD3IJiGQmqHcQbaEyzZENFbWrI34ueS9jjzW/Hzcy6Y7FiVfk9pfZ/
         qibxE5IvnjSuaQWMX3w1Uu415C0Z6Lxa9isSDu9vlHbTn6SODGmfvB7d+rpF1YJ/qbMC
         DXmg==
X-Gm-Message-State: AOAM531ODh6M+nv4a0U78180J8zoBbkac3Rcvjx106ITCq/qcRrW4HrN
        2+Jc0T/rXyOqlKerEwMnE13kjUWaLxYzRUVQ1XJe9tgBk1bt
X-Google-Smtp-Source: ABdhPJw8q1DhEQ4oGid3p2FMGyLo9Ywk/s6zki4JdF8B2cXxXGGdEJzOtldDLdTC1tzZsF4Q/7jMtmlhm5M/TC7EtcK9LAtyy1Ns
MIME-Version: 1.0
X-Received: by 2002:a02:a909:: with SMTP id n9mr48554634jam.70.1594048343420;
 Mon, 06 Jul 2020 08:12:23 -0700 (PDT)
Date:   Mon, 06 Jul 2020 08:12:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000043b51d05a9c74d88@google.com>
Subject: INFO: task hung in __input_unregister_device (3)
From:   syzbot <syzbot+b27403ccf54199409c6e@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    2089c6ed usb: core: kcov: collect coverage from usb comple..
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=171ff671100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b7479d3935864b1b
dashboard link: https://syzkaller.appspot.com/bug?extid=b27403ccf54199409c6e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+b27403ccf54199409c6e@syzkaller.appspotmail.com

INFO: task kworker/0:1:12 blocked for more than 143 seconds.
      Not tainted 5.7.0-rc6-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/0:1     D24248    12      2 0x80004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 context_switch kernel/sched/core.c:3367 [inline]
 __schedule+0x892/0x1d80 kernel/sched/core.c:4083
 lock_downgrade+0x720/0x720 kernel/locking/lockdep.c:4599
 __sched_text_start+0x8/0x8
 __trace_hardirqs_on_caller kernel/locking/lockdep.c:3657 [inline]
 lockdep_hardirqs_on+0x3c7/0x5d0 kernel/locking/lockdep.c:3702
 schedule+0xcd/0x2b0 kernel/sched/core.c:4158
 schedule_preempt_disabled+0xc/0x20 kernel/sched/core.c:4217
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x87c/0x1360 kernel/locking/mutex.c:1103
 input_disconnect_device drivers/input/input.c:733 [inline]
 __input_unregister_device+0x23/0x430 drivers/input/input.c:2086
 mutex_trylock+0x2c0/0x2c0 kernel/locking/mutex.c:126
 mark_held_locks+0x9f/0xe0 kernel/locking/lockdep.c:3628
 __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:168 [inline]
 _raw_spin_unlock_irq+0x1f/0x30 kernel/locking/spinlock.c:199
 __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:168 [inline]
 _raw_spin_unlock_irq+0x1f/0x30 kernel/locking/spinlock.c:199
 __read_once_size include/linux/compiler.h:199 [inline]
 list_empty include/linux/list.h:282 [inline]
 usb_hcd_flush_endpoint+0x15c/0x410 drivers/usb/core/hcd.c:1787
 input_disconnect_device drivers/input/input.c:733 [inline]
 __input_unregister_device+0x23/0x430 drivers/input/input.c:2086
 input_disconnect_device drivers/input/input.c:733 [inline]
 __input_unregister_device+0x23/0x430 drivers/input/input.c:2086
 input_unregister_device+0xb4/0xf0 drivers/input/input.c:2273
 iforce_usb_disconnect+0x5e/0xf0 drivers/input/joystick/iforce/iforce-usb.c:261
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
 __pm_runtime_idle+0xd1/0x310 drivers/base/power/runtime.c:1021
 usb_autoresume_device+0x60/0x60 include/linux/pm_runtime.h:252
 __device_release_driver drivers/base/dd.c:1110 [inline]
 device_release_driver_internal+0x432/0x500 drivers/base/dd.c:1141
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2715
 device_create_with_groups+0x120/0x120 drivers/base/core.c:3308
 usb_remove_ep_devs+0x3e/0x80 drivers/usb/core/endpoint.c:215
 remove_intf_ep_devs+0x13f/0x1d0 drivers/usb/core/message.c:1121
 usb_disable_device+0x23d/0x790 drivers/usb/core/message.c:1245
 usb_disconnect+0x293/0x900 drivers/usb/core/hub.c:2217
 hub_port_connect drivers/usb/core/hub.c:5059 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x1abf/0x43c0 drivers/usb/core/hub.c:5576
 hub_port_debounce+0x350/0x350 drivers/usb/core/hub.c:4441
 __x64_sys_sysinfo+0x30/0x40 kernel/sys.c:2604
 lock_is_held include/linux/lockdep.h:406 [inline]
 rcu_read_lock_sched_held+0x9c/0xd0 kernel/rcu/update.c:121
 rcu_read_lock_bh_held+0xb0/0xb0 kernel/rcu/update.c:333
 __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:168 [inline]
 _raw_spin_unlock_irq+0x1f/0x30 kernel/locking/spinlock.c:199
 process_one_work+0x965/0x1630 kernel/workqueue.c:2268
 lock_release+0x720/0x720 kernel/locking/lockdep.c:4689
 pwq_dec_nr_in_flight+0x310/0x310 kernel/workqueue.c:1198
 rwlock_bug.part.0+0x90/0x90 include/linux/sched.h:1332
 worker_thread+0x96/0xe20 kernel/workqueue.c:2414
 process_one_work+0x1630/0x1630 kernel/workqueue.c:1029
 kthread+0x326/0x430 kernel/kthread.c:268
 kthread_create_on_node+0xf0/0xf0 kernel/kthread.c:405
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351

Showing all locks held in the system:
3 locks held by kworker/0:0/5:
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: __write_once_size include/linux/compiler.h:226 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:855 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:615 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:642 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x844/0x1630 kernel/workqueue.c:2239
 #1: ffff8881da1d7dc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x878/0x1630 kernel/workqueue.c:2243
 #2: ffff8881d4a7e218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
 #2: ffff8881d4a7e218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x43c0 drivers/usb/core/hub.c:5522
6 locks held by kworker/0:1/12:
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: __write_once_size include/linux/compiler.h:226 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:855 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:615 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:642 [inline]
 #0: ffff8881d8d5d938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x844/0x1630 kernel/workqueue.c:2239
 #1: ffff8881da21fdc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x878/0x1630 kernel/workqueue.c:2243
 #2: ffff8881d4aa6218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
 #2: ffff8881d4aa6218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x43c0 drivers/usb/core/hub.c:5522
 #3: ffff8881d8b36218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
 #3: ffff8881d8b36218 (&dev->mutex){....}-{3:3}, at: usb_disconnect+0x91/0x900 drivers/usb/core/hub.c:2208
 #4: ffff8881cb8a11a8 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0x23/0x500 drivers/base/dd.c:1138
 #5: ffff8881c54602c0 (&dev->mutex#2){+.+.}-{3:3}, at: input_disconnect_device drivers/input/input.c:733 [inline]
 #5: ffff8881c54602c0 (&dev->mutex#2){+.+.}-{3:3}, at: __input_unregister_device+0x23/0x430 drivers/input/input.c:2086
1 lock held by khungtaskd/23:
 #0: ffffffff87111260 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x264 kernel/locking/lockdep.c:5754
5 locks held by kworker/0:2/94:
1 lock held by in:imklog/255:
 #0: ffff8881c92f14f0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:826
2 locks held by agetty/268:
 #0: ffff8881d38d8098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:267
 #1: ffffc900009fa2e8 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0x220/0x1b30 drivers/tty/n_tty.c:2156
2 locks held by kworker/0:3/3081:
 #0: ffff8881da028d38 ((wq_completion)events){+.+.}-{0:0}, at: __write_once_size include/linux/compiler.h:226 [inline]
 #0: ffff8881da028d38 ((wq_completion)events){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881da028d38 ((wq_completion)events){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:855 [inline]
 #0: ffff8881da028d38 ((wq_completion)events){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
 #0: ffff8881da028d38 ((wq_completion)events){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:615 [inline]
 #0: ffff8881da028d38 ((wq_completion)events){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:642 [inline]
 #0: ffff8881da028d38 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x844/0x1630 kernel/workqueue.c:2239
 #1: ffff8881ab877dc0 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x878/0x1630 kernel/workqueue.c:2243
3 locks held by kworker/0:5/3089:
6 locks held by kworker/0:6/3227:
6 locks held by kworker/1:8/3371:
2 locks held by systemd-udevd/3514:
 #0: ffff8881abdd9160 (&evdev->mutex){+.+.}-{3:3}, at: evdev_close_device drivers/input/evdev.c:425 [inline]
 #0: ffff8881abdd9160 (&evdev->mutex){+.+.}-{3:3}, at: evdev_release+0xeb/0x1c0 drivers/input/evdev.c:466
 #1: ffff8881c54602c0 (&dev->mutex#2){+.+.}-{3:3}, at: input_close_device+0x42/0x1a0 drivers/input/input.c:674

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 23 Comm: khungtaskd Not tainted 5.7.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 irq_force_complete_move.cold+0x13/0x47 arch/x86/kernel/apic/vector.c:1023
 nmi_cpu_backtrace.cold+0x70/0xb1 lib/nmi_backtrace.c:101
 lapic_can_unplug_cpu.cold+0x3b/0x3b
 nmi_trigger_cpumask_backtrace+0x1db/0x207 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:205 [inline]
 watchdog+0xa99/0xfd0 kernel/hung_task.c:289
 reset_hung_task_detector+0x30/0x30 kernel/hung_task.c:243
 kthread+0x326/0x430 kernel/kthread.c:268
 kthread_create_on_node+0xf0/0xf0 kernel/kthread.c:405
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 4323 Comm: syz-executor.0 Not tainted 5.7.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:arch_local_irq_restore arch/x86/include/asm/irqflags.h:85 [inline]
RIP: 0010:slab_free_hook mm/slub.c:1448 [inline]
RIP: 0010:slab_free_freelist_hook mm/slub.c:1488 [inline]
RIP: 0010:slab_free mm/slub.c:3045 [inline]
RIP: 0010:kmem_cache_free+0x190/0x360 mm/slub.c:3061
Code: 65 48 0f c7 0f 0f 94 c0 84 c0 0f 85 29 ff ff ff eb b7 8b 75 1c 48 89 df e8 4d 66 83 00 e9 03 ff ff ff e8 f3 3b dc ff 41 56 9d <e9> ec fe ff ff 65 8b 05 54 53 98 7e 83 f8 07 0f 87 1e 01 00 00 89
RSP: 0018:ffff8881d1dffd48 EFLAGS: 00000246
RAX: 0000000000000007 RBX: ffff8881ac470000 RCX: 1ffffffff1271044
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8881c6976b7c
RBP: ffff8881da11e000 R08: 0000000000000001 R09: fffffbfff126c8c9
R10: ffffffff89364647 R11: fffffbfff126c8c8 R12: ffffea0006b11c00
R13: ffffffff817142e1 R14: 0000000000000246 R15: 0000000000000000
FS:  0000000001240940(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000043e2a0 CR3: 00000001c6200000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 putname+0xe1/0x120 fs/namei.c:259
 filename_create+0x236/0x4a0 fs/namei.c:3467
 filename_parentat.isra.0+0x400/0x400 fs/namei.c:2401
 strncpy_from_user+0x2ac/0x3e0 lib/strncpy_from_user.c:122
 audit_getname include/linux/audit.h:328 [inline]
 getname_flags fs/namei.c:202 [inline]
 getname_flags+0x275/0x5b0 fs/namei.c:128
 user_path_create fs/namei.c:3502 [inline]
 do_symlinkat+0xe2/0x230 fs/namei.c:3957
 handle_mm_fault+0x3e5/0x8d0 mm/memory.c:4392
 __ia32_sys_unlink+0x50/0x50 fs/namei.c:3918
 trace_hardirqs_off_caller+0x55/0x200 kernel/trace/trace_preemptirq.c:73
 do_syscall_64+0xb6/0x5a0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3
RIP: 0033:0x45c7f7
Code: 0f 1f 00 b8 5c 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 6d b9 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 58 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 4d b9 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffd559ffd28 EFLAGS: 00000206 ORIG_RAX: 0000000000000058
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000000000045c7f7
RDX: 00007ffd559ffdc3 RSI: 00000000004c25b8 RDI: 00007ffd559ffdb0
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000013
R10: 0000000000000075 R11: 0000000000000206 R12: 0000000000000000
R13: 00007ffd559ffd60 R14: 0000000000000000 R15: 00007ffd559ffd70


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

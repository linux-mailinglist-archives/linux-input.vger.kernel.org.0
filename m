Return-Path: <linux-input+bounces-7399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9781599E418
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 12:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBCBE1C21E2F
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 10:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B8F1E766C;
	Tue, 15 Oct 2024 10:32:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287001E5720
	for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988326; cv=none; b=cS/BEE7jP/s/lUUQLM91BcYy4A0phwm/JQad6oBFdcJjYSOfH7T7PjQipK++gdjboiLGsbUMyxgoiiA4hyiKPz2VkcspUiX4Hgca4/whBaDZaENkeCWEbp67+KEBLzp6iaY7b3SSI0Z+iHQL9b2Rke171IvO08z7qb3O3HuOdzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988326; c=relaxed/simple;
	bh=2lQe9X2xoabdmCZGlse3tMg34qB6/Z8EO3oXrnPmQ08=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AeX0jtVJQ6PK1uqM3T5uihja4q/+55aySemBYZsqEZfHkxHor62Bvk2yTd/gvHnzTamw+ItvkXfH64i6rGICg2EqfXAAKiRJmLVqQXihlQVKX5MNkvwjhC3hNVat1rdgJNtCRoFOP9dn/D1AyR9OfAbOsQvgosuEPjD//7Buahg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a3b7d1e8a0so26705705ab.0
        for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 03:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728988323; x=1729593123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yaOya7sDWJ83q10LrY+yPyUy/8odA8rnIxijgPAlPyQ=;
        b=m1po2MSUhWB8U1/nVqgA190qoJRNWTjJiXqvJ3ZdNv86FFfXxlvqn1IOIsvII+cWRh
         BNWhD86POhbLCMj5B8KTpTmtVJ0cQl6+jkLpgyGaO7hElxYY2/olgpbHgB5w14Myo9Mc
         U6r/+I2B7sxaiTVnLArVydBA+uViXA6c05fRQE1LDdvu+6TpXBgnutXlS22n954ayOps
         FrPR3iUuIxgF6rOElBOv6veGZCL5IlgRT33iMSKZCankYEjvb4PWdzsa5RgZfYU0mvOu
         MHH5fOf2a0H9I9dZ1GQ+h3nZB/y59R0ONcwb4oUtpkpYilWCtqhW55ec5pedR8gVlM+1
         F14g==
X-Forwarded-Encrypted: i=1; AJvYcCWziqkS0RTkFznftqoBLm34J4tcclZUzb+ToTjNcKmaQOMoJ03bVQ4wIT3OpLrAhhWEdasVniS4aMQGdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySApcJOLqN3IeOoq1SrfMOPJo/ClKHtnJ+BrAluo5KjYRF7mQy
	f7yOkfpAn7VVHz35HlkVVx4187Ny3t3d9KCflU5DAAxK3uunX6qeBpLckyXfpz4eXGYG3eUbQki
	fvjiwuI021QHA9xffpOA13LYQ389IaPmXEYpCpCyvKikYY9vtd/Pf3Q0=
X-Google-Smtp-Source: AGHT+IGB3H+rxbponVtip7VAe6ojkHBpfHd2prwhQG9FEdLEOg/RzsOEZnSk34Z730G00YRF/RSdj6pgGTNChuItcAbV0eq+Ku4l
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c265:0:b0:3a3:76c3:fcb0 with SMTP id
 e9e14a558f8ab-3a3bce16c4fmr69427685ab.26.1728988323360; Tue, 15 Oct 2024
 03:32:03 -0700 (PDT)
Date: Tue, 15 Oct 2024 03:32:03 -0700
In-Reply-To: <2442e7bd-bf62-4a1e-af45-8b36c088b071@lucifer.local>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670e44a3.050a0220.f16b.000c.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] [mm?] INFO: rcu detected stall in vma_link_file
From: syzbot <syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, liam.howlett@oracle.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: rcu detected stall in do_syscall_64

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 1-...D } 2664 jiffies s: 1445 root: 0x2/.
rcu: blocking rcu_node structures (internal RCU debug):

Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 2532 Comm: acpid Not tainted 6.12.0-rc2-syzkaller-00039-g00c5e66c934c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:io_serial_in+0x87/0xb0 drivers/tty/serial/8250/8250_port.c:407
Code: 79 b5 fe 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1a 66 03 5d 40 89 da ec <5b> 0f b6 c0 5d 41 5c c3 cc cc cc cc e8 f8 f4 0d ff eb a2 e8 81 f5
RSP: 0018:ffffc900001b7f08 EFLAGS: 00000002
RAX: dffffc0000000060 RBX: 00000000000003fd RCX: 0000000000000000
RDX: 00000000000003fd RSI: ffffffff82a065b0 RDI: ffffffff93633660
RBP: ffffffff93633620 R08: 0000000000000001 R09: 000000000000001f
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000020 R14: fffffbfff26c671e R15: dffffc0000000000
FS:  00007fce9143b740(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2ce5ffff CR3: 0000000115abe000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 serial_in drivers/tty/serial/8250/8250.h:137 [inline]
 serial_lsr_in drivers/tty/serial/8250/8250.h:159 [inline]
 wait_for_lsr+0xda/0x180 drivers/tty/serial/8250/8250_port.c:2068
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3315 [inline]
 serial8250_console_write+0xf5a/0x17c0 drivers/tty/serial/8250/8250_port.c:3393
 console_emit_next_record kernel/printk/printk.c:3092 [inline]
 console_flush_all+0x800/0xc60 kernel/printk/printk.c:3180
 __console_flush_and_unlock kernel/printk/printk.c:3239 [inline]
 console_unlock+0xd9/0x210 kernel/printk/printk.c:3279
 vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2407
 vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:68
 _printk+0xc8/0x100 kernel/printk/printk.c:2432
 printk_stack_address arch/x86/kernel/dumpstack.c:72 [inline]
 show_trace_log_lvl+0x1b7/0x3d0 arch/x86/kernel/dumpstack.c:285
 sched_show_task kernel/sched/core.c:7582 [inline]
 sched_show_task+0x3f0/0x5f0 kernel/sched/core.c:7557
 show_state_filter+0xee/0x320 kernel/sched/core.c:7627
 k_spec drivers/tty/vt/keyboard.c:667 [inline]
 k_spec+0xed/0x150 drivers/tty/vt/keyboard.c:656
 kbd_keycode drivers/tty/vt/keyboard.c:1522 [inline]
 kbd_event+0xcbd/0x17a0 drivers/tty/vt/keyboard.c:1541
 input_handler_events_default+0x116/0x1b0 drivers/input/input.c:2549
 input_pass_values+0x777/0x8e0 drivers/input/input.c:126
 input_event_dispose drivers/input/input.c:352 [inline]
 input_handle_event+0xb30/0x14d0 drivers/input/input.c:369
 input_event drivers/input/input.c:398 [inline]
 input_event+0x83/0xa0 drivers/input/input.c:390
 hidinput_hid_event+0xa12/0x2410 drivers/hid/hid-input.c:1719
 hid_process_event+0x4b7/0x5e0 drivers/hid/hid-core.c:1540
 hid_input_array_field+0x535/0x710 drivers/hid/hid-core.c:1652
 hid_process_report drivers/hid/hid-core.c:1694 [inline]
 hid_report_raw_event+0xa02/0x11c0 drivers/hid/hid-core.c:2040
 __hid_input_report.constprop.0+0x341/0x440 drivers/hid/hid-core.c:2110
 hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
 __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x17c3/0x38d0 drivers/usb/gadget/udc/dummy_hcd.c:1988
 __run_hrtimer kernel/time/hrtimer.c:1691 [inline]
 __hrtimer_run_queues+0x20a/0xae0 kernel/time/hrtimer.c:1755
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1772
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0xac/0x110 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1037 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1037
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:do_syscall_x64 arch/x86/entry/common.c:51 [inline]
RIP: 0010:do_syscall_64+0xc0/0x250 arch/x86/entry/common.c:83
Code: c6 bf 15 79 48 8b 50 08 f6 c2 3f 0f 85 3c 01 00 00 90 90 41 81 fc ce 01 00 00 0f 87 43 01 00 00 41 81 fc cf 01 00 00 48 19 c0 <44> 89 e6 48 89 df 21 c6 e8 d3 4b 12 fa 48 89 43 50 90 48 89 df e8
RSP: 0018:ffffc9000182ff28 EFLAGS: 00000297
RAX: ffffffffffffffff RBX: ffffc9000182ff58 RCX: 1ffffffff14ac131
RDX: 0000000000000000 RSI: ffffffff8727f1c0 RDI: ffffffff8746eb40
RBP: ffffc9000182ff48 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8a56428f R11: 0000000000000000 R12: 000000000000000e
R13: 000000000000000e R14: 0000000000000000 R15: 0000000000000000
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fce914b1773
Code: 00 f3 a5 48 8d 74 24 88 48 b9 ff ff ff 7f fe ff ff ff 48 21 c8 48 89 44 24 88 41 ba 08 00 00 00 44 89 c7 b8 0e 00 00 00 0f 05 <45> 31 c0 3d 00 f0 ff ff 76 06 41 89 c0 41 f7 d8 44 89 c0 5a c3 41
RSP: 002b:00007ffc56b7f150 EFLAGS: 00000246 ORIG_RAX: 000000000000000e
RAX: ffffffffffffffda RBX: 0000557975a80906 RCX: 00007fce914b1773
RDX: 0000000000000000 RSI: 0000557975a86480 RDI: 0000000000000000
RBP: 0000000000000007 R08: 0000000000000000 R09: 0000000000000001
R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffc56b7f258
R13: 0000557975a80178 R14: 0000000000000001 R15: 000000000000000a
 </TASK>
 </TASK>

Showing all locks held in the system:
7 locks held by kworker/0:1/9:
 #0: ffff8881066e5948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc9000009fd80 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff8881097a7190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #2: ffff8881097a7190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x4f40 drivers/usb/core/hub.c:5849
 #3: ffff888106ab5190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #3: ffff888106ab5190 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
 #4: ffff88812c375160 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #4: ffff88812c375160 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
 #5: ffff888119b1da20 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #5: ffff888119b1da20 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
 #6: ffffffff89bd6b08 (input_mutex){+.+.}-{3:3}, at: input_register_device+0x98a/0x1110 drivers/input/input.c:2463
2 locks held by kworker/u8:4/54:
 #0: ffff888100089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc90000547d80 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
2 locks held by kworker/u8:5/236:
 #0: ffff888100089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc9000163fd80 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
7 locks held by kworker/0:2/679:
 #0: ffff8881066e5948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc90001c1fd80 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff88810977f190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #2: ffff88810977f190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x4f40 drivers/usb/core/hub.c:5849
 #3: ffff888105a8d190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #3: ffff888105a8d190 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
 #4: ffff88812c377160 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #4: ffff88812c377160 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
 #5: ffff88812bf35a20 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #5: ffff88812bf35a20 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
 #6: ffffffff89bd6b08 (input_mutex){+.+.}-{3:3}, at: input_register_device+0x98a/0x1110 drivers/input/input.c:2463
4 locks held by acpid/2532:
 #0: ffff8881082a5230 (&dev->event_lock){..-.}-{2:2}, at: input_event drivers/input/input.c:397 [inline]
 #0: ffff8881082a5230 (&dev->event_lock){..-.}-{2:2}, at: input_event+0x70/0xa0 drivers/input/input.c:390
 #1: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #1: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: input_pass_values+0x8b/0x8e0 drivers/input/input.c:118
 #2: ffffffff89387a98 (kbd_event_lock){..-.}-{2:2}, at: spin_lock include/linux/spinlock.h:351 [inline]
 #2: ffffffff89387a98 (kbd_event_lock){..-.}-{2:2}, at: kbd_event+0x8a/0x17a0 drivers/tty/vt/keyboard.c:1535
 #3: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #3: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #3: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x7f/0x390 kernel/locking/lockdep.c:6720
2 locks held by getty/2605:
 #0: ffff88810f74d0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000432f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0xfba/0x1480 drivers/tty/n_tty.c:2211
11 locks held by kworker/0:3/6516:
 #0: ffff8881066e5948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc900026cfd80 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff888109797190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #2: ffff888109797190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x4f40 drivers/usb/core/hub.c:5849
 #3: ffff888130c4e190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #3: ffff888130c4e190 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
 #4: ffff88812c376160 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #4: ffff88812c376160 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
 #5: ffff888131021a20 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #5: ffff888131021a20 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
 #6: ffffffff89bd6b08 (input_mutex){+.+.}-{3:3}, at: input_register_device+0x98a/0x1110 drivers/input/input.c:2463
 #7: ffff88811aa2e2f0 (&led_cdev->led_access){+.+.}-{3:3}, at: led_classdev_register_ext+0x51b/0x9e0 drivers/leds/led-class.c:515
 #8: ffffffff892bb7d0 (triggers_list_lock){++++}-{3:3}, at: led_trigger_set_default drivers/leds/led-triggers.c:284 [inline]
 #8: ffffffff892bb7d0 (triggers_list_lock){++++}-{3:3}, at: led_trigger_set_default+0x5c/0x2a0 drivers/leds/led-triggers.c:276
 #9: ffff88811aa2e208 (&led_cdev->trigger_lock){+.+.}-{3:3}, at: led_trigger_set_default drivers/leds/led-triggers.c:285 [inline]
 #9: ffff88811aa2e208 (&led_cdev->trigger_lock){+.+.}-{3:3}, at: led_trigger_set_default+0x70/0x2a0 drivers/leds/led-triggers.c:276
 #10: ffffffff88ec69f8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: exp_funnel_lock+0x282/0x3b0 kernel/rcu/tree_exp.h:297
1 lock held by syz.3.23/8804:
 #0: ffffffff88ec69f8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: exp_funnel_lock+0x1a4/0x3b0 kernel/rcu/tree_exp.h:329
3 locks held by syz-executor/8833:
 #0: ffff888113c743f8 (sb_writers#5){.+.+}-{0:0}, at: filename_create+0x10d/0x530 fs/namei.c:4019
 #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:850 [inline]
 #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: filename_create+0x1c2/0x530 fs/namei.c:4026
 #2: ffff888113c88958 (jbd2_handle){++++}-{0:0}, at: start_this_handle+0xf6c/0x1430 fs/jbd2/transaction.c:448
2 locks held by syz-executor/8851:
 #0: ffff888113c743f8 (sb_writers#5){.+.+}-{0:0}, at: filename_create+0x10d/0x530 fs/namei.c:4019
 #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:850 [inline]
 #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: filename_create+0x1c2/0x530 fs/namei.c:4026
2 locks held by syz-executor/8852:
 #0: ffff888113c743f8 (sb_writers#5){.+.+}-{0:0}, at: filename_create+0x10d/0x530 fs/namei.c:4019
 #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:850 [inline]
 #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: filename_create+0x1c2/0x530 fs/namei.c:4026
1 lock held by modprobe/9577:

=============================================

task:init            state:S stack:22000 pid:1     tgid:1     ppid:0      flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
 do_sigtimedwait+0x42f/0x5c0 kernel/signal.c:3665
 __do_sys_rt_sigtimedwait kernel/signal.c:3709 [inline]
 __se_sys_rt_sigtimedwait kernel/signal.c:3687 [inline]
 __x64_sys_rt_sigtimedwait+0x1ec/0x2e0 kernel/signal.c:3687
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd5ca08a23c
RSP: 002b:00007ffc7f2936d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000080
RAX: ffffffffffffffda RBX: 00007fd5ca2c013c RCX: 00007fd5ca08a23c
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007fd5ca2c54a8
RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000000
R10: 0000000000000008 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc7f293738 R14: 000055ff5f932169 R15: 00007fd5ca2fca80
 </TASK>
task:kthreadd        state:S stack:27024 pid:2     tgid:2     ppid:0      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 kthreadd+0x5ba/0x7d0 kernel/kthread.c:755
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:pool_workqueue_ state:S stack:30464 pid:3     tgid:3     ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 kthread_worker_fn+0x502/0xba0 kernel/kthread.c:851
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-rcu_g state:I stack:30288 pid:4     tgid:4     ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-sync_ state:I stack:30832 pid:5     tgid:5     ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-slub_ state:I stack:30832 pid:6     tgid:6     ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-netns state:I stack:30832 pid:7     tgid:7     ppid:2      flags:0x00004000


Tested on:

commit:         00c5e66c MAINTAINERS: kasan, kcov: add bugzilla links
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
console output: https://syzkaller.appspot.com/x/log.txt?x=127a045f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e56f1fcedfd0b54e
dashboard link: https://syzkaller.appspot.com/bug?extid=ce483fd06e2061f44f5d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.


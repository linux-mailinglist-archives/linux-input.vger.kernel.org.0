Return-Path: <linux-input+bounces-8697-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A069F89AF
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 02:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6831C16189F
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 01:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C20279EA;
	Fri, 20 Dec 2024 01:45:31 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE26D530
	for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 01:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734659131; cv=none; b=H8J6JovR95kykPB8Cp4YqSpDnLnLed3LssB8osky4x8YOwh5+wNpBgZj0Bbw79vZGT/ONyNpr2HJ8hd6u4mEfCMkA7swX46wj9Aq9BxtCKl7yP/pji46DaBtGkChaqt776p/+hpk2uE4+iMxgJ2K1qVUoiePjFfzfb1Hq4eSOMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734659131; c=relaxed/simple;
	bh=zJ0sZtrH0bPsQQVDkWRG3X55dfeS7qd++Y0dpVP/bCQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=THgQB/5pmDuWemXbSQr2bMkVplZweBgOjZFHjafjDLAiiZRcn1pXUGRyABNLH3E2cld9QGbBboXEy1FlPCRDF6I5/NvuUL2Px4WGEbdAglpamgmsPFIVQB8205OKXxazpviYnuqZdWdRzVu8kXz35+POw4lkUGNipNXOGnHFoe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3a817be161bso13362665ab.1
        for <linux-input@vger.kernel.org>; Thu, 19 Dec 2024 17:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734659127; x=1735263927;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZ/0XC04ed2iPkJbuabAJvaJm9kmOMhetWTJctzig3M=;
        b=DEgIhpccZQu4tCAvb7aWQ2xnrVe+SsQqymP0jA70aOv3CQJ4Zv1OKkTZGRXw8L20n7
         AGiCZmtObSAq5ImFq2YTshtPWDMktwrUkRxaUcg2qS1gU7i8eLwcv5WnSUuoxwMKtkLf
         qQyln3mpzQiz6Krn0rcolgLH9ifSBiDH0ZkqhRBFa2vBjgsFRbs0NU0h4D2wNLopE0wD
         R2Cmm67y0uVOb8oitd2qq+WSeEot7rwGdIrnXvLGpQcs0m1i4MPqcJXujikNR49ed0qz
         22c0uAec9nDg4Gg0UYT3gwkGYoaSsHbm8dEo32CsWBgSWMh4NuaFNsYYy+rqwQRHGMYv
         xq9w==
X-Forwarded-Encrypted: i=1; AJvYcCWTAczmBRYQPFCAYn4hiFK/XJwyuPNoxVK0YEY9yB9/1jVRnXODtgo1RjkJqa+5OsOLTKUJjpzM9JbWKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiD0DslkqotdcQl5XpLmGvWyU3JcVxi8/fTW8CBMOYAv/nhL6f
	yHgeZ53EdIfCH0KGsvyPhmcIOfngPwP3y9Ib7Yq92JCd3uEnCp/4Nnpq+olWhq+DJmyW4yrI34/
	sFasSULP11J2P8Iyqvl4dPG7tmtGihIKZg0B4E27UHVb6+HubZmzMOM8=
X-Google-Smtp-Source: AGHT+IEjG/Q6V39Vtr2muXmY9NUa416kVTG16+EX/sS7jfN5nmvGu0QOZI/bHBI3+XSD5fEjRVsz4e3mNSDeBONgNGueu26cE6yL
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e06:b0:3a7:cff5:16d6 with SMTP id
 e9e14a558f8ab-3c2fe4458fbmr7896335ab.3.1734659126823; Thu, 19 Dec 2024
 17:45:26 -0800 (PST)
Date: Thu, 19 Dec 2024 17:45:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6764cc36.050a0220.1bfc9e.0000.GAE@google.com>
Subject: [syzbot] [serial?] [input?] [usb?] WARNING in sched_show_task
From: syzbot <syzbot+275ef87b91325bbb22cb@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2e7aff49b5da Merge branches 'for-next/core' and 'for-next/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10d787e8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=696fb014d05da3a3
dashboard link: https://syzkaller.appspot.com/bug?extid=275ef87b91325bbb22cb
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15737cdf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ca1730580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ef408f67fde3/disk-2e7aff49.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/414ac17a20dc/vmlinux-2e7aff49.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a93415d2a7e7/Image-2e7aff49.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+275ef87b91325bbb22cb@syzkaller.appspotmail.com

 ep_poll+0x17a4/0x1c74 fs/eventpoll.c:2099
------------[ cut here ]------------
WARNING: CPU: 1 PID: 6415 at arch/arm64/kernel/stacktrace.c:223 kunwind_next_frame_record arch/arm64/kernel/stacktrace.c:248 [inline]
WARNING: CPU: 1 PID: 6415 at arch/arm64/kernel/stacktrace.c:223 kunwind_next arch/arm64/kernel/stacktrace.c:278 [inline]
WARNING: CPU: 1 PID: 6415 at arch/arm64/kernel/stacktrace.c:223 do_kunwind arch/arm64/kernel/stacktrace.c:309 [inline]
WARNING: CPU: 1 PID: 6415 at arch/arm64/kernel/stacktrace.c:223 kunwind_stack_walk arch/arm64/kernel/stacktrace.c:380 [inline]
WARNING: CPU: 1 PID: 6415 at arch/arm64/kernel/stacktrace.c:223 dump_backtrace+0x980/0x9b0 arch/arm64/kernel/stacktrace.c:477
Modules linked in:
CPU: 1 UID: 0 PID: 6415 Comm: syz-executor388 Not tainted 6.13.0-rc2-syzkaller-g2e7aff49b5da #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
pstate: 404000c5 (nZcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : kunwind_next_frame_record arch/arm64/kernel/stacktrace.c:248 [inline]
pc : kunwind_next arch/arm64/kernel/stacktrace.c:278 [inline]
pc : do_kunwind arch/arm64/kernel/stacktrace.c:309 [inline]
pc : kunwind_stack_walk arch/arm64/kernel/stacktrace.c:380 [inline]
pc : dump_backtrace+0x980/0x9b0 arch/arm64/kernel/stacktrace.c:477
lr : kunwind_next_frame_record arch/arm64/kernel/stacktrace.c:248 [inline]
lr : kunwind_next arch/arm64/kernel/stacktrace.c:278 [inline]
lr : do_kunwind arch/arm64/kernel/stacktrace.c:309 [inline]
lr : kunwind_stack_walk arch/arm64/kernel/stacktrace.c:380 [inline]
lr : dump_backtrace+0x980/0x9b0 arch/arm64/kernel/stacktrace.c:477
sp : ffff800080016d60
x29: ffff800080016e20 x28: ffff80008f9ac210 x27: ffff800080016d80
x26: ffff8000a3ec8000 x25: 0000000000000000 x24: ffff8000a3ec78ff
x23: ffff8000a3ec7b80 x22: ffff800080016d80 x21: ffff80008b6d7a98
x20: ffff80008b730380 x19: ffff0000d9d69e40 x18: 0000000000000008
x17: 0000000000000000 x16: ffff80008326d65c x15: 0000000000000001
x14: 0000000000000000 x13: 0000000000000002 x12: ffff0000d9cf9e40
x11: 0000000000ff0100 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000d9cf9e40 x7 : 00000000000e0e40 x6 : 00000000000e0e18
x5 : ffff800080016458 x4 : ffff80008fa62228 x3 : ffff80008073b194
x2 : 0000000000000001 x1 : ffff80008f9ac250 x0 : 0000000000000000
Call trace:
 kunwind_next_frame_record arch/arm64/kernel/stacktrace.c:248 [inline] (P)
 kunwind_next arch/arm64/kernel/stacktrace.c:278 [inline] (P)
 do_kunwind arch/arm64/kernel/stacktrace.c:309 [inline] (P)
 kunwind_stack_walk arch/arm64/kernel/stacktrace.c:380 [inline] (P)
 dump_backtrace+0x980/0x9b0 arch/arm64/kernel/stacktrace.c:477 (P)
 kunwind_next_frame_record arch/arm64/kernel/stacktrace.c:248 [inline] (L)
 kunwind_next arch/arm64/kernel/stacktrace.c:278 [inline] (L)
 do_kunwind arch/arm64/kernel/stacktrace.c:309 [inline] (L)
 kunwind_stack_walk arch/arm64/kernel/stacktrace.c:380 [inline] (L)
 dump_backtrace+0x980/0x9b0 arch/arm64/kernel/stacktrace.c:477 (L)
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484
 sched_show_task+0x448/0x598 kernel/sched/core.c:7711
 show_state_filter+0x16c/0x224 kernel/sched/core.c:7756
 show_state include/linux/sched/debug.h:21 [inline]
 fn_show_state+0x18/0x24 drivers/tty/vt/keyboard.c:614
 k_spec+0x124/0x15c drivers/tty/vt/keyboard.c:667
 kbd_keycode drivers/tty/vt/keyboard.c:1522 [inline]
 kbd_event+0x1174/0x1a3c drivers/tty/vt/keyboard.c:1541
 input_handle_events_default+0xcc/0x174 drivers/input/input.c:2646
 input_pass_values+0x284/0x728 drivers/input/input.c:126
 input_event_dispose+0x2f0/0x534 drivers/input/input.c:352
 input_handle_event+0x710/0x9a8 drivers/input/input.c:369
 input_event+0xc0/0xec drivers/input/input.c:398
 hidinput_hid_event+0xfdc/0x17b8 drivers/hid/hid-input.c:1719
 hid_process_event+0x3e0/0x528 drivers/hid/hid-core.c:1546
 hid_input_array_field+0x3c0/0x568 drivers/hid/hid-core.c:1658
 hid_process_report drivers/hid/hid-core.c:1700 [inline]
 hid_report_raw_event+0xbcc/0x1380 drivers/hid/hid-core.c:2046
 __hid_input_report drivers/hid/hid-core.c:2116 [inline]
 hid_input_report+0x39c/0x48c drivers/hid/hid-core.c:2138
 hid_irq_in+0x3ec/0x708 drivers/hid/usbhid/hid-core.c:285
 __usb_hcd_giveback_urb+0x308/0x570 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x108/0x3ac drivers/usb/core/hcd.c:1734
 dummy_timer+0x658/0x3514 drivers/usb/gadget/udc/dummy_hcd.c:1993
 __run_hrtimer kernel/time/hrtimer.c:1739 [inline]
 __hrtimer_run_queues+0x47c/0xca4 kernel/time/hrtimer.c:1803
 hrtimer_run_softirq+0x158/0x21c kernel/time/hrtimer.c:1820
 handle_softirqs+0x320/0xd34 kernel/softirq.c:554
 __do_softirq+0x14/0x20 kernel/softirq.c:588
 ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
 call_on_irq_stack+0x24/0x4c arch/arm64/kernel/entry.S:891
 do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
 invoke_softirq kernel/softirq.c:435 [inline]
 __irq_exit_rcu+0x1d8/0x544 kernel/softirq.c:655
 irq_exit_rcu+0x14/0x84 kernel/softirq.c:671
 __el1_irq arch/arm64/kernel/entry-common.c:561 [inline]
 el1_interrupt+0x38/0x68 arch/arm64/kernel/entry-common.c:575
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:580
 el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
 rcu_lock_acquire+0x0/0x54 include/linux/sched/signal.h:422 (P)
 rcu_read_lock include/linux/rcupdate.h:849 [inline] (L)
 vma_end_read+0x28/0x188 include/linux/mm.h:739 (L)
 do_page_fault+0x450/0x10a8 arch/arm64/mm/fault.c:649
 do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:919
 el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:604
 el0t_64_sync_handler+0xcc/0x108 arch/arm64/kernel/entry-common.c:765
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 269459
hardirqs last  enabled at (269458): [<ffff80008b6a9c9c>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (269458): [<ffff80008b6a9c9c>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
hardirqs last disabled at (269459): [<ffff80008b6a9acc>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:108 [inline]
hardirqs last disabled at (269459): [<ffff80008b6a9acc>] _raw_spin_lock_irqsave+0x2c/0x7c kernel/locking/spinlock.c:162
softirqs last  enabled at (269428): [<ffff80008030d534>] softirq_handle_end kernel/softirq.c:400 [inline]
softirqs last  enabled at (269428): [<ffff80008030d534>] handle_softirqs+0xb44/0xd34 kernel/softirq.c:582
softirqs last disabled at (269455): [<ffff800080020db4>] __do_softirq+0x14/0x20 kernel/softirq.c:588
---[ end trace 0000000000000000 ]---
task:udevd           state:S stack:0     pid:6422  tgid:6422  ppid:6031   flags:0x00000004
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_hrtimeout_range_clock+0x1f4/0x2dc kernel/time/sleep_timeout.c:207
 schedule_hrtimeout_range+0x38/0x4c kernel/time/sleep_timeout.c:263
 ep_poll+0x17a4/0x1c74 fs/eventpoll.c:2099
 do_epoll_wait+0x198/0x208 fs/eventpoll.c:2484
 do_epoll_pwait+0x70/0x18c fs/eventpoll.c:2514
 __do_sys_epoll_pwait fs/eventpoll.c:2527 [inline]
 __se_sys_epoll_pwait fs/eventpoll.c:2521 [inline]
 __arm64_sys_epoll_pwait+0x258/0x2ac fs/eventpoll.c:2521
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
task:udevd           state:S stack:0     pid:6500  tgid:6500  ppid:6031   flags:0x00000004
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_hrtimeout_range_clock+0x1f4/0x2dc kernel/time/sleep_timeout.c:207
 schedule_hrtimeout_range+0x38/0x4c kernel/time/sleep_timeout.c:263
 ep_poll+0x17a4/0x1c74 fs/eventpoll.c:2099
 do_epoll_wait+0x198/0x208 fs/eventpoll.c:2484
 do_epoll_pwait+0x70/0x18c fs/eventpoll.c:2514
 __do_sys_epoll_pwait fs/eventpoll.c:2527 [inline]
 __se_sys_epoll_pwait fs/eventpoll.c:2521 [inline]
 __arm64_sys_epoll_pwait+0x258/0x2ac fs/eventpoll.c:2521
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
task:udevd           state:S stack:0     pid:7037  tgid:7037  ppid:6031   flags:0x00000004
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_hrtimeout_range_clock+0x1f4/0x2dc kernel/time/sleep_timeout.c:207
 schedule_hrtimeout_range+0x38/0x4c kernel/time/sleep_timeout.c:263
 ep_poll+0x17a4/0x1c74 fs/eventpoll.c:2099
 do_epoll_wait+0x198/0x208 fs/eventpoll.c:2484
 do_epoll_pwait+0x70/0x18c fs/eventpoll.c:2514
 __do_sys_epoll_pwait fs/eventpoll.c:2527 [inline]
 __se_sys_epoll_pwait fs/eventpoll.c:2521 [inline]
 __arm64_sys_epoll_pwait+0x258/0x2ac fs/eventpoll.c:2521
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
task:udevd           state:D stack:0     pid:7111  tgid:7111  ppid:6031   flags:0x00000004
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_timeout+0xb4/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common+0x30c/0x468 kernel/sched/completion.c:95
 __wait_for_common kernel/sched/completion.c:116 [inline]
 wait_for_common kernel/sched/completion.c:127 [inline]
 wait_for_completion_state+0x50/0x7c kernel/sched/completion.c:264
 __wait_rcu_gp+0x288/0x2bc kernel/rcu/update.c:443
 synchronize_rcu_normal+0x1a0/0x210 kernel/rcu/tree.c:4029
 synchronize_rcu+0x1f4/0x258 kernel/rcu/tree.c:4107
 evdev_detach_client drivers/input/evdev.c:377 [inline]
 evdev_release+0x1c0/0x2ec drivers/input/evdev.c:440
 __fput+0x1bc/0x75c fs/file_table.c:450
 __fput_sync+0xc8/0x118 fs/file_table.c:535
 __do_sys_close fs/open.c:1554 [inline]
 __se_sys_close fs/open.c:1539 [inline]
 __arm64_sys_close+0x154/0x1e0 fs/open.c:1539
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
task:udevd           state:S stack:0     pid:7112  tgid:7112  ppid:6031   flags:0x00000004
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_hrtimeout_range_clock+0x1f4/0x2dc kernel/time/sleep_timeout.c:207
 schedule_hrtimeout_range+0x38/0x4c kernel/time/sleep_timeout.c:263
 ep_poll+0x17a4/0x1c74 fs/eventpoll.c:2099
 do_epoll_wait+0x198/0x208 fs/eventpoll.c:2484
 do_epoll_pwait+0x70/0x18c fs/eventpoll.c:2514
 __do_sys_epoll_pwait fs/eventpoll.c:2527 [inline]
 __se_sys_epoll_pwait fs/eventpoll.c:2521 [inline]
 __arm64_sys_epoll_pwait+0x258/0x2ac fs/eventpoll.c:2521
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
task:udevd           state:S stack:0     pid:7113  tgid:7113  ppid:6031   flags:0x00000004
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_hrtimeout_range_clock+0x1f4/0x2dc kernel/time/sleep_timeout.c:207
 schedule_hrtimeout_range+0x38/0x4c kernel/time/sleep_timeout.c:263
 ep_poll+0x17a4/0x1c74 fs/eventpoll.c:2099
 do_epoll_wait+0x198/0x208 fs/eventpoll.c:2484
 do_epoll_pwait+0x70/0x18c fs/eventpoll.c:2514
 __do_sys_epoll_pwait fs/eventpoll.c:2527 [inline]
 __se_sys_epoll_pwait fs/eventpoll.c:2521 [inline]
 __arm64_sys_epoll_pwait+0x258/0x2ac fs/eventpoll.c:2521
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
task:kworker/1:3     state:R  running task     stack:0     pid:7912  tgid:7912  ppid:2      flags:0x00000008
Workqueue:  0x0 (events)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/1:4     state:I stack:0     pid:8640  tgid:8640  ppid:2      flags:0x00000008
Workqueue:  0x0 (events)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:syz-executor388 state:S stack:0     pid:9117  tgid:9117  ppid:6410   flags:0x00000004
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_timeout+0xb4/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common+0x30c/0x468 kernel/sched/completion.c:95
 __wait_for_common kernel/sched/completion.c:116 [inline]
 wait_for_common kernel/sched/completion.c:127 [inline]
 wait_for_completion_interruptible+0x48/0x70 kernel/sched/completion.c:216
 raw_process_ep_io+0x4e8/0x9b0 drivers/usb/gadget/legacy/raw_gadget.c:1121
 raw_ioctl_ep_write drivers/usb/gadget/legacy/raw_gadget.c:1152 [inline]
 raw_ioctl+0xb10/0x3310 drivers/usb/gadget/legacy/raw_gadget.c:1324
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __arm64_sys_ioctl+0x14c/0x1cc fs/ioctl.c:892
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
task:syz-executor388 state:R  running task     stack:0     pid:9498  tgid:9498  ppid:6414   flags:0x0000000c
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 0x1ffff000141b0ef8

Showing all locks held in the system:
2 locks held by getty/6174:
 #0: ffff0000d3c1b0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x3c/0x4c drivers/tty/tty_ldsem.c:340
 #1: ffff80009b9ae2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x41c/0x1228 drivers/tty/n_tty.c:2211
5 locks held by syz-executor388/6415:
 #0: ffff0000d133a9b8 (&vma->vm_lock->lock){++++}-{4:4}, at: vma_start_read include/linux/mm.h:716 [inline]
 #0: ffff0000d133a9b8 (&vma->vm_lock->lock){++++}-{4:4}, at: lock_vma_under_rcu+0x2c4/0x638 mm/memory.c:6278
 #1: ffff0000da3fc230 (&dev->event_lock#2){..-.}-{3:3}, at: input_event+0xa8/0xec drivers/input/input.c:397
 #2: ffff80008fb62560 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x10/0x4c include/linux/rcupdate.h:336
 #3: ffff800091326058 (kbd_event_lock){..-.}-{3:3}, at: spin_lock include/linux/spinlock.h:351 [inline]
 #3: ffff800091326058 (kbd_event_lock){..-.}-{3:3}, at: kbd_event+0xb4/0x1a3c drivers/tty/vt/keyboard.c:1535
 #4: ffff80008fb62560 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0xc/0x44 include/linux/rcupdate.h:336

=============================================

task:init            state:S stack:0     pid:1     tgid:1     ppid:0      flags:0x00000004
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_hrtimeout_range_clock+0x1f4/0x2dc kernel/time/sleep_timeout.c:207
 schedule_hrtimeout_range+0x38/0x4c kernel/time/sleep_timeout.c:263
 do_sigtimedwait+0x3b4/0x668 kernel/signal.c:3765
 __do_sys_rt_sigtimedwait kernel/signal.c:3809 [inline]
 __se_sys_rt_sigtimedwait kernel/signal.c:3787 [inline]
 __arm64_sys_rt_sigtimedwait+0x2f8/0x38c kernel/signal.c:3787
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
task:kthreadd        state:S stack:0     pid:2     tgid:2     ppid:0      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 kthreadd+0x314/0x670 kernel/kthread.c:755
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:pool_workqueue_ state:S stack:0     pid:3     tgid:3     ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 kthread_worker_fn+0x3d0/0xb6c kernel/kthread.c:851
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-rcu_g state:I stack:0     pid:4     tgid:4     ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-sync_ state:I stack:0     pid:5     tgid:5     ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-slub_ state:I stack:0     pid:6     tgid:6     ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-netns state:I stack:0     pid:7     tgid:7     ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/0:0     state:I stack:0     pid:8     tgid:8     ppid:2      flags:0x00000008
Workqueue:  0x0 (events)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/0:0H    state:I stack:0     pid:9     tgid:9     ppid:2      flags:0x00000008
Workqueue:  0x0 (events_highpri)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/0:1     state:I stack:0     pid:10    tgid:10    ppid:2      flags:0x00000008
Workqueue:  0x0 (events)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/u8:0    state:I stack:0     pid:11    tgid:11    ppid:2      flags:0x00000008
Workqueue:  0x0 (events_unbound)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-mm_pe state:I stack:0     pid:12    tgid:12    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/u8:1    state:I stack:0     pid:13    tgid:13    ppid:2      flags:0x00000008
Workqueue:  0x0 (events_power_efficient)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:rcu_tasks_kthre state:I stack:0     pid:14    tgid:14    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rcu_tasks_one_gp+0x91c/0xd18 kernel/rcu/tasks.h:610
 rcu_tasks_kthread+0x16c/0x19c kernel/rcu/tasks.h:657
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:rcu_tasks_trace state:I stack:0     pid:15    tgid:15    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rcu_tasks_one_gp+0x91c/0xd18 kernel/rcu/tasks.h:610
 rcu_tasks_kthread+0x16c/0x19c kernel/rcu/tasks.h:657
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:ksoftirqd/0     state:S stack:0     pid:16    tgid:16    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 smpboot_thread_fn+0x51c/0x90c kernel/smpboot.c:160
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:rcu_preempt     state:R  running task     stack:0     pid:17    tgid:17    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_timeout+0x164/0x290 kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x2cc/0x16e8 kernel/rcu/tree.c:2045
 rcu_gp_kthread+0xc0/0x308 kernel/rcu/tree.c:2247
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:rcu_exp_par_gp_ state:S stack:0     pid:18    tgid:18    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 kthread_worker_fn+0x3d0/0xb6c kernel/kthread.c:851
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:rcu_exp_gp_kthr state:S stack:0     pid:19    tgid:19    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 kthread_worker_fn+0x3d0/0xb6c kernel/kthread.c:851
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:migration/0     state:S stack:0     pid:20    tgid:20    ppid:2      flags:0x00000008
Stopper: 0x0 <- 0x0
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 smpboot_thread_fn+0x51c/0x90c kernel/smpboot.c:160
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:cpuhp/0         state:S stack:0     pid:21    tgid:21    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 smpboot_thread_fn+0x51c/0x90c kernel/smpboot.c:160
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:cpuhp/1         state:S stack:0     pid:22    tgid:22    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 smpboot_thread_fn+0x51c/0x90c kernel/smpboot.c:160
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:migration/1     state:S stack:0     pid:23    tgid:23    ppid:2      flags:0x00000008
Stopper: 0x0 <- 0x0
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 smpboot_thread_fn+0x51c/0x90c kernel/smpboot.c:160
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:ksoftirqd/1     state:S stack:0     pid:24    tgid:24    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 smpboot_thread_fn+0x51c/0x90c kernel/smpboot.c:160
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/1:0     state:I stack:0     pid:25    tgid:25    ppid:2      flags:0x00000008
Workqueue:  0x0 (mm_percpu_wq)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/1:0H    state:I stack:0     pid:26    tgid:26    ppid:2      flags:0x00000008
Workqueue:  0x0 (events_highpri)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/1:1     state:I stack:0     pid:27    tgid:27    ppid:2      flags:0x00000008
Workqueue:  0x0 (events)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kdevtmpfs       state:S stack:0     pid:28    tgid:28    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 devtmpfs_work_loop+0xd88/0xda8 drivers/base/devtmpfs.c:408
 get_nid_for_pfn+0x0/0xbc drivers/base/devtmpfs.c:441
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-inet_ state:I stack:0     pid:29    tgid:29    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kauditd         state:S stack:0     pid:30    tgid:30    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 kauditd_thread+0x8dc/0xa00 kernel/audit.c:911
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:khungtaskd      state:S stack:0     pid:31    tgid:31    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_timeout+0x164/0x290 kernel/time/sleep_timeout.c:99
 schedule_timeout_interruptible+0x74/0xac kernel/time/sleep_timeout.c:128
 watchdog+0xa4/0xf44 kernel/hung_task.c:401
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:oom_reaper      state:S stack:0     pid:32    tgid:32    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 oom_reaper+0x128/0xc68 mm/oom_kill.c:644
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-write state:I stack:0     pid:33    tgid:33    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kcompactd0      state:S stack:0     pid:34    tgid:34    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_timeout+0x164/0x290 kernel/time/sleep_timeout.c:99
 kcompactd+0x704/0x1808 mm/compaction.c:3181
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:ksmd            state:S stack:0     pid:35    tgid:35    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 ksm_scan_thread+0x384/0x44c mm/ksm.c:2685
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:khugepaged      state:S stack:0     pid:36    tgid:36    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 khugepaged_wait_work mm/khugepaged.c:2575 [inline]
 khugepaged+0x1524/0x169c mm/khugepaged.c:2587
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-pencr state:I stack:0     pid:37    tgid:37    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/u8:2    state:R  running task     stack:0     pid:38    tgid:38    ppid:2      flags:0x0000000a
Workqueue: events_unbound toggle_allocation_gate
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 rcu_is_watching_curr_cpu include/linux/context_tracking.h:128 [inline]
 rcu_is_watching+0x5c/0x18c kernel/rcu/tree.c:737
 process_one_work+0x7a8/0x15cc kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x97c/0xeec kernel/workqueue.c:3391
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-pdecr state:I stack:0     pid:39    tgid:39    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-kinte state:I stack:0     pid:40    tgid:40    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-kbloc state:I stack:0     pid:41    tgid:41    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/0:1H    state:I stack:0     pid:42    tgid:42    ppid:2      flags:0x00000008
Workqueue:  0x0 (kblockd)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-blkcg state:I stack:0     pid:43    tgid:43    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/u8:3    state:I stack:0     pid:44    tgid:44    ppid:2      flags:0x00000008
Workqueue:  0x0 (events_unbound)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-tpm_d state:I stack:0     pid:45    tgid:45    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-ata_s state:I stack:0     pid:46    tgid:46    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-md    state:I stack:0     pid:47    tgid:47    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-md_bi state:I stack:0     pid:48    tgid:48    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-edac- state:I stack:0     pid:49    tgid:49    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-devfr state:I stack:0     pid:50    tgid:50    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:watchdogd       state:S stack:0     pid:51    tgid:51    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 kthread_worker_fn+0x3d0/0xb6c kernel/kthread.c:851
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-ib-co state:I stack:0     pid:52    tgid:52    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/u9:0    state:I stack:0     pid:53    tgid:53    ppid:2      flags:0x00000008
Workqueue:  0x0 (krxrpcd)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-ib-co state:I stack:0     pid:54    tgid:54    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-ib_mc state:I stack:0     pid:55    tgid:55    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-ib_nl state:I stack:0     pid:56    tgid:56    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-rpcio state:I stack:0     pid:57    tgid:57    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-xprti state:I stack:0     pid:58    tgid:58    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-cfg80 state:I stack:0     pid:59    tgid:59    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kswapd0         state:S stack:0     pid:74    tgid:74    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 kswapd_try_to_sleep mm/vmscan.c:7154 [inline]
 kswapd+0x6a4/0x10e0 mm/vmscan.c:7216
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:ecryptfs-kthrea state:S stack:0     pid:79    tgid:79    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 ecryptfs_threadfn+0x2d4/0x388 fs/ecryptfs/kthread.c:48
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-nfsio state:I stack:0     pid:82    tgid:82    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/1:1H    state:I stack:0     pid:83    tgid:83    ppid:2      flags:0x00000008
Workqueue:  0x0 (kblockd)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-cifsi state:I stack:0     pid:84    tgid:84    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-smb3d state:I stack:0     pid:85    tgid:85    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-cifsf state:I stack:0     pid:86    tgid:86    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-cifso state:I stack:0     pid:87    tgid:87    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-defer state:I stack:0     pid:88    tgid:88    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-serve state:I stack:0     pid:89    tgid:89    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-cfid_ state:I stack:0     pid:90    tgid:90    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-cifs- state:I stack:0     pid:91    tgid:91    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:jfsIO           state:S stack:0     pid:98    tgid:98    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 jfsIOWait+0x104/0x27c fs/jfs/jfs_logmgr.c:2331
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:jfsCommit       state:S stack:0     pid:99    tgid:99    ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 jfs_lazycommit+0x788/0x9a8 fs/jfs/jfs_txnmgr.c:2761
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:jfsCommit       state:S stack:0     pid:100   tgid:100   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 jfs_lazycommit+0x788/0x9a8 fs/jfs/jfs_txnmgr.c:2761
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:jfsSync         state:S stack:0     pid:101   tgid:101   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 jfs_sync+0x4b0/0x678 fs/jfs/jfs_txnmgr.c:2948
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-xfsal state:I stack:0     pid:102   tgid:102   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-xfs_m state:I stack:0     pid:103   tgid:103   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-user_ state:I stack:0     pid:105   tgid:105   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-gfs2_ state:I stack:0     pid:107   tgid:107   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-kthro state:I stack:0     pid:111   tgid:111   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/u8:4    state:I stack:0     pid:252   tgid:252   ppid:2      flags:0x00000008
Workqueue:  0x0 (events_unbound)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-kpcit state:I stack:0     pid:342   tgid:342   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-ipmi- state:I stack:0     pid:381   tgid:381   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:irq/16-ACPI:Ged state:S stack:0     pid:387   tgid:387   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 irq_wait_for_interrupt+0xc0/0x1cc kernel/irq/manage.c:1125
 irq_thread+0x154/0x398 kernel/irq/manage.c:1321
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-acpi_ state:I stack:0     pid:406   tgid:406   ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 rescuer_thread+0xdb0/0xf2c kernel/workqueue.c:3541
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/u8:5    state:I stack:0     pid:672   tgid:672   ppid:2      flags:0x00000008
Workqueue:  0x0 (events_unbound)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/u8:6    state:I stack:0     pid:744   tgid:744   ppid:2      flags:0x00000008
Workqueue:  0x0 (gid-cache-wq)
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 worker_thread+0xbb8/0xeec kernel/workqueue.c:3406
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:hwrng           state:S stack:0     pid:1390  tgid:1390  ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 schedule_timeout+0x164/0x290 kernel/time/sleep_timeout.c:99
 schedule_timeout_interruptible+0x74/0xac kernel/time/sleep_timeout.c:128
 add_hwgenerator_randomness+0xb4/0x190 drivers/char/random.c:968
 hwrng_fillfn+0x210/0x2e4 drivers/char/hw_random/core.c:515
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:card1-crtc0     state:S stack:0     pid:1445  tgid:1445  ppid:2      flags:0x00000008
Call trace:
 __switch_to+0x414/0x788 arch/arm64/kernel/process.c:701 (T)
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1744/0x27f0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xbc/0x238 kernel/sched/core.c:6848
 kthread_worker_fn+0x3d0/0xb6c kernel/kthread.c:851
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
task:kworker/R-nbd0- stat

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


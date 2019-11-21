Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313EA1054CC
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2019 15:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKUOpL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Nov 2019 09:45:11 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:49484 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbfKUOpK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Nov 2019 09:45:10 -0500
Received: by mail-il1-f197.google.com with SMTP id c2so3092811ilj.16
        for <linux-input@vger.kernel.org>; Thu, 21 Nov 2019 06:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=gKVEHAypeETPe8BrGsTwrpNX1ECF4WGPfjBww5LbXIE=;
        b=W7pihc9Hxw0kM30o4Lo3vowihwY4QSYEh02L1vdoJufP2jy8c0OV4/0RQK6wxiSVRC
         68EJZSmQGLKKjK7T5NIojam7XX1DoPlWBtZxBPbtCgSUyMk/reBfQg4+KsUU30Pam86S
         9DcXjytubof7H66Njih8QGnDG14tj/lVMZVltcu8M06/JAmZLqc5xSASBWHX/Bf6sJJJ
         pEwF2KQqTZI4g33Dm5FKt5kiGFT1ttESQP/i2H95tCar2TILQrpSjR56WojPm+PxC7sQ
         kQi9OXrB4GNkddLsnwFSj7LNQJIxx9fVLlcNV3wZzguoB1fEr3y2nl5GGsgsF2SfgVyl
         IN6Q==
X-Gm-Message-State: APjAAAU/n6mVvFqgK15Lk+f7uuRHz1CMJDK7WZAVoSJLDJ5Zl4XIQDun
        nSnx+axB9GkHiFyLKEuxhXTFqCI9QjaCZB0WnYXqv8LWUjuV
X-Google-Smtp-Source: APXvYqxZ3Qw0R6eFPKZCR7qRh2nPXw7qOlHgzU6f4Hf5Qk1q8lnrgvdMAX6Pp1H4q86+9fHJuXYS3a+iyTb3/yjV/hgXlTBd9LeB
MIME-Version: 1.0
X-Received: by 2002:a6b:8e47:: with SMTP id q68mr4633416iod.274.1574347509632;
 Thu, 21 Nov 2019 06:45:09 -0800 (PST)
Date:   Thu, 21 Nov 2019 06:45:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000109c040597dc5843@google.com>
Subject: INFO: rcu detected stall in hub_event
From:   syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    46178223 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=15a05836e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
dashboard link: https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1061395ae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13653d1ce00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com

rcu: INFO: rcu_sched self-detected stall on CPU
rcu: 	0-....: (10499 ticks this GP) idle=8ea/1/0x4000000000000002  
softirq=1810/1810 fqs=5108
	(t=10500 jiffies g=1553 q=595)
NMI backtrace for cpu 0
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.4.0-rc6+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  nmi_cpu_backtrace.cold+0x55/0x96 lib/nmi_backtrace.c:101
  nmi_trigger_cpumask_backtrace+0x1b0/0x1c7 lib/nmi_backtrace.c:62
  trigger_single_cpu_backtrace include/linux/nmi.h:164 [inline]
  rcu_dump_cpu_stacks+0x169/0x1b3 kernel/rcu/tree_stall.h:254
  print_cpu_stall kernel/rcu/tree_stall.h:455 [inline]
  check_cpu_stall kernel/rcu/tree_stall.h:529 [inline]
  rcu_pending kernel/rcu/tree.c:2795 [inline]
  rcu_sched_clock_irq.cold+0x4da/0x936 kernel/rcu/tree.c:2244
  update_process_times+0x25/0x60 kernel/time/timer.c:1726
  tick_sched_handle+0x9b/0x180 kernel/time/tick-sched.c:167
  tick_sched_timer+0x42/0x130 kernel/time/tick-sched.c:1299
  __run_hrtimer kernel/time/hrtimer.c:1514 [inline]
  __hrtimer_run_queues+0x303/0xc60 kernel/time/hrtimer.c:1576
  hrtimer_interrupt+0x2e8/0x730 kernel/time/hrtimer.c:1638
  local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1110 [inline]
  smp_apic_timer_interrupt+0xf5/0x500 arch/x86/kernel/apic/apic.c:1135
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:830
  </IRQ>
RIP: 0010:hid_apply_multiplier drivers/hid/hid-core.c:1058 [inline]
RIP: 0010:hid_setup_resolution_multiplier+0x33b/0x990  
drivers/hid/hid-core.c:1114
Code: e8 2a 96 ed fc 48 8d 7d 04 48 89 f8 48 c1 e8 03 42 0f b6 14 38 48 89  
f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 0c 05 00 00 <44> 8b 6d 04 bf  
02 00 00 00 44 89 ee e8 64 97 ed fc 41 83 fd 02 74
RSP: 0018:ffff8881da226cd8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000000 RCX: ffffffff8450902c
RDX: 0000000000000000 RSI: ffffffff84509036 RDI: ffff8881d4df1204
RBP: ffff8881d4df1200 R08: ffff8881da211800 R09: ffffc900004770cc
R10: fffff5200009241b R11: ffffc900004920db R12: ffff8881c6640000
R13: 0000000000000000 R14: ffff8881d4df1200 R15: dffffc0000000000
  hid_open_report+0x438/0x640 drivers/hid/hid-core.c:1225
  hid_parse include/linux/hid.h:1017 [inline]
  ms_probe+0x12d/0x4d0 drivers/hid/hid-microsoft.c:388
  hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2212
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2202
  hid_add_device drivers/hid/hid-core.c:2368 [inline]
  hid_add_device+0x33c/0x9a0 drivers/hid/hid-core.c:2317
  usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2202
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2202
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2537
  hub_port_connect drivers/usb/core/hub.c:5184 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1df8/0x3800 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

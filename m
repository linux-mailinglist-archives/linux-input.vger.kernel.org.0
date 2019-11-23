Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4AED108053
	for <lists+linux-input@lfdr.de>; Sat, 23 Nov 2019 21:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfKWUUC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Nov 2019 15:20:02 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:50155 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKWUUB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Nov 2019 15:20:01 -0500
Received: by mail-io1-f71.google.com with SMTP id w12so7684968ioa.16
        for <linux-input@vger.kernel.org>; Sat, 23 Nov 2019 12:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=osG33QZeN4LV9kP7q9FKOEugH0q97s8upQrOqh89aLc=;
        b=C5fXD5OseJrdzZIpwNUULL4RVcqCOJ7yqhMA661FaJ1gSJE/q6gO258xEm+UN/J8es
         G9HmYdB5YoCSu5WPdLElrvUeoLaOR+NXLyGSKQx9sdDQqu4KqX5GbJz1DuOuh3YttHgs
         ubze5oPfRI9sqGx93Lrn4kf2DoiKHEMvjiEk0x3zZupwN8kKG0n+2ES3j3BOucpvirQ/
         fLHxJrqjD83ZCT0cyQcLvD8N6lCMUbRiNobn/P7wO6fH49V3NoPboVyqHf0RwxLkyBPL
         LRSk46j4G/r1R9DAvRTtMWvhNjQtra5gLJ6QHBt0jCEawv69NK+u9oFnSJugYu8Ukpgm
         3vdg==
X-Gm-Message-State: APjAAAWG8rNIZLU7jXJF6QkIkF3favldE3mfj2MnR73vd5rWiB52uN2r
        2XaoG0hZakjlFYFS2yLDoAoWaY4uN8x5Jvo2c5187Yh1tTA/
X-Google-Smtp-Source: APXvYqwehGBEnWPwgFU12sFIrWhI3r4TJjpUUJYfOw/oXj97uWvzZ4IchSdl96jDk9N44Not0zNqObARGVQUin8zMPkqhOhd+2hL
MIME-Version: 1.0
X-Received: by 2002:a92:4899:: with SMTP id j25mr23913376ilg.127.1574540401137;
 Sat, 23 Nov 2019 12:20:01 -0800 (PST)
Date:   Sat, 23 Nov 2019 12:20:01 -0800
In-Reply-To: <Pine.LNX.4.44L0.1911221150350.1511-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004b60ec059809412f@google.com>
Subject: Re: INFO: rcu detected stall in hub_event
From:   syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
INFO: rcu detected stall in hub_event

rcu: INFO: rcu_sched self-detected stall on CPU
rcu: 	1-...!: (10494 ticks this GP) idle=5aa/1/0x4000000000000002  
softirq=3913/3913 fqs=1
	(t=10500 jiffies g=2825 q=35)
rcu: RCU grace-period kthread stack dump:
   running task
29704    10      2 0x80004000
Call Trace:
  schedule+0xca/0x250 kernel/sched/core.c:4136
  schedule_timeout+0x440/0xb20 kernel/time/timer.c:1895
  rcu_gp_fqs_loop kernel/rcu/tree.c:1639 [inline]
  rcu_gp_kthread+0xaff/0x29e0 kernel/rcu/tree.c:1799
  kthread+0x318/0x420 kernel/kthread.c:255
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
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
Code: 00 83 fb ff 75 d6 e9 db fc ff ff e8 9d 7b 15 00 e8 68 a8 1a 00 41 56  
9d e9 b1 fd ff ff e8 8b 7b 15 00 e8 56 a8 1a 00 41 56 9d <e9> 2a ff ff ff  
0f 1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
RSP: 0018:ffff8881d932e908 EFLAGS: 00000293 ORIG_RAX: ffffffffffffff13
RDX: 0000000000000000 RSI: ffff8881da24e918 RDI: ffff8881da24e84c
R10: fffffbfff11aadad R11: ffffffff88d56d6f R12: 0000000000000045
R13: ffff8881da211800 R14: 0000000000000293 R15: 0000000000000000
  dev_vprintk_emit+0x4fc/0x541 drivers/base/core.c:3315
  dev_printk_emit+0xba/0xf1 drivers/base/core.c:3326
  __dev_printk+0x1db/0x203 drivers/base/core.c:3338
  _dev_info+0xd7/0x109 drivers/base/core.c:3384
  hid_parse include/linux/hid.h:1017 [inline]
  ms_probe+0x12d/0x4d0 drivers/hid/hid-microsoft.c:388
  hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2225
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  device_add+0xae6/0x16f0 drivers/base/core.c:2202
  hid_add_device drivers/hid/hid-core.c:2381 [inline]
  hid_add_device+0x33c/0x9a0 drivers/hid/hid-core.c:2330
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
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


Tested on:

commit:         46178223 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12ee73cee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
dashboard link: https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14d21c22e00000

